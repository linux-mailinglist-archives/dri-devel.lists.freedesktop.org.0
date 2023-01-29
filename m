Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E2D67FBFF
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 01:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A467910E034;
	Sun, 29 Jan 2023 00:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BD410E034
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 00:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674953227; x=1706489227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l0j7K1/L9M+f1mEpBM1Ek5xikMFJoO8xM/NLZGKxV44=;
 b=iEdfxBU9hUlCsY/3FMmz84ShLwrmO8SpONgWLcmD7f72vdUfatehJxkR
 qIQR2KRyrUeh+IUPTC1CWM8AQadnCMyV92/EThybgoL1bCbaK1eHJh7ey
 /KAVQUWCjLxfFUjr9ITMuAFjagD68Ccdjy8qq758NCIuKCD9eIBkBfCjl
 wBKt1BrTZZSo+6S3VLZQvxRljHRWBpZs2trYPRc+MqVILX1wjAwj128fb
 UleTcWiYYtlfnbpA5nC44qQKCvq9i6D4fZCO97QvOh4C5yYFot19stxzq
 y8WiTOEiQLBiYRx9Qkmi+pjV1lxXZBG1ApgsDIss5OtZeLo/LwfIQSo8t g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325043682"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="325043682"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 16:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="727086438"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="727086438"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2023 16:47:01 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pLvqV-0001H4-3A;
 Sun, 29 Jan 2023 00:46:59 +0000
Date: Sun, 29 Jan 2023 08:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cormier <jcormier@criticallink.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 4/4] DRM: BRIDGE: TFP410: If connected, use I2C for
 polled HPD status.
Message-ID: <202301290803.ouS19eab-lkp@intel.com>
References: <20230125-tfp410_i2c-v1-4-66a4d4e390b7@criticallink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125-tfp410_i2c-v1-4-66a4d4e390b7@criticallink.com>
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 93f875a8526a291005e7f38478079526c843cbec]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cormier/dt-bindings-display-bridge-tfp410-Add-tfp410-i2c-example/20230128-183627
base:   93f875a8526a291005e7f38478079526c843cbec
patch link:    https://lore.kernel.org/r/20230125-tfp410_i2c-v1-4-66a4d4e390b7%40criticallink.com
patch subject: [PATCH 4/4] DRM: BRIDGE: TFP410: If connected, use I2C for polled HPD status.
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230129/202301290803.ouS19eab-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c4659fa4c02b62087c095ca99978e5eac8b490de
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cormier/dt-bindings-display-bridge-tfp410-Add-tfp410-i2c-example/20230128-183627
        git checkout c4659fa4c02b62087c095ca99978e5eac8b490de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/bridge/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ti-tfp410.c:111:6: warning: unused variable 'val' [-Wunused-variable]
           u32 val;
               ^
   1 warning generated.


vim +/val +111 drivers/gpu/drm/bridge/ti-tfp410.c

   106	
   107	static enum drm_connector_status
   108	tfp410_connector_detect(struct drm_connector *connector, bool force)
   109	{
   110		struct tfp410 *dvi = drm_connector_to_tfp410(connector);
 > 111		u32 val;
   112		unsigned int ret;
   113	
   114		if (dvi->i2c) {
   115			ret = regmap_test_bits(dvi->regmap, TFP410_REG_CTL_2_MODE, TFP410_BIT_HTPLG);
   116			if (ret < 0)
   117				dev_err(dvi->dev, "%s failed to read HTPLG bit : %d\n", __func__, ret);
   118			else
   119				return ret ? connector_status_connected : connector_status_disconnected;
   120		}
   121	
   122		return drm_bridge_detect(dvi->next_bridge);
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
