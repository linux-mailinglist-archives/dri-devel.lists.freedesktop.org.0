Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3594139126
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 13:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFC489DFE;
	Mon, 13 Jan 2020 12:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B072689DFE;
 Mon, 13 Jan 2020 12:33:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 04:33:41 -0800
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; d="scan'208";a="212983065"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 04:33:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, daniel@ffwll.ch,
 sam@ravnborg.org, sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 0/6]: drm: Introduce struct drm_device based
 WARN* and use them in i915
In-Reply-To: <20200113115557.32713-1-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200113115557.32713-1-pankaj.laxminarayan.bharadiya@intel.com>
Date: Mon, 13 Jan 2020 14:33:36 +0200
Message-ID: <87d0bnmt7j.fsf@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminaryan.bharadiya@outlook.iglb.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jan 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> Device specific dev_WARN and dev_WARN_ONCE macros available in kernel
> include device information in the backtrace, so we know what device
> the warnings originate from.
>
> Similar to this, add new struct drm_device based drm_WARN* macros. These
> macros include device information in the backtrace, so we know
> what device the warnings originate from. Knowing the device specific
> information in the backtrace would be helpful in development all
> around.
>
> This patch series aims to convert calls of WARN(), WARN_ON(),
> WARN_ONCE() and WARN_ON_ONCE() in i916 driver to use the drm
> device-specific variants automatically wherever struct device pointer
> is available.
>
> To do this, this patch series -
>   - introduces new struct drm_device based WARN* macros
>   - automatically converts WARN* with device specific dev_WARN*
>     variants using coccinelle semantic patch scripts.
>
> The goal is to convert all the calls of WARN* with drm_WARN* in i915,
> but there are still cases where device pointer is not readily
> available in some functions (or I missed them somehow) using WARN*
> hence some manual churning is needed. Handle such remaining cases
> separately later.
>
> Changes since RFC at [1]
>   - Introduce drm_WARN* macros and use them as suggested by Sam and Jani
>   - Get rid of extra local variables
>
> [1] https://patchwork.freedesktop.org/series/71668/
>
> Pankaj Bharadiya (6):
>   drm/print: introduce new struct drm_device based WARN* macros
>   drm/i915: add helper functions to get device ptr
>   drm/i915: Make WARN* drm specific where drm_device ptr available
>   drm/i915: Make WARN* drm specific where drm_priv ptr is available
>   drm/i915: Make WARN* drm specific where dev_priv can be extracted.
>   drm/i915: Make WARN* drm specific for various cases.

I think the last four patches actually making the conversions are too
big, and need to be split out to smaller pieces. These are bound to
conflict in annoying ways.

The absolute minimum I think it splitting by directory, and in
particular the changes to gvt needs to be handled by gvt maintainers.

BR,
Jani.


>
>  drivers/gpu/drm/i915/display/icl_dsi.c        |  14 +-
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   6 +-
>  drivers/gpu/drm/i915/display/intel_audio.c    |  19 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  10 +-
>  drivers/gpu/drm/i915/display/intel_bw.c       |   3 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  81 +++---
>  drivers/gpu/drm/i915/display/intel_color.c    |   3 +-
>  .../gpu/drm/i915/display/intel_combo_phy.c    |   2 +-
>  .../gpu/drm/i915/display/intel_connector.c    |   3 +-
>  drivers/gpu/drm/i915/display/intel_crt.c      |  10 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      | 100 ++++----
>  drivers/gpu/drm/i915/display/intel_display.c  | 239 ++++++++++--------
>  .../drm/i915/display/intel_display_power.c    | 170 +++++++------
>  .../drm/i915/display/intel_display_types.h    |  14 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 121 +++++----
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  10 +-
>  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   3 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  39 +--
>  drivers/gpu/drm/i915/display/intel_dsb.c      |   6 +-
>  .../i915/display/intel_dsi_dcs_backlight.c    |   2 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |   5 +-
>  drivers/gpu/drm/i915/display/intel_fbc.c      |  23 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    |  13 +-
>  drivers/gpu/drm/i915/display/intel_gmbus.c    |   3 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  21 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  71 +++---
>  drivers/gpu/drm/i915/display/intel_hotplug.c  |   7 +-
>  .../gpu/drm/i915/display/intel_lpe_audio.c    |   2 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c     |   7 +-
>  drivers/gpu/drm/i915/display/intel_opregion.c |   7 +-
>  drivers/gpu/drm/i915/display/intel_overlay.c  |  18 +-
>  drivers/gpu/drm/i915/display/intel_panel.c    |  21 +-
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c |   7 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      |  32 ++-
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |  17 +-
>  drivers/gpu/drm/i915/display/intel_sprite.c   |   5 +-
>  drivers/gpu/drm/i915/display/intel_tc.c       |  17 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.c     |   2 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c        |   4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  13 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  15 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  10 +-
>  drivers/gpu/drm/i915/gt/intel_engine_user.c   |   3 +-
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  15 +-
>  drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c     |   2 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +-
>  drivers/gpu/drm/i915/gt/intel_mocs.c          |   4 +-
>  drivers/gpu/drm/i915/gt/intel_rc6.c           |   2 +-
>  .../gpu/drm/i915/gt/intel_ring_submission.c   |   7 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  21 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   |   2 +-
>  drivers/gpu/drm/i915/gvt/aperture_gm.c        |   6 +-
>  drivers/gpu/drm/i915/gvt/cfg_space.c          |  20 +-
>  drivers/gpu/drm/i915/gvt/cmd_parser.c         |   4 +-
>  drivers/gpu/drm/i915/gvt/display.c            |   5 +-
>  drivers/gpu/drm/i915/gvt/dmabuf.c             |   4 +-
>  drivers/gpu/drm/i915/gvt/edid.c               |  13 +-
>  drivers/gpu/drm/i915/gvt/gtt.c                |  15 +-
>  drivers/gpu/drm/i915/gvt/gvt.c                |   4 +-
>  drivers/gpu/drm/i915/gvt/gvt.h                |   5 +
>  drivers/gpu/drm/i915/gvt/handlers.c           |  18 +-
>  drivers/gpu/drm/i915/gvt/interrupt.c          |  11 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |   8 +-
>  drivers/gpu/drm/i915/gvt/mmio.c               |  29 ++-
>  drivers/gpu/drm/i915/gvt/mmio_context.c       |   6 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c          |   5 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c               |   5 +-
>  drivers/gpu/drm/i915/i915_drv.c               |  19 +-
>  drivers/gpu/drm/i915/i915_drv.h               |  11 +
>  drivers/gpu/drm/i915/i915_gem.c               |   7 +-
>  drivers/gpu/drm/i915/i915_irq.c               |  85 ++++---
>  drivers/gpu/drm/i915/i915_perf.c              |  40 +--
>  drivers/gpu/drm/i915/i915_pmu.c               |   6 +-
>  drivers/gpu/drm/i915/intel_csr.c              |   4 +-
>  drivers/gpu/drm/i915/intel_pch.c              |  68 +++--
>  drivers/gpu/drm/i915/intel_pm.c               |  95 ++++---
>  drivers/gpu/drm/i915/intel_sideband.c         |   7 +-
>  drivers/gpu/drm/i915/intel_uncore.c           |  57 +++--
>  include/drm/drm_print.h                       |  30 +++
>  82 files changed, 1065 insertions(+), 768 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
