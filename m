Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62A59891F6
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 00:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFF810E0A0;
	Sat, 28 Sep 2024 22:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejh2e5+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F8E10E0A0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 22:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727563986; x=1759099986;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JQc0Z2OjYL4V5ha5EFr4cWv2UKg0TOWssALGaegsMts=;
 b=ejh2e5+KclfIAD+69qxreYXOIwaVp7bov+QZe3XwacfoUIGAe9GC4ada
 x4uL0eeTjNIyxth10gXmMdTtC7FGcip3yIuclpjDFfzlKKmDkgovFq9qD
 u9nPpP4vEU++3ZMD/xiHhiE25wb+zvMx8GNpXriEjT6B+QWpHtjkdS38q
 fHAaQ1laNbKE3li1pcpQ9DiamlOW6yhjbwjeWfBRLRjNQWi9v0DxND6x4
 Vnrscq/GxBNfl1hAJQib++vWEHlZSKrQL3617K2xhcf4pcgKX2DCT4XJP
 nN9FZuheCYX9cIgIyzRPA8rtidvj2l2KQ0UeOmIqVm5YKZmxWM5vpK/vB g==;
X-CSE-ConnectionGUID: h/pSylzrTDeOqHd4XgRsUw==
X-CSE-MsgGUID: 6OsSCP5ASliBC5ktt4jgNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="52096693"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="52096693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2024 15:53:06 -0700
X-CSE-ConnectionGUID: S4HAL6U0THeeehG2HcCX5A==
X-CSE-MsgGUID: kbcuEdr5Rqa1gR96kN6zNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="72760530"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 15:53:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sugJA-000Njn-05;
 Sat, 28 Sep 2024 22:53:00 +0000
Date: Sun, 29 Sep 2024 06:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Shawn Sung <shawn.sung@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
Message-ID: <202409290651.YLKsl39c-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on linus/master next-20240927]
[cannot apply to v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/drm-mediatek-ovl-Add-blend_modes-to-driver-data/20240926-163734
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240926083526.24629-3-jason-jh.lin%40mediatek.com
patch subject: [PATCH v6 2/2] drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
config: arm64-randconfig-001-20240929 (https://download.01.org/0day-ci/archive/20240929/202409290651.YLKsl39c-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290651.YLKsl39c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290651.YLKsl39c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_ethdr.c:18:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:9:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/mediatek/mtk_ethdr.c:18:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:10:
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_ethdr.c:21:
>> drivers/gpu/drm/mediatek/mtk_ethdr.h:16:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      16 | const u32 mtk_ethdr_get_blend_modes(struct device *dev);
         | ^~~~~
>> drivers/gpu/drm/mediatek/mtk_ethdr.c:148:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     148 | const u32 mtk_ethdr_get_blend_modes(struct device *dev)
         | ^~~~~
   5 warnings generated.
--
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:7:
   In file included from include/drm/drm_of.h:8:
   In file included from include/drm/drm_bridge.h:30:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:20:
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:21:
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:23:
>> drivers/gpu/drm/mediatek/mtk_ethdr.h:16:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      16 | const u32 mtk_ethdr_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:403:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     403 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev)
         | ^~~~~
   7 warnings generated.


vim +/const +16 drivers/gpu/drm/mediatek/mtk_ethdr.h

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
