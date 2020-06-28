Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE5120C6F4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 10:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC576E1FB;
	Sun, 28 Jun 2020 08:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B79B6E1F4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 08:22:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 511CD4FB;
 Sun, 28 Jun 2020 10:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593332533;
 bh=HjiH1aREkpSDa5ngmNWnOVX1J1ijYGD+h8KCuZ0YjFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SJR7M+hF140rilU445+uAZQH0F7+HTKXgVV3W+7ObpVe56ErLMcGPzi4oWc/jw7og
 nk/8DrI0WFt+/lSgo/GnAvww7RkexkeV9LJ/ev0cX9R0BTX7IWbTNzah6rhyOv8Tbx
 ZfC/VZydQQrKzUBpZMDSiMcJPxHwsykPzJK05Hs8=
Date: Sun, 28 Jun 2020 11:22:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 2/2] drm/bridge: dw-hdmi: Always add the bridge in the
 global bridge list
Message-ID: <20200628082210.GF6954@pendragon.ideasonboard.com>
References: <1592298292-17634-1-git-send-email-victor.liu@nxp.com>
 <1592298292-17634-2-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592298292-17634-2-git-send-email-victor.liu@nxp.com>
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
Cc: joabreu@synopsys.com, jernej.skrabec@siol.net, darekm@google.com,
 jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-imx@nxp.com, cychiang@chromium.org,
 Sam Ravnborg <sam@ravnborg.org>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

(CC'ing Sam)

Thank you for the patch.

On Tue, Jun 16, 2020 at 05:04:52PM +0800, Liu Ying wrote:
> It doesn't hurt to add the bridge in the global bridge list also for
> platform specific dw-hdmi drivers which are based on the component
> framework.  This can be achieved by moving the drm_bridge_add() function
> call from dw_hdmi_probe() to __dw_hdmi_probe().  Moreover, putting the
> drm_bridge_add() function call prior to the interrupt registration and
> enablement ensures that the mutex hpd_mutex embedded in the structure
> drm_bridge can be initialized in drm_bridge_add() beforehand, which
> avoids accessing the uninitialized mutex in case people want to call
> function drm_bridge_hpd_notify() with the mutex locked internally to
> handle hot plug detection event in the interrupt handler dw_hdmi_irq().
> 
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Dariusz Marcinkiewicz <darekm@google.com>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Laurent,
> 
> I may see the uninitialized mutex accessing issue with
> i.MX dw-hdmi after applying your below patch set[1].
> I think patch '[22/27] drm: bridge: dw-hdmi: Make connector creation optional'
> triggers the issue.
> 
> [1] https://patchwork.kernel.org/cover/11569709/
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 34 ++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index da84a91..4711700 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3247,17 +3247,25 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  
>  	dw_hdmi_init_hw(hdmi);
>  
> +	hdmi->bridge.driver_private = hdmi;
> +	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
> +#ifdef CONFIG_OF
> +	hdmi->bridge.of_node = pdev->dev.of_node;
> +#endif
> +
> +	drm_bridge_add(&hdmi->bridge);

This would introduce a race condition where a display driver could get
hold of the bridge before it is fully initialized.

I fear the right fix for this may be to add a drm_bridge_init() function
to move mutex initialization away from drm_bridge_add(). That's a rather
intrusive change I'm afraid :-(

> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		ret = irq;
> -		goto err_iahb;
> +		goto err_irq;
>  	}
>  
>  	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
>  					dw_hdmi_irq, IRQF_SHARED,
>  					dev_name(dev), hdmi);
>  	if (ret)
> -		goto err_iahb;
> +		goto err_irq;
>  
>  	/*
>  	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
> @@ -3290,12 +3298,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  			hdmi->ddc = NULL;
>  	}
>  
> -	hdmi->bridge.driver_private = hdmi;
> -	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
> -#ifdef CONFIG_OF
> -	hdmi->bridge.of_node = pdev->dev.of_node;
> -#endif
> -
>  	if (hdmi->version >= 0x200a)
>  		hdmi->connector.ycbcr_420_allowed =
>  			hdmi->plat_data->ycbcr_420_allowed;
> @@ -3357,6 +3359,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  
>  	return hdmi;
>  
> +err_irq:
> +	drm_bridge_remove(&hdmi->bridge);
>  err_iahb:
>  	clk_disable_unprepare(hdmi->iahb_clk);
>  	if (hdmi->cec_clk)
> @@ -3371,6 +3375,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  
>  static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
>  {
> +	drm_bridge_remove(&hdmi->bridge);
> +
>  	if (hdmi->audio && !IS_ERR(hdmi->audio))
>  		platform_device_unregister(hdmi->audio);
>  	if (!IS_ERR(hdmi->cec))
> @@ -3396,22 +3402,12 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
>  struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  			      const struct dw_hdmi_plat_data *plat_data)
>  {
> -	struct dw_hdmi *hdmi;
> -
> -	hdmi = __dw_hdmi_probe(pdev, plat_data);
> -	if (IS_ERR(hdmi))
> -		return hdmi;
> -
> -	drm_bridge_add(&hdmi->bridge);
> -
> -	return hdmi;
> +	return __dw_hdmi_probe(pdev, plat_data);
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_probe);

Do we need to keep __dw_hdmi_probe() and dw_hdmi_probe(), can't we
rename __dw_hdmi_probe() to dw_hdmi_probe() ? Same for the remove
functions.

>  
>  void dw_hdmi_remove(struct dw_hdmi *hdmi)
>  {
> -	drm_bridge_remove(&hdmi->bridge);
> -
>  	__dw_hdmi_remove(hdmi);
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_remove);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
