Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F8890B288
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD6510E193;
	Mon, 17 Jun 2024 14:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XT/5H44H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A486E10E193
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:42:07 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-35f1edc71e6so396094f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718635326; x=1719240126; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1G/jrvdF3dCvmxuvQSxTJEMVpaOEFlBGDM8/a8dlWw=;
 b=XT/5H44H6ptmNrDmCY4uMAD+ey3QHde5f3li/DoVwMZVJnt/w5BWO0gKXpGQCO1hJS
 UTpH8s4AvaCvq7av/Z4wkt+Z/WsOmfz4RPeFXvLCUhkdDsaHfHvp7Wc9lmr3RoQ3G6kG
 rebY94cTeefOHPMRZzVYWA2RFAFpsInAIyOvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718635326; x=1719240126;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c1G/jrvdF3dCvmxuvQSxTJEMVpaOEFlBGDM8/a8dlWw=;
 b=dKzmUr5c2HgZZaRTIrsKYa596Zs/0PkA+NbhjGUUxp+GKypec4BVlaWmDGR7o5fhPB
 lLqHtnawGP/6uBP5vh4PKSTyIrNgZpVYlr6KKKn5PGbAuyAitqfyZoHhUWFz/9IZFg8S
 3j7ZRptNzDahI4zX/OtkQdOP404XWDb5jxBzZNPjU/D1K9IdnFZ2aX+OJuznPC24YClT
 APUYqTiagobaIgowIwIuN3nIbmn1rE/g1jfN/eXbKK39aBiw7bYYOIvyPLUm2llJuOmH
 gk7Pkg58MFFZXtEFtoiuUErHudQQ/FJt6gNAVctkPBD5McR3aSUw3jqjMT630ZK5j4bU
 PcLg==
X-Gm-Message-State: AOJu0YzVQw3afVUJY9592XrLKXxFa7qq4TlYnN2qvD/xgX3Hop2dgO0q
 7nhr5jj2umucYTBRvPO7Ke1nrsnH3ulMSqyRyYCZOEc5k6uczsdZ4d9OljG4EnCwrlt6v+Ho3ax
 Q
X-Google-Smtp-Source: AGHT+IFq7tlQ5YNy4T8Zg6kP8VdefpGvp1lRmKqeYDqCMXafolRWLTODU9a3M+/FPOB7MfmtlWWfQw==
X-Received: by 2002:a5d:47a4:0:b0:360:874b:af9a with SMTP id
 ffacd0b85a97d-360874bb304mr4837491f8f.3.1718635304759; 
 Mon, 17 Jun 2024 07:41:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750ad2cdsm12047313f8f.61.2024.06.17.07.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:41:44 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:41:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>
Subject: Re: [PATCH v15 0/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Message-ID: <ZnBLJmE-PeORv1NM@phenom.ffwll.local>
Mail-Followup-To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>
References: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, Jun 13, 2024 at 02:42:02PM -0700, Vivek Kasireddy wrote:
> Currently, some drivers (e.g, Udmabuf) that want to longterm-pin
> the pages/folios associated with a memfd, do so by simply taking a
> reference on them. This is not desirable because the pages/folios
> may reside in Movable zone or CMA block.
> 
> Therefore, having drivers use memfd_pin_folios() API ensures that
> the folios are appropriately pinned via FOLL_PIN for longterm DMA.
> 
> This patchset also introduces a few helpers and converts the Udmabuf
> driver to use folios and memfd_pin_folios() API to longterm-pin
> the folios for DMA. Two new Udmabuf selftests are also included to
> test the driver and the new API.

For merging, as soon as the -mm side is good it's imo best to land the
entire pile through the -mm tree, including the udmabuf patches. My ack
for that too (but I think Dave Airlie has done that already too).

Cheers, Sima
> 
> ---
> 
> Patchset overview:
> 
> Patch 1-2:    GUP helpers to migrate and unpin one or more folios
> Patch 3:      Introduce memfd_pin_folios() API
> Patch 4-5:    Udmabuf driver bug fixes for Qemu + hugetlb=on, blob=true case
> Patch 6-8:    Convert Udmabuf to use memfd_pin_folios() and add selftests
> 
> This series is tested using the following methods:
> - Run the subtests added in Patch 8
> - Run Qemu (master) with the following options and a few additional
>   patches to Spice:
>   qemu-system-x86_64 -m 4096m....
>   -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
>   -spice port=3001,gl=on,disable-ticketing=on,preferred-codec=gstreamer:h264
>   -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
>   -machine memory-backend=mem1
> - Run source ./run_vmtests.sh -t gup_test -a to check GUP regressions
> 
> Changelog:
> 
> v14 -> v15:
> - Add an error check start < 0 in memfd_pin_folios()
> - Return an error in udmabuf driver if memfd_pin_folios() returns 0
>   These two checks fix the following issue identified by syzbot:
>   https://syzkaller.appspot.com/bug?extid=40c7dad27267f61839d4
> - Set memfd = NULL before dmabuf export to ensure that memfd is
>   not closed twice on error. This fixes the following syzbot issue:
>   https://syzkaller.appspot.com/bug?extid=b2cfdac9ae5278d4b621
> 
> v13 -> v14:
> - Drop the redundant comments before check_and_migrate_movable_pages()
>   and refer to check_and_migrate_movable_folios() comments (David)
> - Use appropriate ksft_* functions for printing and KSFT_* codes for
>   exit() in udmabuf selftest (Shuah)
> - Add Mike Kravetz's suggested-by tag in udmabuf selftest patch (Shuah)
> - Collect Ack and Rb tags from David
> 
> v12 -> v13: (suggestions from David)
> - Drop the sanity checks in unpin_folio()/unpin_folios() due to
>   unavailability of per folio anon-exclusive flag
> - Export unpin_folio()/unpin_folios() using EXPORT_SYMBOL_GPL
>   instead of EXPORT_SYMBOL
> - Have check_and_migrate_movable_pages() just call
>   check_and_migrate_movable_folios() instead of calling other helpers
> - Slightly improve the comments and commit messages
> 
> v11 -> v12:
> - Rebased and tested on mm-unstable
> 
> v10 -> v11:
> - Remove the version string from the patch subject (Andrew)
> - Move the changelog from the patches into the cover letter
> - Rearrange the patchset to have GUP patches at the beginning
> 
> v9 -> v10:
> - Introduce and use unpin_folio(), unpin_folios() and
>   check_and_migrate_movable_folios() helpers
> - Use a list to track the folios that need to be unpinned in udmabuf
> 
> v8 -> v9: (suggestions from Matthew)
> - Drop the extern while declaring memfd_alloc_folio()
> - Fix memfd_alloc_folio() declaration to have it return struct folio *
>   instead of struct page * when CONFIG_MEMFD_CREATE is not defined
> - Use folio_pfn() on the folio instead of page_to_pfn() on head page
>   in udmabuf
> - Don't split the arguments to shmem_read_folio() on multiple lines
>   in udmabuf
> 
> v7 -> v8: (suggestions from David)
> - Have caller pass [start, end], max_folios instead of start, nr_pages
> - Replace offsets array with just offset into the first page
> - Add comments explaning the need for next_idx
> - Pin (and return) the folio (via FOLL_PIN) only once
> 
> v6 -> v7:
> - Rename this API to memfd_pin_folios() and make it return folios
>   and offsets instead of pages (David)
> - Don't continue processing the folios in the batch returned by
>   filemap_get_folios_contig() if they do not have correct next_idx
> - Add the R-b tag from Christoph
> 
> v5 -> v6: (suggestions from Christoph)
> - Rename this API to memfd_pin_user_pages() to make it clear that it
>   is intended for memfds
> - Move the memfd page allocation helper from gup.c to memfd.c
> - Fix indentation errors in memfd_pin_user_pages()
> - For contiguous ranges of folios, use a helper such as
>   filemap_get_folios_contig() to lookup the page cache in batches
> - Split the processing of hugetlb or shmem pages into helpers to
>   simplify the code in udmabuf_create()
> 
> v4 -> v5: (suggestions from David)
> - For hugetlb case, ensure that we only obtain head pages from the
>   mapping by using __filemap_get_folio() instead of find_get_page_flags()
> - Handle -EEXIST when two or more potential users try to simultaneously
>   add a huge page to the mapping by forcing them to retry on failure
> 
> v3 -> v4:
> - Remove the local variable "page" and instead use 3 return statements
>   in alloc_file_page() (David)
> - Add the R-b tag from David
> 
> v2 -> v3: (suggestions from David)
> - Enclose the huge page allocation code with #ifdef CONFIG_HUGETLB_PAGE
>   (Build error reported by kernel test robot <lkp@intel.com>)
> - Don't forget memalloc_pin_restore() on non-migration related errors
> - Improve the readability of the cleanup code associated with
>   non-migration related errors
> - Augment the comments by describing FOLL_LONGTERM like behavior
> - Include the R-b tag from Jason
> 
> v1 -> v2:
> - Drop gup_flags and improve comments and commit message (David)
> - Allocate a page if we cannot find in page cache for the hugetlbfs
>   case as well (David)
> - Don't unpin pages if there is a migration related failure (David)
> - Drop the unnecessary nr_pages <= 0 check (Jason)
> - Have the caller of the API pass in file * instead of fd (Jason)
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> 
> Arnd Bergmann (1):
>   udmabuf: add CONFIG_MMU dependency
> 
> Vivek Kasireddy (8):
>   mm/gup: Introduce unpin_folio/unpin_folios helpers
>   mm/gup: Introduce check_and_migrate_movable_folios()
>   mm/gup: Introduce memfd_pin_folios() for pinning memfd folios
>   udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
>   udmabuf: Add back support for mapping hugetlb pages
>   udmabuf: Convert udmabuf driver to use folios
>   udmabuf: Pin the pages using memfd_pin_folios() API
>   selftests/udmabuf: Add tests to verify data after page migration
> 
>  drivers/dma-buf/Kconfig                       |   1 +
>  drivers/dma-buf/udmabuf.c                     | 232 +++++++++----
>  include/linux/memfd.h                         |   5 +
>  include/linux/mm.h                            |   5 +
>  mm/gup.c                                      | 307 +++++++++++++++---
>  mm/memfd.c                                    |  35 ++
>  .../selftests/drivers/dma-buf/udmabuf.c       | 214 ++++++++++--
>  7 files changed, 662 insertions(+), 137 deletions(-)
> 
> -- 
> 2.45.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
