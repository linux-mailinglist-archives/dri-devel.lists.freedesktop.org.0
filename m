Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 476C4768110
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 20:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF2710E104;
	Sat, 29 Jul 2023 18:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD9710E104
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:43:57 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BA3B83F297;
 Sat, 29 Jul 2023 20:43:55 +0200 (CEST)
Date: Sat, 29 Jul 2023 20:43:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/6] drm/msm/dpu: extract dpu_core_irq_is_valid() helper
Message-ID: <wmuv2uq3c5tocnjaedohzixoirii5pgr4bvkjwlciuxbopnob7@na6jn26majn4>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
 <20230728233200.151735-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728233200.151735-3-dmitry.baryshkov@linaro.org>
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

On 2023-07-29 02:31:56, Dmitry Baryshkov wrote:
> In preparation to reworking the IRQ indices, move irq_idx validation to
> the separate helper.

Nit: "the" sounds as if "separate helper" is a thing that already
exists, where you just moved it to.  Instead, you created a new helper
that now contains the validation that was open-coded before.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

For the contents though:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 01a9ccfcd54b..81d03b6c67d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -200,6 +200,12 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>  #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
>  #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
>  
> +static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
> +					 int irq_idx)
> +{
> +	return irq_idx >= 0 && irq_idx < intr->total_irqs;
> +}
> +
>  /**
>   * dpu_core_irq_callback_handler - dispatch core interrupts
>   * @dpu_kms:		Pointer to DPU's KMS structure
> @@ -291,7 +297,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  	if (!intr)
>  		return -EINVAL;
>  
> -	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -344,7 +350,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  	if (!intr)
>  		return -EINVAL;
>  
> -	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -429,13 +435,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>  	if (!intr)
>  		return 0;
>  
> -	if (irq_idx < 0) {
> -		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
> -				__builtin_return_address(0), irq_idx);
> -		return 0;
> -	}
> -
> -	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return 0;
>  	}
> @@ -518,7 +518,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  		return -EINVAL;
>  	}
>  
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
>  		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -555,7 +555,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  	unsigned long irq_flags;
>  	int ret;
>  
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
>  		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> -- 
> 2.39.2
> 
