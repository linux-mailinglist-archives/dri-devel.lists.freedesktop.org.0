Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F544F01D8
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 14:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A330B10E28D;
	Sat,  2 Apr 2022 12:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177CF10E15F;
 Sat,  2 Apr 2022 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648904393; x=1680440393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JKHZCq1zZpc8Ag4MijnRimmNpi//wqM7iuPsc5qyXqQ=;
 b=SW/blPeIzOI4QXnOM0zg1BFuo8WBjDLTc8dGEUC2mw1uTpBZhJvECPxM
 K7BoAs20T/C8qmY6A0i11VlS8WG9vjuqygCqszuYGN3rDBb4bscvMQ1zU
 7CYFkFowA7Z2UBsJnledsXJ2yIpZyUVHL6hpa0qGB8rJ0F83Up+E+FFZT
 icHVblMKmz5K+ekPAc51P8BRX1dSGq7FA6BYE47dQMqHSOmKHuLCbYO4E
 xm5JnBrHD3hmaevwaNYYPSqjU3TB6EuESFQmLETsXTjAyh1EOV7sVWVjN
 n7BrHWDxocM8ohvZwwZdYWaASVze33/gZ3bs6CVdLG7u2ZFdKcPES6uh6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="259128218"
X-IronPort-AV: E=Sophos;i="5.90,230,1643702400"; d="scan'208";a="259128218"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2022 05:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,230,1643702400"; d="scan'208";a="504453130"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 02 Apr 2022 05:59:49 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nadM4-00009Z-UU;
 Sat, 02 Apr 2022 12:59:48 +0000
Date: Sat, 2 Apr 2022 20:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH v8 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Message-ID: <202204022008.nct9WUkc-lkp@intel.com>
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
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220402/202204022008.nct9WUkc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/eeae6480610a35a271461e864f84540d6849d8d6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhi-Wang/Refactor-GVT-g-MMIO-tracking-table-and-handlers/20220401-210319
        git checkout eeae6480610a35a271461e864f84540d6849d8d6
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

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
   drivers/gpu/drm/i915/gvt/mmio.h:74:15: error: conflicting types for 'intel_gvt_get_device_type'; have 'long unsigned int(struct intel_gvt *)'
      74 | unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gvt/gvt.h:39,
                    from <command-line>:
   drivers/gpu/drm/i915/intel_gvt.h:66:15: note: previous definition of 'intel_gvt_get_device_type' with type 'long unsigned int(struct drm_i915_private *)'
      66 | unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from <command-line>:
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
