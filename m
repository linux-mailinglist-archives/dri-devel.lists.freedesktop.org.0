Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1AECFE05F
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD99C10E5DF;
	Wed,  7 Jan 2026 13:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="SnVdakAh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dNUaG0U0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F008B10E5E5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1767792672; bh=vMtYM0nxoHV7UFP+DHc4d1k
 uhCTawZBNaLpGym/DqZ4=; b=SnVdakAhoU6HzvgW4pZ1w0mCi40Sil3JNbHQ7+pGEsWzXvmAfz
 xAXo1u69dTJB52R+iuxaPvS77bsls5WqMl6sSmJuAMO5HevYmy4YIT0oeEq9Pv9uynxwGz4MM4S
 I1c21Z4FgCC4qSgwWow2jK61pr86ZREIh70Atw0rOrhffEiUvn9R+szvNVNCemYpGwqsc69sJ20
 R0cHkPwAOHlzAVIeTYMqLb+XpR/LJygrTIUGJHtDw9odG4DerqOE8Ki3wInxZM6FO2Akg/Owusx
 uKRqAVfXwChoH5kKI2dt88Le/YNe5A60J9IXyYl4xHleRuJQ6uLsx3qgrhtXaM88rEg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1767792672; bh=vMtYM0nxoHV7UFP+DHc4d1k
 uhCTawZBNaLpGym/DqZ4=; b=dNUaG0U0yQauHAP7pjt3Xo4RkwNRErl12aVSeLQ0GAfYw6Mrrn
 GekjNwxjK0vTtuif5RVBkQ6JDhC6nPoz+/Ag==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/5] Fix PMI8950 WLED ovp values and more
Date: Wed, 07 Jan 2026 14:31:04 +0100
Message-Id: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABhgXmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNz3YLcTAtLUwPd8pzUFN0kA0MTU3OLNDPzRDMloJaCotS0zAqwcdG
 xtbUASKq5+V4AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767792670; l=1163;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=rcB91V+MiBBf1Gpy7LPeyro72nzwXi0iP2zCyDfwjuo=;
 b=E8V7HXfevdmZ1qRo2dW+IMTQhXurrQZITpGXqcHNktfXQPqqV41b7b+5AtyG2xPU6tpEBfpQ1
 8mTY/CTvysACCBdSLUbvQIWNX56DSVU92oQqQOEj+XoG45V7Mc+dPbL
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
Barnabás Czémán (5):
      dt-bindings: backlight: qcom-wled: Document ovp values for PMI8950
      backlight: qcom-wled: Support ovp values for PMI8950
      arm64: dts: qcom: msm8953-xiaomi-vince: correct wled ovp value
      arm64: dts: qcom: msm8937-xiaomi-land: correct wled ovp value
      arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight

 .../bindings/leds/backlight/qcom-wled.yaml         | 20 +++++++++--
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |  2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |  2 +-
 drivers/video/backlight/qcom-wled.c                | 41 ++++++++++++++++++++--
 5 files changed, 60 insertions(+), 7 deletions(-)
---
base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
change-id: 20260107-pmi8950-wled-b014578f67a6

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>
