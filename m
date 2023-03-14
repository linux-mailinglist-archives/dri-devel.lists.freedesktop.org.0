Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C629D6B9734
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 15:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5852B10E177;
	Tue, 14 Mar 2023 14:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCC510E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 14:05:52 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DE01620184;
 Tue, 14 Mar 2023 15:05:50 +0100 (CET)
Date: Tue, 14 Mar 2023 15:05:49 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 06/10] drm/msm/dsi: Switch the QCM2290-specific
 compatible to index autodetection
Message-ID: <20230314140549.5fk4wroviqvknvfn@SoMainline.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
 <20230307-topic-dsi_qcm-v4-6-54b4898189cb@linaro.org>
 <20230314130439.nbarj2wsdf6ishmo@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314130439.nbarj2wsdf6ishmo@SoMainline.org>
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

On 2023-03-14 14:04:41, Marijn Suijten wrote:
> On 2023-03-14 13:13:44, Konrad Dybcio wrote:
> > Now that the logic can handle multiple sets of registers, move
> > the QCM2290 to the common logic and mark it deprecated. This allows us
> > to remove a couple of structs, saving some memory.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi.c     |  5 +++--
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 20 ++------------------
> >  2 files changed, 5 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> > index 31fdee2052be..f761973e4cba 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> > @@ -4,7 +4,6 @@
> >   */
> >  
> >  #include "dsi.h"
> > -#include "dsi_cfg.h"
> >  
> >  bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
> >  {
> > @@ -174,7 +173,9 @@ static int dsi_dev_remove(struct platform_device *pdev)
> >  
> >  static const struct of_device_id dt_match[] = {
> >  	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
> > -	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = &qcm2290_dsi_cfg_handler },
> > +
> > +	/* Deprecated, don't use */
> > +	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
> >  	{}
> >  };
> >  
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > index 03d98cbcc978..29ccd755cc2e 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > @@ -169,7 +169,8 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
> >  	.bus_clk_names = dsi_v2_4_clk_names,
> >  	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> >  	.io_start = {
> > -		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 / SC7180 */
> > +		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
> > +		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
> >  	},
> >  };
> >  
> > @@ -203,17 +204,6 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
> >  	},
> >  };
> >  
> > -static const struct msm_dsi_config qcm2290_dsi_cfg = {
> > -	.io_offset = DSI_6G_REG_SHIFT,
> > -	.regulator_data = dsi_v2_4_regulators,
> > -	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
> > -	.bus_clk_names = dsi_v2_4_clk_names,
> > -	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> > -	.io_start = {
> > -		{ 0x5e94000 },
> > -	},
> > -};
> > -
> >  static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
> >  	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
> >  	.link_clk_enable = dsi_link_clk_enable_v2,
> > @@ -304,9 +294,3 @@ const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> >  
> >  	return cfg_hnd;
> >  }
> > -
> > -/*  Non autodetect configs */
> > -const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler = {
> > -	.cfg = &qcm2290_dsi_cfg,
> > -	.ops = &msm_dsi_6g_v2_host_ops,
> > -};
> 
> Should be removed from dsi_cfg.h, but you did that in patch 7 instead.

As discussed in patch 7 this could possibly be fixed up when Dmitry
applies the series, rather than going through yet another resend... So
have my r-b already just in case:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
