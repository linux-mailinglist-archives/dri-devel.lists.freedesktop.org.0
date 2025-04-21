Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC498A95729
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 22:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A5D10E4A8;
	Mon, 21 Apr 2025 20:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="dnSS8qmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B12F10E068;
 Mon, 21 Apr 2025 20:18:34 +0000 (UTC)
Received: from [192.168.183.162] (254C2769.nat.pool.telekom.hu [37.76.39.105])
 by mail.mainlining.org (Postfix) with ESMTPSA id 713D2BBAD2;
 Mon, 21 Apr 2025 20:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745266707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2s7t/jnFQ5IYzmw1pTsYPIv5DPpMMHbUNmN9wG24wrs=;
 b=dnSS8qmZxj1Re0S4hWlbITnkCGLfs4DGs7AX2QhV+fL8r5N9RM8PzmDIi4ok2hTn6XNLt5
 wgJ0c7kR4L/L7tab4CYhc8n05vIOZt7ls1RxYNasIkjweLStsOR7pvINtCwFUCpMn7K/0Z
 iH7FdA3ncN70pkduATzp8oVx8XQ0ApaOI/wijoTZY7EgavyJzHYQM4dpt4bnBFAs7f6o24
 rVtpW4+scaUBcUofgM5kdbAmQESVbfYzbB9MCcNHOQrAjTAbWw41kX66jPOVsxVz15EUYq
 OeztBBVPNafZg/wprr4CwMNurYTkv8MzTK4497MkpuOJ57KNidQIRWvZ6wa1iA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v5 0/5] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Mon, 21 Apr 2025 22:18:22 +0200
Message-Id: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA6oBmgC/23MQQrCMBCF4atI1kaSmdYkrryHuKjJtA7YVBIpi
 vTuRkEr6PIN8/13kSkxZbFZ3EWikTMPsYx6uRD+2MSOJIeyBSioFWgl+9xbh0YCWGpV8EjeifJ
 9TtTy9VXa7cs+cr4M6fYKj/p5fTf0pzFqqaQJYCisTWuU3fYNxxNHjt1qSJ14hkb4woAzhoIPz
 plyXCMF/IvxG1czxoJDE4zXFrz3h7+4mjHqesZVwbrVCGSNair3g6dpegA++3eDWgEAAA==
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
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>, Dang Huynh <danct12@riseup.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745266705; l=3161;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ZT6G0gLMpYOma7+nsyuQ5jRof3ch8u1E9cEnMHxyUSI=;
 b=Cnn8yNYhNWMRsGvjGORVd5qBpXDDR8h1RdPBXLl83ba2+UHgYGMpHT9LtJZC2dYHP+sta6Q+M
 hM9x7vRwArSDi3o5k5tQoq/8zohzLhBMqOcU7X7NdNr51bngfF9OzeV
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
Barnabás Czémán (3):
      dt-bindings: clock: qcom: Add MSM8937 Global Clock Controller
      dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      arm64: dts: qcom: Add Xiaomi Redmi 3S

Dang Huynh (1):
      arm64: dts: qcom: Add initial support for MSM8937

Daniil Titov (1):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8937

 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 .../bindings/clock/qcom,gcc-msm8953.yaml           |   11 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  381 ++++
 arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2069 ++++++++++++++++++++
 drivers/clk/qcom/Kconfig                           |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  617 +++++-
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   19 +
 8 files changed, 3101 insertions(+), 10 deletions(-)
---
base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
change-id: 20250210-msm8937-228ef0dc3ec9

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>

