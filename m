Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91786866EEC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 10:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2CA10EFFF;
	Mon, 26 Feb 2024 09:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXNvFhKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2B910EFF7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708940590; x=1740476590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=peeh3uBT6rkaZj0IWaTOnmOqCf87o+9OlPo0K0aPohw=;
 b=HXNvFhKf+bHFH3XaVKlF/uYyCSLx0vGwogKBu1T9CZUMiqlYe0DgA1Pp
 h0RagLTVhmBJzE6WIyW6cWSRn/8aS6rdact470i2eCFXg9MVWyqEerUy/
 WxibEHwPwm0HNONhTc2pmKyRMD0eDhr1OaUBZLEIcYzxDmj9LMQfaIHaY
 zoZ3Y4MVlDEZsqJVhitgHCNpIkZ8eq0q11XN51zbYpJf3qd2pQ82ksBVO
 ZRgOaBiJqMt0hX4bB50fzvy8ztZkDfDeLkgmhXpk3avYp0saPnXUfbD87
 wHaavXRiRxK6NIn8i9hvruBtlrjjGOkuNS1gmFwond9cft6ke0P7E0i5z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14346769"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14346769"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:43:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11201013"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 26 Feb 2024 01:43:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1reXVn-000AE7-0w;
 Mon, 26 Feb 2024 09:43:03 +0000
Date: Mon, 26 Feb 2024 17:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 'Netdev' <netdev@vger.kernel.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 'Jens Axboe' <axboe@kernel.dk>,
 "'Matthew Wilcox (Oracle)'" <willy@infradead.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 "'David S . Miller'" <davem@davemloft.net>,
 'Dan Carpenter' <dan.carpenter@linaro.org>,
 'Jani Nikula' <jani.nikula@linux.intel.com>
Subject: Re: [PATCH next v2 11/11] minmax: min() and max() don't need to
 return constant expressions
Message-ID: <202402261720.EAMC0eHM-lkp@intel.com>
References: <a18dcae310f74dcb9c6fc01d5bdc0568@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a18dcae310f74dcb9c6fc01d5bdc0568@AcuMS.aculab.com>
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

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linux/master mkl-can-next/testing kdave/for-next akpm-mm/mm-nonmm-unstable linus/master v6.8-rc6]
[cannot apply to next-20240223 dtor-input/next dtor-input/for-linus axboe-block/for-next horms-ipvs/master next-20240223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Put-all-the-clamp-definitions-together/20240226-005902
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/a18dcae310f74dcb9c6fc01d5bdc0568%40AcuMS.aculab.com
patch subject: [PATCH next v2 11/11] minmax: min() and max() don't need to return constant expressions
config: i386-buildonly-randconfig-001-20240226 (https://download.01.org/0day-ci/archive/20240226/202402261720.EAMC0eHM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261720.EAMC0eHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261720.EAMC0eHM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/pgtable.c:437:14: warning: variable length array used [-Wvla]
     437 |         pmd_t *pmds[MAX_PREALLOCATED_PMDS];
         |                     ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/pgtable.c:180:31: note: expanded from macro 'MAX_PREALLOCATED_PMDS'
     180 | #define MAX_PREALLOCATED_PMDS   MAX_UNSHARED_PTRS_PER_PGD
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/pgtable.c:113:2: note: expanded from macro 'MAX_UNSHARED_PTRS_PER_PGD'
     113 |         max_t(size_t, KERNEL_PGD_BOUNDARY, PTRS_PER_PGD)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:152:27: note: expanded from macro 'max_t'
     152 | #define max_t(type, x, y)       __careful_cmp(max, (type)(x), (type)(y), __COUNTER__)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:62:2: note: expanded from macro '__careful_cmp'
      59 | #define __careful_cmp(op, x, y, uniq) ({        \
         |                                       ~~~~~~~~~~~
      60 |         _Static_assert(__types_ok(x, y),        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 |                 #op "(" #x ", " #y ") signedness error, fix types or consider u" #op "() before " #op "_t()"); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      62 |         __cmp_once(op, x, y, uniq); })
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:57:2: note: expanded from macro '__cmp_once'
      57 |         __cmp(op, __x_##uniq, __y_##uniq); })
         |         ^
   include/linux/minmax.h:52:26: note: expanded from macro '__cmp'
      52 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
         |                          ^
   1 warning generated.


vim +437 arch/x86/mm/pgtable.c

1db491f77b6ed0 Fenghua Yu          2015-01-15  432  
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  433  pgd_t *pgd_alloc(struct mm_struct *mm)
1ec1fe73dfb711 Ingo Molnar         2008-03-19  434  {
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  435  	pgd_t *pgd;
184d47f0fd3651 Kees Cook           2018-10-08  436  	pmd_t *u_pmds[MAX_PREALLOCATED_USER_PMDS];
184d47f0fd3651 Kees Cook           2018-10-08 @437  	pmd_t *pmds[MAX_PREALLOCATED_PMDS];
1ec1fe73dfb711 Ingo Molnar         2008-03-19  438  
1db491f77b6ed0 Fenghua Yu          2015-01-15  439  	pgd = _pgd_alloc();
1ec1fe73dfb711 Ingo Molnar         2008-03-19  440  
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  441  	if (pgd == NULL)
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  442  		goto out;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  443  
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  444  	mm->pgd = pgd;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  445  
25226df4b9be7f Gustavo A. R. Silva 2022-09-21  446  	if (sizeof(pmds) != 0 &&
25226df4b9be7f Gustavo A. R. Silva 2022-09-21  447  			preallocate_pmds(mm, pmds, PREALLOCATED_PMDS) != 0)
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  448  		goto out_free_pgd;
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  449  
25226df4b9be7f Gustavo A. R. Silva 2022-09-21  450  	if (sizeof(u_pmds) != 0 &&
25226df4b9be7f Gustavo A. R. Silva 2022-09-21  451  			preallocate_pmds(mm, u_pmds, PREALLOCATED_USER_PMDS) != 0)
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  452  		goto out_free_pmds;
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  453  
f59dbe9ca6707e Joerg Roedel        2018-07-18  454  	if (paravirt_pgd_alloc(mm) != 0)
f59dbe9ca6707e Joerg Roedel        2018-07-18  455  		goto out_free_user_pmds;
f59dbe9ca6707e Joerg Roedel        2018-07-18  456  
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  457  	/*
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  458  	 * Make sure that pre-populating the pmds is atomic with
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  459  	 * respect to anything walking the pgd_list, so that they
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  460  	 * never see a partially populated pgd.
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  461  	 */
a79e53d85683c6 Andrea Arcangeli    2011-02-16  462  	spin_lock(&pgd_lock);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  463  
617d34d9e5d832 Jeremy Fitzhardinge 2010-09-21  464  	pgd_ctor(mm, pgd);
25226df4b9be7f Gustavo A. R. Silva 2022-09-21  465  	if (sizeof(pmds) != 0)
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  466  		pgd_prepopulate_pmd(mm, pgd, pmds);
25226df4b9be7f Gustavo A. R. Silva 2022-09-21  467  
25226df4b9be7f Gustavo A. R. Silva 2022-09-21  468  	if (sizeof(u_pmds) != 0)
f59dbe9ca6707e Joerg Roedel        2018-07-18  469  		pgd_prepopulate_user_pmd(mm, pgd, u_pmds);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  470  
a79e53d85683c6 Andrea Arcangeli    2011-02-16  471  	spin_unlock(&pgd_lock);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  472  
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  473  	return pgd;
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  474  
f59dbe9ca6707e Joerg Roedel        2018-07-18  475  out_free_user_pmds:
25226df4b9be7f Gustavo A. R. Silva 2022-09-21  476  	if (sizeof(u_pmds) != 0)
f59dbe9ca6707e Joerg Roedel        2018-07-18  477  		free_pmds(mm, u_pmds, PREALLOCATED_USER_PMDS);
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  478  out_free_pmds:
25226df4b9be7f Gustavo A. R. Silva 2022-09-21  479  	if (sizeof(pmds) != 0)
f59dbe9ca6707e Joerg Roedel        2018-07-18  480  		free_pmds(mm, pmds, PREALLOCATED_PMDS);
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  481  out_free_pgd:
1db491f77b6ed0 Fenghua Yu          2015-01-15  482  	_pgd_free(pgd);
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  483  out:
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  484  	return NULL;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  485  }
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  486  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
