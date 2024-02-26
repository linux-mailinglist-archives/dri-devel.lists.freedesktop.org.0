Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F9986724A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7A310E31D;
	Mon, 26 Feb 2024 10:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0YWAJyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CC610E31D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708945028; x=1740481028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4CBBW4ZBYHjYKmvJucsk9myJi964v26M/utBchas9+0=;
 b=H0YWAJynERB2puwmMKXcrpsECDKaO0h+bRu75wC4fjH9s0S91qWB8rwA
 ydp3SL8ZWyeOQcNkXS0pmCTFCQJ90SLBUtiDlp3IxlUpOhvQkNV7KE4mH
 N2dnl3yGD3kVaDJADrg7mfT4L6gyJ9FHMW/DOYj0uL2lfH84Z/2DMd7Nv
 uX8TztPRreEWGdusvkcdpzyKgLyiISW5FN9YvQLkIjpuJdkxoJGMAC52V
 qORGOfaMnMRgJgP84wUOmR0EUPxHwF3KJYYIdHOBice8ZsdRib2qtS84l
 5KZKfxWO9WkakSm9/8/wpd13VhcTE5jpDr4orw51EWJtJmCOsoPmsig0I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13918354"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="13918354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:57:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6829018"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2024 02:57:03 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1reYfN-000AGB-18;
 Mon, 26 Feb 2024 10:57:01 +0000
Date: Mon, 26 Feb 2024 18:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <David.Laight@aculab.com>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 'Netdev' <netdev@vger.kernel.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>
Cc: oe-kbuild-all@lists.linux.dev, 'Jens Axboe' <axboe@kernel.dk>,
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
Message-ID: <202402261802.9ShoXRwY-lkp@intel.com>
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
config: i386-randconfig-011-20240226 (https://download.01.org/0day-ci/archive/20240226/202402261802.9ShoXRwY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261802.9ShoXRwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261802.9ShoXRwY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/pgtable.c: In function 'pgd_alloc':
>> arch/x86/mm/pgtable.c:437:9: warning: ISO C90 forbids variable length array 'pmds' [-Wvla]
     437 |         pmd_t *pmds[MAX_PREALLOCATED_PMDS];
         |         ^~~~~


vim +/pmds +437 arch/x86/mm/pgtable.c

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
