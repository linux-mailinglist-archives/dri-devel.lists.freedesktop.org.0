Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2078B82CA63
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 08:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B8F10E0D5;
	Sat, 13 Jan 2024 07:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0953410E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jan 2024 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705130199; x=1736666199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jtBpTPqq4kz8ubfHOwC7DguBY9cAsaDfs5HrtM1PI3c=;
 b=C9oPJ0UvXD/T7xYdxnegeasPTnkyjG4qb4FJkCB0aBcO6lS8Z4iuMWj5
 Vt8Q6AxzoBI7nOfFYy21Gfj+3CdC6HOG9Fc8gQ4A20BdgNTkz+qQRulRv
 HXUnmf5J2FKu1VKxdwof8scvQeifvD0PbPnLnyhaSvu8aoi+xvJ/romM+
 ZxSVkSCvLXJuuLXmSgH17R6z24nmEE+Z3VdKriyrw14MpjYDllo4qg0sn
 N1DGUUoNjniX3SMiC/mdVWx0ibhDYBrnYTBR+rA4caAYeGXQ0NsudGtCG
 hhB9pMLf9B2WDoS8JB5Whu8PxuWJRsalluKy9mwPSPdlMzx8CWJqjYnF+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6078106"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="6078106"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 23:16:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="783269484"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="783269484"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 23:16:36 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH v11 0/8] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Date: Fri, 12 Jan 2024 22:52:15 -0800
Message-Id: <20240113065223.1532987-1-vivek.kasireddy@intel.com>
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

Currently, some drivers (e.g, Udmabuf) that want to longterm-pin
the pages/folios associated with a memfd, do so by simply taking a
reference on them. This is not desirable because the pages/folios
may reside in Movable zone or CMA block.

Therefore, having drivers use memfd_pin_folios() API ensures that
the folios are appropriately pinned via FOLL_PIN for longterm DMA.

This patchset also introduces a few helpers and converts the Udmabuf
driver to use folios and memfd_pin_folios() API to longterm-pin
the folios for DMA. Two new Udmabuf selftests are also included to
test the driver and the new API.

---

Patchset overview:

Patch 1-2:    GUP helpers to migrate and unpin one or more folios
Patch 3:      Introduce memfd_pin_folios() API
Patch 4-5:    Udmabuf driver bug fixes for Qemu + hugetlb=on, blob=true case
Patch 6-8:    Convert Udmabuf to use memfd_pin_folios() and add sefltests

This series is based on drm-tip (6.7.0) and tested using following methods:
- Run the subtests added in Patch 8
- Run Qemu (master) with the following options and a few additional
  patches to Spice:
  qemu-system-x86_64 -m 4096m....
  -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
  -spice port=3001,gl=on,disable-ticketing=on,preferred-codec=gstreamer:h264
  -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
  -machine memory-backend=mem1
- Run source ./run_vmtests.sh -t gup_test -a to check GUP regressions

Changelog:

v10 -> v11:
- Remove the version string from the patch subject (Andrew)
- Move the changelog from the patches into the cover letter
- Rearrange the patchset to have GUP patches at the beginning

v9 -> v10:
- Introduce and use unpin_folio(), unpin_folios() and
  check_and_migrate_movable_folios() helpers
- Use a list to track the folios that need to be unpinned in udmabuf

v8 -> v9: (suggestions from Matthew)
- Drop the extern while declaring memfd_alloc_folio()
- Fix memfd_alloc_folio() declaration to have it return struct folio *
  instead of struct page * when CONFIG_MEMFD_CREATE is not defined
- Use folio_pfn() on the folio instead of page_to_pfn() on head page
  in udmabuf
- Don't split the arguments to shmem_read_folio() on multiple lines
  in udmabuf

v7 -> v8: (suggestions from David)
- Have caller pass [start, end], max_folios instead of start, nr_pages
- Replace offsets array with just offset into the first page
- Add comments explaning the need for next_idx
- Pin (and return) the folio (via FOLL_PIN) only once

v6 -> v7:
- Rename this API to memfd_pin_folios() and make it return folios
  and offsets instead of pages (David)
- Don't continue processing the folios in the batch returned by
  filemap_get_folios_contig() if they do not have correct next_idx
- Add the R-b tag from Christoph

v5 -> v6: (suggestions from Christoph)
- Rename this API to memfd_pin_user_pages() to make it clear that it
  is intended for memfds
- Move the memfd page allocation helper from gup.c to memfd.c
- Fix indentation errors in memfd_pin_user_pages()
- For contiguous ranges of folios, use a helper such as
  filemap_get_folios_contig() to lookup the page cache in batches
- Split the processing of hugetlb or shmem pages into helpers to
  simplify the code in udmabuf_create()

v4 -> v5: (suggestions from David)
- For hugetlb case, ensure that we only obtain head pages from the
  mapping by using __filemap_get_folio() instead of find_get_page_flags()
- Handle -EEXIST when two or more potential users try to simultaneously
  add a huge page to the mapping by forcing them to retry on failure

v3 -> v4:
- Remove the local variable "page" and instead use 3 return statements
  in alloc_file_page() (David)
- Add the R-b tag from David

v2 -> v3: (suggestions from David)
- Enclose the huge page allocation code with #ifdef CONFIG_HUGETLB_PAGE
  (Build error reported by kernel test robot <lkp@intel.com>)
- Don't forget memalloc_pin_restore() on non-migration related errors
- Improve the readability of the cleanup code associated with
  non-migration related errors
- Augment the comments by describing FOLL_LONGTERM like behavior
- Include the R-b tag from Jason

v1 -> v2:
- Drop gup_flags and improve comments and commit message (David)
- Allocate a page if we cannot find in page cache for the hugetlbfs
  case as well (David)
- Don't unpin pages if there is a migration related failure (David)
- Drop the unnecessary nr_pages <= 0 check (Jason)
- Have the caller of the API pass in file * instead of fd (Jason)

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

Vivek Kasireddy (8):
  mm/gup: Introduce unpin_folio/unpin_folios helpers
  mm/gup: Introduce check_and_migrate_movable_folios()
  mm/gup: Introduce memfd_pin_folios() for pinning memfd folios
  udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
  udmabuf: Add back support for mapping hugetlb pages
  udmabuf: Convert udmabuf driver to use folios
  udmabuf: Pin the pages using memfd_pin_folios() API
  selftests/udmabuf: Add tests to verify data after page migration

 drivers/dma-buf/udmabuf.c                     | 231 +++++++++---
 include/linux/memfd.h                         |   5 +
 include/linux/mm.h                            |   5 +
 mm/gup.c                                      | 346 +++++++++++++++---
 mm/memfd.c                                    |  34 ++
 .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++-
 6 files changed, 662 insertions(+), 110 deletions(-)

-- 
2.39.2

