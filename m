Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C97976538A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 14:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC8D10E574;
	Thu, 27 Jul 2023 12:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFD210E0E6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 12:22:20 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5221e2e69bdso1117787a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690460539; x=1691065339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBcPaBCD15GVUt1t8fe+n3lTCxT4h0u6r6X0oXlZlwc=;
 b=e081yBpEl6WUyQ7DrRPgXBrwcqwu4Zlr+puzBZS56IJgd0T++PdR0LhMQQP9+eGBJh
 vPp2ek8dutLOQ45EtSbH11eENOOFmTYHYPNub1vraSKWz5mXM8gJEBy/MTOuCXtqrXRC
 tUa06KALw5Q4Qzz9oDT5BK81+Mk0yoWq7dvHwgQZvkgGS10I6gUXftd6LCfAUO6lE0aR
 b2SefsYc+gYmH/yfi2HAGUuP460jJ89FaOtEgtKbWo3FteTCJhNTjwhDSeYxyEoVbNaR
 WSg2mfD3JYetOQu43w+k9PyfmRvgcrMmw3lM9SteyO+TLxiNEr7Q8+oBstysJ//7cqW+
 l73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690460539; x=1691065339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBcPaBCD15GVUt1t8fe+n3lTCxT4h0u6r6X0oXlZlwc=;
 b=OO6OaBmta82kFODOgibmlEC8RU889mPtUR5LTX1s5iTGNJRxRKOPYqmugge4W2zUe5
 BZDnYNTZFZ/Uiqp5xGreXhmuSkkIEbrVM1vb/4cMoEIwbVLCqgKRoUs341DgG+xKFLC5
 R3XzM81xaibbXukXgZlorFjl3SlDRQ7aD86FI/E85tVqzd9us1P926kr0K0MI9/UE5q3
 F7j3sw7DO02QBmIP54e38RCK9dQ3IrppwMYzMh7XGpFywonizGRKvHCo0arn2dYB4K6d
 +N85nxjYX5Zq3kCnAPf5ZKp67oLiqI1RLbal4F9hXu6MPRudhEvHHKpWXPk5exLoQH1r
 y4PA==
X-Gm-Message-State: ABy/qLZRXCOzlzl8SSkKKgk1Nb6Y2RO6VuuL2C+baKsDafxHVFQkHfiI
 VjitZvfBeqyGX6Nr+puC7lLBgg==
X-Google-Smtp-Source: APBJJlG8c4LaXOrZrh8NyuL1H8V9TCwkuizDCvPywRcH0BHTiQ4d0Yy80J1WZnSmA2GAgK4iabH5rA==
X-Received: by 2002:a17:907:a075:b0:99b:64ca:6999 with SMTP id
 ia21-20020a170907a07500b0099b64ca6999mr1967077ejc.7.1690460538803; 
 Thu, 27 Jul 2023 05:22:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a1709067d9700b00993860a6d37sm717844ejo.40.2023.07.27.05.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 05:22:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v4 00/17] drm/msm: Add SM6125 MDSS/DPU hardware and enable
 Sony Xperia 10 II panel
Date: Thu, 27 Jul 2023 15:22:15 +0300
Message-Id: <169046051039.1413710.12901529844343078449.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
References: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 23 Jul 2023 18:08:38 +0200, Marijn Suijten wrote:
> Bring up the SM6125 DPU now that all preliminary series (such as INTF
> TE) have been merged (for me to test the hardware properly), and most
> other conflicting work (barring ongoing catalog *improvements*) has made
> its way in as well or is still being discussed.
> 
> The second part of the series complements that by immediately utilizing
> this hardware in DT, and even enabling the MDSS/DSI nodes complete with
> a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).
> 
> [...]

Applied, thanks!

[01/17] drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a7e3fda5948a
[02/17] arm64: dts: qcom: sm6125: Pad APPS IOMMU address to 8 characters
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b7d35a8eae54
[03/17] arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2be52ca96a71
[04/17] dt-bindings: display/msm: Remove DSI1 ports from SM6350/SM6375 example
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4be2c19261fc
[05/17] dt-bindings: clock: qcom,dispcc-sm6125: Require GCC PLL0 DIV clock
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4f86e343f3c6
[06/17] dt-bindings: clock: qcom,dispcc-sm6125: Allow power-domains property
        https://gitlab.freedesktop.org/lumag/msm/-/commit/91043642f28c
[07/17] dt-bindings: display/msm: dsi-controller-main: Document SM6125
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cf5859476e5d
[08/17] dt-bindings: display/msm: sc7180-dpu: Describe SM6125
        https://gitlab.freedesktop.org/lumag/msm/-/commit/04a664dffd19
[09/17] dt-bindings: display/msm: Add SM6125 MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3bde3b8f8a04
[10/17] drm/msm/dpu: Add SM6125 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/76c5dffd0bc4
[11/17] drm/msm/mdss: Add SM6125 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/de50357565d3
[12/17] dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cdac445883cc
[13/17] drm/msm/dsi: Reuse QCM2290 14nm DSI PHY configuration for SM6125
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7638d8059ace

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
