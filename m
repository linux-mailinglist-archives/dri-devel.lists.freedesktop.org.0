Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6EB42BB4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66DD10E941;
	Wed,  3 Sep 2025 21:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="m9Kwi8LT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VKxRCq3G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A902C10E93F;
 Wed,  3 Sep 2025 21:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1756933741; bh=bqzHAqPKSIfqbGTnCGmLkW+
 yGY7a0Pdl1meacZYhxxA=; b=m9Kwi8LTmBFMnmoU7p1Qafwr25r/1A1zb91u0Ke/4xTxVWtsUF
 Krn22Yj3cma5ReSQ2KuVNuHtQRh8jz91JI7DYBwy2+EhtK5F0r/kauMFctbDrgk5h3WVwi3qnXJ
 3+Nk4ihPR63UlAT4stOREltJ21dRqwKtORAS0yxH880qC+B0BuTwG0PB13KXhzEkCG2dqobSPOt
 QV3fyDKIwhiPqMiDr4mOC8AybZg4eUcgUyX6QkDNzlxYoHRF3LrnwVV8zY2az43kWRrCAqfmcVa
 zPyfBA3AET57O+LvsjAm8eatRvlc813GBb8ioKLU0TsOd+Kl7S8S9StIY9ulbTcAxeQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1756933741; bh=bqzHAqPKSIfqbGTnCGmLkW+
 yGY7a0Pdl1meacZYhxxA=; b=VKxRCq3GfZGFxVtbP/7IcagYnTUr5Tj5DXSGGMtNbx8u+ib1I2
 bKC9+ypFN/NjXUiiTSVOplkNzLREuBKzuOCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v9 0/7] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Wed, 03 Sep 2025 23:08:20 +0200
Message-Id: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAESuuGgC/3XQzU7FIBAF4Fe5YW0NzFAGXPkexgW/vSS2Na1pN
 Dd9d+lNlCbi8kz4zgA3tsYlx5U9XW5siVte8zyVYB4uzF/tNMQuh5IZcOg5CN6N66gNUgegY+L
 BY/SGldPvS0z589708lryNa8f8/J1L97EMf3pEL8dm+h4RwEoBkWJuH4ebZ7e8pSn4XFeBnYUb
 XDCgBVDwc4YKkOFMWAT4xnLirHgYAN5ocF775pYVoyir1gWLJJAiJq4laaJ+4olnN7cH9dORpO
 JScjQxqpiDfXTN3VgbrgD652i2MR0wnjaTAUDgjXJCWMdNbH+B+tjMwUfFHprrf+D933/BkWfB
 ytOAgAA
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
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756933738; l=4333;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=e1gjdWn0vKRwDlsZj/ZBmgG7bHXaMkWeD/hnuty2IY0=;
 b=xwPgJP+tj3ynGr1IcC2se1Xgm9RgJVHOyt8jT9LlbvM1HeYAYCt2hye+dVRU398Ye36vwSn/K
 BazDpx0Wtu/BwBi+rx/yasMb4aEiWsWaYPh6+39glEPuVl3bM2lKBA/
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
Changes in v9:
- msm8937:
  - Update vbif size to 0x3000.
  - Update qfprom size to 0x3000.
  - Remove extra line below wcnss-wlan2-pins.
  - Update gpu_speedbin address to 0x201b.
- qcom.yaml: Rebase on latest next.
- Link to v8: https://lore.kernel.org/r/20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org

Changes in v8:
- msm8937:
  - Fix scm compatible.
  - Fix position of sram@60000 node.
- Document qcom,scm-msm8937 compatible
- Link to v7: https://lore.kernel.org/r/20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org

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
Barnabás Czémán (5):
      dt-bindings: clock: qcom: Add MSM8937 Global Clock Controller
      dt-bindings: firmware: qcom,scm: Add MSM8937
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
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    3 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  381 ++++
 arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2133 ++++++++++++++++++++
 drivers/clk/qcom/Kconfig                           |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  617 +++++-
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   19 +
 10 files changed, 3168 insertions(+), 11 deletions(-)
---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250210-msm8937-228ef0dc3ec9

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>
