Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D2B6477B5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 22:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84D110E1FC;
	Thu,  8 Dec 2022 21:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2FE10E1FC;
 Thu,  8 Dec 2022 21:09:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F769B82617;
 Thu,  8 Dec 2022 21:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE55DC433F0;
 Thu,  8 Dec 2022 21:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670533772;
 bh=G8BQaFYJmt2WISpWVDJiLLDJliL/iewvE0hv4aZ7DGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KQe0ERjH2+peYAhgkJAN45eONKdM1NNP2U0WSx8OYOBz4ny1IjHUgGcTag5kvs/OB
 bFJHRy3TiNXFZrL5+1MyqjkrWQ1ARiQ26A/6cwFEbal9RVx6a/eDrYoIKvO/FnnbLJ
 EEgFmiP+aiHhZobfro+bEYAMqE/AgL823WhpfvmmWFg23qIPszBxLvcRVLVV3hBJGW
 ZpappejoAkgLAGFcY9IdaNzNv+HHm6iJk/k8J9bBJCFooZ6Uy5vA7FvJHN0uqwXS87
 l5lP3yCT5jcfIUq6QYJ4skzjwBui8Ts+9+JIof0IN6WAoeyIMhfq3Y9WG8Q8lnx+92
 SN3w2Yo7AqPiw==
Date: Thu, 8 Dec 2022 15:09:29 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v7 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset
 support
Message-ID: <20221208210929.capfm7jaltxvgpvq@builder.lan>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221005143618.v7.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
 <CAPDyKFp8ynYSyMc+gXWuW8dC1j07X+8k3omsKKnLA_u+4X-vvA@mail.gmail.com>
 <76812eb1-ef4a-48b3-7b7a-231adc8c7c36@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76812eb1-ef4a-48b3-7b7a-231adc8c7c36@quicinc.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 08, 2022 at 08:54:39PM +0530, Akhil P Oommen wrote:
> On 12/7/2022 9:16 PM, Ulf Hansson wrote:
> > On Wed, 5 Oct 2022 at 11:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >> Allow a consumer driver to poll for cx gdsc collapse through Reset
> >> framework.
> > Would you mind extending this commit message, to allow us to better
> > understand what part is really the consumer part.
> Sure. I can do that.
> >
> > I was expecting the consumer part to be the GPU (adreno) driver, but I
> > may have failed to understand correctly. It would be nice to see an
> > example of a typical sequence, where the reset is being
> > asserted/deasserted, from the consumer point of view. Would you mind
> > explaining this a bit more?
> https://elixir.bootlin.com/linux/v6.1-rc8/source/drivers/gpu/drm/msm/adreno/a6xx_gpu.c#L1309
> You are correct. The consumer is adreno gpu driver. When there is a gpu fault, these sequences are followed:
> 1. drop pm_runtime_put() for gpu device which will drops its vote on 'cx' genpd. line: 1306
> 2. At this point, there could be vote from either smmu driver (smmu is under same power domain too) or from other subsystems (tz/hyp).

Can you confirm that this is happening completely independent of what
the kernel does?

> 3. So we call into gdsc driver through reset interface to poll the gdsc register to ensure it collapsed at least once. Line: 1309

I other words, if we engineered 1. such that it would wait in
gdsc_disable() until the condition for 3. is reached, that should work
for you? (Obviously depending on the ability for us to engineer this...)

Regards,
Bjorn

> 4. Then we turn ON gpu. line:1314.
> 
> -Akhil.
> >
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Kind regards
> > Uffe
> >
> >> ---
> >>
> >> (no changes since v3)
> >>
> >> Changes in v3:
> >> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
> >>
> >> Changes in v2:
> >> - Minor update to use the updated custom reset ops implementation
> >>
> >>  drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
> >> index 9a832f2..fece3f4 100644
> >> --- a/drivers/clk/qcom/gpucc-sc7280.c
> >> +++ b/drivers/clk/qcom/gpucc-sc7280.c
> >> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
> >>         .fast_io = true,
> >>  };
> >>
> >> +static const struct qcom_reset_ops cx_gdsc_reset = {
> >> +       .reset = gdsc_wait_for_collapse,
> >> +};
> >> +
> >> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
> >> +       [GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
> >> +};
> >> +
> >>  static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
> >>         .config = &gpu_cc_sc7280_regmap_config,
> >>         .clks = gpu_cc_sc7280_clocks,
> >>         .num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
> >>         .gdscs = gpu_cc_sc7180_gdscs,
> >>         .num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
> >> +       .resets = gpucc_sc7280_resets,
> >> +       .num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
> >>  };
> >>
> >>  static const struct of_device_id gpu_cc_sc7280_match_table[] = {
> >> --
> >> 2.7.4
> >>
> 
