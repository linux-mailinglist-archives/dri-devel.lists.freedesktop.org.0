Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E0A80E556
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 09:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44D110E569;
	Tue, 12 Dec 2023 08:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0801B10E4F6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702368086; x=1733904086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Qgh4kMsznhcdHeDs93S+cQ+GO/HtIrx/+OgoDUQ/nc=;
 b=FEF9bevzWlF4M5sBYiXq2Rk4dqDH0fBr55BCcioumzZH8ZQoDJjiIzfQ
 95g2LtUHBQIyXPF2tuDzxRx/rGeIqUwv+PiNarSB1P351uWFJbK9kiOWO
 Jkwp09etCZR65HG9DWeZw7MjB8tI72fT2viE/N+UFpZTuThwfxCIPPete
 yVTOGQQy7zjlRsS50vVjPvLd5PvushKRRIEFX01aj5pWJrVmbJv/bmA2N
 tfqO6hHTz7iYNMunK3U51Z+NKe+C5731oktbGUVFvp9CNa+tymwKmJOZO
 vfU8r4n9dk6RinwZ+Le0C/Btyf8ijxkkRwkz9SD0+iq6dWlDM5NGNAkWb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="397553936"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="397553936"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 00:01:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="802376315"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="802376315"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 00:01:24 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v7 0/6] mm/gup: Introduce memfd_pin_folios() for pinning memfd
 folios (v7)
Date: Mon, 11 Dec 2023 23:37:57 -0800
Message-Id: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
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

The third patch introduces memfd_pin_folios() API and the fourth
patch converts udmabuf driver to use folios. The fifth patch shows
how the udmabuf driver can make use of the new API to longterm-pin
the folios. The last patch adds two new udmabuf selftests to verify
data coherency after potential page migration.

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

v7:
- Rename the new API to memfd_pin_folios() and make it return folios
  and offsets (David)
- Added a new preparatory patch to this series to convert udmabuf
  driver to use folios

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

Vivek Kasireddy (6):
  udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
  udmabuf: Add back support for mapping hugetlb pages (v6)
  mm/gup: Introduce memfd_pin_folios() for pinning memfd folios (v7)
  udmabuf: Convert udmabuf driver to use folios
  udmabuf: Pin the pages using memfd_pin_folios() API (v5)
  selftests/dma-buf/udmabuf: Add tests to verify data after page
    migration

 drivers/dma-buf/udmabuf.c                     | 166 +++++++++++-------
 include/linux/memfd.h                         |   5 +
 include/linux/mm.h                            |   3 +
 mm/gup.c                                      | 155 ++++++++++++++++
 mm/memfd.c                                    |  34 ++++
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++++++++++-
 6 files changed, 451 insertions(+), 63 deletions(-)

-- 
2.39.2

