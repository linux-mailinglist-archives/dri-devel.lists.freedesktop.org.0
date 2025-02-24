Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA0EA412D9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 02:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49DD10E10A;
	Mon, 24 Feb 2025 01:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="NBeYY8QD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DD810E100;
 Mon, 24 Feb 2025 01:56:27 +0000 (UTC)
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
 by mail.mainlining.org (Postfix) with ESMTPSA id 5F6C3BB83C;
 Mon, 24 Feb 2025 01:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1740362186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNnYNfucvZjWHpKGUS2OzpM6J0lfYTTeV9Y89qOeNSA=;
 b=NBeYY8QDCWX6e2ywDKwPHschSVrry/beU7yaGQ8fWjLGBcNs6NmPcw3At8ilSYBg7vV70R
 u719bKihSIvsxo1xKWUMRXHKR1e5wzCciXnEbfGcK7AeXDkKAUnkL9KPVNO7D0BMl6HTDD
 X1Gs8x+mEyyAXF1SJV5mu2SvnW/+uIHyvJKrPV7Cx6AlIT5NGuxYchfv1i5roqQ7f7nwCT
 gJ0rlyl5AZcZzr96NAnDSn3SJua9FNuuPGiLd7uSFIumcpVkt2jRYR20gNQiD6X6u/6DFS
 JxWBGk/neScszMBQA+vjjL2GZk5zQ+EmJ0kVOJ9VU5tB/R3qQIk/V3Uh9vO8jg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Mon, 24 Feb 2025 02:56:16 +0100
Subject: [PATCH v3 1/8] dt-bindings: clock: qcom: Add MSM8937 Global Clock
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-msm8937-v3-1-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740362181; l=3862;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=n3wF9ofnaCPK7xJBTkv8HpaI2TqqkVSMcvMgSDnLe8M=;
 b=iiabqA/jPe7fJWsMgiYy7PxqGbbKGjx2gqwRXkIRSFlNS5NJ7G1yKoL8cTiEoO2DN/UBeUv7M
 sfQyVr6LS3LDKonn5VhwZXyNrbjnpOR/861wogJdDjdtCM32PMDhBzb
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

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/clock/qcom,gcc-msm8937.yaml           | 73 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 +++++
 2 files changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7b9e0de6dbd450c582a9eb459302892825f54b9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8937.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on MSM8937
+
+maintainers:
+  - Barnabas Czeman <barnabas.czeman@mainlining.org>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on MSM8937.
+
+  See also::
+    include/dt-bindings/clock/qcom,gcc-msm8917.h
+
+properties:
+  compatible:
+    const: qcom,gcc-msm8937
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: DSI phy instance 0 dsi clock
+      - description: DSI phy instance 0 byte clock
+      - description: DSI phy instance 1 dsi clock
+      - description: DSI phy instance 1 byte clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: dsi0pll
+      - const: dsi0pllbyte
+      - const: dsi1pll
+      - const: dsi1pllbyte
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gcc: clock-controller@1800000 {
+      compatible = "qcom,gcc-msm8937";
+      reg = <0x01800000 0x80000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&dsi0_phy 1>,
+               <&dsi0_phy 0>,
+               <&dsi1_phy 1>,
+               <&dsi1_phy 0>;
+      clock-names = "xo",
+                    "sleep_clk",
+                    "dsi0pll",
+                    "dsi0pllbyte",
+                    "dsi1pll",
+                    "dsi1pllbyte";
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
index 4b421e7414b50bef2e2400f868ae5b7212a427bb..ec1f0b261dd5ccfe4896a00ffa9cf86de98b9cb3 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -170,6 +170,22 @@
 #define VFE1_CLK_SRC				163
 #define VSYNC_CLK_SRC				164
 #define GPLL0_SLEEP_CLK_SRC			165
+#define BLSP1_QUP1_I2C_APPS_CLK_SRC		166
+#define BLSP1_QUP1_SPI_APPS_CLK_SRC		167
+#define BLSP2_QUP4_I2C_APPS_CLK_SRC		168
+#define BLSP2_QUP4_SPI_APPS_CLK_SRC		169
+#define BYTE1_CLK_SRC				170
+#define ESC1_CLK_SRC				171
+#define PCLK1_CLK_SRC				172
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK		173
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK		174
+#define GCC_BLSP2_QUP4_I2C_APPS_CLK		175
+#define GCC_BLSP2_QUP4_SPI_APPS_CLK		176
+#define GCC_MDSS_BYTE1_CLK			177
+#define GCC_MDSS_ESC1_CLK			178
+#define GCC_MDSS_PCLK1_CLK			179
+#define GCC_OXILI_AON_CLK			180
+#define GCC_OXILI_TIMER_CLK			181
 
 /* GCC block resets */
 #define GCC_CAMSS_MICRO_BCR			0
@@ -187,5 +203,6 @@
 #define VENUS_GDSC				5
 #define VFE0_GDSC				6
 #define VFE1_GDSC				7
+#define OXILI_CX_GDSC				8
 
 #endif

-- 
2.48.1

