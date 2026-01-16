Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8DD2CF5F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E0610E7FD;
	Fri, 16 Jan 2026 07:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="WFKFORhR";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OK6MxOYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638BB10E7FD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1768547277; bh=lVpvJ+XJ8TLq81lwSOeh8p2
 a84h6Y3P65PxX77VIr4Q=; b=WFKFORhRa8Hpm8fzcFgr0hOmI5fqXSTEpJ4mTWyVlVL5mr2nTw
 OsEo/t0XDcGhR/6ANkxEWZFL1YkJXnnqgcPnyWv1nCZlVeOO5WomYkR60yhbJQFmP+LsyimHRaP
 55Gr+1Y/Ny+UjR3JTsgzLEGrpEe+Etw1J4L/804S8s0n5R9cLvHpmMTGOtK/GXch6Se9BqTPHE2
 z/2AJ/1c60IpxFiau22IjHINCUMkMy9sY1uTcukNj/adgkHDA1BzmTzzSA9krVyHupbb+Q/IiRe
 pqbNBgzZyAxO4mQWciT0F6Y+hc+jtGf+zlkBfMMNLhTjk7zS5NL9dmq/sSsYFUxBseg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Date:Subject:From; t=1768547277; bh=lVpvJ+XJ8TLq81lwSOeh8p2
 a84h6Y3P65PxX77VIr4Q=; b=OK6MxOYqlHUzv3C/pgwaJVF5U4PFnYHXI03knJ04NRewbEGo4d
 9AbHXszMUV27+4jZm8pGIy6/5FKBdstQvZAA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH v3 0/7] Fix PMI8994 WLED ovp values and more
Date: Fri, 16 Jan 2026 08:07:32 +0100
Message-Id: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMSw6CMBSF4a2Qjq1pC33gyH0YBxVu4SZQSGuqh
 rB3CyOjcfif5HwLiRAQIjkVCwmQMOLkc5SHgjS99R1QbHMTwYRinGk6j2hqyehjgJbeGK+kNk5
 pq0i+zAEcPnfucs3dY7xP4bXriW/rHyhxyqgEKZxsrC3r5jxa9AN69N1xCh3ZtCQ+BfMliCwYZ
 bQTJa90q3+EdV3fyfWaoe8AAAA=
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=1756;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=yju4oSxB0NaiCLqBM93QBdmsxVeT/doxDNhzm2PCA6Y=;
 b=kUGeeK4mRdlF/SOPDhacwvBN4DZafVp4JKjiCbogQYCAFlEAnp0nWJtKJ2QANj3dS3arq5P93
 BZ1d6wdO3SEA0CC5ZQAWVDFvYKu4XCouvmNmZvqQR97iRZOZVoM2Vlf
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

This patch series fixes supported ovp values related to pmi8994 wled
and set same configuration for pmi8950 wled.
It also corrects wled related properties in xiaomi-daisy, xiaomi-land and
in xiaomi-vince.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v3:
- pmi8950: reword the commit to make it more clearer
- Link to v2: https://lore.kernel.org/r/20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org

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
      backlight: qcom-wled: Change PM8950 WLED configurations
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
