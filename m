Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED32D2351
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 06:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E3F6E94A;
	Tue,  8 Dec 2020 05:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22CC6E94A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 05:49:02 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 448C080684;
 Tue,  8 Dec 2020 06:48:57 +0100 (CET)
Date: Tue, 8 Dec 2020 06:48:55 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC PATCH] drm/panel: Make backlight attachment lazy
Message-ID: <20201208054855.GA18863@ravnborg.org>
References: <20201208044446.973238-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208044446.973238-1-bjorn.andersson@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=KJCBkObgxTU_UUeBqkUA:9
 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
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
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn,
On Mon, Dec 07, 2020 at 10:44:46PM -0600, Bjorn Andersson wrote:
> Some bridge chips, such as the TI SN65DSI86 DSI/eDP bridge, provides
> means of generating a PWM signal for backlight control of the attached
> panel. The provided PWM chip is typically controlled by the
> pwm-backlight driver, which if tied to the panel will provide DPMS.
> 
> But with the current implementation the panel will refuse to probe
> because the bridge driver has yet to probe and register the PWM chip,
> and the bridge driver will refuse to probe because it's unable to find
> the panel.
> 
> Mitigate this catch-22 situation by allowing the panel driver to probe
> and retry the attachment of the backlight as the panel is turned on or
> off.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/drm_panel.c | 47 +++++++++++++++++++++++++++----------
>  include/drm/drm_panel.h     |  8 +++++++
>  2 files changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..7487329bd22d 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -43,6 +43,34 @@ static LIST_HEAD(panel_list);
>   * take look at drm_panel_bridge_add() and devm_drm_panel_bridge_add().
>   */
>  
> +#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +static int drm_panel_of_backlight_lazy(struct drm_panel *panel)
> +{
> +	struct backlight_device *backlight;
> +
> +	if (!panel || !panel->dev)
> +		return -EINVAL;
> +
> +	backlight = devm_of_find_backlight(panel->dev);
> +
> +	if (IS_ERR(backlight)) {
> +		if (PTR_ERR(backlight) == -EPROBE_DEFER) {
> +			panel->backlight_init_pending = true;
> +			return 0;
> +		}
> +
> +		return PTR_ERR(backlight);
Use dev_err_probe()

> +	}
> +
> +	panel->backlight = backlight;
> +	panel->backlight_init_pending = false;
> +
> +	return 0;
> +}
> +#else
> +static int drm_panel_of_backlight_lazy(struct drm_panel *panel) { return 0; }
> +#endif
> +
>  /**
>   * drm_panel_init - initialize a panel
>   * @panel: DRM panel
> @@ -161,6 +189,9 @@ int drm_panel_enable(struct drm_panel *panel)
>  			return ret;
>  	}
>  
> +	if (panel->backlight_init_pending)
> +		drm_panel_of_backlight_lazy(panel);
> +
>  	ret = backlight_enable(panel->backlight);
>  	if (ret < 0)
>  		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
> @@ -187,6 +218,9 @@ int drm_panel_disable(struct drm_panel *panel)
>  	if (!panel)
>  		return -EINVAL;
>  
> +	if (panel->backlight_init_pending)
> +		drm_panel_of_backlight_lazy(panel);
> +
>  	ret = backlight_disable(panel->backlight);
>  	if (ret < 0)
>  		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
> @@ -328,18 +362,7 @@ EXPORT_SYMBOL(of_drm_get_panel_orientation);
>   */
>  int drm_panel_of_backlight(struct drm_panel *panel)
>  {
> -	struct backlight_device *backlight;
> -
> -	if (!panel || !panel->dev)
> -		return -EINVAL;
> -
> -	backlight = devm_of_find_backlight(panel->dev);
> -
> -	if (IS_ERR(backlight))
> -		return PTR_ERR(backlight);
> -
> -	panel->backlight = backlight;
> -	return 0;
> +	return drm_panel_of_backlight_lazy(panel);
Could you update the drm_panel_of_backlight() implementation (and
do not forget the documentation) and avoid drm_panel_of_backlight_lazy()?

	Sam

>  }
>  EXPORT_SYMBOL(drm_panel_of_backlight);
>  #endif
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 33605c3f0eba..b126abebb2f3 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -149,6 +149,14 @@ struct drm_panel {
>  	 */
>  	struct backlight_device *backlight;
>  
> +	/**
> +	 * @backlight_init_pending
> +	 *
> +	 * Backlight driver is not yet available so further attempts to
> +	 * initialize @backlight is necessary.
> +	 */
> +	bool backlight_init_pending;
> +

We have not done so today for other fields, but it would be good
to document this is for drm_panel use only and drivers shall not touch.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
