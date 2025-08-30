Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA04CB3D00D
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 00:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF6710E293;
	Sat, 30 Aug 2025 22:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="V525SsJG";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ObrS52SG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE4110E291;
 Sat, 30 Aug 2025 22:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1756593500; bh=sJBbh12ISrJRahnF37YRfUd
 ntH2Zj/Dof0WzSnco3wM=; b=V525SsJGaAnwPq+t9xAPlVv0j9F8sS1QAB0b6Ow9//Lg/DesHT
 sYjew1Mk7b2Am7dSbJ3pkhoJ1WRcjwv/maOUH3JZymZBTscAcw30NZnter5ZBrhMMthnXLQgKDO
 Qf5zuNVQ00/i5EQu8+5reQ0H5nsmLUSN0+d6U51QuzGd2j/f0BtRrynWDe13V+dYRb0XS5JakTf
 H4MvG0o2ddn9dRMLLHVtcSD06skEknXSIbW2SICQFKc+iZT64zgQV0/mis9pvsSXGLWMRGRyXsh
 YocEgIkTL/U2ggT30iQdudiSl96iRz8RjfIjr5oHXdBUzej1ThpZ/QBFE7XSxNv0wlQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1756593500; bh=sJBbh12ISrJRahnF37YRfUd
 ntH2Zj/Dof0WzSnco3wM=; b=ObrS52SGDuDkUG7OYrYEfVVSl5WFuyGMCQBb2cR8mQZyipBfif
 jq1RZwNg/9vBaWPOaMAnnsz3nN54i1HMGqAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v7 0/6] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Sun, 31 Aug 2025 00:38:12 +0200
Message-Id: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFR9s2gC/23QwWrEIBAG4FdZPNeio3G0p75H6SHRMSs0yWKKt
 Cx595qF1kBz/Ae/n3HubKWcaGUvlzvLVNKalrkGfLowf+3nkXgKNTMQ0AmQgk/rZJ1CDmApiuA
 Vecfq61ummL4eTW/vNV/T+rnk70dxkfv0t0P+dRTJBccASMFgRGFfpz7NH2lO8/i85JHtRQUOG
 FTDUPHgHNahURTUKVZHrBtWFYc+oJcWvPfDKdYNK9k1rCuWUSogi6LX7hR3DWs4/Lnb147OoqM
 odTjHpmEL7ejF7Fg4MUDvB4P0D2/b9gPKPdAX1AEAAA==
X-Change-ID: 20250210-msm8937-228ef0dc3ec9
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Daniil Titov <daniilt971@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dang Huynh <danct12@riseup.net>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756593498; l=3677;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=IuNo5LYqCPvx/bmG5bVEJ7GNfYLU2l5PW8pqqLvr0FA=;
 b=JmEkgEoQFTvoyzCT4SGtdSTtC7G04pIOn1TLJGFJbeQ8s6TOaK2UASahhtHzNkP6Sa0MkCDCg
 eufnpkXrgzzAPg26B3aFppdfWenkSFLpvWJWKWwm9JbzQQlfQJecky2
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
Changes in v7:
- gpu.yaml: update adreno 505 pattern
- Link to v6: https://lore.kernel.org/r/20250820-msm8937-v6-0-b090b2acb67e@mainlining.org

Changes in v6:
- msm8937:
  - Fix nodes ordering.
  - Format clocks, reg, dmas and -names properties.
  - Add gpu_speedbin.
- Describe A505 clocks.
- Link to v5: https://lore.kernel.org/r/20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org

Changes in v5:
- msm8937:
  - Remove wrongly defined idle-states.
  - Fix thermal zones.
  - Use the header with DSI phy clock IDs.
  - Fix the nodes order.
  - Fix the pinctrls style.
  - Follow gcc header changes.
- msm8937-xiaomi-land:
  - Remove headphone switch and speaker amplifier bindings.
  - Unify status property style.
- gcc bindings:
  - Expand MSM8953 gcc schema with MSM8937.
  - Add MSM8937 prefix for MSM8937 specific clocks.
- gcc:
  - Follow the bindings changes.
- Drop alwayson clock documentation it will be handled in another
  patchset.
- Link to v4: https://lore.kernel.org/r/20250315-msm8937-v4-0-1f132e870a49@mainlining.org

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
Barnabás Czémán (4):
      dt-bindings: clock: qcom: Add MSM8937 Global Clock Controller
      dt-bindings: display/msm/gpu: describe A505 clocks
      dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      arm64: dts: qcom: Add Xiaomi Redmi 3S

Dang Huynh (1):
      arm64: dts: qcom: Add initial support for MSM8937

Daniil Titov (1):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8937

 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 .../bindings/clock/qcom,gcc-msm8953.yaml           |   11 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |    2 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  381 ++++
 arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2134 ++++++++++++++++++++
 drivers/clk/qcom/Kconfig                           |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  617 +++++-
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   19 +
 9 files changed, 3166 insertions(+), 11 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250210-msm8937-228ef0dc3ec9

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>
