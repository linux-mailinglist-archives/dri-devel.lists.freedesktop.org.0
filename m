Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C87F5188
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 21:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CF710E308;
	Wed, 22 Nov 2023 20:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EE910E300;
 Wed, 22 Nov 2023 20:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700684634; x=1732220634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0hV/4dxSkvkv58x8jhfB0rBCjxCGhFBbb9yCA58ugb0=;
 b=UNJgjvZb7vUq1KKwQU3PD8fQHKHqZmgs6rAlHTShhsfRaGipMo7drniz
 YtWRp3gVHwmrW/Ud37ID7o4f06+WDzRclmKqro37g631ffCfH4jjEJR6I
 GXxn8s4tF6GanbeTETumPqL3O+edh+W1p3q4LWcwWRfNFczGZUvXSs4hH
 +EI9gTr8ff5NawMzQQpfoluhH9LRPg3ZH8e3e0s2m8WaAxDbfgBD+VXzn
 rMMFBQNwZra7278Cx/RmLzwdoAdGrbBARdYbTuBAAfWOo34Tx1U8zDcTq
 OGpTDAnZw8o4uTFuIoi1Mfg6eOR3WwW+/czOjRPjqKvtov+ymGBeZxujf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389295085"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="389295085"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:23:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="940392899"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="940392899"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 22 Nov 2023 12:23:48 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r5tlC-0000qp-1t;
 Wed, 22 Nov 2023 20:23:46 +0000
Date: Thu, 23 Nov 2023 04:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] riscv: Add support for kernel-mode FPU
Message-ID: <202311230215.DBFyWPqb-lkp@intel.com>
References: <20231122030621.3759313-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122030621.3759313-2-samuel.holland@sifive.com>
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
Cc: Pan Xinhui <Xinhui.Pan@amd.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel.holland@sifive.com>, amd-gfx@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/riscv-Add-support-for-kernel-mode-FPU/20231122-111015
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231122030621.3759313-2-samuel.holland%40sifive.com
patch subject: [PATCH 1/3] riscv: Add support for kernel-mode FPU
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20231123/202311230215.DBFyWPqb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230215.DBFyWPqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230215.DBFyWPqb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/process.c:229:19: error: use of undeclared identifier '__fstate_save'
     229 | EXPORT_SYMBOL_GPL(__fstate_save);
         |                   ^
>> arch/riscv/kernel/process.c:230:19: error: use of undeclared identifier '__fstate_restore'
     230 | EXPORT_SYMBOL_GPL(__fstate_restore);
         |                   ^
   2 errors generated.


vim +/__fstate_save +229 arch/riscv/kernel/process.c

   228	
 > 229	EXPORT_SYMBOL_GPL(__fstate_save);
 > 230	EXPORT_SYMBOL_GPL(__fstate_restore);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
