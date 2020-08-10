Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101CE24115F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 22:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE8689E03;
	Mon, 10 Aug 2020 20:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DFD89E03
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 20:06:38 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9380A804CE;
 Mon, 10 Aug 2020 22:06:36 +0200 (CEST)
Date: Mon, 10 Aug 2020 22:06:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: dw_hdmi-imx: use imx_drm_encoder_parse_of
Message-ID: <20200810200635.GB415947@ravnborg.org>
References: <20200721130710.28254-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721130710.28254-1-p.zabel@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=AcUgYmktXaVvNuM0g-YA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 03:07:10PM +0200, Philipp Zabel wrote:
> This is the same code and comment that is already shared by imx-ldb,
> imx-tve, and parallel-display in imx_drm_encoder_parse_of().
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Looks OK:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/imx/dw_hdmi-imx.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> index 87869b9997a6..a4f178c1d9bc 100644
> --- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
> +++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> @@ -217,15 +217,9 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
>  	hdmi->dev = &pdev->dev;
>  	encoder = &hdmi->encoder;
>  
> -	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
> -	/*
> -	 * If we failed to find the CRTC(s) which this encoder is
> -	 * supposed to be connected to, it's because the CRTC has
> -	 * not been registered yet.  Defer probing, and hope that
> -	 * the required CRTC is added later.
> -	 */
> -	if (encoder->possible_crtcs == 0)
> -		return -EPROBE_DEFER;
> +	ret = imx_drm_encoder_parse_of(drm, encoder, dev->of_node);
> +	if (ret)
> +		return ret;
>  
>  	ret = dw_hdmi_imx_parse_dt(hdmi);
>  	if (ret < 0)
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
