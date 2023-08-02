Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769476D823
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 21:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A33610E11B;
	Wed,  2 Aug 2023 19:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA1110E11B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 19:47:23 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BCE6C3F20C;
 Wed,  2 Aug 2023 21:47:21 +0200 (CEST)
Date: Wed, 2 Aug 2023 21:47:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Message-ID: <z7jhbgeng6ded4nzrn5khu6pzbrsfcibulzzt5huujm6m3nk3y@kmhk6wfoe3h2>
References: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802183655.4188640-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Ryan McCann <quic_rmccann@quicinc.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-02 21:36:54, Dmitry Baryshkov wrote:
> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
> This includes the common block itself, enc subblocks and some empty
> space around. Change that to pass 0x4 instead, the length of common
> register block itself.
> 
> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
> Reported-by: Ryan McCann <quic_rmccann@quicinc.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
> 
> Changes since v1:
>  - Rebased on top of the catalog changes
> 
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  8 ++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 ++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 ++++----
>  5 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index c906b6864b5e..f8d16f9bf528 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -283,22 +283,22 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>  static const struct dpu_dsc_cfg sm8350_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_0_1", .id = DSC_1,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_1_0", .id = DSC_2,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_1_1", .id = DSC_3,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_1,
>  	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 2bf9f34e54c6..3b5061c4402a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -163,7 +163,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>  static const struct dpu_dsc_cfg sc7280_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index ccd0477f4877..58f5e25679b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -286,32 +286,32 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>  static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_0_1", .id = DSC_1,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_1_0", .id = DSC_2,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_1_1", .id = DSC_3,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_2_0", .id = DSC_4,
> -		.base = 0x82000, .len = 0x29c,
> +		.base = 0x82000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_2_1", .id = DSC_5,
> -		.base = 0x82000, .len = 0x29c,
> +		.base = 0x82000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 2b2e9d4800f8..1b12178dfbca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -305,22 +305,22 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>  static const struct dpu_dsc_cfg sm8450_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_0_1", .id = DSC_1,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_1_0", .id = DSC_2,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_1_1", .id = DSC_3,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_1,
>  	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 833be1167499..f2ab02d04440 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -320,22 +320,22 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>  static const struct dpu_dsc_cfg sm8550_dsc[] = {
>  	{
>  		.name = "dce_0_0", .id = DSC_0,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_0_1", .id = DSC_1,
> -		.base = 0x80000, .len = 0x29c,
> +		.base = 0x80000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2),
>  		.sblk = &dsc_sblk_1,
>  	}, {
>  		.name = "dce_1_0", .id = DSC_2,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_0,
>  	}, {
>  		.name = "dce_1_1", .id = DSC_3,
> -		.base = 0x81000, .len = 0x29c,
> +		.base = 0x81000, .len = 0x4,
>  		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>  		.sblk = &dsc_sblk_1,
>  	},
> -- 
> 2.39.2
> 
