Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC96D04A4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3D110E2C0;
	Thu, 30 Mar 2023 12:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F208D10E2C0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680179215; x=1711715215;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gJvnZgQkue/12hrpL+swh+HJ0hl42bCVklNCda2py/c=;
 b=SPNUYcxCfeQT64oc0dsipuic5Sj4sh/LFQ3uqvLx8x98vmIBbb5lJV+L
 7y22BDPT1HcRt5ary9OuO2oFUOBeOw6+Pgb5PsN6lqA+7pqRwuyF3Ok35
 bB4wy2Wc0Jhl6HTwdXg7al9l3NzBRUcVKiktb81R6kZjuTO4D7q9MQAPz
 zZjmdjErkeP1MPrsI9DkoXprtWzrF0kjXTO3ZZW0dpr6kwC3u4AlUJb4C
 cTbAEu1t6ODtcyY64gsM7pmXsZaCPTxSu1GqVw5LnZF96I6T6Iu/SULXU
 /8mMUy+jW+cKluoMHmr4Lj8Jsad9wt2jZ/HVma3Cx/uC9CJw6DGHfh8V+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427429506"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="427429506"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 05:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="753982185"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="753982185"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 05:26:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1phrMi-000KqC-28;
 Thu, 30 Mar 2023 12:26:52 +0000
Date: Thu, 30 Mar 2023 20:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tomba@kernel.org,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 6/6] drm/omapdrm: Implement fbdev emulation as in-kernel
 client
Message-ID: <202303302056.9US55Dt4-lkp@intel.com>
References: <20230330083205.12621-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330083205.12621-7-tzimmermann@suse.de>
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

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-omapdrm-Include-linux-of-h/20230330-163453
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230330083205.12621-7-tzimmermann%40suse.de
patch subject: [PATCH 6/6] drm/omapdrm: Implement fbdev emulation as in-kernel client
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230330/202303302056.9US55Dt4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5b54095ec3eaa71a5cc6b433dfbbf58e26c44e38
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-omapdrm-Include-linux-of-h/20230330-163453
        git checkout 5b54095ec3eaa71a5cc6b433dfbbf58e26c44e38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/omapdrm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303302056.9US55Dt4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/omap_fbdev.c:306:6: warning: no previous prototype for 'omap_fbdev_setup' [-Wmissing-prototypes]
     306 | void omap_fbdev_setup(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~


vim +/omap_fbdev_setup +306 drivers/gpu/drm/omapdrm/omap_fbdev.c

   305	
 > 306	void omap_fbdev_setup(struct drm_device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
