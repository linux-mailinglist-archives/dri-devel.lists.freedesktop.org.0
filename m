Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38054B319B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 00:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E60310EB7A;
	Fri, 11 Feb 2022 23:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1E210EB78;
 Fri, 11 Feb 2022 23:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644623989; x=1676159989;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MyrLELfNgEsfFY2E34m1Wf9VNwa7IaaY1CO9pw8uQ/E=;
 b=i+aHuR4sk30no/pLgHCVZa0GgndBpdSWsbtMW4Hd9Lbch891dudTQBGq
 Do/5TK30ZAKbGv4EF3l52uhD/tZV7mLpDeOgLYAClb+FjLWRIavmj+9Bi
 06+LCS1/SEBZ3+ysM81XmBnAy+qVOUj2UUXsWC2jhu1PAjpdHBz+5cO28 4=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 15:59:48 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:59:47 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 15:59:47 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 15:59:45 -0800
Message-ID: <1ca71848-e0e3-7f8c-a778-6a05b9d343b7@quicinc.com>
Date: Fri, 11 Feb 2022 15:59:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 6/7] drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
 <20220203082611.2654810-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220203082611.2654810-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/2022 12:26 AM, Dmitry Baryshkov wrote:
> Make dpu_encoder use atomic_mode_set to receive connector and CRTC
> states as arguments rather than finding connector and CRTC by manually
> looping through the respective lists.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nice cleanup !!

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 37 +++++--------------
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  8 ++--
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 18 ++-------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 14 ++-----
>   4 files changed, 21 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index e1c43a0c0643..1462c426c14c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -930,16 +930,13 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
>   	return 0;
>   }
>   
> -static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
> -				      struct drm_display_mode *mode,
> -				      struct drm_display_mode *adj_mode)
> +static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> +					     struct drm_crtc_state *crtc_state,
> +					     struct drm_connector_state *conn_state)
>   {
>   	struct dpu_encoder_virt *dpu_enc;
>   	struct msm_drm_private *priv;
>   	struct dpu_kms *dpu_kms;
> -	struct list_head *connector_list;
> -	struct drm_connector *conn = NULL, *conn_iter;
> -	struct drm_crtc *drm_crtc;
>   	struct dpu_crtc_state *cstate;
>   	struct dpu_global_state *global_state;
>   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> @@ -959,7 +956,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   
>   	priv = drm_enc->dev->dev_private;
>   	dpu_kms = to_dpu_kms(priv->kms);
> -	connector_list = &dpu_kms->dev->mode_config.connector_list;
>   
>   	global_state = dpu_kms_get_existing_global_state(dpu_kms);
>   	if (IS_ERR_OR_NULL(global_state)) {
> @@ -969,22 +965,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   
>   	trace_dpu_enc_mode_set(DRMID(drm_enc));
>   
> -	list_for_each_entry(conn_iter, connector_list, head)
> -		if (conn_iter->encoder == drm_enc)
> -			conn = conn_iter;
> -
> -	if (!conn) {
> -		DPU_ERROR_ENC(dpu_enc, "failed to find attached connector\n");
> -		return;
> -	} else if (!conn->state) {
> -		DPU_ERROR_ENC(dpu_enc, "invalid connector state\n");
> -		return;
> -	}
> -
> -	drm_for_each_crtc(drm_crtc, drm_enc->dev)
> -		if (drm_crtc->state->encoder_mask & drm_encoder_mask(drm_enc))
> -			break;
> -
>   	/* Query resource that have been reserved in atomic check step. */
>   	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>   		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
> @@ -1001,7 +981,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>   						: NULL;
>   
> -	cstate = to_dpu_crtc_state(drm_crtc->state);
> +	cstate = to_dpu_crtc_state(crtc_state);
>   
>   	for (i = 0; i < num_lm; i++) {
>   		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> @@ -1050,9 +1030,10 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   			return;
>   		}
>   
> -		phys->connector = conn->state->connector;
> -		if (phys->ops.mode_set)
> -			phys->ops.mode_set(phys, mode, adj_mode);
> +		phys->connector = conn_state->connector;
> +		phys->cached_mode = crtc_state->adjusted_mode;
> +		if (phys->ops.atomic_mode_set)
> +			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>   	}
>   }
>   
> @@ -2057,7 +2038,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   }
>   
>   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> -	.mode_set = dpu_encoder_virt_mode_set,
> +	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
>   	.disable = dpu_encoder_virt_disable,
>   	.enable = dpu_encoder_virt_enable,
>   	.atomic_check = dpu_encoder_virt_atomic_check,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 159deb8ed7fb..6e80321b13c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -84,7 +84,7 @@ struct dpu_encoder_virt_ops {
>    * @is_master:			Whether this phys_enc is the current master
>    *				encoder. Can be switched at enable time. Based
>    *				on split_role and current mode (CMD/VID).
> - * @mode_set:			DRM Call. Set a DRM mode.
> + * @atomic_mode_set:		DRM Call. Set a DRM mode.
>    *				This likely caches the mode, for use at enable.
>    * @enable:			DRM Call. Enable a DRM mode.
>    * @disable:			DRM Call. Disable mode.
> @@ -115,9 +115,9 @@ struct dpu_encoder_phys_ops {
>   			struct dentry *debugfs_root);
>   	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>   	bool (*is_master)(struct dpu_encoder_phys *encoder);
> -	void (*mode_set)(struct dpu_encoder_phys *encoder,
> -			struct drm_display_mode *mode,
> -			struct drm_display_mode *adjusted_mode);
> +	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
> +			struct drm_crtc_state *crtc_state,
> +			struct drm_connector_state *conn_state);
>   	void (*enable)(struct dpu_encoder_phys *encoder);
>   	void (*disable)(struct dpu_encoder_phys *encoder);
>   	void (*destroy)(struct dpu_encoder_phys *encoder);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 45fe97fb612d..6de298d521ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -135,23 +135,13 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
>   			phys_enc);
>   }
>   
> -static void dpu_encoder_phys_cmd_mode_set(
> +static void dpu_encoder_phys_cmd_atomic_mode_set(
>   		struct dpu_encoder_phys *phys_enc,
> -		struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> +		struct drm_crtc_state *crtc_state,
> +		struct drm_connector_state *conn_state)
>   {
> -	struct dpu_encoder_phys_cmd *cmd_enc =
> -		to_dpu_encoder_phys_cmd(phys_enc);
>   	struct dpu_encoder_irq *irq;
>   
> -	if (!mode || !adj_mode) {
> -		DPU_ERROR("invalid args\n");
> -		return;
> -	}
> -	phys_enc->cached_mode = *adj_mode;
> -	DPU_DEBUG_CMDENC(cmd_enc, "caching mode:\n");
> -	drm_mode_debug_printmodeline(adj_mode);
> -
>   	irq = &phys_enc->irq[INTR_IDX_CTL_START];
>   	irq->irq_idx = phys_enc->hw_ctl->caps->intr_start;
>   
> @@ -722,7 +712,7 @@ static void dpu_encoder_phys_cmd_init_ops(
>   {
>   	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
>   	ops->is_master = dpu_encoder_phys_cmd_is_master;
> -	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
> +	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_cmd_enable;
>   	ops->disable = dpu_encoder_phys_cmd_disable;
>   	ops->destroy = dpu_encoder_phys_cmd_destroy;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 1831fe37c88c..0c07db5021eb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -348,19 +348,13 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
>   	return phys_enc->split_role != ENC_ROLE_SOLO;
>   }
>   
> -static void dpu_encoder_phys_vid_mode_set(
> +static void dpu_encoder_phys_vid_atomic_mode_set(
>   		struct dpu_encoder_phys *phys_enc,
> -		struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> +		struct drm_crtc_state *crtc_state,
> +		struct drm_connector_state *conn_state)
>   {
>   	struct dpu_encoder_irq *irq;
>   
> -	if (adj_mode) {
> -		phys_enc->cached_mode = *adj_mode;
> -		drm_mode_debug_printmodeline(adj_mode);
> -		DPU_DEBUG_VIDENC(phys_enc, "caching mode:\n");
> -	}
> -
>   	irq = &phys_enc->irq[INTR_IDX_VSYNC];
>   	irq->irq_idx = phys_enc->hw_intf->cap->intr_vsync;
>   
> @@ -662,7 +656,7 @@ static int dpu_encoder_phys_vid_get_frame_count(
>   static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_vid_is_master;
> -	ops->mode_set = dpu_encoder_phys_vid_mode_set;
> +	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_vid_enable;
>   	ops->disable = dpu_encoder_phys_vid_disable;
>   	ops->destroy = dpu_encoder_phys_vid_destroy;
