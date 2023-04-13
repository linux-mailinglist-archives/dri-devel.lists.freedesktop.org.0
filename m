Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5EF6E0C74
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 13:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EED110EAC4;
	Thu, 13 Apr 2023 11:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C8D10EACC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681385407; x=1712921407;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TW7DZwYAngC5+Nm9WQMS/VJ5iDejPiTfG0ly/S2pe0M=;
 b=XQQfglETywWaeWcdJ1k4gCj/HywDdiuRz3p+WQWf94E8DBZ8y64DHTg/
 tcLf18SN1F2RBPg9DST6kbbAvjRiRbyoF5VeIq+RFyBCuUc/G/gVJoP+C
 iXpUeAUlAACOICCwAiaYfHLqJoFRnC098HyftizU/xoh+rE0oWrYUeDiN
 ra6526pw7ah0MsR/kx9ykX8TQnh5sbkhijgRKZs+vUzE7q1VyBjvyfx/g
 ImKpwY5P9vWSZ2DxK08lQell8wYrsFq2AS8T1kQwj+HKtOHz0nI2nyIyk
 x8e+2YFyGCsyYNB4u4XUAHqASj6rIKjXtYqoV9AOgTvDOuv4sp2UH8En1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="323781274"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="323781274"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 04:29:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935562139"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="935562139"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2023 04:29:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pmv98-000Ydt-2z;
 Thu, 13 Apr 2023 11:29:46 +0000
Date: Thu, 13 Apr 2023 19:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, stanislaw.gruszka@linux.intel.com,
 ogabbay@kernel.org, quic_jhugo@quicinc.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mwen@igalia.com, maxime@cerno.tech,
 wambui.karugax@gmail.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/debugfs: rework debugfs directory creation v3
Message-ID: <202304131935.9BjNzso4-lkp@intel.com>
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
Cc: oe-kbuild-all@lists.linux.dev
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
config: arc-randconfig-r043-20230413 (https://download.01.org/0day-ci/archive/20230413/202304131935.9BjNzso4-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/92a7a4f0fd59d427c5827c323692b76095f90efc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-debugfs-rework-debugfs-directory-creation-v3/20230412-235231
        git checkout 92a7a4f0fd59d427c5827c323692b76095f90efc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131935.9BjNzso4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_drv.c: In function 'drm_dev_unregister':
>> drivers/gpu/drm/drm_drv.c:1011:9: error: implicit declaration of function 'drm_debugfs_dev_fini'; did you mean 'drm_debugfs_dev_init'? [-Werror=implicit-function-declaration]
    1011 |         drm_debugfs_dev_fini(dev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         drm_debugfs_dev_init
   cc1: some warnings being treated as errors


vim +1011 drivers/gpu/drm/drm_drv.c

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
