Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3062DFDC0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 16:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA916E487;
	Mon, 21 Dec 2020 15:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3C56E487
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 15:54:07 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E95A3BA4;
 Mon, 21 Dec 2020 16:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608566046;
 bh=J/CnmZBC2kgJN0iaL8OvLOGBQ3Mkv0Y3e+R8FVQvP84=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=igo+B+dGJuKnzepi3acqT6EW1oVLlyBX2kxDuYUrCVsCLAu8NWFAjPCB/aHvQS8o9
 Kqb5d4KXIwXIKCMcRACQLCwUWh3v/EV/ls4ZPWLaYoWDsv+Sy4zRoONSht9sHJlSF4
 kiFCiivSzQNQRa9tEyLXEXv36T0jr2KbLGNzJRYo=
Subject: Re: [PATCH v2 5/9] drm: rcar-du: Use DRM-managed allocation for
 encoders
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201214205208.10248-6-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <dec19d78-2b3a-aed5-6738-054f845e3567@ideasonboard.com>
Date: Mon, 21 Dec 2020 15:54:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214205208.10248-6-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 14/12/2020 20:52, Laurent Pinchart wrote:
> devm_kzalloc() is the wrong API to allocate encoders, as the lifetime of
> the encoders is tied to the DRM device, not the device to driver
> binding. drmm_kzalloc() isn't a good option either, as it would result
> in the encoder being freed before being unregistered during the managed
> cleanup of the DRM objects. Use a plain kzalloc(), and register a drmm
> action to cleanup the encoder.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Seems this is the only one in the series without my tag.

And looks ok to me,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 47 ++++++++++++++---------
>  1 file changed, 29 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index e4bac47caf16..55a0ecf45ebb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -8,12 +8,13 @@
>   */
>  
>  #include <linux/export.h>
> +#include <linux/slab.h>
>  
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
> -#include <drm/drm_simple_kms_helper.h>
>  
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> @@ -44,6 +45,17 @@ static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
>  	return num_ports;
>  }
>  
> +static const struct drm_encoder_funcs rcar_du_encoder_funcs = {
> +};
> +
> +static void rcar_du_encoder_release(struct drm_device *dev, void *res)
> +{
> +	struct rcar_du_encoder *renc = res;
> +
> +	drm_encoder_cleanup(&renc->base);
> +	kfree(renc);
> +}
> +
>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 enum rcar_du_output output,
>  			 struct device_node *enc_node)
> @@ -53,7 +65,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	struct drm_bridge *bridge;
>  	int ret;
>  
> -	renc = devm_kzalloc(rcdu->dev, sizeof(*renc), GFP_KERNEL);
> +	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
>  	if (renc == NULL)
>  		return -ENOMEM;
>  
> @@ -75,20 +87,20 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  
>  		if (IS_ERR(panel)) {
>  			ret = PTR_ERR(panel);
> -			goto done;
> +			goto error;
>  		}
>  
>  		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>  							 DRM_MODE_CONNECTOR_DPI);
>  		if (IS_ERR(bridge)) {
>  			ret = PTR_ERR(bridge);
> -			goto done;
> +			goto error;
>  		}
>  	} else {
>  		bridge = of_drm_find_bridge(enc_node);
>  		if (!bridge) {
>  			ret = -EPROBE_DEFER;
> -			goto done;
> +			goto error;
>  		}
>  
>  		if (output == RCAR_DU_OUTPUT_LVDS0 ||
> @@ -103,28 +115,27 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	if (rcdu->info->gen >= 3 && output == RCAR_DU_OUTPUT_LVDS1) {
>  		if (rcar_lvds_dual_link(bridge)) {
>  			ret = -ENOLINK;
> -			goto done;
> +			goto error;
>  		}
>  	}
>  
> -	ret = drm_simple_encoder_init(rcdu->ddev, encoder,
> -				      DRM_MODE_ENCODER_NONE);
> +	ret = drm_encoder_init(rcdu->ddev, encoder, &rcar_du_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
>  	if (ret < 0)
> -		goto done;
> +		goto error;
> +
> +	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_encoder_release,
> +				       renc);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Attach the bridge to the encoder. The bridge will create the
>  	 * connector.
>  	 */
> -	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> -	if (ret) {
> -		drm_encoder_cleanup(encoder);
> -		return ret;
> -	}
> -
> -done:
> -	if (ret < 0)
> -		devm_kfree(rcdu->dev, renc);
> +	return drm_bridge_attach(encoder, bridge, NULL, 0);
>  
> +error:
> +	kfree(renc);
>  	return ret;
>  }
> 

-- 
Regards
--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
