Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952ED70CD0F
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D830510E16B;
	Mon, 22 May 2023 21:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E5410E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 21:57:59 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9EA0B3F094;
 Mon, 22 May 2023 23:57:57 +0200 (CEST)
Date: Mon, 22 May 2023 23:57:56 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/6] drm/msm/dpu: inline __intr_offset
Message-ID: <yrsznvh3iduylo6e44dswgmxfqaa2oqeotbcs2ut4ce3txy5ch@n7qugbshmgbh>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522214527.190054-3-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-23 00:45:23, Dmitry Baryshkov wrote:
> Inline __intr_offset(), there is no point in having a separate oneline
> function for setting base block address.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 5e2d68ebb113..0776b0f6df4f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -435,12 +435,6 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>  	return intr_status;
>  }
>  
> -static void __intr_offset(const struct dpu_mdss_cfg *m,
> -		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
> -{
> -	hw->blk_addr = addr + m->mdp[0].base;
> -}
> -
>  struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  		const struct dpu_mdss_cfg *m)
>  {
> @@ -454,7 +448,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  	if (!intr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	__intr_offset(m, addr, &intr->hw);
> +	intr->hw.blk_addr = addr + m->mdp[0].base;
>  
>  	intr->total_irqs = nirq;
>  

We could also drop the two newlines here and make these member
assignments sit clearly/tightly together.

- Marijn

> -- 
> 2.39.2
> 
