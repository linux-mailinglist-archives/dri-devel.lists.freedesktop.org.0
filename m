Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4CD892CDF
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29BB10E410;
	Sat, 30 Mar 2024 20:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBCF10E9D2;
 Sat, 30 Mar 2024 20:07:46 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 265153F61D;
 Sat, 30 Mar 2024 21:07:43 +0100 (CET)
Date: Sat, 30 Mar 2024 21:07:40 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: make error messages at
 dpu_core_irq_register_callback() more sensible
Message-ID: <6ysok4lmub3xuyjwbc32lsecmurfvaciv7bekxrjefdzmv4mrt@sei6yxukozca>
References: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
 <dosvghhvlrmmrdvd5malknbgdel6vlclvozkqcdvbmjnaw2yze@vr4pqvu3mudb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dosvghhvlrmmrdvd5malknbgdel6vlclvozkqcdvbmjnaw2yze@vr4pqvu3mudb>
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

On 2024-03-30 11:31:37, Marijn Suijten wrote:
> On 2024-03-30 05:53:22, Dmitry Baryshkov wrote:
> > There is little point in using %ps to print a value known to be NULL. On
> > the other hand it makes sense to print the callback symbol in the
> > 'invalid IRQ' message. Correct those two error messages to make more
> > sense.
> > 
> > Fixes: 6893199183f8 ("drm/msm/dpu: stop using raw IRQ indices in the kernel output")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Agreed, this is a lot more clear:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Note that, as seen in [1], there are still a few codepaths that only print
"invalid IRQ" without any additional context (if we could even add it - __func__
might be a good start) and inconsistently use DPU_ERROR vs pr_err too :/

Any possibility to address that?

- Marijn

[1]: https://lore.kernel.org/linux-arm-msm/mxwrvnqth5f2vd4m55ryzqgyj7brykiqynzldelanxkuj2zny3@4pqi6p57c2q2/

> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index 946dd0135dff..6a0a74832fb6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -525,14 +525,14 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
> >  	int ret;
> >  
> >  	if (!irq_cb) {
> > -		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
> > -			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
> > +		DPU_ERROR("IRQ=[%d, %d] NULL callback\n",
> > +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >  		return -EINVAL;
> >  	}
> >  
> >  	if (!dpu_core_irq_is_valid(irq_idx)) {
> > -		DPU_ERROR("invalid IRQ=[%d, %d]\n",
> > -			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> > +		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
> > +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
> >  		return -EINVAL;
> >  	}
> >  
> > 
> > ---
> > base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
> > change-id: 20240330-dpu-irq-messages-5cf13fd7568c
> > 
> > Best regards,
> > -- 
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
