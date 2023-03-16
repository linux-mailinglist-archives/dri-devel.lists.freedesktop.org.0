Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4386BDBA4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 23:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BB310E217;
	Thu, 16 Mar 2023 22:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16DB10E331;
 Thu, 16 Mar 2023 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679005669; x=1710541669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GvokA/9IYG7aHkC04Jiuy2lsJ6RVelMBmWdx9SHI5oo=;
 b=Sm/ywEOXV/Psh1v5tZSqypXtIBA0UVmSlV/1dPnqTv0BEVKT7DW2GCAf
 Y8Qru2KDXRqnjX5Nfa6Et6D5ACOi0xtfOhygGK2Zq5v2hJs9FFE/1O8Uq
 lG+hByVVJE29ODCT6I7S3mqHq240GYXWDv7kJRXYsycS/75jT56MS+RfE
 50vbCaeof0dmotU2HB8A+PPprCxFZfDIbgyU3RATMZbHzC9jlCL4JVNHT
 kkv/9gEG6wAtPHkcTUWf/5QHm3A1Z8bXsCjvEQ4yKD8ignM8QNchKXemx
 yXrdPFS5efDRThlq27/SFxv3Ds5GtVuMz23wKH444OuqrTX7+SFbSZ+KM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338141804"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="338141804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 15:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710295801"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="710295801"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 15:27:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pcw4X-0008rm-0p;
 Thu, 16 Mar 2023 22:27:45 +0000
Date: Fri, 17 Mar 2023 06:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, stanislaw.gruszka@linux.intel.com,
 ogabbay@kernel.org, quic_jhugo@quicinc.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mwen@igalia.com, maxime@cerno.tech,
 wambui.karugax@gmail.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/debugfs: rework debugfs directory
 creation v2
Message-ID: <202303170646.MwaW3iKp-lkp@intel.com>
References: <20230316082035.567520-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316082035.567520-5-christian.koenig@amd.com>
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

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.3-rc2 next-20230316]
[cannot apply to drm-tip/drm-tip tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-tegra-allow-compile-test-on-ARM/20230316-172205
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230316082035.567520-5-christian.koenig%40amd.com
patch subject: [Intel-gfx] [PATCH 4/7] drm/debugfs: rework debugfs directory creation v2
config: ia64-defconfig (https://download.01.org/0day-ci/archive/20230317/202303170646.MwaW3iKp-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a3ad5ec323e8f1864cc8b721dbb154f0e0e2919d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-tegra-allow-compile-test-on-ARM/20230316-172205
        git checkout a3ad5ec323e8f1864cc8b721dbb154f0e0e2919d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170646.MwaW3iKp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_atomic.c:47:
>> drivers/gpu/drm/drm_internal.h:195:8: error: return type defaults to 'int' [-Werror=implicit-int]
     195 | static drm_debugfs_dev_register(struct drm_device *dev)
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_internal.h:195:8: warning: 'drm_debugfs_dev_register' defined but not used [-Wunused-function]
   In file included from drivers/gpu/drm/drm_atomic.c:38:
   include/drm/drm_drv.h:596:13: warning: 'drm_debugfs_dev_init' defined but not used [-Wunused-function]
     596 | static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_drv.c:50:
>> drivers/gpu/drm/drm_internal.h:195:8: error: return type defaults to 'int' [-Werror=implicit-int]
     195 | static drm_debugfs_dev_register(struct drm_device *dev)
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_drv.c: In function 'drm_dev_unregister':
>> drivers/gpu/drm/drm_drv.c:1011:9: error: implicit declaration of function 'drm_debugfs_dev_fini'; did you mean 'drm_debugfs_dev_init'? [-Werror=implicit-function-declaration]
    1011 |         drm_debugfs_dev_fini(dev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         drm_debugfs_dev_init
   drivers/gpu/drm/drm_internal.h: In function 'drm_debugfs_dev_register':
   drivers/gpu/drm/drm_internal.h:197:1: error: control reaches end of non-void function [-Werror=return-type]
     197 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/drm_managed.c:18:
>> drivers/gpu/drm/drm_internal.h:195:8: error: return type defaults to 'int' [-Werror=implicit-int]
     195 | static drm_debugfs_dev_register(struct drm_device *dev)
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_internal.h:195:8: warning: 'drm_debugfs_dev_register' defined but not used [-Wunused-function]
   cc1: some warnings being treated as errors


vim +/int +195 drivers/gpu/drm/drm_internal.h

   180	
   181	/* drm_debugfs.c drm_debugfs_crc.c */
   182	#if defined(CONFIG_DEBUG_FS)
   183	void drm_debugfs_dev_fini(struct drm_device *dev);
   184	void drm_debugfs_dev_register(struct drm_device *dev);
   185	int drm_debugfs_register(struct drm_minor *minor, int minor_id,
   186				 struct dentry *root);
   187	void drm_debugfs_cleanup(struct drm_minor *minor);
   188	void drm_debugfs_late_register(struct drm_device *dev);
   189	void drm_debugfs_connector_add(struct drm_connector *connector);
   190	void drm_debugfs_connector_remove(struct drm_connector *connector);
   191	void drm_debugfs_crtc_add(struct drm_crtc *crtc);
   192	void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
   193	void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
   194	#else
 > 195	static drm_debugfs_dev_register(struct drm_device *dev)
   196	{
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
