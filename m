Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FE51075B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1848110E2C6;
	Tue, 26 Apr 2022 18:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D00E10E24E;
 Tue, 26 Apr 2022 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650998656; x=1682534656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4/sYc07gwmkGEzoLcHCp/35h3jTtFSB/R65vvdpWr0g=;
 b=QTNrVayenC2Ze0z3AdHQ4bWEJbLHS1IflOH7qaMyEOjDeWDJYxlrQi7T
 21nyB2A0TV2noG/jfS38Qkk4A/JIjfm/4rgkzQ8HsdO7gboZJ5P7zm0cd
 UjaAV/jL+CSzDNiCOwZwjsEq09gUbxmUzQeBMTtHSajY1G2ySsOdXdwar
 L+uAgWIKtTozCg3CN3V7v8hfOS+uC+B2lHlzpKDSNFz4P85UzR8bH8EwY
 wHo4fW/YyZ/NM2LodDfoOra2wG6q+DSM7uuZIbpVlBchvpIfLK1Ew2+Y+
 JgfFmwIiRXAJIrv1L/uzz+SdoG8PQmwindDykJzxGxsKIQcDZzKvM1Lsm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="253064013"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="253064013"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="705180029"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by fmsmga001.fm.intel.com with SMTP; 26 Apr 2022 11:44:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Apr 2022 21:44:12 +0300
Date: Tue, 26 Apr 2022 21:44:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 1/3] drm: Add infrastructure to allow seamless mode
 switches
Message-ID: <Ymg9fHWZ1bG4bG35@intel.com>
References: <20220421192205.32649-1-jose.souza@intel.com>
 <Ymg1MNwleCRmefYG@intel.com>
 <7bba2ab1056a3cfd8ff737470ba5d41884243bc4.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bba2ab1056a3cfd8ff737470ba5d41884243bc4.camel@intel.com>
X-Patchwork-Hint: comment
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Srinivas,
 Vidya" <vidya.srinivas@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 06:32:01PM +0000, Souza, Jose wrote:
> On Tue, 2022-04-26 at 21:08 +0300, Ville Syrjälä wrote:
> > On Thu, Apr 21, 2022 at 12:22:03PM -0700, José Roberto de Souza wrote:
> > > Intel hardware supports change between modes with different refresh
> > > rates without any glitches or visual artifacts, that feature is called
> > > seamless DRRS.
> > > 
> > > So far i915 driver was automatically changing between preferred panel
> > > mode and lower refresh rate mode based on idleness but ChromeOS
> > > compositor team is requesting to be in control of the mode switch.
> > > So for a certain types of content it can switch to mode with a lower
> > > refresh rate without user noticing a thing and saving power.
> > > 
> > > This seamless mode switch will be triggered when user-space dispatch
> > > a atomic commit with the new mode and clears the
> > > DRM_MODE_ATOMIC_ALLOW_MODESET flag.
> > > 
> > > A driver that don't implement atomic_seamless_mode_switch_check
> > > function will continue to fail in the atomic check phase with
> > > "[CRTC:%d:%s] requires full modeset" debug message.
> > > While a driver that implements it and support the seamless change
> > > between old and new mode will return 0 otherwise it should return the
> > > appropried errno.
> > > 
> > > So here adding basic drm infrastructure to that be supported by i915
> > > and other drivers.
> > 
> > I don't see the need for any extra infrastructure for this.
> > 
> > I think we just need:
> > - fix the fastset code to not suck
> 
> How would it know that only mode changed and not all other things that causes mode_changed to be set?
> For example: intel_digital_connector_atomic_check()

That's what the fastset stuff does. It checks if anything changes
that needs a full modeset or not.

> 
> > - reprogram M/N during fastset
> > - calculate eDP link params using panel's highest refresh rate mode
> >   to make sure we get the same link params for all refresh rates
> > 
> > > 
> > > Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> > > Cc: Sean Paul <seanpaul@chromium.org>
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic.c              |  1 +
> > >  drivers/gpu/drm/drm_atomic_helper.c       | 16 +++++++++++++++
> > >  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> > >  include/drm/drm_crtc.h                    | 25 +++++++++++++++++++++++
> > >  4 files changed, 43 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > > index 58c0283fb6b0c..21525f9f4b4c1 100644
> > > --- a/drivers/gpu/drm/drm_atomic.c
> > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > @@ -437,6 +437,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
> > >  	drm_printf(p, "\tself_refresh_active=%d\n", state->self_refresh_active);
> > >  	drm_printf(p, "\tplanes_changed=%d\n", state->planes_changed);
> > >  	drm_printf(p, "\tmode_changed=%d\n", state->mode_changed);
> > > +	drm_printf(p, "\tseamless_mode_changed=%d\n", state->seamless_mode_changed);
> > >  	drm_printf(p, "\tactive_changed=%d\n", state->active_changed);
> > >  	drm_printf(p, "\tconnectors_changed=%d\n", state->connectors_changed);
> > >  	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index 9603193d2fa13..e6f3a966f7b86 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -631,6 +631,22 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> > >  			drm_dbg_atomic(dev, "[CRTC:%d:%s] mode changed\n",
> > >  				       crtc->base.id, crtc->name);
> > >  			new_crtc_state->mode_changed = true;
> > > +
> > > +			if (!state->allow_modeset &&
> > > +			    crtc->funcs->atomic_seamless_mode_switch_check) {
> > > +				ret = crtc->funcs->atomic_seamless_mode_switch_check(state, crtc);
> > > +				if (ret == -EOPNOTSUPP) {
> > > +					drm_dbg_atomic(dev, "[CRTC:%d:%s] Seamless mode switch not supported\n",
> > > +						       crtc->base.id, crtc->name);
> > > +					return ret;
> > > +				}
> > > +
> > > +				if (ret < 0)
> > > +					return ret;
> > > +
> > > +				new_crtc_state->seamless_mode_changed = true;
> > > +				new_crtc_state->mode_changed = false;
> > > +			}
> > >  		}
> > >  
> > >  		if (old_crtc_state->enable != new_crtc_state->enable) {
> > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > index 3b6d3bdbd0996..c093073ea6e11 100644
> > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > @@ -142,6 +142,7 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
> > >  	if (state->gamma_lut)
> > >  		drm_property_blob_get(state->gamma_lut);
> > >  	state->mode_changed = false;
> > > +	state->seamless_mode_changed = false;
> > >  	state->active_changed = false;
> > >  	state->planes_changed = false;
> > >  	state->connectors_changed = false;
> > > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > > index a70baea0636ca..b7ce378d679d3 100644
> > > --- a/include/drm/drm_crtc.h
> > > +++ b/include/drm/drm_crtc.h
> > > @@ -140,6 +140,16 @@ struct drm_crtc_state {
> > >  	 */
> > >  	bool mode_changed : 1;
> > >  
> > > +	/**
> > > +	 * @seamless_mode_changed: @mode has been changed but user-space
> > > +	 * is requesting to change to the new mode with a fastset and driver
> > > +	 * supports this request.
> > > +	 * To be used by drivers to steer the atomic commit control flow to
> > > +	 * appropriate paths to change mode without any visual corruption.
> > > +	 * Never set together with @mode_changed.
> > > +	 */
> > > +	bool seamless_mode_changed : 1;
> > > +
> > >  	/**
> > >  	 * @active_changed: @active has been toggled. Used by the atomic
> > >  	 * helpers and drivers to steer the atomic commit control flow. See also
> > > @@ -939,6 +949,21 @@ struct drm_crtc_funcs {
> > >  				     int *max_error,
> > >  				     ktime_t *vblank_time,
> > >  				     bool in_vblank_irq);
> > > +
> > > +	/**
> > > +	 * @atomic_seamless_mode_switch_check
> > > +	 *
> > > +	 * Called when user-space wants to change mode without do a modeset.
> > > +	 * Drivers can optionally support do a mode switch without any visual
> > > +	 * corruption when changing between certain modes.
> > > +	 *
> > > +	 * Returns:
> > > +	 * Zero if possible to seamless switch mode, -EOPNOTSUPP if not
> > > +	 * supported seamless mode change or appropriate errno if an error
> > > +	 * happened.
> > > +	 */
> > > +	int (*atomic_seamless_mode_switch_check)(struct drm_atomic_state *state,
> > > +						 struct drm_crtc *crtc);
> > >  };
> > >  
> > >  /**
> > > -- 
> > > 2.36.0
> > 
> 

-- 
Ville Syrjälä
Intel
