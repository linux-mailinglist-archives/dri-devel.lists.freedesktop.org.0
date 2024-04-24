Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590668B0E3E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A91113C19;
	Wed, 24 Apr 2024 15:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IIDpgYUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8B7113C12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:29:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0295CCE173A;
 Wed, 24 Apr 2024 15:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C28FC2BBFC;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713972570;
 bh=Vu6DELfonvw9lHN74NiHvN61NDGymX7hh/EgpU943Z8=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=IIDpgYUIYDxVPYwvmFfvmYTPmf2rzD8RFT+xcM0lc7K4VMHzEbuJC0404e8CSqBph
 bXHXQvM8674Rfh4yJAp5qkeMY7y6vtieYL/0NemLVdCJ3HLSVn2AebAwh3o/jiD6fp
 ZJFKsIcXHVvDmwvYN0Y4qmRdijtxkTMIM89GTTZBhFhIZR8eJouqrFeT8Av+pnAL3n
 8HYkJf4gTSb88T2Lzn3BbHnSQX0I9LxNgDM/6dnyfVCSrhcyllqENkasrcSS2K8yqm
 xqcj3OK7AIiP/QW5JzDjFIjOwj4kfFJmVoy/bMNA6lGViVp4hN5TK1yrY9QuOHTKkV
 6Q2kRDXcQGHoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F1A98C4345F;
 Wed, 24 Apr 2024 15:29:29 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Subject: [PATCH 00/10] AYN Odin 2 support
Date: Wed, 24 Apr 2024 23:29:05 +0800
Message-Id: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEElKWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEyMT3cTKPN38lMw8I93MvMySzMQcXUvTJPNkAzOD5BQDYyWgvoKi1LT
 MCrCZ0bG1tQCEsBlwYwAAAA==
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Molly Sophia <mollysophia379@gmail.com>, Junhao Xie <bigfoot@classfun.cn>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713972563; l=2387;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=Vu6DELfonvw9lHN74NiHvN61NDGymX7hh/EgpU943Z8=;
 b=XA7dmSSQgwlHKJcd7j3RMyizgYSyuIyC12qzPEZzPft0iV8Pp7Rfl5ki1fbT8Bdw6JOL6UExt
 iQdQLO/Vjk+CrumZWFFtdE2wE1xqX6UcD6C+rqW72OO3ExlyiiYCM/N
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
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
Reply-To: wuxilin123@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AYN Odin 2 is a gaming handheld based on QCS8550, which is derived
from SM8550 but without modem RF system.

This series bring support for:
* Remoteprocs
* UFS storage
* SD Card
* Type-C with USB3 10Gbps and DisplayPort (4-lane requires a pending
  patch)
* PCIe0 (Wi-Fi requires the pending pwrseq series)
* Bluetooth
* Regulators
* Integrated fan with automatic speed control based on CPU temperature
* Power and volume keys
* M1, M2 buttons
* HDMI output up to 1080p 60hz
* four groups of RGB lights
* GPU
* Internal DSI display with touchscreen

Depends: [1]

[1] https://lore.kernel.org/all/20240424024508.3857602-1-quic_tengfan@quicinc.com/

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
---
Junhao Xie (2):
      dt-bindings: pwm: Add SI-EN SN3112 PWM support
      pwm: Add SI-EN SN3112 PWM support

Xilin Wu (8):
      dt-bindings: display: panel: Add Synaptics TD4328
      drm/panel: Add driver for Synaptics TD4328 LCD panel
      arm64: dts: qcom: pmk8550: Add PWM controller
      arm64: dts: qcom: sm8550: Add UART15
      arm64: dts: qcom: sm8550: Update EAS properties
      dt-bindings: vendor-prefixes: Add AYN Technologies
      dt-bindings: arm: qcom: Add AYN Odin 2
      arm64: dts: qcom: Add AYN Odin 2

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 .../bindings/display/panel/synaptics,td4328.yaml   |   69 +
 .../devicetree/bindings/pwm/si-en,sn3112-pwm.yaml  |   55 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |   10 +
 arch/arm64/boot/dts/qcom/qcs8550-ayn-odin2.dts     | 1410 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   54 +-
 drivers/gpu/drm/panel/Kconfig                      |   10 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-synaptics-td4328.c     |  246 ++++
 drivers/pwm/Kconfig                                |   10 +
 drivers/pwm/Makefile                               |    1 +
 drivers/pwm/pwm-sn3112.c                           |  336 +++++
 14 files changed, 2190 insertions(+), 16 deletions(-)
---
base-commit: 90388b2f9fa5f332289335f99996e252697c0242
change-id: 20240424-ayn-odin2-initial-95b7c060cd03

Best regards,
-- 
Xilin Wu <wuxilin123@gmail.com>


