Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F153EF879
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 05:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777666E328;
	Wed, 18 Aug 2021 03:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8F66E328
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 03:20:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629256859; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2Y8JJnX0f/Cvls+gX3yruMUlgUdggwAmcVKJQMTdYSY=;
 b=kYo4YpWft0oeQ5J0fkSBoWrgT5HRSE7LZzCl2h12IkcDQEu0enKqetCCf5qH1achWA4lAG2e
 +sRv9jgVTDfV+7sfjHypkiXHir9K+Gl6odWDFyrJ0x1PjKhePTGpR3FJNhpLrDLPjLsklbxr
 ab6zQYSwCYRDjcstL0v9MUp/ZYQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 611c7c84b3873958f556132b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Aug 2021 03:20:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 735F2C43619; Wed, 18 Aug 2021 03:20:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F049C4338F;
 Wed, 18 Aug 2021 03:20:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 17 Aug 2021 20:20:33 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm/dpu: merge struct dpu_irq into
 struct dpu_hw_intr
In-Reply-To: <20210617222029.463045-4-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
 <20210617222029.463045-4-dmitry.baryshkov@linaro.org>
Message-ID: <508aae25987b222c2de724e5d3f9bbd0@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-17 15:20, Dmitry Baryshkov wrote:
> As dpu_core_irq was merged into dpu_hw_intr, merge data structures too,
> removing the need for a separate data structure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 51 +++++++++----------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  5 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       | 13 -----
>  3 files changed, 28 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 28e9b0d448db..d2b6dca487e3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -127,20 +127,19 @@ static const struct dpu_intr_reg dpu_intr_set[] = 
> {
>   */
>  static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int 
> irq_idx)
>  {
> -	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
>  	struct dpu_irq_callback *cb;
> 
>  	VERB("irq_idx=%d\n", irq_idx);
> 
> -	if (list_empty(&irq_obj->irq_cb_tbl[irq_idx]))
> +	if (list_empty(&dpu_kms->hw_intr->irq_cb_tbl[irq_idx]))
>  		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
> 
> -	atomic_inc(&irq_obj->irq_counts[irq_idx]);
> +	atomic_inc(&dpu_kms->hw_intr->irq_counts[irq_idx]);
> 
>  	/*
>  	 * Perform registered function callback
>  	 */
> -	list_for_each_entry(cb, &irq_obj->irq_cb_tbl[irq_idx], list)
> +	list_for_each_entry(cb, &dpu_kms->hw_intr->irq_cb_tbl[irq_idx], list)
>  		if (cb->func)
>  			cb->func(cb->arg, irq_idx);
>  }
> @@ -420,6 +419,10 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
>  {
>  	if (intr) {
>  		kfree(intr->cache_irq_mask);
> +
> +		kfree(intr->irq_cb_tbl);
> +		kfree(intr->irq_counts);
> +
>  		kfree(intr);
>  	}
>  }
> @@ -429,7 +432,7 @@ int dpu_core_irq_register_callback(struct dpu_kms
> *dpu_kms, int irq_idx,
>  {
>  	unsigned long irq_flags;
> 
> -	if (!dpu_kms->irq_obj.irq_cb_tbl) {
> +	if (!dpu_kms->hw_intr->irq_cb_tbl) {
>  		DPU_ERROR("invalid params\n");
>  		return -EINVAL;
>  	}
> @@ -453,9 +456,9 @@ int dpu_core_irq_register_callback(struct dpu_kms
> *dpu_kms, int irq_idx,
>  	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
>  	list_del_init(&register_irq_cb->list);
>  	list_add_tail(&register_irq_cb->list,
> -			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
> +			&dpu_kms->hw_intr->irq_cb_tbl[irq_idx]);
>  	if (list_is_first(&register_irq_cb->list,
> -			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
> +			&dpu_kms->hw_intr->irq_cb_tbl[irq_idx])) {
>  		int ret = dpu_hw_intr_enable_irq_locked(
>  				dpu_kms->hw_intr,
>  				irq_idx);
> @@ -473,7 +476,7 @@ int dpu_core_irq_unregister_callback(struct
> dpu_kms *dpu_kms, int irq_idx,
>  {
>  	unsigned long irq_flags;
> 
> -	if (!dpu_kms->irq_obj.irq_cb_tbl) {
> +	if (!dpu_kms->hw_intr->irq_cb_tbl) {
>  		DPU_ERROR("invalid params\n");
>  		return -EINVAL;
>  	}
> @@ -497,7 +500,7 @@ int dpu_core_irq_unregister_callback(struct
> dpu_kms *dpu_kms, int irq_idx,
>  	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
>  	list_del_init(&register_irq_cb->list);
>  	/* empty callback list but interrupt is still enabled */
> -	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
> +	if (list_empty(&dpu_kms->hw_intr->irq_cb_tbl[irq_idx])) {
>  		int ret = dpu_hw_intr_disable_irq_locked(
>  				dpu_kms->hw_intr,
>  				irq_idx);
> @@ -515,19 +518,18 @@ int dpu_core_irq_unregister_callback(struct
> dpu_kms *dpu_kms, int irq_idx,
>  static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
>  {
>  	struct dpu_kms *dpu_kms = s->private;
> -	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
>  	struct dpu_irq_callback *cb;
>  	unsigned long irq_flags;
>  	int i, irq_count, cb_count;
> 
> -	if (WARN_ON(!irq_obj->irq_cb_tbl))
> +	if (WARN_ON(!dpu_kms->hw_intr->irq_cb_tbl))
>  		return 0;
> 
> -	for (i = 0; i < irq_obj->total_irqs; i++) {
> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
>  		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  		cb_count = 0;
> -		irq_count = atomic_read(&irq_obj->irq_counts[i]);
> -		list_for_each_entry(cb, &irq_obj->irq_cb_tbl[i], list)
> +		irq_count = atomic_read(&dpu_kms->hw_intr->irq_counts[i]);
> +		list_for_each_entry(cb, &dpu_kms->hw_intr->irq_cb_tbl[i], list)
>  			cb_count++;
>  		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> 
> @@ -559,14 +561,13 @@ void dpu_core_irq_preinstall(struct dpu_kms 
> *dpu_kms)
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> 
>  	/* Create irq callbacks for all possible irq_idx */
> -	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
> -	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
> +	dpu_kms->hw_intr->irq_cb_tbl = kcalloc(dpu_kms->hw_intr->total_irqs,
>  			sizeof(struct list_head), GFP_KERNEL);
> -	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
> +	dpu_kms->hw_intr->irq_counts = kcalloc(dpu_kms->hw_intr->total_irqs,
>  			sizeof(atomic_t), GFP_KERNEL);
> -	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
> -		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
> -		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> +		INIT_LIST_HEAD(&dpu_kms->hw_intr->irq_cb_tbl[i]);
> +		atomic_set(&dpu_kms->hw_intr->irq_counts[i], 0);
>  	}
>  }
> 
> @@ -575,17 +576,11 @@ void dpu_core_irq_uninstall(struct dpu_kms 
> *dpu_kms)
>  	int i;
> 
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++)
> -		if (!list_empty(&dpu_kms->irq_obj.irq_cb_tbl[i]))
> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> +		if (!list_empty(&dpu_kms->hw_intr->irq_cb_tbl[i]))
>  			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> 
>  	dpu_clear_irqs(dpu_kms);
>  	dpu_disable_all_irqs(dpu_kms);
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> -
> -	kfree(dpu_kms->irq_obj.irq_cb_tbl);
> -	kfree(dpu_kms->irq_obj.irq_counts);
> -	dpu_kms->irq_obj.irq_cb_tbl = NULL;
> -	dpu_kms->irq_obj.irq_counts = NULL;
> -	dpu_kms->irq_obj.total_irqs = 0;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 99ab01f54aa6..d50e78c9f148 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -40,6 +40,8 @@ enum dpu_hw_intr_reg {
>   * @save_irq_status:  array of IRQ status reg storage created during 
> init
>   * @total_irqs: total number of irq_idx mapped in the hw_interrupts
>   * @irq_lock:         spinlock for accessing IRQ resources
> + * @irq_cb_tbl:       array of IRQ callbacks lists
> + * @irq_counts:       array of IRQ counts
>   */
>  struct dpu_hw_intr {
>  	struct dpu_hw_blk_reg_map hw;
> @@ -48,6 +50,9 @@ struct dpu_hw_intr {
>  	u32 total_irqs;
>  	spinlock_t irq_lock;
>  	unsigned long irq_mask;
> +
> +	struct list_head *irq_cb_tbl;
> +	atomic_t *irq_counts;
>  };
> 
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 323a6bce9e64..775bcbda860f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -78,18 +78,6 @@ struct dpu_irq_callback {
>  	void *arg;
>  };
> 
> -/**
> - * struct dpu_irq: IRQ structure contains callback registration info
> - * @total_irq:    total number of irq_idx obtained from HW interrupts 
> mapping
> - * @irq_cb_tbl:   array of IRQ callbacks setting
> - * @debugfs_file: debugfs file for irq statistics
> - */
> -struct dpu_irq {
> -	u32 total_irqs;
> -	struct list_head *irq_cb_tbl;
> -	atomic_t *irq_counts;
> -};
> -
>  struct dpu_kms {
>  	struct msm_kms base;
>  	struct drm_device *dev;
> @@ -104,7 +92,6 @@ struct dpu_kms {
>  	struct regulator *venus;
> 
>  	struct dpu_hw_intr *hw_intr;
> -	struct dpu_irq irq_obj;
> 
>  	struct dpu_core_perf perf;
