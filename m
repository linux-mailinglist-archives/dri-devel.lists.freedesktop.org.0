Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4C8804994
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 06:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AD210E110;
	Tue,  5 Dec 2023 05:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1CC10E0F2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 05:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701755931; x=1733291931;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8RyCyh0TzNzqu1yToc8PYYuNJHO34bkJ9Z97qx7ch0o=;
 b=Yaa2J57C0/n69kGr8VILekChB6MtrPCTAxbhiWnXFHiKJQnvLNhudkPw
 E51n3cYs4iTsQbunChc+Rb+NUajO5LvJNBaQHTD+RdH5LTp4HXlsPfWFr
 SHRqks3dOtVtEZLtl2UQIW1RqGymkNRcTfOW8DRd6GYepLBx5u5Er8pMH
 rnRVFXREpIUr5EedB7N1Z1iXhX9Bru05U08CX/XbET+l/iMpx6fZv6R24
 dxDmcclX6eKRE8aaVgH/3ftxWSmYGlROqvPgwAuheDZTq5gFjrydaujDq
 i1ms+MpcfsjOuRTOLiDgAeswyZNu57C+kkIgqUZ6blVCysltawUMBdVEW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="906291"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="906291"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 21:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888807721"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="888807721"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 21:58:50 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v6 0/5] mm/gup: Introduce memfd_pin_user_pages() for pinning
 memfd pages (v6)
Date: Mon,  4 Dec 2023 21:35:04 -0800
Message-Id: <20231205053509.2342169-1-vivek.kasireddy@intel.com>
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
 Christoph Hellwig <hch@infradead.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first two patches were previously reviewed but not yet merged.
These ones need to be merged first as the fourth patch depends on
the changes introduced in them and they also fix bugs seen in
very specific scenarios (running Qemu with hugetlb=on, blob=true
and rebooting guest VM).

The third patch introduces memfd_pin_user_pages() API and the fourth
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

v5:
- Updated the patch that adds pin_user_pages_fd() to include feedback
  from David to handle simultaneous users trying to add a huge page
  to the mapping
- Replaced find_get_page_flags() with __filemap_get_folio() in the
  second and third patches to ensure that we only obtain head pages
  from the mapping

v6: (Christoph)
- Renamed the new API to memfd_pin_user_pages()
- Improved the page cache lookup efficiency by using
  filemap_get_folios_contig() which uses batches

This series is tested using following methods:
- Run the subtests added in the fifth patch
- Run Qemu (master) with the following options and a few additional
  patches to Spice:
  qemu-system-x86_64 -m 4096m....
  -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
  -spice port=3001,gl=on,disable-ticketing=on,preferred-codec=gstreamer:h264
  -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
  -machine memory-backend=mem1

Cc: David Hildenbrand <david@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>
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
  udmabuf: Add back support for mapping hugetlb pages (v5)
  mm/gup: Introduce memfd_pin_user_pages() for pinning memfd pages (v6)
  udmabuf: Pin the pages using memfd_pin_user_pages() API (v4)
  selftests/dma-buf/udmabuf: Add tests to verify data after page
    migration

 drivers/dma-buf/udmabuf.c                     |  98 +++++++++---
 include/linux/memfd.h                         |   5 +
 include/linux/mm.h                            |   2 +
 mm/gup.c                                      | 102 ++++++++++++
 mm/memfd.c                                    |  34 ++++
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++++++++++++-
 6 files changed, 363 insertions(+), 29 deletions(-)

-- 
2.39.2

