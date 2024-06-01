Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F678D707E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 16:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ED810E198;
	Sat,  1 Jun 2024 14:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPxQ8eW1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3915910E198
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717253498; x=1748789498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kO16cw2Cs3bC3eP/OwKLQQOymwCd4PK0FjtkId1Y3MQ=;
 b=hPxQ8eW1SCXM8lTESL8cN9J/JFyZTByPWGFTiLFsLiQnYnUdw7KU/Evy
 5qHBgy7rKjcCpSPk/J9+v/If7Mep+Lx3wyQwYXyGw/i0h7rgTrzNDSAKf
 oRefN9KUq2WbGdkc84aApgdt+XMVGJ8MV7tv1x15hgG2C5Ng+kyIrkjiw
 oksNnfjKj4YVEe1kYVKH02XsRLOBkF06b1dujSqjOzj7KuCjLZNbu4xvS
 rj2wn4y4fOCm7A+BwLFjWGIk9HesXwQeefaKoBzBra2wZ78p4LSkxbb7g
 mcPDP67+nF8tgTjAvgH9wGMdjqcUIguzv2RHpovv6PIxPe6UNJvx3f2mX A==;
X-CSE-ConnectionGUID: cXongDtKSGeFUMppp8y5xA==
X-CSE-MsgGUID: Ym0SJ3mBQh6cEWTH3GkLdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="13739825"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; d="scan'208";a="13739825"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2024 07:51:37 -0700
X-CSE-ConnectionGUID: KrvEblwYTna2Sd3f7N0XTw==
X-CSE-MsgGUID: YpOiZtvzQmy8D1TIvZTS/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; d="scan'208";a="36379730"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 01 Jun 2024 07:51:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sDQ4u-000Izv-0O;
 Sat, 01 Jun 2024 14:51:28 +0000
Date: Sat, 1 Jun 2024 22:50:43 +0800
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
 Mark Yao <markyao0591@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 14/14] drm/rockchip: dw_hdmi: Add basic RK3588 support
Message-ID: <202406012207.Yjbj56eg-lkp@intel.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-14-f6203753232b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-14-f6203753232b@collabora.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Ciocaltea/drm-bridge-dw-hdmi-Simplify-clock-handling/20240601-211531
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240601-b4-rk3588-bridge-upstream-v1-14-f6203753232b%40collabora.com
patch subject: [PATCH 14/14] drm/rockchip: dw_hdmi: Add basic RK3588 support
config: i386-buildonly-randconfig-002-20240601 (https://download.01.org/0day-ci/archive/20240601/202406012207.Yjbj56eg-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406012207.Yjbj56eg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406012207.Yjbj56eg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'rockchip_hdmi_parse_dt':
>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:280:40: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_clk_get_optional'? [-Werror=implicit-function-declaration]
     280 |                 hdmi->qp_enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                                        devm_clk_get_optional
>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:281:64: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function)
     281 |                                                                GPIOD_OUT_HIGH);
         |                                                                ^~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:281:64: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_encoder_enable':
>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:364:17: error: implicit declaration of function 'gpiod_set_value' [-Werror=implicit-function-declaration]
     364 |                 gpiod_set_value(hdmi->qp_enable_gpio, 1);
         |                 ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +280 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c

   226	
   227	static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
   228	{
   229		static const char * const qp_clk_names[] = {
   230			"pclk", "hdp", "earc", "aud", "hclk_vo1",
   231		};
   232		struct device_node *np = hdmi->dev->of_node;
   233		struct clk *qp_clk;
   234		int ret, i;
   235	
   236		hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
   237		if (IS_ERR(hdmi->regmap)) {
   238			drm_err(hdmi, "Unable to get rockchip,grf\n");
   239			return PTR_ERR(hdmi->regmap);
   240		}
   241	
   242		hdmi->ref_clk = devm_clk_get_optional_enabled(hdmi->dev, "ref");
   243		if (!hdmi->ref_clk)
   244			hdmi->ref_clk = devm_clk_get_optional_enabled(hdmi->dev, "vpll");
   245	
   246		if (IS_ERR(hdmi->ref_clk)) {
   247			ret = PTR_ERR(hdmi->ref_clk);
   248			if (ret != -EPROBE_DEFER)
   249				drm_err(hdmi, "failed to get reference clock\n");
   250			return ret;
   251		}
   252	
   253		hdmi->grf_clk = devm_clk_get_optional(hdmi->dev, "grf");
   254		if (IS_ERR(hdmi->grf_clk)) {
   255			ret = PTR_ERR(hdmi->grf_clk);
   256			if (ret != -EPROBE_DEFER)
   257				drm_err(hdmi, "failed to get grf clock\n");
   258			return ret;
   259		}
   260	
   261		if (hdmi->is_hdmi_qp) {
   262			hdmi->vo1_regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,vo1_grf");
   263			if (IS_ERR(hdmi->vo1_regmap)) {
   264				drm_err(hdmi, "Unable to get rockchip,vo1_grf\n");
   265				return PTR_ERR(hdmi->vo1_regmap);
   266			}
   267	
   268			for (i = 0; i < ARRAY_SIZE(qp_clk_names); i++) {
   269				qp_clk = devm_clk_get_optional_enabled(hdmi->dev, qp_clk_names[i]);
   270	
   271				if (IS_ERR(qp_clk)) {
   272					ret = PTR_ERR(qp_clk);
   273					if (ret != -EPROBE_DEFER)
   274						drm_err(hdmi, "failed to get %s clock: %d\n",
   275							qp_clk_names[i], ret);
   276					return ret;
   277				}
   278			}
   279	
 > 280			hdmi->qp_enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 > 281								       GPIOD_OUT_HIGH);
   282			if (IS_ERR(hdmi->qp_enable_gpio)) {
   283				ret = PTR_ERR(hdmi->qp_enable_gpio);
   284				drm_err(hdmi, "failed to request enable GPIO: %d\n", ret);
   285				return ret;
   286			}
   287		}
   288	
   289		ret = devm_regulator_get_enable(hdmi->dev, "avdd-0v9");
   290		if (ret)
   291			return ret;
   292	
   293		ret = devm_regulator_get_enable(hdmi->dev, "avdd-1v8");
   294	
   295		return ret;
   296	}
   297	
   298	static enum drm_mode_status
   299	dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
   300				    const struct drm_display_info *info,
   301				    const struct drm_display_mode *mode)
   302	{
   303		struct rockchip_hdmi *hdmi = data;
   304		const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
   305		int pclk = mode->clock * 1000;
   306		bool exact_match = hdmi->plat_data->phy_force_vendor;
   307		int i;
   308	
   309		if (hdmi->ref_clk) {
   310			int rpclk = clk_round_rate(hdmi->ref_clk, pclk);
   311	
   312			if (abs(rpclk - pclk) > pclk / 1000)
   313				return MODE_NOCLOCK;
   314		}
   315	
   316		for (i = 0; mpll_cfg[i].mpixelclock != (~0UL); i++) {
   317			/*
   318			 * For vendor specific phys force an exact match of the pixelclock
   319			 * to preserve the original behaviour of the driver.
   320			 */
   321			if (exact_match && pclk == mpll_cfg[i].mpixelclock)
   322				return MODE_OK;
   323			/*
   324			 * The Synopsys phy can work with pixelclocks up to the value given
   325			 * in the corresponding mpll_cfg entry.
   326			 */
   327			if (!exact_match && pclk <= mpll_cfg[i].mpixelclock)
   328				return MODE_OK;
   329		}
   330	
   331		return MODE_BAD;
   332	}
   333	
   334	static void dw_hdmi_rockchip_encoder_disable(struct drm_encoder *encoder)
   335	{
   336	}
   337	
   338	static bool
   339	dw_hdmi_rockchip_encoder_mode_fixup(struct drm_encoder *encoder,
   340					    const struct drm_display_mode *mode,
   341					    struct drm_display_mode *adj_mode)
   342	{
   343		return true;
   344	}
   345	
   346	static void dw_hdmi_rockchip_encoder_mode_set(struct drm_encoder *encoder,
   347						      struct drm_display_mode *mode,
   348						      struct drm_display_mode *adj_mode)
   349	{
   350		struct rockchip_hdmi *hdmi = to_rockchip_hdmi(encoder);
   351	
   352		clk_set_rate(hdmi->ref_clk, adj_mode->clock * 1000);
   353	}
   354	
   355	static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
   356	{
   357		struct rockchip_hdmi *hdmi = to_rockchip_hdmi(encoder);
   358		struct drm_crtc *crtc = encoder->crtc;
   359		u32 val;
   360		int ret, rate;
   361	
   362		if (hdmi->is_hdmi_qp) {
   363			/* Unconditionally switch to TMDS as FRL is not yet supported */
 > 364			gpiod_set_value(hdmi->qp_enable_gpio, 1);
   365	
   366			if (crtc && crtc->state) {
   367				clk_set_rate(hdmi->ref_clk,
   368					     crtc->state->adjusted_mode.crtc_clock * 1000);
   369				/*
   370				 * FIXME: Temporary workaround to pass pixel clock rate
   371				 * to the PHY driver until phy_configure_opts_hdmi
   372				 * becomes available in the PHY API. See also the related
   373				 * comment in rk_hdptx_phy_power_on() from
   374				 * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
   375				 */
   376				if (hdmi->phy) {
   377					rate = crtc->state->mode.clock * 10;
   378					phy_set_bus_width(hdmi->phy, rate);
   379					drm_dbg(hdmi, "%s set bus_width=%u\n",
   380						__func__, rate);
   381				}
   382			}
   383		}
   384	
   385		if (hdmi->chip_data->lcdsel_grf_reg < 0)
   386			return;
   387	
   388		ret = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, encoder);
   389		if (ret)
   390			val = hdmi->chip_data->lcdsel_lit;
   391		else
   392			val = hdmi->chip_data->lcdsel_big;
   393	
   394		ret = clk_prepare_enable(hdmi->grf_clk);
   395		if (ret < 0) {
   396			drm_err(hdmi, "failed to enable grfclk %d\n", ret);
   397			return;
   398		}
   399	
   400		ret = regmap_write(hdmi->regmap, hdmi->chip_data->lcdsel_grf_reg, val);
   401		if (ret != 0)
   402			drm_err(hdmi, "Could not write to GRF: %d\n", ret);
   403	
   404		clk_disable_unprepare(hdmi->grf_clk);
   405		drm_dbg(hdmi, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
   406	}
   407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
