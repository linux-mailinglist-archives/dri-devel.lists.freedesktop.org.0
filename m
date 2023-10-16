Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83137CB21E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 20:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334D310E231;
	Mon, 16 Oct 2023 18:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED94E10E231
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 18:14:43 +0000 (UTC)
Received: from i53875b5b.versanet.de ([83.135.91.91] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qsS6x-0007t7-TA; Mon, 16 Oct 2023 20:14:39 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
 rate to calculate lbcc
Date: Mon, 16 Oct 2023 20:14:38 +0200
Message-ID: <1971539.CrzyxZ31qj@diego>
In-Reply-To: <20230717061831.1826878-6-victor.liu@nxp.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-6-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, jonas@kwiboo.se, s.hauer@pengutronix.de,
 jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Montag, 17. Juli 2023, 08:18:27 CEST schrieb Liu Ying:
> To get better accuration, use pixel clock rate to calculate lbcc instead of
> lane_mbps since the pixel clock rate is in KHz while lane_mbps is in MHz.
> Without this, distorted image can be seen on a HDMI monitor connected with
> i.MX93 11x11 EVK through ADV7535 DSI to HDMI bridge in 1920x1080p@60 video
> mode.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

looks like I'm late to the party, but this change breaks the display output
my px30 minievb with the xinpeng xpp055c272 dsi display [0].

Found this commit via git bisection and added a bit of debug output to
compare the value differences for the old and new calculation:

[   34.810722] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 810 * 480 * 1000 / 8
[   34.810749] dw_mipi_dsi_get_hcomponent_lbcc: new lbcc: 810 * 64000 * 24 / (4 * 8)
[   34.810756] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 48600000, new lbcc: 38880000
[   34.810762] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 10 * 480 * 1000 / 8
[   34.810767] dw_mipi_dsi_get_hcomponent_lbcc: new lbcc: 10 * 64000 * 24 / (4 * 8)
[   34.810773] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 600000, new lbcc: 480000
[   34.810778] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 40 * 480 * 1000 / 8
[   34.810783] dw_mipi_dsi_get_hcomponent_lbcc: new lbcc: 40 * 64000 * 24 / (4 * 8)
[   34.810789] dw_mipi_dsi_get_hcomponent_lbcc: old lbcc: 2400000, new lbcc: 1920000

With the new lbcc I get a blank dsi panel and just going back to the old
calculation of lbcc restores the image.

I don't have that much in-depth knowledge about dsi stuff and the original
panel times also "just" came from the vendor tree, but I really would like
to keep that display working ;-) .

Do you have any idea which way to go to fix this?


Thanks
Heiko


[0]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/px30-evb.dts#n138
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index c754d55f71d1..332388fd86da 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -12,6 +12,7 @@
>  #include <linux/component.h>
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
> +#include <linux/math64.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> @@ -762,8 +763,15 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
>  					   u32 hcomponent)
>  {
>  	u32 frac, lbcc;
> +	int bpp;
>  
> -	lbcc = hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
> +	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	if (bpp < 0) {
> +		dev_err(dsi->dev, "failed to get bpp\n");
> +		return 0;
> +	}
> +
> +	lbcc = div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);




