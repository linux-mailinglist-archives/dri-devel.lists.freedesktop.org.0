Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1A473160
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7426810E76E;
	Mon, 13 Dec 2021 16:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5B510E741;
 Mon, 13 Dec 2021 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639412071; x=1670948071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6+QrT9PT0z1rtduUNr8ZmGIGhH54pt3OP/+NNkLfl0U=;
 b=k8DoblDzR19iMF1A6vayVecpYpAbBS+uze8NJoqD97QKwVKOxVyAuH6+
 3S+e0Epu5q2OtRPy1jEbZTiRfWhcxEyPhlUdhqFW+3w3nplwlfbtT3p7O
 2MkiICHeHZ73VolpHVnRqwAzV4RIA5G4t9cp2eNBdq15UhYqXJp6OZFko
 a45Esg/0Q6NbrEE7BH5F4xWN7RC6xcRhDTSBpZpz8yPhj1Rlr3p8/R3Lx
 AJ9OUIDpZ4fiQoQV3bq4kaxweiFHc/datvwHkKEuyGt500lIha3I8CBfa
 edVjOsbFOVe0xTBBzEP4kPNpDzfMIN2vx/SArx9CNM2BR2CtBOpL18g3m A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="302147522"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="302147522"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 08:12:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="613879560"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 13 Dec 2021 08:12:50 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mwnwY-0006ov-0u; Mon, 13 Dec 2021 16:12:50 +0000
Date: Tue, 14 Dec 2021 00:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RESEND v7 12/12] drm/i915: Move the GGTT from i915
 private data to the GT
Message-ID: <202112132358.IwEcWeWW-lkp@intel.com>
References: <20211212152117.118428-13-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211212152117.118428-13-andi.shyti@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 llvm@lists.linux.dev, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>,
 kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on drm/drm-next]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andi-Shyti/More-preparation-for-multi-gt-patches/20211212-232416
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a003-20211213 (https://download.01.org/0day-ci/archive/20211213/202112132358.IwEcWeWW-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/98ef49d710790dda7a193c10b5b7f28516f730bc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andi-Shyti/More-preparation-for-multi-gt-patches/20211212-232416
        git checkout 98ef49d710790dda7a193c10b5b7f28516f730bc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gvt/gtt.c:321:25: error: passing 'struct i915_ggtt' to parameter of incompatible type 'struct i915_ggtt *'; take the address with &
                   e->val64 = read_pte64(vgpu->gvt->gt->ggtt, index);
                                         ^~~~~~~~~~~~~~~~~~~
                                         &
   drivers/gpu/drm/i915/gvt/gtt.c:282:41: note: passing argument to parameter 'ggtt' here
   static u64 read_pte64(struct i915_ggtt *ggtt, unsigned long index)
                                           ^
   drivers/gpu/drm/i915/gvt/gtt.c:346:15: error: passing 'struct i915_ggtt' to parameter of incompatible type 'struct i915_ggtt *'; take the address with &
                   write_pte64(vgpu->gvt->gt->ggtt, index, e->val64);
                               ^~~~~~~~~~~~~~~~~~~
                               &
   drivers/gpu/drm/i915/gvt/gtt.c:296:43: note: passing argument to parameter 'ggtt' here
   static void write_pte64(struct i915_ggtt *ggtt, unsigned long index, u64 pte)
                                             ^
   drivers/gpu/drm/i915/gvt/gtt.c:2900:17: error: passing 'struct i915_ggtt' to parameter of incompatible type 'struct i915_ggtt *'; take the address with &
                                   write_pte64(vgpu->gvt->gt->ggtt, offset + idx, pte);
                                               ^~~~~~~~~~~~~~~~~~~
                                               &
   drivers/gpu/drm/i915/gvt/gtt.c:296:43: note: passing argument to parameter 'ggtt' here
   static void write_pte64(struct i915_ggtt *ggtt, unsigned long index, u64 pte)
                                             ^
   drivers/gpu/drm/i915/gvt/gtt.c:2908:17: error: passing 'struct i915_ggtt' to parameter of incompatible type 'struct i915_ggtt *'; take the address with &
                                   write_pte64(vgpu->gvt->gt->ggtt, offset + idx, pte);
                                               ^~~~~~~~~~~~~~~~~~~
                                               &
   drivers/gpu/drm/i915/gvt/gtt.c:296:43: note: passing argument to parameter 'ggtt' here
   static void write_pte64(struct i915_ggtt *ggtt, unsigned long index, u64 pte)
                                             ^
   4 errors generated.


vim +321 drivers/gpu/drm/i915/gvt/gtt.c

2707e44466881d Zhi Wang     2016-03-28  302  
4b2dbbc22541e4 Changbin Du  2017-08-02  303  static inline int gtt_get_entry64(void *pt,
2707e44466881d Zhi Wang     2016-03-28  304  		struct intel_gvt_gtt_entry *e,
2707e44466881d Zhi Wang     2016-03-28  305  		unsigned long index, bool hypervisor_access, unsigned long gpa,
2707e44466881d Zhi Wang     2016-03-28  306  		struct intel_vgpu *vgpu)
2707e44466881d Zhi Wang     2016-03-28  307  {
2707e44466881d Zhi Wang     2016-03-28  308  	const struct intel_gvt_device_info *info = &vgpu->gvt->device_info;
2707e44466881d Zhi Wang     2016-03-28  309  	int ret;
2707e44466881d Zhi Wang     2016-03-28  310  
2707e44466881d Zhi Wang     2016-03-28  311  	if (WARN_ON(info->gtt_entry_size != 8))
4b2dbbc22541e4 Changbin Du  2017-08-02  312  		return -EINVAL;
2707e44466881d Zhi Wang     2016-03-28  313  
2707e44466881d Zhi Wang     2016-03-28  314  	if (hypervisor_access) {
2707e44466881d Zhi Wang     2016-03-28  315  		ret = intel_gvt_hypervisor_read_gpa(vgpu, gpa +
2707e44466881d Zhi Wang     2016-03-28  316  				(index << info->gtt_entry_size_shift),
2707e44466881d Zhi Wang     2016-03-28  317  				&e->val64, 8);
4b2dbbc22541e4 Changbin Du  2017-08-02  318  		if (WARN_ON(ret))
4b2dbbc22541e4 Changbin Du  2017-08-02  319  			return ret;
2707e44466881d Zhi Wang     2016-03-28  320  	} else if (!pt) {
a61ac1e75105a0 Chris Wilson 2020-03-06 @321  		e->val64 = read_pte64(vgpu->gvt->gt->ggtt, index);
2707e44466881d Zhi Wang     2016-03-28  322  	} else {
2707e44466881d Zhi Wang     2016-03-28  323  		e->val64 = *((u64 *)pt + index);
2707e44466881d Zhi Wang     2016-03-28  324  	}
4b2dbbc22541e4 Changbin Du  2017-08-02  325  	return 0;
2707e44466881d Zhi Wang     2016-03-28  326  }
2707e44466881d Zhi Wang     2016-03-28  327  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
