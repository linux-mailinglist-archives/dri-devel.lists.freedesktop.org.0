Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EDF38F53B
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 23:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6EC6E14F;
	Mon, 24 May 2021 21:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537166E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:57:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621893439; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Kp1LQvwH8nKHXHBFkweNYPdCQgruA0WvC+Npv0YtZ+4=;
 b=Jg0FF/rqdyTnjxJI56ULMvwT/18BFKRJMsBkOi7LFjzejd4sTCB8X2HhLpRknkr0bdT+fyol
 6EFgy0x6KPm7XyhKE0MKe8xxEDa7i7JLQoVnFpMH1BkaRDTxMxZtbTPvgSibu7FtNJaqry76
 8rfy7Xd0uWIFxzqY6JMGc2Xb9SQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60ac213b8dd30e785fb30168 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 21:57:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 08F7FC43144; Mon, 24 May 2021 21:57:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DA31FC433D3;
 Mon, 24 May 2021 21:57:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 24 May 2021 14:57:08 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 4/6] drm/msm/dpu: replace IRQ lookup with
 the data in hw catalog
In-Reply-To: <20210516202910.2141079-5-dmitry.baryshkov@linaro.org>
References: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
 <20210516202910.2141079-5-dmitry.baryshkov@linaro.org>
Message-ID: <a6a5dceb2123a4ecf425a44020d93041@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-16 13:29, Dmitry Baryshkov wrote:
> The IRQ table in the dpu_hw_interrupts.h is big, ugly, and hard to
> maintain. There are only few interrupts used from that table. Newer
> generations use different IRQ locations. Move this data to hw catalog.
> 
I think you can drop the line that "only few interrupts ..." are used as 
that
was specific to sc7280 as you mentioned on IRC or give the example of 
sc7280
here to explain that as being one of the motivations for this cleanup.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

With that fixed, I think this cleanup looks quite reasonable to me.
I computed a few of the intr offsets and the values were matching the 
prev hard-coded
offsets. Since I dont have the sc7280 HW to test this, I am checking if 
someone with that
hw in our team can test it out as well to make sure that it covers that 
hw as well.

But otherwise,

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  20 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  13 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  64 +++-----
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   2 -
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  36 ++---
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  31 +---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 150 +++++++++++-------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  12 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 137 +++++++---------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  17 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  28 ++--
>  11 files changed, 229 insertions(+), 281 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> index fd11a2aeab6c..11c0abed21ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> @@ -43,16 +43,6 @@ static void dpu_core_irq_callback_handler(void
> *arg, int irq_idx)
>  	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
>  }
> 
> -int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
> -		enum dpu_intr_type intr_type, u32 instance_idx)
> -{
> -	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.irq_idx_lookup)
> -		return -EINVAL;
> -
> -	return dpu_kms->hw_intr->ops.irq_idx_lookup(dpu_kms->hw_intr,
> -			intr_type, instance_idx);
> -}
> -
>  /**
>   * _dpu_core_irq_enable - enable core interrupt given by the index
>   * @dpu_kms:		Pointer to dpu kms context
> @@ -70,7 +60,7 @@ static int _dpu_core_irq_enable(struct dpu_kms
> *dpu_kms, int irq_idx)
>  		return -EINVAL;
>  	}
> 
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
>  		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -133,7 +123,7 @@ static int _dpu_core_irq_disable(struct dpu_kms
> *dpu_kms, int irq_idx)
>  		return -EINVAL;
>  	}
> 
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
>  		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -208,7 +198,7 @@ int dpu_core_irq_register_callback(struct dpu_kms
> *dpu_kms, int irq_idx,
>  		return -EINVAL;
>  	}
> 
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
>  		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -243,7 +233,7 @@ int dpu_core_irq_unregister_callback(struct
> dpu_kms *dpu_kms, int irq_idx,
>  		return -EINVAL;
>  	}
> 
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
>  		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -328,7 +318,7 @@ void dpu_core_irq_preinstall(struct dpu_kms 
> *dpu_kms)
>  	spin_lock_init(&dpu_kms->irq_obj.cb_lock);
> 
>  	/* Create irq callbacks for all possible irq_idx */
> -	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->irq_idx_tbl_size;
> +	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
>  	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
>  			sizeof(struct list_head), GFP_KERNEL);
>  	dpu_kms->irq_obj.enable_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> index e30775e6585b..d147784d5531 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> @@ -29,19 +29,6 @@ void dpu_core_irq_uninstall(struct dpu_kms 
> *dpu_kms);
>   */
>  irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms);
> 
> -/**
> - * dpu_core_irq_idx_lookup - IRQ helper function for lookup irq_idx 
> from HW
> - *                      interrupt mapping table.
> - * @dpu_kms:		DPU handle
> - * @intr_type:		DPU HW interrupt type for lookup
> - * @instance_idx:	DPU HW block instance defined in dpu_hw_mdss.h
> - * @return:		irq_idx or -EINVAL when fail to lookup
> - */
> -int dpu_core_irq_idx_lookup(
> -		struct dpu_kms *dpu_kms,
> -		enum dpu_intr_type intr_type,
> -		uint32_t instance_idx);
> -
>  /**
>   * dpu_core_irq_enable - IRQ helper function for enabling one or more 
> IRQs
>   * @dpu_kms:		DPU handle
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 8d942052db8a..8a9d01e3b664 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -253,7 +253,7 @@ void dpu_encoder_helper_report_irq_timeout(struct
> dpu_encoder_phys *phys_enc,
>  }
> 
>  static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
> -		int32_t hw_id, struct dpu_encoder_wait_info *info);
> +		u32 irq_idx, struct dpu_encoder_wait_info *info);
> 
>  int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>  		enum dpu_intr_idx intr_idx,
> @@ -273,27 +273,27 @@ int dpu_encoder_helper_wait_for_irq(struct
> dpu_encoder_phys *phys_enc,
> 
>  	/* return EWOULDBLOCK since we know the wait isn't necessary */
>  	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
> -		DRM_ERROR("encoder is disabled id=%u, intr=%d, hw=%d, irq=%d",
> -			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
> +		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d",
> +			  DRMID(phys_enc->parent), intr_idx,
>  			  irq->irq_idx);
>  		return -EWOULDBLOCK;
>  	}
> 
>  	if (irq->irq_idx < 0) {
> -		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, hw=%d, irq=%s",
> -			      DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
> +		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s",
> +			      DRMID(phys_enc->parent), intr_idx,
>  			      irq->name);
>  		return 0;
>  	}
> 
> -	DRM_DEBUG_KMS("id=%u, intr=%d, hw=%d, irq=%d, pp=%d, pending_cnt=%d",
> -		      DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
> +	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d",
> +		      DRMID(phys_enc->parent), intr_idx,
>  		      irq->irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
>  		      atomic_read(wait_info->atomic_cnt));
> 
>  	ret = dpu_encoder_helper_wait_event_timeout(
>  			DRMID(phys_enc->parent),
> -			irq->hw_idx,
> +			irq->irq_idx,
>  			wait_info);
> 
>  	if (ret <= 0) {
> @@ -303,9 +303,9 @@ int dpu_encoder_helper_wait_for_irq(struct
> dpu_encoder_phys *phys_enc,
>  			unsigned long flags;
> 
>  			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, "
> -				      "hw=%d, irq=%d, pp=%d, atomic_cnt=%d",
> +				      "irq=%d, pp=%d, atomic_cnt=%d",
>  				      DRMID(phys_enc->parent), intr_idx,
> -				      irq->hw_idx, irq->irq_idx,
> +				      irq->irq_idx,
>  				      phys_enc->hw_pp->idx - PINGPONG_0,
>  				      atomic_read(wait_info->atomic_cnt));
>  			local_irq_save(flags);
> @@ -315,16 +315,16 @@ int dpu_encoder_helper_wait_for_irq(struct
> dpu_encoder_phys *phys_enc,
>  		} else {
>  			ret = -ETIMEDOUT;
>  			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, "
> -				      "hw=%d, irq=%d, pp=%d, atomic_cnt=%d",
> +				      "irq=%d, pp=%d, atomic_cnt=%d",
>  				      DRMID(phys_enc->parent), intr_idx,
> -				      irq->hw_idx, irq->irq_idx,
> +				      irq->irq_idx,
>  				      phys_enc->hw_pp->idx - PINGPONG_0,
>  				      atomic_read(wait_info->atomic_cnt));
>  		}
>  	} else {
>  		ret = 0;
>  		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
> -			intr_idx, irq->hw_idx, irq->irq_idx,
> +			intr_idx, irq->irq_idx,
>  			phys_enc->hw_pp->idx - PINGPONG_0,
>  			atomic_read(wait_info->atomic_cnt));
>  	}
> @@ -344,19 +344,9 @@ int dpu_encoder_helper_register_irq(struct
> dpu_encoder_phys *phys_enc,
>  	}
>  	irq = &phys_enc->irq[intr_idx];
> 
> -	if (irq->irq_idx >= 0) {
> -		DPU_DEBUG_PHYS(phys_enc,
> -				"skipping already registered irq %s type %d\n",
> -				irq->name, irq->intr_type);
> -		return 0;
> -	}
> -
> -	irq->irq_idx = dpu_core_irq_idx_lookup(phys_enc->dpu_kms,
> -			irq->intr_type, irq->hw_idx);
>  	if (irq->irq_idx < 0) {
>  		DPU_ERROR_PHYS(phys_enc,
> -			"failed to lookup IRQ index for %s type:%d\n",
> -			irq->name, irq->intr_type);
> +			"invalid IRQ index:%d\n", irq->irq_idx);
>  		return -EINVAL;
>  	}
> 
> @@ -372,8 +362,8 @@ int dpu_encoder_helper_register_irq(struct
> dpu_encoder_phys *phys_enc,
> 
>  	ret = dpu_core_irq_enable(phys_enc->dpu_kms, &irq->irq_idx, 1);
>  	if (ret) {
> -		DRM_ERROR("enable failed id=%u, intr=%d, hw=%d, irq=%d",
> -			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
> +		DRM_ERROR("enable failed id=%u, intr=%d, irq=%d",
> +			  DRMID(phys_enc->parent), intr_idx,
>  			  irq->irq_idx);
>  		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
>  				irq->irq_idx, &irq->cb);
> @@ -382,7 +372,7 @@ int dpu_encoder_helper_register_irq(struct
> dpu_encoder_phys *phys_enc,
>  	}
> 
>  	trace_dpu_enc_irq_register_success(DRMID(phys_enc->parent), intr_idx,
> -				irq->hw_idx, irq->irq_idx);
> +				irq->irq_idx);
> 
>  	return ret;
>  }
> @@ -397,31 +387,29 @@ int dpu_encoder_helper_unregister_irq(struct
> dpu_encoder_phys *phys_enc,
> 
>  	/* silently skip irqs that weren't registered */
>  	if (irq->irq_idx < 0) {
> -		DRM_ERROR("duplicate unregister id=%u, intr=%d, hw=%d, irq=%d",
> -			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
> +		DRM_ERROR("duplicate unregister id=%u, intr=%d, irq=%d",
> +			  DRMID(phys_enc->parent), intr_idx,
>  			  irq->irq_idx);
>  		return 0;
>  	}
> 
>  	ret = dpu_core_irq_disable(phys_enc->dpu_kms, &irq->irq_idx, 1);
>  	if (ret) {
> -		DRM_ERROR("disable failed id=%u, intr=%d, hw=%d, irq=%d ret=%d",
> -			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
> +		DRM_ERROR("disable failed id=%u, intr=%d, irq=%d ret=%d",
> +			  DRMID(phys_enc->parent), intr_idx,
>  			  irq->irq_idx, ret);
>  	}
> 
>  	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, 
> irq->irq_idx,
>  			&irq->cb);
>  	if (ret) {
> -		DRM_ERROR("unreg cb fail id=%u, intr=%d, hw=%d, irq=%d ret=%d",
> -			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
> +		DRM_ERROR("unreg cb fail id=%u, intr=%d, irq=%d ret=%d",
> +			  DRMID(phys_enc->parent), intr_idx,
>  			  irq->irq_idx, ret);
>  	}
> 
>  	trace_dpu_enc_irq_unregister_success(DRMID(phys_enc->parent), 
> intr_idx,
> -					     irq->hw_idx, irq->irq_idx);
> -
> -	irq->irq_idx = -EINVAL;
> +					     irq->irq_idx);
> 
>  	return 0;
>  }
> @@ -1537,7 +1525,7 @@ void dpu_encoder_helper_trigger_start(struct
> dpu_encoder_phys *phys_enc)
> 
>  static int dpu_encoder_helper_wait_event_timeout(
>  		int32_t drm_id,
> -		int32_t hw_id,
> +		u32 irq_idx,
>  		struct dpu_encoder_wait_info *info)
>  {
>  	int rc = 0;
> @@ -1550,7 +1538,7 @@ static int dpu_encoder_helper_wait_event_timeout(
>  				atomic_read(info->atomic_cnt) == 0, jiffies);
>  		time = ktime_to_ms(ktime_get());
> 
> -		trace_dpu_enc_wait_event_timeout(drm_id, hw_id, rc, time,
> +		trace_dpu_enc_wait_event_timeout(drm_id, irq_idx, rc, time,
>  						 expected_time,
>  						 atomic_read(info->atomic_cnt));
>  	/* If we timed out, counter is valid and time is less, wait again */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index ecbc4be98980..3bd12ce45a80 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -167,7 +167,6 @@ enum dpu_intr_idx {
>   * @name:		string name of interrupt
>   * @intr_type:		Encoder interrupt type
>   * @intr_idx:		Encoder interrupt enumeration
> - * @hw_idx:		HW Block ID
>   * @irq_idx:		IRQ interface lookup index from DPU IRQ framework
>   *			will be -EINVAL if IRQ is not registered
>   * @irq_cb:		interrupt callback
> @@ -176,7 +175,6 @@ struct dpu_encoder_irq {
>  	const char *name;
>  	enum dpu_intr_type intr_type;
>  	enum dpu_intr_idx intr_idx;
> -	int hw_idx;
>  	int irq_idx;
>  	struct dpu_irq_callback cb;
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b2be39b9144e..6f06e379b97f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -143,28 +143,6 @@ static void
> dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
>  			phys_enc);
>  }
> 
> -static void _dpu_encoder_phys_cmd_setup_irq_hw_idx(
> -		struct dpu_encoder_phys *phys_enc)
> -{
> -	struct dpu_encoder_irq *irq;
> -
> -	irq = &phys_enc->irq[INTR_IDX_CTL_START];
> -	irq->hw_idx = phys_enc->hw_ctl->idx;
> -	irq->irq_idx = -EINVAL;
> -
> -	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
> -	irq->hw_idx = phys_enc->hw_pp->idx;
> -	irq->irq_idx = -EINVAL;
> -
> -	irq = &phys_enc->irq[INTR_IDX_RDPTR];
> -	irq->hw_idx = phys_enc->hw_pp->idx;
> -	irq->irq_idx = -EINVAL;
> -
> -	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> -	irq->hw_idx = phys_enc->intf_idx;
> -	irq->irq_idx = -EINVAL;
> -}
> -
>  static void dpu_encoder_phys_cmd_mode_set(
>  		struct dpu_encoder_phys *phys_enc,
>  		struct drm_display_mode *mode,
> @@ -172,6 +150,7 @@ static void dpu_encoder_phys_cmd_mode_set(
>  {
>  	struct dpu_encoder_phys_cmd *cmd_enc =
>  		to_dpu_encoder_phys_cmd(phys_enc);
> +	struct dpu_encoder_irq *irq;
> 
>  	if (!mode || !adj_mode) {
>  		DPU_ERROR("invalid args\n");
> @@ -181,7 +160,17 @@ static void dpu_encoder_phys_cmd_mode_set(
>  	DPU_DEBUG_CMDENC(cmd_enc, "caching mode:\n");
>  	drm_mode_debug_printmodeline(adj_mode);
> 
> -	_dpu_encoder_phys_cmd_setup_irq_hw_idx(phys_enc);
> +	irq = &phys_enc->irq[INTR_IDX_CTL_START];
> +	irq->irq_idx = phys_enc->hw_ctl->caps->intr_start;
> +
> +	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
> +	irq->irq_idx = phys_enc->hw_pp->caps->intr_done;
> +
> +	irq = &phys_enc->irq[INTR_IDX_RDPTR];
> +	irq->irq_idx = phys_enc->hw_pp->caps->intr_rdptr;
> +
> +	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> +	irq->irq_idx = phys_enc->hw_intf->cap->intr_underrun;
>  }
> 
>  static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
> @@ -795,7 +784,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>  		irq = &phys_enc->irq[i];
>  		INIT_LIST_HEAD(&irq->cb.list);
>  		irq->irq_idx = -EINVAL;
> -		irq->hw_idx = -EINVAL;
>  		irq->cb.arg = phys_enc;
>  	}
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 0e06b7e73c7a..6cdb4ecbc173 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -363,38 +363,24 @@ static bool 
> dpu_encoder_phys_vid_needs_single_flush(
>  	return phys_enc->split_role != ENC_ROLE_SOLO;
>  }
> 
> -static void _dpu_encoder_phys_vid_setup_irq_hw_idx(
> -		struct dpu_encoder_phys *phys_enc)
> -{
> -	struct dpu_encoder_irq *irq;
> -
> -	/*
> -	 * Initialize irq->hw_idx only when irq is not registered.
> -	 * Prevent invalidating irq->irq_idx as modeset may be
> -	 * called many times during dfps.
> -	 */
> -
> -	irq = &phys_enc->irq[INTR_IDX_VSYNC];
> -	if (irq->irq_idx < 0)
> -		irq->hw_idx = phys_enc->intf_idx;
> -
> -	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> -	if (irq->irq_idx < 0)
> -		irq->hw_idx = phys_enc->intf_idx;
> -}
> -
>  static void dpu_encoder_phys_vid_mode_set(
>  		struct dpu_encoder_phys *phys_enc,
>  		struct drm_display_mode *mode,
>  		struct drm_display_mode *adj_mode)
>  {
> +	struct dpu_encoder_irq *irq;
> +
>  	if (adj_mode) {
>  		phys_enc->cached_mode = *adj_mode;
>  		drm_mode_debug_printmodeline(adj_mode);
>  		DPU_DEBUG_VIDENC(phys_enc, "caching mode:\n");
>  	}
> 
> -	_dpu_encoder_phys_vid_setup_irq_hw_idx(phys_enc);
> +	irq = &phys_enc->irq[INTR_IDX_VSYNC];
> +	irq->irq_idx = phys_enc->hw_intf->cap->intr_vsync;
> +
> +	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> +	irq->irq_idx = phys_enc->hw_intf->cap->intr_underrun;
>  }
> 
>  static int dpu_encoder_phys_vid_control_vblank_irq(
> @@ -636,7 +622,7 @@ static void
> dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
> 
>  	if (enable) {
>  		ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
> -		if (ret)
> +		if (WARN_ON(ret))
>  			return;
> 
>  		dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_UNDERRUN);
> @@ -738,7 +724,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>  		irq = &phys_enc->irq[i];
>  		INIT_LIST_HEAD(&irq->cb.list);
>  		irq->irq_idx = -EINVAL;
> -		irq->hw_idx = -EINVAL;
>  		irq->cb.arg = phys_enc;
>  	}
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 9a77d64d3fd4..f929131ed260 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -350,27 +350,32 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x1000, .len = 0xE4,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY)
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0xE4,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY)
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0xE4,
> -	.features = 0
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0xE4,
> -	.features = 0
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0xE4,
> -	.features = 0
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  };
> 
> @@ -378,17 +383,20 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x1000, .len = 0xE4,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG)
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0xE4,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG)
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0xE4,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG)
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  };
> 
> @@ -396,32 +404,38 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x1000, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY)
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY)
> +	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG)
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG)
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG)
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  	{
>  	.name = "ctl_5", .id = CTL_5,
>  	.base = 0x1a00, .len = 0x1e0,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG)
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>  	},
>  };
> 
> @@ -429,22 +443,26 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x1E8,
> -	.features = CTL_SC7280_MASK
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x1E8,
> -	.features = CTL_SC7280_MASK
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x17000, .len = 0x1E8,
> -	.features = CTL_SC7280_MASK
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x18000, .len = 0x1E8,
> -	.features = CTL_SC7280_MASK
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  };
> 
> @@ -725,42 +743,66 @@ static const struct dpu_pingpong_sub_blks
> sc7280_pp_sblk = {
>  	.len = 0x20, .version = 0x20000},
>  };
> 
> -#define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk) \
> +#define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) 
> \
>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = 0xd4, \
>  	.features = PINGPONG_SDM845_SPLIT_MASK, \
>  	.merge_3d = _merge_3d, \
> -	.sblk = &_sblk \
> +	.sblk = &_sblk, \
> +	.intr_done = _done, \
> +	.intr_rdptr = _rdptr, \
>  	}
> -#define PP_BLK(_name, _id, _base, _merge_3d, _sblk) \
> +#define PP_BLK(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = 0xd4, \
>  	.features = PINGPONG_SDM845_MASK, \
>  	.merge_3d = _merge_3d, \
> -	.sblk = &_sblk \
> +	.sblk = &_sblk, \
> +	.intr_done = _done, \
> +	.intr_rdptr = _rdptr, \
>  	}
> 
>  static const struct dpu_pingpong_cfg sdm845_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk),
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>  };
> 
>  static struct dpu_pingpong_cfg sc7180_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te),
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, 
> -1, -1),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, 
> -1, -1),
>  };
> 
>  static const struct dpu_pingpong_cfg sm8150_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, 
> sdm845_pp_sblk_te),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, 
> sdm845_pp_sblk_te),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, 
> sdm845_pp_sblk),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, 
> sdm845_pp_sblk),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, 
> sdm845_pp_sblk),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, 
> sdm845_pp_sblk),
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, 
> sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, 
> sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +			-1),
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +			-1),
>  };
> 
>  /*************************************************************
> @@ -781,47 +823,49 @@ static const struct dpu_merge_3d_cfg 
> sm8150_merge_3d[] = {
>  };
> 
>  static const struct dpu_pingpong_cfg sc7280_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk),
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
>  };
>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, 
> _features) \
> +#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch,
> _features, _reg, _underrun_bit, _vsync_bit) \
>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = 0x280, \
>  	.features = _features, \
>  	.type = _type, \
>  	.controller_id = _ctrl_id, \
> -	.prog_fetch_lines_worst_case = _progfetch \
> +	.prog_fetch_lines_worst_case = _progfetch, \
> +	.intr_underrun = DPU_IRQ_IDX(_reg, _underrun_bit), \
> +	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
>  	}
> 
>  static const struct dpu_intf_cfg sdm845_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, 
> INTF_SDM845_MASK),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
> INTF_SDM845_MASK),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, 
> INTF_SDM845_MASK),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, 
> INTF_SDM845_MASK),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24,
> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24,
> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24,
> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
> 
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, 
> INTF_SC7180_MASK),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
> INTF_SC7180_MASK),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24,
> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>  };
> 
>  static const struct dpu_intf_cfg sm8150_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, 
> INTF_SC7180_MASK),
> -	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
> INTF_SC7180_MASK),
> -	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, 
> INTF_SC7180_MASK),
> -	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, 
> INTF_SC7180_MASK),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24,
> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24,
> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24,
> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
> 
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 0, 24, 
> INTF_SC7280_MASK),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, 
> INTF_SC7280_MASK),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, 
> INTF_SC7280_MASK),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 0, 24,
> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24,
> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24,
> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>  };
> 
>  /*************************************************************
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4dfd8a20ad5c..316da2971320 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -464,13 +464,15 @@ struct dpu_mdp_cfg {
>  	struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
>  };
> 
> -/* struct dpu_mdp_cfg : MDP TOP-BLK instance info
> +/* struct dpu_ctl_cfg : MDP CTL instance info
>   * @id:                index identifying this block
>   * @base:              register base offset to mdss
>   * @features           bit mask identifying sub-blocks/features
> + * @intr_start:        interrupt index for CTL_START
>   */
>  struct dpu_ctl_cfg {
>  	DPU_HW_BLK_INFO;
> +	s32 intr_start;
>  };
> 
>  /**
> @@ -526,11 +528,15 @@ struct dpu_dspp_cfg  {
>   * @id                 enum identifying this block
>   * @base               register offset of this block
>   * @features           bit mask identifying sub-blocks/features
> + * @intr_done:         index for PINGPONG done interrupt
> + * @intr_rdptr:        index for PINGPONG readpointer done interrupt
>   * @sblk               sub-blocks information
>   */
>  struct dpu_pingpong_cfg  {
>  	DPU_HW_BLK_INFO;
>  	u32 merge_3d;
> +	s32 intr_done;
> +	s32 intr_rdptr;
>  	const struct dpu_pingpong_sub_blks *sblk;
>  };
> 
> @@ -555,12 +561,16 @@ struct dpu_merge_3d_cfg  {
>   * @type:              Interface type(DSI, DP, HDMI)
>   * @controller_id:     Controller Instance ID in case of multiple of 
> intf type
>   * @prog_fetch_lines_worst_case	Worst case latency num lines needed to 
> prefetch
> + * @intr_underrun:	index for INTF underrun interrupt
> + * @intr_vsync:	        index for INTF VSYNC interrupt
>   */
>  struct dpu_intf_cfg  {
>  	DPU_HW_BLK_INFO;
>  	u32 type;   /* interface type*/
>  	u32 controller_id;
>  	u32 prog_fetch_lines_worst_case;
> +	s32 intr_underrun;
> +	s32 intr_vsync;
>  };
> 
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 8bd22e060437..adc1f04ac257 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -196,6 +196,8 @@ struct dpu_irq_type {
> 
>  /*
>   * struct dpu_intr_reg -  List of DPU interrupt registers
> + *
> + * When making changes be sure to sync with dpu_hw_intr_reg
>   */
>  static const struct dpu_intr_reg dpu_intr_set[] = {
>  	{
> @@ -265,6 +267,9 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>  	},
>  };
> 
> +#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
> +#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
> +
>  /*
>   * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx 
> in this
>   *			 table that have a matching interface type and
> @@ -1345,23 +1350,6 @@ static const struct dpu_irq_type dpu_irq_map[] = 
> {
>  	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
>  };
> 
> -static int dpu_hw_intr_irqidx_lookup(struct dpu_hw_intr *intr,
> -	enum dpu_intr_type intr_type, u32 instance_idx)
> -{
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(dpu_irq_map); i++) {
> -		if (intr_type == dpu_irq_map[i].intr_type &&
> -			instance_idx == dpu_irq_map[i].instance_idx &&
> -			!(intr->obsolete_irq & BIT(dpu_irq_map[i].intr_type)))
> -			return i;
> -	}
> -
> -	pr_debug("IRQ lookup fail!! intr_type=%d, instance_idx=%d\n",
> -			intr_type, instance_idx);
> -	return -EINVAL;
> -}
> -
>  static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr 
> *intr,
>  		int irq_idx)
>  {
> @@ -1370,9 +1358,8 @@ static void
> dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
>  	if (!intr)
>  		return;
> 
> -	reg_idx = dpu_irq_map[irq_idx].reg_idx;
> -	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> -			dpu_irq_map[irq_idx].irq_mask);
> +	reg_idx = DPU_IRQ_REG(irq_idx);
> +	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> DPU_IRQ_MASK(irq_idx));
> 
>  	/* ensure register writes go through */
>  	wmb();
> @@ -1384,10 +1371,9 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  {
>  	int reg_idx;
>  	int irq_idx;
> -	int start_idx;
> -	int end_idx;
>  	u32 irq_status;
>  	u32 enable_mask;
> +	int bit;
>  	unsigned long irq_flags;
> 
>  	if (!intr)
> @@ -1400,15 +1386,7 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  	 */
>  	spin_lock_irqsave(&intr->irq_lock, irq_flags);
>  	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
> -		/*
> -		 * Each Interrupt register has a range of 64 indexes, and
> -		 * that is static for dpu_irq_map.
> -		 */
> -		start_idx = reg_idx * 64;
> -		end_idx = start_idx + 64;
> -
> -		if (!test_bit(reg_idx, &intr->irq_mask) ||
> -			start_idx >= ARRAY_SIZE(dpu_irq_map))
> +		if (!test_bit(reg_idx, &intr->irq_mask))
>  			continue;
> 
>  		/* Read interrupt status */
> @@ -1425,37 +1403,33 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  		/* Finally update IRQ status based on enable mask */
>  		irq_status &= enable_mask;
> 
> +		if (!irq_status)
> +			continue;
> +
>  		/*
> -		 * Search through matching intr status from irq map.
> -		 * start_idx and end_idx defined the search range in
> -		 * the dpu_irq_map.
> +		 * Search through matching intr status.
>  		 */
> -		for (irq_idx = start_idx;
> -				(irq_idx < end_idx) && irq_status;
> -				irq_idx++)
> -			if ((irq_status & dpu_irq_map[irq_idx].irq_mask) &&
> -				(dpu_irq_map[irq_idx].reg_idx == reg_idx) &&
> -				!(intr->obsolete_irq &
> -				BIT(dpu_irq_map[irq_idx].intr_type))) {
> -				/*
> -				 * Once a match on irq mask, perform a callback
> -				 * to the given cbfunc. cbfunc will take care
> -				 * the interrupt status clearing. If cbfunc is
> -				 * not provided, then the interrupt clearing
> -				 * is here.
> -				 */
> -				if (cbfunc)
> -					cbfunc(arg, irq_idx);
> -
> -				dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
> -
> -				/*
> -				 * When callback finish, clear the irq_status
> -				 * with the matching mask. Once irq_status
> -				 * is all cleared, the search can be stopped.
> -				 */
> -				irq_status &= ~dpu_irq_map[irq_idx].irq_mask;
> -			}
> +		while ((bit = ffs(irq_status)) != 0) {
> +			irq_idx = DPU_IRQ_IDX(reg_idx, bit - 1);
> +			/*
> +			 * Once a match on irq mask, perform a callback
> +			 * to the given cbfunc. cbfunc will take care
> +			 * the interrupt status clearing. If cbfunc is
> +			 * not provided, then the interrupt clearing
> +			 * is here.
> +			 */
> +			if (cbfunc)
> +				cbfunc(arg, irq_idx);
> +
> +			dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
> +
> +			/*
> +			 * When callback finish, clear the irq_status
> +			 * with the matching mask. Once irq_status
> +			 * is all cleared, the search can be stopped.
> +			 */
> +			irq_status &= ~BIT(bit - 1);
> +		}
>  	}
> 
>  	/* ensure register writes go through */
> @@ -1469,32 +1443,30 @@ static int dpu_hw_intr_enable_irq(struct
> dpu_hw_intr *intr, int irq_idx)
>  	int reg_idx;
>  	unsigned long irq_flags;
>  	const struct dpu_intr_reg *reg;
> -	const struct dpu_irq_type *irq;
>  	const char *dbgstr = NULL;
>  	uint32_t cache_irq_mask;
> 
>  	if (!intr)
>  		return -EINVAL;
> 
> -	if (irq_idx < 0 || irq_idx >= ARRAY_SIZE(dpu_irq_map)) {
> +	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> 
> -	irq = &dpu_irq_map[irq_idx];
> -	reg_idx = irq->reg_idx;
> +	reg_idx = DPU_IRQ_REG(irq_idx);
>  	reg = &dpu_intr_set[reg_idx];
> 
>  	spin_lock_irqsave(&intr->irq_lock, irq_flags);
>  	cache_irq_mask = intr->cache_irq_mask[reg_idx];
> -	if (cache_irq_mask & irq->irq_mask) {
> +	if (cache_irq_mask & DPU_IRQ_MASK(irq_idx)) {
>  		dbgstr = "DPU IRQ already set:";
>  	} else {
>  		dbgstr = "DPU IRQ enabled:";
> 
> -		cache_irq_mask |= irq->irq_mask;
> +		cache_irq_mask |= DPU_IRQ_MASK(irq_idx);
>  		/* Cleaning any pending interrupt */
> -		DPU_REG_WRITE(&intr->hw, reg->clr_off, irq->irq_mask);
> +		DPU_REG_WRITE(&intr->hw, reg->clr_off, DPU_IRQ_MASK(irq_idx));
>  		/* Enabling interrupts with the new mask */
>  		DPU_REG_WRITE(&intr->hw, reg->en_off, cache_irq_mask);
> 
> @@ -1505,8 +1477,8 @@ static int dpu_hw_intr_enable_irq(struct
> dpu_hw_intr *intr, int irq_idx)
>  	}
>  	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
> 
> -	pr_debug("%s MASK:0x%.8x, CACHE-MASK:0x%.8x\n", dbgstr,
> -			irq->irq_mask, cache_irq_mask);
> +	pr_debug("%s MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", dbgstr,
> +			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
> 
>  	return 0;
>  }
> @@ -1515,33 +1487,31 @@ static int
> dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
>  {
>  	int reg_idx;
>  	const struct dpu_intr_reg *reg;
> -	const struct dpu_irq_type *irq;
>  	const char *dbgstr = NULL;
>  	uint32_t cache_irq_mask;
> 
>  	if (!intr)
>  		return -EINVAL;
> 
> -	if (irq_idx < 0 || irq_idx >= ARRAY_SIZE(dpu_irq_map)) {
> +	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> 
> -	irq = &dpu_irq_map[irq_idx];
> -	reg_idx = irq->reg_idx;
> +	reg_idx = DPU_IRQ_REG(irq_idx);
>  	reg = &dpu_intr_set[reg_idx];
> 
>  	cache_irq_mask = intr->cache_irq_mask[reg_idx];
> -	if ((cache_irq_mask & irq->irq_mask) == 0) {
> +	if ((cache_irq_mask & DPU_IRQ_MASK(irq_idx)) == 0) {
>  		dbgstr = "DPU IRQ is already cleared:";
>  	} else {
>  		dbgstr = "DPU IRQ mask disable:";
> 
> -		cache_irq_mask &= ~irq->irq_mask;
> +		cache_irq_mask &= ~DPU_IRQ_MASK(irq_idx);
>  		/* Disable interrupts based on the new mask */
>  		DPU_REG_WRITE(&intr->hw, reg->en_off, cache_irq_mask);
>  		/* Cleaning any pending interrupt */
> -		DPU_REG_WRITE(&intr->hw, reg->clr_off, irq->irq_mask);
> +		DPU_REG_WRITE(&intr->hw, reg->clr_off, DPU_IRQ_MASK(irq_idx));
> 
>  		/* ensure register write goes through */
>  		wmb();
> @@ -1549,8 +1519,8 @@ static int dpu_hw_intr_disable_irq_nolock(struct
> dpu_hw_intr *intr, int irq_idx)
>  		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
>  	}
> 
> -	pr_debug("%s MASK:0x%.8x, CACHE-MASK:0x%.8x\n", dbgstr,
> -			irq->irq_mask, cache_irq_mask);
> +	pr_debug("%s MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", dbgstr,
> +			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
> 
>  	return 0;
>  }
> @@ -1562,7 +1532,7 @@ static int dpu_hw_intr_disable_irq(struct
> dpu_hw_intr *intr, int irq_idx)
>  	if (!intr)
>  		return -EINVAL;
> 
> -	if (irq_idx < 0 || irq_idx >= ARRAY_SIZE(dpu_irq_map)) {
> +	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -1622,17 +1592,17 @@ static u32
> dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
>  	if (!intr)
>  		return 0;
> 
> -	if (irq_idx >= ARRAY_SIZE(dpu_irq_map) || irq_idx < 0) {
> +	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return 0;
>  	}
> 
>  	spin_lock_irqsave(&intr->irq_lock, irq_flags);
> 
> -	reg_idx = dpu_irq_map[irq_idx].reg_idx;
> +	reg_idx = DPU_IRQ_REG(irq_idx);
>  	intr_status = DPU_REG_READ(&intr->hw,
>  			dpu_intr_set[reg_idx].status_off) &
> -					dpu_irq_map[irq_idx].irq_mask;
> +		DPU_IRQ_MASK(irq_idx);
>  	if (intr_status && clear)
>  		DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
>  				intr_status);
> @@ -1647,7 +1617,6 @@ static u32
> dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
> 
>  static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
>  {
> -	ops->irq_idx_lookup = dpu_hw_intr_irqidx_lookup;
>  	ops->enable_irq = dpu_hw_intr_enable_irq;
>  	ops->disable_irq = dpu_hw_intr_disable_irq;
>  	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
> @@ -1679,7 +1648,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem 
> *addr,
>  	__intr_offset(m, addr, &intr->hw);
>  	__setup_intr_ops(&intr->ops);
> 
> -	intr->irq_idx_tbl_size = ARRAY_SIZE(dpu_irq_map);
> +	intr->total_irqs = ARRAY_SIZE(dpu_intr_set) * 32;
> 
>  	intr->cache_irq_mask = kcalloc(ARRAY_SIZE(dpu_intr_set), sizeof(u32),
>  			GFP_KERNEL);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index b26a3445a8eb..c6b3d373ce75 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -92,23 +92,14 @@ enum dpu_hw_intr_reg {
>  	MDP_INTR_MAX,
>  };
> 
> +#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
> +
>  struct dpu_hw_intr;
> 
>  /**
>   * Interrupt operations.
>   */
>  struct dpu_hw_intr_ops {
> -	/**
> -	 * irq_idx_lookup - Lookup IRQ index on the HW interrupt type
> -	 *                 Used for all irq related ops
> -	 * @intr:		HW interrupt handle
> -	 * @intr_type:		Interrupt type defined in dpu_intr_type
> -	 * @instance_idx:	HW interrupt block instance
> -	 * @return:		irq_idx or -EINVAL for lookup fail
> -	 */
> -	int (*irq_idx_lookup)(struct dpu_hw_intr *intr,
> -			enum dpu_intr_type intr_type,
> -			u32 instance_idx);
> 
>  	/**
>  	 * enable_irq - Enable IRQ based on lookup IRQ index
> @@ -179,7 +170,7 @@ struct dpu_hw_intr_ops {
>   * @ops:              function pointer mapping for IRQ handling
>   * @cache_irq_mask:   array of IRQ enable masks reg storage created 
> during init
>   * @save_irq_status:  array of IRQ status reg storage created during 
> init
> - * @irq_idx_tbl_size: total number of irq_idx mapped in the 
> hw_interrupts
> + * @total_irqs: total number of irq_idx mapped in the hw_interrupts
>   * @irq_lock:         spinlock for accessing IRQ resources
>   * @obsolete_irq:      irq types that are obsolete for a particular 
> target
>   */
> @@ -188,7 +179,7 @@ struct dpu_hw_intr {
>  	struct dpu_hw_intr_ops ops;
>  	u32 *cache_irq_mask;
>  	u32 *save_irq_status;
> -	u32 irq_idx_tbl_size;
> +	u32 total_irqs;
>  	spinlock_t irq_lock;
>  	unsigned long irq_mask;
>  	unsigned long obsolete_irq;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 6714b088970f..e349ea78a49d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -188,24 +188,23 @@ DECLARE_EVENT_CLASS(dpu_enc_irq_template,
>  		  __entry->irq_idx)
>  );
>  DEFINE_EVENT(dpu_enc_irq_template, dpu_enc_irq_register_success,
> -	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx, int hw_idx,
> +	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
>  		 int irq_idx),
> -	TP_ARGS(drm_id, intr_idx, hw_idx, irq_idx)
> +	TP_ARGS(drm_id, intr_idx, irq_idx)
>  );
>  DEFINE_EVENT(dpu_enc_irq_template, dpu_enc_irq_unregister_success,
> -	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx, int hw_idx,
> +	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
>  		 int irq_idx),
> -	TP_ARGS(drm_id, intr_idx, hw_idx, irq_idx)
> +	TP_ARGS(drm_id, intr_idx, irq_idx)
>  );
> 
>  TRACE_EVENT(dpu_enc_irq_wait_success,
> -	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx, int hw_idx,
> +	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
>  		 int irq_idx, enum dpu_pingpong pp_idx, int atomic_cnt),
>  	TP_ARGS(drm_id, intr_idx, hw_idx, irq_idx, pp_idx, atomic_cnt),
>  	TP_STRUCT__entry(
>  		__field(	uint32_t,		drm_id		)
>  		__field(	enum dpu_intr_idx,	intr_idx	)
> -		__field(	int,			hw_idx		)
>  		__field(	int,			irq_idx		)
>  		__field(	enum dpu_pingpong,	pp_idx		)
>  		__field(	int,			atomic_cnt	)
> @@ -213,13 +212,12 @@ TRACE_EVENT(dpu_enc_irq_wait_success,
>  	TP_fast_assign(
>  		__entry->drm_id = drm_id;
>  		__entry->intr_idx = intr_idx;
> -		__entry->hw_idx = hw_idx;
>  		__entry->irq_idx = irq_idx;
>  		__entry->pp_idx = pp_idx;
>  		__entry->atomic_cnt = atomic_cnt;
>  	),
> -	TP_printk("id=%u, intr=%d, hw=%d, irq=%d, pp=%d, atomic_cnt=%d",
> -		  __entry->drm_id, __entry->intr_idx, __entry->hw_idx,
> +	TP_printk("id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d",
> +		  __entry->drm_id, __entry->hw_idx,
>  		  __entry->irq_idx, __entry->pp_idx, __entry->atomic_cnt)
>  );
> 
> @@ -514,12 +512,12 @@ DEFINE_EVENT(dpu_id_event_template,
> dpu_crtc_frame_event_more_pending,
>  );
> 
>  TRACE_EVENT(dpu_enc_wait_event_timeout,
> -	TP_PROTO(uint32_t drm_id, int32_t hw_id, int rc, s64 time,
> +	TP_PROTO(uint32_t drm_id, int irq_idx, int rc, s64 time,
>  		 s64 expected_time, int atomic_cnt),
> -	TP_ARGS(drm_id, hw_id, rc, time, expected_time, atomic_cnt),
> +	TP_ARGS(drm_id, irq_idx, rc, time, expected_time, atomic_cnt),
>  	TP_STRUCT__entry(
>  		__field(	uint32_t,	drm_id		)
> -		__field(	int32_t,	hw_id		)
> +		__field(	int,		irq_idx		)
>  		__field(	int,		rc		)
>  		__field(	s64,		time		)
>  		__field(	s64,		expected_time	)
> @@ -527,14 +525,14 @@ TRACE_EVENT(dpu_enc_wait_event_timeout,
>  	),
>  	TP_fast_assign(
>  		__entry->drm_id = drm_id;
> -		__entry->hw_id = hw_id;
> +		__entry->irq_idx = irq_idx;
>  		__entry->rc = rc;
>  		__entry->time = time;
>  		__entry->expected_time = expected_time;
>  		__entry->atomic_cnt = atomic_cnt;
>  	),
> -	TP_printk("id=%u, hw_id=%d, rc=%d, time=%lld, expected=%lld cnt=%d",
> -		  __entry->drm_id, __entry->hw_id, __entry->rc, __entry->time,
> +	TP_printk("id=%u, irq_idx=%d, rc=%d, time=%lld, expected=%lld 
> cnt=%d",
> +		  __entry->drm_id, __entry->irq_idx, __entry->rc, __entry->time,
>  		  __entry->expected_time, __entry->atomic_cnt)
>  );
