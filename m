Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22E3678482
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9723989EFF;
	Mon, 23 Jan 2023 18:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA42D89C83;
 Mon, 23 Jan 2023 18:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674498143; x=1706034143;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ODio6yPGhVL8lKCZ9Z1df5Ut35sWqiV0VzEs/CyD4Pg=;
 b=OdQrX7AAYDT1qnus5i9cscNGtkYLhgu30dO+6MrIRtE769WfOiLnUBJO
 1JXeGAiQMT6lku+qWl/2vlubmkZ783Jzl2OUWz3DG4e7+sqLiWo42N04+
 SAqv7PzQvuS8feXxwvcgvn2BjBCgUkDFuvk+msRkb+IeQrKHfDMTz7chu
 S++uQf7MHUH1L3m/+ni6pZwnbiO7Zh6jfadfuNO+5AJqxYofe8Tv/pBBM
 2CRKg1HMNUiILNNAqkfqxyLOMbRMKT+upHl5B6sTTJiSsjrCFuJVrHuDa
 cmrlFvbeQ7PKWw+DvYoyNeapMn4GEVEps+v5v+fq/4lS8Kqqm1tMaAPzw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327371198"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="327371198"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 10:22:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="730383456"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="730383456"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga004.fm.intel.com with SMTP; 23 Jan 2023 10:22:20 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Jan 2023 20:22:19 +0200
Date: Mon, 23 Jan 2023 20:22:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v8 5/8] drm/i915/edid: convert DP, HDMI and LVDS to
 drm_edid
Message-ID: <Y87QW6U48Bu1yQjr@intel.com>
References: <cover.1674144945.git.jani.nikula@intel.com>
 <b58b4c5ea31943e6c816ba0f6f4efa48bd9e5ab6.1674144945.git.jani.nikula@intel.com>
 <Y8riBdt+O6zDVlFz@intel.com> <87o7qp8slz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7qp8slz.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 12:15:04PM +0200, Jani Nikula wrote:
> On Fri, 20 Jan 2023, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Thu, Jan 19, 2023 at 06:18:58PM +0200, Jani Nikula wrote:
> >> diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
> >> index aecec992cd0d..6a98787edf48 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_lvds.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_lvds.c
> >> @@ -479,8 +479,11 @@ static int intel_lvds_get_modes(struct drm_connector *connector)
> >>  	struct intel_connector *intel_connector = to_intel_connector(connector);
> >>  
> >>  	/* use cached edid if we have one */
> >> -	if (!IS_ERR_OR_NULL(intel_connector->edid))
> >> -		return drm_add_edid_modes(connector, intel_connector->edid);
> >> +	if (!IS_ERR_OR_NULL(intel_connector->edid)) {
> >> +		drm_edid_connector_update(connector, intel_connector->edid);
> >
> > Isn't this update redundant?
> 
> Maybe far fetched, but if the user does connector force disable via
> debugfs, drm_helper_probe_single_connector_modes() will clear the EDID
> property and display info. And after that, nobody's going to do the
> connector update again unless we do it here.

Right, DP/HDMI take care of that in .force(), we have no
.force() for LVDS atm. And I take the encoder types not handled
in this patch will keep using some older get_edid() thingy that
will do the update for them also from .get_modes()? Hmm, apart
from the encoders using intel_panel_get_modes() which I suppose
must already be busted...

I guess we should think about unifying the behaviour for all
the encoder types, including using detect_edid for everything...

Anyways, that's something for the future. For the time being
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> BR,
> Jani.
> 
> 
> 
> >
> >> +
> >> +		return drm_edid_connector_add_modes(connector);
> >> +	}
> >>  
> >>  	return intel_panel_get_modes(intel_connector);
> >>  }
> >> @@ -834,7 +837,7 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
> >>  	struct intel_connector *intel_connector;
> >>  	struct drm_connector *connector;
> >>  	struct drm_encoder *encoder;
> >> -	struct edid *edid;
> >> +	const struct drm_edid *drm_edid;
> >>  	i915_reg_t lvds_reg;
> >>  	u32 lvds;
> >>  	u8 pin;
> >> @@ -945,27 +948,36 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
> >>  	 * preferred mode is the right one.
> >>  	 */
> >>  	mutex_lock(&dev_priv->drm.mode_config.mutex);
> >> -	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC)
> >> +	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) {
> >> +		const struct edid *edid;
> >> +
> >> +		/* FIXME: Make drm_get_edid_switcheroo() return drm_edid */
> >>  		edid = drm_get_edid_switcheroo(connector,
> >> -				    intel_gmbus_get_adapter(dev_priv, pin));
> >> -	else
> >> -		edid = drm_get_edid(connector,
> >> -				    intel_gmbus_get_adapter(dev_priv, pin));
> >> -	if (edid) {
> >> -		if (drm_add_edid_modes(connector, edid)) {
> >> -			drm_connector_update_edid_property(connector,
> >> -								edid);
> >> -		} else {
> >> +					       intel_gmbus_get_adapter(dev_priv, pin));
> >> +		if (edid) {
> >> +			drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
> >>  			kfree(edid);
> >> -			edid = ERR_PTR(-EINVAL);
> >> +		} else {
> >> +			drm_edid = NULL;
> >> +		}
> >> +	} else {
> >> +		drm_edid = drm_edid_read_ddc(connector,
> >> +					     intel_gmbus_get_adapter(dev_priv, pin));
> >> +	}
> >> +	if (drm_edid) {
> >> +		if (drm_edid_connector_update(connector, drm_edid) ||
> >> +		    !drm_edid_connector_add_modes(connector)) {
> >> +			drm_edid_connector_update(connector, NULL);
> >> +			drm_edid_free(drm_edid);
> >> +			drm_edid = ERR_PTR(-EINVAL);
> >>  		}
> >>  	} else {
> >> -		edid = ERR_PTR(-ENOENT);
> >> +		drm_edid = ERR_PTR(-ENOENT);
> >>  	}
> >> -	intel_connector->edid = edid;
> >> +	intel_connector->edid = drm_edid;
> >>  
> >>  	intel_bios_init_panel_late(dev_priv, &intel_connector->panel, NULL,
> >> -				   IS_ERR(edid) ? NULL : edid);
> >> +				   IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
> >>  
> >>  	/* Try EDID first */
> >>  	intel_panel_add_edid_fixed_modes(intel_connector, true);
> >> -- 
> >> 2.34.1
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
