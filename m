Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CDC4B3242
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 02:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E7310EB37;
	Sat, 12 Feb 2022 01:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C6C10EB30;
 Sat, 12 Feb 2022 01:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644627723; x=1676163723;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jp9ZWoVEl1jqnTSdruy4u86kYYvV60RfWhbQkYN2Q/U=;
 b=L784VJGadHgDIYLb2/X9WQI1eERfVJn7yJ/0M8qaO+pT1etCmafHtMNl
 kkHsmYN6pzimhPxm3zFiHrlnuKZTx4X5Dmma1RYyC/oKK1WIZw3q1quv1
 Eu251Q8O5pejCPw3gpJnO/S2syj+cGiJ1ckOQ76REbCA5cupxs08D/AnW o=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Feb 2022 17:02:02 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 17:02:02 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 17:02:01 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 17:01:59 -0800
Message-ID: <f7d4e3f5-2b2a-e71c-23bb-a04ab6bccd53@quicinc.com>
Date: Fri, 11 Feb 2022 17:01:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 7/7] drm/msm/dpu: pull connector from dpu_encoder_phys to
 dpu_encoder_virt
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
 <20220203082611.2654810-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220203082611.2654810-8-dmitry.baryshkov@linaro.org>
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
> All physical encoders used by virtual encoder share the same connector,
> so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
> structure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 11 ++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 --
>   2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1462c426c14c..afafdaf48aea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -143,6 +143,7 @@ enum dpu_enc_rc_states {
>    *			link between encoder/crtc. However in this case we need
>    *			to track crtc in the disable() hook which is called
>    *			_after_ encoder_mask is cleared.
> + * @connector:		If a mode is set, cached pointer to the active connector
>    * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
>    *				all CTL paths
>    * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
> @@ -183,6 +184,7 @@ struct dpu_encoder_virt {
>   	bool intfs_swapped;
>   
>   	struct drm_crtc *crtc;
> +	struct drm_connector *connector;
>   
>   	struct dentry *debugfs_root;
>   	struct mutex enc_lock;
> @@ -993,6 +995,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   
>   	cstate->num_mixers = num_lm;
>   
> +	dpu_enc->connector = conn_state->connector;
> +
>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>   		int num_blk;
>   		struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
> @@ -1030,7 +1034,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   			return;
>   		}
>   
> -		phys->connector = conn_state->connector;
>   		phys->cached_mode = crtc_state->adjusted_mode;
>   		if (phys->ops.atomic_mode_set)
>   			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
> @@ -1064,7 +1067,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>   
>   	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
>   			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
> -		unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
> +		unsigned bpc = dpu_enc->connector->display_info.bpc;
>   		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>   			if (!dpu_enc->hw_pp[i])
>   				continue;
> @@ -1168,9 +1171,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   
>   	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_STOP);
>   
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -		dpu_enc->phys_encs[i]->connector = NULL;
> -	}
> +	dpu_enc->connector = NULL;
>   
>   	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 6e80321b13c5..5093810f6663 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -174,7 +174,6 @@ struct dpu_encoder_irq {
>    *	tied to a specific panel / sub-panel. Abstract type, sub-classed by
>    *	phys_vid or phys_cmd for video mode or command mode encs respectively.
>    * @parent:		Pointer to the containing virtual encoder
> - * @connector:		If a mode is set, cached pointer to the active connector
>    * @ops:		Operations exposed to the virtual encoder
>    * @parent_ops:		Callbacks exposed by the parent to the phys_enc
>    * @hw_mdptop:		Hardware interface to the top registers
> @@ -203,7 +202,6 @@ struct dpu_encoder_irq {
>    */
>   struct dpu_encoder_phys {
>   	struct drm_encoder *parent;
> -	struct drm_connector *connector;
>   	struct dpu_encoder_phys_ops ops;
>   	const struct dpu_encoder_virt_ops *parent_ops;
>   	struct dpu_hw_mdp *hw_mdptop;
