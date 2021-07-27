Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD83D71D5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851C6E95A;
	Tue, 27 Jul 2021 09:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B476E95A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:22:52 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3ac8c088-eebc-11eb-9082-0050568c148b;
 Tue, 27 Jul 2021 09:22:57 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 8F0A9194BA4;
 Tue, 27 Jul 2021 11:23:10 +0200 (CEST)
Date: Tue, 27 Jul 2021 11:22:48 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/panel-sony-acx424akp: Modernize backlight handling
Message-ID: <YP/QaAnHsJmGgqmM@ravnborg.org>
References: <20210715092808.1100106-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715092808.1100106-1-linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Thu, Jul 15, 2021 at 11:28:08AM +0200, Linus Walleij wrote:
> This converts the internal backlight in the Sony ACX424AKP
> driver to do it the canonical way:
> 
> - Assign the panel->backlight during probe.
> - Let the panel framework handle the backlight.
> - Make the backlight .set_brightness() turn the backlight
>   off completely if blank.
> - Fix some dev_err_probe() use cases along the way.

Very nice cleanup - thanks.
One issue below, with that fixed:

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I assume you will apply the patch yourself.

	Sam

> 
> Tested on the U8500 HREF520 reference design.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c | 84 +++++++-------------
>  1 file changed, 28 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> index 95659a4d15e9..163f0e0cee1c 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -40,7 +40,6 @@
>  struct acx424akp {
>  	struct drm_panel panel;
>  	struct device *dev;
> -	struct backlight_device *bl;
>  	struct regulator *supply;
>  	struct gpio_desc *reset_gpio;
>  	bool video_mode;
> @@ -102,6 +101,20 @@ static int acx424akp_set_brightness(struct backlight_device *bl)
>  	u8 par;
>  	int ret;
>  
> +
> +	if (backlight_is_blank(bl)) {
> +		/* Disable backlight */
> +		par = 0x00;
> +		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +					 &par, 1);
> +		if (ret) {
> +			dev_err(acx->dev, "failed to disable display backlight (%d)\n", ret);
> +			return ret;
> +		}
> +		return 0;
> +	}
> +
> +
>  	/* Calculate the PWM duty cycle in n/256's */
>  	pwm_ratio = max(((duty_ns * 256) / period_ns) - 1, 1);
>  	pwm_div = max(1,
> @@ -172,6 +185,12 @@ static const struct backlight_ops acx424akp_bl_ops = {
>  	.update_status = acx424akp_set_brightness,
>  };
>  
> +static const struct backlight_properties acx424akp_bl_props = {
> +	.type = BACKLIGHT_PLATFORM,
Other dsi panels uses BACKLIGHT_RAW here, which I think is more
correct. So unless there is good arguments for use of PLATFORM, please
change this to RAW.

It only influences how backlight is reported via sysfs, and there is no
functional change AFAICT.


	Sam
