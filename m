Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF19D765C1E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 21:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F2C10E5F0;
	Thu, 27 Jul 2023 19:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D3510E5EB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 19:29:30 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4B2B4204A7;
 Thu, 27 Jul 2023 21:29:28 +0200 (CEST)
Date: Thu, 27 Jul 2023 21:29:26 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: add helper to get IRQ-related data
Message-ID: <hdenbea53reesjrin4szoq64ja63ryjznsllvmicuzdftmk5u7@lows7neacgm2>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727150455.1489575-4-dmitry.baryshkov@linaro.org>
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

On 2023-07-27 18:04:54, Dmitry Baryshkov wrote:
> In preparation to reworking the IRQ indices, move irq_tbl access to
> separate helper.

I am not seeing the advantage of the helper, but making every function
look up dpu_kms->hw_intr->irq_tbl[irq_idx] only once and storing that in
a local dpu_hw_intr_entry pointer is much tidier.

Maybe I expected it to do extra mutations to irq_idx in 4/4?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 48 +++++++++++++------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 12 +++--
>  2 files changed, 41 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index eaae7f11f57f..ede7161ae904 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -199,6 +199,12 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>  
>  #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
>  
> +static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *dpu_kms,
> +							       int irq_idx)
> +{
> +	return &dpu_kms->hw_intr->irq_tbl[irq_idx];
> +}
> +
>  /**
>   * dpu_core_irq_callback_handler - dispatch core interrupts
>   * @dpu_kms:		Pointer to DPU's KMS structure
> @@ -206,17 +212,19 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>   */
>  static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
>  {
> +	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
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
> @@ -509,6 +517,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  		void (*irq_cb)(void *arg),
>  		void *irq_arg)
>  {
> +	struct dpu_hw_intr_entry *irq_entry;
>  	unsigned long irq_flags;
>  	int ret;
>  
> @@ -526,15 +535,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  
>  	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
> -	if (unlikely(WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb))) {
> +	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
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
> @@ -551,6 +561,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  
>  int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  {
> +	struct dpu_hw_intr_entry *irq_entry;
>  	unsigned long irq_flags;
>  	int ret;
>  
> @@ -569,8 +580,9 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
>  					irq_idx, ret);
>  
> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
> -	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
> +	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
> +	irq_entry->cb = NULL;
> +	irq_entry->arg = NULL;
>  
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
> @@ -583,14 +595,16 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
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
> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
> +		irq_count = atomic_read(&irq_entry->count);
> +		cb = irq_entry->cb;
>  		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
>  		if (irq_count || cb)
> @@ -613,6 +627,7 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
>  void dpu_core_irq_preinstall(struct msm_kms *kms)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +	struct dpu_hw_intr_entry *irq_entry;
>  	int i;
>  
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> @@ -620,22 +635,27 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
>  	dpu_disable_all_irqs(dpu_kms);
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  
> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> -		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
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
> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
> +		if (irq_entry->cb)
>  			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> +	}
>  
>  	dpu_clear_irqs(dpu_kms);
>  	dpu_disable_all_irqs(dpu_kms);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 3a988a4e4f33..59bde8ab50c8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -40,6 +40,12 @@ enum dpu_hw_intr_reg {
>  #define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
>  #define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
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
> @@ -59,11 +65,7 @@ struct dpu_hw_intr {
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
