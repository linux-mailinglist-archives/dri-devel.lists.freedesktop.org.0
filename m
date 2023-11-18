Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C27EFE2A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 07:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE66E10E0FB;
	Sat, 18 Nov 2023 06:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EE710E027
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 06:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700290568; x=1731826568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=erO3C/L4XTqWTjYBeWPQmN0O0J5zfZFkCwntSDucTjc=;
 b=LACx27MqisRRP/6DL6IxQE9K1BEUeDpMNeuBU3LvX8bQI6cH6E8ZO4WK
 YKqGOCawZFGmgs8fd1gzxB6AuQkmbRA8lqNn1ZKrnuKektE623KJ/U4aX
 ZREy9cRjkgNtmKBW6eIzxb/SkIGE17leJnFdr1uUL5AZIxPTpsFObci1I
 Z2dsv2nJn2nJhyoRMhMCrDBZtgSfFCf8nLMov5zj9jno4FAPe7R61y+uJ
 tFftC4fNVQLN2xb8kx0pXxTLXM6mXBmQTZLhicgHraW4HGoJmR/RHqrZN
 BRvYyq3251SP8+uL/S33nszS8FSPtwuUDG4TmhPy0708aPmeOC19iFRsv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="457912348"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; d="scan'208";a="457912348"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 22:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="800686571"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; d="scan'208";a="800686571"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 22:56:06 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v4 0/5] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v4)
Date: Fri, 17 Nov 2023 22:32:28 -0800
Message-Id: <20231118063233.733523-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first two patches were previously reviewed but not yet merged.
These ones need to be merged first as the fourth patch depends on
the changes introduced in them and they also fix bugs seen in
very specific scenarios (running Qemu with hugetlb=on, blob=true
and rebooting guest VM).

The third patch introduces pin_user_pages_fd() API and the fourth
patch shows how the udmabuf driver can make use of it to
longterm-pin the the pages. The last patch adds two new udmabuf
selftests to verify data coherency after potential page migration.

v2:
- Updated the first patch to include review feedback from David and
  Jason. The main change in this series is the allocation of page
  in the case of hugetlbfs if it is not found in the page cache.

v3:
- Made changes to include review feedback from David to improve the
  comments and readability of code
- Enclosed the hugepage alloc code with #ifdef CONFIG_HUGETLB_PAGE

v4:
- Augmented the commit message of the udmabuf patch that uses
  pin_user_pages_fd()
- Added previously reviewed but unmerged udmabuf patches to this
  series

Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>

Vivek Kasireddy (5):
  udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
  udmabuf: Add back support for mapping hugetlb pages (v3)
  mm/gup: Introduce pin_user_pages_fd() for pinning shmem/hugetlbfs file
    pages (v4)
  udmabuf: Pin the pages using pin_user_pages_fd() API (v3)
  selftests/dma-buf/udmabuf: Add tests to verify data after page
    migration

 drivers/dma-buf/udmabuf.c                     |  96 ++++++++---
 include/linux/mm.h                            |   2 +
 mm/gup.c                                      | 108 +++++++++++++
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++++++++++++-
 4 files changed, 328 insertions(+), 29 deletions(-)

-- 
2.39.2

