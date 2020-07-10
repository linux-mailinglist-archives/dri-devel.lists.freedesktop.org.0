Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F3B21BF98
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E7E6ED21;
	Fri, 10 Jul 2020 22:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378E56ED1E;
 Fri, 10 Jul 2020 22:16:08 +0000 (UTC)
IronPort-SDR: 1flKZ2U5OP1lgtBAtMf+OQfe1rCJVow/LgdwKt0sSaSBTq/OYEiouimqpDdQjBoZmUR1Hj5K6i
 KRHFspYT9KYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9678"; a="233172296"
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="233172296"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 15:16:07 -0700
IronPort-SDR: CNiGw0gzbW7XLrZrHiJ1PekrhFmU4J/Hh0fVA2bB2zM3fgTaefJ/6J7biahGDnvm6epH6ivPse
 v5T/0cGAra1w==
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="458416144"
Received: from ideak-desk.fi.intel.com ([10.237.68.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 15:16:05 -0700
Date: Sat, 11 Jul 2020 01:16:00 +0300
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/probe_helper: Add
 drm_connector_helper_funcs.mode_valid_ctx
Message-ID: <20200710221600.GA29318@ideak-desk.fi.intel.com>
References: <20200710193144.94751-1-lyude@redhat.com>
 <20200710193144.94751-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710193144.94751-2-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 03:31:43PM -0400, Lyude Paul wrote:
> This is just an atomic version of mode_valid, which is intended to be
> used for situations where a driver might need to check the atomic state
> of objects other than the connector itself. One such example is with
> MST, where the maximum possible bandwidth on a connector can change
> dynamically irregardless of the display configuration.
> 
> Changes since v1:
> * Use new drm logging functions
> * Make some corrections in the mode_valid_ctx kdoc
> * Return error codes or 0 from ->mode_valid_ctx() on fail, and store the
>   drm_mode_status in an additional function parameter
> Changes since v2:
> * Don't accidentally assign ret to mode->status on success, or we'll
>   squash legitimate mode validation results
> * Don't forget to assign MODE_OK to status in drm_connector_mode_valid()
>   if we have no callbacks
> * Drop leftover hunk in drm_modes.h around enum drm_mode_status
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>

Some nits below, but looks good in either way:

Reviewed-and-tested-by: Imre Deak <imre.deak@intel.com>


> ---
>  drivers/gpu/drm/drm_crtc_helper_internal.h |  7 +-
>  drivers/gpu/drm/drm_probe_helper.c         | 94 ++++++++++++++--------
>  include/drm/drm_modeset_helper_vtables.h   | 42 ++++++++++
>  3 files changed, 109 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
> index f0a66ef47e5ad..25ce42e799952 100644
> --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> @@ -73,8 +73,11 @@ enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
>  					 const struct drm_display_mode *mode);
>  enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
>  					    const struct drm_display_mode *mode);
> -enum drm_mode_status drm_connector_mode_valid(struct drm_connector *connector,
> -					      struct drm_display_mode *mode);
> +int
> +drm_connector_mode_valid(struct drm_connector *connector,
> +			 struct drm_display_mode *mode,
> +			 struct drm_modeset_acquire_ctx *ctx,
> +			 enum drm_mode_status *status);
>  
>  struct drm_encoder *
>  drm_connector_get_single_encoder(struct drm_connector *connector);
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index e0ed58d291ed9..f7bd1d35aa805 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -86,17 +86,19 @@ drm_mode_validate_flag(const struct drm_display_mode *mode,
>  	return MODE_OK;
>  }
>  
> -static enum drm_mode_status
> +static int
>  drm_mode_validate_pipeline(struct drm_display_mode *mode,
> -			    struct drm_connector *connector)
> +			   struct drm_connector *connector,
> +			   struct drm_modeset_acquire_ctx *ctx,
> +			   enum drm_mode_status *status)
>  {
>  	struct drm_device *dev = connector->dev;
> -	enum drm_mode_status ret = MODE_OK;
>  	struct drm_encoder *encoder;
> +	int ret;
>  
>  	/* Step 1: Validate against connector */
> -	ret = drm_connector_mode_valid(connector, mode);
> -	if (ret != MODE_OK)
> +	ret = drm_connector_mode_valid(connector, mode, ctx, status);
> +	if (ret || *status != MODE_OK)
>  		return ret;

After this point ret is guaranteed to stay 0, so would be clearer to
just s/return ret/return 0/ later in this func.

>  
>  	/* Step 2: Validate against encoders and crtcs */
> @@ -104,8 +106,8 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
>  		struct drm_bridge *bridge;
>  		struct drm_crtc *crtc;
>  
> -		ret = drm_encoder_mode_valid(encoder, mode);
> -		if (ret != MODE_OK) {
> +		*status = drm_encoder_mode_valid(encoder, mode);
> +		if (*status != MODE_OK) {
>  			/* No point in continuing for crtc check as this encoder
>  			 * will not accept the mode anyway. If all encoders
>  			 * reject the mode then, at exit, ret will not be
> @@ -114,10 +116,10 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
>  		}
>  
>  		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		ret = drm_bridge_chain_mode_valid(bridge,
> -						  &connector->display_info,
> -						  mode);
> -		if (ret != MODE_OK) {
> +		*status = drm_bridge_chain_mode_valid(bridge,
> +						      &connector->display_info,
> +						      mode);
> +		if (*status != MODE_OK) {
>  			/* There is also no point in continuing for crtc check
>  			 * here. */
>  			continue;
> @@ -127,8 +129,8 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
>  			if (!drm_encoder_crtc_ok(encoder, crtc))
>  				continue;
>  
> -			ret = drm_crtc_mode_valid(crtc, mode);
> -			if (ret == MODE_OK) {
> +			*status = drm_crtc_mode_valid(crtc, mode);
> +			if (*status == MODE_OK) {
>  				/* If we get to this point there is at least
>  				 * one combination of encoder+crtc that works
>  				 * for this mode. Lets return now. */
> @@ -198,16 +200,26 @@ enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
>  	return encoder_funcs->mode_valid(encoder, mode);
>  }
>  
> -enum drm_mode_status drm_connector_mode_valid(struct drm_connector *connector,
> -					      struct drm_display_mode *mode)
> +int
> +drm_connector_mode_valid(struct drm_connector *connector,
> +			 struct drm_display_mode *mode,
> +			 struct drm_modeset_acquire_ctx *ctx,
> +			 enum drm_mode_status *status)
>  {
>  	const struct drm_connector_helper_funcs *connector_funcs =
>  		connector->helper_private;

would look a bit neater by
	int ret = 0;
and

>  
> -	if (!connector_funcs || !connector_funcs->mode_valid)
> -		return MODE_OK;
> +	if (!connector_funcs)
> +		*status = MODE_OK;
> +	else if (connector_funcs->mode_valid_ctx)
> +		return connector_funcs->mode_valid_ctx(connector, mode, ctx,
> +						       status);

		ret = ...
> +	else if (connector_funcs->mode_valid)
> +		*status = connector_funcs->mode_valid(connector, mode);
> +	else
> +		*status = MODE_OK;
>  
> -	return connector_funcs->mode_valid(connector, mode);
> +	return 0;

	return ret;

>  }
>  
>  #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
> @@ -385,8 +397,9 @@ EXPORT_SYMBOL(drm_helper_probe_detect);
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
> @@ -517,22 +530,39 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  		mode_flags |= DRM_MODE_FLAG_3D_MASK;
>  
>  	list_for_each_entry(mode, &connector->modes, head) {
> -		if (mode->status == MODE_OK)
> -			mode->status = drm_mode_validate_driver(dev, mode);
> +		if (mode->status != MODE_OK)
> +			continue;
>  
> -		if (mode->status == MODE_OK)
> -			mode->status = drm_mode_validate_size(mode, maxX, maxY);
> +		mode->status = drm_mode_validate_driver(dev, mode);
> +		if (mode->status != MODE_OK)
> +			continue;
>  
> -		if (mode->status == MODE_OK)
> -			mode->status = drm_mode_validate_flag(mode, mode_flags);
> +		mode->status = drm_mode_validate_size(mode, maxX, maxY);
> +		if (mode->status != MODE_OK)
> +			continue;
> +
> +		mode->status = drm_mode_validate_flag(mode, mode_flags);
> +		if (mode->status != MODE_OK)
> +			continue;
>  
> -		if (mode->status == MODE_OK)
> -			mode->status = drm_mode_validate_pipeline(mode,
> -								  connector);
> +		ret = drm_mode_validate_pipeline(mode, connector, &ctx,
> +						 &mode->status);
> +		if (ret) {
> +			drm_dbg_kms(dev,
> +				    "drm_mode_validate_pipeline failed: %d\n",
> +				    ret);
> +
> +			if (drm_WARN_ON_ONCE(dev, ret != -EDEADLK)) {
> +				mode->status = MODE_ERROR;
> +			} else {
> +				drm_modeset_backoff(&ctx);
> +				goto retry;
> +			}
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
> index 421a30f084631..4efec30f8badc 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -968,6 +968,48 @@ struct drm_connector_helper_funcs {
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
> +	 * &drm_connector_helper_funcs.mode_valid.
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
> +	 * would be ok to validate the minimum bandwidth requirement of a mode
> +	 * against the maximum possible bandwidth of the connector. But it
> +	 * wouldn't be ok to take the current bandwidth usage of other
> +	 * connectors into account, as this would change depending on the
> +	 * display state.
> +	 *
> +	 * Returns:
> +	 * 0 if &drm_connector_helper_funcs.mode_valid_ctx succeeded and wrote
> +	 * the &enum drm_mode_status value to @status, or a negative error
> +	 * code otherwise.
> +	 *
> +	 */
> +	int (*mode_valid_ctx)(struct drm_connector *connector,
> +			      struct drm_display_mode *mode,
> +			      struct drm_modeset_acquire_ctx *ctx,
> +			      enum drm_mode_status *status);
> +
>  	/**
>  	 * @best_encoder:
>  	 *
> -- 
> 2.26.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
