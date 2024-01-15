Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB03582DEA5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8606D10E34F;
	Mon, 15 Jan 2024 17:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C123510E34F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705341279; x=1736877279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GDOv+KMLJXKRPES2lOk9CeXDyPmRMw69IQKLB2cntJM=;
 b=hC1AK2sL56oDLqXiKpty4KCY/9JR/u/EQDk1D/5QyxSe6Uu6c80FqhCU
 zo9Lstco4rGFeg4GvYKLVF0GC2j92FXQtK736lrAyiStdGCF+3Q8yZ1eV
 fzVUIay4JphJpLA5kqSEbmkCWrvJT55rGKyM1XxiCjwLRsU9hQCYSPX4j
 htjX7QOcrhwW7z8m6Y/tvtO4WXOWmoFv+BqWZ1Ssu0+nB0P9cwHvPf70r
 XeGrO6XUQoNLOrFsM1DFOd+lEfYY3ovbU+iJTy6Ihhs3XpkpZJ6QioPAt
 Ka9sGISeOBCTp4fWK56islziU6/7dCTEPwq5FwG0yRw/CynvYGAnutp7i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="466045456"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="466045456"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 09:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="32190049"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 15 Jan 2024 09:54:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rPRAF-000Ce0-1n;
 Mon, 15 Jan 2024 17:54:27 +0000
Date: Tue, 16 Jan 2024 01:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 victor.liu@nxp.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, hjc@rock-chips.com,
 heiko@sntech.de, yannick.fertre@foss.st.com,
 raphael.gallais-pou@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: fix deferred dsi host
 probe breaks dsi device probe
Message-ID: <202401160108.j5Lqkppm-lkp@intel.com>
References: <20240112180737.551318-1-farouk.bouabid@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112180737.551318-1-farouk.bouabid@theobroma-systems.com>
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

Hi Farouk,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Farouk-Bouabid/drm-bridge-synopsys-dw-mipi-dsi-fix-deferred-dsi-host-probe-breaks-dsi-device-probe/20240113-020945
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240112180737.551318-1-farouk.bouabid%40theobroma-systems.com
patch subject: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: fix deferred dsi host probe breaks dsi device probe
config: i386-buildonly-randconfig-002-20240115 (https://download.01.org/0day-ci/archive/20240116/202401160108.j5Lqkppm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401160108.j5Lqkppm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401160108.j5Lqkppm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:1187:5: warning: no previous prototype for '__dw_mipi_dsi_probe' [-Wmissing-prototypes]
    1187 | int __dw_mipi_dsi_probe(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/__dw_mipi_dsi_probe +1187 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c

  1186	
> 1187	int __dw_mipi_dsi_probe(struct platform_device *pdev,
  1188			    const struct dw_mipi_dsi_plat_data *plat_data, struct dw_mipi_dsi **dsi_p)
  1189	{
  1190		struct device *dev = &pdev->dev;
  1191		struct reset_control *apb_rst;
  1192		struct dw_mipi_dsi *dsi;
  1193		int ret;
  1194	
  1195		*dsi_p = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
  1196		if (!*dsi_p)
  1197			return -ENOMEM;
  1198	
  1199		dsi = *dsi_p;
  1200	
  1201		dsi->dev = dev;
  1202		dsi->plat_data = plat_data;
  1203	
  1204		if (!plat_data->phy_ops->init || !plat_data->phy_ops->get_lane_mbps ||
  1205		    !plat_data->phy_ops->get_timing) {
  1206			DRM_ERROR("Phy not properly configured\n");
  1207			return -ENODEV;
  1208		}
  1209	
  1210		if (!plat_data->base) {
  1211			dsi->base = devm_platform_ioremap_resource(pdev, 0);
  1212			if (IS_ERR(dsi->base))
  1213				return -ENODEV;
  1214	
  1215		} else {
  1216			dsi->base = plat_data->base;
  1217		}
  1218	
  1219		dsi->pclk = devm_clk_get(dev, "pclk");
  1220		if (IS_ERR(dsi->pclk)) {
  1221			ret = PTR_ERR(dsi->pclk);
  1222			dev_err(dev, "Unable to get pclk: %d\n", ret);
  1223			return ret;
  1224		}
  1225	
  1226		/*
  1227		 * Note that the reset was not defined in the initial device tree, so
  1228		 * we have to be prepared for it not being found.
  1229		 */
  1230		apb_rst = devm_reset_control_get_optional_exclusive(dev, "apb");
  1231		if (IS_ERR(apb_rst)) {
  1232			ret = PTR_ERR(apb_rst);
  1233	
  1234			if (ret != -EPROBE_DEFER)
  1235				dev_err(dev, "Unable to get reset control: %d\n", ret);
  1236	
  1237			return ret;
  1238		}
  1239	
  1240		if (apb_rst) {
  1241			ret = clk_prepare_enable(dsi->pclk);
  1242			if (ret) {
  1243				dev_err(dev, "%s: Failed to enable pclk\n", __func__);
  1244				return ret;
  1245			}
  1246	
  1247			reset_control_assert(apb_rst);
  1248			usleep_range(10, 20);
  1249			reset_control_deassert(apb_rst);
  1250	
  1251			clk_disable_unprepare(dsi->pclk);
  1252		}
  1253	
  1254		dw_mipi_dsi_debugfs_init(dsi);
  1255		pm_runtime_enable(dev);
  1256	
  1257		dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
  1258		dsi->dsi_host.dev = dev;
  1259		dsi->bridge.driver_private = dsi;
  1260		dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
  1261		dsi->bridge.of_node = pdev->dev.of_node;
  1262	
  1263		ret = mipi_dsi_host_register(&dsi->dsi_host);
  1264		if (ret) {
  1265			dev_err(dev, "Failed to register MIPI host: %d\n", ret);
  1266			pm_runtime_disable(dev);
  1267			dw_mipi_dsi_debugfs_remove(dsi);
  1268			return ret;
  1269		}
  1270	
  1271	
  1272		return 0;
  1273	}
  1274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
