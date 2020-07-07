Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05A7217B17
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 00:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F9B6E277;
	Tue,  7 Jul 2020 22:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA49D6E277
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 22:40:42 +0000 (UTC)
IronPort-SDR: S7R6QYsGUS4OroLDhCOw2RDiVdJ5CPSxiqrZX33pZEDq+OdSZZ1bWLfWzVPjLEI9KxZHI47QcE
 FmY0ZH+vuJuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146772939"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="146772939"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 15:40:42 -0700
IronPort-SDR: I0bH2pXwvn8WJCYfhPyyMFQqvk4chhDK7gQIoYQAgrM+/pf7EG4xvSsK0CPQCypMk3G0A2n/68
 f+TXuxmrYuSA==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="457275235"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 15:40:40 -0700
Date: Wed, 8 Jul 2020 01:40:36 +0300
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/2] drm/probe_helper: Add
 drm_connector_helper_funcs.mode_valid_ctx
Message-ID: <20200707224036.GA22747@ideak-desk.fi.intel.com>
References: <20200526182313.4005-1-lyude@redhat.com>
 <20200526182313.4005-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526182313.4005-2-lyude@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: imre.deak@intel.com
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Shawn C <shawn.c.lee@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the delay, the review as I promised:

On Tue, May 26, 2020 at 02:23:09PM -0400, Lyude Paul wrote:
> This is just an atomic version of mode_valid, which is intended to be
> used for situations where a driver might need to check the atomic state
> of objects other than the connector itself. One such example is with
> MST, where the maximum possible bandwidth on a connector can change
> dynamically irregardless of the display configuration.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Tested-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_crtc_helper_internal.h |  6 +-
>  drivers/gpu/drm/drm_probe_helper.c         | 65 ++++++++++++++--------
>  include/drm/drm_modeset_helper_vtables.h   | 41 ++++++++++++++
>  3 files changed, 88 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
> index f0a66ef47e5ad..ca767cba6094d 100644
> --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> @@ -73,8 +73,10 @@ enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
>  					 const struct drm_display_mode *mode);
>  enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
>  					    const struct drm_display_mode *mode);
> -enum drm_mode_status drm_connector_mode_valid(struct drm_connector *connector,
> -					      struct drm_display_mode *mode);
> +enum drm_mode_status
> +drm_connector_mode_valid(struct drm_connector *connector,
> +			 struct drm_display_mode *mode,
> +			 struct drm_modeset_acquire_ctx *ctx);
>  
>  struct drm_encoder *
>  drm_connector_get_single_encoder(struct drm_connector *connector);
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 466dfbba82564..3132784736841 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -86,16 +86,17 @@ drm_mode_validate_flag(const struct drm_display_mode *mode,
>  	return MODE_OK;
>  }
>  
> -static enum drm_mode_status
> +static int
>  drm_mode_validate_pipeline(struct drm_display_mode *mode,
> -			    struct drm_connector *connector)
> +			   struct drm_connector *connector,
> +			   struct drm_modeset_acquire_ctx *ctx)
>  {
>  	struct drm_device *dev = connector->dev;
> -	enum drm_mode_status ret = MODE_OK;
>  	struct drm_encoder *encoder;
> +	int ret = MODE_OK;
>  
>  	/* Step 1: Validate against connector */
> -	ret = drm_connector_mode_valid(connector, mode);
> +	ret = drm_connector_mode_valid(connector, mode, ctx);
>  	if (ret != MODE_OK)
>  		return ret;
>  
> @@ -196,16 +197,23 @@ enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
>  	return encoder_funcs->mode_valid(encoder, mode);
>  }
>  
> -enum drm_mode_status drm_connector_mode_valid(struct drm_connector *connector,
> -					      struct drm_display_mode *mode)
> +int
> +drm_connector_mode_valid(struct drm_connector *connector,
> +			 struct drm_display_mode *mode,
> +			 struct drm_modeset_acquire_ctx *ctx)
>  {
>  	const struct drm_connector_helper_funcs *connector_funcs =
>  		connector->helper_private;
>  
> -	if (!connector_funcs || !connector_funcs->mode_valid)
> +	if (!connector_funcs)
>  		return MODE_OK;
>  
> -	return connector_funcs->mode_valid(connector, mode);
> +	if (connector_funcs->mode_valid_ctx)
> +		return connector_funcs->mode_valid_ctx(connector, mode, ctx);
> +	else if (connector_funcs->mode_valid)
> +		return connector_funcs->mode_valid(connector, mode);
> +	else
> +		return MODE_OK;
>  }
>  
>  #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
> @@ -375,8 +383,9 @@ EXPORT_SYMBOL(drm_helper_probe_detect);
>   *      (if specified)
>   *    - drm_mode_validate_flag() checks the modes against basic connector
>   *      capabilities (interlace_allowed,doublescan_allowed,stereo_allowed)
> - *    - the optional &drm_connector_helper_funcs.mode_valid helper can perform
> - *      driver and/or sink specific checks
> + *    - the optional &drm_connector_helper_funcs.mode_valid or
> + *      &drm_connector_helper_funcs.mode_valid_ctx helpers can perform driver
> + *      and/or sink specific checks
>   *    - the optional &drm_crtc_helper_funcs.mode_valid,
>   *      &drm_bridge_funcs.mode_valid and &drm_encoder_helper_funcs.mode_valid
>   *      helpers can perform driver and/or source specific checks which are also
> @@ -507,22 +516,34 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  		mode_flags |= DRM_MODE_FLAG_3D_MASK;
>  
>  	list_for_each_entry(mode, &connector->modes, head) {
> -		if (mode->status == MODE_OK)
> -			mode->status = drm_mode_validate_driver(dev, mode);
> +		if (mode->status != MODE_OK)
> +			continue;
> +
> +		mode->status = drm_mode_validate_driver(dev, mode);
> +		if (mode->status != MODE_OK)
> +			continue;
>  
> -		if (mode->status == MODE_OK)
> -			mode->status = drm_mode_validate_size(mode, maxX, maxY);
> +		mode->status = drm_mode_validate_size(mode, maxX, maxY);
> +		if (mode->status != MODE_OK)
> +			continue;
>  
> -		if (mode->status == MODE_OK)
> -			mode->status = drm_mode_validate_flag(mode, mode_flags);
> +		mode->status = drm_mode_validate_flag(mode, mode_flags);
> +		if (mode->status != MODE_OK)
> +			continue;
>  
> -		if (mode->status == MODE_OK)
> -			mode->status = drm_mode_validate_pipeline(mode,
> -								  connector);
> +		ret = drm_mode_validate_pipeline(mode, connector, &ctx);
> +		if (ret == -EDEADLK) {
> +			drm_modeset_backoff(&ctx);
> +			goto retry;
> +		} else if (WARN_ON_ONCE(ret < 0)) {
> +			mode->status = MODE_BAD;
> +		} else {
> +			mode->status = ret;
> +		}
>  
> -		if (mode->status == MODE_OK)
> -			mode->status = drm_mode_validate_ycbcr420(mode,
> -								  connector);
> +		if (mode->status != MODE_OK)
> +			continue;
> +		mode->status = drm_mode_validate_ycbcr420(mode, connector);
>  	}
>  
>  prune:
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index 421a30f084631..8f020c3424b2b 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -968,6 +968,47 @@ struct drm_connector_helper_funcs {
>  	 */
>  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>  					   struct drm_display_mode *mode);
> +
> +	/**
> +	 * @mode_valid_ctx:
> +	 *
> +	 * Callback to validate a mode for a connector, irrespective of the
> +	 * specific display configuration.
> +	 *
> +	 * This callback is used by the probe helpers to filter the mode list
> +	 * (which is usually derived from the EDID data block from the sink).
> +	 * See e.g. drm_helper_probe_single_connector_modes().
> +	 *
> +	 * This function is optional, and is the atomic version of
> +	 * &drm_connector_funcs.mode_valid.
> +	 *
> +	 * To allow for accessing the atomic state of modesetting objects, the
> +	 * helper libraries always call this with ctx set to a valid context,
> +	 * and &drm_mode_config.connection_mutex will always be locked with
> +	 * the ctx parameter set to @ctx. This allows for taking additional
> +	 * locks as required.
> +	 *
> +	 * Even though additional locks may be acquired, this callback is
> +	 * still expected not to take any constraints into account which would
> +	 * be influenced by the currently set display state - such constraints
> +	 * should be handled in the driver's atomic check. For example, if a
> +	 * connector shares display bandwidth with other connectors then it
> +	 * would be ok to validate a mode uses against the maximum possible
                                     ^mode against?

Reviewed-by: Imre Deak <imre.deak@intel.com>

> +	 * bandwidth of the connector. But it wouldn't be ok to take the
> +	 * current bandwidth usage of other connectors into account, as this
> +	 * would change depending on the display state.
> +	 *
> +	 * Returns:
> +	 *
> +	 * Either &drm_mode_status.MODE_OK, one of the failure reasons in
> +	 * &enum drm_mode_status, or -EDEADLK if a deadlock would have
> +	 * occurred and we need to backoff.
> +	 *
> +	 */
> +	int (*mode_valid_ctx)(struct drm_connector *connector,
> +			      struct drm_display_mode *mode,
> +			      struct drm_modeset_acquire_ctx *ctx);
> +
>  	/**
>  	 * @best_encoder:
>  	 *
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
