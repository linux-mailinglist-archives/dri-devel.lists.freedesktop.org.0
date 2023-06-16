Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F1733CAD
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 00:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AAA10E145;
	Fri, 16 Jun 2023 22:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABE110E145
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 22:59:24 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 82E07214E1;
 Sat, 17 Jun 2023 00:59:22 +0200 (CEST)
Date: Sat, 17 Jun 2023 00:59:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 13/19] drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2
 macros
Message-ID: <hqeaevuzndrls2ypnmpcxtvnitzcyh4lmse5c2hbu3kotjupzf@245vvhk74pes>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-14-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-14-dmitry.baryshkov@linaro.org>
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

On 2023-06-16 13:03:11, Dmitry Baryshkov wrote:
> To simplify making changes to the hardware block definitions, expand
> corresponding macros. This way making all the changes are more obvious
> and visible in the source files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 11 +++++-
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 17 +++++++--
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 21 +++++++++--
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 31 +++++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 21 +++++++++--
>  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  6 ++-
>  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  6 ++-
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 25 +++++++++++--
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +++-
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 37 ++++++++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 25 +++++++++++--
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 25 +++++++++++--
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 15 --------
>  13 files changed, 191 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index a07c68744b29..7c3da4033c46 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -200,8 +200,15 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>  };
>  
>  static const struct dpu_dsc_cfg msm8998_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,

This length (here and for all other DSC v1.1 blocks) was 0x140, why is
it 0x1800 now?

> +		.features = 0,
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +		.features = 0,

Seems you forgot to drop the zero features from MSM8998 :)

- Marijn

> +	},
>  };
>  
>  static const struct dpu_dspp_cfg msm8998_dspp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 786263ed1ef2..ca3bb6a1a93a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -224,10 +224,19 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sdm845_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +	}, {
> +		.name = "dsc_2", .id = DSC_2,
> +		.base = 0x80800, .len = 0x1800,
> +	}, {
> +		.name = "dsc_3", .id = DSC_3,
> +		.base = 0x80c00, .len = 0x1800,
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sdm845_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 6b9bfeac6e0a..5b068521de13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sm8150_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_2", .id = DSC_2,
> +		.base = 0x80800, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_3", .id = DSC_3,
> +		.base = 0x80c00, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm8150_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 414f0db3306c..ba5420f334ec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -244,12 +244,31 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sc8180x_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_2", .id = DSC_2,
> +		.base = 0x80800, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_3", .id = DSC_3,
> +		.base = 0x80c00, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_4", .id = DSC_4,
> +		.base = 0x81000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_5", .id = DSC_5,
> +		.base = 0x81400, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index db3a65b011ca..01b61467a700 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sm8250_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_1", .id = DSC_1,
> +		.base = 0x80400, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_2", .id = DSC_2,
> +		.base = 0x80800, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	}, {
> +		.name = "dsc_3", .id = DSC_3,
> +		.base = 0x80c00, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm8250_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index a996c39b7b1f..a9907010a4a2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -136,7 +136,11 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sm6350_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm6350_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 0cdb77599583..e42f0dc3b2ab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -90,7 +90,11 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
>  };
>  
>  static const struct dpu_dsc_cfg sm6375_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	{
> +		.name = "dsc_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x1800,
> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm6375_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index e08b29e9e146..8a9bfc4af72a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -248,10 +248,27 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>   * its own different sub block address.
>   */
>  static const struct dpu_dsc_cfg sm8350_dsc[] = {
> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
> +	{
> +		.name = "dce_0_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_0_1", .id = DSC_1,
> +		.base = 0x80000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_1,
> +	}, {
> +		.name = "dce_1_0", .id = DSC_2,
> +		.base = 0x81000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_1_1", .id = DSC_3,
> +		.base = 0x81000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_1,
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm8350_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index d5faa1816cb3..9c0beccce282 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -146,7 +146,12 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>  
>  /* NOTE: sc7280 only has one DSC hard slice encoder */
>  static const struct dpu_dsc_cfg sc7280_dsc[] = {
> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> +	{
> +		.name = "dce_0_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_0,
> +	},
>  };
>  
>  static const struct dpu_wb_cfg sc7280_wb[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 8e4299be2b1c..b676819db42c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -246,12 +246,37 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>   * its own different sub block address.
>   */
>  static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
> -	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
> -	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
> +	{
> +		.name = "dce_0_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_0_1", .id = DSC_1,
> +		.base = 0x80000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_1,
> +	}, {
> +		.name = "dce_1_0", .id = DSC_2,
> +		.base = 0x81000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_1_1", .id = DSC_3,
> +		.base = 0x81000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_1,
> +	}, {
> +		.name = "dce_2_0", .id = DSC_4,
> +		.base = 0x82000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_2_1", .id = DSC_5,
> +		.base = 0x82000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_1,
> +	},
>  };
>  
>  /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index bbee3c621943..568523abc1d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -259,10 +259,27 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>   * its own different sub block address.
>   */
>  static const struct dpu_dsc_cfg sm8450_dsc[] = {
> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
> +	{
> +		.name = "dce_0_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_0_1", .id = DSC_1,
> +		.base = 0x80000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_1,
> +	}, {
> +		.name = "dce_1_0", .id = DSC_2,
> +		.base = 0x81000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_1_1", .id = DSC_3,
> +		.base = 0x81000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_1,
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm8450_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index ea7bffe252a5..419624948e83 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -273,10 +273,27 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>   * its own different sub block address.
>   */
>  static const struct dpu_dsc_cfg sm8550_dsc[] = {
> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
> +	{
> +		.name = "dce_0_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_0_1", .id = DSC_1,
> +		.base = 0x80000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2),
> +		.sblk = &dsc_sblk_1,
> +	}, {
> +		.name = "dce_1_0", .id = DSC_2,
> +		.base = 0x81000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_0,
> +	}, {
> +		.name = "dce_1_1", .id = DSC_3,
> +		.base = 0x81000, .len = 0x29c,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &dsc_sblk_1,
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm8550_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6ef0dc2e1a5d..ee24402bf253 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -495,21 +495,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>  	.ctl = {.base = 0xF80, .len = 0x10},
>  };
>  
> -#define DSC_BLK(_name, _id, _base, _features) \
> -	{\
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = 0x140, \
> -	.features = _features, \
> -	}
> -
> -#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
> -	{\
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = _len, \
> -	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
> -	.sblk = &_sblk, \
> -	}
> -
>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> -- 
> 2.39.2
> 
