Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD8895B4B9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 14:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FB610E08A;
	Thu, 22 Aug 2024 12:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioZcH+WU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6054010E08A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 12:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724328672; x=1755864672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wBl1r1iyvYDMVZtv8y/QM6cGPiMA+r+kJ9USad8vmoA=;
 b=ioZcH+WUR+NDHscS7T2iCzRPkYvGnDvFZqwZhGs32/QJBGGvNPf/2oVM
 eNjzw/pJv5/Jf2S5gjSelv190PpFQoyL7KqapAO+ppWuyfQ7h6ix2qNRl
 7/W58/P3tjZZpD2VDVxMNT7lu9lgeIZg0UkIQMRIZP9oZGjrmLDCywsNx
 0xS6I/sjsPrb3OaPRGxvgr90spgabTk5PxWDbwNKkT4e0AkJ86A2hmV+H
 dE1wkwz/8lAljboET8Vz7/lxxGpzgIMHgmipENTHELfZ2JKsCGUsUTQSC
 JRPMPCWzqF11E8cY0gfkhkL/v1ZK+ksa7IKCuEcURLUAjQ/wiXmVLLaqT A==;
X-CSE-ConnectionGUID: MTrKCWslSmauwz3IQdPdOw==
X-CSE-MsgGUID: OeX8xITaRZql5aI8rUXpFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="45260388"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="45260388"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:11:11 -0700
X-CSE-ConnectionGUID: /PjncfjhS2K+vMx1/qUUeg==
X-CSE-MsgGUID: Fv/q/DKJQ4WtGUg+Dfv/uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61089547"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2024 05:11:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sh6ed-000Cjg-0x;
 Thu, 22 Aug 2024 12:11:03 +0000
Date: Thu, 22 Aug 2024 20:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Wahren <wahrenst@gmx.net>, Russell King <linux@armlinux.org.uk>,
 Doug Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V3 4/9] drm/vc4: hdmi: add PM suspend/resume support
Message-ID: <202408221940.t4pWjzvz-lkp@intel.com>
References: <20240821214052.6800-5-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821214052.6800-5-wahrenst@gmx.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on arm/for-next arm/fixes v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Wahren/mailbox-bcm2835-Fix-timeout-during-suspend-mode/20240822-063725
base:   linus/master
patch link:    https://lore.kernel.org/r/20240821214052.6800-5-wahrenst%40gmx.net
patch subject: [PATCH V3 4/9] drm/vc4: hdmi: add PM suspend/resume support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240822/202408221940.t4pWjzvz-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221940.t4pWjzvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221940.t4pWjzvz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_hdmi.c:3118:12: warning: 'vc4_hdmi_resume' defined but not used [-Wunused-function]
    3118 | static int vc4_hdmi_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/vc4/vc4_hdmi.c:3107:12: warning: 'vc4_hdmi_suspend' defined but not used [-Wunused-function]
    3107 | static int vc4_hdmi_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~


vim +/vc4_hdmi_resume +3118 drivers/gpu/drm/vc4/vc4_hdmi.c

  3106	
> 3107	static int vc4_hdmi_suspend(struct device *dev)
  3108	{
  3109		struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
  3110		struct drm_device *drm = vc4_hdmi->connector.dev;
  3111	
  3112		if (drm && drm->mode_config.poll_enabled)
  3113			drm_kms_helper_poll_disable(drm);
  3114	
  3115		return pm_runtime_force_suspend(dev);
  3116	}
  3117	
> 3118	static int vc4_hdmi_resume(struct device *dev)
  3119	{
  3120		struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
  3121		struct drm_device *drm = vc4_hdmi->connector.dev;
  3122		int ret;
  3123	
  3124		ret = pm_runtime_force_resume(dev);
  3125	
  3126		if (drm && drm->mode_config.poll_enabled)
  3127			drm_kms_helper_poll_enable(drm);
  3128	
  3129		return ret;
  3130	}
  3131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
