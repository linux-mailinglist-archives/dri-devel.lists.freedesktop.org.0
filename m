Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9DA56D15A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 23:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3986D2A561;
	Sun, 10 Jul 2022 21:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1342A55A;
 Sun, 10 Jul 2022 21:24:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B9924F7;
 Sun, 10 Jul 2022 23:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657488250;
 bh=TzVKvIMA7E2NoY6B3hNoUQMONOMEeLEAj+rjS7UPfSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v8uew0eaokfqgyh15ODJYKomfImlIHDo9cD11UEL0VPj9rzm2vCzvd4vcFlKIurjb
 gutvH7x4N9qzgmkPwiWE94xx1uJFvVxnelQ5SjFspwiVyK+kgdmB5XD3sdD1+yaEVO
 XxHJ6bwK+7oGNFglmG/dhZTVpn+z06iNNjmo9Pqw=
Date: Mon, 11 Jul 2022 00:23:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 3/3] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <YstDX/7Xguzxrp21@pendragon.ideasonboard.com>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch.

On Sun, Jul 10, 2022 at 09:45:36PM +0300, Dmitry Baryshkov wrote:
> Now as the driver does not depend on pdata->connector, add support for
> attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index df08207d6223..9bca4615f71b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -698,11 +698,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>  	int ret;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
>  	pdata->aux.drm_dev = bridge->dev;
>  	ret = drm_dp_aux_register(&pdata->aux);
>  	if (ret < 0) {
> @@ -710,15 +705,15 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  		return ret;
>  	}
>  
> -	/* We never want the next bridge to *also* create a connector: */
> -	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> -
> -	/* Attach the next bridge */
> +	/* Attach the next bridge, We never want the next bridge to *also* create a connector. */

s/bridge,/bridge./

I also would have wrapped this line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> -				&pdata->bridge, flags);
> +				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret < 0)
>  		goto err_initted_aux;
>  
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
>  	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
>  						     pdata->bridge.encoder);
>  	if (IS_ERR(pdata->connector)) {

-- 
Regards,

Laurent Pinchart
