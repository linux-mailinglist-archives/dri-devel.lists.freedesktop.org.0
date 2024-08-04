Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B2C946C50
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 07:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C0010E0E6;
	Sun,  4 Aug 2024 05:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nZ3NC4SN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAC110E090
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 05:40:36 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ef32fea28dso108985181fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 22:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722750035; x=1723354835; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rGZoVd2rDgNeiiA+eJxTSi+RLq7K+EuCeMoKQavvKp8=;
 b=nZ3NC4SNe2leA+m5hFNahe0sK3xpNIcbPkSxSDyICVWgu1kPyd5wnpO8xbrYyUxFAs
 1ZqY7ZJaursUfr7xLrZtjsWH7psWjMnVtcQUkBWpdN2E42MzLKXOhjUg7M3zAnJFDBnW
 Un9KhgWQQCIL2Peyp40xzvrd901+yTOV+TOT2Ul3RA6vpQuWNIys63oN58FjJZXk5RSv
 4fhBK7+gle1jpXyYAK0bTSK7+CfET67VqLHBQe53uotk+NqspdXlfPvr1VQcSBY7weu9
 TAdLis7RFRw7Aw4C1sRSVS/sBRODKIaRD9i56TMg6J20Km4A7n162hKiEbBj7HheDvUW
 8+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722750035; x=1723354835;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGZoVd2rDgNeiiA+eJxTSi+RLq7K+EuCeMoKQavvKp8=;
 b=fcG6+vE3n+h96giOC4TCZs+Una/2S2KjTsrvUzgZrPYR8J6WqkbiuwC/HTJwi3jEqI
 5JGnvnfwUfhmGZ2F6EOqldwzOVyJ8k05hf6taqbhzSwofPehR4pi7/wwolzuqST8UocQ
 /L+k4ybNf9/L7I41yCz/hEuw0SvvWVnB9hanvr8h/h0SXHN7eZv2ZIqh7oVGDK0ZK5v/
 XmWkznCH+m7Cwvu9VbnGjfFnb4/8WUvgJb0hDPEvMhIDH6FQXABRLsq0kOCCDx9DLyRG
 6CFr7oa5XjXayTH1A4oKXS3tt7cji2gRXgsfPjwldSqIggx/nHOk4+eQV8UtJcMgNcV9
 fQzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF2sMqru8B2vwRyRGVAmHlWd2MAB+5vV9HxNBCZwPNDqNLXs02+owKDojaZEo/rnvj0xQKpObC0ov9kqmE3gW+b1DvUMVVfvpSDJ1rLfW4
X-Gm-Message-State: AOJu0YzmdtvFTpDA/zt1X78JQqbpqC2iD1Dz0g2lwJOW3ni6vNsIsLZ4
 69fJy1+n3yxnMTDL3k2lJJONfzXZKIvteODkcCmkTk/x9fElxCKLAPXQdMvym5k=
X-Google-Smtp-Source: AGHT+IEPlAu7+t1OD9xkZBZB+NNWj0yEEWFX5JqjgVG0e9+KB+gZngiGtuqgNS6nmYBsvDyIL2hvxA==
X-Received: by 2002:a05:6512:12d2:b0:52c:82fa:ef7b with SMTP id
 2adb3069b0e04-530bb3a351cmr4927864e87.44.1722750034659; 
 Sat, 03 Aug 2024 22:40:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 22:40:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:14 +0300
Subject: [PATCH 10/11] arm64: dts: qcom: sm8350: add refgen regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-10-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jVYTvN/M5oXQ0cuOojPrVIEl/Z9fBYssaRlhkXEzBxU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9p6EfvbJs11IWt2KySeq1a453nXk+N4QleS7+4FFfmh7
 112W23pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBElrex/xVnkppt/SZk00ar
 XNlFkenx77pbV31njlzh7OjUJ13Q3GwY/XSPo82lVULHrvZ8NNqZZXh065xDLesqVII2VKSdfu5
 arcjOJneoNEL89RtDbb93903q20stEmVC56iv+z2dj+uNkeC+pNtXjKQEVJ1kNJnPrGRb3W5yWf
 Zr/64NMvznzzsmW13fOy0oYLPYJnXLbU8vrz/fuzus9mnQo/81uaYXfPXCum6/4Kj2rl0akxile
 +xCyJ35Armi1uZaiWuYnGXK3Z8vmv9jynIj7w61x9PYvLelyTwOUm46fsu7QM21R1ejaGNWTbj2
 tybFiW83CnZLLDnNoR7vs6dfiGON4BpN1qgvW++tfMsMAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On SM8350 platform the DSI internally is using the refgen regulator. Add
corresponding device node and link it as a supply to the DSI node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 27f36e6366df..37a2aba0d4ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2251,6 +2251,12 @@ usb_2_hsphy: phy@88e4000 {
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 		};
 
+		refgen: regulator@88e7000 {
+			compatible = "qcom,sm8350-refgen-regulator",
+				     "qcom,sm8250-refgen-regulator";
+			reg = <0x0 0x088e7000 0x0 0x84>;
+		};
+
 		usb_1_qmpphy: phy@88e8000 {
 			compatible = "qcom,sm8350-qmp-usb3-dp-phy";
 			reg = <0 0x088e8000 0 0x3000>;
@@ -2710,6 +2716,7 @@ mdss_dsi0: dsi@ae94000 {
 
 				operating-points-v2 = <&dsi0_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				refgen-supply = <&refgen>;
 
 				phys = <&mdss_dsi0_phy>;
 
@@ -2808,6 +2815,7 @@ mdss_dsi1: dsi@ae96000 {
 
 				operating-points-v2 = <&dsi1_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				refgen-supply = <&refgen>;
 
 				phys = <&mdss_dsi1_phy>;
 

-- 
2.39.2

