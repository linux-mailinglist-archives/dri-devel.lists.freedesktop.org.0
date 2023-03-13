Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CF6B8670
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 00:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7508110E679;
	Mon, 13 Mar 2023 23:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB7710E679;
 Mon, 13 Mar 2023 23:58:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E2CAB20373;
 Tue, 14 Mar 2023 00:58:06 +0100 (CET)
Date: Tue, 14 Mar 2023 00:58:05 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 05/10] drm/msm/dsi: dsi_cfg: Merge SC7180 config into
 SDM845
Message-ID: <20230313235805.2ic4xewn2jf2ffir@SoMainline.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-5-8bd7e1add38a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-topic-dsi_qcm-v3-5-8bd7e1add38a@linaro.org>
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

On 2023-03-07 14:01:43, Konrad Dybcio wrote:
> The configs are identical, other than the number of *maximum* DSI
> hosts allowed. This isn't an issue, unless somebody deliberately
> tries to access the inexistent host by adding a dt node for it.
> 
> Remove the SC7180 struct and point the hw revision match to the
> SDM845's one. On a note, this could have been done back when
> 7180 support was introduced.

Maybe differences were expected, but then sdm845_dsi_cfg is used on many
other revisions.

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index d39521850018..6d4b2ce4b918 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>  	.bus_clk_names = dsi_v2_4_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>  	.io_start = {
> -		{ 0xae94000, 0xae96000 },
> +		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 / SC7180 */
>  	},
>  };
>  
> @@ -188,17 +188,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>  	},
>  };
>  
> -static const struct msm_dsi_config sc7180_dsi_cfg = {
> -	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = dsi_v2_4_regulators,
> -	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
> -	.bus_clk_names = dsi_v2_4_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> -	.io_start = {
> -		{ 0xae94000 },
> -	},
> -};
> -
>  static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>  	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
>  };
> @@ -299,7 +288,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> -		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
>  		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
> 
> -- 
> 2.39.2
> 
