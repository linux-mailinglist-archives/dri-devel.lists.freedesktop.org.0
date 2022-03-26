Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DCC4E7E46
	for <lists+dri-devel@lfdr.de>; Sat, 26 Mar 2022 01:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0D410E15C;
	Sat, 26 Mar 2022 00:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6BA10E0D0;
 Sat, 26 Mar 2022 00:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648256346; x=1679792346;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TRUVCM/aMJLPA+tAMYWt4cWZ/SwbCEkOWrhrehVr6CY=;
 b=Zr1mAvcpfG4vo98rWInKeD+2aFPAxGaWmnaKj7Zpbouzm/K2aS6Jcpq9
 mSYmyGwJPvHVYXNugRzEC7Zua9PQjKC+F8+RFHeJWDDEXnRJ6dB2DZUKA
 Ih1tIuh5oW4DZaG7qcpwm6dGqO0Kfc0V+8Bce/95uVkdv5Ez7x5FRl54Q
 PsHFU3hKyeIFQbWb5yFyPz0MoWhiwlIdqJ34x4C95w8cuRxBOq3HgsdEW
 UtbZm10bkHPqfD+4XiF/jYvtj5tx6H3JacXD3u/2xC9edtzaqaPGFBNTx
 8ic3vJ8eW/ODTJX3lE3zIgTbAXTIKsdWuLDwn/s49+a2KzDhW8P+jpWWp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="321937758"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="321937758"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 17:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="584637760"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 25 Mar 2022 17:59:02 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nXulh-000Mp8-SB; Sat, 26 Mar 2022 00:59:01 +0000
Date: Sat, 26 Mar 2022 08:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Message-ID: <202203260829.JUQaTzGt-lkp@intel.com>
References: <20220325175251.167164-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325175251.167164-1-zhi.a.wang@intel.com>
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>, kbuild-all@lists.01.org,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhi,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm/drm-next next-20220325]
[cannot apply to tegra-drm/drm/tegra/for-next airlied/drm-next v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhi-Wang/i915-gvt-Separate-the-MMIO-tracking-table-from-GVT-g/20220326-015627
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20220326/202203260829.JUQaTzGt-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/8203f91121efdcc910bde0bc4fe5ea678bdaaa5b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zhi-Wang/i915-gvt-Separate-the-MMIO-tracking-table-from-GVT-g/20220326-015627
        git checkout 8203f91121efdcc910bde0bc4fe5ea678bdaaa5b
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_driver.c:92:
>> drivers/gpu/drm/i915/intel_gvt.h:66:15: error: no previous prototype for 'intel_gvt_get_device_type' [-Werror=missing-prototypes]
      66 | unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_gvt.h:71:41: error: 'struct intel_gvt_mmio_table_iter' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      71 | int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/intel_gvt.h:71:5: error: no previous prototype for 'intel_gvt_iterate_mmio_table' [-Werror=missing-prototypes]
      71 | int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/gpu/drm/i915/gvt/gvt.h:39,
                    from <command-line>:
>> drivers/gpu/drm/i915/intel_gvt.h:66:15: error: no previous prototype for 'intel_gvt_get_device_type' [-Werror=missing-prototypes]
      66 | unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_gvt.h:71:41: error: 'struct intel_gvt_mmio_table_iter' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      71 | int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/intel_gvt.h:71:5: error: no previous prototype for 'intel_gvt_iterate_mmio_table' [-Werror=missing-prototypes]
      71 | int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gvt/gvt.h:43,
                    from <command-line>:
>> drivers/gpu/drm/i915/gvt/mmio.h:74:15: error: conflicting types for 'intel_gvt_get_device_type'
      74 | unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gvt/gvt.h:39,
                    from <command-line>:
   drivers/gpu/drm/i915/intel_gvt.h:66:15: note: previous definition of 'intel_gvt_get_device_type' was here
      66 | unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/intel_gvt_get_device_type +66 drivers/gpu/drm/i915/intel_gvt.h

    65	
  > 66	unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
    67	{
    68		return 0;
    69	}
    70	
  > 71	int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
    72	{
    73		return 0;
    74	}
    75	#endif
    76	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
