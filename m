Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C434217C6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 21:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF316E202;
	Mon,  4 Oct 2021 19:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6526E02B;
 Mon,  4 Oct 2021 19:42:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206385404"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206385404"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 12:01:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="487665636"
Received: from mkatta5-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.38.15])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 12:01:41 -0700
Date: Mon, 4 Oct 2021 15:01:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next
Message-ID: <YVtPk6llsxBFiw7W@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hi Dave and Daniel,

Here goes an accumulated pull request. A special highlight to
the ADL-P (XE_LPD) and DG2 display support preparation and on
a big clean-up in the display portion of the driver.

Here goes drm-intel-next-2021-10-04:

Cross-subsystem Changes:
- fbdev/efifb: Release PCI device's runtime PM ref during FB destr\
oy (Imre)

i915 Core Driver Changes:
- Only access SFC_DONE in media when not fused off for graphics 12 and newer.
- Double Memory latency values from pcode for DG2 (Matt Roper)
- ADL-S PCI ID update (Tejas)
- New DG1 PCI ID (Jose)
- Fix regression with uncore refactoring (Dave)

i915 Display Changes:
- ADL-P display (XE_LPD) fixes and updates (Ankit, Jani, Matt Roper, Anusham, Jose, Imre, Vandita)
- DG2 display fixes (Ankit, Jani)
- Expand PCH_CNP tweaked display workaround to all newer displays (Anshuman)
- General display simplifications and clean-ups (Jani, Swati, Jose, Ville)
- PSR Clean-ups, dropping support for BDW/HSD and enable PSR2 selective fetch by default (Jose, Gwan-gyeong)
- Nuke ORIGIN_GTT (Jose)
- Return proper DPRX link training result (Lee)
- FBC related refactor and fixes (Ville)
- Yet another attempt to solve the fast+narrow vs slow+wide eDP link training (Kai-Heng)
- DP 2.0 preparation work (Jani)
- Silence __iomem sparse warn (Ville)
- Clean up DPLL stuff (Ville)
- Fix various dp/edp max rates (Matt Atwood, Animesh, Jani)
- Remove VBT ddi_port_info caching (Jani)
- DSI driver improvements (Lee)
- HDCP fixes (Juston)
- Associate ACPI connector nodes with connector entries (Heikki)
- Add support for out-of-bound hotplug events (Hans)
- VESA vendor block and drm/i915 MSO use of it (Jani)
- Fixes for bigjoiner (Ville)
- Update memory bandwidth parameters (RK)
- DMC related fixes (Chris, Jose)
- HDR related fixes and improvements (Tejas)
- g4x/vlv/chv CxSR/wm fixes/cleanups (Ville)
- Use BIOS provided value for RKL Audio's HDA link (Kai-Heng)
- Fix the dsc check while selecting min_cdclk (Vandita)
- Split and constify vtable (Dave)
- Add ww context to intel_dpt_pin (Maarten)
- Fix bdb version check (Lukasz)
- DP per-lane drive settings prep work and other DP fixes (Ville)

Thanks,
Rodrigo.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2021-10-04

for you to fetch changes up to 104c1b3d6fb6a794babd5e2ffd6a5183b5a3d6c7:

  drm/i915: Allow per-lane drive settings with LTTPRs (2021-10-04 13:04:36 +0300)

----------------------------------------------------------------
Cross-subsystem Changes:
- fbdev/efifb: Release PCI device's runtime PM ref during FB destr\
oy (Imre)

i915 Core Driver Changes:
- Only access SFC_DONE in media when not fused off for graphics 12 and newer.
- Double Memory latency values from pcode for DG2 (Matt Roper)
- ADL-S PCI ID update (Tejas)
- New DG1 PCI ID (Jose)
- Fix regression with uncore refactoring (Dave)

i915 Display Changes:
- ADL-P display (XE_LPD) fixes and updates (Ankit, Jani, Matt Roper, Anusham, Jose, Imre, Vandita)
- DG2 display fixes (Ankit, Jani)
- Expand PCH_CNP tweaked display workaround to all newer displays (Anshuman)
- General display simplifications and clean-ups (Jani, Swati, Jose, Ville)
- PSR Clean-ups, dropping support for BDW/HSD and enable PSR2 selective fetch by default (Jose, Gwan-gyeong)
- Nuke ORIGIN_GTT (Jose)
- Return proper DPRX link training result (Lee)
- FBC related refactor and fixes (Ville)
- Yet another attempt to solve the fast+narrow vs slow+wide eDP link training (Kai-Heng)
- DP 2.0 preparation work (Jani)
- Silence __iomem sparse warn (Ville)
- Clean up DPLL stuff (Ville)
- Fix various dp/edp max rates (Matt Atwood, Animesh, Jani)
- Remove VBT ddi_port_info caching (Jani)
- DSI driver improvements (Lee)
- HDCP fixes (Juston)
- Associate ACPI connector nodes with connector entries (Heikki)
- Add support for out-of-bound hotplug events (Hans)
- VESA vendor block and drm/i915 MSO use of it (Jani)
- Fixes for bigjoiner (Ville)
- Update memory bandwidth parameters (RK)
- DMC related fixes (Chris, Jose)
- HDR related fixes and improvements (Tejas)
- g4x/vlv/chv CxSR/wm fixes/cleanups (Ville)
- Use BIOS provided value for RKL Audio's HDA link (Kai-Heng)
- Fix the dsc check while selecting min_cdclk (Vandita)
- Split and constify vtable (Dave)
- Add ww context to intel_dpt_pin (Maarten)
- Fix bdb version check (Lukasz)
- DP per-lane drive settings prep work and other DP fixes (Ville)

----------------------------------------------------------------
Animesh Manna (3):
      drm/i915/dg2: UHBR tables added for pll programming
      drm/i915/dp: fix EHL/JSL max source rates calculation
      drm/i915/dp: fix for ADL_P/S dp/edp max source rates

Ankit Nautiyal (2):
      drm/i915/display: Fix the 12 BPC bits for PIPE_MISC reg
      drm/i915/dg2: Configure PCON in DP pre-enable path

Anshuman Gupta (1):
      drm/i915: Tweaked Wa_14010685332 for all PCHs

Anusha Srivatsa (1):
      drm/i915/dmc: Update to DMC v2.12

Chris Wilson (1):
      drm/i915: Free all DMC payloads

Dave Airlie (25):
      drm/i915/uncore: split the fw get function into separate vfunc
      drm/i915/pm: drop get_fifo_size vfunc.
      drm/i915: make update_wm take a dev_priv.
      drm/i915/wm: provide wrappers around watermark vfuncs calls (v3)
      drm/i915: add wrappers around cdclk vtable funcs.
      drm/i915/display: add intel_fdi_link_train wrapper.
      drm/i915: split clock gating init from display vtable
      drm/i915: split watermark vfuncs from display vtable.
      drm/i915: split color functions from display vtable
      drm/i915: split audio functions from display vtable
      drm/i915: split cdclk functions from display vtable.
      drm/i915: split irq hotplug function from display vtable
      drm/i915: split fdi link training from display vtable.
      drm/i915: split the dpll clock compute out from display vtable.
      drm/i915: constify fdi link training vtable
      drm/i915: constify hotplug function vtable.
      drm/i915: constify color function vtable.
      drm/i915: constify the audio function vtable
      drm/i915: constify the dpll clock vtable
      drm/i915: constify the cdclk vtable
      drm/i915: drop unused function ptr and comments.
      drm/i915: constify display function vtable
      drm/i915: constify clock gating init vtable.
      drm/i915: constify display wm vtable
      drm/i915: fix regression with uncore refactoring.

Gwan-gyeong Mun (1):
      drm/i915/display/psr: Do full fetch when handling multi-planar formats

Hans de Goede (1):
      drm/i915/dp: Add support for out-of-bound hotplug events

Heikki Krogerus (1):
      drm/i915: Associate ACPI connector nodes with connector entries (v2)

Imre Deak (19):
      fbdev/efifb: Release PCI device's runtime PM ref during FB destroy
      drm/i915: Use tile block based dimensions for CCS origin x, y check
      drm/i915/adlp: Require always a power-of-two sized CCS surface stride
      drm/i915/adlp: Assert that VMAs in DPT start at 0
      drm/i915: Follow a new->old platform check order in intel_fb_stride_alignment
      drm/i915/adlp: Add support for remapping CCS FBs
      drm/i915/tc: Fix TypeC port init/resume time sanitization
      drm/i915/adlp/tc: Fix PHY connected check for Thunderbolt mode
      drm/i915/tc: Remove waiting for PHY complete during releasing ownership
      drm/i915/tc: Check for DP-alt, legacy sinks before taking PHY ownership
      drm/i915/tc: Add/use helpers to retrieve TypeC port properties
      drm/i915/tc: Don't keep legacy TypeC ports in connected state w/o a sink
      drm/i915/tc: Add a mode for the TypeC PHY's disconnected state
      drm/i915/tc: Refactor TC-cold block/unblock helpers
      drm/i915/tc: Avoid using legacy AUX PW in TBT mode
      drm/i915/icl/tc: Remove the ICL special casing during TC-cold blocking
      drm/i915/tc: Fix TypeC PHY connect/disconnect logic on ADL-P
      drm/i915/tc: Drop extra TC cold blocking from intel_tc_port_connected()
      drm/i915/tc: Fix system hang on ADL-P during TypeC PHY disconnect

Jani Nikula (81):
      drm/i915/edp: fix eDP MSO pipe sanity checks for ADL-P
      drm/i915/mst: use intel_de_rmw() to simplify VC payload alloc set/clear
      drm/i915/dp: pass crtc_state to intel_ddi_dp_level()
      drm/i915/dg2: use existing mechanisms for SNPS PHY translations
      drm/i915/dg2: add SNPS PHY translations for UHBR link rates
      Merge drm/drm-next into drm-intel-next
      drm/i915/dp: remove superfluous EXPORT_SYMBOL()
      drm/i915/irq: reduce inlines to reduce header dependencies
      drm/i915: intel_runtime_pm.h does not actually need intel_display.h
      drm/i915/pm: use forward declaration to remove an include
      drm/i915/panel: move intel_panel_use_ssc() out of headers
      drm/i915/fdi: move intel_fdi_link_freq() to intel_fdi.[ch]
      drm/i915/dp: use actual link rate values in struct link_config_limits
      drm/i915/dp: read sink UHBR rates
      drm/i915/dg2: add TRANS_DP2_CTL register definition
      drm/i915/dg2: add TRANS_DP2_VFREQHIGH and TRANS_DP2_VFREQLOW
      drm/i915/dg2: add DG2 UHBR source rates
      drm/i915/dp: add max data rate calculation for UHBR rates
      drm/i915/fdi: make intel_fdi_link_freq() return int
      drm/i915/display: split out dpt out of intel_display.c
      drm/i915: add HAS_ASYNC_FLIPS feature macro
      drm/i915/fb: move intel_tile_width_bytes() to intel_fb.c
      drm/i915/fb: move intel_fb_align_height() to intel_fb.c
      drm/i915/fb: move intel_surf_alignment() to intel_fb.c
      drm/i915/fb: move user framebuffer stuff to intel_fb.c
      drm/i915/backlight: extract backlight code to a separate file
      drm/i915/backlight: mass rename functions to have intel_backlight_ prefix
      drm/i915/panel: mass rename functions to have intel_panel_ prefix
      drm/i915/snps: constify struct intel_mpllb_state arrays harder
      drm/i915/fdi: move intel_update_fdi_pll_freq to intel_fdi.c
      drm/i915/fdi: move fdi bc bifurcation functions to intel_fdi.c
      drm/i915/fdi: move more FDI stuff to FDI link train hooks
      drm/i915/fdi: move fdi mphy reset and programming to intel_fdi.c
      drm/i915/fdi: convert BUG()'s to MISSING_CASE()
      drm/i915: remove unused i915->active_pipes
      drm/i915/dp: fix DG2 max source rate check
      drm/i915/debugfs: clean up LPSP status
      drm/i915/debugfs: clean up LPSP capable
      drm/i915/dp: fix TGL and ICL max source rates
      drm/i915/dp: fix DG1 and RKL max source rates
      drm/i915/bios: use hdmi level shift directly from child data
      drm/i915/bios: use max tmds clock directly from child data
      drm/i915/bios: use dp max link rate directly from child data
      drm/i915/bios: use alternate aux channel directly from child data
      drm/i915/bios: move ddc pin mapping code next to ddc pin sanitize
      drm/i915/bios: use ddc pin directly from child data
      drm/i915/bios: get rid of vbt ddi_port_info
      drm/displayid: re-align data block macros
      drm/displayid: add DisplayID v2.0 data blocks and primary use cases
      drm/edid: abstract OUI conversion to 24-bit int
      drm/edid: parse the DisplayID v2.0 VESA vendor block for MSO
      drm/i915/edp: postpone MSO init until after EDID read
      drm/i915/edp: use MSO pixel overlap from DisplayID data
      drm/dp: add DP 2.0 UHBR link rate and bw code conversions
      drm/dp: use more of the extended receiver cap
      drm/dp: add LTTPR DP 2.0 DPCD addresses
      drm/dp: add helper for extracting adjust 128b/132b TX FFE preset
      drm/i915/dg2: add DG2+ TRANS_DDI_FUNC_CTL DP 2.0 128b/132b mode
      drm/i915/dp: add helper for checking for UHBR link rate
      drm/i915/dp: use 128b/132b TPS2 for UHBR+ link rates
      drm/i915/dp: select 128b/132b channel encoding for UHBR rates
      drm/i915/dg2: configure TRANS_DP2_CTL for DP 2.0
      drm/i915/dp: add HAS_DP20 macro
      drm/i915/dg2: use 128b/132b transcoder DDI mode
      drm/i915/dg2: configure TRANS_DP2_VFREQ{HIGH,LOW} for 128b/132b
      drm/i915/fdi: move fdi modeset asserts to intel_fdi.c
      drm/i915/pps: move pps (panel) modeset asserts to intel_pps.c
      drm/i915/dpll: move dpll modeset asserts to intel_dpll.c
      drm/i915/dsi: move dsi pll modeset asserts to vlv_dsi_pll.c
      drm/i915/dsi: pass struct mipi_dsi_packet pointer, not the entire struct
      drm/i915/dsi: fuse dsi_send_pkt_payld() and add_payld_to_queue()
      drm/i915/dsi: return -EBUSY instead of -1
      drm/i915/hdmi: return -EINVAL instead of -1
      drm/i915/drv: return -EIO instead of -1
      drm/i915/dram: return -EINVAL instead of -1
      drm/i915/fdi: use -EAGAIN instead of local special return value
      drm/i915/hdmi: convert intel_hdmi_to_dev to intel_hdmi_to_i915
      drm/i915/debugfs: register LPSP capability on all platforms
      drm/i915/display: stop returning errors from debugfs registration
      drm/i915/debugfs: pass intel_connector to intel_connector_debugfs_add()
      drm/i915/reg: add AUD_TCA_DP_2DOT0_CTRL registers

José Roberto de Souza (24):
      drm/i915/display: Fix sel fetch plane offset calculation
      drm/i915: Nuke ORIGIN_GTT
      drm/i915/display: Drop PSR support from HSW and BDW
      drm/i915/display: Move DRRS code its own file
      drm/i915/display: Renaming DRRS functions to intel_drrs_*()
      drm/i915/display: Some code improvements and code style fixes for DRRS
      drm/i915/display: Share code between intel_drrs_flush and intel_drrs_invalidate
      drm/i915/display: Prepare DRRS for frontbuffer rendering drop
      drm/i915/dg1: Add new PCI id
      drm/i915/display/adlp: Fix PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR calculation
      drm/i915/display: Wait at least 2 frames before selective update
      drm/i915/display: Workaround cursor left overs with PSR2 selective fetch enabled
      drm/i915/display/psr: Use drm damage helpers to calculate plane damaged area
      drm/i915/display/adlp: Add new PSR2 workarounds
      drm/i915/display/dmc: Set DC_STATE_DEBUG_MASK_CORES after firmware load
      drm/i915/display: Match PSR2 selective fetch sequences with specification
      drm/i915/display: Only keep PSR enabled if there is active planes
      drm/i915/display/psr: Handle plane and pipe restrictions at every page flip
      drm/i915/display: Drop unnecessary frontbuffer flushes
      drm/i915/display: Handle frontbuffer rendering when PSR2 selective fetch is enabled
      drm/i915/display: Fix glitches when moving cursor with PSR2 selective fetch enabled
      drm/i915/display/adlp: Optimize PSR2 power-savings in corner cases
      drm/i915/display/adlp: Allow PSR2 to be enabled
      drm/i915/display: Enable PSR2 selective fetch by default

Juston Li (3):
      drm/i915/hdcp: update cp_irq_count_cached in intel_dp_hdcp2_read_msg()
      drm/i915/hdcp: read RxInfo once when reading RepeaterAuth_Send_ReceiverID_List
      drm/i915/hdcp: reuse rx_info for mst stream type1 capability check

Kai-Heng Feng (2):
      drm/i915/dp: Use max params for panels < eDP 1.4
      drm/i915/audio: Use BIOS provided value for RKL HDA link

Lee Shawn C (6):
      drm/i915/dp: return proper DPRX link training result
      drm/i915/dsi: wait for header and payload credit available
      drm/i915/dsi: refine send MIPI DCS command sequence
      drm/i915: Get proper min cdclk if vDSC enabled
      drm/i915/dsi: Retrieve max brightness level from VBT
      drm/i915/dsi: Read/write proper brightness value via MIPI DCS command

Lukasz Majczak (1):
      drm/i915/bdb: Fix version check

Maarten Lankhorst (1):
      drm/i915: Add ww context to intel_dpt_pin, v2.

Matt Atwood (1):
      drm/i915/dp: Fix eDP max rate for display 11+

Matt Roper (3):
      drm/i915: Only access SFC_DONE when media domain is not fused off
      drm/i915/adl_p: Also disable underrun recovery with MSO
      drm/i915/dg2: Memory latency values from pcode must be doubled

Radhakrishna Sripada (1):
      drm/i915: Update memory bandwidth parameters

Rodrigo Vivi (2):
      Merge tag 'drm-misc-intel-oob-hotplug-v1' of git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux into drm-intel-next
      Merge drm/drm-next into drm-intel-next

Swati Sharma (1):
      drm/i915/dp: Drop redundant debug print

Tejas Upadhyay (3):
      drm/i915/adl_s: Update ADL-S PCI IDs
      drm/i915/display: Add HDR mode helper function
      drm/i915/gen11: Disable cursor clock gating in HDR mode

Vandita Kulkarni (4):
      drm/i915/display: Update small joiner ram size
      drm/i915/dsi/xelpd: Add WA to program LP to HS wakeup guardband
      drm/i915/dsi/xelpd: Enable mipi dsi support.
      drm/i915/display: Fix the dsc check while selecting min_cdclk

Ville Syrjälä (63):
      drm/i915/fbc: Rewrite the FBC tiling check a bit
      drm/i915/fbc: Extract intel_fbc_update()
      drm/i915/fbc: Move the "recompress on activate" to a central place
      drm/i915/fbc: Polish the skl+ FBC stride override handling
      drm/i915: Silence __iomem sparse warn
      drm/i915: Set output_types to EDP for vlv/chv DPLL forcing
      drm/i915: Clean up gen2 DPLL readout
      drm/i915: Extract ilk_update_pll_dividers()
      drm/i915: Constify struct dpll all over
      drm/i915: Clean dpll calling convention
      drm/i915: Clean up variable names in old dpll functions
      drm/i915: Remove the 'reg' local variable
      drm/i915: Program DPLL P1 dividers consistently
      drm/i915: Call {vlv,chv}_prepare_pll() from {vlv,chv}_enable_pll()
      drm/i915: Reuse ilk_needs_fb_cb_tune() for the reduced clock as well
      drm/i915: Fold i9xx_set_pll_dividers() into i9xx_enable_pll()
      drm/i915: Fold ibx_pch_dpll_prepare() into ibx_pch_dpll_enable()
      drm/i915: Nuke intel_prepare_shared_dpll()
      drm/i915: Extract intel_dp_need_bigjoiner()
      drm/i915: Flatten hsw_crtc_compute_clock()
      drm/i915: s/pipe/transcoder/ when dealing with PIPECONF/TRANSCONF
      drm/i915: Introduce with_intel_display_power_if_enabled()
      drm/i915: Adjust intel_dsc_power_domain() calling convention
      drm/i915: Extract hsw_panel_transcoders()
      drm/i915: s/crtc_state/new_crtc_state/ etc.
      drm/i915: Use u8 consistently for active_planes bitmask
      drm/i915: Fix g4x cxsr enable condition
      drm/i915: Apply WaUse32BppForSRWM to elk as well as ctg
      drm/i915: Fix HPLL watermark readout for g4x
      drm/i915/fbc: Rework cfb stride/size calculations
      drm/i915/fbc: Align FBC segments to 512B on glk+
      drm/i915/fbc: Implement Wa_16011863758 for icl+
      drm/i915/fbc: Allow higher compression limits on FBC1
      drm/i915: Extract intel_panel_mode_valid()
      drm/i915: Use intel_panel_mode_valid() for DSI/LVDS/(s)DVO
      drm/i915: Reject modes that don't match fixed_mode vrefresh
      drm/i915: Introduce intel_panel_compute_config()
      drm/i915: Reject user modes that don't match fixed mode's refresh rate
      drm/i915: Drop pointless fixed_mode checks from dsi code
      drm/i915: Enable TPS3/4 on all platforms that support them
      drm/i915/fbc: Allow FBC with Yf tiling
      drm/i915: Pimp HSW+ transcoder state readout
      drm/i915: Configure TRANSCONF just the once with bigjoiner
      drm/i915: Clear leftover DP vswing/preemphasis values before modeset
      drm/i915: Call intel_ddi_init_dp_buf_reg() earlier
      drm/i915: Remove DP_PORT_EN stuff from link training code
      drm/i915: Nuke local copies/pointers of intel_dp->DP
      drm/i915: s/ddi_translations/trans/
      drm/i915: Use standard form -EDEADLK check
      drm/i915: Adjust intel_crtc_compute_config() debug message
      drm/i915: Move WaPruneModeWithIncorrectHsyncOffset into intel_mode_valid()
      drm/i915: Stop force enabling pipe bottom color gammma/csc
      drm/i915: Fix DP clock recovery "voltage_tries" handling
      drm/i915: Introduce has_iboost()
      drm/i915: Introduce has_buf_trans_select()
      drm/i915: Generalize .set_signal_levels()
      drm/i915: Nuke useless .set_signal_levels() wrappers
      drm/i915: De-wrapper bxt_ddi_phy_set_signal_levels()
      drm/i915: Hoover the level>=n_entries WARN into intel_ddi_level()
      drm/i915: Nuke intel_ddi_hdmi_num_entries()
      drm/i915: Pass the lane to intel_ddi_level()
      drm/i915: Prepare link training for per-lane drive settings
      drm/i915: Allow per-lane drive settings with LTTPRs

 Documentation/gpu/i915.rst                         |   25 +-
 drivers/gpu/drm/drm_connector.c                    |   79 +
 drivers/gpu/drm/drm_crtc_internal.h                |    2 +
 drivers/gpu/drm/drm_dp_helper.c                    |   42 +-
 drivers/gpu/drm/drm_edid.c                         |   89 +-
 drivers/gpu/drm/drm_sysfs.c                        |   87 +-
 drivers/gpu/drm/i915/Makefile                      |    3 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |   86 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  161 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |   46 +
 drivers/gpu/drm/i915/display/intel_acpi.h          |    3 +
 drivers/gpu/drm/i915/display/intel_audio.c         |   48 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     | 1776 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_backlight.h     |   52 +
 drivers/gpu/drm/i915/display/intel_bios.c          |  397 +++--
 drivers/gpu/drm/i915/display/intel_bw.c            |   19 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  345 ++--
 drivers/gpu/drm/i915/display/intel_cdclk.h         |    4 +-
 drivers/gpu/drm/i915/display/intel_color.c         |  140 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    6 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    9 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  479 +++--
 drivers/gpu/drm/i915/display/intel_ddi.h           |    7 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |  670 +++----
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |   11 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 1713 +++++-------------
 drivers/gpu/drm/i915/display/intel_display.h       |   32 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  121 +-
 .../gpu/drm/i915/display/intel_display_debugfs.h   |   10 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    9 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    4 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   41 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |   25 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  753 +++-----
 drivers/gpu/drm/i915/display/intel_dp.h            |   22 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    6 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   12 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   78 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  159 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   30 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   28 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |    5 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  672 +++----
 drivers/gpu/drm/i915/display/intel_dpll.h          |   26 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   46 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   11 -
 drivers/gpu/drm/i915/display/intel_dpt.c           |  239 +++
 drivers/gpu/drm/i915/display/intel_dpt.h           |   19 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |  437 +++++
 drivers/gpu/drm/i915/display/intel_drrs.h          |   36 +
 drivers/gpu/drm/i915/display/intel_dsi.c           |   16 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |    3 +
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |   33 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   24 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  606 ++++++-
 drivers/gpu/drm/i915/display/intel_fb.h            |   20 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  292 ++--
 drivers/gpu/drm/i915/display/intel_fbc.h           |    2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    3 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |  321 +++-
 drivers/gpu/drm/i915/display/intel_fdi.h           |   17 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    5 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |    4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   64 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   20 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    4 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   33 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    5 +-
 drivers/gpu/drm/i915/display/intel_panel.c         | 1835 +-------------------
 drivers/gpu/drm/i915/display/intel_panel.h         |   48 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   59 +
 drivers/gpu/drm/i915/display/intel_pps.h           |    3 +
 drivers/gpu/drm/i915/display/intel_psr.c           |  476 ++---
 drivers/gpu/drm/i915/display/intel_psr.h           |   13 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   19 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |  225 ++-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |    4 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |  290 ++--
 drivers/gpu/drm/i915/display/intel_tc.h            |    6 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    5 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   77 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |    6 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    9 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   51 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   23 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   29 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    7 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  161 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   94 +-
 drivers/gpu/drm/i915/i915_irq.h                    |   51 +-
 drivers/gpu/drm/i915/i915_params.h                 |    2 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    4 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   77 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |    7 +-
 drivers/gpu/drm/i915/intel_dram.c                  |    4 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  290 ++--
 drivers/gpu/drm/i915/intel_pm.h                    |    3 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |    2 -
 drivers/gpu/drm/i915/intel_uncore.c                |   72 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    7 +-
 drivers/usb/typec/altmodes/Kconfig                 |    1 +
 drivers/usb/typec/altmodes/displayport.c           |   58 +-
 drivers/video/fbdev/efifb.c                        |   21 +-
 include/drm/drm_connector.h                        |   37 +
 include/drm/drm_displayid.h                        |  101 +-
 include/drm/drm_dp_helper.h                        |    6 +
 include/drm/i915_pciids.h                          |    8 +-
 109 files changed, 8213 insertions(+), 6576 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_backlight.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_backlight.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_drrs.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_drrs.h
