Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4A9097C7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 12:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B833D10E057;
	Sat, 15 Jun 2024 10:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzwnxC14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E82F10E08A;
 Sat, 15 Jun 2024 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718448931; x=1749984931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4pYquGYwdsVfDEQdJhskgow+4xUEyJc4fx7x9R6kzuw=;
 b=bzwnxC14cLcdw1sFjOgbg+IDWmxuv+vqPPL1FUSIlyCUzV3gDov+XjPc
 gapKGkjwjr3E3eOIo6/MJHi0FrhemZXxA65MeSmonyz3rq/xUcPgyxpYF
 EnArFEyZeBuJ8gKerSLsOgyQPrL/Jf/bLEanvG4Fr0tk1UWgDfhcKO/d4
 +VujSMZIE7JKSYp+nrooiZmGEHTaE8zNunKGoGTx42PdVKeWQO9888UEy
 WFfgbej3GtdxD7C7bc2mgGh4uJD0prCjIS3nELJr8BUEbgnRvVJ8bAHqa
 GhAQEvgUD5z8L+o86tmmDg7uh3LAftbtnh57VXMzB4avLW3PmhnbDkTUc A==;
X-CSE-ConnectionGUID: jwCz26DgQzqF7/Ye0CHmxQ==
X-CSE-MsgGUID: 9D8QZCpJQ9mWhHDkxTWPJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19124935"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="19124935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2024 03:55:26 -0700
X-CSE-ConnectionGUID: NFhIhx1KSbWYtNhlCI9fow==
X-CSE-MsgGUID: h4QgHNloRnyHfr6HsfmoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="78234077"
Received: from lkp-server01.sh.intel.com (HELO 0bcb674f05cd) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 15 Jun 2024 03:55:24 -0700
Received: from kbuild by 0bcb674f05cd with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sIR45-00006A-2d;
 Sat, 15 Jun 2024 10:55:21 +0000
Date: Sat, 15 Jun 2024 18:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 09/12] drm/ttm/pool: Provide a helper to shrink pages
Message-ID: <202406151828.dncRRcNZ-lkp@intel.com>
References: <20240614102548.4364-10-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614102548.4364-10-thomas.hellstrom@linux.intel.com>
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
[also build test WARNING on next-20240613]
[cannot apply to linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240614-182911
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240614102548.4364-10-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v4 09/12] drm/ttm/pool: Provide a helper to shrink pages
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240615/202406151828.dncRRcNZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151828.dncRRcNZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151828.dncRRcNZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_pool.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction


objdump-func vmlinux.o __jump_table:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
