Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F8D771663
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 20:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D2B10E0FD;
	Sun,  6 Aug 2023 18:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA0510E0FD
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 18:04:38 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 40D971F533;
 Sun,  6 Aug 2023 20:04:36 +0200 (CEST)
Date: Sun, 6 Aug 2023 20:04:33 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 1/8] drm/msm/dpu: fix the irq index in
 dpu_encoder_phys_wb_wait_for_commit_done
Message-ID: <ydpbdzuesywyhvdp4te4xyzzb3blykbfftkuieqjtr5ujjtlwx@rhmxsmfnbbwz>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
 <20230802100426.4184892-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802100426.4184892-2-dmitry.baryshkov@linaro.org>
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

On 2023-08-02 13:04:19, Dmitry Baryshkov wrote:
> Since commit 1e7ac595fa46 ("drm/msm/dpu: pass irq to
> dpu_encoder_helper_wait_for_irq()") the
> dpu_encoder_phys_wb_wait_for_commit_done expects the IRQ index rather
> than the IRQ index in phys_enc->intr table, however writeback got the
> older invocation in place. This was unnoticed for several releases, but
> now it's time to fix it.
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index a466ff70a4d6..78037a697633 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -446,7 +446,8 @@ static int dpu_encoder_phys_wb_wait_for_commit_done(
>  	wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
>  	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
>  
> -	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_WB_DONE,
> +	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
> +			phys_enc->irq[INTR_IDX_WB_DONE],
>  			dpu_encoder_phys_wb_done_irq, &wait_info);
>  	if (ret == -ETIMEDOUT)
>  		_dpu_encoder_phys_wb_handle_wbdone_timeout(phys_enc);
> -- 
> 2.39.2
> 
