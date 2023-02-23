Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632E6A1080
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 20:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5476410E0DE;
	Thu, 23 Feb 2023 19:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A3610E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 19:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677180198; x=1708716198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TcSKtnSmpVPLRb9cnLenktQFNSwR+Zw81nlzKZOXx9g=;
 b=bg0Ps9+3qQZYM9AVdC/Ih+QH/4nctlmixatBrScr6ZK9ZZFHpXaIAhzZ
 yx2QXMa529IqZD1eEQMBSn5wXwJSs/GQh2sAwMwYTwyEuPSUq+erDCx7K
 wjN6s2MkX1Ln8wu4sMmST1vYPIzD/q6tzLv1RJX5gAJ2w79jMbLvErzvY
 c54gZyEaaIkHR/J2B6O5fS/WoS0xUT/qXVyMXd2vtWgXHXMkMgwNVADtj
 rOfY7GxtyiD6v7GMA/RNpokFtzwIalK0Z3pHy1pr4pakHJCk93rVxWm5R
 dOSrogEYJyBMA3gSlCrKOiC9kcpPKierkbzt1pHDkzQcvmIbk9dy8/R0v Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="333310097"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="333310097"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 11:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782027210"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="782027210"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2023 11:23:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pVHBT-0001fP-2e;
 Thu, 23 Feb 2023 19:23:15 +0000
Date: Fri, 24 Feb 2023 03:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, patrik.r.jakobsson@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
Message-ID: <202302240327.EvR0Gx5N-lkp@intel.com>
References: <20230223121733.12549-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223121733.12549-7-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to drm-misc/drm-misc-next v6.2 v6.2-rc8 v6.2-rc7 next-20230223 v6.2 next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-gma500-Remove-unnecessary-include-statements/20230223-202205
patch link:    https://lore.kernel.org/r/20230223121733.12549-7-tzimmermann%40suse.de
patch subject: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230224/202302240327.EvR0Gx5N-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d1c984af29e0c5219d353a4772527d233d1c1bcc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-gma500-Remove-unnecessary-include-statements/20230223-202205
        git checkout d1c984af29e0c5219d353a4772527d233d1c1bcc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240327.EvR0Gx5N-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   ld: drivers/gpu/drm/gma500/cdv_device.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_crt.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_display.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_dp.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_hdmi.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/cdv_intel_lvds.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/framebuffer.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/framebuffer.c:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/gem.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/gma_device.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/gma_device.c:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/gma_display.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/gtt.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/intel_bios.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/intel_gmbus.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/intel_i2c.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/mid_bios.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/mmu.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_device.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_crtc.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_hdmi.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_lvds.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/oaktrail_lvds_i2c.o: in function `psb_fbdev_setup':
>> drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/power.o: in function `psb_fbdev_setup':
   power.c:(.text+0x40): multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_device.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_drv.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_intel_display.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_intel_lvds.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_intel_sdvo.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_lid.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/psb_irq.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
   ld: drivers/gpu/drm/gma500/opregion.o: in function `psb_fbdev_setup':
   drivers/gpu/drm/gma500/psb_drv.h:621: multiple definition of `psb_fbdev_setup'; drivers/gpu/drm/gma500/backlight.o:drivers/gpu/drm/gma500/psb_drv.h:621: first defined here
--
   In file included from drivers/gpu/drm/gma500/backlight.c:14:
>> drivers/gpu/drm/gma500/psb_drv.h:620:6: warning: no previous prototype for 'psb_fbdev_setup' [-Wmissing-prototypes]
     620 | void psb_fbdev_setup(struct drm_psb_private *dev_priv)
         |      ^~~~~~~~~~~~~~~


vim +621 drivers/gpu/drm/gma500/psb_drv.h

b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  610  
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  611  /* framebuffer */
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  612  extern struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  613  						      const struct drm_mode_fb_cmd2 *mode_cmd,
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  614  						      struct drm_gem_object *obj);
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  615  
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  616  /* fbdev */
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  617  #if defined(CONFIG_DRM_FBDEV_EMULATION)
d1c984af29e0c5 Thomas Zimmermann 2023-02-23  618  void psb_fbdev_setup(struct drm_psb_private *dev_priv);
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  619  #else
d1c984af29e0c5 Thomas Zimmermann 2023-02-23 @620  void psb_fbdev_setup(struct drm_psb_private *dev_priv)
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23 @621  { }
b0f256f81e3ff9 Thomas Zimmermann 2023-02-23  622  #endif
5c49fd3aa0ab02 Alan Cox          2011-11-03  623  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
