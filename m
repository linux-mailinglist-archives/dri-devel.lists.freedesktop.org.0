Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C9E78F1DD
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 19:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254FA10E0EE;
	Thu, 31 Aug 2023 17:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DBE10E0E7;
 Thu, 31 Aug 2023 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693502702; x=1725038702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GTS8w1vFRbKw6Z5fs2GGWb5MlJivULFPOSfQjRvg/wQ=;
 b=KxgGPDHafqo04AwnzAidVF8t0oxH/BtyqdeGVp3AIR6WyaBVEeq+x9qw
 J+7NnZ/KFvJf/HWx22MR1Y0SmJDFBRsIAaxhRcHMzkoeCO2h55iJ6H7vG
 nVSViWDeXPy4ifQ2FXvePDNb4r3rRKhGhYoxFlgK3kk2TDxnl/scxxjiA
 ypev3APVbEHcqVPPAPrfNxmhfShf6cEoD7HzMST64gLWAm3oDoTZJBCJ4
 nVsaqGeWPYF/oZKsFoV1UwaLIY116iItjGo5ipIKMhkP+UsjnceelvSQQ
 OEHIgJOBSBGCCS54Myx8DUFJqPg83h7cttZu/MNBuNQ4iiS4HkhVS1+u6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379802787"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="379802787"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 10:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733192617"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="733192617"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga007.jf.intel.com with SMTP; 31 Aug 2023 10:24:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 31 Aug 2023 20:24:58 +0300
Date: Thu, 31 Aug 2023 20:24:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915/display: use
 drm_edid_is_digital()
Message-ID: <ZPDM6rh0NMa4yt6H@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
 <dbc0269d34f3140aff410eefae8a2711c59299b3.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbc0269d34f3140aff410eefae8a2711c59299b3.1692884619.git.jani.nikula@intel.com>
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 04:46:03PM +0300, Jani Nikula wrote:
> Reduce the use of struct edid and drm_edid_raw().
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_crt.c  | 11 ++++-------
>  drivers/gpu/drm/i915/display/intel_hdmi.c |  9 ++++-----
>  drivers/gpu/drm/i915/display/intel_sdvo.c |  7 ++-----
>  3 files changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
> index f66340b4caf0..310670bb6c25 100644
> --- a/drivers/gpu/drm/i915/display/intel_crt.c
> +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> @@ -657,21 +657,18 @@ static bool intel_crt_detect_ddc(struct drm_connector *connector)
>  	drm_edid = intel_crt_get_edid(connector, i2c);
>  
>  	if (drm_edid) {
> -		const struct edid *edid = drm_edid_raw(drm_edid);
> -		bool is_digital = edid->input & DRM_EDID_INPUT_DIGITAL;
> -
>  		/*
>  		 * This may be a DVI-I connector with a shared DDC
>  		 * link between analog and digital outputs, so we
>  		 * have to check the EDID input spec of the attached device.
>  		 */
> -		if (!is_digital) {
> +		if (drm_edid_is_digital(drm_edid)) {
>  			drm_dbg_kms(&dev_priv->drm,
> -				    "CRT detected via DDC:0x50 [EDID]\n");
> -			ret = true;
> +				    "CRT not detected via DDC:0x50 [EDID reports a digital panel]\n");
>  		} else {
>  			drm_dbg_kms(&dev_priv->drm,
> -				    "CRT not detected via DDC:0x50 [EDID reports a digital panel]\n");
> +				    "CRT detected via DDC:0x50 [EDID]\n");
> +			ret = true;

Inverting the check made the diff a bit confusing, but looks
correct in the end.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  		}
>  	} else {
>  		drm_dbg_kms(&dev_priv->drm,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 9442bf43550e..aa9915098dda 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2452,7 +2452,6 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
>  	intel_wakeref_t wakeref;
>  	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
>  	bool connected = false;
>  	struct i2c_adapter *i2c;
>  
> @@ -2475,9 +2474,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  
>  	to_intel_connector(connector)->detect_edid = drm_edid;
>  
> -	/* FIXME: Get rid of drm_edid_raw() */
> -	edid = drm_edid_raw(drm_edid);
> -	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
> +	if (drm_edid_is_digital(drm_edid)) {
>  		intel_hdmi_dp_dual_mode_detect(connector);
>  
>  		connected = true;
> @@ -2485,7 +2482,9 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  
>  	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
>  
> -	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier, edid);
> +	/* FIXME: Get rid of drm_edid_raw() */
> +	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier,
> +					     drm_edid_raw(drm_edid));
>  
>  	return connected;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index 7d25a64698e2..917771e19e38 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -2094,10 +2094,8 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
>  
>  	status = connector_status_unknown;
>  	if (drm_edid) {
> -		const struct edid *edid = drm_edid_raw(drm_edid);
> -
>  		/* DDC bus is shared, match EDID to connector type */
> -		if (edid && edid->input & DRM_EDID_INPUT_DIGITAL)
> +		if (drm_edid_is_digital(drm_edid))
>  			status = connector_status_connected;
>  		else
>  			status = connector_status_disconnected;
> @@ -2111,8 +2109,7 @@ static bool
>  intel_sdvo_connector_matches_edid(struct intel_sdvo_connector *sdvo,
>  				  const struct drm_edid *drm_edid)
>  {
> -	const struct edid *edid = drm_edid_raw(drm_edid);
> -	bool monitor_is_digital = !!(edid->input & DRM_EDID_INPUT_DIGITAL);
> +	bool monitor_is_digital = drm_edid_is_digital(drm_edid);
>  	bool connector_is_digital = !!IS_DIGITAL(sdvo);
>  
>  	DRM_DEBUG_KMS("connector_is_digital? %d, monitor_is_digital? %d\n",
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
