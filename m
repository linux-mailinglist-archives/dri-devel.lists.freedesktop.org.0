Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7473229E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 00:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C298410E55F;
	Thu, 15 Jun 2023 22:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78D810E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 22:19:39 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1C44220A8B;
 Fri, 16 Jun 2023 00:19:37 +0200 (CEST)
Date: Fri, 16 Jun 2023 00:19:35 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 01/22] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG
 done interrupts
Message-ID: <sjbbl5gp3ecs5e33tv5lsu4j42mojp7eaoe7xohmxe3snfkerm@z53wfuz46vgh>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613001004.3426676-2-dmitry.baryshkov@linaro.org>
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

On 2023-06-13 03:09:40, Dmitry Baryshkov wrote:
> During IRQ conversion we have lost the PP_DONE interrupts for sc7280
> platform. This was left unnoticed, because this interrupt is only used
> for CMD outputs and probably no sc7[12]80 systems use DSI CMD panels.
> 
> Fixes: 667e9985ee24 ("drm/msm/dpu: replace IRQ lookup with the data in hw catalog")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Agreed.  I never really understood why these were missing, as if there
was no cmd-mode support.  The code prior to the Fixes: commit was indeed
returning interrupts without looking at hardware support at all.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++++--
>  .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 16 ++++++++++++----
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 0b05da2592c0..67566b07195a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -80,8 +80,12 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc7180_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			-1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			-1),
>  };
>  
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 9c5a3fe9cfde..6ea1cb551348 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -88,10 +88,18 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc7280_pp[] = {
> -	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			-1),
> +	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			-1),
> +	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			-1),
> +	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			-1),
>  };
>  
>  static const struct dpu_wb_cfg sc7280_wb[] = {
> -- 
> 2.39.2
> 
