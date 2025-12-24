Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4DCDBEDB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 11:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482CE10EA66;
	Wed, 24 Dec 2025 10:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FADF10E93C;
 Wed, 24 Dec 2025 10:10:38 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6DE8420833;
 Wed, 24 Dec 2025 11:10:36 +0100 (CET)
Date: Wed, 24 Dec 2025 11:10:35 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <aUu5vZdr9RJ-VML8@SoMainline.org>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
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

On 2025-11-21 14:02:08, Teguh Sobirin wrote:
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued

typo: executed.

> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
> Changes in v2:
> - Corrected commit message suggested by Dmitry Baryshkov.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index d1cfe81a3373..f468d054f5bd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -774,24 +774,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		return;
>  	}
>  
> +	/* Set vsync source irrespective of mdp top support */

Unnecessary comment, it's clear from the code flow that vsync_cfg.vsync_source
is passed down into both functions.

Perhaps we should pass disp_info->vsync_source directly into
hw_intf->ops.vsync_sel() and only initialize vsync_cfg when hw_mdptop has the
function, to make this clear.

> +	vsync_cfg.vsync_source = disp_info->vsync_source;
> +
>  	if (hw_mdptop->ops.setup_vsync_source) {
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
>  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> +	}
>  
> -		vsync_cfg.pp_count = dpu_enc->num_phys_encs;

This change is not mentioned in the commit description.  While true that
pp_count is only used by dpu_hw_setup_vsync_sel(), that is still a valid
function to be called on DPU < 5; it denotes the amount of ppnumber[i] array
entries are used above.

> -		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);

Same, also not mentioned in the commit description.  frame_rate
is used by dpu_hw_setup_wd_timer() on DPU < 8.

> -
> -		vsync_cfg.vsync_source = disp_info->vsync_source;
> -
> -		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);

But all of the above comments don't matter if the call to setup_vsync_source()
is removed entirely - it didn't move anywhere else.  This is not described in
the commit message.

- Marijn

> -
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
> +					vsync_cfg.vsync_source);
>  	}
>  }
>  
> -- 
> 2.34.1
> 
