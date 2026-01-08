Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA74D00EA0
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 04:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4B510E670;
	Thu,  8 Jan 2026 03:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="NbNziHB0";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ASwF4KVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B8B10E670
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 03:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1767843801; bh=4mkalf5iikrptp+BJvqOi2W
 WeQZdLoJ+PfiutcDUaPg=; b=NbNziHB0cXSOf4dv2feHCLFz3hPMhwK/NtHD2V4HGbdjjLbCZd
 kEIVv1xZMjbdP0bli8YNynvrqZwONK31zCxeAREOuJlsKGvPDWM6iT5DQlvWQR9LobEShTXhPVw
 yoM049cSOxuOdl6ZVKxaWvYx/SZBTjUG/kZhEZL6hd4IaP42J+m/rnuA8Y9qQ6d5+4NiWxO1ax/
 tBsV9z4GvIGql3AlZNl88siHh1wzzcSf1U0hbDYVhF11RBYcX2Ax4kGm7lpEiLtylgVUHeMcrp1
 goLBexNeE+9L9pLHR5ORXHGB+4gAtRQcVjUK6TriqSs+n4WdTFBdJ+TboV6GcrxFD9g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1767843801; bh=4mkalf5iikrptp+BJvqOi2W
 WeQZdLoJ+PfiutcDUaPg=; b=ASwF4KVWOFgoTLy3moPeVAotLpUfCmUGeh5cNa9AgnMoLtUIZ/
 Not/PuYRguWMvhIefxBvqmZObayiv7ZdqcAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/7] Fix PMI8950 WLED ovp values and more
Date: Thu, 08 Jan 2026 04:43:18 +0100
Message-Id: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANYnX2kC/3XMyw6CMBCF4Vchs3ZMW225rHwPw6LCUCaBlrQGN
 YR3t7J3+Z/kfBskikwJmmKDSCsnDj6HOhXQjdY7Qu5zgxLKCClKXGauai3wNVGPDyGvuqwGU1o
 D+bJEGvh9cPc298jpGeLn0Ff5W/9Aq0SBmrQadGftpe5us2U/sWfvziE6aPd9/wIL1/idrQAAA
 A==
X-Change-ID: 20260107-pmi8950-wled-b014578f67a6
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=1531;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=lAFlcJa6yZSCswitINnF7QzcexO3g0TUjXUSDta3MZY=;
 b=6vMUOetyPD6aS5STCPI6lo5UHm7LzddPCosCQRFi4xPeERui3/WfdvtzHnm36nkDChtxI8BKI
 5603jaDfHfoC+cc+u6Is2aeTYSXFqe71EblQWm++4uUJmd6i+gyL8gK
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

This patch series fixes supported ovp values related to pmi8950 wled
and corrects wled related properties in xiaomi-daisy, xiaomi-land and
in xiaomi-vince.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Rework ovp change to support pmi8994 also.
- Reword commits.
- dt-bindings: Set min max for qcom,ovp-millivolt.
- Link to v1: https://lore.kernel.org/r/20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org

---
Barnabás Czémán (7):
      dt-bindings: backlight: qcom-wled: Document ovp values for PMI8994
      backlight: qcom-wled: Support ovp values for PMI8994
      dt-bindings: backlight: qcom-wled: Document ovp values for PMI8950
      backlight: qcom-wled: Fix ovp values for PMI8950
      arm64: dts: qcom: msm8953-xiaomi-vince: correct wled ovp value
      arm64: dts: qcom: msm8937-xiaomi-land: correct wled ovp value
      arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight

 .../bindings/leds/backlight/qcom-wled.yaml         | 24 +++++++++++--
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |  2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |  2 +-
 drivers/video/backlight/qcom-wled.c                | 42 ++++++++++++++++++++--
 5 files changed, 65 insertions(+), 7 deletions(-)
---
base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
change-id: 20260107-pmi8950-wled-b014578f67a6

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>
