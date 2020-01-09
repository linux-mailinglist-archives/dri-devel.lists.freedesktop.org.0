Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621EC1357F7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 12:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636246E3E3;
	Thu,  9 Jan 2020 11:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261166E3E1;
 Thu,  9 Jan 2020 11:30:00 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 03:29:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; 
 d="scan'208,217";a="223851703"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by orsmga003.jf.intel.com with ESMTP; 09 Jan 2020 03:29:56 -0800
Date: Thu, 9 Jan 2020 16:55:13 +0530
From: "Bharadiya,Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC 5/7] drm/i915: Make WARN* device specific where
 drm_priv ptr is available
Message-ID: <20200109112513.GA19403@plaxmina-desktop.iind.intel.com>
References: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200106172326.32592-6-pankaj.laxminarayan.bharadiya@intel.com>
 <87d0buqff1.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d0buqff1.fsf@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: irlied@linux.ie, intel-gfx@lists.freedesktop.org, sudeep.dutt@intel.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 02:52:02PM +0200, Jani Nikula wrote:
> On Mon, 06 Jan 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> > Device specific WARN* calls include device information in the
> > backtrace, so we know what device the warnings originate from.
> >
> > Covert all the calls of WARN* with device specific dev_WARN*
> > variants in functions where drm_i915_private struct pointer is readily
> > available.
> >
> > The conversion was done automatically with below coccinelle semantic
> > patch. checkpatch errors/warnings are fixed manually.
> >
> > @rule1@
> > identifier func, T;
> > @@
> > func(...) {
> > ...
> > struct drm_i915_private *T = ...;
> > +struct device *dev = i915_to_dev(T);
> > <+...
> > (
> > -WARN(
> > +dev_WARN(dev,
> > ...)
> > |
> > -WARN_ON(
> > +dev_WARN_ON(dev,
> > ...)
> > |
> > -WARN_ONCE(
> > +dev_WARN_ONCE(dev,
> > ...)
> > |
> > -WARN_ON_ONCE(
> > +dev_WARN_ON_ONCE(dev,
> > ...)
> > )
> > ...+>
> > }
> >
> > @rule2@
> > identifier func, T;
> > @@
> > func(struct drm_i915_private *T,...) {
> > +struct device *dev = i915_to_dev(T);
> > <+...
> > (
> > -WARN(
> > +dev_WARN(dev,
> > ...)
> > |
> > -WARN_ON(
> > +dev_WARN_ON(dev,
> > ...)
> > |
> > -WARN_ONCE(
> > +dev_WARN_ONCE(dev,
> > ...)
> > |
> > -WARN_ON_ONCE(
> > +dev_WARN_ON_ONCE(dev,
> > ...)
> > )
> > ...+>
> > }
> >
> > command: spatch --sp-file <script> --dir drivers/gpu/drm/i915 \
> > 					--linux-spacing --in-place
> > Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/icl_dsi.c        |  14 +-
> >  drivers/gpu/drm/i915/display/intel_atomic.c   |   8 +-
> >  drivers/gpu/drm/i915/display/intel_audio.c    |  23 ++-
> >  drivers/gpu/drm/i915/display/intel_bios.c     |  13 +-
> >  drivers/gpu/drm/i915/display/intel_bw.c       |   3 +-
> >  drivers/gpu/drm/i915/display/intel_cdclk.c    |  85 ++++----
> >  drivers/gpu/drm/i915/display/intel_color.c    |   4 +-
> >  .../gpu/drm/i915/display/intel_combo_phy.c    |   3 +-
> >  drivers/gpu/drm/i915/display/intel_crt.c      |  15 +-
> >  drivers/gpu/drm/i915/display/intel_ddi.c      | 102 ++++++----
> >  drivers/gpu/drm/i915/display/intel_display.c  | 180 ++++++++++-------
> >  .../drm/i915/display/intel_display_power.c    | 190 +++++++++++-------
> >  drivers/gpu/drm/i915/display/intel_dp.c       | 112 +++++++----
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  10 +-
> >  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   3 +-
> >  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  45 +++--
> >  drivers/gpu/drm/i915/display/intel_dsb.c      |   9 +-
> >  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |   5 +-
> >  drivers/gpu/drm/i915/display/intel_fbc.c      |  30 ++-
> >  drivers/gpu/drm/i915/display/intel_gmbus.c    |   4 +-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     |  26 ++-
> >  drivers/gpu/drm/i915/display/intel_hdmi.c     |  47 +++--
> >  drivers/gpu/drm/i915/display/intel_hotplug.c  |   6 +-
> >  .../gpu/drm/i915/display/intel_lpe_audio.c    |   3 +-
> >  drivers/gpu/drm/i915/display/intel_lvds.c     |   3 +-
> >  drivers/gpu/drm/i915/display/intel_opregion.c |   8 +-
> >  drivers/gpu/drm/i915/display/intel_overlay.c  |  17 +-
> >  drivers/gpu/drm/i915/display/intel_panel.c    |  28 ++-
> >  drivers/gpu/drm/i915/display/intel_pipe_crc.c |   4 +-
> >  drivers/gpu/drm/i915/display/intel_psr.c      |  38 ++--
> >  drivers/gpu/drm/i915/display/intel_sdvo.c     |   8 +-
> >  drivers/gpu/drm/i915/display/intel_sprite.c   |   6 +-
> >  drivers/gpu/drm/i915/display/intel_tc.c       |  24 ++-
> >  drivers/gpu/drm/i915/display/intel_vdsc.c     |   3 +-
> >  drivers/gpu/drm/i915/display/vlv_dsi.c        |   3 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_pm.c        |   3 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   4 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  15 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  15 +-
> >  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   9 +-
> >  drivers/gpu/drm/i915/gt/intel_engine_user.c   |   3 +-
> >  drivers/gpu/drm/i915/gt/intel_mocs.c          |   5 +-
> >  drivers/gpu/drm/i915/gt/intel_rc6.c           |   3 +-
> >  .../gpu/drm/i915/gt/intel_ring_submission.c   |   8 +-
> >  drivers/gpu/drm/i915/gt/intel_rps.c           |  23 ++-
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c   |   3 +-
> >  drivers/gpu/drm/i915/gvt/aperture_gm.c        |   8 +-
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c         |   5 +-
> >  drivers/gpu/drm/i915/gvt/display.c            |   3 +-
> >  drivers/gpu/drm/i915/gvt/dmabuf.c             |   5 +-
> >  drivers/gpu/drm/i915/gvt/edid.c               |   3 +-
> >  drivers/gpu/drm/i915/gvt/gvt.c                |   6 +-
> >  drivers/gpu/drm/i915/gvt/handlers.c           |   3 +-
> >  drivers/gpu/drm/i915/gvt/mmio_context.c       |   3 +-
> >  drivers/gpu/drm/i915/i915_drv.c               |  23 ++-
> >  drivers/gpu/drm/i915/i915_gem.c               |   9 +-
> >  drivers/gpu/drm/i915/i915_gem_gtt.c           |   7 +-
> >  drivers/gpu/drm/i915/i915_irq.c               |  83 ++++----
> >  drivers/gpu/drm/i915/i915_pmu.c               |   9 +-
> >  drivers/gpu/drm/i915/intel_csr.c              |   7 +-
> >  drivers/gpu/drm/i915/intel_pch.c              |  65 +++---
> >  drivers/gpu/drm/i915/intel_pm.c               |  30 ++-
> >  drivers/gpu/drm/i915/intel_sideband.c         |   9 +-
> >  drivers/gpu/drm/i915/intel_uncore.c           |   3 +-
> >  64 files changed, 918 insertions(+), 536 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> > index 8435bc5a7a74..8648569793f6 100644
> > --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> > +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> > @@ -345,10 +345,11 @@ static void gen11_dsi_program_esc_clk_div(struct intel_encoder *encoder,
> >  static void get_dsi_io_power_domains(struct drm_i915_private *dev_priv,
> >  				     struct intel_dsi *intel_dsi)
> >  {
> > +	struct device *dev = i915_to_dev(dev_priv);
> 
> Please don't add the extra local variables. See the replies to previous
> patches, and use dev_priv->drm.dev or just &dev_priv->drm.
> 
> Also we usually have struct drm_device *dev, almost never struct device
> *dev, so these will inevitably conflict.

Thank you for the review. Will post updated series.

Thanks,
Pankaj

> 
> BR,
> Jani.
> 
[snip]
> >  	struct drm_i915_private *i915 = uncore->i915;
> > +	struct device *dev = i915_to_dev(i915);
> >  	int ret = 0;
> >  
> >  	GEM_BUG_ON(!intel_uncore_has_forcewake(uncore));
> > @@ -1612,7 +1613,7 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
> >  #undef fw_domain_init
> >  
> >  	/* All future platforms are expected to require complex power gating */
> > -	WARN_ON(!ret && uncore->fw_domains == 0);
> > +	dev_WARN_ON(dev, !ret && uncore->fw_domains == 0);
> >  
> >  out:
> >  	if (ret)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
