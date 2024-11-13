Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16BE9C7E69
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 23:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D631D10E74D;
	Wed, 13 Nov 2024 22:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEhZraRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FC310E74D;
 Wed, 13 Nov 2024 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731538248; x=1763074248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y2Fk0Pazim2y/9EDcvj6rZCzPdkv14iN01Tnh1nG1fI=;
 b=IEhZraRy490xJzi9dMYZWCHWSlECcZOoIKZdkK4bPxxb8twVPv/DfmIk
 E/KsHk+AkKFKlU+hrdlzPRkFoccktE7cr5H4VBNoBzoO35g6L+cgQg3Hs
 Yc8IEpO6b/QUMYwIjUtbxs43F6a0A5sgpYMZuxkZjpfSykc0c/0hf2x1b
 3sUv6ZTVYGEn1ny0WMtsvojt8IPkWqD/iWC4FUlCTBwaD1XOVbjkyeFZQ
 1QmDAFGOAPHolJIBB8dq2oLGMI9Hhwv9TTvjgqDi/+cvFc8odIG5B7N2i
 uhFD5qAPNVtA3VDqXDSLiVxHyPaF9wzYyfZk6WtNUh0jsVWhjsq25t+eM w==;
X-CSE-ConnectionGUID: 7pg5ZgNpR6uYu8ucJY+k9A==
X-CSE-MsgGUID: hGA/g0OkTQuYKXC8XXF/HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30862592"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="30862592"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 14:50:47 -0800
X-CSE-ConnectionGUID: ekTj//LXTtKoYNP8Euh5pw==
X-CSE-MsgGUID: UJA+x4OiSQ2xFeq09IDLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="88806296"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 13 Nov 2024 14:50:45 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tBMCB-0000nx-0M;
 Wed, 13 Nov 2024 22:50:43 +0000
Date: Thu, 14 Nov 2024 06:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v13 2/8] drm/ttm: Provide a shmem backup implementation
Message-ID: <202411140637.T225Mshs-lkp@intel.com>
References: <20241113183550.6228-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113183550.6228-3-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Balance-ttm_resource_cursor_init-and-ttm_resource_cursor_fini/20241114-023727
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241113183550.6228-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v13 2/8] drm/ttm: Provide a shmem backup implementation
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241114/202411140637.T225Mshs-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140637.T225Mshs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140637.T225Mshs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_backup.c:172: warning: expecting prototype for ttm_backup_shmem_bytes_avail(). Prototype was for ttm_backup_bytes_avail() instead


vim +172 drivers/gpu/drm/ttm/ttm_backup.c

   161	
   162	/**
   163	 * ttm_backup_shmem_bytes_avail() - Report the approximate number of bytes of backup space
   164	 * left for backup.
   165	 *
   166	 * This function is intended also for driver use to indicate whether a
   167	 * backup attempt is meaningful.
   168	 *
   169	 * Return: An approximate size of backup space available.
   170	 */
   171	u64 ttm_backup_bytes_avail(void)
 > 172	{
   173		/*
   174		 * The idea behind backing up to shmem is that shmem objects may
   175		 * eventually be swapped out. So no point swapping out if there
   176		 * is no or low swap-space available. But the accuracy of this
   177		 * number also depends on shmem actually swapping out backed-up
   178		 * shmem objects without too much buffering.
   179		 */
   180		return (u64)get_nr_swap_pages() << PAGE_SHIFT;
   181	}
   182	EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
