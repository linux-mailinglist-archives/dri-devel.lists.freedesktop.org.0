Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38398C5788
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 16:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234E110E87C;
	Tue, 14 May 2024 14:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o8f89z30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F23910E9A0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 14:03:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-420180b5922so19381385e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 07:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715695428; x=1716300228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z2kvf/8BGvjJmuh1+YH/4YUBTpKBZ8hMquOjQfgXzQo=;
 b=o8f89z30AjwInae007/Rqw9MTLgEc9kQVhcVlfW3yGCQKYQ/wEdWN7ZchIOcBHAxWD
 cS5d46m9KVqUDfUU+rscAWiKNv782NgDXvCUc1g/R+ez+yKOGqmWJIVqZA50eSGfbRc8
 3UV5Rrdw7XkgHwBjnHl6BJO0sO+WjG+75xGzpfouWoTmH02hVblfvzuTDdVuKMks+U/l
 BGzqzVUo7f1AWlwZQzgHySMD0YBhG/dU9IYDqkWfzt/VVaFhRyZILqahC2uOqNxhAU0l
 gwMLCNwbEH/RNxNJphi6KL393v2z/iFGFQ8g9QJ/YeY+LSEORJLlcJC9suHeAo1HJ71G
 Ma3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715695428; x=1716300228;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z2kvf/8BGvjJmuh1+YH/4YUBTpKBZ8hMquOjQfgXzQo=;
 b=qaxqyZ33d8JuIegjAryNYvF0Jk7VdYOQMLr9i3wv26opxAjMDp27OrPacLDmiFYLEp
 /NvQywk6lbS1RflN4EVa0mqbJu8HdQDf4CDuggTOxpViGCSVzuKhSm/1dzA6XPyi9hES
 0QwISFmTQQ1+Q/WpyaGk2EBzZhAkFMRnOrXPvNPmKbgcUSV8WfQh7NKEO0zoQVlTaEps
 AlTVsnjaGrKQePoBTT0l1pYFdWThNRLZ2KH3TqNYoFxGNXk4uBHsHdueZg/a/JXvn/uy
 naoSkImNZT09r8nBLvO7MmW/Fal1Za+Zt2CHCiD+hLW87CfDA55f8KHgn49I0PgZWkKh
 YosA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+PnFeKipPP9+3Ro1Q8YR+fFeXSDhJDinatFBo60iK/5zg1BvNDHXcRDVVrtm3kw7Xs5JgG80xSpwHL2JNyulu2OqIcu1uM+zySswzF2AQ
X-Gm-Message-State: AOJu0Yy6ZPoKOVaxWBpO+G75RRsXgWL3h/Fom5WfUt1/rPZ7Ra3+i1Q9
 ztqWIatXh2PakzOLr7e4wfnLgTlcJrMASEN0TyKCaW+LYD2H6PbJWwLcFVoZO00=
X-Google-Smtp-Source: AGHT+IHScfJwD86P9/E/AOGO8wJ5B18rlGDvDl9Npb7wh2ZHBGXrTaALdLsdYbwsrVsnC05oQT+nwg==
X-Received: by 2002:a05:600c:19c8:b0:417:e60b:91f6 with SMTP id
 5b1f17b1804b1-41fea9324d9mr142866265e9.4.1715695428309; 
 Tue, 14 May 2024 07:03:48 -0700 (PDT)
Received: from [10.91.1.187] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce25d5sm196220405e9.14.2024.05.14.07.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 07:03:47 -0700 (PDT)
Message-ID: <6b2edf62-f14c-4a7c-bdc2-6ed4470fccc2@linaro.org>
Date: Tue, 14 May 2024 16:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/msm/dpu: drop
 dpu_encoder_phys_ops.atomic_mode_set"
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240514-dpu-revert-ams-v1-1-b13623d6cd5f@linaro.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240514-dpu-revert-ams-v1-1-b13623d6cd5f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/05/2024 09:56, Dmitry Baryshkov wrote:
> In the DPU driver blank IRQ handling is called from a vblank worker and
> can happen outside of the irq_enable / irq_disable pair. Revert commit
> d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
> to fix vblank IRQ assignment for CMD DSI panels.
> 
> Fixes: d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

This fixes the regular DRM irq errors for me!

Tested-by: Caleb Connolly <caleb.connolly@linaro.org> # sm8250 OnePlus 8
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  5 ++++
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 32 ++++++++++++----------
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 13 +++++++--
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 11 +++++++-
>   5 files changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..a7d8ecf3f5be 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1200,6 +1200,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>   
>   		phys->cached_mode = crtc_state->adjusted_mode;
> +		if (phys->ops.atomic_mode_set)
> +			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 002e89cc1705..30470cd15a48 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -69,6 +69,8 @@ struct dpu_encoder_phys;
>    * @is_master:			Whether this phys_enc is the current master
>    *				encoder. Can be switched at enable time. Based
>    *				on split_role and current mode (CMD/VID).
> + * @atomic_mode_set:		DRM Call. Set a DRM mode.
> + *				This likely caches the mode, for use at enable.
>    * @enable:			DRM Call. Enable a DRM mode.
>    * @disable:			DRM Call. Disable mode.
>    * @control_vblank_irq		Register/Deregister for VBLANK IRQ
> @@ -93,6 +95,9 @@ struct dpu_encoder_phys;
>   struct dpu_encoder_phys_ops {
>   	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>   	bool (*is_master)(struct dpu_encoder_phys *encoder);
> +	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
> +			struct drm_crtc_state *crtc_state,
> +			struct drm_connector_state *conn_state);
>   	void (*enable)(struct dpu_encoder_phys *encoder);
>   	void (*disable)(struct dpu_encoder_phys *encoder);
>   	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 489be1c0c704..95cd39b49668 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -142,6 +142,23 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
>   	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
>   }
>   
> +static void dpu_encoder_phys_cmd_atomic_mode_set(
> +		struct dpu_encoder_phys *phys_enc,
> +		struct drm_crtc_state *crtc_state,
> +		struct drm_connector_state *conn_state)
> +{
> +	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
> +
> +	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
> +
> +	if (phys_enc->has_intf_te)
> +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
> +	else
> +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> +
> +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> +}
> +
>   static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -280,14 +297,6 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
>   					  phys_enc->hw_pp->idx - PINGPONG_0,
>   					  phys_enc->vblank_refcount);
>   
> -	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
> -	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
> -
> -	if (phys_enc->has_intf_te)
> -		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
> -	else
> -		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> -
>   	dpu_core_irq_register_callback(phys_enc->dpu_kms,
>   				       phys_enc->irq[INTR_IDX_PINGPONG],
>   				       dpu_encoder_phys_cmd_pp_tx_done_irq,
> @@ -318,10 +327,6 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
>   	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
>   	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
>   	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
> -
> -	phys_enc->irq[INTR_IDX_CTL_START] = 0;
> -	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
> -	phys_enc->irq[INTR_IDX_RDPTR] = 0;
>   }
>   
>   static void dpu_encoder_phys_cmd_tearcheck_config(
> @@ -698,6 +703,7 @@ static void dpu_encoder_phys_cmd_init_ops(
>   		struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_cmd_is_master;
> +	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_cmd_enable;
>   	ops->disable = dpu_encoder_phys_cmd_disable;
>   	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
> @@ -736,8 +742,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
>   
>   	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
>   	phys_enc->intf_mode = INTF_MODE_CMD;
> -	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> -
>   	cmd_enc->stream_sel = 0;
>   
>   	if (!phys_enc->hw_intf) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ef69c2f408c3..636a97432d51 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -356,6 +356,16 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
>   	return phys_enc->split_role != ENC_ROLE_SOLO;
>   }
>   
> +static void dpu_encoder_phys_vid_atomic_mode_set(
> +		struct dpu_encoder_phys *phys_enc,
> +		struct drm_crtc_state *crtc_state,
> +		struct drm_connector_state *conn_state)
> +{
> +	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
> +
> +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> +}
> +
>   static int dpu_encoder_phys_vid_control_vblank_irq(
>   		struct dpu_encoder_phys *phys_enc,
>   		bool enable)
> @@ -699,6 +709,7 @@ static int dpu_encoder_phys_vid_get_frame_count(
>   static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_vid_is_master;
> +	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_vid_enable;
>   	ops->disable = dpu_encoder_phys_vid_disable;
>   	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
> @@ -737,8 +748,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
>   
>   	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
>   	phys_enc->intf_mode = INTF_MODE_VIDEO;
> -	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
> -	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
>   
>   	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index d3ea91c1d7d2..356dca5e5ea9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -404,6 +404,15 @@ static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
>   		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
>   }
>   
> +static void dpu_encoder_phys_wb_atomic_mode_set(
> +		struct dpu_encoder_phys *phys_enc,
> +		struct drm_crtc_state *crtc_state,
> +		struct drm_connector_state *conn_state)
> +{
> +
> +	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
> +}
> +
>   static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -640,6 +649,7 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
>   static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_wb_is_master;
> +	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_wb_enable;
>   	ops->disable = dpu_encoder_phys_wb_disable;
>   	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
> @@ -685,7 +695,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
>   
>   	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
>   	phys_enc->intf_mode = INTF_MODE_WB_LINE;
> -	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
>   
>   	atomic_set(&wb_enc->wbirq_refcount, 0);
>   
> 
> ---
> base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> change-id: 20240514-dpu-revert-ams-9410abc1ee48
> 
> Best regards,

-- 
// Caleb (they/them)
