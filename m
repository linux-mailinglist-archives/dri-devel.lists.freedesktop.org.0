Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65392475C71
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 16:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F24E10E66D;
	Wed, 15 Dec 2021 15:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1598310E5C3;
 Wed, 15 Dec 2021 15:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639583828; x=1671119828;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A6szhfY6Suo6BYmthU5AH6lElsFjCSbSH0NgSC8V9KY=;
 b=RWhjq+2N7g+D1plquaNCVkDEsid2st+JgfaJtfZgtI1SifkjPNeQX9Eq
 lmgUjoiBocXMsG1K2C3q7a7r1rpLvZUv8iV16Pjx3l2MFG7FKgd9B770a
 PKRXTeFFV9HtuUal316IhW+E3Zz+jS3aIWiG6GbDHYDlo1Thl6XWLsTs7
 1dDtRFA9YirlLxCF6KSaou+J+U6tAQviK+Xd/Xs/GskirjN/yAfU9rRTS
 8QiQs8PAICIN9kYpTGuyk3qQVTcTNPi09N1wnS1Kdl4czBEXHLjeirbK8
 8JftteLuJExZl89kV6XzwMTgeBU7MChVaqxmCEfE4f2qHwDCj8Lo1xic7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="263410677"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="263410677"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 07:57:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="465648261"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 15 Dec 2021 07:57:05 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxWeP-0001za-51; Wed, 15 Dec 2021 15:57:05 +0000
Date: Wed, 15 Dec 2021 23:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/7] drm/i915: Use struct vma_resource instead of struct
 vma_snapshot
Message-ID: <202112152305.rfWVQjLs-lkp@intel.com>
References: <20211215103611.777665-8-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215103611.777665-8-thomas.hellstrom@linux.intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Thomas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on next-20211214]
[cannot apply to drm-exynos/exynos-drm-next drm/drm-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-r002-20211214 (https://download.01.org/0day-ci/archive/20211215/202112152305.rfWVQjLs-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/ede025870be746e37b5bcde123cdf741aa685fab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
        git checkout ede025870be746e37b5bcde123cdf741aa685fab
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_request.h:43,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:30,
                    from drivers/gpu/drm/i915/i915_vma.c:28:
   drivers/gpu/drm/i915/i915_vma_resource.h:176:15: error: 'struct intel_memory_region' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     176 |        struct intel_memory_region *mr,
         |               ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_vma.c: In function 'i915_vma_resource_init_from_vma':
>> drivers/gpu/drm/i915/i915_vma.c:394:48: error: passing argument 8 of 'i915_vma_resource_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
     394 |           i915_gem_object_is_lmem(obj), obj->mm.region,
         |                                         ~~~~~~~^~~~~~~
         |                                                |
         |                                                struct intel_memory_region *
   In file included from drivers/gpu/drm/i915/i915_request.h:43,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:30,
                    from drivers/gpu/drm/i915/i915_vma.c:28:
   drivers/gpu/drm/i915/i915_vma_resource.h:176:36: note: expected 'struct intel_memory_region *' but argument is of type 'struct intel_memory_region *'
     176 |        struct intel_memory_region *mr,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   cc1: all warnings being treated as errors


vim +/i915_vma_resource_init +394 drivers/gpu/drm/i915/i915_vma.c

   385	
   386	I915_SELFTEST_EXPORT void
   387	i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
   388					struct i915_vma *vma)
   389	{
   390		struct drm_i915_gem_object *obj = vma->obj;
   391	
   392		i915_vma_resource_init(vma_res, vma->vm, vma->pages, &vma->page_sizes,
   393				       obj->mm.rsgt, i915_gem_object_is_readonly(obj),
 > 394				       i915_gem_object_is_lmem(obj), obj->mm.region,
   395				       vma->ops, vma->private, vma->node.start,
   396				       vma->node.size, vma->size);
   397	}
   398	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
