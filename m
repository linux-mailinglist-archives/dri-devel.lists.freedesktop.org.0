Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F2F768112
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 20:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E1B10E0E8;
	Sat, 29 Jul 2023 18:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA71F10E0E8;
 Sat, 29 Jul 2023 18:44:56 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 30C8D3F297;
 Sat, 29 Jul 2023 20:44:55 +0200 (CEST)
Date: Sat, 29 Jul 2023 20:44:53 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 3/6] drm/msm/dpu: add helper to get IRQ-related data
Message-ID: <xulzcddjg4wsr5lgb3obvbqb4uilwajgqjpevujquonnxkiy46@zw6ab65njxj3>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
 <20230728233200.151735-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728233200.151735-4-dmitry.baryshkov@linaro.org>
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

On 2023-07-29 02:31:57, Dmitry Baryshkov wrote:
> In preparation to reworking the IRQ indices, move irq_tbl access to
> separate helper.

Nit: "to _a_ separate helper"

> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 48 +++++++++++++------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 12 +++--
>  2 files changed, 41 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 81d03b6c67d1..14d374de30c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -206,6 +206,12 @@ static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
>  	return irq_idx >= 0 && irq_idx < intr->total_irqs;
>  }
>  
> +static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_intr *intr,
> +							       int irq_idx)
> +{
> +	return &intr->irq_tbl[irq_idx];
> +}
> +
>  /**
>   * dpu_core_irq_callback_handler - dispatch core interrupts
>   * @dpu_kms:		Pointer to DPU's KMS structure
> @@ -213,17 +219,19 @@ static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
>   */
>  static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
>  {
> +	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
> +
>  	VERB("irq_idx=%d\n", irq_idx);
>  
> -	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
> +	if (!irq_entry->cb)
>  		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
>  
> -	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
> +	atomic_inc(&irq_entry->count);
>  
>  	/*
>  	 * Perform registered function callback
>  	 */
> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg);
> +	irq_entry->cb(irq_entry->arg);
>  }
>  
>  irqreturn_t dpu_core_irq(struct msm_kms *kms)
> @@ -510,6 +518,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  		void (*irq_cb)(void *arg),
>  		void *irq_arg)
>  {
> +	struct dpu_hw_intr_entry *irq_entry;
>  	unsigned long irq_flags;
>  	int ret;
>  
> @@ -527,15 +536,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  
>  	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
> -	if (unlikely(WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb))) {
> +	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
> +	if (unlikely(WARN_ON(irq_entry->cb))) {
>  		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
>  		return -EBUSY;
>  	}
>  
>  	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
> -	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = irq_arg;
> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = irq_cb;
> +	irq_entry->arg = irq_arg;
> +	irq_entry->cb = irq_cb;
>  
>  	ret = dpu_hw_intr_enable_irq_locked(
>  				dpu_kms->hw_intr,
> @@ -552,6 +562,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  
>  int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  {
> +	struct dpu_hw_intr_entry *irq_entry;
>  	unsigned long irq_flags;
>  	int ret;
>  
> @@ -570,8 +581,9 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
>  					irq_idx, ret);
>  
> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
> -	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
> +	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
> +	irq_entry->cb = NULL;
> +	irq_entry->arg = NULL;
>  
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
> @@ -584,14 +596,16 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
>  {
>  	struct dpu_kms *dpu_kms = s->private;
> +	struct dpu_hw_intr_entry *irq_entry;
>  	unsigned long irq_flags;
>  	int i, irq_count;
>  	void *cb;
>  
>  	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
>  		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> -		irq_count = atomic_read(&dpu_kms->hw_intr->irq_tbl[i].count);
> -		cb = dpu_kms->hw_intr->irq_tbl[i].cb;
> +		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
> +		irq_count = atomic_read(&irq_entry->count);
> +		cb = irq_entry->cb;
>  		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
>  		if (irq_count || cb)
> @@ -614,6 +628,7 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
>  void dpu_core_irq_preinstall(struct msm_kms *kms)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +	struct dpu_hw_intr_entry *irq_entry;
>  	int i;
>  
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> @@ -621,22 +636,27 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
>  	dpu_disable_all_irqs(dpu_kms);
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  
> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> -		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> +		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
> +		atomic_set(&irq_entry->count, 0);
> +	}
>  }
>  
>  void dpu_core_irq_uninstall(struct msm_kms *kms)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +	struct dpu_hw_intr_entry *irq_entry;
>  	int i;
>  
>  	if (!dpu_kms->hw_intr)
>  		return;
>  
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> -		if (dpu_kms->hw_intr->irq_tbl[i].cb)
> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> +		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
> +		if (irq_entry->cb)
>  			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> +	}
>  
>  	dpu_clear_irqs(dpu_kms);
>  	dpu_disable_all_irqs(dpu_kms);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index e2b00dd32619..391fb268ad90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -38,6 +38,12 @@ enum dpu_hw_intr_reg {
>  
>  #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
>  
> +struct dpu_hw_intr_entry {
> +	void (*cb)(void *arg);
> +	void *arg;
> +	atomic_t count;
> +};
> +
>  /**
>   * struct dpu_hw_intr: hw interrupts handling data structure
>   * @hw:               virtual address mapping
> @@ -57,11 +63,7 @@ struct dpu_hw_intr {
>  	unsigned long irq_mask;
>  	const struct dpu_intr_reg *intr_set;
>  
> -	struct {
> -		void (*cb)(void *arg);
> -		void *arg;
> -		atomic_t count;
> -	} irq_tbl[];
> +	struct dpu_hw_intr_entry irq_tbl[];
>  };
>  
>  /**
> -- 
> 2.39.2
> 
