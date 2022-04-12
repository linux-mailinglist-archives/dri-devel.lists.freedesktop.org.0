Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11354FD29D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8341410E675;
	Tue, 12 Apr 2022 07:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BDA10E675
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649748380; x=1681284380;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G7L8YOlj6LR17aw3DxvsUkt4nUXPEbDep2GdA0mNRfg=;
 b=HOd4kcWkq2SmJszXndlin+qzdnLKb7iPN6aU34RV/NxnGXhxE82IXarW
 +TP/aXf0yQUb1WPGku6tDl9/kcAIFsu6l7I0T8HzDH3rHaR9Ql7Ga0gF8
 9brabcXqBqTSUCCSn+VOTq6borjtCUDVQ/7Dkl948jBvhMuNfUL8nxXai
 xGpFQvOD6cHvZnzJCcUCy4b1MctoFolxpeohe6Uu2ZdvQ+g+nunuHaNF0
 k0NYFm5yzmY0ZiCijIBbaPK/hwqNY/f/HTXOSwI6gHFqeRDSdrCdbUTPe
 FSUlZ5lyLZbFCC0Vzek3wQQwl9CeOW7GcJD8TapQDkh7R5ZdFz+Phjivb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="348736567"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="348736567"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 00:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="699706997"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2022 00:26:17 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1neAum-0002co-Sc;
 Tue, 12 Apr 2022 07:26:16 +0000
Date: Tue, 12 Apr 2022 15:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
Message-ID: <202204121542.aU2BiYXN-lkp@intel.com>
References: <20220411211243.11121-5-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411211243.11121-5-javierm@redhat.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 kbuild-all@lists.01.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, llvm@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220411]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master linux/master v5.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/drm-solomon-Add-SSD130x-OLED-displays-SPI-support/20220412-051518
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a001-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121542.aU2BiYXN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ac5a07cda8a0f8d4948e6a01d0b3bb6ce9fe7830
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Javier-Martinez-Canillas/drm-solomon-Add-SSD130x-OLED-displays-SPI-support/20220412-051518
        git checkout ac5a07cda8a0f8d4948e6a01d0b3bb6ce9fe7830
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/solomon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/solomon/ssd130x.c:894:12: warning: cast to smaller integer type 'enum ssd130x_variants' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           variant = (enum ssd130x_variants)device_get_match_data(dev);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +894 drivers/gpu/drm/solomon/ssd130x.c

   874	
   875	struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
   876	{
   877		struct ssd130x_device *ssd130x;
   878		enum ssd130x_variants variant;
   879		struct backlight_device *bl;
   880		struct drm_device *drm;
   881		int ret;
   882	
   883		ssd130x = devm_drm_dev_alloc(dev, &ssd130x_drm_driver,
   884					     struct ssd130x_device, drm);
   885		if (IS_ERR(ssd130x))
   886			return ERR_PTR(dev_err_probe(dev, PTR_ERR(ssd130x),
   887						     "Failed to allocate DRM device\n"));
   888	
   889		drm = &ssd130x->drm;
   890	
   891		ssd130x->dev = dev;
   892		ssd130x->regmap = regmap;
   893	
 > 894		variant = (enum ssd130x_variants)device_get_match_data(dev);
   895	
   896		if (variant >= NR_SSD130X_VARIANTS)
   897			return ERR_PTR(dev_err_probe(dev, -EINVAL,
   898						     "Invalid SSD130x variant\n"));
   899	
   900		ssd130x->device_info = &ssd130x_variants[variant];
   901	
   902		if (ssd130x->device_info->page_mode_only)
   903			ssd130x->page_address_mode = 1;
   904	
   905		ssd130x_parse_properties(ssd130x);
   906	
   907		ret = ssd130x_get_resources(ssd130x);
   908		if (ret)
   909			return ERR_PTR(ret);
   910	
   911		bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
   912						    &ssd130xfb_bl_ops, NULL);
   913		if (IS_ERR(bl))
   914			return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
   915						     "Unable to register backlight device\n"));
   916	
   917		bl->props.brightness = ssd130x->contrast;
   918		bl->props.max_brightness = MAX_CONTRAST;
   919		ssd130x->bl_dev = bl;
   920	
   921		ret = ssd130x_init_modeset(ssd130x);
   922		if (ret)
   923			return ERR_PTR(ret);
   924	
   925		ret = drm_dev_register(drm, 0);
   926		if (ret)
   927			return ERR_PTR(dev_err_probe(dev, ret, "DRM device register failed\n"));
   928	
   929		drm_fbdev_generic_setup(drm, 0);
   930	
   931		return ssd130x;
   932	}
   933	EXPORT_SYMBOL_GPL(ssd130x_probe);
   934	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
