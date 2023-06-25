Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688E73D365
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 21:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C2210E188;
	Sun, 25 Jun 2023 19:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A21410E0CF
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 19:44:26 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0ACB71FA76;
 Sun, 25 Jun 2023 21:44:22 +0200 (CEST)
Date: Sun, 25 Jun 2023 21:44:21 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 02/15] dt-bindings: clock: qcom,dispcc-sm6125: Remove
 unused GCC_DISP_AHB_CLK
Message-ID: <e4uxrknyfpxds73gnzql34a4ksph2b5plpxqkcddgyrcflxtgp@5dkvmdptvqbx>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-2-1d5a638cebf2@somainline.org>
 <1d782241-f0ef-848b-9b42-a8a6234bbfae@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d782241-f0ef-848b-9b42-a8a6234bbfae@linaro.org>
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
 Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-24 11:08:30, Krzysztof Kozlowski wrote:
> On 24/06/2023 02:41, Marijn Suijten wrote:
> > The downsteam driver for dispcc only ever gets and puts this clock
> > without ever using it in the clocktree; this unnecessary workaround was
> > never ported to mainline, hence the driver doesn't consume this clock
> > and shouldn't be required by the bindings.
> > 
> > Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> 
> In perfect would we would like to know whether hardware needs this clock
> enabled/controlled, not whether some driver needs it. I understand
> though that with lack of proper docs we rely on drivers, so:

It might only use this to figure out if those clocks have already probed
or are available.  The logic goes as follows:

	clk = devm_clk_get(&pdev->dev, "cfg_ahb_clk");
	if (IS_ERR(clk)) {
		if (PTR_ERR(clk) != -EPROBE_DEFER)
			dev_err(&pdev->dev, "Unable to get ahb clock handle\n");
		return PTR_ERR(clk);
	}
	devm_clk_put(&pdev->dev, clk);

Nothing else uses/parents cfg_ahb_clk.  Maybe with clk_ignore_unused or
similar, it gets turned on but never off again?

Indeed, a lack of documentation and comment from the manufacturer makes
it impossible to know, and ignoring it (as the driver already does)
works just fine.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!

- Marijn

> 
> Best regards,
> Krzysztof
> 
