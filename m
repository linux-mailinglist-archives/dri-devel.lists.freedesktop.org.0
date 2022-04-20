Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C02965084B5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 11:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1083D10E378;
	Wed, 20 Apr 2022 09:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ECA10E192;
 Wed, 20 Apr 2022 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650446242; x=1681982242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ALSkC4Dl0w89PKZV5w9BwHLZswIiZF/b1MyNqhvzPBM=;
 b=RA9rcjXbHCfk8sPjAp10XAiOHKh+DYTsY4PnSDcnJ5CPUUtU5sZFdrTG
 5Xnk08dFr5QB7pHz0PONe/qJDT8EeWSoi1yj54bvlVC6e7LZdwK3eHg66
 WIld7XXQoeAbqwGDsWRv0V3mBYcsAwQrP8J2N7RIERfCgZEfJskhG4lq+
 3Mvwj2CE/u6fZIfREEtWzMdOYWuccmB/Cp8yihaZi9B7Mt1CEkLV5KrzK
 HUL1w7oiz9J/9nDzlngSgrm8DfUIhtwi2eo2IK+tl/Csxrtmq/YhjlvnP
 8Dmp+psBvM68IJGdRMup5I+jYtIWq4sQKqN0TsPLzlclI9R3d/giVnKGP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="243914625"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="243914625"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 02:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="863372211"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2022 02:17:20 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nh6SY-0006oI-FV;
 Wed, 20 Apr 2022 09:17:14 +0000
Date: Wed, 20 Apr 2022 17:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix race in __i915_vma_remove_closed
Message-ID: <202204201724.hgR7L8YU-lkp@intel.com>
References: <20220419234436.2638649-1-kherbst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419234436.2638649-1-kherbst@redhat.com>
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
Cc: kbuild-all@lists.01.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karol,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v5.18-rc3 next-20220419]
[cannot apply to drm-intel/for-linux-next linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Karol-Herbst/drm-i915-Fix-race-in-__i915_vma_remove_closed/20220420-074525
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220420/202204201724.hgR7L8YU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/50a17180127b7d2527ee9a8f5c9e8207e158afb6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Karol-Herbst/drm-i915-Fix-race-in-__i915_vma_remove_closed/20220420-074525
        git checkout 50a17180127b7d2527ee9a8f5c9e8207e158afb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma.c:1654:19: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           struct intel_gt *gt = vma->vm->gt;
                            ^
   1 warning generated.


vim +1654 drivers/gpu/drm/i915/i915_vma.c

  1640	
  1641	static void release_references(struct i915_vma *vma, bool vm_ddestroy)
  1642	{
  1643		struct drm_i915_gem_object *obj = vma->obj;
  1644	
  1645		GEM_BUG_ON(i915_vma_is_active(vma));
  1646	
  1647		spin_lock(&obj->vma.lock);
  1648		list_del(&vma->obj_link);
  1649		if (!RB_EMPTY_NODE(&vma->obj_node))
  1650			rb_erase(&vma->obj_node, &obj->vma.tree);
  1651	
  1652		spin_unlock(&obj->vma.lock);
  1653	
> 1654		struct intel_gt *gt = vma->vm->gt;
  1655	
  1656		spin_lock_irq(&gt->closed_lock);
  1657		__i915_vma_remove_closed(vma);
  1658		spin_unlock_irq(&gt->closed_lock);
  1659	
  1660		if (vm_ddestroy)
  1661			i915_vm_resv_put(vma->vm);
  1662	
  1663		i915_active_fini(&vma->active);
  1664		GEM_WARN_ON(vma->resource);
  1665		i915_vma_free(vma);
  1666	}
  1667	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
