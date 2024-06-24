Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D203891431F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0454D10E35E;
	Mon, 24 Jun 2024 07:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGe2WJtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BE110E35E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719212725; x=1750748725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TK9UW1dOeF0+19q5Bl1xRcBy5E1WW9rDWntREkoVRuQ=;
 b=NGe2WJtXXhdXUdQ5mLc0aev+6GLFLmFrMfPr7Tbc+owiXosagCKxy8Ur
 2JQXcRxtcdpdhAabi72JXUGUvHGA3M9gbw4N+C7mqUXR60144lkJFkZ24
 4PoH6kit1cLw21neZasStVIWx8KL9r3nPkjt4EWMzGzG6Oo4NQBQumM6w
 uno9JmNbRXjNxbUtxbwLkX6x2vSsFX/q68nmlugEAFh+avSC0F6X6AVkS
 G9g21cHEyJopdq90aRNclYiYesN8TPUpFgJi//tmwKV1cR+G9VccVUYdx
 a5T4ui385FqX3yWEa40pQcRle35HSDLeX2OuHT+YNpzlJ6h+Eih+pfVDs A==;
X-CSE-ConnectionGUID: /Hn+7r6PQxiSFS1Ks2uVCg==
X-CSE-MsgGUID: dn0UOuhXQhmjxYc3Re2wUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16134930"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16134930"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:05:24 -0700
X-CSE-ConnectionGUID: c9QrbHC2TEuxCsweK5lQ0A==
X-CSE-MsgGUID: cvwYdPkcR7u47Xlo8+r3xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="73955856"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:05:24 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>
Subject: [PATCH v16 0/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Date: Sun, 23 Jun 2024 23:36:08 -0700
Message-ID: <20240624063952.1572359-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
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
Patch 4-6:    Udmabuf driver bug fixes for Qemu + hugetlb=on, blob=true case
Patch 7-9:    Convert Udmabuf to use memfd_pin_folios() and add selftests

This series is tested using the following methods:
- Run the subtests added in the last patch
- Run Qemu (master) with the following options and a few additional
  patches to Spice:
  qemu-system-x86_64 -m 4096m....
  -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
  -spice port=3001,gl=on,disable-ticketing=on,preferred-codec=gstreamer:h264
  -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
  -machine memory-backend=mem1
- Run source ./run_vmtests.sh -t gup_test -a to check GUP regressions

Changelog:

v15 -> v16:
- Instead of passing GFP_USER while allocating a hugetlb folio, use
  htlb_alloc_mask(h) & ~(__GFP_HIGHMEM | __GFP_MOVABLE) as gfp mask
  to discourage new users from passing GFP_xxx flags. Also add comments
  to explain this situation (Oscar)
- Replace NUMA_NO_NODE with numa_node_id() while allocating the htlb
  folio to discourage new users from passing NUMA_NO_NODE

v14 -> v15:
- Add an error check start < 0 in memfd_pin_folios()
- Return an error in udmabuf driver if memfd_pin_folios() returns 0
  These two checks fix the following issue identified by syzbot:
  https://syzkaller.appspot.com/bug?extid=40c7dad27267f61839d4
- Set memfd = NULL before dmabuf export to ensure that memfd is
  not closed twice. This fixes the following syzbot issue:
  https://syzkaller.appspot.com/bug?extid=b2cfdac9ae5278d4b621

v13 -> v14:
- Drop the redundant comments before check_and_migrate_movable_pages()
  and refer to check_and_migrate_movable_folios() comments (David)
- Use appropriate ksft_* functions for printing and KSFT_* codes for
  exit() in udmabuf selftest (Shuah)
- Add Mike Kravetz's suggested-by tag in udmabuf selftest patch (Shuah)
- Collect Ack and Rb tags from David

v12 -> v13: (suggestions from David)
- Drop the sanity checks in unpin_folio()/unpin_folios() due to
  unavailability of per folio anon-exclusive flag
- Export unpin_folio()/unpin_folios() using EXPORT_SYMBOL_GPL
  instead of EXPORT_SYMBOL
- Have check_and_migrate_movable_pages() just call
  check_and_migrate_movable_folios() instead of calling other helpers
- Slightly improve the comments and commit messages

v11 -> v12:
- Rebased and tested on mm-unstable

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
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>

Arnd Bergmann (1):
  udmabuf: add CONFIG_MMU dependency

Vivek Kasireddy (8):
  mm/gup: Introduce unpin_folio/unpin_folios helpers
  mm/gup: Introduce check_and_migrate_movable_folios()
  mm/gup: Introduce memfd_pin_folios() for pinning memfd folios
  udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
  udmabuf: Add back support for mapping hugetlb pages
  udmabuf: Convert udmabuf driver to use folios
  udmabuf: Pin the pages using memfd_pin_folios() API
  selftests/udmabuf: Add tests to verify data after page migration

 drivers/dma-buf/Kconfig                       |   1 +
 drivers/dma-buf/udmabuf.c                     | 232 +++++++++----
 include/linux/memfd.h                         |   5 +
 include/linux/mm.h                            |   5 +
 mm/gup.c                                      | 308 +++++++++++++++---
 mm/memfd.c                                    |  45 +++
 .../selftests/drivers/dma-buf/udmabuf.c       | 214 ++++++++++--
 7 files changed, 673 insertions(+), 137 deletions(-)

-- 
2.45.1

