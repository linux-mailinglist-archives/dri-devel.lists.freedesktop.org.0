Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51ABB1BE9E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 04:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD94810E089;
	Wed,  6 Aug 2025 02:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIREp0Sd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E33310E089
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 02:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754445992; x=1785981992;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nnBwTSC209K3q4e6ORVgVpaQQzSbHoYzuw45O30/ZkI=;
 b=dIREp0SdEXQXE3IIaFjXjvpUjDnMGv7IfqYnQPRRL6FPNZcwLKlFuzk7
 aZOHY5KbYmwgb0q8S+3WFPq6SLgIg1+//a1D7Wuy2CFGJHfevWjSyMVFw
 Kg+7kuipH4Hkhn2XeK41gCnlci0snsI00geq8K9mVXf1fs7gvX6ldsN/y
 lapCV1ZIqoQRhWlXHbu336j4fSpj2PygzODWrT46SD158I0u+iwaHCN9t
 3xYHVwjCu8OMccWwQJUX0cKbvMmmvX65aTznqfPsaJm/BpS+NuARUJees
 V1RuI38S3Gl9sHHhZYlEgdzSty//6H8AIGj57T+8LfgaNDytVGTnRcqxO Q==;
X-CSE-ConnectionGUID: NHgf1HCPRiqkx5OmA0e3sg==
X-CSE-MsgGUID: pulcBS84SMO2FjzOxTPW0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56898858"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56898858"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 19:06:31 -0700
X-CSE-ConnectionGUID: qqDZm+mbT+KUmvSFZA6eGw==
X-CSE-MsgGUID: GAaq7cCFSDal7+AU0aSj3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164550223"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2025 19:06:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ujTXp-0000uo-2R;
 Wed, 06 Aug 2025 02:06:21 +0000
Date: Wed, 6 Aug 2025 10:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Peter Robinson <pbrobinson@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/5] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
Message-ID: <202508060926.LBB36bfZ-lkp@intel.com>
References: <20250729090032.97-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729090032.97-3-kernel@airkyi.com>
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

Hi Chaoyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250729]
[also build test WARNING on linus/master v6.16]
[cannot apply to robh/for-next rockchip/for-next krzk/for-next krzk-dt/for-next v6.16 v6.16-rc7 v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/dt-bindings-phy-rockchip-rk3399-typec-phy-Support-mode-switch/20250729-170255
base:   next-20250729
patch link:    https://lore.kernel.org/r/20250729090032.97-3-kernel%40airkyi.com
patch subject: [PATCH v3 2/5] phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
config: loongarch-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250806/202508060926.LBB36bfZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060926.LBB36bfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060926.LBB36bfZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: iov_iter_zero+0x1c4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: copy_folio_from_iter_atomic+0x3e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_advance+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_revert+0xd4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_single_seg_count+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_is_aligned+0xe0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_alignment+0xa8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_npages+0xd8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_extract_pages+0x1dc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rhashtable_jhash2+0x128: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: refcount_warn_saturate+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: string_unescape+0x2ac: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: string_escape_mem+0x3d4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: kstrtobool+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: vvar_fault.llvm.2652528131661753876+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __devm_ioremap.llvm.2872827248248264962+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: zlib_inflate+0x174: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: find_poly_roots+0x5cc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: HUF_compress1X_usingCTable_internal.llvm.16785660852261606571+0x118: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_cParam_getBounds+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_CCtx_setParameter+0x144: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_CCtxParams_setParameter+0xb0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_CCtxParams_getParameter+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_CCtx_setCParams+0x184: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_buildEntropyStatisticsAndEstimateSubBlockSize+0x150: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_loadDictionaryContent+0x45c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_buildCTable+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_compressSuperBlock+0x180: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_fillDoubleHashTable+0x428: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_compressBlock_doubleFast_extDict+0x2a0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_fillHashTable+0x484: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_compressBlock_fast_extDict+0x2f4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_dedicatedDictSearch_lazy_loadDictionary+0x680: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_insertAndFindFirstIndex+0x240: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_insertBt1+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: HUF_readDTableX1_wksp+0x4d4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: HUF_decompress1X2_usingDTable_internal+0x118: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: HUF_decompress1X1_usingDTable_internal+0x128: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: HUF_decompress4X2_usingDTable_internal+0x1014: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: HUF_decompress4X1_usingDTable_internal+0xeac: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: HUF_fillDTableX2ForWeight+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: BIT_initDStream+0x104: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: BIT_initDStream+0x104: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_getFrameHeader_advanced+0x30c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_nextInputType+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_decompressContinue+0x12c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_dParam_getBounds+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_DCtx_setParameter+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_DCtx_getParameter+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_decompressStream+0x33c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_decodeLiteralsBlock+0x108: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_buildSeqTable+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_decompressSequencesLong+0x208: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_decompressSequencesSplitLitBuffer+0x1e4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_decompressSequences+0x20c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ERR_getErrorString+0xb0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: FSE_decompress_wksp_bmi2+0x3bc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xz_dec_run+0x100: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xz_dec_lzma2_run+0xec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bcj_apply+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xz_dec_bcj_reset+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ei_seq_show+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: stack_depot_save_flags+0x128: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: asn1_ber_decoder+0x1a4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: msi_lib_init_dev_msi_info+0x90: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rza1_irqc_set_type+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rzv2h_icu_set_type+0xe8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: lpic_get_gsi_domain_id+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: complete_irq_moving+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: liointc_set_type+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pch_pic_set_type+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mchp_eic_domain_alloc+0xc4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mchp_eic_irq_set_type+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mhi_intvec_threaded_handler+0x130: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mhi_process_ctrl_ev_ring+0x270: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: parse_xfer_event+0xf0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mhi_pm_st_worker+0x154: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mhi_async_power_up+0x14c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: phy_g12a_mipi_dphy_analog_power_on+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: brcm_sata_phy_init+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: brcm_pm_notifier+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: brcm_usb_phy_xlate+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: usb_init_xhci+0x1c0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cdns_torrent_phy_probe+0x824: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cdns_torrent_phy_configure_multilink+0x8f4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cdns_sierra_get_optional+0xf4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_phy_xlate+0xe0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_phy_xlate+0xd8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_phy_init+0x28c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_phy_init+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: phy_type_show+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: u2_phy_params_write+0xd4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: u2_phy_params_show+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: u3_phy_params_write+0xd4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: u3_phy_params_show+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_xfi_tphy_set_mode+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_hdmi_pll_set_rate+0x5e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rockchip_usb2phy_otg_sm_work+0xe0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rockchip_chg_detect_work+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rk3588_usb2phy_tuning+0x54: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: tcphy_typec_mux_set+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: omap_control_phy_power+0xe4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tusb1210_chg_det_work+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: wiz_phy_reset_deassert+0x90: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xpsgtr_xlate+0x10c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xpsgtr_lane_set_protocol+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: amd_gpio_dbg_show+0x144: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: amd_pinconf_get+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: amd_pinconf_set+0xdc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: amd_gpio_irq_set_type+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: alt_gpio_irq_type+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: at91_pmx_set+0x230: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: at91_pinconf_dbg_show+0x33c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: aw9523_pconf_get+0xe0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: aw9523_pconf_set+0x108: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: aw9523_pcfg_param_to_reg+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cy8c95x0_writeable_register+0xa4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cy8c95x0_readable_register+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cy8c95x0_volatile_register+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cy8c95x0_irq_set_type+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cy8c95x0_pinconf_get+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cy8c95x0_pinconf_set+0x110: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: eqbr_pinconf_get+0x18c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: eqbr_pinconf_set+0x14c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: funcs_utils+0x1a0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: eqbr_gpio_set_irq_type+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: lpc18xx_pconf_get+0x1dc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: lpc18xx_pconf_set+0x258: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: max77620_pinconf_get+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: max77620_pinconf_set+0x160: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: max77620_set_fps_param+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pistachio_pinconf_get+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pistachio_pinconf_set+0x124: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pistachio_gpio_irq_set_type+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pcs_pinconf_set+0x1a8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: th1520_pinconf_get+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: th1520_pinconf_set+0x11c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: owl_pin_config_get+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: owl_pin_config_set+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: owl_group_config_get+0x12c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: owl_group_config_set+0x1e4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: irq_set_type+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bcm281xx_pinctrl_pin_config_set+0x354: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bcm2835_gpio_irq_set_type+0x140: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bcm2835_gpio_irq_config+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bcm6362_pinctrl_set_mux+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bcm63268_pinctrl_set_mux+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iproc_gpio_irq_set_type+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iproc_gpio_irq_set_type+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iproc_pin_config_get+0xec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iproc_pin_config_set+0x174: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nsp_gpio_irq_set_type+0xe8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nsp_pin_config_get+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nsp_pin_config_set+0xc4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: madera_pin_probe+0x90: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: madera_pin_conf_get+0xd8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: madera_pin_conf_set+0xe4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_pctrl_spec_pull_set_samereg+0x11c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_pconf_group_set+0xdc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_pconf_group_set+0x158: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_pinconf_bias_set_combo+0x418: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_pinconf_get+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_pinconf_get+0xd4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_pinconf_set+0x130: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: mtk_pctrl_show_one_pin+0x180: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: airoha_pinconf_get+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: airoha_pinconf_set+0x100: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: airoha_irq_unmask+0xa8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: npcm7xx_config_get+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: npcm7xx_config_set+0xf0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: npcmgpio_set_irq_type+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ma35_pinconf_get+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ma35_pinconf_set+0x1b8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ma35_irq_irqtype+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: msm_config_group_get+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: msm_config_group_set+0xec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: msm_config_reg+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: msm_gpio_irq_set_type+0x430: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pm8xxx_pin_config_get+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pm8xxx_pin_config_get+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pm8xxx_pin_config_set+0xc8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pm8xxx_pin_config_set+0xec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pm8xxx_mpp_probe+0x1b4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: lpi_config_get+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: lpi_config_set+0x110: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sh_pfc_config_mux+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sh_pfc_pinconf_get+0x94: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sh_pfc_pinconf_set+0xc4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sh_pfc_pinconf_validate+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: r8a77990_pin_to_pocctrl+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: r8a7794_pin_to_pocctrl+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: r8a77970_pin_to_pocctrl+0x48: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: r8a779h0_pin_to_pocctrl+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rzg2l_pinctrl_pinconf_get+0x164: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rzg2l_pinctrl_pinconf_set+0x338: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rzv2h_hw_to_bias_param+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rzn1_pinconf_get+0xa4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rzn1_pinconf_set+0xec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: s3c64xx_gpio_irq_set_type+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: s3c64xx_eint0_irq_set_type+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sg2042_pconf_get+0xa4: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
