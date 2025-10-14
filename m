Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D3BD9DB4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 16:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D5E10E61D;
	Tue, 14 Oct 2025 14:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="ZyQO1s+I";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9VLwke00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311CB10E61D;
 Tue, 14 Oct 2025 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1760450668; bh=POZJoYeAh9Ape4Vz22iS9RG
 4lQbKzFY6rrb0lkpBS60=; b=ZyQO1s+ItIpEJCKAc50L5zX7OpM1v8EQ43mrU5aI8ZrbMO/Bpq
 +gOeL0xMnouZdOYa1cYPNLgdP3kjUA4Vi5xzCFp7eShX1ExplQORdjrtSNVtibxH/I7vPwywv3s
 nLiROVRRvnmm9vE+fl/jqWefObFu6UuMnBNDg87dmFJdwSwrTbJ1+4wvtfBbHEHU5qFTItOt6/x
 NCuZ+7/5+sWA19WER6T2CmeIUGgJNGAxRCjVWGoeBJE2Zg0qxeJOkDBH0m6f9HaG+ywB7dYO8jT
 gE25LIoCrJxPiH1atiav6VtROmvhsPEdLA7sUeszt7stFulNs6034UCER9UutKUIAGA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1760450668; bh=POZJoYeAh9Ape4Vz22iS9RG
 4lQbKzFY6rrb0lkpBS60=; b=9VLwke00XwuZlNV4JY4llWmJIgCSGsivffnez+tmhUurwd3RC9
 TlHnA67EOLZ45l8kZVzvAahT2dnyfUAaFzCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v10 0/3] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Tue, 14 Oct 2025 16:04:23 +0200
Message-Id: <20251014-msm8937-v10-0-b3e8da82e968@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGdY7mgC/3XRwU7EIBAG4FfZcLaGGdoO48n3MB7oAF0S2zWta
 TSbfXfpJkoT8TgTvn8YuKo1LCms6ul0VUvY0poucy5AP5yUnN08hib53FCosdMIupnWybKhBtG
 GqL2YIKzy6fclxPR5j3p5zfU5rR+X5euevMHe/cmA34wNGt2QRwq+p0jaPk8uzW9pTvP4eFlGt
 QdteMBoCsaMB2bKzd4Eb6rYHHFbsMnYO08CFkVkqOK2YANdwW3GEMFgsKRdy1XcFdziYeduv3Z
 kSxwitL6O+4Itlkff+h1r1gM6GXoKVUwHbA6TKWM06DgOwG6gKrb/YLtPJi++N+Kckyrmglkfv
 oozdppJGKSzGv7g2+32Ddw76ZGMAgAA
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
 Dang Huynh <danct12@riseup.net>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760450666; l=3812;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=C+I7jRzy1uHJ8YIDmnk3OZCclxRG44SM/5BgAM5ngnA=;
 b=XwivLAYsPR4LZnKO9q5c7+bFeTDlvdy8G2gZvkodlsKGnvlLS7vSOvbr0krVq648cRwNcCqWl
 YIJu7HLB0FDAcRgq5zJpbMKQu5gcBUs5V57aEl/Xm8J2+GwBInUz0Uc
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
Changes in v10:
- Rebase on latest next.
- Remove applied patches.
- Link to v9: https://lore.kernel.org/r/20250903-msm8937-v9-0-a097c91c5801@mainlining.org

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
Barnabás Czémán (2):
      dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      arm64: dts: qcom: Add Xiaomi Redmi 3S

Dang Huynh (1):
      arm64: dts: qcom: Add initial support for MSM8937

 Documentation/devicetree/bindings/arm/qcom.yaml  |    6 +
 arch/arm64/boot/dts/qcom/Makefile                |    1 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts |  381 ++++
 arch/arm64/boot/dts/qcom/msm8937.dtsi            | 2133 ++++++++++++++++++++++
 4 files changed, 2521 insertions(+)
---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20250210-msm8937-228ef0dc3ec9

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>
