Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333AA3E177E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 17:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD856EA91;
	Thu,  5 Aug 2021 15:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1F86EA91
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 15:04:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD527E04;
 Thu,  5 Aug 2021 17:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628175896;
 bh=TEJORNSttP9WWJ4+Duss24NQytGVgycAdaJHtji+RJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wWF7sGskHUTcMF1oSUefAiPeLWc0md5mV5Z1rg9pU7EAfAjWrqa3XbE8MVQZfkjm9
 WEbUGfYCJqmHGbBhryEnmaxbw6xd8Tsl+x51s7XOqfJobUtG7ndmHIMVgAC9JCzdVp
 FwAjt8CyGMsQ1EIWAK7ZuuGjgAeY6gkKdtDU5S1w=
Date: Thu, 5 Aug 2021 18:04:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Paul Boddie <paul@boddie.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 8/8] [RFC] drm/ingenic: convert to component framework
 for jz4780 hdmi
Message-ID: <YQv+DC5yTEGlJYuD@pendragon.ideasonboard.com>
References: <cover.1628172477.git.hns@goldelico.com>
 <77554dd2612f418f6ab74a8be06c82b71410e0e6.1628172477.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77554dd2612f418f6ab74a8be06c82b71410e0e6.1628172477.git.hns@goldelico.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Thank you for the patch.

On Thu, Aug 05, 2021 at 04:07:57PM +0200, H. Nikolaus Schaller wrote:
> This patch attempts to convert the ingenic-dw-hdmi driver
> into a version that uses the component framework.

Why ? What problem would this solve ?

> Unfortunately the new version does not work.
> 
> Debugging shows that ingenic_dw_hdmi_bind() is never called.
> 
> Suggestions for reasons and fixes are welcome.
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Co-authored-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 57 ++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> index 61e7a57d7cec1..a5ba0b69baa8c 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> @@ -1,17 +1,24 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
> - * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
> + * Copyright (C) 2019, 2020, 2021 Paul Boddie <paul@boddie.org.uk>
>   *
>   * Derived from dw_hdmi-imx.c with i.MX portions removed.
> - * Probe and remove operations derived from rcar_dw_hdmi.c.
>   */
>  
> +#include <linux/component.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
>  #include <drm/bridge/dw_hdmi.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +struct ingenic_dw_hdmi_encoder {
> +	struct drm_encoder encoder;
> +	struct dw_hdmi *hdmi;
> +};
>  
>  static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] = {
>  	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 0x0000 } } },
> @@ -87,24 +94,52 @@ static const struct of_device_id ingenic_dw_hdmi_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
>  
> -static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
> +static int ingenic_dw_hdmi_bind(struct device *dev, struct device *master,
> +				void *data)
>  {
> -	struct dw_hdmi *hdmi;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct drm_device *drm = data;
> +	struct drm_encoder *enc;
> +	struct ingenic_dw_hdmi_encoder *hdmi_encoder;
>  
> -	hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
> -	if (IS_ERR(hdmi))
> -		return PTR_ERR(hdmi);
> +	hdmi_encoder = drmm_simple_encoder_alloc(drm, struct ingenic_dw_hdmi_encoder,
> +						 encoder, DRM_MODE_ENCODER_TMDS);
> +	if (IS_ERR(hdmi_encoder))
> +		return PTR_ERR(hdmi_encoder);
>  
> -	platform_set_drvdata(pdev, hdmi);
> +	enc = &hdmi_encoder->encoder;
> +	drm_encoder_helper_add(enc, NULL);
> +	hdmi_encoder->hdmi = dw_hdmi_bind(pdev, enc, &ingenic_dw_hdmi_plat_data);
> +
> +	if (IS_ERR(hdmi_encoder->hdmi))
> +		return PTR_ERR(hdmi_encoder->hdmi);
> +
> +	dev_set_drvdata(dev, hdmi_encoder->hdmi);
>  
>  	return 0;
>  }
>  
> -static int ingenic_dw_hdmi_remove(struct platform_device *pdev)
> +static void ingenic_dw_hdmi_unbind(struct device *dev, struct device *master,
> +				   void *data)
> +{
> +	struct dw_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	dw_hdmi_unbind(hdmi);
> +}
> +
> +static const struct component_ops ingenic_dw_hdmi_ops = {
> +	.bind	= ingenic_dw_hdmi_bind,
> +	.unbind	= ingenic_dw_hdmi_unbind,
> +};
> +
> +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
>  {
> -	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> +	return component_add(&pdev->dev, &ingenic_dw_hdmi_ops);
> +}
>  
> -	dw_hdmi_remove(hdmi);
> +static int ingenic_dw_hdmi_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &ingenic_dw_hdmi_ops);
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
