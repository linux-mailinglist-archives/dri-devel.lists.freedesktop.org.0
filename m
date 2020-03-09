Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 387B517DDEF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 11:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A5989DA8;
	Mon,  9 Mar 2020 10:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCD989DA8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 10:51:03 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jBFzx-0000So-P8; Mon, 09 Mar 2020 11:51:01 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jBFzv-0007F2-QO; Mon, 09 Mar 2020 11:50:59 +0100
Message-ID: <10f02dbe4e7b0966d279508b636e718e031e2e61.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: parallel-display: Adjust bus_flags and
 bus_format handling
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Mon, 09 Mar 2020 11:50:59 +0100
In-Reply-To: <20191114131751.26746-1-marex@denx.de>
References: <20191114131751.26746-1-marex@denx.de>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, 2019-11-14 at 14:17 +0100, Marek Vasut wrote:
> The bus_flags and bus_format handling logic does not seem to cover
> all potential usecases. Specifically, this seems to fail with an
> "edt,etm0700g0edh6" display attached to an 24bit display interface,
> with interface-pix-fmt = "rgb24" set in DT.

interface-pix-fmt is a legacy property that was never intended to be
used as an override for the panel bus format. The bus flags were
supposed to be set from the display-timings node, back when there was no
of-graph connected panel at all.

That being said, there isn't really a proper alternative that allows to
override the bus format requested by the panel driver in the device tree
to account for weird wiring. We could reuse the bus-width endpoint
property documented in [1], but that wouldn't completely specify how the
RGB components are to be mapped onto the parallel bus.

[1] Documentation/devicetree/bindings/media/video-interfaces.txt

I do wonder whether for your case it would be better to implement a
MEDIA_BUS_FMT_RGB666_1X24_CPADLO though, to leave the LSBs untouched
instead of risking to dump them into accidental PCB antennae.

> In this specific setup, the panel-simple.c driver entry for the display
> sets .bus_flags to non-zero value. However, as imxpd->bus_format is set
> from the DT property "interface-pix-fmt", imx_pd_encoder_atomic_check()
> will set imx_crtc_state->bus_flags = imxpd->bus_flags even though the
> imxpd->bus_flags is zero, while the di->bus_flags is correctly set by
> the panel-simple.c and non-zero.
>
> The result is incorrect flags being
> used for the display configuration and thus an image corruption.
> (Specifically, DRM_BUS_FLAG_PIXDATA_POSEDGE is not propagated and thus
> the ipuv3 clocks pixels on the wrong edge).
> 
> This patch fixes the problem by overriding the imx_crtc_state->bus_format
> from the imxpd->bus_format only if the DT property "interface-pix-fmt" is
> present or if the DI provides no formats. Similarly for bus_flags, which
> are set from imxpd->bus_flags only if the DI provides no formats.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/imx/parallel-display.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> index 35518e5de356..92f00b12c068 100644
> --- a/drivers/gpu/drm/imx/parallel-display.c
> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -113,13 +113,16 @@ static int imx_pd_encoder_atomic_check(struct drm_encoder *encoder,
>  	struct drm_display_info *di = &conn_state->connector->display_info;
>  	struct imx_parallel_display *imxpd = enc_to_imxpd(encoder);
>  
> -	if (!imxpd->bus_format && di->num_bus_formats) {
> -		imx_crtc_state->bus_flags = di->bus_flags;
> +	if (imxpd->bus_format || !di->num_bus_formats)

I see no reason to invert the logic here. Let's keep the common case
first.

> +		imx_crtc_state->bus_format = imxpd->bus_format;
> +	else
>  		imx_crtc_state->bus_format = di->bus_formats[0];
> -	} else {
> +
> +	if (di->num_bus_formats)
> +		imx_crtc_state->bus_flags = di->bus_flags;
> +	else
>  		imx_crtc_state->bus_flags = imxpd->bus_flags;
> -		imx_crtc_state->bus_format = imxpd->bus_format;
> -	}
> +
>  	imx_crtc_state->di_hsync_pin = 2;
>  	imx_crtc_state->di_vsync_pin = 3;

So while I don't like this being used at all, I think the patch improves
consistency, as imx_pd_connector_get_modes doesn't allow to override the
panel's modes with DT display-timings either.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
