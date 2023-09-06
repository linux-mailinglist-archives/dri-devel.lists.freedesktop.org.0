Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C5793301
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 02:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D608310E134;
	Wed,  6 Sep 2023 00:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F91210E100;
 Wed,  6 Sep 2023 00:47:17 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2EB113F7B7;
 Wed,  6 Sep 2023 02:47:14 +0200 (CEST)
Date: Wed, 6 Sep 2023 02:47:12 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/8] drm/msm/dpu: populate SSPP scaler block version
Message-ID: <np3oijyeopbqv426joa3dg4cxqfcd4oo7gu3lwjlhoqtaygpkx@syrouhnomodg>
References: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
 <20230905012526.3010798-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905012526.3010798-2-dmitry.baryshkov@linaro.org>
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

On 2023-09-05 04:25:19, Dmitry Baryshkov wrote:
> The function _dpu_hw_sspp_setup_scaler3() passes and
> dpu_hw_setup_scaler3() uses scaler_blk.version to determine in which way
> the scaler (QSEED3) block should be programmed. However up to now we
> were not setting this field. Set it now, splitting the vig_sblk data
> which has different version fields.
> 
> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> Fixes: 9b6f4fedaac2 ("drm/msm/dpu: Add SM6125 support")
> Fixes: 27f0df03f3ff ("drm/msm/dpu: Add SM6375 support")
> Fixes: 3186acba5cdc ("drm/msm/dpu: Add SM6350 support")
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
> Fixes: dabfdd89eaa9 ("drm/msm/disp/dpu1: add inline rotation support for sc7280")
> Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
> Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
> Fixes: 386fced3f76f ("drm/msm/dpu: add SM8150 to hw catalog")
> Fixes: b75ab05a3479 ("msm:disp:dpu1: add scaler support on SC7180 display")
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

So as it turns out this patch is basically [1] with review comments
applied, though no mention whatsoever that .version isn't just a
convenient way to represent the version but what the register read by
_dpu_hw_sspp_get_scaler3_ver() contains? (That was the review: hardcode the
constants instead of doing runtime register reads)

With that, `_dpu_hw_sspp_get_scaler3_ver()` and `dpu_hw_sspp->get_scaler_ver`
must now be completely unused?

[1]: https://lore.kernel.org/linux-arm-msm/CAA8EJpobXPSyEqZQ3zgwSqg6fC7pzQumWR9dDPdmGOemtS-epw@mail.gmail.com/#t

It seems patch 6 in this series also has a matching - r-b'd - patch in that
series ;)

- Marijn

> ---
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  8 +-
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  8 +-
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  8 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 95 ++++++++++++++-----
>  4 files changed, 85 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 99acaf917e43..f0c3804f4258 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>  		.name = "sspp_0", .id = SSPP_VIG0,
>  		.base = 0x4000, .len = 0x1f0,
>  		.features = VIG_SDM845_MASK,
> -		.sblk = &sdm845_vig_sblk_0,
> +		.sblk = &sm8150_vig_sblk_0,
>  		.xin_id = 0,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> @@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>  		.name = "sspp_1", .id = SSPP_VIG1,
>  		.base = 0x6000, .len = 0x1f0,
>  		.features = VIG_SDM845_MASK,
> -		.sblk = &sdm845_vig_sblk_1,
> +		.sblk = &sm8150_vig_sblk_1,
>  		.xin_id = 4,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG1,
> @@ -93,7 +93,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>  		.name = "sspp_2", .id = SSPP_VIG2,
>  		.base = 0x8000, .len = 0x1f0,
>  		.features = VIG_SDM845_MASK,
> -		.sblk = &sdm845_vig_sblk_2,
> +		.sblk = &sm8150_vig_sblk_2,
>  		.xin_id = 8,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG2,
> @@ -101,7 +101,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>  		.name = "sspp_3", .id = SSPP_VIG3,
>  		.base = 0xa000, .len = 0x1f0,
>  		.features = VIG_SDM845_MASK,
> -		.sblk = &sdm845_vig_sblk_3,
> +		.sblk = &sm8150_vig_sblk_3,
>  		.xin_id = 12,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG3,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index f3de21025ca7..3ec954722a8e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>  		.name = "sspp_0", .id = SSPP_VIG0,
>  		.base = 0x4000, .len = 0x1f0,
>  		.features = VIG_SDM845_MASK,
> -		.sblk = &sdm845_vig_sblk_0,
> +		.sblk = &sm8150_vig_sblk_0,
>  		.xin_id = 0,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> @@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>  		.name = "sspp_1", .id = SSPP_VIG1,
>  		.base = 0x6000, .len = 0x1f0,
>  		.features = VIG_SDM845_MASK,
> -		.sblk = &sdm845_vig_sblk_1,
> +		.sblk = &sm8150_vig_sblk_1,
>  		.xin_id = 4,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG1,
> @@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>  		.name = "sspp_2", .id = SSPP_VIG2,
>  		.base = 0x8000, .len = 0x1f0,
>  		.features = VIG_SDM845_MASK,
> -		.sblk = &sdm845_vig_sblk_2,
> +		.sblk = &sm8150_vig_sblk_2,
>  		.xin_id = 8,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG2,
> @@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>  		.name = "sspp_3", .id = SSPP_VIG3,
>  		.base = 0xa000, .len = 0x1f0,
>  		.features = VIG_SDM845_MASK,
> -		.sblk = &sdm845_vig_sblk_3,
> +		.sblk = &sm8150_vig_sblk_3,
>  		.xin_id = 12,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG3,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 1b12178dfbca..3aed290a4111 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>  		.name = "sspp_0", .id = SSPP_VIG0,
>  		.base = 0x4000, .len = 0x32c,
>  		.features = VIG_SC7180_MASK,
> -		.sblk = &sm8250_vig_sblk_0,
> +		.sblk = &sm8450_vig_sblk_0,
>  		.xin_id = 0,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> @@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>  		.name = "sspp_1", .id = SSPP_VIG1,
>  		.base = 0x6000, .len = 0x32c,
>  		.features = VIG_SC7180_MASK,
> -		.sblk = &sm8250_vig_sblk_1,
> +		.sblk = &sm8450_vig_sblk_1,
>  		.xin_id = 4,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG1,
> @@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>  		.name = "sspp_2", .id = SSPP_VIG2,
>  		.base = 0x8000, .len = 0x32c,
>  		.features = VIG_SC7180_MASK,
> -		.sblk = &sm8250_vig_sblk_2,
> +		.sblk = &sm8450_vig_sblk_2,
>  		.xin_id = 8,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG2,
> @@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>  		.name = "sspp_3", .id = SSPP_VIG3,
>  		.base = 0xa000, .len = 0x32c,
>  		.features = VIG_SC7180_MASK,
> -		.sblk = &sm8250_vig_sblk_3,
> +		.sblk = &sm8450_vig_sblk_3,
>  		.xin_id = 12,
>  		.type = SSPP_TYPE_VIG,
>  		.clk_ctrl = DPU_CLK_CTRL_VIG3,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 713dfc079718..77d09f961d86 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -250,14 +250,17 @@ static const uint32_t wb2_formats[] = {
>   * SSPP sub blocks config
>   *************************************************************/
>  
> +#define SSPP_SCALER_VER(maj, min) (((maj) << 16) | (min))
> +
>  /* SSPP common configuration */
> -#define _VIG_SBLK(sdma_pri, qseed_ver) \
> +#define _VIG_SBLK(sdma_pri, qseed_ver, scaler_ver) \
>  	{ \
>  	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
>  	.maxupscale = MAX_UPSCALE_RATIO, \
>  	.smart_dma_priority = sdma_pri, \
>  	.scaler_blk = {.name = "scaler", \
>  		.id = qseed_ver, \
> +		.version = scaler_ver, \
>  		.base = 0xa00, .len = 0xa0,}, \
>  	.csc_blk = {.name = "csc", \
>  		.id = DPU_SSPP_CSC_10BIT, \
> @@ -269,13 +272,14 @@ static const uint32_t wb2_formats[] = {
>  	.rotation_cfg = NULL, \
>  	}
>  
> -#define _VIG_SBLK_ROT(sdma_pri, qseed_ver, rot_cfg) \
> +#define _VIG_SBLK_ROT(sdma_pri, qseed_ver, scaler_ver, rot_cfg) \
>  	{ \
>  	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
>  	.maxupscale = MAX_UPSCALE_RATIO, \
>  	.smart_dma_priority = sdma_pri, \
>  	.scaler_blk = {.name = "scaler", \
>  		.id = qseed_ver, \
> +		.version = scaler_ver, \
>  		.base = 0xa00, .len = 0xa0,}, \
>  	.csc_blk = {.name = "csc", \
>  		.id = DPU_SSPP_CSC_10BIT, \
> @@ -299,13 +303,17 @@ static const uint32_t wb2_formats[] = {
>  	}
>  
>  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
> -				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 2));
>  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
> -				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 2));
>  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
> -				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 2));
>  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
> -				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK(0, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 2));
>  
>  static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
>  	.rot_maxheight = 1088,
> @@ -314,13 +322,30 @@ static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
>  };
>  
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
> -				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 3));
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
> -				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 3));
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
> -				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 3));
>  static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
> -				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3);
> +				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 3));
> +
> +static const struct dpu_sspp_sub_blks sm8150_vig_sblk_0 =
> +				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 4));
> +static const struct dpu_sspp_sub_blks sm8150_vig_sblk_1 =
> +				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 4));
> +static const struct dpu_sspp_sub_blks sm8150_vig_sblk_2 =
> +				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 4));
> +static const struct dpu_sspp_sub_blks sm8150_vig_sblk_3 =
> +				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED3,
> +					  SSPP_SCALER_VER(1, 4));
>  
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK(2);
> @@ -328,34 +353,60 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK(3);
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
>  
>  static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
> -				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(4, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 0));
>  
>  static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
> -			_VIG_SBLK_ROT(4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
> +			_VIG_SBLK_ROT(4, DPU_SSPP_SCALER_QSEED4,
> +				      SSPP_SCALER_VER(3, 0),
> +				      &dpu_rot_sc7280_cfg_v2);
>  
>  static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
> -				_VIG_SBLK(2, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(2, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 0));
>  
>  static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
> -				_VIG_SBLK(3, DPU_SSPP_SCALER_QSEED3LITE);
> +				_VIG_SBLK(3, DPU_SSPP_SCALER_QSEED3LITE,
> +					  SSPP_SCALER_VER(2, 4));
>  
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
> -				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 0));
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
> -				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 0));
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
> -				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 0));
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
> -				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 0));
> +
> +static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
> +				_VIG_SBLK(5, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 1));
> +static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
> +				_VIG_SBLK(6, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 1));
> +static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
> +				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 1));
> +static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
> +				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 1));
>  
>  static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
> -				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(7, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 2));
>  static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
> -				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(8, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 2));
>  static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
> -				_VIG_SBLK(9, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(9, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 2));
>  static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
> -				_VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4);
> +				_VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4,
> +					  SSPP_SCALER_VER(3, 2));
>  static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
>  static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
>  
> -- 
> 2.39.2
> 
