Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A941459A7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 17:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F5C6F5D9;
	Wed, 22 Jan 2020 16:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06156F5D6;
 Wed, 22 Jan 2020 16:22:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 08:22:23 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="220362495"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 08:22:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, daniel@ffwll.ch,
 sam@ravnborg.org, sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [[Intel-gfx] [PATCH v2 00/10] drm: Introduce struct drm_device
 based WARN* and use them in i915
In-Reply-To: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
Date: Wed, 22 Jan 2020 18:22:17 +0200
Message-ID: <878slzea12.fsf@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jan 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
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
> changes since v1:
>   - Address Jani's review comments
>     - Fix typo in comment of patch 0001
>     - Get rid of helper functions
>     - Split patches by directory 
>
> Changes since RFC at [1]
>   - Introduce drm_WARN* macros and use them as suggested by Sam and Jani
>   - Get rid of extra local variables
>
> [1] https://patchwork.freedesktop.org/series/71668/
>
>
> Pankaj Bharadiya (10):
>   drm/print: introduce new struct drm_device based WARN* macros

Pushed.

>   drm/i915/display: Make WARN* drm specific where drm_device ptr is available
>   drm/i915/display: Make WARN* drm specific where drm_priv ptr is available

The above two conflict and need to be rebased.

>   drm/i915/display: Make WARN* drm specific where encoder ptr is available
>   drm/i915/gem: Make WARN* drm specific where drm_priv ptr is available
>   drm/i915/gt: Make WARN* drm specific where drm_priv ptr is available

Pushed the above three.

>   drm/i915/gvt: Make WARN* drm specific where drm_priv ptr is available
>   drm/i915/gvt: Make WARN* drm specific where vgpu ptr is available

The gvt patches need to be applied through the gvt tree and maintainers
once they've backmerged the logging changes.

>   drm/i915: Make WARN* drm specific where drm_priv ptr is available
>   drm/i915: Make WARN* drm specific where uncore or stream ptr is available

Pushed the above two.

Thanks for the patches.

BR,
Jani.

>
>  drivers/gpu/drm/i915/display/icl_dsi.c        |  14 +-
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   6 +-
>  drivers/gpu/drm/i915/display/intel_audio.c    |  19 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  10 +-
>  drivers/gpu/drm/i915/display/intel_bw.c       |   3 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  81 ++++---
>  drivers/gpu/drm/i915/display/intel_color.c    |   4 +-
>  .../gpu/drm/i915/display/intel_combo_phy.c    |   2 +-
>  .../gpu/drm/i915/display/intel_connector.c    |   3 +-
>  drivers/gpu/drm/i915/display/intel_crt.c      |  10 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      | 100 ++++----
>  drivers/gpu/drm/i915/display/intel_display.c  | 228 ++++++++++--------
>  .../drm/i915/display/intel_display_power.c    | 169 +++++++------
>  drivers/gpu/drm/i915/display/intel_dp.c       | 123 ++++++----
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  10 +-
>  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   3 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  37 +--
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
>  drivers/gpu/drm/i915/display/intel_overlay.c  |  14 +-
>  drivers/gpu/drm/i915/display/intel_panel.c    |  19 +-
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c |   7 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      |  32 +--
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |  14 +-
>  drivers/gpu/drm/i915/display/intel_sprite.c   |   5 +-
>  drivers/gpu/drm/i915/display/intel_tc.c       |  18 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.c     |   2 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c        |   3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  13 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  15 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   8 +-
>  drivers/gpu/drm/i915/gt/intel_engine_user.c   |   3 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +-
>  drivers/gpu/drm/i915/gt/intel_mocs.c          |   4 +-
>  drivers/gpu/drm/i915/gt/intel_rc6.c           |   2 +-
>  .../gpu/drm/i915/gt/intel_ring_submission.c   |   7 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  20 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   |   2 +-
>  drivers/gpu/drm/i915/gvt/aperture_gm.c        |   6 +-
>  drivers/gpu/drm/i915/gvt/cfg_space.c          |  23 +-
>  drivers/gpu/drm/i915/gvt/cmd_parser.c         |   4 +-
>  drivers/gpu/drm/i915/gvt/display.c            |   6 +-
>  drivers/gpu/drm/i915/gvt/dmabuf.c             |   4 +-
>  drivers/gpu/drm/i915/gvt/edid.c               |  19 +-
>  drivers/gpu/drm/i915/gvt/gtt.c                |  21 +-
>  drivers/gpu/drm/i915/gvt/gvt.c                |   4 +-
>  drivers/gpu/drm/i915/gvt/handlers.c           |  22 +-
>  drivers/gpu/drm/i915/gvt/interrupt.c          |  15 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c              |  10 +-
>  drivers/gpu/drm/i915/gvt/mmio.c               |  30 ++-
>  drivers/gpu/drm/i915/gvt/mmio_context.c       |   8 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c          |   6 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c               |   6 +-
>  drivers/gpu/drm/i915/i915_drv.c               |  19 +-
>  drivers/gpu/drm/i915/i915_gem.c               |   7 +-
>  drivers/gpu/drm/i915/i915_gem_fence_reg.c     |  11 +-
>  drivers/gpu/drm/i915/i915_irq.c               |  85 ++++---
>  drivers/gpu/drm/i915/i915_perf.c              |  38 +--
>  drivers/gpu/drm/i915/i915_pmu.c               |   6 +-
>  drivers/gpu/drm/i915/intel_csr.c              |   4 +-
>  drivers/gpu/drm/i915/intel_pch.c              |  66 +++--
>  drivers/gpu/drm/i915/intel_pm.c               |  24 +-
>  drivers/gpu/drm/i915/intel_sideband.c         |   7 +-
>  drivers/gpu/drm/i915/intel_uncore.c           |  54 +++--
>  include/drm/drm_print.h                       |  29 +++
>  77 files changed, 1000 insertions(+), 722 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
