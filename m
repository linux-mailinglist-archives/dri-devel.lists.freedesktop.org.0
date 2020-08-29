Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24BA256A49
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 23:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABC56E0BA;
	Sat, 29 Aug 2020 21:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738E96E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 21:08:30 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8C421804A4;
 Sat, 29 Aug 2020 23:08:28 +0200 (CEST)
Date: Sat, 29 Aug 2020 23:08:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/2] drm/ingenic: Fix driver not probing when IPU port
 is missing
Message-ID: <20200829210827.GF796939@ravnborg.org>
References: <20200827114404.36748-1-paul@crapouillou.net>
 <20200827114404.36748-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827114404.36748-2-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8
 a=8Y5p9mnmN_Fc2c6ofskA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 01:44:04PM +0200, Paul Cercueil wrote:
> Even if support for the IPU was compiled in, we may run on a device
> (e.g. the Qi LB60) where the IPU is not available, or simply with an old
> devicetree without the IPU node. In that case the ingenic-drm refused to
> probe.
> 
> Fix the driver so that it will probe even if the IPU node is not present
> in devicetree (but then IPU support is disabled of course).
> 
> v2: Take a different approach
> 
> Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index c1bcb93aed2d..b7074161ccf0 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -673,7 +673,7 @@ static void ingenic_drm_unbind_all(void *d)
>  	component_unbind_all(priv->dev, &priv->drm);
>  }
>  
> -static int ingenic_drm_bind(struct device *dev)
> +static int ingenic_drm_bind(struct device *dev, bool has_components)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	const struct jz_soc_info *soc_info;
> @@ -808,7 +808,7 @@ static int ingenic_drm_bind(struct device *dev)
>  			return ret;
>  		}
>  
> -		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
> +		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
>  			ret = component_bind_all(dev, drm);
>  			if (ret) {
>  				if (ret != -EPROBE_DEFER)
> @@ -939,6 +939,11 @@ static int ingenic_drm_bind(struct device *dev)
>  	return ret;
>  }
>  
> +static int ingenic_drm_bind_with_components(struct device *dev)
> +{
> +	return ingenic_drm_bind(dev, true);
> +}
> +
>  static int compare_of(struct device *dev, void *data)
>  {
>  	return dev->of_node == data;
> @@ -957,7 +962,7 @@ static void ingenic_drm_unbind(struct device *dev)
>  }
>  
>  static const struct component_master_ops ingenic_master_ops = {
> -	.bind = ingenic_drm_bind,
> +	.bind = ingenic_drm_bind_with_components,
>  	.unbind = ingenic_drm_unbind,
>  };
>  
> @@ -968,14 +973,12 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  	struct device_node *np;
>  
>  	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
> -		return ingenic_drm_bind(dev);
> +		return ingenic_drm_bind(dev, false);
>  
>  	/* IPU is at port address 8 */
>  	np = of_graph_get_remote_node(dev->of_node, 8, 0);
> -	if (!np) {
> -		dev_err(dev, "Unable to get IPU node\n");
> -		return -EINVAL;
> -	}
> +	if (!np)
> +		return ingenic_drm_bind(dev, false);
>  
>  	drm_of_component_match_add(dev, &match, compare_of, np);
>  	of_node_put(np);
> -- 
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
