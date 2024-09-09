Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B308970AD2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 02:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908E310E257;
	Mon,  9 Sep 2024 00:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CG4XrGo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B252110E249
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 00:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725842598; x=1757378598;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XNNSjYDp2/vVWve1yWNzSRejqISxf3CiHc/EGOCbqS8=;
 b=CG4XrGo4yR0qwOrkw3rbK1i8MIfQ0KXRZBQSUs3NVkCh86tXrqM/NPU/
 uI5I6DqAhDyC7lTSfLEqcETUZfF8x1XiSRxjnWFPfa7Nl3UWdnsu+N49b
 9OpS6+6kMvuRIt3iVQT6MdSSxN9X/ZgoWjLxq7OnwZFOMe7f5YEbtou64
 SZFb8b0D2/LxT8/M8bfgmFd6+7++sXLfQ1DwRM4O68VbgJw/plRTnAOWn
 7RQ7LsXoTj+gJNVda0a2kr4pYjQPsIgjiU+LE0ZDAxx98F3v3Vlx/OTkJ
 wMkJGMWiVB3SUnr80FwL69LIJeL8BsVyKSqHajZv4V/wbJ1z21Z+3jL60 A==;
X-CSE-ConnectionGUID: gu4hHoRFQ9OG5KIIRnX9Hg==
X-CSE-MsgGUID: YfcwlM5vSHWVlMfkfMILJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24380707"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="24380707"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 17:43:16 -0700
X-CSE-ConnectionGUID: 0TF1Qs4nRxmSO0LssqBdig==
X-CSE-MsgGUID: nHhGW951T3ePC2vI+90hZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="89764067"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2024 17:43:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1snSUl-000E7t-2r;
 Mon, 09 Sep 2024 00:43:07 +0000
Date: Mon, 9 Sep 2024 08:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v6 3/3] drm/rockchip: Add basic RK3588 HDMI output support
Message-ID: <202409090615.l6BkuR5K-lkp@intel.com>
References: <20240906-b4-rk3588-bridge-upstream-v6-3-a3128fb103eb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-b4-rk3588-bridge-upstream-v6-3-a3128fb103eb@collabora.com>
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

Hi Cristian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Ciocaltea/drm-bridge-synopsys-Add-DW-HDMI-QP-TX-Controller-support-library/20240906-092027
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240906-b4-rk3588-bridge-upstream-v6-3-a3128fb103eb%40collabora.com
patch subject: [PATCH v6 3/3] drm/rockchip: Add basic RK3588 HDMI output support
config: powerpc64-randconfig-r122-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090615.l6BkuR5K-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20240909/202409090615.l6BkuR5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090615.l6BkuR5K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:679:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct dw_hdmi_qp * @@     got void [noderef] __iomem *[assigned] regs @@
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:679:24: sparse:     expected struct dw_hdmi_qp *
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:679:24: sparse:     got void [noderef] __iomem *[assigned] regs

vim +679 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c

4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  653  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  654  struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  655  				   struct drm_encoder *encoder,
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  656  				   const struct dw_hdmi_qp_plat_data *plat_data)
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  657  {
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  658  	struct device *dev = &pdev->dev;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  659  	struct dw_hdmi_qp *hdmi;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  660  	void __iomem *regs;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  661  	int ret;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  662  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  663  	if (!plat_data->phy_ops || !plat_data->phy_ops->init ||
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  664  	    !plat_data->phy_ops->disable || !plat_data->phy_ops->read_hpd) {
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  665  		dev_err(dev, "Missing platform PHY ops\n");
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  666  		return ERR_PTR(-ENODEV);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  667  	}
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  668  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  669  	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  670  	if (!hdmi)
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  671  		return ERR_PTR(-ENOMEM);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  672  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  673  	INIT_DELAYED_WORK(&hdmi->scramb_work, dw_hdmi_qp_scramb_work);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  674  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  675  	hdmi->dev = dev;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  676  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  677  	regs = devm_platform_ioremap_resource(pdev, 0);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  678  	if (IS_ERR(regs))
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06 @679  		return regs;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  680  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  681  	hdmi->regm = devm_regmap_init_mmio(dev, regs, &dw_hdmi_qp_regmap_config);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  682  	if (IS_ERR(hdmi->regm)) {
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  683  		dev_err(dev, "Failed to configure regmap\n");
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  684  		return ERR_CAST(hdmi->regm);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  685  	}
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  686  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  687  	hdmi->phy.ops = plat_data->phy_ops;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  688  	hdmi->phy.data = plat_data->phy_data;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  689  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  690  	dw_hdmi_qp_init_hw(hdmi);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  691  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  692  	ret = devm_request_threaded_irq(dev, plat_data->main_irq,
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  693  					dw_hdmi_qp_main_hardirq, NULL,
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  694  					IRQF_SHARED, dev_name(dev), hdmi);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  695  	if (ret)
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  696  		return ERR_PTR(ret);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  697  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  698  	hdmi->bridge.driver_private = hdmi;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  699  	hdmi->bridge.funcs = &dw_hdmi_qp_bridge_funcs;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  700  	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  701  			   DRM_BRIDGE_OP_EDID |
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  702  			   DRM_BRIDGE_OP_HDMI |
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  703  			   DRM_BRIDGE_OP_HPD;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  704  	hdmi->bridge.of_node = pdev->dev.of_node;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  705  	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  706  	hdmi->bridge.vendor = "Synopsys";
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  707  	hdmi->bridge.product = "DW HDMI QP TX";
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  708  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  709  	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  710  	if (IS_ERR(hdmi->bridge.ddc))
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  711  		hdmi->bridge.ddc = NULL;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  712  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  713  	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  714  	if (ret)
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  715  		return ERR_PTR(ret);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  716  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  717  	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL,
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  718  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  719  	if (ret)
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  720  		return ERR_PTR(ret);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  721  
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  722  	return hdmi;
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  723  }
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  724  EXPORT_SYMBOL_GPL(dw_hdmi_qp_bind);
4ae2f13b217e6c Cristian Ciocaltea 2024-09-06  725  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
