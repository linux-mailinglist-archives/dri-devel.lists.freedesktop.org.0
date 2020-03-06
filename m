Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E246417C7BF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 22:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A081A6E511;
	Fri,  6 Mar 2020 21:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A836E511
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 21:18:18 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 92F132001E;
 Fri,  6 Mar 2020 22:18:04 +0100 (CET)
Date: Fri, 6 Mar 2020 22:18:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/22] drm/arc: Use simple encoder
Message-ID: <20200306211802.GA17369@ravnborg.org>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305155950.2705-2-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=rqCPFu_3IIfdMowE660A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, airlied@linux.ie,
 linux@armlinux.org.uk, paul@crapouillou.net, thierry.reding@gmail.com,
 krzk@kernel.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 tomi.valkeinen@ti.com, abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, ludovic.desroches@microchip.com,
 kgene@kernel.org, linux-imx@nxp.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, rodrigosiqueiramelo@gmail.com,
 bbrezillon@kernel.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 04:59:29PM +0100, Thomas Zimmermann wrote:
> The arc driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.

We should , as a follow-up patch, embed the encoder in
arcgpu_drm_private.
Then we drop the kzalloc() and avoid that life-time challenge.

This patch looks good for what it does.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/arc/arcpgu_hdmi.c | 10 +++-------
>  drivers/gpu/drm/arc/arcpgu_sim.c  |  8 ++------
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> index 52839934f2fb..780911765e2e 100644
> --- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
> +++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> @@ -7,15 +7,12 @@
>  
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_encoder.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "arcpgu.h"
>  
> -static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
>  {
>  	struct drm_encoder *encoder;
> @@ -34,8 +31,7 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
>  
>  	encoder->possible_crtcs = 1;
>  	encoder->possible_clones = 0;
> -	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, NULL);
> +	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
> index 37d961668dfe..66ca2c26e339 100644
> --- a/drivers/gpu/drm/arc/arcpgu_sim.c
> +++ b/drivers/gpu/drm/arc/arcpgu_sim.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "arcpgu.h"
>  
> @@ -50,10 +51,6 @@ static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  {
>  	struct arcpgu_drm_connector *arcpgu_connector;
> @@ -68,8 +65,7 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  	encoder->possible_crtcs = 1;
>  	encoder->possible_clones = 0;
>  
> -	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_VIRTUAL);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
