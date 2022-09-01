Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D495A94B8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0338D10E6C9;
	Thu,  1 Sep 2022 10:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711BD10E6C2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:34:55 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1oThXA-0001DL-Fx; Thu, 01 Sep 2022 12:34:52 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1oThX7-0000eT-VG; Thu, 01 Sep 2022 12:34:49 +0200
Date: Thu, 1 Sep 2022 12:34:49 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v6 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset
 support
Message-ID: <20220901103449.GC32271@pengutronix.de>
References: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220831104741.v6.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831104741.v6.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 31, 2022 at 10:48:25AM +0530, Akhil P Oommen wrote:
> Allow a consumer driver to poll for cx gdsc collapse through Reset
> framework.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
> 
> Changes in v2:
> - Minor update to use the updated custom reset ops implementation
> 
>  drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
> index 9a832f2..fece3f4 100644
> --- a/drivers/clk/qcom/gpucc-sc7280.c
> +++ b/drivers/clk/qcom/gpucc-sc7280.c
> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static const struct qcom_reset_ops cx_gdsc_reset = {
> +	.reset = gdsc_wait_for_collapse,

This should be accompanied by a comment explaining the not-quite-reset
nature of this workaround, i.e. what is the prerequisite for this to
actually work as expected?

> +};
> +
> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
> +	[GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
> +};
> +
>  static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>  	.config = &gpu_cc_sc7280_regmap_config,
>  	.clks = gpu_cc_sc7280_clocks,
>  	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>  	.gdscs = gpu_cc_sc7180_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
> +	.resets = gpucc_sc7280_resets,
> +	.num_resets = ARRAY_SIZE(gpucc_sc7280_resets),

See my comment on patch 2. I think instead of adding a const struct
qcom_reset_ops * to gpucc_sc7280_resets, this should just add a const
struct reset_control * to gpu_cc_sc7280_desc.

regards
Philipp
