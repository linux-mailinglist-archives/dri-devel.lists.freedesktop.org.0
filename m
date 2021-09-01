Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E0B3FDFC9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 18:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD566E1F8;
	Wed,  1 Sep 2021 16:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFE76E1F3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 16:23:36 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD636559;
 Wed,  1 Sep 2021 18:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1630513415;
 bh=rQcKBSIJIO0CAdUQve/kEYEH9mXfsV3rEctHKZgCmxo=;
 h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
 b=LJ2p9wRfbE/XBTDzgP+JHOXcSY9L812mpUMJAzJTGWatlqH5oECSoVVCn+Y2WiekB
 U9YS4UgTt3j2vaakNtVqecMVU+ovWgOdHFAmh6ZJysieJsjz6OFzbqylhm8G73Ch9U
 7WgdrSOXLJ5sFzuoIPH3g49FYo64cfte9vaN5mAA=
Subject: Re: [PATCH] drm: rcar-du: Improve kernel log messages when
 initializing encoders
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20210822003948.11684-1-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <d868ea31-86cf-80bc-e15a-2de4a9fce260@ideasonboard.com>
Date: Wed, 1 Sep 2021 17:23:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822003948.11684-1-laurent.pinchart+renesas@ideasonboard.com>
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2021 01:39, Laurent Pinchart wrote:
> Improve the debugging and error messages printing when initializing
> encoders by replacing the output number by the output name, printing the
> bridge OF node name, and the error code of failed operations.
> 
> While at it, move the related rcar_du_output enumeration from
> rcar_du_crtc.h to rcar_du_drv.h as it's not specific to the CRTC.
> 

It would be nice if you applied "drm: rcar-du: Sort the DU outputs" [0]
before this patch.

[0]
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210622232024.3215248-2-kieran.bingham@ideasonboard.com/

But I can always rebase that later otherwise.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h    | 11 -----------
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c     | 18 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     | 13 +++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 12 +++++++-----
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  4 ++--
>  5 files changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 5f2940c42225..66e8839db708 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -93,17 +93,6 @@ struct rcar_du_crtc_state {
>  
>  #define to_rcar_crtc_state(s) container_of(s, struct rcar_du_crtc_state, state)
>  
> -enum rcar_du_output {
> -	RCAR_DU_OUTPUT_DPAD0,
> -	RCAR_DU_OUTPUT_DPAD1,
> -	RCAR_DU_OUTPUT_LVDS0,
> -	RCAR_DU_OUTPUT_LVDS1,
> -	RCAR_DU_OUTPUT_HDMI0,
> -	RCAR_DU_OUTPUT_HDMI1,
> -	RCAR_DU_OUTPUT_TCON,
> -	RCAR_DU_OUTPUT_MAX,
> -};
> -
>  int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  			unsigned int hwindex);
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 4ac26d08ebb4..d4dc101dc1d7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -502,6 +502,24 @@ static const struct of_device_id rcar_du_of_table[] = {
>  
>  MODULE_DEVICE_TABLE(of, rcar_du_of_table);
>  
> +const char *rcar_du_output_name(enum rcar_du_output output)
> +{
> +	static const char * const names[] = {
> +		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
> +		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
> +		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
> +		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
> +		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
> +		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
> +		[RCAR_DU_OUTPUT_TCON] = "TCON",
> +	};
> +
> +	if (output >= ARRAY_SIZE(names) || !names[output])
> +		return "UNKNOWN";
> +
> +	return names[output];
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * DRM operations
>   */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 02ca2d0e1b55..859fd5992601 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -33,6 +33,17 @@ struct rcar_du_device;
>  
>  #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
>  
> +enum rcar_du_output {
> +	RCAR_DU_OUTPUT_DPAD0,
> +	RCAR_DU_OUTPUT_DPAD1,
> +	RCAR_DU_OUTPUT_LVDS0,
> +	RCAR_DU_OUTPUT_LVDS1,
> +	RCAR_DU_OUTPUT_HDMI0,
> +	RCAR_DU_OUTPUT_HDMI1,
> +	RCAR_DU_OUTPUT_TCON,
> +	RCAR_DU_OUTPUT_MAX,
> +};
> +
>  /*
>   * struct rcar_du_output_routing - Output routing specification
>   * @possible_crtcs: bitmask of possible CRTCs for the output
> @@ -126,4 +137,6 @@ static inline void rcar_du_write(struct rcar_du_device *rcdu, u32 reg, u32 data)
>  	iowrite32(data, rcdu->mmio + reg);
>  }
>  
> +const char *rcar_du_output_name(enum rcar_du_output output);
> +
>  #endif /* __RCAR_DU_DRV_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 4bf4e25d7f01..3977aaa1ab5a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -103,8 +103,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			return -ENOLINK;
>  	}
>  
> -	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
> -		enc_node, output);
> +	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
> +		enc_node, rcar_du_output_name(output));
>  
>  	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
>  				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
> @@ -118,8 +118,9 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	ret = drm_bridge_attach(&renc->base, bridge, NULL,
>  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret) {
> -		dev_err(rcdu->dev, "failed to attach bridge for output %u\n",
> -			output);
> +		dev_err(rcdu->dev,
> +			"failed to attach bridge %pOF for output %s (%d)\n",
> +			bridge->of_node, rcar_du_output_name(output), ret);
>  		return ret;
>  	}
>  
> @@ -127,7 +128,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
>  	if (IS_ERR(connector)) {
>  		dev_err(rcdu->dev,
> -			"failed to created connector for output %u\n", output);
> +			"failed to created connector for output %s (%ld)\n",
> +			rcar_du_output_name(output), PTR_ERR(connector));
>  		return PTR_ERR(connector);
>  	}
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index fdb8a0d127ad..ca29e4a62816 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -513,8 +513,8 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
>  	ret = rcar_du_encoder_init(rcdu, output, entity);
>  	if (ret && ret != -EPROBE_DEFER && ret != -ENOLINK)
>  		dev_warn(rcdu->dev,
> -			 "failed to initialize encoder %pOF on output %u (%d), skipping\n",
> -			 entity, output, ret);
> +			 "failed to initialize encoder %pOF on output %s (%d), skipping\n",
> +			 entity, rcar_du_output_name(output), ret);
>  
>  	of_node_put(entity);
>  
> 

