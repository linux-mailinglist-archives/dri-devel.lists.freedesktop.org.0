Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77BB2D05B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 01:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB7A10E057;
	Tue, 19 Aug 2025 23:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="JmK6qXfP";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="E4vHi95P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 450 seconds by postgrey-1.36 at gabe;
 Tue, 19 Aug 2025 23:46:14 UTC
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F22810E057;
 Tue, 19 Aug 2025 23:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1755646712; bh=S5nrgqmNYIb0jBgyF8qD2zs
 l5hMwO2IFY8OIA7EblT8=; b=JmK6qXfPtbTEZVAoEGmMWj0lGUT+X4v+aplUid4JoLGmeBYmxO
 37graDvOAQwgqxhK2qNuoEw7DdO0k9izasd1hTxLlFtV9L8ec/IJtMgiUOjn8RRCawUia29qPOh
 oM1V9kePauJuqTJBM9T9pscuJxv0/+9Fyjsf+qNrPE7EoT+f2slY2XurOWHlPex506FB3jAQ9qn
 92BVS/imCmd7dCau1r4vTKehTXk7+McymYgd+E4XFVqAqqprwC+8URbHqqdkhGoqqWM7BTLsL47
 1JQr/R/CD5JBa1S3FHKxiSjOpbskz9Ef1DR6XltDwOvOdQYs4y3MrAwRgRARtIqz2Ww==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1755646712; bh=S5nrgqmNYIb0jBgyF8qD2zs
 l5hMwO2IFY8OIA7EblT8=; b=E4vHi95PjtRoVh8agGX5qkOTuDNHJFaRsGuemUbyY0KfVE64Q/
 y0Y66ZRfH1Y0xa5tCCv6c9o5bFj7++0cfoAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Wed, 20 Aug 2025 01:37:45 +0200
Subject: [PATCH v6 1/6] dt-bindings: clock: qcom: Add MSM8937 Global Clock
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250820-msm8937-v6-1-b090b2acb67e@mainlining.org>
References: <20250820-msm8937-v6-0-b090b2acb67e@mainlining.org>
In-Reply-To: <20250820-msm8937-v6-0-b090b2acb67e@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755646705; l=3026;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=StxQE34+WDhRu9yCIylDmjvAl7qsNKGyy5crqlz4rmU=;
 b=lDfTev6vN+nCRueWqhyVB73CUzXM2QN72flbghzuoMssVHmJBGAFEO1WKNDCZcvvImRMmEbI9
 3FLCEc9PIOfDsGKye8lqDjlvyMVJDtfJjL2nfV9whVF47U03hUvTyk4
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

Add device tree bindings for the global clock controller on Qualcomm
MSM8937 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 11 ++++++++---
 include/dt-bindings/clock/qcom,gcc-msm8917.h          | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index fe1f5f3ed992453a347062a556b1ddb2a011db6f..f2e37f439d28b3ec066f407927955b3b82b5c10a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -9,16 +9,21 @@ title: Qualcomm Global Clock & Reset Controller on MSM8953
 maintainers:
   - Adam Skladowski <a_skl39@protonmail.com>
   - Sireesh Kodali <sireeshkodali@protonmail.com>
+  - Barnabas Czeman <barnabas.czeman@mainlining.org>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on MSM8953.
+  domains on MSM8937 or MSM8953.
 
-  See also: include/dt-bindings/clock/qcom,gcc-msm8953.h
+  See also::
+    include/dt-bindings/clock/qcom,gcc-msm8917.h
+    include/dt-bindings/clock/qcom,gcc-msm8953.h
 
 properties:
   compatible:
-    const: qcom,gcc-msm8953
+    enum:
+      - qcom,gcc-msm8937
+      - qcom,gcc-msm8953
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
index 4b421e7414b50bef2e2400f868ae5b7212a427bb..4e3897b3669d9149b61a6feec31ca35e2058dcb9 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -170,6 +170,23 @@
 #define VFE1_CLK_SRC				163
 #define VSYNC_CLK_SRC				164
 #define GPLL0_SLEEP_CLK_SRC			165
+/* Addtional MSM8937-specific clocks */
+#define MSM8937_BLSP1_QUP1_I2C_APPS_CLK_SRC		166
+#define MSM8937_BLSP1_QUP1_SPI_APPS_CLK_SRC		167
+#define MSM8937_BLSP2_QUP4_I2C_APPS_CLK_SRC		168
+#define MSM8937_BLSP2_QUP4_SPI_APPS_CLK_SRC		169
+#define MSM8937_BYTE1_CLK_SRC				170
+#define MSM8937_ESC1_CLK_SRC				171
+#define MSM8937_PCLK1_CLK_SRC				172
+#define MSM8937_GCC_BLSP1_QUP1_I2C_APPS_CLK		173
+#define MSM8937_GCC_BLSP1_QUP1_SPI_APPS_CLK		174
+#define MSM8937_GCC_BLSP2_QUP4_I2C_APPS_CLK		175
+#define MSM8937_GCC_BLSP2_QUP4_SPI_APPS_CLK		176
+#define MSM8937_GCC_MDSS_BYTE1_CLK			177
+#define MSM8937_GCC_MDSS_ESC1_CLK			178
+#define MSM8937_GCC_MDSS_PCLK1_CLK			179
+#define MSM8937_GCC_OXILI_AON_CLK			180
+#define MSM8937_GCC_OXILI_TIMER_CLK			181
 
 /* GCC block resets */
 #define GCC_CAMSS_MICRO_BCR			0
@@ -187,5 +204,7 @@
 #define VENUS_GDSC				5
 #define VFE0_GDSC				6
 #define VFE1_GDSC				7
+/* Additional MSM8937-specific GDSCs */
+#define MSM8937_OXILI_CX_GDSC				8
 
 #endif

-- 
2.50.1
