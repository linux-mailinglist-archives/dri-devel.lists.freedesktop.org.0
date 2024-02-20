Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354EE85C352
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 19:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A070910E401;
	Tue, 20 Feb 2024 18:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QX+LqQY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BC810E401;
 Tue, 20 Feb 2024 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708452367; x=1739988367;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GO2Z5PiFxn+o6yTFw3Aa5pXX0x9vVQnt0mONv/Vhno8=;
 b=QX+LqQY+HVbtIX486SQOvR/4dvZaLG8TdTZZoaIH4hLnIw5OwRA03OCU
 jsVBS0qUFqjMpFrIgjZ3W085/25N1Uy90d4BgfZH84MOjhkuZj28Tl9Rh
 N5v9WjYYd3Ahxi513BPAsV0pUObBj91GUlhl2fU+DWMkLmhQ6haVVw3kB
 /c6LaT/Bal9J9evbNRzI+5WO4umIpwduiQIEz5GdILp3qC36i010XHyXZ
 DOzYkf7JZDzl/RcqoSBlGHpo5dNfOg/WqhwflWuYyFnD7MbXTJPfQ5ift
 /+ljiym6jFtHcrc0YF3xpCXHhyFrwezG+Nj7WR4HlC2zQVO7OQEEg4r7l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2697401"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2697401"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="827191936"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="827191936"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 20 Feb 2024 10:06:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 20:06:01 +0200
Date: Tue, 20 Feb 2024 20:06:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/tv: Fix TV mode
Message-ID: <ZdTqCWPSL4jJO3yf@intel.com>
References: <20240220131251.453060-1-mripard@kernel.org>
 <ZdTm1bFgR8x2IJhN@intel.com> <ZdTn8oy1bs1rIqmL@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdTn8oy1bs1rIqmL@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 20, 2024 at 12:57:06PM -0500, Rodrigo Vivi wrote:
> On Tue, Feb 20, 2024 at 07:52:21PM +0200, Ville Syrjälä wrote:
> > On Tue, Feb 20, 2024 at 02:12:51PM +0100, Maxime Ripard wrote:
> > > Commit 1fd4a5a36f9f ("drm/connector: Rename legacy TV property") failed
> > > to update all the users of the struct drm_tv_connector_state mode field,
> > > which resulted in a build failure in i915.
> > > 
> > > However, a subsequent commit in the same series reintroduced a mode
> > > field in that structure, with a different semantic but the same type,
> > > with the assumption that all previous users were updated.
> > > 
> > > Since that didn't happen, the i915 driver now compiles, but mixes
> > > accesses to the legacy_mode field and the newer mode field, but with the
> > > previous semantics.
> > > 
> > > This obviously doesn't work very well, so we need to update the accesses
> > > that weren't in the legacy renaming commit.
> > > 
> > > Fixes: 1fd4a5a36f9f ("drm/connector: Rename legacy TV property")
> > > Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_sdvo.c | 10 +++++-----
> > >  drivers/gpu/drm/i915/display/intel_tv.c   | 10 +++++-----
> > >  2 files changed, 10 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> > > index 825638702ac1..5f9e748adc89 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> > > @@ -1220,7 +1220,7 @@ static bool intel_sdvo_set_tv_format(struct intel_sdvo *intel_sdvo,
> > >  	struct intel_sdvo_tv_format format;
> > >  	u32 format_map;
> > >  
> > > -	format_map = 1 << conn_state->tv.mode;
> > > +	format_map = 1 << conn_state->tv.legacy_mode;
> > >  	memset(&format, 0, sizeof(format));
> > >  	memcpy(&format, &format_map, min(sizeof(format), sizeof(format_map)));
> > >  
> > > @@ -2323,7 +2323,7 @@ static int intel_sdvo_get_tv_modes(struct drm_connector *connector)
> > >  	 * Read the list of supported input resolutions for the selected TV
> > >  	 * format.
> > >  	 */
> > > -	format_map = 1 << conn_state->tv.mode;
> > > +	format_map = 1 << conn_state->tv.legacy_mode;
> > >  	memcpy(&tv_res, &format_map,
> > >  	       min(sizeof(format_map), sizeof(struct intel_sdvo_sdtv_resolution_request)));
> > >  
> > > @@ -2388,7 +2388,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
> > >  		int i;
> > >  
> > >  		for (i = 0; i < intel_sdvo_connector->format_supported_num; i++)
> > > -			if (state->tv.mode == intel_sdvo_connector->tv_format_supported[i]) {
> > > +			if (state->tv.legacy_mode == intel_sdvo_connector->tv_format_supported[i]) {
> > >  				*val = i;
> > >  
> > >  				return 0;
> > > @@ -2444,7 +2444,7 @@ intel_sdvo_connector_atomic_set_property(struct drm_connector *connector,
> > >  	struct intel_sdvo_connector_state *sdvo_state = to_intel_sdvo_connector_state(state);
> > >  
> > >  	if (property == intel_sdvo_connector->tv_format) {
> > > -		state->tv.mode = intel_sdvo_connector->tv_format_supported[val];
> > > +		state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[val];
> > >  
> > >  		if (state->crtc) {
> > >  			struct drm_crtc_state *crtc_state =
> > > @@ -3108,7 +3108,7 @@ static bool intel_sdvo_tv_create_property(struct intel_sdvo *intel_sdvo,
> > >  		drm_property_add_enum(intel_sdvo_connector->tv_format, i,
> > >  				      tv_format_names[intel_sdvo_connector->tv_format_supported[i]]);
> > >  
> > > -	intel_sdvo_connector->base.base.state->tv.mode = intel_sdvo_connector->tv_format_supported[0];
> > > +	intel_sdvo_connector->base.base.state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[0];
> > >  	drm_object_attach_property(&intel_sdvo_connector->base.base.base,
> > >  				   intel_sdvo_connector->tv_format, 0);
> > >  	return true;
> > 
> > Hmm. I didn't realize we are using this in the SDVO code as well.
> > I don't *think* that one is actually broken since it has its own
> > .{set,get}_property() hooks. But I suppose doing the rename
> > there as well is a good idea anyway.
> > 
> > Can you split the SDVO vs. TV into separate patches? We need to
> > backport at least the TV part, and a smaller patch means less
> > chance of conflicts. Or if you prefer I can chunk it up while
> > pushing.
> 
> hmm ouch... I shouldn't had rushed with it, I'm sorry.
> But I already merged this as is.

Did you at least slap a cc:stable on it? Or maybe the Fixes: tag is
enough these days...

> 
> > 
> > Both parts are
> > Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Thanks.
> > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> > > index a96bcfcf90a3..2b77d399f1a1 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_tv.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> > > @@ -950,7 +950,7 @@ intel_disable_tv(struct intel_atomic_state *state,
> > >  
> > >  static const struct tv_mode *intel_tv_mode_find(const struct drm_connector_state *conn_state)
> > >  {
> > > -	int format = conn_state->tv.mode;
> > > +	int format = conn_state->tv.legacy_mode;
> > >  
> > >  	return &tv_modes[format];
> > >  }
> > > @@ -1705,7 +1705,7 @@ static void intel_tv_find_better_format(struct drm_connector *connector)
> > >  			break;
> > >  	}
> > >  
> > > -	connector->state->tv.mode = i;
> > > +	connector->state->tv.legacy_mode = i;
> > >  }
> > >  
> > >  static int
> > > @@ -1863,7 +1863,7 @@ static int intel_tv_atomic_check(struct drm_connector *connector,
> > >  	old_state = drm_atomic_get_old_connector_state(state, connector);
> > >  	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
> > >  
> > > -	if (old_state->tv.mode != new_state->tv.mode ||
> > > +	if (old_state->tv.legacy_mode != new_state->tv.legacy_mode ||
> > >  	    old_state->tv.margins.left != new_state->tv.margins.left ||
> > >  	    old_state->tv.margins.right != new_state->tv.margins.right ||
> > >  	    old_state->tv.margins.top != new_state->tv.margins.top ||
> > > @@ -1900,7 +1900,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
> > >  	conn_state->tv.margins.right = 46;
> > >  	conn_state->tv.margins.bottom = 37;
> > >  
> > > -	conn_state->tv.mode = 0;
> > > +	conn_state->tv.legacy_mode = 0;
> > >  
> > >  	/* Create TV properties then attach current values */
> > >  	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
> > > @@ -1914,7 +1914,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
> > >  
> > >  	drm_object_attach_property(&connector->base,
> > >  				   i915->drm.mode_config.legacy_tv_mode_property,
> > > -				   conn_state->tv.mode);
> > > +				   conn_state->tv.legacy_mode);
> > >  	drm_object_attach_property(&connector->base,
> > >  				   i915->drm.mode_config.tv_left_margin_property,
> > >  				   conn_state->tv.margins.left);
> > > -- 
> > > 2.43.2
> > 
> > -- 
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
