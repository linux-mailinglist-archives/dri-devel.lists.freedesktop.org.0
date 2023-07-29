Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B4E76811B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 20:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3843510E208;
	Sat, 29 Jul 2023 18:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C8510E1F5
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:52:47 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3879B3EB5B;
 Sat, 29 Jul 2023 20:52:45 +0200 (CEST)
Date: Sat, 29 Jul 2023 20:52:43 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 4/6] drm/msm/dpu: make the irq table size static
Message-ID: <ejtvrqpxyd4y7b7mahvv4d6fw5sx726bv5epuqorks5buxsdt2@ydybjy6kr565>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
 <20230728233200.151735-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728233200.151735-5-dmitry.baryshkov@linaro.org>
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

On 2023-07-29 02:31:58, Dmitry Baryshkov wrote:
> The size of the irq table is static, it has MDP_INTR_MAX * 32 interrupt
> entries. Provide the fixed length and drop struct_size() statement.

Good call.  I thought it was supposed to be allocated based on enabled
interrupts (but then indexing becomes a big problem) to lighten the
tables on platforms where the higher registers aren't even used, but it
was always the constant MDP_INTR_MAX * 32.  It's even better now that
you removed all the 7xxx defines of which there were 11, times 32
interrupts, times sizeof(dpu_hw_intr_entry)=20 (or 24).

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 13 +++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 +++---
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 14d374de30c5..308b122059cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -203,7 +203,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>  static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,

Now you can drop the intr argument :)

After fixing that:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

>  					 int irq_idx)
>  {
> -	return irq_idx >= 0 && irq_idx < intr->total_irqs;
> +	return irq_idx >= 0 && irq_idx < DPU_NUM_IRQS;
>  }
>  
>  static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_hw_intr *intr,
> @@ -470,13 +470,12 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  		const struct dpu_mdss_cfg *m)
>  {
>  	struct dpu_hw_intr *intr;
> -	int nirq = MDP_INTR_MAX * 32;
>  	unsigned int i;
>  
>  	if (!addr || !m)
>  		return ERR_PTR(-EINVAL);
>  
> -	intr = kzalloc(struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
> +	intr = kzalloc(sizeof(*intr), GFP_KERNEL);
>  	if (!intr)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -487,8 +486,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  
>  	intr->hw.blk_addr = addr + m->mdp[0].base;
>  
> -	intr->total_irqs = nirq;
> -
>  	intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
>  			 BIT(MDP_SSPP_TOP0_INTR2) |
>  			 BIT(MDP_SSPP_TOP0_HIST_INTR);
> @@ -601,7 +598,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
>  	int i, irq_count;
>  	void *cb;
>  
> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> +	for (i = 0; i < DPU_NUM_IRQS; i++) {
>  		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
>  		irq_count = atomic_read(&irq_entry->count);
> @@ -636,7 +633,7 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
>  	dpu_disable_all_irqs(dpu_kms);
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  
> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> +	for (i = 0; i < DPU_NUM_IRQS; i++) {
>  		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
>  		atomic_set(&irq_entry->count, 0);
>  	}
> @@ -652,7 +649,7 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
>  		return;
>  
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> +	for (i = 0; i < DPU_NUM_IRQS; i++) {
>  		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
>  		if (irq_entry->cb)
>  			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 391fb268ad90..bb775b6a2432 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -38,6 +38,8 @@ enum dpu_hw_intr_reg {
>  
>  #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
>  
> +#define DPU_NUM_IRQS		(MDP_INTR_MAX * 32)
> +
>  struct dpu_hw_intr_entry {
>  	void (*cb)(void *arg);
>  	void *arg;
> @@ -50,7 +52,6 @@ struct dpu_hw_intr_entry {
>   * @ops:              function pointer mapping for IRQ handling
>   * @cache_irq_mask:   array of IRQ enable masks reg storage created during init
>   * @save_irq_status:  array of IRQ status reg storage created during init
> - * @total_irqs: total number of irq_idx mapped in the hw_interrupts
>   * @irq_lock:         spinlock for accessing IRQ resources
>   * @irq_cb_tbl:       array of IRQ callbacks
>   */
> @@ -58,12 +59,11 @@ struct dpu_hw_intr {
>  	struct dpu_hw_blk_reg_map hw;
>  	u32 cache_irq_mask[MDP_INTR_MAX];
>  	u32 *save_irq_status;
> -	u32 total_irqs;
>  	spinlock_t irq_lock;
>  	unsigned long irq_mask;
>  	const struct dpu_intr_reg *intr_set;
>  
> -	struct dpu_hw_intr_entry irq_tbl[];
> +	struct dpu_hw_intr_entry irq_tbl[DPU_NUM_IRQS];
>  };
>  
>  /**
> -- 
> 2.39.2
> 
