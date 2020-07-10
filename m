Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E4821BC45
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 19:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093A66EC99;
	Fri, 10 Jul 2020 17:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B60E6EC99
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:32:10 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id EC8A620021;
 Fri, 10 Jul 2020 19:32:07 +0200 (CEST)
Date: Fri, 10 Jul 2020 19:32:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH RESEND v2 2/2] drm/bridge: dw-hdmi: Always add the bridge
 in the global bridge list
Message-ID: <20200710173206.GC17565@ravnborg.org>
References: <1594260156-8316-1-git-send-email-victor.liu@nxp.com>
 <1594260156-8316-2-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594260156-8316-2-git-send-email-victor.liu@nxp.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8 a=IpJZQVW2AAAA:8 a=P1BnusSwAAAA:8
 a=RwHePtW7AAAA:8 a=QX4gbG5DAAAA:8 a=cm27Pg_UAAAA:8 a=1XWaLZrsAAAA:8
 a=LpQP-O61AAAA:8 a=jIQo8A4GAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=8AirrxEcAAAA:8 a=EyKNvAmGAGsKFtxV6_QA:9 a=CjuIK1q_8ugA:10
 a=IawgGOuG5U0WyFbmm1f5:22 a=D0XLA9XvdZm18NrgonBM:22
 a=FqraQwd7dyEg5dwJgZJs:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=xmb-EsYY8bH0VWELuYED:22 a=pioyyrs4ZptJ924tMmac:22
 a=Lf5xNeLK5dgiOs8hzIjU:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=ST-jHhOKWsTCqRlWije3:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Archit Taneja <architt@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Jose Abreu <joabreu@synopsys.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 09, 2020 at 10:02:36AM +0800, Liu Ying wrote:
> It doesn't hurt to add the bridge in the global bridge list also for
> platform specific dw-hdmi drivers which are based on the component
> framework.  This can be achieved by moving the drm_bridge_add() function
> call from dw_hdmi_probe() to __dw_hdmi_probe().  A counterpart movement
> for drm_bridge_remove() is also needed then.  Moreover, since drm_bridge_add()
> initializes &bridge->hpd_mutex, this may help those platform specific
> dw-hdmi drivers(based on the component framework) avoid accessing the
> uninitialized mutex in drm_bridge_hpd_notify() which is called in
> dw_hdmi_irq().  Putting drm_bridge_add() in __dw_hdmi_probe() just before
> it returns successfully should bring no logic change for platforms based
> on the DRM bridge API, which is a good choice from safety point of view.
> Also, __dw_hdmi_probe() is renamed to dw_hdmi_probe() since dw_hdmi_probe()
> does nothing else but calling __dw_hdmi_probe().  Similar renaming applies
> to the __dw_hdmi_remove()/dw_hdmi_remove() pair.

Hmm, it took me some attempts to read this.
Anyway, applied as-is to drm-misc-next.

	Sam

> 
> Fixes: ec971aaa6775 ("drm: bridge: dw-hdmi: Make connector creation optional")
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
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Put drm_bridge_add() in __dw_hdmi_probe() just before it returns
>   successfully so that the bridge shows up in the global bridge list
>   late enough to avoid potential race condition with other display
>   drivers. (Laurent)
> * Rename __dw_hdmi_probe/remove() to dw_hdmi_probe/remove()
>   respectively. (Laurent)
> * Cc'ed Sam.
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 44 +++++++++----------------------
>  1 file changed, 13 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 137b6eb..748df1c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3179,9 +3179,11 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
>  		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
>  }
>  
> -static struct dw_hdmi *
> -__dw_hdmi_probe(struct platform_device *pdev,
> -		const struct dw_hdmi_plat_data *plat_data)
> +/* -----------------------------------------------------------------------------
> + * Probe/remove API, used from platforms based on the DRM bridge API.
> + */
> +struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
> +			      const struct dw_hdmi_plat_data *plat_data)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> @@ -3438,6 +3440,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  		hdmi->cec = platform_device_register_full(&pdevinfo);
>  	}
>  
> +	drm_bridge_add(&hdmi->bridge);
> +
>  	return hdmi;
>  
>  err_iahb:
> @@ -3451,9 +3455,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  
>  	return ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL_GPL(dw_hdmi_probe);
>  
> -static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
> +void dw_hdmi_remove(struct dw_hdmi *hdmi)
>  {
> +	drm_bridge_remove(&hdmi->bridge);
> +
>  	if (hdmi->audio && !IS_ERR(hdmi->audio))
>  		platform_device_unregister(hdmi->audio);
>  	if (!IS_ERR(hdmi->cec))
> @@ -3472,31 +3479,6 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
>  	else
>  		i2c_put_adapter(hdmi->ddc);
>  }
> -
> -/* -----------------------------------------------------------------------------
> - * Probe/remove API, used from platforms based on the DRM bridge API.
> - */
> -struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
> -			      const struct dw_hdmi_plat_data *plat_data)
> -{
> -	struct dw_hdmi *hdmi;
> -
> -	hdmi = __dw_hdmi_probe(pdev, plat_data);
> -	if (IS_ERR(hdmi))
> -		return hdmi;
> -
> -	drm_bridge_add(&hdmi->bridge);
> -
> -	return hdmi;
> -}
> -EXPORT_SYMBOL_GPL(dw_hdmi_probe);
> -
> -void dw_hdmi_remove(struct dw_hdmi *hdmi)
> -{
> -	drm_bridge_remove(&hdmi->bridge);
> -
> -	__dw_hdmi_remove(hdmi);
> -}
>  EXPORT_SYMBOL_GPL(dw_hdmi_remove);
>  
>  /* -----------------------------------------------------------------------------
> @@ -3509,7 +3491,7 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
>  	struct dw_hdmi *hdmi;
>  	int ret;
>  
> -	hdmi = __dw_hdmi_probe(pdev, plat_data);
> +	hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi))
>  		return hdmi;
>  
> @@ -3526,7 +3508,7 @@ EXPORT_SYMBOL_GPL(dw_hdmi_bind);
>  
>  void dw_hdmi_unbind(struct dw_hdmi *hdmi)
>  {
> -	__dw_hdmi_remove(hdmi);
> +	dw_hdmi_remove(hdmi);
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_unbind);
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
