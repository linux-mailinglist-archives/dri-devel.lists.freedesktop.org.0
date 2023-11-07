Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BC87E3492
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 05:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDE810E4A9;
	Tue,  7 Nov 2023 04:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739BE10E4A9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 04:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699332081; x=1730868081;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bXV69DM5TVXRswvmT9mbk5ng8CYNmjBatfhjCKuhupU=;
 b=T3UcmJiPoQHQAl5buxKIuYA4Mp0WP+2Liw5zOOis0LgInRLFlOE8OXUm
 QMh/5imdydH+7anC0TNjE0Kc9u8Jcii1cLI5JJxMyAtmqky+tcwqQ4zSi
 /p+IHxvgGbRUvY7LgQHT4Uue6/VrUQQVuaM04SdKQzfHo/iQLP3taqf0H
 qaLjrlAiil291f27hESF3AdNvjV1B3jXtO2NbteLbvUCSjFUC3jlUss1j
 x4GH1zIs45fuFiB/y7+4h1IdlEVMBf1qV9xRHfdGDBX3EDDkY/y2J52Ci
 9ygOS6ovJREYBhMzoVSROfzX5QJaSP1Om1hDuKBVQgMNFF/oiSD9e5lob Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="389236401"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="389236401"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 20:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="832945509"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="832945509"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2023 20:41:17 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r0Dtr-0006vs-0v;
 Tue, 07 Nov 2023 04:41:15 +0000
Date: Tue, 7 Nov 2023 12:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v2)
Message-ID: <202311071223.ZeoRZg33-lkp@intel.com>
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
config: mips-maltaup_defconfig (https://download.01.org/0day-ci/archive/20231107/202311071223.ZeoRZg33-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311071223.ZeoRZg33-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311071223.ZeoRZg33-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/gup.c:3419:9: error: call to undeclared function 'hugetlb_add_to_page_cache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3419 |                 err = hugetlb_add_to_page_cache(folio, file->f_mapping, idx);
         |                       ^
   1 error generated.


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
