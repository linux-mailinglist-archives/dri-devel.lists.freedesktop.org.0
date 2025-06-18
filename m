Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD1ADE314
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 07:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFCB10E2D3;
	Wed, 18 Jun 2025 05:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gh+aWsKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEE810E35E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 05:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750224989; x=1781760989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m88kqVNqnnDUVjj5Atyst3lKGSUQZUmWCqaEkDepKE8=;
 b=gh+aWsKrV+VJwl1vCbaLnGpW0CuE4mPCHZU0hHNkV+tpGjDHCQUTGjbO
 Y/8CrsDr1jpPDlP0xZIgRXmzToD9AIKPxDOMRBTfCX4W0i38w6pRbN7q8
 0AEAb/4RXV3QFhgUAamkPJzWNXjECQ5cKgjLH9DJnfyKBRRZz0GoFNgju
 slcpDTqUy/+H0IzZFI0lWohOPv6XEsNKezR0JXaLBCeUxWfhKecZ0JhLQ
 bJwjxNQlwVGXrCZJcTbutY/JFHqmhXxqDobkulkTiEiiSaFTbVNGO5IHm
 YycdxPaehVDZXUSu1/3GXysyidlH6q6OYIbkzu4bQ2ZW2n2lDoLI0EORZ g==;
X-CSE-ConnectionGUID: SPCiD/9VQUGEigsk6o4g6A==
X-CSE-MsgGUID: C+MxzlVlRg6kXKEFrVLyQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="74960304"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="74960304"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 22:36:29 -0700
X-CSE-ConnectionGUID: 9a50KhduROytwV1Bgs2gfA==
X-CSE-MsgGUID: MAcqMJLQTcKDhgCVTIlClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149052928"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 22:36:27 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 0/3] mm/memfd: Reserve hugetlb folios before allocation
Date: Tue, 17 Jun 2025 22:30:52 -0700
Message-ID: <20250618053415.1036185-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are cases when we try to pin a folio but discover that it has
not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
but the allocation request may not succeed if there are no active
reservations in the system at that instant.

Therefore, making a reservation (by calling hugetlb_reserve_pages())
associated with the allocation will ensure that our request would
not fail due to lack of reservations. This will also ensure that
proper region/subpool accounting is done with our allocation.

-----------------------------

Patchset overview:

Patch 1: Return nr of updated entries from hugetlb_reserve_pages()
Patch 2: Make reservation (hugetlb_reserve_pages) in memfd_alloc_folio()
Patch 3: New udmabuf selftest to invoke memfd_alloc_folio()

This series is tested by running the new udmabuf selftest introduced
in patch #3 along with the other selftests.

Changelog:
v3 -> v4:
- Create a standalone patch to fix the BUG reported by syzbot that
  can be backported to stable kernels (Andrew)
- Split the changes in memfd_alloc_folio() that add a call to
  hugetlb_reserve_pages() into a separate patch

v2 -> v3:
- Call hugetlb_unreserve_pages() only if the reservation was actively
  (and successfully) made from memfd_alloc_folio() (David)

v1 -> v2:
- Replace VM_BUG_ON() with WARN_ON_ONCE() in the function
  alloc_hugetlb_folio_reserve() (David)
- Move the inline function subpool_inode() from hugetlb.c into the
  relevant header (hugetlb.h)
- Call hugetlb_unreserve_pages() if the folio cannot be added to
  the page cache as well
- Added a new udmabuf selftest to exercise the same path as that
  of syzbot

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Steve Sistare <steven.sistare@oracle.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>

Vivek Kasireddy (3):
  mm/hugetlb: Make hugetlb_reserve_pages() return nr of entries updated
  mm/memfd: Reserve hugetlb folios before allocation
  selftests/udmabuf: Add a test to pin first before writing to memfd

 fs/hugetlbfs/inode.c                          |  8 +++----
 include/linux/hugetlb.h                       |  7 +++++-
 mm/hugetlb.c                                  | 24 ++++++++++---------
 mm/memfd.c                                    | 17 ++++++++++---
 .../selftests/drivers/dma-buf/udmabuf.c       | 20 +++++++++++++++-
 5 files changed, 56 insertions(+), 20 deletions(-)

-- 
2.49.0

