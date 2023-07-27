Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD106765D08
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 22:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD96010E5F6;
	Thu, 27 Jul 2023 20:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EB510E5F6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 20:14:41 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E5BE2202E7;
 Thu, 27 Jul 2023 22:14:39 +0200 (CEST)
Date: Thu, 27 Jul 2023 22:14:38 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 5/7] drm/msm/dpu: drop DPU_INTF_TE feature flag
Message-ID: <bndyttm2ytf7bz2cdok4ewnd7vpv75ud4eqialpleihjs6ahr2@6ehcv3zjpkky>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727162104.1497483-6-dmitry.baryshkov@linaro.org>
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

On 2023-07-27 19:21:02, Dmitry Baryshkov wrote:
> Replace the only user of the DPU_INTF_TE feature flag with the direct
> DPU version comparison.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
>  3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 9589fe719452..60d4dd88725e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -776,8 +776,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>  	phys_enc->intf_mode = INTF_MODE_CMD;
>  	cmd_enc->stream_sel = 0;
>  
> -	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
> -					 &phys_enc->hw_intf->cap->features);
> +	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
> +		phys_enc->has_intf_te = true;

We could also check if the INTF block has the callbacks (which it based
on the presence of the interrupt line in the catalog instead), but then
I think we might loose some extra validation which you tidied up in a
later patch in this series?

>  
>  	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
>  	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index c19dc70d4456..17426f0f981e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -100,7 +100,6 @@
>  
>  #define INTF_SC7180_MASK \
>  	(BIT(DPU_INTF_INPUT_CTRL) | \
> -	 BIT(DPU_INTF_TE) | \
>  	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
>  	 BIT(DPU_DATA_HCTL_EN))
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index a6f8eee58b92..69c9099cf5a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -175,7 +175,6 @@ enum {
>   * INTF sub-blocks
>   * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
>   *                                  pixel data arrives to this INTF
> - * @DPU_INTF_TE                     INTF block has TE configuration support
>   * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
>   *                                  than video timing
>   * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
> @@ -183,7 +182,6 @@ enum {
>   */
>  enum {
>  	DPU_INTF_INPUT_CTRL = 0x1,
> -	DPU_INTF_TE,
>  	DPU_DATA_HCTL_EN,
>  	DPU_INTF_STATUS_SUPPORTED,
>  	DPU_INTF_MAX
> -- 
> 2.39.2
> 
