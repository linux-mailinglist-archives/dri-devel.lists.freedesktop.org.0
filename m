Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB7F6B864F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 00:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D9910E665;
	Mon, 13 Mar 2023 23:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4F410E668
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 23:51:13 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id EF0DB202FA;
 Tue, 14 Mar 2023 00:51:10 +0100 (CET)
Date: Tue, 14 Mar 2023 00:51:09 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 03/10] drm/msm/dsi: Fix DSI index detection when
 version clash occurs
Message-ID: <20230313235109.u7cpusjr6t2xyxmk@SoMainline.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-3-8bd7e1add38a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-topic-dsi_qcm-v3-3-8bd7e1add38a@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-07 14:01:41, Konrad Dybcio wrote:
> Currently, we allow for MAX_DSI entries in io_start to facilitate for
> MAX_DSI number of DSI hosts at different addresses. The configuration
> is matched against the DSI CTRL hardware revision read back from the
> component. We need a way to resolve situations where multiple SoCs
> with different register maps may use the same version of DSI CTRL. In
> preparation to do so, make msm_dsi_config a 2d array where each entry
> represents a set of configurations adequate for a given SoC.

Note that this code isn't fool-proof against different SoCs sharing the
same DSI host address but for different indices (for example, the
address at variant 0 DSI 0 could be the same as variant 1 DSI 1) and the
matching logic would wrongly return ID 0 instead of 1 for SoC variant 1,
because that's the first matching address it finds.

> This is totally fine to do, as the only differentiating factors
> between same-version-different-SoCs configurations are the number of
> DSI hosts (1 or 2, at least as of today) and the set of base registers.
> The regulator setup is the same, because the DSI hardware is the same,
> regardless of the SoC it was implemented in.
> 
> In addition to that, update the matching logic such that it will loop
> over VARIANTS_MAX variants, making sure they are all taken into account.

"in addition to that" makes it sound like you're doing a separate new
thing in this patch, when the match logic must in fact be updated to
make it compatible with the change described above (as in, it doesn't
compile if you don't account for the extra depth in the array).

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Regardless of the above, I don't think it's a problem right now and I
really like the direction this is headed in: miles better than having a
single distinct SoC with a separate way (compatible) of selecting the
host DSI CTRL, rather than the hw revision readback.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 52 ++++++++++++++++++++++++++++----------
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  5 +++-
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++----
>  3 files changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 4515f52b407a..6c192963c100 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -21,7 +21,9 @@ static const struct msm_dsi_config apq8064_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(apq8064_dsi_regulators),
>  	.bus_clk_names = dsi_v2_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
> -	.io_start = { 0x4700000, 0x5800000 },
> +	.io_start = {
> +		{ 0x4700000, 0x5800000 },
> +	},
>  };
>  
>  static const char * const dsi_6g_bus_clk_names[] = {
> @@ -40,7 +42,9 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(msm8974_apq8084_regulators),
>  	.bus_clk_names = dsi_6g_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
> -	.io_start = { 0xfd922800, 0xfd922b00 },
> +	.io_start = {
> +		{ 0xfd922800, 0xfd922b00 },
> +	},
>  };
>  
>  static const char * const dsi_8916_bus_clk_names[] = {
> @@ -58,7 +62,9 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
>  	.bus_clk_names = dsi_8916_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
> -	.io_start = { 0x1a98000 },
> +	.io_start = {
> +		{ 0x1a98000 },
> +	},
>  };
>  
>  static const char * const dsi_8976_bus_clk_names[] = {
> @@ -76,7 +82,9 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
>  	.bus_clk_names = dsi_8976_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
> -	.io_start = { 0x1a94000, 0x1a96000 },
> +	.io_start = {
> +		{ 0x1a94000, 0x1a96000 },
> +	},
>  };
>  
>  static const struct regulator_bulk_data msm8994_dsi_regulators[] = {
> @@ -94,7 +102,9 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(msm8994_dsi_regulators),
>  	.bus_clk_names = dsi_6g_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
> -	.io_start = { 0xfd998000, 0xfd9a0000 },
> +	.io_start = {
> +		{ 0xfd998000, 0xfd9a0000 },
> +	},
>  };
>  
>  static const char * const dsi_8996_bus_clk_names[] = {
> @@ -113,7 +123,9 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
>  	.bus_clk_names = dsi_8996_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
> -	.io_start = { 0x994000, 0x996000 },
> +	.io_start = {
> +		{ 0x994000, 0x996000 },
> +	},
>  };
>  
>  static const char * const dsi_msm8998_bus_clk_names[] = {
> @@ -131,7 +143,9 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(msm8998_dsi_regulators),
>  	.bus_clk_names = dsi_msm8998_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
> -	.io_start = { 0xc994000, 0xc996000 },
> +	.io_start = {
> +		{ 0xc994000, 0xc996000 },
> +	},
>  };
>  
>  static const char * const dsi_sdm660_bus_clk_names[] = {
> @@ -148,7 +162,9 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(sdm660_dsi_regulators),
>  	.bus_clk_names = dsi_sdm660_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
> -	.io_start = { 0xc994000, 0xc996000 },
> +	.io_start = {
> +		{ 0xc994000, 0xc996000 },
> +	},
>  };
>  
>  static const char * const dsi_sdm845_bus_clk_names[] = {
> @@ -169,7 +185,9 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
>  	.bus_clk_names = dsi_sdm845_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
> -	.io_start = { 0xae94000, 0xae96000 },
> +	.io_start = {
> +		{ 0xae94000, 0xae96000 },
> +	},
>  };
>  
>  static const struct regulator_bulk_data sm8550_dsi_regulators[] = {
> @@ -182,7 +200,9 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
>  	.bus_clk_names = dsi_sdm845_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
> -	.io_start = { 0xae94000, 0xae96000 },
> +	.io_start = {
> +		{ 0xae94000, 0xae96000 },
> +	},
>  };
>  
>  static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
> @@ -195,7 +215,9 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
>  	.bus_clk_names = dsi_sc7180_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
> -	.io_start = { 0xae94000 },
> +	.io_start = {
> +		{ 0xae94000 },
> +	},
>  };
>  
>  static const char * const dsi_sc7280_bus_clk_names[] = {
> @@ -212,7 +234,9 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
>  	.bus_clk_names = dsi_sc7280_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
> -	.io_start = { 0xae94000, 0xae96000 },
> +	.io_start = {
> +		{ 0xae94000, 0xae96000 },
> +	},
>  };
>  
>  static const char * const dsi_qcm2290_bus_clk_names[] = {
> @@ -229,7 +253,9 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
>  	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
>  	.bus_clk_names = dsi_qcm2290_bus_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
> -	.io_start = { 0x5e94000 },
> +	.io_start = {
> +		{ 0x5e94000 },
> +	},
>  };
>  
>  static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 6b6b16c5fd25..8772a3631ac1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -32,13 +32,16 @@
>  
>  #define DSI_6G_REG_SHIFT	4
>  
> +/* Maximum number of configurations matched against the same hw revision */
> +#define VARIANTS_MAX			2
> +
>  struct msm_dsi_config {
>  	u32 io_offset;
>  	const struct regulator_bulk_data *regulator_data;
>  	int num_regulators;
>  	const char * const *bus_clk_names;
>  	const int num_bus_clks;
> -	const resource_size_t io_start[DSI_MAX];
> +	const resource_size_t io_start[VARIANTS_MAX][DSI_MAX];
>  };
>  
>  struct msm_dsi_host_cfg_ops {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 9021f0d65515..9cfb9e91bfea 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1862,16 +1862,16 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
>  	struct platform_device *pdev = msm_host->pdev;
>  	const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
>  	struct resource *res;
> -	int i;
> +	int i, j;
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dsi_ctrl");
>  	if (!res)
>  		return -EINVAL;
>  
> -	for (i = 0; i < DSI_MAX; i++) {
> -		if (cfg->io_start[i] == res->start)
> -			return i;
> -	}
> +	for (i = 0; i < VARIANTS_MAX; i++)
> +		for (j = 0; j < DSI_MAX; j++)
> +			if (cfg->io_start[i][j] == res->start)
> +				return j;
>  
>  	return -EINVAL;
>  }
> 
> -- 
> 2.39.2
> 
