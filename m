Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ECB907B4D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 20:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D51810EB5A;
	Thu, 13 Jun 2024 18:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E2B10EB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 18:29:56 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 665AD3EC07;
 Thu, 13 Jun 2024 20:29:54 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:29:53 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 8/8] drm/msm/dpu: rename dpu_hw_setup_vsync_source
 functions
Message-ID: <3dnyvit6734itykxxgvmu5z3jn4niywnttym4tcwiwbuf7vikd@dps2an3ksigb>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-8-67a0116b5366@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-8-67a0116b5366@linaro.org>
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

On 2024-06-13 20:05:11, Dmitry Baryshkov wrote:
> Rename dpu_hw_setup_vsync_source functions to make the names match the
> implementation: on DPU 5.x the TOP only contains timer setup, while 3.x
> and 4.x used MDP_VSYNC_SEL register to select TE source.

Yeah that was never really clear anymore after I split this function in two in
commit a2ff096803b3 ("drm/msm/dpu: Disable MDP vsync source selection on DPU
5.0.0 and above").

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 05e48cf4ec1d..6e2ac50b94a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -107,8 +107,8 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
>  	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
>  }
>  
> -static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
> -		struct dpu_vsync_source_cfg *cfg)
> +static void dpu_hw_setup_wd_timer(struct dpu_hw_mdp *mdp,
> +				  struct dpu_vsync_source_cfg *cfg)
>  {
>  	struct dpu_hw_blk_reg_map *c;
>  	u32 reg, wd_load_value, wd_ctl, wd_ctl2;
> @@ -163,8 +163,8 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>  	}
>  }
>  
> -static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
> -		struct dpu_vsync_source_cfg *cfg)
> +static void dpu_hw_setup_vsync_sel(struct dpu_hw_mdp *mdp,

Maybe keep setup_wd_timer_and_vsync_sel()?  OTOH it doesn't always set wd_timer,
only when vsync_source calls for it.

> +				   struct dpu_vsync_source_cfg *cfg)
>  {
>  	struct dpu_hw_blk_reg_map *c;
>  	u32 reg, i;
> @@ -187,7 +187,7 @@ static void dpu_hw_setup_vsync_source_and_vsync_sel(struct dpu_hw_mdp *mdp,
>  	}
>  	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
>  
> -	dpu_hw_setup_vsync_source(mdp, cfg);
> +	dpu_hw_setup_wd_timer(mdp, cfg);
>  }
>  
>  static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
> @@ -239,9 +239,9 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>  	ops->get_danger_status = dpu_hw_get_danger_status;
>  
>  	if (cap & BIT(DPU_MDP_VSYNC_SEL))
> -		ops->setup_vsync_source = dpu_hw_setup_vsync_source_and_vsync_sel;
> +		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
>  	else
> -		ops->setup_vsync_source = dpu_hw_setup_vsync_source;
> +		ops->setup_vsync_source = dpu_hw_setup_wd_timer;

Should the callback also be renamed - and the docs improved?  Seems the
vsync_sel register is used to selsect a vsync_source (plus some other bits like
the pingpong block).

- Marijn

>  
>  	ops->get_safe_status = dpu_hw_get_safe_status;
>  
> 
> -- 
> 2.39.2
> 
