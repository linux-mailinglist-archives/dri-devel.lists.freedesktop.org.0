Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 412596E1151
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 17:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3AD10E157;
	Thu, 13 Apr 2023 15:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF63A10E157
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681400399; x=1712936399;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AoLGypafLX9NAuBfVTUVj9m67WG5JbctYwofsqzrUwY=;
 b=Z3Ve3D88fE84issYqBRFUENU1yCypQLbbBRaQAnQxboiiQEdFvphB8Zi
 R/1aQIrZrsQ304aOEIth5zypWe+1EVahAoZJdmcBcw6v8YrG2d13s33SK
 nf6faiiwlMnwGyh0p83kN1IO+MSrmkeEqS+lcloKXlioRmr4ENiKRT1am
 11fB+SJAWyc1ZdIVGxygQnx5+Tl8k60DFiHYSMPxzxjvDDNbUWMgFjtsC
 mombuKVRJOtJbPbqWRE2u1bEayaPYQNb1lqNtEpk0I7wKrcb892vd0d5K
 PmrP/EylbOrmVLwA8VvvNyXLz2tMuyhl5hYDzLrH2G8g4pHTQ/DyVpqIa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="341711365"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="341711365"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 08:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692005071"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="692005071"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2023 08:39:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pmz3B-000YmL-02;
 Thu, 13 Apr 2023 15:39:53 +0000
Date: Thu, 13 Apr 2023 23:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, stanislaw.gruszka@linux.intel.com,
 ogabbay@kernel.org, quic_jhugo@quicinc.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mwen@igalia.com, maxime@cerno.tech,
 wambui.karugax@gmail.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/debugfs: rework debugfs directory creation v3
Message-ID: <202304132344.9oz5dfJI-lkp@intel.com>
References: <20230412145206.2483-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412145206.2483-3-christian.koenig@amd.com>
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes tegra/for-next linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-debugfs-rework-debugfs-directory-creation-v3/20230412-235231
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230412145206.2483-3-christian.koenig%40amd.com
patch subject: [PATCH 2/5] drm/debugfs: rework debugfs directory creation v3
config: hexagon-randconfig-r002-20230409 (https://download.01.org/0day-ci/archive/20230413/202304132344.9oz5dfJI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/92a7a4f0fd59d427c5827c323692b76095f90efc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-debugfs-rework-debugfs-directory-creation-v3/20230412-235231
        git checkout 92a7a4f0fd59d427c5827c323692b76095f90efc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132344.9oz5dfJI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_drv.c:38:
   In file included from include/drm/drm_accel.h:11:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/drm_drv.c:38:
   In file included from include/drm/drm_accel.h:11:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/drm_drv.c:38:
   In file included from include/drm/drm_accel.h:11:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/gpu/drm/drm_drv.c:1011:2: error: call to undeclared function 'drm_debugfs_dev_fini'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           drm_debugfs_dev_fini(dev);
           ^
   drivers/gpu/drm/drm_drv.c:1011:2: note: did you mean 'drm_debugfs_dev_init'?
   include/drm/drm_drv.h:596:13: note: 'drm_debugfs_dev_init' declared here
   static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
               ^
   6 warnings and 1 error generated.


vim +/drm_debugfs_dev_fini +1011 drivers/gpu/drm/drm_drv.c

   974	
   975	/**
   976	 * drm_dev_unregister - Unregister DRM device
   977	 * @dev: Device to unregister
   978	 *
   979	 * Unregister the DRM device from the system. This does the reverse of
   980	 * drm_dev_register() but does not deallocate the device. The caller must call
   981	 * drm_dev_put() to drop their final reference.
   982	 *
   983	 * A special form of unregistering for hotpluggable devices is drm_dev_unplug(),
   984	 * which can be called while there are still open users of @dev.
   985	 *
   986	 * This should be called first in the device teardown code to make sure
   987	 * userspace can't access the device instance any more.
   988	 */
   989	void drm_dev_unregister(struct drm_device *dev)
   990	{
   991		if (drm_core_check_feature(dev, DRIVER_LEGACY))
   992			drm_lastclose(dev);
   993	
   994		dev->registered = false;
   995	
   996		drm_client_dev_unregister(dev);
   997	
   998		if (drm_core_check_feature(dev, DRIVER_MODESET))
   999			drm_modeset_unregister_all(dev);
  1000	
  1001		if (dev->driver->unload)
  1002			dev->driver->unload(dev);
  1003	
  1004		drm_legacy_pci_agp_destroy(dev);
  1005		drm_legacy_rmmaps(dev);
  1006	
  1007		remove_compat_control_link(dev);
  1008		drm_minor_unregister(dev, DRM_MINOR_ACCEL);
  1009		drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
  1010		drm_minor_unregister(dev, DRM_MINOR_RENDER);
> 1011		drm_debugfs_dev_fini(dev);
  1012	}
  1013	EXPORT_SYMBOL(drm_dev_unregister);
  1014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
