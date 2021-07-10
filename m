Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C423C3422
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 12:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3106EB1E;
	Sat, 10 Jul 2021 10:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D0F6EB1E
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 10:29:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625912949; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vUaVusk/YScGrAt4Z1U7bx3ET73dQ3obHUEKrXNt7sg=;
 b=Rp7VAYWWpi+/+rcvw3ZJ/2FPgsEzyYWfYUW5Dn91YsWw+bD8w2Ksj0eVTvnMmRj89ahWbmuS
 6tgKqTQ/AklwnxkTz03cJSHoiv1rCw1lpp+XtleyawVuWvPMzG38yc123ocYaepV79gVM4Wz
 21Qw1L5r4xKj+hPeXhAjXiVbrkk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60e9766e01dd9a9431a7ab76 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Jul 2021 10:29:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7B941C4338A; Sat, 10 Jul 2021 10:29:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48930C433F1;
 Sat, 10 Jul 2021 10:28:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Sat, 10 Jul 2021 15:58:59 +0530
From: rajeevny@codeaurora.org
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/dp: Move panel DP AUX backlight support to
 drm_dp_helper
In-Reply-To: <20210709152909.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid>
References: <20210709152909.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid>
Message-ID: <67ff22da55104dda57a0015e073cdfcc@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On 10-07-2021 03:59, Douglas Anderson wrote:
> We were getting a depmod error:
>   depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> 
> drm_kms_helper
> 
> It looks like the rule is that drm_kms_helper can call into drm, but
> drm can't call into drm_kms_helper. That means we've got to move the
> DP AUX backlight support into drm_dp_helper.
> 
> NOTE: as part of this, I didn't try to do any renames of the main
> registration function. Even though it's in the drm_dp_helper, it still
> feels very parallel to drm_panel_of_backlight().
> 
> Fixes: 10f7b40e4f30 ("drm/panel: add basic DP AUX backlight support")
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Note that I've compile tested this, but I don't have a device setup
> yet that uses this code. Since the code is basically the same as it
> was this should be OK, but if Rajeev could confirm that nothing is
> broken that'd be nice.
> 
>  drivers/gpu/drm/drm_dp_helper.c | 108 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_panel.c     | 108 --------------------------------
>  include/drm/drm_dp_helper.h     |   3 +
>  include/drm/drm_panel.h         |   8 ---
>  4 files changed, 111 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c 
> b/drivers/gpu/drm/drm_dp_helper.c
> index 24bbc710c825..5b1c772e8f38 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -33,9 +33,17 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_dp_mst_helper.h>
> +#include <drm/drm_panel.h>
> 
>  #include "drm_crtc_helper_internal.h"
> 
> +struct dp_aux_backlight {
> +	struct backlight_device *base;
> +	struct drm_dp_aux *aux;
> +	struct drm_edp_backlight_info info;
> +	bool enabled;
> +};
> +
>  /**
>   * DOC: dp helpers
>   *
> @@ -3462,3 +3470,103 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_edp_backlight_init);
> +
> +static int dp_aux_backlight_update_status(struct backlight_device *bd)
> +{
> +	struct dp_aux_backlight *bl = bl_get_data(bd);
> +	u16 brightness = backlight_get_brightness(bd);
> +	int ret = 0;
> +
> +	if (!backlight_is_blank(bd)) {
> +		if (!bl->enabled) {
> +			drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
> +			bl->enabled = true;
> +			return 0;
> +		}
> +		ret = drm_edp_backlight_set_level(bl->aux, &bl->info, brightness);
> +	} else {
> +		if (bl->enabled) {
> +			drm_edp_backlight_disable(bl->aux, &bl->info);
> +			bl->enabled = false;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct backlight_ops dp_aux_bl_ops = {
> +	.update_status = dp_aux_backlight_update_status,
> +};
> +
> +/**
> + * drm_panel_dp_aux_backlight - create and use DP AUX backlight
> + * @panel: DRM panel
> + * @aux: The DP AUX channel to use
> + *
> + * Use this function to create and handle backlight if your panel
> + * supports backlight control over DP AUX channel using DPCD
> + * registers as per VESA's standard backlight control interface.
> + *
> + * When the panel is enabled backlight will be enabled after a
> + * successful call to &drm_panel_funcs.enable()
> + *
> + * When the panel is disabled backlight will be disabled before the
> + * call to &drm_panel_funcs.disable().
> + *
> + * A typical implementation for a panel driver supporting backlight
> + * control over DP AUX will call this function at probe time.
> + * Backlight will then be handled transparently without requiring
> + * any intervention from the driver.
> + *
> + * drm_panel_dp_aux_backlight() must be called after the call to
> drm_panel_init().
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct 
> drm_dp_aux *aux)
> +{
> +	struct dp_aux_backlight *bl;
> +	struct backlight_properties props = { 0 };
> +	u16 current_level;
> +	u8 current_mode;
> +	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
> +	int ret;
> +
> +	if (!panel || !panel->dev || !aux)
> +		return -EINVAL;
> +
> +	ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
> +			       EDP_DISPLAY_CTL_CAP_SIZE);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!drm_edp_backlight_supported(edp_dpcd)) {
> +		DRM_DEV_INFO(panel->dev, "DP AUX backlight is not supported\n");
> +		return 0;
> +	}
> +
> +	bl = devm_kzalloc(panel->dev, sizeof(*bl), GFP_KERNEL);
> +	if (!bl)
> +		return -ENOMEM;
> +
> +	bl->aux = aux;
> +
> +	ret = drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
> +				     &current_level, &current_mode);
> +	if (ret < 0)
> +		return ret;
> +
> +	props.type = BACKLIGHT_RAW;
> +	props.brightness = current_level;
> +	props.max_brightness = bl->info.max;
> +
> +	bl->base = devm_backlight_device_register(panel->dev, 
> "dp_aux_backlight",
> +						  panel->dev, bl,
> +						  &dp_aux_bl_ops, &props);
> +	if (IS_ERR(bl->base))
> +		return PTR_ERR(bl->base);
> +
> +	panel->backlight = bl->base;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 4fa1e3bb1b78..f634371c717a 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -26,20 +26,12 @@
>  #include <linux/module.h>
> 
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_dp_helper.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
> 
>  static DEFINE_MUTEX(panel_lock);
>  static LIST_HEAD(panel_list);
> 
> -struct dp_aux_backlight {
> -	struct backlight_device *base;
> -	struct drm_dp_aux *aux;
> -	struct drm_edp_backlight_info info;
> -	bool enabled;
> -};
> -
>  /**
>   * DOC: drm panel
>   *
> @@ -350,106 +342,6 @@ int drm_panel_of_backlight(struct drm_panel 
> *panel)
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_of_backlight);
> -
> -static int dp_aux_backlight_update_status(struct backlight_device *bd)
> -{
> -	struct dp_aux_backlight *bl = bl_get_data(bd);
> -	u16 brightness = backlight_get_brightness(bd);
> -	int ret = 0;
> -
> -	if (!backlight_is_blank(bd)) {
> -		if (!bl->enabled) {
> -			drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
> -			bl->enabled = true;
> -			return 0;
> -		}
> -		ret = drm_edp_backlight_set_level(bl->aux, &bl->info, brightness);
> -	} else {
> -		if (bl->enabled) {
> -			drm_edp_backlight_disable(bl->aux, &bl->info);
> -			bl->enabled = false;
> -		}
> -	}
> -
> -	return ret;
> -}
> -
> -static const struct backlight_ops dp_aux_bl_ops = {
> -	.update_status = dp_aux_backlight_update_status,
> -};
> -
> -/**
> - * drm_panel_dp_aux_backlight - create and use DP AUX backlight
> - * @panel: DRM panel
> - * @aux: The DP AUX channel to use
> - *
> - * Use this function to create and handle backlight if your panel
> - * supports backlight control over DP AUX channel using DPCD
> - * registers as per VESA's standard backlight control interface.
> - *
> - * When the panel is enabled backlight will be enabled after a
> - * successful call to &drm_panel_funcs.enable()
> - *
> - * When the panel is disabled backlight will be disabled before the
> - * call to &drm_panel_funcs.disable().
> - *
> - * A typical implementation for a panel driver supporting backlight
> - * control over DP AUX will call this function at probe time.
> - * Backlight will then be handled transparently without requiring
> - * any intervention from the driver.
> - *
> - * drm_panel_dp_aux_backlight() must be called after the call to
> drm_panel_init().
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct 
> drm_dp_aux *aux)
> -{
> -	struct dp_aux_backlight *bl;
> -	struct backlight_properties props = { 0 };
> -	u16 current_level;
> -	u8 current_mode;
> -	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
> -	int ret;
> -
> -	if (!panel || !panel->dev || !aux)
> -		return -EINVAL;
> -
> -	ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
> -			       EDP_DISPLAY_CTL_CAP_SIZE);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (!drm_edp_backlight_supported(edp_dpcd)) {
> -		DRM_DEV_INFO(panel->dev, "DP AUX backlight is not supported\n");
> -		return 0;
> -	}
> -
> -	bl = devm_kzalloc(panel->dev, sizeof(*bl), GFP_KERNEL);
> -	if (!bl)
> -		return -ENOMEM;
> -
> -	bl->aux = aux;
> -
> -	ret = drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
> -				     &current_level, &current_mode);
> -	if (ret < 0)
> -		return ret;
> -
> -	props.type = BACKLIGHT_RAW;
> -	props.brightness = current_level;
> -	props.max_brightness = bl->info.max;
> -
> -	bl->base = devm_backlight_device_register(panel->dev, 
> "dp_aux_backlight",
> -						  panel->dev, bl,
> -						  &dp_aux_bl_ops, &props);
> -	if (IS_ERR(bl->base))
> -		return PTR_ERR(bl->base);
> -
> -	panel->backlight = bl->base;
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>  #endif
> 
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 729d5d82475e..4ca34f61ca01 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -30,6 +30,7 @@
> 
>  struct drm_device;
>  struct drm_dp_aux;
> +struct drm_panel;
> 
>  /*
>   * Unless otherwise noted, all values are from the DP 1.1a spec.  Note 
> that
> @@ -2200,6 +2201,8 @@ int drm_edp_backlight_enable(struct drm_dp_aux
> *aux, const struct drm_edp_backli
>  			     u16 level);
>  int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl);
> 
> +int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct
> drm_dp_aux *aux);
> +
>  #ifdef CONFIG_DRM_DP_CEC
>  void drm_dp_cec_irq(struct drm_dp_aux *aux);
>  void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 71aac751a032..4602f833eb51 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -32,7 +32,6 @@ struct backlight_device;
>  struct device_node;
>  struct drm_connector;
>  struct drm_device;
> -struct drm_dp_aux;
>  struct drm_panel;
>  struct display_timing;
> 
> @@ -209,18 +208,11 @@ static inline int
> of_drm_get_panel_orientation(const struct device_node *np,
>  #if IS_ENABLED(CONFIG_DRM_PANEL) &&
> (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
>  	(IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))

Thanks, for the fix. Changes look good to me. I checked this on Trogdor 
Lazor device.

I have one small doubt, shouldn't we add above (or similar) check around 
drm_panel_dp_aux_backlight() in drm_dp_helper source & header files?
This function is using devm_backlight_device_register() that needs 
CONFIG_BACKLIGHT_CLASS_DEVICE for compilation.

If that's not an issue,
Reviewed-by: Rajeev Nandan <rajeevny@codeaurora.org>


>  int drm_panel_of_backlight(struct drm_panel *panel);
> -int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct
> drm_dp_aux *aux);
>  #else
>  static inline int drm_panel_of_backlight(struct drm_panel *panel)
>  {
>  	return 0;
>  }
> -
> -static inline int drm_panel_dp_aux_backlight(struct drm_panel *panel,
> -					     struct drm_dp_aux *aux)
> -{
> -	return 0;
> -}
>  #endif
> 
>  #endif
