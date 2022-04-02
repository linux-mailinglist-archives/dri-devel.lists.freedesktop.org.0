Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0661A4EFF8C
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 10:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113DB10E5B8;
	Sat,  2 Apr 2022 08:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D1810E282;
 Sat,  2 Apr 2022 08:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648887172; x=1680423172;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9nakgVIZsBk8MoVNmlFRigUOZ3RgRXBKut7mIr/t7TY=;
 b=UmdBlHSXLywanxXZGhndjREEbUeh44fuifCGuWGnNeIbzCC8WBlE/s7B
 yiE1ttg0WaMScngGXKCKzSm6lJbWw38+MXTTqVr5f2jvoJeyxLF097hkf
 NKOpoG4liaI81IoXJGN0fXu3b+M/Oxo+1lX18MybYfo6hMJOo/59XKTBX
 Mky1ygwyiH7X8pb8I2kHfENK2J7tY3xiZay6CSWoUNq6gMzveQg7xWxe5
 UuPJwSsa3B0yRiYrfxTaZfUcaXDxg5pdSjmbH6JtMZ47KXu6BdOq4ZBBl
 FWahyfUVVc5GBqk1m/uTb0y+e4lpfFSURkYI7vbwHpE3dwCqL7oEoF7Mm w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="247795758"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="247795758"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2022 01:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="504416562"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 02 Apr 2022 01:12:49 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1naYsK-00024e-A7;
 Sat, 02 Apr 2022 08:12:48 +0000
Date: Sat, 2 Apr 2022 16:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH v8 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Message-ID: <202204021603.W9Au0C65-lkp@intel.com>
References: <20220401130207.33944-2-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401130207.33944-2-zhi.a.wang@intel.com>
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
[also build test ERROR on drm-tip/drm-tip drm/drm-next next-20220401]
[cannot apply to tegra-drm/drm/tegra/for-next airlied/drm-next v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhi-Wang/Refactor-GVT-g-MMIO-tracking-table-and-handlers/20220401-210319
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20220402/202204021603.W9Au0C65-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/eeae6480610a35a271461e864f84540d6849d8d6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhi-Wang/Refactor-GVT-g-MMIO-tracking-table-and-handlers/20220401-210319
        git checkout eeae6480610a35a271461e864f84540d6849d8d6
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gvt/gvt.h:39,
                    from drivers/gpu/drm/i915/gvt/mpt.h:36,
                    from <command-line>:
   drivers/gpu/drm/i915/intel_gvt.h:66:15: error: no previous prototype for 'intel_gvt_get_device_type' [-Werror=missing-prototypes]
      66 | unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_gvt.h:71:41: error: 'struct intel_gvt_mmio_table_iter' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      71 | int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_gvt.h:71:5: error: no previous prototype for 'intel_gvt_iterate_mmio_table' [-Werror=missing-prototypes]
      71 | int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gvt/gvt.h:43,
                    from drivers/gpu/drm/i915/gvt/mpt.h:36,
                    from <command-line>:
>> drivers/gpu/drm/i915/gvt/mmio.h:74:15: error: conflicting types for 'intel_gvt_get_device_type'; have 'long unsigned int(struct intel_gvt *)'
      74 | unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gvt/gvt.h:39,
                    from drivers/gpu/drm/i915/gvt/mpt.h:36,
                    from <command-line>:
   drivers/gpu/drm/i915/intel_gvt.h:66:15: note: previous definition of 'intel_gvt_get_device_type' with type 'long unsigned int(struct drm_i915_private *)'
      66 | unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +74 drivers/gpu/drm/i915/gvt/mmio.h

12d14cc43b34706 Zhi Wang     2016-08-30  71  
8fde41076f6df53 Chris Wilson 2020-03-04  72  const struct intel_engine_cs *
8fde41076f6df53 Chris Wilson 2020-03-04  73  intel_gvt_render_mmio_to_engine(struct intel_gvt *gvt, unsigned int reg);
12d14cc43b34706 Zhi Wang     2016-08-30 @74  unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt);
12d14cc43b34706 Zhi Wang     2016-08-30  75  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
