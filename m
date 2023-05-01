Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA2E6F2E92
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 07:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB9910E261;
	Mon,  1 May 2023 05:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369E410E261
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 05:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682918103; x=1714454103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ux9Ts+3V9zBCVDNMcJUyurtBq8zr7ey0DE6a6V0SDgM=;
 b=dje08TvY0V09h0jrETXZzMMKulHvU21UzID/BEUyryBlsHZfbUahMzxJ
 L7sZhHCzYo4iBZUHkXR5r2urcOvFP7ynqzJkCSOERhG27g4BcPRbvXnCW
 h88drY7r184nP7PX9FZY2i4tiu8vr4tsTzkJdagq4Ouw6nx+dev++f5lV
 pSuoeAd22LEvxjx4fgB2y9IJPktzM40lKCSjrelPop34CCj4bYXfzzvJz
 HVLey1bueqXMhQ3raW+o9MepM2oLwJLSDoa3s66kWH8RyimQYMBSICHHr
 j0g73a/9FVVuBtyIG7x9ZrkweakR4qwMnHA3QVkTWveeCxB/WLxg/2MGQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="376132467"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="376132467"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2023 22:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="765181857"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="765181857"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2023 22:14:58 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ptLsH-0000JV-23;
 Mon, 01 May 2023 05:14:57 +0000
Date: Mon, 1 May 2023 13:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH] phy: mediatek: rework the floating point comparisons to
 fixed point
Message-ID: <202305011302.fwiJuq8v-lkp@intel.com>
References: <20230501025716.2905609-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501025716.2905609-1-trix@redhat.com>
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, oe-kbuild-all@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tom,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230428]
[cannot apply to linus/master pza/reset/next pza/imx-drm/next mbgg-mediatek/for-next v6.3 v6.3-rc7 v6.3-rc6 v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Rix/phy-mediatek-rework-the-floating-point-comparisons-to-fixed-point/20230501-110044
base:   next-20230428
patch link:    https://lore.kernel.org/r/20230501025716.2905609-1-trix%40redhat.com
patch subject: [PATCH] phy: mediatek: rework the floating point comparisons to fixed point
config: arm64-randconfig-r026-20230430 (https://download.01.org/0day-ci/archive/20230501/202305011302.fwiJuq8v-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7a707b74a3a3ce9d018ee340e478e5c75301c894
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tom-Rix/phy-mediatek-rework-the-floating-point-comparisons-to-fixed-point/20230501-110044
        git checkout 7a707b74a3a3ce9d018ee340e478e5c75301c894
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/phy/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011302.fwiJuq8v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           if (ret)
               ^~~
   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the variable 'ret' to silence this warning
           int i, ret;
                     ^
                      = 0
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331:32: warning: result of comparison of constant 74175000000 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           } else if ((pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
                      ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:336:58: warning: result of comparison of constant 74175000000 with expression of type 'u32' (aka 'unsigned int') is always true [-Wtautological-constant-out-of-range-compare]
           } else if (pixel_clk >= 27 * MEGA && (pixel_clk * 1000) < 74175 * MEGA) {
                                                ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   3 warnings generated.


vim +331 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c

   303	
   304	static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
   305	{
   306		struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
   307		void __iomem *regs = hdmi_phy->regs;
   308		u8 data_channel_bias, clk_channel_bias;
   309		u8 impedance, impedance_en;
   310		u32 tmds_clk;
   311		u32 pixel_clk = hdmi_phy->pll_rate;
   312	
   313		tmds_clk = pixel_clk;
   314	
   315		/* bias & impedance setting:
   316		 * 3G < data rate <= 6G: enable impedance 100ohm,
   317		 *      data channel bias 24mA, clock channel bias 20mA
   318		 * pixel clk >= HD,  74.175MHZ <= pixel clk <= 300MHZ:
   319		 *      enalbe impedance 100ohm
   320		 *      data channel 20mA, clock channel 16mA
   321		 * 27M =< pixel clk < 74.175: disable impedance
   322		 *      data channel & clock channel bias 10mA
   323		 */
   324	
   325		/* 3G < data rate <= 6G, 300M < tmds rate <= 594M */
   326		if (tmds_clk > 300 * MEGA && tmds_clk <= 594 * MEGA) {
   327			data_channel_bias = 0x3c; /* 24mA */
   328			clk_channel_bias = 0x34; /* 20mA */
   329			impedance_en = 0xf;
   330			impedance = 0x36; /* 100ohm */
 > 331		} else if ((pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
   332			data_channel_bias = 0x34; /* 20mA */
   333			clk_channel_bias = 0x2c; /* 16mA */
   334			impedance_en = 0xf;
   335			impedance = 0x36; /* 100ohm */
 > 336		} else if (pixel_clk >= 27 * MEGA && (pixel_clk * 1000) < 74175 * MEGA) {
   337			data_channel_bias = 0x14; /* 10mA */
   338			clk_channel_bias = 0x14; /* 10mA */
   339			impedance_en = 0x0;
   340			impedance = 0x0;
   341		} else {
   342			return -EINVAL;
   343		}
   344	
   345		/* bias */
   346		mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D0, data_channel_bias);
   347		mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D1, data_channel_bias);
   348		mtk_phy_update_field(regs + HDMI_1_CFG_1, RG_HDMITX21_DRV_IBIAS_D2, data_channel_bias);
   349		mtk_phy_update_field(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_IBIAS_CLK, clk_channel_bias);
   350	
   351		/* impedance */
   352		mtk_phy_update_field(regs + HDMI_1_CFG_0, RG_HDMITX21_DRV_IMP_EN, impedance_en);
   353		mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D0_EN1, impedance);
   354		mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D1_EN1, impedance);
   355		mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_D2_EN1, impedance);
   356		mtk_phy_update_field(regs + HDMI_1_CFG_2, RG_HDMITX21_DRV_IMP_CLK_EN1, impedance);
   357	
   358		return 0;
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
