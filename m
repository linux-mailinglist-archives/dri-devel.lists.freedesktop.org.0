Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3135B3B0FF7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 00:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587F26E2F2;
	Tue, 22 Jun 2021 22:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596DA6E2F2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 22:17:33 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6B67A66;
 Wed, 23 Jun 2021 00:17:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624400251;
 bh=EQGAcaXjURCpvn903fkMskzJfYK888/MW1sdDAuRA3o=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=SH0oUBq52oV90VySWUX9s8zZwF2xh4ngU5H3jGomH9GczOl4XuT7wzcOAIxzOaN/+
 7e0zbtNkZ4yX2e28BByEx8kSvLrh7X4uKlSXerSaKJpHyxV8cmjUeFAHQuxM33OJFU
 60wE/MtbniaxuP5sNo2VDEbk3N5Cn++55He9y/kU=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 4/4] drm: rcar-du: Use drm_bridge_connector_init()
 helper
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210520065046.28978-5-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <0d59a0d4-2201-210a-fc4e-fd67dd756d88@ideasonboard.com>
Date: Tue, 22 Jun 2021 23:17:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520065046.28978-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,


On 20/05/2021 07:50, Laurent Pinchart wrote:
> Use the drm_bridge_connector_init() helper to create a drm_connector for
> each output, instead of relying on the bridge drivers doing so. Attach
> the bridges with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to instruct
> them not to create a connector.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Aha, this is the one that fixed my issues!

Looks good, and tests well ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Changes since v2:
> 
> - Declare ret variable
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 26 ++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index ca3761772211..0daa8bba50f5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> @@ -53,7 +54,9 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 struct device_node *enc_node)
>  {
>  	struct rcar_du_encoder *renc;
> +	struct drm_connector *connector;
>  	struct drm_bridge *bridge;
> +	int ret;
>  
>  	/*
>  	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
> @@ -103,9 +106,22 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  
>  	renc->output = output;
>  
> -	/*
> -	 * Attach the bridge to the encoder. The bridge will create the
> -	 * connector.
> -	 */
> -	return drm_bridge_attach(&renc->base, bridge, NULL, 0);
> +	/* Attach the bridge to the encoder. */
> +	ret = drm_bridge_attach(&renc->base, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		dev_err(rcdu->dev, "failed to attach bridge for output %u\n",
> +			output);
> +		return ret;
> +	}
> +
> +	/* Create the connector for the chain of bridges. */
> +	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
> +	if (IS_ERR(connector)) {
> +		dev_err(rcdu->dev,
> +			"failed to created connector for output %u\n", output);
> +		return PTR_ERR(connector);
> +	}
> +
> +	return drm_connector_attach_encoder(connector, &renc->base);
>  }
> 
