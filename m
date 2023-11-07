Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A651E7E3438
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 04:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EA210E115;
	Tue,  7 Nov 2023 03:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6A810E115
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 03:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699328056; x=1730864056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dHRLiDownStx5s36gC5p8cL07CF6Lv06KgLGUQMtKfU=;
 b=RbxHWWZl11QyZ8s0gHjXF6Ea1/V8kqmwoXE7Z2CUeg9cPlzuhxYbtX1J
 1M4ob5gPfs1eeiQHSqoRvpBMFuw6Xsz/HXEfhN7ERQGNiFtwVRpFfT2OZ
 x7rKaMtWoC1fLmdElgdvOGeDoGtwMV7sh2ZYA/dhOAZEqV60DehVmAaYN
 TxOi7tktuyvAEntT87vsXsr+nhdXFIDa7+a1WjJO9C3VHhaTK0c/IEymM
 mDLWiQvI30yCdE3/RsSEUfKsD6bkGyK1KmVRqtPshgT1RsHM2wmGEZvuy
 OZ3pMvO2aFZVsLMYpjQXh4MKv/cjDj+SdTZC4V0JFDLvyx9EqjcqqYrOh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="386594645"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="386594645"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 19:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="936001874"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="936001874"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 06 Nov 2023 19:34:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r0Cqu-0006vA-39;
 Tue, 07 Nov 2023 03:34:08 +0000
Date: Tue, 7 Nov 2023 11:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v2)
Message-ID: <202311071110.ZGF6P4zc-lkp@intel.com>
References: <20231106061541.507116-2-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106061541.507116-2-vivek.kasireddy@intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, llvm@lists.linux.dev,
 Hugh Dickins <hughd@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Peter Xu <peterx@redhat.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 oe-kbuild-all@lists.linux.dev, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vivek,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/mm-gup-Introduce-pin_user_pages_fd-for-pinning-shmem-hugetlbfs-file-pages-v2/20231106-141954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231106061541.507116-2-vivek.kasireddy%40intel.com
patch subject: [PATCH v2 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning shmem/hugetlbfs file pages (v2)
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20231107/202311071110.ZGF6P4zc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311071110.ZGF6P4zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311071110.ZGF6P4zc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from mm/gup.c:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> mm/gup.c:3419:9: error: implicit declaration of function 'hugetlb_add_to_page_cache' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   err = hugetlb_add_to_page_cache(folio, file->f_mapping, idx);
                         ^
   12 warnings and 1 error generated.


vim +/hugetlb_add_to_page_cache +3419 mm/gup.c

  3403	
  3404	static struct page *alloc_file_page(struct file *file, pgoff_t idx)
  3405	{
  3406		struct page *page = ERR_PTR(-ENOMEM);
  3407		struct folio *folio;
  3408		int err;
  3409	
  3410		if (shmem_file(file))
  3411			return shmem_read_mapping_page(file->f_mapping, idx);
  3412	
  3413		folio = alloc_hugetlb_folio_nodemask(hstate_file(file),
  3414						     NUMA_NO_NODE,
  3415						     NULL,
  3416						     GFP_USER);
  3417		if (folio && folio_try_get(folio)) {
  3418			page = &folio->page;
> 3419			err = hugetlb_add_to_page_cache(folio, file->f_mapping, idx);
  3420			if (err) {
  3421				folio_put(folio);
  3422				free_huge_folio(folio);
  3423				page = ERR_PTR(err);
  3424			}
  3425		}
  3426	
  3427		return page;
  3428	}
  3429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
