Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30A3C3EE1
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 21:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4CD89C0A;
	Sun, 11 Jul 2021 19:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E2689C0A
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 19:40:59 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id e6c5e67b-e27f-11eb-9082-0050568c148b;
 Sun, 11 Jul 2021 19:40:52 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 34374194B15;
 Sun, 11 Jul 2021 21:41:07 +0200 (CEST)
Date: Sun, 11 Jul 2021 21:40:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: [RESEND PATCH v4] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <YOtJRg1ToG/hj4Hn@ravnborg.org>
References: <1626018569-25963-1-git-send-email-oliver.graute@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626018569-25963-1-git-send-email-oliver.graute@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oliver.

On Sun, Jul 11, 2021 at 05:49:29PM +0200, Oliver Graute wrote:
> Add support for the Solomon Goldentek Display Model: GKTW70SDAD1SD
> to panel-simple.
> 
> The panel spec from Variscite can be found at:
> https://www.variscite.com/wp-content/uploads/2017/12/VLCD-CAP-GLD-RGB.pdf
> 
> Signed-off-by: Oliver Graute <oliver.graute@gmail.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> ---
> 
> v4:
> 
> - added the datasheet labels
> - added Reviewed-by
> 
> v3:
> 
> - added flags
> - added delay
> 
> v2:
> 
> - changed bpc to 6
> - set max value of pixelclock
> - increased hfront_porch and hback_porch
> - dropped connector-type
connector_type is mandatory. It will cause a warnign if it is missing.
Please re-add.

> 
> adding of bus_format = MEDIA_BUS_FMT_RGB666_1X18 results in wrong colors.
> omitting bus_format and using some default is better (Tux Pinguin is colored
> fine)
Likewise bus_format is mandatory. If default is better than MEDIA_BUS_FMT_RGB666_1X18,
then specify whatever is default.

> 
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 2be358f..c63f6a8 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3336,6 +3336,36 @@ static const struct panel_desc satoz_sat050at40h12r2 = {
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> +static const struct display_timing sgd_gktw70sdad1sd_timing = {
> +	.pixelclock = {30000000, 30000000, 40000000},
> +	.hactive = { 800, 800, 800},
> +	.hfront_porch = {40, 40, 40},
> +	.hback_porch = {40, 40, 40},
> +	.hsync_len = {48, 48, 48},
> +	.vactive = {480, 480, 480},
> +	.vfront_porch = {13, 13, 13},
> +	.vback_porch = {29, 29, 29},
> +	.vsync_len = {3, 3, 3},
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +			DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_NEGEDGE,
> +};
> +
> +static const struct panel_desc sgd_gktw70sdad1sd = {
> +	.timings = &sgd_gktw70sdad1sd_timing,
> +	.num_timings = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 153,
> +		.height = 86,
> +	},
> +	.delay = {
> +		.prepare = 20 + 20 + 10 + 10, /* T0 + T2 + T3 + T4 */
> +		.enable = 50, /* T5 */
> +		.disable = 50, /* T5 */
> +		.unprepare =  10 + 10 + 20 + 20, /* T4 + T3 + T2 + T0 */
> +	},
> +};
> +
>  static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
>  	.clock = 168480,
>  	.hdisplay = 1920,
> @@ -4222,6 +4252,9 @@ static const struct of_device_id platform_of_match[] = {
>  		.compatible = "satoz,sat050at40h12r2",
>  		.data = &satoz_sat050at40h12r2,
>  	}, {
> +		.compatible = "sgd,gktw70sdad1sd",

compatible needs to be documented - please add to the appropiate .yaml
file, or add a new bindings file.

Sorry for the push back, but if we do not get this fixed now we will
have to revisit it later.

	Sam

