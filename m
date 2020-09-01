Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B41258D3D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 13:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9426E063;
	Tue,  1 Sep 2020 11:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7B76E05D;
 Tue,  1 Sep 2020 11:12:09 +0000 (UTC)
IronPort-SDR: lwLh8QwkHXr5VGKyEo9/sC3scLitlX1TJAZuSjzMwk4Pe1jNUrD1NZA+tkBdblXK5L0NKTVPqI
 iMhRPMZHr9Pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="157147577"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="157147577"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 04:12:07 -0700
IronPort-SDR: SD6a4uYfw0mXZLK8z80Dt4jr2phrEYRJl5BSJj8cZ2RQikrpds26vmqpAX7vPeRRoWdRuOVRoB
 7oK5jlTEHZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="283367221"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 01 Sep 2020 04:12:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Sep 2020 14:12:03 +0300
Date: Tue, 1 Sep 2020 14:12:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v6 1/7] drm/i915: Add enable/disable flip done and flip
 done handler
Message-ID: <20200901111203.GF6112@intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
 <20200807093551.10673-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807093551.10673-2-karthik.b.s@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 03:05:45PM +0530, Karthik B S wrote:
> Add enable/disable flip done functions and the flip done handler
> function which handles the flip done interrupt.
> =

> Enable the flip done interrupt in IER.
> =

> Enable flip done function is called before writing the
> surface address register as the write to this register triggers
> the flip done interrupt
> =

> Flip done handler is used to send the page flip event as soon as the
> surface address is written as per the requirement of async flips.
> The interrupt is disabled after the event is sent.
> =

> v2: -Change function name from icl_* to skl_* (Paulo)
>     -Move flip handler to this patch (Paulo)
>     -Remove vblank_put() (Paulo)
>     -Enable flip done interrupt for gen9+ only (Paulo)
>     -Enable flip done interrupt in power_well_post_enable hook (Paulo)
>     -Removed the event check in flip done handler to handle async
>      flips without pageflip events.
> =

> v3: -Move skl_disable_flip_done out of interrupt handler (Paulo)
>     -Make the pending vblank event NULL in the beginning of
>      flip_done_handler to remove sporadic WARN_ON that is seen.
> =

> v4: -Calculate timestamps using flip done time stamp and current
>      timestamp for async flips (Ville)
> =

> v5: -Fix the sparse warning by making the function 'g4x_get_flip_counter'
>      static.(Reported-by: kernel test robot <lkp@intel.com>)
>     -Fix the typo in commit message.
> =

> v6: -Revert back to old time stamping code.
>     -Remove the break while calling skl_enable_flip_done. (Paulo)
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  8 +++
>  drivers/gpu/drm/i915/i915_irq.c              | 52 ++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_irq.h              |  2 +
>  3 files changed, 62 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 522c772a2111..1ac2e6f27597 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -15562,6 +15562,11 @@ static void intel_atomic_commit_tail(struct inte=
l_atomic_state *state)
>  =

>  	intel_dbuf_pre_plane_update(state);
>  =

> +	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (new_crtc_state->uapi.async_flip)
> +			skl_enable_flip_done(&crtc->base);
> +	}
> +
>  	/* Now enable the clocks, plane, pipe, and connectors that we set up. */
>  	dev_priv->display.commit_modeset_enables(state);
>  =

> @@ -15583,6 +15588,9 @@ static void intel_atomic_commit_tail(struct intel=
_atomic_state *state)
>  	drm_atomic_helper_wait_for_flip_done(dev, &state->base);
>  =

>  	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (new_crtc_state->uapi.async_flip)
> +			skl_disable_flip_done(&crtc->base);

Where do we wait for the flip done? Can't see such code anywhere.

> +
>  		if (new_crtc_state->hw.active &&
>  		    !needs_modeset(new_crtc_state) &&
>  		    !new_crtc_state->preload_luts &&
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index f113fe44572b..6cc129b031d3 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -1296,6 +1296,23 @@ display_pipe_crc_irq_handler(struct drm_i915_priva=
te *dev_priv,
>  			     u32 crc4) {}
>  #endif
>  =

> +static void flip_done_handler(struct drm_i915_private *dev_priv,
> +			      unsigned int pipe)
> +{
> +	struct intel_crtc *crtc =3D intel_get_crtc_for_pipe(dev_priv, pipe);
> +	struct drm_crtc_state *crtc_state =3D crtc->base.state;
> +	struct drm_pending_vblank_event *e =3D crtc_state->event;
> +	struct drm_device *dev =3D &dev_priv->drm;
> +	unsigned long irqflags;
> +
> +	spin_lock_irqsave(&dev->event_lock, irqflags);
> +
> +	crtc_state->event =3D NULL;
> +
> +	drm_crtc_send_vblank_event(&crtc->base, e);
> +
> +	spin_unlock_irqrestore(&dev->event_lock, irqflags);
> +}
>  =

>  static void hsw_pipe_crc_irq_handler(struct drm_i915_private *dev_priv,
>  				     enum pipe pipe)
> @@ -2390,6 +2407,9 @@ gen8_de_irq_handler(struct drm_i915_private *dev_pr=
iv, u32 master_ctl)
>  		if (iir & GEN8_PIPE_VBLANK)
>  			intel_handle_vblank(dev_priv, pipe);
>  =

> +		if (iir & GEN9_PIPE_PLANE1_FLIP_DONE)
> +			flip_done_handler(dev_priv, pipe);
> +
>  		if (iir & GEN8_PIPE_CDCLK_CRC_DONE)
>  			hsw_pipe_crc_irq_handler(dev_priv, pipe);
>  =

> @@ -2711,6 +2731,19 @@ int bdw_enable_vblank(struct drm_crtc *crtc)
>  	return 0;
>  }
>  =

> +void skl_enable_flip_done(struct drm_crtc *crtc)
> +{
> +	struct drm_i915_private *dev_priv =3D to_i915(crtc->dev);
> +	enum pipe pipe =3D to_intel_crtc(crtc)->pipe;
> +	unsigned long irqflags;
> +
> +	spin_lock_irqsave(&dev_priv->irq_lock, irqflags);
> +
> +	bdw_enable_pipe_irq(dev_priv, pipe, GEN9_PIPE_PLANE1_FLIP_DONE);
> +
> +	spin_unlock_irqrestore(&dev_priv->irq_lock, irqflags);
> +}
> +
>  /* Called from drm generic code, passed 'crtc' which
>   * we use as a pipe index
>   */
> @@ -2771,6 +2804,19 @@ void bdw_disable_vblank(struct drm_crtc *crtc)
>  	spin_unlock_irqrestore(&dev_priv->irq_lock, irqflags);
>  }
>  =

> +void skl_disable_flip_done(struct drm_crtc *crtc)
> +{
> +	struct drm_i915_private *dev_priv =3D to_i915(crtc->dev);
> +	enum pipe pipe =3D to_intel_crtc(crtc)->pipe;
> +	unsigned long irqflags;
> +
> +	spin_lock_irqsave(&dev_priv->irq_lock, irqflags);
> +
> +	bdw_disable_pipe_irq(dev_priv, pipe, GEN9_PIPE_PLANE1_FLIP_DONE);
> +
> +	spin_unlock_irqrestore(&dev_priv->irq_lock, irqflags);
> +}
> +
>  static void ibx_irq_reset(struct drm_i915_private *dev_priv)
>  {
>  	struct intel_uncore *uncore =3D &dev_priv->uncore;
> @@ -2981,6 +3027,9 @@ void gen8_irq_power_well_post_enable(struct drm_i91=
5_private *dev_priv,
>  	u32 extra_ier =3D GEN8_PIPE_VBLANK | GEN8_PIPE_FIFO_UNDERRUN;
>  	enum pipe pipe;
>  =

> +	if (INTEL_GEN(dev_priv) >=3D 9)
> +		extra_ier |=3D GEN9_PIPE_PLANE1_FLIP_DONE;
> +
>  	spin_lock_irq(&dev_priv->irq_lock);
>  =

>  	if (!intel_irqs_enabled(dev_priv)) {
> @@ -3459,6 +3508,9 @@ static void gen8_de_irq_postinstall(struct drm_i915=
_private *dev_priv)
>  	de_pipe_enables =3D de_pipe_masked | GEN8_PIPE_VBLANK |
>  					   GEN8_PIPE_FIFO_UNDERRUN;
>  =

> +	if (INTEL_GEN(dev_priv) >=3D 9)
> +		de_pipe_enables |=3D GEN9_PIPE_PLANE1_FLIP_DONE;
> +
>  	de_port_enables =3D de_port_masked;
>  	if (IS_GEN9_LP(dev_priv))
>  		de_port_enables |=3D BXT_DE_PORT_HOTPLUG_MASK;
> diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i915_=
irq.h
> index 25f25cd95818..2f10c8135116 100644
> --- a/drivers/gpu/drm/i915/i915_irq.h
> +++ b/drivers/gpu/drm/i915/i915_irq.h
> @@ -112,11 +112,13 @@ int i915gm_enable_vblank(struct drm_crtc *crtc);
>  int i965_enable_vblank(struct drm_crtc *crtc);
>  int ilk_enable_vblank(struct drm_crtc *crtc);
>  int bdw_enable_vblank(struct drm_crtc *crtc);
> +void skl_enable_flip_done(struct drm_crtc *crtc);
>  void i8xx_disable_vblank(struct drm_crtc *crtc);
>  void i915gm_disable_vblank(struct drm_crtc *crtc);
>  void i965_disable_vblank(struct drm_crtc *crtc);
>  void ilk_disable_vblank(struct drm_crtc *crtc);
>  void bdw_disable_vblank(struct drm_crtc *crtc);
> +void skl_disable_flip_done(struct drm_crtc *crtc);
>  =

>  void gen2_irq_reset(struct intel_uncore *uncore);
>  void gen3_irq_reset(struct intel_uncore *uncore, i915_reg_t imr,
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
