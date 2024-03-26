Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F6488CDC1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C66E10F25E;
	Tue, 26 Mar 2024 20:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BQshJDPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD1310F25B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:03:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-513e89d0816so7437019e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 13:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711483379; x=1712088179; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8nAoWwlePI94p1y2muaLUzxrPgMrou5m/LTN89EwtK0=;
 b=BQshJDPDrhIuXJ9BzGVrhp6aYWrZJOdxhTO6fBKxSM4toDPP0Ok0UGYTh3R5a8IzVE
 Xgjk2zVHzbdrXchGHLIo3tx3qcuyQoGxpWghK9HdKOCGYtGiQbIyz2wyZU0pmoF2DARg
 AxC54S4XZMiRQEsyMfwxZirf3q9Ia+oFYcVJlzBwZGZZ6sVfJhQKiMEj3WwmuPdue19S
 +YfGv637wc9Emvojkt73b8hgmJ1U+X1x9CGpVuiV3ZBRGwoQRM8wa8aLM/LYCFuI1WO3
 aK7Q9r7EnUBKHmF9h0xHFPfuOK9LZVSwAl/oaPlEmNIozcalNun9IpsvrT7ahZsbL5ff
 0/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711483379; x=1712088179;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nAoWwlePI94p1y2muaLUzxrPgMrou5m/LTN89EwtK0=;
 b=GE37zP+GlkJ3J/GmEdmgr1dJCvbT523dKV8z+1JXmuLZPTANqnSlHHDFS1XHlcCwVW
 hwu4BP6Cyitn/35lIG1K3/1sIiHOurvUmJK060FmtlS6fDNVmxSjmdcYVspYDpBUBAH2
 eqhwrr8/daYqRXQ48+8r/XkIpsyf5PU/dOeNMRW889pPJYi9AIVWnQa7LacJrmGlFQFC
 qbwtUFxBVUtLwezwTI+2bMY1/kpMrD9UYnjYNIAPOhVfjeTTerLRm3oJ19ZooPOk+/WS
 PZtQGhpjoIss6CLqEODAtPo+V+pjnj3qfQQ94In2K7pIxsHPtT5PoBXoNeSyB14cYEfV
 CPzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ35X71qS+s2g5L+svlQRI2X5yqU+Kbd0HSNlu/vMe/oAYzt95YYzR5dEIcntdUKCwv8UW2TGXggjUBRUE8DmYy4jpBMHPetM3Ka4JWqBT
X-Gm-Message-State: AOJu0Yy3naBHee+qJ92cIxH9kWsceqbZIUvSK060fEsLrrVloq1BnMUM
 F/YpxwOO2xQhOkO5Ga0Sc7EwY9jw53rj5ngWog+FpJyk29MUs1aUuq+2nQj6AecEybJbsDPG4mv
 N
X-Google-Smtp-Source: AGHT+IE1d1nbIGU7ZLdfB3h02LNS/0lJ8+D665YXYeLAwS3bEUcJFQ6R+3LsKDYRQN6L+DwIPZjgUw==
X-Received: by 2002:a05:6512:e93:b0:515:a257:cbd with SMTP id
 bi19-20020a0565120e9300b00515a2570cbdmr9048758lfb.24.1711483379537; 
 Tue, 26 Mar 2024 13:02:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a21-20020ac25e75000000b00515a7984acbsm1279408lfr.94.2024.03.26.13.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:02:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 22:02:56 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-fd-fix-schema-v1-3-4475d6d6d633@linaro.org>
References: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
In-Reply-To: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yPu9lShLWjrX8FbgY01q1INaNP1kyI/7w03v1seDbHM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmAynwe9CmGRZkwUdeLtPrCLeXExmbk+bZLq4La
 z66Qg/tqIuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgMp8AAKCRCLPIo+Aiko
 1XrkB/sH0dT8EtUmpApTgR+HX6qHLfd7G0JD71J2R4pl7Kpsg0b4hOMmi/48dmN7ygHKFmDKh5e
 GHIDSrgYnIobPMo6TD0HKqWGlENnS9o1ThGurh7exjswsOQhPXhIlHZ9D8sZ+VeYCCz/jdTfvOk
 4nN3Ds9/Tyn+gj7NBv0P70wF2rAhwaPr5oIgTYTwMx0j4ABB+4p9NbgSnPibOP+ZKonNn1GJBWN
 SDpfF+cr0UAamSQo+YUAA1i2G6FFDCpOZt9VQ9d0FREfLrlOF6CdiKFCD4PHbgHZHzNdRGrRsDn
 jfOm779ppXBzdGhViV22N5jdjrfF9LzSVmyYlgHPd92Zc2wZ
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

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 99462b42cfc5..6d74867d3b61 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2804,7 +2804,7 @@ mdss_mdp: mdp@ae01000 {
 				power-domains = <&rpmhpd SC8180X_MMCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				ports {
 					#address-cells = <1>;
@@ -2877,7 +2877,7 @@ mdss_dsi0: dsi@ae94000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
@@ -2963,7 +2963,7 @@ mdss_dsi1: dsi@ae96000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <5>;
 
 				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
 					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,

-- 
2.39.2

