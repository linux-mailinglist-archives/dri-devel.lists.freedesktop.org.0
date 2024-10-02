Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8AF98CC66
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 07:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FB410E69C;
	Wed,  2 Oct 2024 05:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Msj8oyX/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A7710E69C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 05:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727847296; x=1759383296;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ou0SirmnT+7vKKSMpBPJ1Y6Hrb0ytOzqYtHSHqkbplE=;
 b=Msj8oyX/6v3tgHz0RJqke4ubhO9I7/exA/4u055S+rpNEEkAn7nEXibw
 azsP7+fEYh2rBwqlXCc0Moyu5185168yfo7B9mfAZfiz3H+O2AYum3Mfg
 CPW7dWxzBZLPCdlo8Eo5IbcsZruWPjqvfkrV2QMJA398byHmRBWBpBSPt
 7UgqxJd/keIszCde/NMq7UUvp1YUEJLq2A23L6J/vDnKlLqVyJ1hSUOmA
 jIOuahKooEvxD7duzgbvxWtU5c90mQ0Tepi4UhLiLvsx94xXhIi1jTCCj
 Jvy1eIiTN+6ofyflLBMm9vBgblwoAK/2Y5fi2dc7O5Cw4ug6UWlijvvTH g==;
X-CSE-ConnectionGUID: wzKpelH4QVCLM+5ifbyTRg==
X-CSE-MsgGUID: QBVgFwE0THiuFQ3xUtu9rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44529056"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; d="scan'208";a="44529056"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 22:34:55 -0700
X-CSE-ConnectionGUID: 1Ddtic0GTIqojw7kMygB5A==
X-CSE-MsgGUID: 3YVIFPNgQk68iJbS4BN50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; d="scan'208";a="73503842"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 01 Oct 2024 22:34:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1svs0f-000Rav-1a;
 Wed, 02 Oct 2024 05:34:49 +0000
Date: Wed, 2 Oct 2024 13:34:41 +0800
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
Subject: Re: [PATCH v5 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
Message-ID: <202410021332.VIWq2mtZ-lkp@intel.com>
References: <20240925101927.17042-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925101927.17042-3-jason-jh.lin@mediatek.com>
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
[also build test ERROR on linus/master v6.12-rc1 next-20241001]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/drm-mediatek-ovl-Add-fmt_convert-function-pointer-to-driver-data/20240925-182056
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240925101927.17042-3-jason-jh.lin%40mediatek.com
patch subject: [PATCH v5 2/2] drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
config: arm64-randconfig-002-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021332.VIWq2mtZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021332.VIWq2mtZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021332.VIWq2mtZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_disp_gamma.c:14:
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
   include/linux/vmstat.h:517:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_gamma.c:14:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:10:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_gamma.c:16:
>> drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:170:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     170 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev);
         | ^~~~~
   6 errors generated.
--
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
   include/linux/vmstat.h:517:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/mediatek/mtk_ethdr.c:18:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:10:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   3 errors generated.
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
   include/linux/vmstat.h:517:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:20:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:21:
>> drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:170:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     170 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev);
         | ^~~~~
>> drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:403:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     403 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev)
         | ^~~~~
   7 errors generated.
--
   In file included from drivers/gpu/drm/mediatek/mtk_mdp_rdma.c:15:
   In file included from drivers/gpu/drm/mediatek/mtk_disp_drv.h:13:
   In file included from drivers/gpu/drm/mediatek/mtk_plane.h:10:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/mediatek/mtk_mdp_rdma.c:15:
>> drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:170:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     170 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev);
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_mdp_rdma.c:16:
   In file included from drivers/gpu/drm/mediatek/mtk_drm_drv.h:10:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
>> drivers/gpu/drm/mediatek/mtk_mdp_rdma.c:236:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     236 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev)
         | ^~~~~
   7 errors generated.
--
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl.c:18:
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
   include/linux/vmstat.h:517:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl.c:18:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:10:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl.c:20:
>> drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:170:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     170 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev);
         | ^~~~~
>> drivers/gpu/drm/mediatek/mtk_disp_ovl.c:219:1: error: 'const' type qualifier on return type has no effect [-Werror,-Wignored-qualifiers]
     219 | const u32 mtk_ovl_get_blend_modes(struct device *dev)
         | ^~~~~
   7 errors generated.


vim +/const +83 drivers/gpu/drm/mediatek/mtk_ddp_comp.h

    48	
    49	struct mtk_ddp_comp;
    50	struct cmdq_pkt;
    51	struct mtk_ddp_comp_funcs {
    52		int (*power_on)(struct device *dev);
    53		void (*power_off)(struct device *dev);
    54		int (*clk_enable)(struct device *dev);
    55		void (*clk_disable)(struct device *dev);
    56		void (*config)(struct device *dev, unsigned int w,
    57			       unsigned int h, unsigned int vrefresh,
    58			       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
    59		void (*start)(struct device *dev);
    60		void (*stop)(struct device *dev);
    61		void (*register_vblank_cb)(struct device *dev,
    62					   void (*vblank_cb)(void *),
    63					   void *vblank_cb_data);
    64		void (*unregister_vblank_cb)(struct device *dev);
    65		void (*enable_vblank)(struct device *dev);
    66		void (*disable_vblank)(struct device *dev);
    67		unsigned int (*supported_rotations)(struct device *dev);
    68		unsigned int (*layer_nr)(struct device *dev);
    69		int (*layer_check)(struct device *dev,
    70				   unsigned int idx,
    71				   struct mtk_plane_state *state);
    72		void (*layer_config)(struct device *dev, unsigned int idx,
    73				     struct mtk_plane_state *state,
    74				     struct cmdq_pkt *cmdq_pkt);
    75		unsigned int (*gamma_get_lut_size)(struct device *dev);
    76		void (*gamma_set)(struct device *dev,
    77				  struct drm_crtc_state *state);
    78		void (*bgclr_in_on)(struct device *dev);
    79		void (*bgclr_in_off)(struct device *dev);
    80		void (*ctm_set)(struct device *dev,
    81				struct drm_crtc_state *state);
    82		struct device * (*dma_dev_get)(struct device *dev);
  > 83		const u32 (*get_blend_modes)(struct device *dev);
    84		const u32 *(*get_formats)(struct device *dev);
    85		size_t (*get_num_formats)(struct device *dev);
    86		void (*connect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
    87		void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
    88		void (*add)(struct device *dev, struct mtk_mutex *mutex);
    89		void (*remove)(struct device *dev, struct mtk_mutex *mutex);
    90		unsigned int (*encoder_index)(struct device *dev);
    91		enum drm_mode_status (*mode_valid)(struct device *dev, const struct drm_display_mode *mode);
    92	};
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
