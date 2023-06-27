Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB173F834
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 11:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207FA10E2CE;
	Tue, 27 Jun 2023 09:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2734310E2CD;
 Tue, 27 Jun 2023 09:06:33 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 99D103F7CC;
 Tue, 27 Jun 2023 11:06:30 +0200 (CEST)
Date: Tue, 27 Jun 2023 11:06:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 09/15] drm/msm/mdss: Add SM6125 support
Message-ID: <222mwmijir3tv7lwxekp7r6jhx4uyhuo3xrtqec6oo3tj4kpyj@4pv56oukezsg>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-9-1d5a638cebf2@somainline.org>
 <9ba8e5c9-642d-a09d-7e82-adba8e5497aa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ba8e5c9-642d-a09d-7e82-adba8e5497aa@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-27 11:49:07, Dmitry Baryshkov wrote:
> On 24/06/2023 03:41, Marijn Suijten wrote:
> > SM6125's UBWC hardware decoder is version 3.0, and supports decoding
> > UBWC 1.0.
> 
> I think it's UBWC encoder version, see 
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.15.1.r17-rel/msm/sde/sde_hw_top.c?ref_type=heads#L357
> 
> This is a part of 
> https://patchwork.freedesktop.org/patch/538279/?series=118074&rev=1
> 
> (no, you don't have to rebase on that patchset, it is not reviewed yet).

Thanks for clarifying this.  I always thought that there only was a
(decoder) hardware version, that is able to decode a specific format
version of the UBWC data format.  And that it was confusingly using the
same enum.

I will reword the message.

(Also didn't really see why MDSS would have to _encode_ to UBWC, for
 readbacks?)

- Marijn

> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 05648c910c68..bf68bae23264 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -559,6 +559,13 @@ static const struct msm_mdss_data sm6115_data = {
> >   	.ubwc_static = 0x11f,
> >   };
> >   
> > +static const struct msm_mdss_data sm6125_data = {
> > +	.ubwc_version = UBWC_1_0,
> > +	.ubwc_dec_version = UBWC_3_0,
> > +	.ubwc_swizzle = 1,
> > +	.highest_bank_bit = 1,
> > +};
> > +
> >   static const struct msm_mdss_data sm8250_data = {
> >   	.ubwc_version = UBWC_4_0,
> >   	.ubwc_dec_version = UBWC_4_0,
> > @@ -579,6 +586,7 @@ static const struct of_device_id mdss_dt_match[] = {
> >   	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
> >   	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
> >   	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
> > +	{ .compatible = "qcom,sm6125-mdss", .data = &sm6125_data },
> >   	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
> >   	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
> >   	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
