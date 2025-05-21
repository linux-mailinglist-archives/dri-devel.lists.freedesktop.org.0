Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EEBABEB3E
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 07:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30B110E5F7;
	Wed, 21 May 2025 05:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDtku3ao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DB310E5F0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 05:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747805005; x=1779341005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5D4JFwFWlsVSItofs+vUC95lY3B/S1pTOTOoHAxgPXI=;
 b=DDtku3ao93ImXuTL3+q0KbHmwYEAdXjQmLjFU3HS7d+npcMg5H2Utbpo
 lkhlpcfT25kerjW0BpJ0C4ayGK9tazxkLYbM/f/PVD0LAl5nl7uGvgY6r
 kVoKr65U/3N9KJAGKiX/v8Gu5P8QXhbQbyptOZqxnNnLwBUiOH1Oz0vTY
 WRyFlEoj7PkDS2Yt+18vuSqPNVswLidY91MT9XkLTU9JKFldYZWW7BSNi
 0Rhf/kWB/CovqGLa2SeaKzX8jAC0m/zbtNq+xg2M0+S0ArcC1EzQaOf10
 5/wvWsPY46CH90VjjyxXYuOOM3FdnruyTHDI7s8P/iRSTczrHaY9o383p w==;
X-CSE-ConnectionGUID: qE0bPxV7TFWEzkhOzJgrCg==
X-CSE-MsgGUID: Nt/+ppUjRrWt42drgSdUGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49638987"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49638987"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:23:24 -0700
X-CSE-ConnectionGUID: W1aGyqDzRBaCz8WzOF+5xQ==
X-CSE-MsgGUID: yor5D6xMTuCBwDI4bLWJtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="163188660"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:23:23 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 0/3] mm/memfd: Reserve hugetlb folios before allocation
Date: Tue, 20 May 2025 22:19:34 -0700
Message-ID: <20250521052119.1105530-1-vivek.kasireddy@intel.com>
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

There are cases where we try to pin a folio but discover that it has
not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
but there is a chance that we might encounter a crash/failure
(VM_BUG_ON(!h->resv_huge_pages)) if there are no active reservations
at that instant. This issue was reported by syzbot.

Therefore, to avoid this situation and fix this issue, we just need
to make a reservation (by calling hugetlb_reserve_pages()) before
we try to allocate the folio. This will ensure that we are properly
doing region/subpool accounting associated with our allocation.

-----------------------------

Patchset overview:

Patch 1: Return nr of updated entries from hugetlb_reserve_pages()
Patch 2: Fix for VM_BUG_ON(!h->resv_huge_pages) crash reported by syzbot
Patch 3: New udmabuf selftest to invoke memfd_alloc_folio()

This series is tested by running the new udmabuf selftest introduced
in patch #3 along with the other selftests.

Changelog:
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

 fs/hugetlbfs/inode.c                          |  8 ++---
 include/linux/hugetlb.h                       |  7 +++-
 mm/hugetlb.c                                  | 33 +++++++++++--------
 mm/memfd.c                                    | 17 ++++++++--
 .../selftests/drivers/dma-buf/udmabuf.c       | 20 ++++++++++-
 5 files changed, 62 insertions(+), 23 deletions(-)

-- 
2.49.0

