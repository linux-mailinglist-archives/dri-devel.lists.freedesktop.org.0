Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D579891E0
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 00:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD8010E1A4;
	Sat, 28 Sep 2024 22:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaKKw2mV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69CF10E1A4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 22:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727562065; x=1759098065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9RAyA+ypZaeM4MqbmjvZP8YQy4DGo/KMw07dJSdAJo0=;
 b=YaKKw2mVtebGVKenPrW/k9X7Xc3YnByUJjitOi8ZhfMdZXcFHVj342sR
 N7fzlvPVKoczRWm38LPK0Pn3WPuH0Yq14MmZwubjpKmCCXhYR0aDGwdWZ
 XxJHOu1ASyX5tCComojHKJU/6XNFYRMrFotYsVrAhHwQ7SMzlkJG51CSR
 O4SnpVXPXAb7UkgX+XpFmF+RWJC1uSB7xtgGT8Jzl+yy+zBXeE4d3T59k
 11TRzUw5OSJNwaiJRi8HMO/4ukSMi3eJ+7AvMZ/NjtHFEgJSBdDVtfKt5
 l3VVWiAxBzME63i9+akQRMUjFVjKF3ZQgY/+pjIwmnzOoecnvaNWI9/Af A==;
X-CSE-ConnectionGUID: T+jmafF5SXyM5F8DSHzRUA==
X-CSE-MsgGUID: WNjWAPL4SC+0TB+zKsUJTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37247970"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="37247970"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2024 15:21:04 -0700
X-CSE-ConnectionGUID: iT/u9qU6TCWvbP7MkVPXJw==
X-CSE-MsgGUID: hjXfMSkoTUK9fWG1wX7Z4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="73183630"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 15:21:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sufoA-000Nhl-2M;
 Sat, 28 Sep 2024 22:20:58 +0000
Date: Sun, 29 Sep 2024 06:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Sung <shawn.sung@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
Message-ID: <202409290616.inw9UGyc-lkp@intel.com>
References: <20240926083526.24629-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926083526.24629-3-jason-jh.lin@mediatek.com>
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

Hi Jason-JH.Lin,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on linus/master next-20240927]
[cannot apply to v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/drm-mediatek-ovl-Add-blend_modes-to-driver-data/20240926-163734
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240926083526.24629-3-jason-jh.lin%40mediatek.com
patch subject: [PATCH v6 2/2] drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
config: arm-randconfig-002-20240929 (https://download.01.org/0day-ci/archive/20240929/202409290616.inw9UGyc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290616.inw9UGyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290616.inw9UGyc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:10,
                    from drivers/gpu/drm/mediatek/mtk_ethdr.c:18:
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:9: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_ethdr.c:21:
>> drivers/gpu/drm/mediatek/mtk_ethdr.h:16:1: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
      16 | const u32 mtk_ethdr_get_blend_modes(struct device *dev);
         | ^~~~~
>> drivers/gpu/drm/mediatek/mtk_ethdr.c:148:1: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
     148 | const u32 mtk_ethdr_get_blend_modes(struct device *dev)
         | ^~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:20:
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:9: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:21:
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:23:
>> drivers/gpu/drm/mediatek/mtk_ethdr.h:16:1: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
      16 | const u32 mtk_ethdr_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:403:1: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
     403 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev)
         | ^~~~~
   cc1: all warnings being treated as errors


vim +16 drivers/gpu/drm/mediatek/mtk_ethdr.h

     8	
     9	void mtk_ethdr_start(struct device *dev);
    10	void mtk_ethdr_stop(struct device *dev);
    11	int mtk_ethdr_clk_enable(struct device *dev);
    12	void mtk_ethdr_clk_disable(struct device *dev);
    13	void mtk_ethdr_config(struct device *dev, unsigned int w,
    14			      unsigned int h, unsigned int vrefresh,
    15			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
  > 16	const u32 mtk_ethdr_get_blend_modes(struct device *dev);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
