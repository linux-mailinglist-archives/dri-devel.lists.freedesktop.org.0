Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA881ED16
	for <lists+dri-devel@lfdr.de>; Wed, 27 Dec 2023 09:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBB610E212;
	Wed, 27 Dec 2023 08:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6AB10E212
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 08:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703664157; x=1735200157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BoUO2t60imgNA79MCSCVHWfoTCeaSw2o+h7770LXnEM=;
 b=D6ThImTDUHf/7WKJIhh1H8YY5LjsEGxepoullre7HSgQvlUme9RGM/N7
 40C9u4FZmGrxsIcqP2qJ6GtQ6KAJID8da1DQ1OhSUU7Fod2Qp3y0Z5Xqy
 0OiX3kS2xovmAOYc47eASFBoMGiAd9pXfJxpqnSq6T9hU5F5ja5nlTn+O
 u8NNXm1z8DBo+ExHKQrCJtW8SiChAyhIJ4irONeWHTHBmAunxS9Hx/zZk
 p1Pip3dimAqgEI5/N/nPCaZxtRBNJn55VilLSjGIBmPCGEGPr7wG368gK
 oCsZUYwzllU+RCOHbMiTL9CcO5+5CRKGaLE2sS3q8iHrVaCqaIqKbOpYn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="482604277"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="482604277"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 00:02:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="781668178"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="781668178"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 00:02:36 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v9 0/6] mm/gup: Introduce memfd_pin_folios() for pinning memfd
 folios (v9)
Date: Tue, 26 Dec 2023 23:38:16 -0800
Message-Id: <20231227073822.390518-1-vivek.kasireddy@intel.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
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

v8:
- Addressed review comments from Matthew in patches 4 and 5
- Included David's suggestions to have the caller of memfd_pin_folios()
  pass a range [stard, end], max_folios instead of start, nr_pages
- Ensured that a folio is pinned and unpinned only once (David)

v9:
- Drop the extern and fix the return type in the declaration of
  memfd_alloc_folio() (Matthew)
- Use a list to track the folios that need to be unpinned (patch 5)

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
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
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
  mm/gup: Introduce memfd_pin_folios() for pinning memfd folios (v9)
  udmabuf: Convert udmabuf driver to use folios (v2)
  udmabuf: Pin the pages using memfd_pin_folios() API (v7)
  selftests/dma-buf/udmabuf: Add tests to verify data after page
    migration

 drivers/dma-buf/udmabuf.c                     | 231 +++++++++++++-----
 include/linux/memfd.h                         |   5 +
 include/linux/mm.h                            |   3 +
 mm/gup.c                                      | 149 +++++++++++
 mm/memfd.c                                    |  34 +++
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++++++-
 6 files changed, 509 insertions(+), 64 deletions(-)

-- 
2.39.2

