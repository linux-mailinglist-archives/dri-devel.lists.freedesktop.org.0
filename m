Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA96B868A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 01:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC16310E691;
	Tue, 14 Mar 2023 00:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F3710E690;
 Tue, 14 Mar 2023 00:03:25 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CC7BD202E5;
 Tue, 14 Mar 2023 01:03:23 +0100 (CET)
Date: Tue, 14 Mar 2023 01:03:22 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 06/10] drm/msm/dsi: Switch the QCM2290-specific
 compatible to index autodetection
Message-ID: <20230314000322.ptxs5d5mx54vdopa@SoMainline.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-6-8bd7e1add38a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-topic-dsi_qcm-v3-6-8bd7e1add38a@linaro.org>
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

On 2023-03-07 14:01:44, Konrad Dybcio wrote:
> Now that the logic can handle multiple sets of registers, move
> the QCM2290 to the common logic and mark it deprecated. This allows us
> to remove a couple of structs, saving some memory.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c     |  4 +++-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 28 ++--------------------------
>  2 files changed, 5 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 31fdee2052be..90d43628b22b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -174,7 +174,9 @@ static int dsi_dev_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id dt_match[] = {
>  	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
> -	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = &qcm2290_dsi_cfg_handler },
> +
> +	/* Deprecated, don't use */
> +	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 6d4b2ce4b918..29ccd755cc2e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -169,7 +169,8 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>  	.bus_clk_names = dsi_v2_4_clk_names,
>  	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>  	.io_start = {
> -		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 / SC7180 */
> +		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
> +		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
>  	},
>  };
>  
> @@ -203,25 +204,6 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>  	},
>  };
>  
> -static const char * const dsi_qcm2290_bus_clk_names[] = {
> -	"iface", "bus",
> -};
> -
> -static const struct regulator_bulk_data qcm2290_dsi_cfg_regulators[] = {
> -	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
> -};

These two consts should really have already been deleted as part of
04/10: drm/msm/dsi: dsi_cfg: Deduplicate identical structs.

> -static const struct msm_dsi_config qcm2290_dsi_cfg = {
> -	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = qcm2290_dsi_cfg_regulators,
> -	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
> -	.bus_clk_names = dsi_qcm2290_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
> -	.io_start = {
> -		{ 0x5e94000 },
> -	},
> -};
> -
>  static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>  	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
>  	.link_clk_enable = dsi_link_clk_enable_v2,
> @@ -312,9 +294,3 @@ const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
>  
>  	return cfg_hnd;
>  }
> -
> -/*  Non autodetect configs */
> -const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler = {
> -	.cfg = &qcm2290_dsi_cfg,
> -	.ops = &msm_dsi_6g_v2_host_ops,
> -};

And how do you think dsi.c is able to reference this... don't forget to
remove it from dsi_cfg.h in v4.  In fact, if you look at how this was
implemented you should also be able to remove #include "dsi_cfg.h" from
dsi.c.  A clean revert of that patch would be nice, or just use it as
reference to find the remnants:

https://lore.kernel.org/all/1644853060-12222-2-git-send-email-loic.poulain@linaro.org/

- Marijn
