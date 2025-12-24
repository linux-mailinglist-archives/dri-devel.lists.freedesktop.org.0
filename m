Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9CDCDCEDE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 18:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472DB10F042;
	Wed, 24 Dec 2025 17:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBEC89369;
 Wed, 24 Dec 2025 17:27:02 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9F19F3F43C;
 Wed, 24 Dec 2025 18:27:00 +0100 (CET)
Date: Wed, 24 Dec 2025 18:26:59 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Teguh Sobirin <teguh@sobir.in>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
Message-ID: <aUwhqUlM3WBqQwZb@SoMainline.org>
References: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
 <20251224-intf-fix-wd-v4-1-07a0926fafd2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224-intf-fix-wd-v4-1-07a0926fafd2@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-12-24 17:33:49, Dmitry Baryshkov wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued

exectued -> executed typo remains since v2.

> if MDP TOP implements the setup_vsync_source() callback. However on
Double space to match the above, on two occasions:        ^^

> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
              ^^ double space too

> driver to setup TE vsync selection on all new DPU devices.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
> [DB: restored top->ops.setup_vsync_source call]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index d1cfe81a3373..0482b2bb5a9e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -774,6 +774,9 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		return;
>  	}
>  
> +	/* Set vsync source irrespective of mdp top support */

I still think this comment is redundant, as mentioned in v2.

Regardless:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> +	vsync_cfg.vsync_source = disp_info->vsync_source;
> +
>  	if (hw_mdptop->ops.setup_vsync_source) {
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
>  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> @@ -781,17 +784,15 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
>  		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
>  
> -		vsync_cfg.vsync_source = disp_info->vsync_source;
> -
>  		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> +	}
>  
> -		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -			phys_enc = dpu_enc->phys_encs[i];
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		phys_enc = dpu_enc->phys_encs[i];
>  
> -			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> -				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> -						vsync_cfg.vsync_source);
> -		}
> +		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> +			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> +							 vsync_cfg.vsync_source);
>  	}
>  }
>  
> 
> -- 
> 2.47.3
> 
