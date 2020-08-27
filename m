Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7A253CCD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 06:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0286E186;
	Thu, 27 Aug 2020 04:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9648B6E186
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 04:39:04 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D521620037;
 Thu, 27 Aug 2020 06:38:58 +0200 (CEST)
Date: Thu, 27 Aug 2020 06:38:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Fix driver not probing when IPU port is
 missing
Message-ID: <20200827043857.GA471795@ravnborg.org>
References: <20200826215841.131707-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826215841.131707-1-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=daa1VWNWBBr9psker5wA:9
 a=Atj5JKAPb7vTmTu7:21 a=EkxTb_1puiFBqyfm:21 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>,
 od@zcrc.me, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Wed, Aug 26, 2020 at 11:58:41PM +0200, Paul Cercueil wrote:
> Even if support for the IPU was compiled in, we may run on a device
> (e.g. the Qi LB60) where the IPU is not available, or simply with an old
> devicetree without the IPU node. In that case the ingenic-drm refused to
> probe.
> 
> Fix the driver so that it will probe even if the IPU node is not present
> in devicetree (but then IPU support is disabled of course).
> 
> Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index ada990a7f911..216b67f1672e 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -673,6 +673,18 @@ static void ingenic_drm_unbind_all(void *d)
>  	component_unbind_all(priv->dev, &priv->drm);
>  }
>  
> +static inline struct device_node *ingenic_drm_get_ipu_node(struct device *dev)
> +{
> +	/* IPU is at port address 8 */
> +	return of_graph_get_remote_node(dev->of_node, 8, 0);
> +}
kernel-doc for of_graph_get_remote_node() says:

    * Return: Remote device node associated with remote endpoint node linked
    *	   to @node. Use of_node_put() on it when done.

In other words this code leaks a device node.
This was the case with the old code too.

	Sam

> +
> +static inline bool ingenic_drm_has_ipu(struct device *dev)
> +{
> +	return IS_ENABLED(CONFIG_DRM_INGENIC_IPU) &&
> +		!!ingenic_drm_get_ipu_node(dev);
> +}
> +
>  static int ingenic_drm_bind(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -808,7 +820,7 @@ static int ingenic_drm_bind(struct device *dev)
>  			return ret;
>  		}
>  
> -		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
> +		if (ingenic_drm_has_ipu(dev)) {
>  			ret = component_bind_all(dev, drm);
>  			if (ret) {
>  				if (ret != -EPROBE_DEFER)
> @@ -970,12 +982,9 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
>  		return ingenic_drm_bind(dev);
>  
> -	/* IPU is at port address 8 */
> -	np = of_graph_get_remote_node(dev->of_node, 8, 0);
> -	if (!np) {
> -		dev_err(dev, "Unable to get IPU node\n");
> -		return -EINVAL;
> -	}
> +	np = ingenic_drm_get_ipu_node(dev);
> +	if (!np)
> +		return ingenic_drm_bind(dev);
>  
>  	drm_of_component_match_add(dev, &match, compare_of, np);
>  
> -- 
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
