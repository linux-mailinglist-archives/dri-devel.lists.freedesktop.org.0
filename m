Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645A4A1022F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856AA10E880;
	Tue, 14 Jan 2025 08:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewhT2JmJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316FB10E449
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736843891; x=1768379891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E6TH/lyWtE8ZlFL6RJjSGsS+m2RTQmVTbw55gtCDXtU=;
 b=ewhT2JmJAMS7Ur+CVL1SSzlnCqK/JiLv0E1TeWsz5ppRFn7pLFJ4zH63
 tvfjjv5YJCTkfn9ugo7JKVWTHBBb+mjEYJYTn33F6vqg7Mk97W5LG57WB
 67844ODJB1OTsQS+rPR9ad6AoNzfkaQh3gy7Ghigetm60TPJ/WdjRhuzj
 O3hTfQH/bQjK3lLrqliY5X2eUl0ZVjVKGu/ZfVQ2r9DIyo8wCy7AVdk7w
 TFv4h4vf98Q+QIKDaTPXNTlIioB0X5qTnjA36pJz+Gnj5l/iVTvxY23FL
 /OP4woxvlqEoef1XSeHeQbfEmtNsxEudNSpMSMU1nVqyCQ6kBsuOL5gzU g==;
X-CSE-ConnectionGUID: FW0UvymFR/KpUaskDwmT6Q==
X-CSE-MsgGUID: aJ37affETz6+vjry+firdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36418223"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="36418223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:38:10 -0800
X-CSE-ConnectionGUID: 135edZcDSea+IBOPUJPJoQ==
X-CSE-MsgGUID: SletGuQ7Q7Cajz7v6XjaUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="105251575"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:38:10 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/2] mm/memfd: reserve hugetlb folios before allocation
Date: Tue, 14 Jan 2025 00:07:59 -0800
Message-ID: <20250114080927.2616684-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.47.1
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
but there is a chance that we might encounter a crash/failure
(VM_BUG_ON(!h->resv_huge_pages)) if there are no active reservations
at that instant. This issue was reported by syzbot.

Therefore, to avoid this situation and fix this issue, we just need
to make a reservation (by calling hugetlb_reserve_pages()) before
we try to allocate the folio. This will ensure that we are properly
doing region/subpool accounting associated with our allocation.

-----------------------------

Patchset overview:

Patch 1: Fix for VM_BUG_ON(!h->resv_huge_pages) crash reported by syzbot
Patch 2: New udmabuf selftest to invoke memfd_alloc_folio()

This series is tested by running the new udmabuf selftest introduced
in patch #2 along with the other selftests.

Changelog:

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

Vivek Kasireddy (2):
  mm/memfd: reserve hugetlb folios before allocation
  selftests/udmabuf: add a test to pin first before writing to memfd

 include/linux/hugetlb.h                       |  5 +++++
 mm/hugetlb.c                                  | 14 ++++++-------
 mm/memfd.c                                    | 14 ++++++++++---
 .../selftests/drivers/dma-buf/udmabuf.c       | 20 ++++++++++++++++++-
 4 files changed, 41 insertions(+), 12 deletions(-)

-- 
2.47.1

