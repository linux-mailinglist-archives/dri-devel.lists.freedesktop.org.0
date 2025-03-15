Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD4A62E9A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 15:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5DE10E297;
	Sat, 15 Mar 2025 14:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="fnlhe2CB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B8D10E1F1;
 Sat, 15 Mar 2025 14:58:12 +0000 (UTC)
Received: from [192.168.183.162] (254C339A.nat.pool.telekom.hu [37.76.51.154])
 by mail.mainlining.org (Postfix) with ESMTPSA id 2311EBBAC0;
 Sat, 15 Mar 2025 14:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1742050687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FmVx/4AyGD/aMwlNSJd9Y627FtpqEeVAICF+Holg0IU=;
 b=fnlhe2CBIIfxzBLBDbt3DeYxtaaa9Y18Du5dMDU1Ihuj65nOiJWEqwNq0Gzkx4GYOFc1Ut
 IZZBBYpeOqn7C0OQRjuiYFfABij97cmMDWYkND9DFW1MX2pUCuTYnfwmB4icMSQUu9i06d
 YtZwRLZiFD6zuN1x838hKWg/V1OnqBbs9ieU0wfyxblAo8yMIEx9iiJF4PmrkEKB2BQedX
 Ym+jdsVwZ+1lQzwiEKj0IpCGGiBTCJRyNOreQFe8Fo8WTynkNUYUaI/KBsVkclqqcKC6LT
 +qnRo1sYoowii16qub41zcNXhXvNebSoWbNFDB7c86jn76RswifhmEccFxQiBQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v4 0/6] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Sat, 15 Mar 2025 15:57:34 +0100
Message-Id: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF6V1WcC/23MQQ6CMBCF4auYrq1pp0jBlfcwLqAdYBIppjWNh
 nB3C4lCoss3me8fWUBPGNhpNzKPkQINLo1sv2Omq1yLnGzaDAQcBUjB+9AXpdIcoMBGWKPQlCx
 93z029FxKl2vaHYXH4F9LOMr5+mnIbyNKLri2oNHmutGiOPcVuRs5cu1h8C2bQxE2GNSKIeG6L
 HU65gqt+ovVFmcrVgnbymojCzDG1D94mqY3ApD/bB0BAAA=
X-Change-ID: 20250210-msm8937-228ef0dc3ec9
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
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>, Adam Skladowski <a39.skl@gmail.com>, 
 Dang Huynh <danct12@riseup.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742050684; l=2644;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=9nYzGQvmx6WFgfbqPRmrGyA1FvxrIDEuq6WTjGtHIBE=;
 b=sM5mQ+PXxva7V8jC6E7KlV8VS02TfuWk836AaRTgvfi10SrkvBAz8iGZBunm6IJ8fCv+BXLjq
 s8ibCMaPiPyCbCPGrCS6Y6vPrX+ETPOgD6/3eYjJve/2BjjHhkXE0Hw
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

This patch series add initial support for MSM8937 SoC
and Xiaomi Redmi 3S (land).

The series is extending the MSM8917 gcc and pinctrl drivers
because they are sibling SoCs.
MSM8937 have 4 more A53 cores and have one more dsi port then
MSM8917.
It implements little-big architecture and uses Adreno 505.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v4:
- Add missing rpmcc include for qcom,gcc-msm8937 dtbinding exmaple.
- msm8937: add missing space after s9-p1@230
- msm8937-xiaomi-land: replace LED_FUNCTION_INDICATOR to LED_FUNCTION_STATUS
- Remove applied patches
- Link to v3: https://lore.kernel.org/r/20250224-msm8937-v3-0-dad7c182cccb@mainlining.org

Changes in v3:
- Fix qcom,gcc-msm8937 dtbinding example 
- Link to v2: https://lore.kernel.org/r/20250223-msm8937-v2-0-b99722363ed3@mainlining.org

Changes in v2:
- drop applied patches
- drop gcc schema commits infavor of a new schema for gcc-msm8937
- document always on clock for adreno 505/506/510
- msm8937:
  - set cache size
  - rename cpu labels
  - fix style issues addressed by review
- msm8937-xiaom-land:
  - remove unused serial0 alias
  - remove regulator-always-on from pm8937_l6
  - add blue indicator led for aw2013
- Link to v1: https://lore.kernel.org/r/20250211-msm8937-v1-0-7d27ed67f708@mainlining.org

---
Adam Skladowski (1):
      dt-bindings: drm/msm/gpu: Document AON clock for A505/A506/A510

Barnabás Czémán (3):
      dt-bindings: clock: qcom: Add MSM8937 Global Clock Controller
      dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      arm64: dts: qcom: Add Xiaomi Redmi 3S

Dang Huynh (1):
      arm64: dts: qcom: Add initial support for MSM8937

Daniil Titov (1):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8937

 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 .../bindings/clock/qcom,gcc-msm8937.yaml           |   75 +
 .../devicetree/bindings/display/msm/gpu.yaml       |    6 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  408 ++++
 arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2149 ++++++++++++++++++++
 drivers/clk/qcom/Kconfig                           |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  617 +++++-
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   17 +
 9 files changed, 3277 insertions(+), 9 deletions(-)
---
base-commit: da920b7df701770e006928053672147075587fb2
change-id: 20250210-msm8937-228ef0dc3ec9

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>

