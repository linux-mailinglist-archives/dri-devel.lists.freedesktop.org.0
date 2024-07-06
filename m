Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E009290BE
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 06:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B2C10E0FF;
	Sat,  6 Jul 2024 04:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtQ4eOvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37A010E0A6;
 Sat,  6 Jul 2024 04:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720241130; x=1751777130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Tn5abEdQ9CH4IR3iMV7Us+q6ibAi/T5jniKdfJH5yr0=;
 b=QtQ4eOvUmk7hhyx6wottMGMOrKZBxiVzpk6blb1R8BUGJk14ojU3WCVc
 4HNyyCSne/o6KYlKs0uhy2GR2u4oJYHFRQ4L5lu9v0MF6r0QSoW6cvTCz
 4WqRTJWELcK1WWwLZPzsmKgtvoBgq2QjBecGHF0pdk60TYlvxb3xMIa5z
 IZ+1nziOa8rU/HsNNClpVy2/GRPmutUo/N+Me4xixx4jnCRkg/fdCbefT
 cGpUZf1+fCrhTFWTK0sjiAeKv97Lq/WfoUFdF11ugwuvjMig7u/osg0lm
 7at3GtNO6ycMiUIzcILU3aLKZ7lTeemv1zukwQQ7w2UrQVHpWdvSB4JVR g==;
X-CSE-ConnectionGUID: pT8mNu3CRKuw1NlPavSDPA==
X-CSE-MsgGUID: PHzPRH4ST3a2FQaWUK8VmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17651327"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; d="scan'208";a="17651327"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 21:45:29 -0700
X-CSE-ConnectionGUID: VfCqaFR+Rrm30HFgsHAUFg==
X-CSE-MsgGUID: I/MDejYIQxO1dUASENMOIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; d="scan'208";a="84568015"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 05 Jul 2024 21:45:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sPxIa-000TJo-1I;
 Sat, 06 Jul 2024 04:45:24 +0000
Date: Sat, 6 Jul 2024 12:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 8/8] drm/ttm: Balance ttm_resource_cursor_init() and
 ttm_resource_cursor_fini()
Message-ID: <202407061220.4fu8rFR1-lkp@intel.com>
References: <20240705153206.68526-9-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705153206.68526-9-thomas.hellstrom@linux.intel.com>
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
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip next-20240703]
[cannot apply to drm-intel/for-linux-next-fixes drm-misc/drm-misc-next linus/master v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240706-050447
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240705153206.68526-9-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v7 8/8] drm/ttm: Balance ttm_resource_cursor_init() and ttm_resource_cursor_fini()
config: i386-buildonly-randconfig-001-20240706 (https://download.01.org/0day-ci/archive/20240706/202407061220.4fu8rFR1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061220.4fu8rFR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061220.4fu8rFR1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_resource.c:607: warning: Excess function parameter 'man' description in 'ttm_resource_manager_first'


vim +607 drivers/gpu/drm/ttm/ttm_resource.c

60e2bb1468a0ed Thomas Hellström 2024-07-05  593  
5d05b988f1c0fd Christian König  2021-06-08  594  /**
c3fc230689e1af Thomas Hellström 2024-07-05  595   * ttm_resource_manager_first() - Start iterating over the resources
c3fc230689e1af Thomas Hellström 2024-07-05  596   * of a resource manager
5d05b988f1c0fd Christian König  2021-06-08  597   * @man: resource manager to iterate over
5d05b988f1c0fd Christian König  2021-06-08  598   * @cursor: cursor to record the position
5d05b988f1c0fd Christian König  2021-06-08  599   *
c3fc230689e1af Thomas Hellström 2024-07-05  600   * Initializes the cursor and starts iterating. When done iterating,
c3fc230689e1af Thomas Hellström 2024-07-05  601   * the caller must explicitly call ttm_resource_cursor_fini().
c3fc230689e1af Thomas Hellström 2024-07-05  602   *
c3fc230689e1af Thomas Hellström 2024-07-05  603   * Return: The first resource from the resource manager.
5d05b988f1c0fd Christian König  2021-06-08  604   */
5d05b988f1c0fd Christian König  2021-06-08  605  struct ttm_resource *
c052d143fd54cf Thomas Hellström 2024-07-05  606  ttm_resource_manager_first(struct ttm_resource_cursor *cursor)
5d05b988f1c0fd Christian König  2021-06-08 @607  {
c052d143fd54cf Thomas Hellström 2024-07-05  608  	struct ttm_resource_manager *man = cursor->man;
5d05b988f1c0fd Christian König  2021-06-08  609  
c052d143fd54cf Thomas Hellström 2024-07-05  610  	if (WARN_ON_ONCE(!man))
c052d143fd54cf Thomas Hellström 2024-07-05  611  		return NULL;
c052d143fd54cf Thomas Hellström 2024-07-05  612  
c052d143fd54cf Thomas Hellström 2024-07-05  613  	lockdep_assert_held(&man->bdev->lru_lock);
c3fc230689e1af Thomas Hellström 2024-07-05  614  
c052d143fd54cf Thomas Hellström 2024-07-05  615  	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
1d19e02e4ccfef Thomas Hellström 2024-07-05  616  	return ttm_resource_manager_next(cursor);
5d05b988f1c0fd Christian König  2021-06-08  617  }
5d05b988f1c0fd Christian König  2021-06-08  618  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
