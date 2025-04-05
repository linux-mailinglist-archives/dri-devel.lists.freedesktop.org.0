Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3A2A7C752
	for <lists+dri-devel@lfdr.de>; Sat,  5 Apr 2025 04:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D3C10E359;
	Sat,  5 Apr 2025 02:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNNqg8or";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8010E359
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Apr 2025 02:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743818554; x=1775354554;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n55XbygekPuRSftRNaBTCpWgjPxbf0+xzTKJHWs1Faw=;
 b=MNNqg8orUjdY2+D6jTDC3WhVaGuKPfW2EZmQxAk0VKc642gFWQb5HPDN
 ZDzKRhyHowlTmrMRlpL99KQ0brUMfpk7Q9EnrSmPqv+2eeThWYzRormPz
 Hnxh4z6e4znTb8mu1meLh12KZgE6IwiZATvisG8iv+/AXg/uK7HyHIAA8
 2E3adRQDIFkzDr6gTg8tbMGE/+oknyH2Z3CNKenOaC7sBSL+IK6fa1P0z
 wL0puquWHo1bnEIBUbyX9If2CpqW6+NMh+/kOguPa/45qIHCj0U7rsckU
 C9BR4AXM+4AZvPteyKtIyfILPC0JLajAmF3AnlYY9H2SgWv886cIR9oJJ w==;
X-CSE-ConnectionGUID: 2skS5A6vS1qSkprTj80sIw==
X-CSE-MsgGUID: u65ETsDiT8itJEhUPj7L7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49064518"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; d="scan'208";a="49064518"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 19:02:33 -0700
X-CSE-ConnectionGUID: 1a/Sqrq0QAqulzvOM4QDhA==
X-CSE-MsgGUID: OciFOaSYQwuAk8MVNQiG1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; d="scan'208";a="127954060"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 04 Apr 2025 19:02:28 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u0srZ-0001jb-2I;
 Sat, 05 Apr 2025 02:02:25 +0000
Date: Sat, 5 Apr 2025 10:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Robert Chiras <robert.chiras@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>,
 Artur Weber <aweber.kernel@gmail.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Anusha Srivatsa <asrivats@redhat.com>
Subject: Re: [PATCH 41/46] panel/widechips-ws2401: Use refcounted allocation
 in place of devm_kzalloc()
Message-ID: <202504050919.KlKBUNDh-lkp@intel.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e@redhat.com>
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

Hi Anusha,

kernel test robot noticed the following build errors:

[auto build test ERROR on de04bb0089a96cc00d13b12cbf66a088befe3057]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/panel-orisetech-otm8009a-Use-refcounted-allocation-in-place-of-devm_kzalloc/20250404-052751
base:   de04bb0089a96cc00d13b12cbf66a088befe3057
patch link:    https://lore.kernel.org/r/20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e%40redhat.com
patch subject: [PATCH 41/46] panel/widechips-ws2401: Use refcounted allocation in place of devm_kzalloc()
config: x86_64-buildonly-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050919.KlKBUNDh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050919.KlKBUNDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050919.KlKBUNDh-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/panel/panel-widechips-ws2401.o: in function `ws2401_probe':
>> drivers/gpu/drm/panel/panel-widechips-ws2401.c:350: undefined reference to `__devm_drm_panel_alloc'


vim +350 drivers/gpu/drm/panel/panel-widechips-ws2401.c

   343	
   344	static int ws2401_probe(struct spi_device *spi)
   345	{
   346		struct device *dev = &spi->dev;
   347		struct ws2401 *ws;
   348		int ret;
   349	
 > 350		ws = devm_drm_panel_alloc(dev, struct ws2401, panel, &ws2401_drm_funcs,
   351					   DRM_MODE_CONNECTOR_DPI);
   352		if (IS_ERR(ws))
   353			return PTR_ERR(ws);
   354	
   355		ws->dev = dev;
   356	
   357		/*
   358		 * VCI   is the analog voltage supply
   359		 * VCCIO is the digital I/O voltage supply
   360		 */
   361		ws->regulators[0].supply = "vci";
   362		ws->regulators[1].supply = "vccio";
   363		ret = devm_regulator_bulk_get(dev,
   364					      ARRAY_SIZE(ws->regulators),
   365					      ws->regulators);
   366		if (ret)
   367			return dev_err_probe(dev, ret, "failed to get regulators\n");
   368	
   369		ws->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   370		if (IS_ERR(ws->reset)) {
   371			ret = PTR_ERR(ws->reset);
   372			return dev_err_probe(dev, ret, "no RESET GPIO\n");
   373		}
   374	
   375		ret = mipi_dbi_spi_init(spi, &ws->dbi, NULL);
   376		if (ret)
   377			return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
   378		ws->dbi.read_commands = ws2401_dbi_read_commands;
   379	
   380		ws2401_power_on(ws);
   381		ws2401_read_mtp_id(ws);
   382		ws2401_power_off(ws);
   383	
   384		ret = drm_panel_of_backlight(&ws->panel);
   385		if (ret)
   386			return dev_err_probe(dev, ret,
   387					"failed to get external backlight device\n");
   388	
   389		if (!ws->panel.backlight) {
   390			dev_dbg(dev, "no external backlight, using internal backlight\n");
   391			ws->panel.backlight =
   392				devm_backlight_device_register(dev, "ws2401", dev, ws,
   393					&ws2401_bl_ops, &ws2401_bl_props);
   394			if (IS_ERR(ws->panel.backlight))
   395				return dev_err_probe(dev, PTR_ERR(ws->panel.backlight),
   396					"failed to register backlight device\n");
   397		} else {
   398			dev_dbg(dev, "using external backlight\n");
   399		}
   400	
   401		spi_set_drvdata(spi, ws);
   402	
   403		drm_panel_add(&ws->panel);
   404		dev_dbg(dev, "added panel\n");
   405	
   406		return 0;
   407	}
   408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
