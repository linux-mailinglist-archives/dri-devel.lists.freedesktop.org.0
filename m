Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E438F517
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 23:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CB86E969;
	Mon, 24 May 2021 21:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18B6E964
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:44:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621892691; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lJgwKVH+P2CafyD6xx5EBwcbYFRUzkQYJ1dFn5hnRBI=;
 b=wpzuarMdxWkDHKUEAMkMuxPXghjEgiNwF2YpWgpxxJmAFdRcbd1I64OHvIyED4vohZ7iAO7Q
 RAALbx2QdDtyZZTdSPKC0/pEETAAeIG2wWopPxvsttvINotCuu4W+Z6IN8Xp8b6HZ3gj3Ebq
 wiA/ksM5RfbKp4IRKm4yXE/27VE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60ac1e462bff04e53b72a17f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 21:44:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6C201C43217; Mon, 24 May 2021 21:44:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 79293C433F1;
 Mon, 24 May 2021 21:44:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 24 May 2021 14:44:36 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 1/6] drm/msm/dpu: merge
 dpu_hw_intr_get_interrupt_statuses into dpu_hw_intr_dispatch_irqs
In-Reply-To: <20210516202910.2141079-2-dmitry.baryshkov@linaro.org>
References: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
 <20210516202910.2141079-2-dmitry.baryshkov@linaro.org>
Message-ID: <022c3f4cd7a51e842a3bf18ed824d14b@codeaurora.org>
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
> There is little sense in reading interrupt statuses and right after 
> that
> going after the array of statuses to dispatch them. Merge both loops
> into single function doing read and dispatch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 10 +--
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 66 ++++++-------------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  8 ---
>  3 files changed, 20 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> index cdec3fbe6ff4..54b34746a587 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> @@ -376,15 +376,6 @@ void dpu_core_irq_uninstall(struct dpu_kms 
> *dpu_kms)
> 
>  irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
>  {
> -	/*
> -	 * Read interrupt status from all sources. Interrupt status are
> -	 * stored within hw_intr.
> -	 * Function will also clear the interrupt status after reading.
> -	 * Individual interrupt status bit will only get stored if it
> -	 * is enabled.
> -	 */
> -	dpu_kms->hw_intr->ops.get_interrupt_statuses(dpu_kms->hw_intr);
> -
>  	/*
>  	 * Dispatch to HW driver to handle interrupt lookup that is being
>  	 * fired. When matching interrupt is located, HW driver will call to
> @@ -392,6 +383,7 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
>  	 * dpu_core_irq_callback_handler will perform the registered function
>  	 * callback, and do the interrupt status clearing once the registered
>  	 * callback is finished.
> +	 * Function will also clear the interrupt status after reading.
>  	 */
>  	dpu_kms->hw_intr->ops.dispatch_irqs(
>  			dpu_kms->hw_intr,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 48c96b812126..cf9bfd45aa59 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -1371,6 +1371,7 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  	int start_idx;
>  	int end_idx;
>  	u32 irq_status;
> +	u32 enable_mask;
>  	unsigned long irq_flags;
> 
>  	if (!intr)
> @@ -1383,8 +1384,6 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  	 */
>  	spin_lock_irqsave(&intr->irq_lock, irq_flags);
>  	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
> -		irq_status = intr->save_irq_status[reg_idx];
> -
>  		/*
>  		 * Each Interrupt register has a range of 64 indexes, and
>  		 * that is static for dpu_irq_map.
> @@ -1396,6 +1395,20 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  			start_idx >= ARRAY_SIZE(dpu_irq_map))
>  			continue;
> 
> +		/* Read interrupt status */
> +		irq_status = DPU_REG_READ(&intr->hw, 
> dpu_intr_set[reg_idx].status_off);
> +
> +		/* Read enable mask */
> +		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].en_off);
> +
> +		/* and clear the interrupt */
> +		if (irq_status)
> +			DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> +				     irq_status);
> +
> +		/* Finally update IRQ status based on enable mask */
> +		irq_status &= enable_mask;
> +
>  		/*
>  		 * Search through matching intr status from irq map.
>  		 * start_idx and end_idx defined the search range in
> @@ -1429,6 +1442,10 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  				irq_status &= ~dpu_irq_map[irq_idx].irq_mask;
>  			}
>  	}
> +
> +	/* ensure register writes go through */
> +	wmb();
> +
>  	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
>  }
> 
> @@ -1580,41 +1597,6 @@ static int dpu_hw_intr_disable_irqs(struct
> dpu_hw_intr *intr)
>  	return 0;
>  }
> 
> -static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr 
> *intr)
> -{
> -	int i;
> -	u32 enable_mask;
> -	unsigned long irq_flags;
> -
> -	if (!intr)
> -		return;
> -
> -	spin_lock_irqsave(&intr->irq_lock, irq_flags);
> -	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
> -		if (!test_bit(i, &intr->irq_mask))
> -			continue;
> -
> -		/* Read interrupt status */
> -		intr->save_irq_status[i] = DPU_REG_READ(&intr->hw,
> -				dpu_intr_set[i].status_off);
> -
> -		/* Read enable mask */
> -		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[i].en_off);
> -
> -		/* and clear the interrupt */
> -		if (intr->save_irq_status[i])
> -			DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].clr_off,
> -					intr->save_irq_status[i]);
> -
> -		/* Finally update IRQ status based on enable mask */
> -		intr->save_irq_status[i] &= enable_mask;
> -	}
> -
> -	/* ensure register writes go through */
> -	wmb();
> -
> -	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
> -}
> 
>  static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr 
> *intr,
>  		int irq_idx)
> @@ -1673,7 +1655,6 @@ static void __setup_intr_ops(struct 
> dpu_hw_intr_ops *ops)
>  	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
>  	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
>  	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
> -	ops->get_interrupt_statuses = dpu_hw_intr_get_interrupt_statuses;
>  	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
>  	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
>  }
> @@ -1710,14 +1691,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void 
> __iomem *addr,
>  		return ERR_PTR(-ENOMEM);
>  	}
> 
> -	intr->save_irq_status = kcalloc(ARRAY_SIZE(dpu_intr_set), 
> sizeof(u32),
> -			GFP_KERNEL);
> -	if (intr->save_irq_status == NULL) {
> -		kfree(intr->cache_irq_mask);
> -		kfree(intr);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
>  	intr->irq_mask = m->mdss_irqs;
>  	intr->obsolete_irq = m->obsolete_irq;
> 
> @@ -1730,7 +1703,6 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr 
> *intr)
>  {
>  	if (intr) {
>  		kfree(intr->cache_irq_mask);
> -		kfree(intr->save_irq_status);
>  		kfree(intr);
>  	}
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 5d6f9a7a5195..5a1c304ba93f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -142,14 +142,6 @@ struct dpu_hw_intr_ops {
>  			void (*cbfunc)(void *arg, int irq_idx),
>  			void *arg);
> 
> -	/**
> -	 * get_interrupt_statuses - Gets and store value from all interrupt
> -	 *                          status registers that are currently 
> fired.
> -	 * @intr:	HW interrupt handle
> -	 */
> -	void (*get_interrupt_statuses)(
> -			struct dpu_hw_intr *intr);
> -
>  	/**
>  	 * clear_intr_status_nolock() - clears the HW interrupts without lock
>  	 * @intr:	HW interrupt handle
