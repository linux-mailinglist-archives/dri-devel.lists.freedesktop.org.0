Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB883EF865
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 05:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED18B6E314;
	Wed, 18 Aug 2021 03:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DB36E314
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 03:11:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629256281; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=W6ljQtKKhBtKysS8ZErAoZ1I7F5yu9ez4L8hDRonFew=;
 b=mtkWEEuf+0MOBVbgMdFZ7HAUsAt3rC8wV563UMhrHNScZDzjtKlBGb/iFnZSBLp6PA8i8zjm
 bRDGCV8Z+X0eatYRnUT2FvD/N0VV9OZeNY3+hINC4RxIKGvMXSsXLiyUu4IsE1NSsRvihj4s
 kl+n0Y+FBRvSO1ly75RBsSsry0M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 611c7a541a9008a23ee8fc92 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Aug 2021 03:11:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1DA03C43619; Wed, 18 Aug 2021 03:11:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C8E2C4338F;
 Wed, 18 Aug 2021 03:11:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 17 Aug 2021 20:11:15 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 2/7] drm/msm/dpu: don't clear IRQ register
 twice
In-Reply-To: <20210617222029.463045-3-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
 <20210617222029.463045-3-dmitry.baryshkov@linaro.org>
Message-ID: <237ec1051e5091ed300e6ccba9cea246@codeaurora.org>
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
> We already clear the IRQ status register before processing IRQs, so do
> not clear the register again. Especially do not clear the IRQ status
> _after_ processing the IRQ as this way we can loose the event.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c   | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 2437b0c7c073..28e9b0d448db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -120,21 +120,6 @@ static const struct dpu_intr_reg dpu_intr_set[] = 
> {
>  #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
>  #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
> 
> -static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr 
> *intr,
> -		int irq_idx)
> -{
> -	int reg_idx;
> -
> -	if (!intr)
> -		return;
> -
> -	reg_idx = DPU_IRQ_REG(irq_idx);
> -	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> DPU_IRQ_MASK(irq_idx));
> -
> -	/* ensure register writes go through */
> -	wmb();
> -}
> -
>  /**
>   * dpu_core_irq_callback_handler - dispatch core interrupts
>   * @arg:		private data of callback handler
> @@ -203,8 +188,6 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
> 
>  			dpu_core_irq_callback_handler(dpu_kms, irq_idx);
> 
> -			dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
> -
>  			/*
>  			 * When callback finish, clear the irq_status
>  			 * with the matching mask. Once irq_status
