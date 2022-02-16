Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED14B7CF3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4210E5EC;
	Wed, 16 Feb 2022 01:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C4B10E5EA;
 Wed, 16 Feb 2022 01:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644976610; x=1676512610;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7VxU+Q23s3dN0FooY5Q8WSjEwE6ze2T3Tl5BmxVWXhs=;
 b=kzmL8YMSZAjFjccbNpoL9qfuCYIWo85bHMjwalFrEcOuU/eONZ01JZmj
 v6S1Kba3/yCJYNpOC+PQZPb2b5yhnl2ddw1RZJgtNztjEFMr8LZUSyuRe
 3u+GYt+OmSzIRZS5uaTHbLgdQFpfZqYT8JXBr89c8rqKjmrpvGPQgHLZf c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Feb 2022 17:56:50 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 17:56:50 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 17:56:49 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 17:56:47 -0800
Message-ID: <76fdef51-73d8-7851-63c9-72c4a892bb0e@quicinc.com>
Date: Tue, 15 Feb 2022 17:56:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 5/6] drm/msm/dpu: remove struct dpu_encoder_irq
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220201151056.2480055-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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



On 2/1/2022 7:10 AM, Dmitry Baryshkov wrote:
> Remove additional indirection: specify IRQ callbacks and IRQ indices
> directly rather than through the pointer in the irq structure. For each
> IRQ we have a constant IRQ callback. This change simplifies code review
> as the reader no longer needs to remember which function is called.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The change itself is fine as it will help to reduce yet another struct
struct dpu_encoder_irq.

One suggestion I can think of is, this also gets rid of the "name" 
member which can be useful for debugging.

Do you think we can add a helper dpu_encoder_irq_idx_to_name(int idx)

Which will just translate this enum to the relevant string and add that 
to the prints which were previously using the "name" member?

156 enum dpu_intr_idx {
157 	INTR_IDX_VSYNC,
158 	INTR_IDX_PINGPONG,
159 	INTR_IDX_UNDERRUN,
160 	INTR_IDX_CTL_START,
161 	INTR_IDX_RDPTR,
162 	INTR_IDX_MAX,
163 };

Let me know if you think this will be useful.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 28 +++----
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 21 +-----
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 73 +++++++------------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 42 ++++-------
>   4 files changed, 58 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index dbcbf96cf8eb..83b6715820fa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -261,9 +261,10 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
>   
>   int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>   		enum dpu_intr_idx intr_idx,
> +		void (*func)(void *arg, int irq_idx),
>   		struct dpu_encoder_wait_info *wait_info)
>   {
> -	struct dpu_encoder_irq *irq;
> +	int irq;
>   	u32 irq_status;
>   	int ret;
>   
> @@ -271,7 +272,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>   		DPU_ERROR("invalid params\n");
>   		return -EINVAL;
>   	}
> -	irq = &phys_enc->irq[intr_idx];
> +	irq = phys_enc->irq[intr_idx];
>   
>   	/* note: do master / slave checking outside */
>   
> @@ -279,53 +280,52 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>   	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
>   		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d\n",
>   			  DRMID(phys_enc->parent), intr_idx,
> -			  irq->irq_idx);
> +			  irq);
>   		return -EWOULDBLOCK;
>   	}
>   
> -	if (irq->irq_idx < 0) {
> -		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s\n",
> -			      DRMID(phys_enc->parent), intr_idx,
> -			      irq->name);
> +	if (irq < 0) {
> +		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d\n",
> +			      DRMID(phys_enc->parent), intr_idx);
>   		return 0;
>   	}
>   
>   	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d\n",
>   		      DRMID(phys_enc->parent), intr_idx,
> -		      irq->irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
> +		      irq, phys_enc->hw_pp->idx - PINGPONG_0,
>   		      atomic_read(wait_info->atomic_cnt));
>   
>   	ret = dpu_encoder_helper_wait_event_timeout(
>   			DRMID(phys_enc->parent),
> -			irq->irq_idx,
> +			irq,
>   			wait_info);
>   
>   	if (ret <= 0) {
> -		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq->irq_idx);
> +		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq);
>   		if (irq_status) {
>   			unsigned long flags;
>   
>   			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
>   				      DRMID(phys_enc->parent), intr_idx,
> -				      irq->irq_idx,
> +				      irq,
>   				      phys_enc->hw_pp->idx - PINGPONG_0,
>   				      atomic_read(wait_info->atomic_cnt));
>   			local_irq_save(flags);
> -			irq->func(phys_enc, irq->irq_idx);
> +			func(phys_enc, irq);
>   			local_irq_restore(flags);
>   			ret = 0;
>   		} else {
>   			ret = -ETIMEDOUT;
>   			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
>   				      DRMID(phys_enc->parent), intr_idx,
> -				      irq->irq_idx,
> +				      irq,
>   				      phys_enc->hw_pp->idx - PINGPONG_0,
>   				      atomic_read(wait_info->atomic_cnt));
>   		}
>   	} else {
>   		ret = 0;
>   		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
> -			intr_idx, irq->irq_idx,
> +			intr_idx, irq,
>   			phys_enc->hw_pp->idx - PINGPONG_0,
>   			atomic_read(wait_info->atomic_cnt));
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index ff2218155b44..803fd6f25da1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -162,21 +162,6 @@ enum dpu_intr_idx {
>   	INTR_IDX_MAX,
>   };
>   
> -/**
> - * dpu_encoder_irq - tracking structure for interrupts
> - * @name:		string name of interrupt
> - * @intr_idx:		Encoder interrupt enumeration
> - * @irq_idx:		IRQ interface lookup index from DPU IRQ framework
> - *			will be -EINVAL if IRQ is not registered
> - * @irq_cb:		interrupt callback
> - */
> -struct dpu_encoder_irq {
> -	const char *name;
> -	enum dpu_intr_idx intr_idx;
> -	int irq_idx;
> -	void (*func)(void *arg, int irq_idx);
> -};
> -
>   /**
>    * struct dpu_encoder_phys - physical encoder that drives a single INTF block
>    *	tied to a specific panel / sub-panel. Abstract type, sub-classed by
> @@ -207,7 +192,7 @@ struct dpu_encoder_irq {
>    * @pending_ctlstart_cnt:	Atomic counter tracking the number of ctl start
>    *                              pending.
>    * @pending_kickoff_wq:		Wait queue for blocking until kickoff completes
> - * @irq:			IRQ tracking structures
> + * @irq:			IRQ indices
>    */
>   struct dpu_encoder_phys {
>   	struct drm_encoder *parent;
> @@ -231,7 +216,7 @@ struct dpu_encoder_phys {
>   	atomic_t pending_ctlstart_cnt;
>   	atomic_t pending_kickoff_cnt;
>   	wait_queue_head_t pending_kickoff_wq;
> -	struct dpu_encoder_irq irq[INTR_IDX_MAX];
> +	int irq[INTR_IDX_MAX];
>   };
>   
>   static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> @@ -357,11 +342,13 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
>    *	note: will call dpu_encoder_helper_wait_for_irq on timeout
>    * @phys_enc: Pointer to physical encoder structure
>    * @intr_idx: encoder interrupt index
> + * @func: IRQ callback to be called in case of timeout
>    * @wait_info: wait info struct
>    * @Return: 0 or -ERROR
>    */
>   int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>   		enum dpu_intr_idx intr_idx,
> +		void (*func)(void *arg, int irq_idx),
>   		struct dpu_encoder_wait_info *wait_info);
>   
>   #endif /* __dpu_encoder_phys_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index ca7d557312ff..9987a129a32c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -151,7 +151,6 @@ static void dpu_encoder_phys_cmd_mode_set(
>   {
>   	struct dpu_encoder_phys_cmd *cmd_enc =
>   		to_dpu_encoder_phys_cmd(phys_enc);
> -	struct dpu_encoder_irq *irq;
>   
>   	if (!mode || !adj_mode) {
>   		DPU_ERROR("invalid args\n");
> @@ -161,17 +160,13 @@ static void dpu_encoder_phys_cmd_mode_set(
>   	DPU_DEBUG_CMDENC(cmd_enc, "caching mode:\n");
>   	drm_mode_debug_printmodeline(adj_mode);
>   
> -	irq = &phys_enc->irq[INTR_IDX_CTL_START];
> -	irq->irq_idx = phys_enc->hw_ctl->caps->intr_start;
> +	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
>   
> -	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
> -	irq->irq_idx = phys_enc->hw_pp->caps->intr_done;
> +	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
>   
> -	irq = &phys_enc->irq[INTR_IDX_RDPTR];
> -	irq->irq_idx = phys_enc->hw_pp->caps->intr_rdptr;
> +	phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
>   
> -	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> -	irq->irq_idx = phys_enc->hw_intf->cap->intr_underrun;
> +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
>   }
>   
>   static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
> @@ -212,7 +207,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
>   			  atomic_read(&phys_enc->pending_kickoff_cnt));
>   		msm_disp_snapshot_state(drm_enc->dev);
>   		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_RDPTR].irq_idx);
> +				phys_enc->irq[INTR_IDX_RDPTR]);
>   	}
>   
>   	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
> @@ -240,6 +235,7 @@ static int _dpu_encoder_phys_cmd_wait_for_idle(
>   	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
>   
>   	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_PINGPONG,
> +			dpu_encoder_phys_cmd_pp_tx_done_irq,
>   			&wait_info);
>   	if (ret == -ETIMEDOUT)
>   		_dpu_encoder_phys_cmd_handle_ppdone_timeout(phys_enc);
> @@ -279,11 +275,12 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
>   
>   	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
>   		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
> -				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
> +				phys_enc->irq[INTR_IDX_RDPTR],
> +				dpu_encoder_phys_cmd_pp_rd_ptr_irq,
> +				phys_enc);
>   	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
>   		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_RDPTR].irq_idx);
> +				phys_enc->irq[INTR_IDX_RDPTR]);
>   
>   end:
>   	if (ret) {
> @@ -305,27 +302,30 @@ static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
>   
>   	if (enable) {
>   		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx,
> -				phys_enc->irq[INTR_IDX_PINGPONG].func, phys_enc);
> +				phys_enc->irq[INTR_IDX_PINGPONG],
> +				dpu_encoder_phys_cmd_pp_tx_done_irq,
> +				phys_enc);
>   		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
> -				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
> +				phys_enc->irq[INTR_IDX_UNDERRUN],
> +				dpu_encoder_phys_cmd_underrun_irq,
> +				phys_enc);
>   		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
>   
>   		if (dpu_encoder_phys_cmd_is_master(phys_enc))
>   			dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -					phys_enc->irq[INTR_IDX_CTL_START].irq_idx,
> -					phys_enc->irq[INTR_IDX_CTL_START].func, phys_enc);
> +					phys_enc->irq[INTR_IDX_CTL_START],
> +					dpu_encoder_phys_cmd_ctl_start_irq,
> +					phys_enc);
>   	} else {
>   		if (dpu_encoder_phys_cmd_is_master(phys_enc))
>   			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -					phys_enc->irq[INTR_IDX_CTL_START].irq_idx);
> +					phys_enc->irq[INTR_IDX_CTL_START]);
>   
>   		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx);
> +				phys_enc->irq[INTR_IDX_UNDERRUN]);
>   		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
>   		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx);
> +				phys_enc->irq[INTR_IDX_PINGPONG]);
>   	}
>   }
>   
> @@ -660,6 +660,7 @@ static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
>   	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
>   
>   	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_CTL_START,
> +			dpu_encoder_phys_cmd_ctl_start_irq,
>   			&wait_info);
>   	if (ret == -ETIMEDOUT) {
>   		DPU_ERROR_CMDENC(cmd_enc, "ctl start interrupt wait failed\n");
> @@ -715,6 +716,7 @@ static int dpu_encoder_phys_cmd_wait_for_vblank(
>   	atomic_inc(&cmd_enc->pending_vblank_cnt);
>   
>   	rc = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_RDPTR,
> +			dpu_encoder_phys_cmd_pp_rd_ptr_irq,
>   			&wait_info);
>   
>   	return rc;
> @@ -766,7 +768,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>   {
>   	struct dpu_encoder_phys *phys_enc = NULL;
>   	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
> -	struct dpu_encoder_irq *irq;
>   	int i, ret = 0;
>   
>   	DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
> @@ -790,30 +791,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>   	phys_enc->enc_spinlock = p->enc_spinlock;
>   	cmd_enc->stream_sel = 0;
>   	phys_enc->enable_state = DPU_ENC_DISABLED;
> -	for (i = 0; i < INTR_IDX_MAX; i++) {
> -		irq = &phys_enc->irq[i];
> -		irq->irq_idx = -EINVAL;
> -	}
> -
> -	irq = &phys_enc->irq[INTR_IDX_CTL_START];
> -	irq->name = "ctl_start";
> -	irq->intr_idx = INTR_IDX_CTL_START;
> -	irq->func = dpu_encoder_phys_cmd_ctl_start_irq;
> -
> -	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
> -	irq->name = "pp_done";
> -	irq->intr_idx = INTR_IDX_PINGPONG;
> -	irq->func = dpu_encoder_phys_cmd_pp_tx_done_irq;
> -
> -	irq = &phys_enc->irq[INTR_IDX_RDPTR];
> -	irq->name = "pp_rd_ptr";
> -	irq->intr_idx = INTR_IDX_RDPTR;
> -	irq->func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
> -
> -	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> -	irq->name = "underrun";
> -	irq->intr_idx = INTR_IDX_UNDERRUN;
> -	irq->func = dpu_encoder_phys_cmd_underrun_irq;
> +	for (i = 0; i < INTR_IDX_MAX; i++)
> +		phys_enc->irq[i] = -EINVAL;
>   
>   	atomic_set(&phys_enc->vblank_refcount, 0);
>   	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 50c063de1509..d80b2f80fec9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -366,19 +366,15 @@ static void dpu_encoder_phys_vid_mode_set(
>   		struct drm_display_mode *mode,
>   		struct drm_display_mode *adj_mode)
>   {
> -	struct dpu_encoder_irq *irq;
> -
>   	if (adj_mode) {
>   		phys_enc->cached_mode = *adj_mode;
>   		drm_mode_debug_printmodeline(adj_mode);
>   		DPU_DEBUG_VIDENC(phys_enc, "caching mode:\n");
>   	}
>   
> -	irq = &phys_enc->irq[INTR_IDX_VSYNC];
> -	irq->irq_idx = phys_enc->hw_intf->cap->intr_vsync;
> +	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
>   
> -	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> -	irq->irq_idx = phys_enc->hw_intf->cap->intr_underrun;
> +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
>   }
>   
>   static int dpu_encoder_phys_vid_control_vblank_irq(
> @@ -405,11 +401,12 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
>   
>   	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
>   		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
> -				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
> +				phys_enc->irq[INTR_IDX_VSYNC],
> +				dpu_encoder_phys_vid_vblank_irq,
> +				phys_enc);
>   	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
>   		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_VSYNC].irq_idx);
> +				phys_enc->irq[INTR_IDX_VSYNC]);
>   
>   end:
>   	if (ret) {
> @@ -490,6 +487,7 @@ static int dpu_encoder_phys_vid_wait_for_vblank(
>   
>   	/* Wait for kickoff to complete */
>   	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_VSYNC,
> +			dpu_encoder_phys_vid_vblank_irq,
>   			&wait_info);
>   
>   	if (ret == -ETIMEDOUT) {
> @@ -542,7 +540,7 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
>   				ctl->idx, rc);
>   		msm_disp_snapshot_state(drm_enc->dev);
>   		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_VSYNC].irq_idx);
> +				phys_enc->irq[INTR_IDX_VSYNC]);
>   	}
>   }
>   
> @@ -632,12 +630,13 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
>   			return;
>   
>   		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
> -				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
> +				phys_enc->irq[INTR_IDX_UNDERRUN],
> +				dpu_encoder_phys_vid_underrun_irq,
> +				phys_enc);
>   	} else {
>   		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
>   		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> -				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx);
> +				phys_enc->irq[INTR_IDX_UNDERRUN]);
>   	}
>   }
>   
> @@ -703,7 +702,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   		struct dpu_enc_phys_init_params *p)
>   {
>   	struct dpu_encoder_phys *phys_enc = NULL;
> -	struct dpu_encoder_irq *irq;
>   	int i;
>   
>   	if (!p) {
> @@ -729,20 +727,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   	phys_enc->split_role = p->split_role;
>   	phys_enc->intf_mode = INTF_MODE_VIDEO;
>   	phys_enc->enc_spinlock = p->enc_spinlock;
> -	for (i = 0; i < INTR_IDX_MAX; i++) {
> -		irq = &phys_enc->irq[i];
> -		irq->irq_idx = -EINVAL;
> -	}
> -
> -	irq = &phys_enc->irq[INTR_IDX_VSYNC];
> -	irq->name = "vsync_irq";
> -	irq->intr_idx = INTR_IDX_VSYNC;
> -	irq->func = dpu_encoder_phys_vid_vblank_irq;
> -
> -	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> -	irq->name = "underrun";
> -	irq->intr_idx = INTR_IDX_UNDERRUN;
> -	irq->func = dpu_encoder_phys_vid_underrun_irq;
> +	for (i = 0; i < INTR_IDX_MAX; i++)
> +		phys_enc->irq[i] = -EINVAL;
>   
>   	atomic_set(&phys_enc->vblank_refcount, 0);
>   	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
