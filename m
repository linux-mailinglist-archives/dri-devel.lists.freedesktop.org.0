Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1E776877F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 21:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A619410E125;
	Sun, 30 Jul 2023 19:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6899510E12D
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 19:36:01 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 25469202E8;
 Sun, 30 Jul 2023 21:35:59 +0200 (CEST)
Date: Sun, 30 Jul 2023 21:35:58 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 5/7] drm/msm/dpu: stop using raw IRQ indices in the
 kernel output
Message-ID: <i4u6kjtjhzzudkcc4sas5asukqisazeksophgwywxbvuqqtnuc@lzdzef3cdaaf>
References: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
 <20230729222708.329265-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230729222708.329265-6-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-30 01:27:06, Dmitry Baryshkov wrote:
> In preparation to reworking IRQ indcies, stop using raw indices in

IRQ indices*

> kernel output (both printk and debugfs). Instead use a pair of register
> index and bit. This corresponds closer to the values in HW catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 26 +++++-----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 51 +++++++++++--------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +
>  3 files changed, 46 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 051447a3620c..b81daa415efb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -351,7 +351,7 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
>  		u32 irq_idx, struct dpu_encoder_wait_info *info);
>  
>  int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
> -		int irq,
> +		int irq_idx,
>  		void (*func)(void *arg),
>  		struct dpu_encoder_wait_info *wait_info)
>  {
> @@ -366,36 +366,36 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>  
>  	/* return EWOULDBLOCK since we know the wait isn't necessary */
>  	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
> -		DRM_ERROR("encoder is disabled id=%u, callback=%ps, irq=%d\n",
> +		DRM_ERROR("encoder is disabled id=%u, callback=%ps, IRQ: [%d, %d]\n",
>  			  DRMID(phys_enc->parent), func,
> -			  irq);
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EWOULDBLOCK;
>  	}
>  
> -	if (irq < 0) {
> +	if (irq_idx < 0) {
>  		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
>  			      DRMID(phys_enc->parent), func);
>  		return 0;
>  	}
>  
> -	DRM_DEBUG_KMS("id=%u, callback=%ps, irq=%d, pp=%d, pending_cnt=%d\n",
> +	DRM_DEBUG_KMS("id=%u, callback=%ps, IRQ: [%d, %d], pp=%d, pending_cnt=%d\n",
>  		      DRMID(phys_enc->parent), func,
> -		      irq, phys_enc->hw_pp->idx - PINGPONG_0,
> +		      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), phys_enc->hw_pp->idx - PINGPONG_0,
>  		      atomic_read(wait_info->atomic_cnt));
>  
>  	ret = dpu_encoder_helper_wait_event_timeout(
>  			DRMID(phys_enc->parent),
> -			irq,
> +			irq_idx,
>  			wait_info);
>  
>  	if (ret <= 0) {
> -		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq);
> +		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq_idx);
>  		if (irq_status) {
>  			unsigned long flags;
>  
> -			DRM_DEBUG_KMS("irq not triggered id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d\n",
> +			DRM_DEBUG_KMS("IRQ [%d, %d] not triggered id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",

IRQ: (add colon), which you seem to have settled on?

> +				      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
>  				      DRMID(phys_enc->parent), func,
> -				      irq,
>  				      phys_enc->hw_pp->idx - PINGPONG_0,
>  				      atomic_read(wait_info->atomic_cnt));
>  			local_irq_save(flags);
> @@ -404,16 +404,16 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>  			ret = 0;
>  		} else {
>  			ret = -ETIMEDOUT;
> -			DRM_DEBUG_KMS("irq timeout id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d\n",
> +			DRM_DEBUG_KMS("IRQ: [%d, %d] timeout id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",
> +				      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
>  				      DRMID(phys_enc->parent), func,
> -				      irq,
>  				      phys_enc->hw_pp->idx - PINGPONG_0,
>  				      atomic_read(wait_info->atomic_cnt));
>  		}
>  	} else {
>  		ret = 0;
>  		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
> -			func, irq,
> +			func, irq_idx,
>  			phys_enc->hw_pp->idx - PINGPONG_0,
>  			atomic_read(wait_info->atomic_cnt));
>  	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 3d6d13407dde..b1592d73470d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -197,8 +197,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>  	},
>  };
>  
> -#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
> -#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
> +#define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
>  
>  static inline bool dpu_core_irq_is_valid(int irq_idx)
>  {
> @@ -220,10 +219,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
>  {
>  	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
>  
> -	VERB("irq_idx=%d\n", irq_idx);
> +	VERB("IRQ: [%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	if (!irq_entry->cb)
> -		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
> +		DRM_ERROR("no registered cb, IRQ: [%d, %d]\n",
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	atomic_inc(&irq_entry->count);
>  
> @@ -305,7 +305,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  		return -EINVAL;
>  
>  	if (!dpu_core_irq_is_valid(irq_idx)) {
> -		pr_err("invalid IRQ index: [%d]\n", irq_idx);
> +		pr_err("invalid IRQ: [%d, %d]\n",
> +		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EINVAL;
>  	}
>  
> @@ -341,7 +342,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
>  	}
>  
> -	pr_debug("DPU IRQ %d %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
> +	pr_debug("DPU IRQ [%d, %d] %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",

IRQ:

> +		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
>  			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
>  
>  	return 0;
> @@ -358,7 +360,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  		return -EINVAL;
>  
>  	if (!dpu_core_irq_is_valid(irq_idx)) {
> -		pr_err("invalid IRQ index: [%d]\n", irq_idx);
> +		pr_err("invalid IRQ: [%d, %d]\n",
> +		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EINVAL;
>  	}
>  
> @@ -390,7 +393,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
>  	}
>  
> -	pr_debug("DPU IRQ %d %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
> +	pr_debug("DPU IRQ [%d, %d] %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",

IRQ:

> +		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
>  			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
>  
>  	return 0;
> @@ -443,7 +447,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>  		return 0;
>  
>  	if (!dpu_core_irq_is_valid(irq_idx)) {
> -		pr_err("invalid IRQ index: [%d]\n", irq_idx);
> +		pr_err("invalid IRQ: [%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return 0;
>  	}
>  
> @@ -519,16 +523,19 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  	int ret;
>  
>  	if (!irq_cb) {
> -		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
> +		DPU_ERROR("invalid IRQ: [%d, %d] irq_cb:%ps\n",
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
>  		return -EINVAL;
>  	}
>  
>  	if (!dpu_core_irq_is_valid(irq_idx)) {
> -		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> +		DPU_ERROR("invalid IRQ: [%d, %d]\n",
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EINVAL;
>  	}
>  
> -	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> +	VERB("[%pS] IRQ: [%d, %d]\n", __builtin_return_address(0),
> +	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
> @@ -547,8 +554,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  				dpu_kms->hw_intr,
>  				irq_idx);
>  	if (ret)
> -		DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
> -					irq_idx);
> +		DPU_ERROR("Fail to enable IRQ [%d, %d]\n",

FailED*?

IRQ:

Though it reads weird here and elsewhere, perhaps I prefer the IRQ:[%d,
%d] (drop the space) variant after all.

> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
>  	trace_dpu_irq_register_success(irq_idx);
> @@ -563,19 +570,21 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  	int ret;
>  
>  	if (!dpu_core_irq_is_valid(irq_idx)) {
> -		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> +		DPU_ERROR("invalid IRQ: [%d, %d]\n",
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EINVAL;
>  	}
>  
> -	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> +	VERB("[%pS] IRQ: [%d, %d]\n", __builtin_return_address(0),
> +	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  	trace_dpu_core_irq_unregister_callback(irq_idx);
>  
>  	ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
>  	if (ret)
> -		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
> -					irq_idx, ret);
> +		DPU_ERROR("Fail to disable IRQ [%d, %d]: %d\n",

Failed*

IRQ:

- Marijn

> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), ret);
>  
>  	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
>  	irq_entry->cb = NULL;
> @@ -605,7 +614,8 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
>  		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
>  		if (irq_count || cb)
> -			seq_printf(s, "idx:%d irq:%d cb:%ps\n", i, irq_count, cb);
> +			seq_printf(s, "IRQ: [%d, %d] count:%d cb:%ps\n",
> +				   DPU_IRQ_REG(i), DPU_IRQ_BIT(i), irq_count, cb);
>  	}
>  
>  	return 0;
> @@ -651,7 +661,8 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
>  	for (i = 0; i < DPU_NUM_IRQS; i++) {
>  		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
>  		if (irq_entry->cb)
> -			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> +			DPU_ERROR("IRQ: [%d, %d] still enabled/registered\n",
> +				  DPU_IRQ_REG(i), DPU_IRQ_BIT(i));
>  	}
>  
>  	dpu_clear_irqs(dpu_kms);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index bb775b6a2432..9df5d6e737a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -37,6 +37,8 @@ enum dpu_hw_intr_reg {
>  #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
>  
>  #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
> +#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
> +#define DPU_IRQ_BIT(irq_idx)	(irq_idx % 32)
>  
>  #define DPU_NUM_IRQS		(MDP_INTR_MAX * 32)
>  
> -- 
> 2.39.2
> 
