Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A4768140
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AEC10E213;
	Sat, 29 Jul 2023 19:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD5310E213
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:11:00 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6D2553F28C;
 Sat, 29 Jul 2023 21:10:58 +0200 (CEST)
Date: Sat, 29 Jul 2023 21:10:57 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 5/6] drm/msm/dpu: stop using raw IRQ indices in the
 kernel output
Message-ID: <g4kcpmeixi4yqbtazngyombrlgoz73zrnozjol6ke3h7q2x3w3@uoxosls3ouxu>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
 <20230728233200.151735-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728233200.151735-6-dmitry.baryshkov@linaro.org>
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

On 2023-07-29 02:31:59, Dmitry Baryshkov wrote:
> In preparation to reworking IRQ indcies, stop using raw indices in
> kernel output (both printk and debugfs). Instead use a pair of register
> index and bit. This corresponds closer to the values in HW catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 49 ++++++++++++-------
>  1 file changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 308b122059cd..6071d3f05b0c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -199,6 +199,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>  
>  #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
>  #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
> +#define DPU_IRQ_BIT(irq_idx)	(ffs(DPU_IRQ_MASK(irq_idx)) - 1)

Another nit: I'd find it clearer to define DPU_IRQ_MASK in terms of
DPU_IRQ_BIT[_INDEX...] than the other way around, because this is just
irq_idx%32.

- Marijn
