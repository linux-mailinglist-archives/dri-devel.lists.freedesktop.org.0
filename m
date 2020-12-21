Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152332DFC78
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 14:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B276E169;
	Mon, 21 Dec 2020 13:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7573D6E169
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 13:55:43 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC8032CF;
 Mon, 21 Dec 2020 14:55:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608558940;
 bh=x3/08Q4EZv0KsU9wuCS4kJsBCmimqjCXssOs5SbcFjI=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CEVQsOlZdpyFmtzzFfijqqdrddupvA7R8Zg8h49JYerteRD91xMgkieAWp1jdK8O4
 94kP/BdZODSTPa6VB/+g4osCw8HA23p7eYPj1humyBZAn3++xihGllx5vi02UjJEMG
 4aEzlLT1L/mU+OqV5i5MgcUOcGhwfhnnZtr2Hums=
Subject: Re: [PATCH 1/4] drm: rcar-du: cmm: Refactor LUT configuration
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201221015730.28333-2-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <87e1a351-6312-4881-58d4-c6da9e1e609f@ideasonboard.com>
Date: Mon, 21 Dec 2020 13:55:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201221015730.28333-2-laurent.pinchart+renesas@ideasonboard.com>
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

On 21/12/2020 01:57, Laurent Pinchart wrote:
> To prepare for CLU support, expend the CMM API exposed to the DU driver

s/expend/extend/ ...?

> to separate the LUT table pointer from the LUT update decision. This
> will be required, as we will need to update the LUT and CLU
> independently.
> 

Aha, I see this has changed a little since I originally looked at this,
but that's probably a good thing.


> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_cmm.c     | 60 ++++++++++++--------------
>  drivers/gpu/drm/rcar-du/rcar_cmm.h     | 19 +++++---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 22 +++++++---
>  3 files changed, 55 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> index 382d53f8a22e..ccc8c8b03bac 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> @@ -42,23 +42,33 @@ static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 data)
>  	iowrite32(data, rcmm->base + reg);
>  }
>  
> -/*
> - * rcar_cmm_lut_write() - Scale the DRM LUT table entries to hardware precision
> - *			  and write to the CMM registers
> - * @rcmm: Pointer to the CMM device
> - * @drm_lut: Pointer to the DRM LUT table
> - */
> -static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
> -			       const struct drm_color_lut *drm_lut)
> +static void rcar_cmm_lut_configure(struct rcar_cmm *rcmm,
> +				   const struct drm_color_lut *table)
>  {
> -	unsigned int i;
> +	bool enable = !!table;
>  

Ahh good, handling both enable and disable in here makes more sense. I
like it.


> -	for (i = 0; i < CM2_LUT_SIZE; ++i) {
> -		u32 entry = drm_color_lut_extract(drm_lut[i].red, 8) << 16
> -			  | drm_color_lut_extract(drm_lut[i].green, 8) << 8
> -			  | drm_color_lut_extract(drm_lut[i].blue, 8);
> +	if (rcmm->lut.enabled != enable) {
> +		rcar_cmm_write(rcmm, CM2_LUT_CTRL,
> +			       enable ? CM2_LUT_CTRL_LUT_EN : 0);
> +		rcmm->lut.enabled = enable;
> +	}
>  
> -		rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
> +	if (table) {
> +		unsigned int i;
> +
> +		/*
> +		 * Scale the DRM LUT table entries to the hardware precision
> +		 * and program it.
> +		 */
> +		for (i = 0; i < CM2_LUT_SIZE; ++i) {
> +			const struct drm_color_lut *lut = &table[i];
> +
> +			u32 entry = drm_color_lut_extract(lut->red, 8) << 16
> +				  | drm_color_lut_extract(lut->green, 8) << 8
> +				  | drm_color_lut_extract(lut->blue, 8);
> +
> +			rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
> +		}
>  	}
>  }
>  
> @@ -83,23 +93,8 @@ int rcar_cmm_setup(struct platform_device *pdev,
>  {
>  	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
>  
> -	/* Disable LUT if no table is provided. */
> -	if (!config->lut.table) {
> -		if (rcmm->lut.enabled) {
> -			rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> -			rcmm->lut.enabled = false;
> -		}
> -
> -		return 0;
> -	}
> -
> -	/* Enable LUT and program the new gamma table values. */
> -	if (!rcmm->lut.enabled) {
> -		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
> -		rcmm->lut.enabled = true;
> -	}
> -
> -	rcar_cmm_lut_write(rcmm, config->lut.table);
> +	if (config->lut.update)
> +		rcar_cmm_lut_configure(rcmm, config->lut.table);

Does something need to reset config->lut.update to false?
Or is this structure reset / cleaned on each call?

Never mind, looks like this is always used from a fresh initialised
structure in rcar_du_cmm_setup().


>  
>  	return 0;
>  }
> @@ -144,8 +139,7 @@ void rcar_cmm_disable(struct platform_device *pdev)
>  {
>  	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
>  
> -	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> -	rcmm->lut.enabled = false;
> +	rcar_cmm_lut_configure(rcmm, NULL);
>  
>  	pm_runtime_put(&pdev->dev);
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> index b5f7ec6db04a..f4b16535ec16 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_cmm.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> @@ -13,16 +13,23 @@
>  struct drm_color_lut;
>  struct platform_device;
>  
> +/**
> + * struct rcar_cmm_table_config - CMM LUT configuration
> + * @update: When true, update the LUT configuration.
> + * @table: Table data. The LUT is enabled if non-NULL, and disabled
> + *	otherwise. The value is ignored if @update is false.
> + */
> +struct rcar_cmm_table_config {
> +	bool update;
> +	struct drm_color_lut *table;
> +};
> +
>  /**
>   * struct rcar_cmm_config - CMM configuration
> - *
> - * @lut:	1D-LUT configuration
> - * @lut.table:	1D-LUT table entries. Disable LUT operations when NULL
> + * @lut: 1D-LUT configuration
>   */
>  struct rcar_cmm_config {
> -	struct {
> -		struct drm_color_lut *table;
> -	} lut;
> +	struct rcar_cmm_table_config lut;
>  };
>  
>  #if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 9a099c0fe1d4..426b1870b3cb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -500,17 +500,23 @@ static int rcar_du_cmm_check(struct drm_crtc *crtc,
>  	return 0;
>  }
>  
> -static void rcar_du_cmm_setup(struct drm_crtc *crtc)
> +static void rcar_du_cmm_setup(struct rcar_du_crtc *rcrtc,
> +			      const struct drm_crtc_state *old_state,
> +			      const struct drm_crtc_state *new_state)
>  {
> -	struct drm_property_blob *drm_lut = crtc->state->gamma_lut;
> -	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
>  	struct rcar_cmm_config cmm_config = {};
>  
>  	if (!rcrtc->cmm)
>  		return;
>  
> -	if (drm_lut)
> -		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
> +	if (!old_state ||
> +	    !old_state->gamma_lut != !new_state->gamma_lut ||
> +	    (old_state->gamma_lut && new_state->gamma_lut &&
> +	     old_state->gamma_lut->base.id != new_state->gamma_lut->base.id)) {


The conditional looks a bit terse, but it looks like it does the expected.

Everything else looks good to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +		cmm_config.lut.update = true;
> +		cmm_config.lut.table = new_state->gamma_lut
> +				     ? new_state->gamma_lut->data : NULL;
> +	}
>  
>  	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
>  }
> @@ -744,7 +750,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  	 * after the DU channel has been activated. Investigate the impact
>  	 * of this restriction on the first displayed frame.
>  	 */
> -	rcar_du_cmm_setup(crtc);
> +	rcar_du_cmm_setup(rcrtc, NULL, crtc->state);
>  }
>  
>  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -781,6 +787,8 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>  static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
>  				      struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
> +									 crtc);
>  	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
>  
>  	WARN_ON(!crtc->state->enable);
> @@ -801,7 +809,7 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
>  
>  	/* If the active state changed, we let .atomic_enable handle CMM. */
>  	if (crtc->state->color_mgmt_changed && !crtc->state->active_changed)
> -		rcar_du_cmm_setup(crtc);
> +		rcar_du_cmm_setup(rcrtc, old_state, crtc->state);
>  
>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		rcar_du_vsp_atomic_begin(rcrtc);
> 

-- 
Regards
--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
