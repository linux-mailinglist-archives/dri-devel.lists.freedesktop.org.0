Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E18978358
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D417410EAE0;
	Fri, 13 Sep 2024 15:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FZWP44oM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5F410EAE0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:10 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5c260b19f71so2563041a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240089; x=1726844889; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8TL6f8TKN7Y/fNaq3ZvIvFLqSapBDT3e44bO5HpzYRM=;
 b=FZWP44oMj4MR3FeWQMbbeMWRxoMDMQfQ+/rqPA2sxpvA+2EfTFwEmTLq2iGif4fA3c
 Bn6BzcdfyI0CgtenoKq6XGljmJY9Hmn2pDpD5W2mT94YEkuO8IGSBkC9htNz00aeqmJW
 X2jy1+CStQojgCkbTfm2mseL8+7oTVEj0yp05YdMkrolWxMbyuf308CvuGzGCNFzXAoq
 7d8UNqn0YC7hyqLTo+L9rZiYHsDPVUtkp4QjdpOdvDyzBROTS06egmD2useyZGIvmdqF
 ydRoBY6f6T2Mmgii0JumUBEcYPONaUWy/+odutSM1WSK29qO+mHYGQdEYVOPzFlFTNo1
 A2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240089; x=1726844889;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8TL6f8TKN7Y/fNaq3ZvIvFLqSapBDT3e44bO5HpzYRM=;
 b=J0Rx0U3DTcsTDVvChZIJHhlNtwGozX6P1KGvtIdAwr6tDrLPKkQlBSyYJ+Gc/vRlvq
 g3Bfl4FWr8lf0AI8A1fy+oSKjdglry5sKmzU82ciHELt7d3d1NcZTUHwRaP208XKiHCR
 aqbAkw6WlslULtADVPyT1gs4UcM6gBXGGea9s1YcWO+IfvDwmtB/WyWDp+X6gX99jRxJ
 hfawwaSGr37iUBEjuTJPicgG3tQga2tK6czyHN9OUqBWosXoKp9Ixy6ED/QSuwRQP25G
 NChYs8yEpbIqW++O1Qir62hMenr5xR1ogT3s/GeXM3G3Ur2/p0zzOfwUOIJUrqXysUmD
 PG+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7jQkPKA0y1weu27/f+qlyS+lsoep5wuVcXRIHIukqAZWpL7TrLE834ZchOoulXKEyWkdD5R2jsmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9istUOyYCgw79HTgD22YJWkwTjQl0V/zh4zXtD3G7fb+gWwwG
 5sfizXy9SoXHL10Wc7H89c89XxskbvdjV8DBt8oFSmIalUc8zppn
X-Google-Smtp-Source: AGHT+IGCrPHc6XJmItNolCKG1S2T9m458hednz3DQSJjw+4zbXzSksgr4EytAX8pJ7+f4cKbcW2T4A==
X-Received: by 2002:a05:6402:254d:b0:5be:eb19:ee56 with SMTP id
 4fb4d7f45d1cf-5c413e4beb1mr4913390a12.24.1726240088850; 
 Fri, 13 Sep 2024 08:08:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:08 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v4 00/27] This is continued work on Samsung S9(SM-9600)
 starqltechn
Date: Fri, 13 Sep 2024 18:07:43 +0300
Message-Id: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEBV5GYC/4WOQQ6DIBREr2JYlwbBoumq92iM+dCvkCBaQNPGe
 PdSk667fJPMvNlIxGAxkmuxkYCrjXbyGapTQbQBPyC1j8yEM14xWdY0JghPl1Ab31mfcAiQcqd
 b5pgCwkiVbmRzYYr3KEieURCRqgBemzzkF+dyOAfs7evw3tvMxsY0hfdxYxXf9Gds/htXQRlF0
 UspOStr0LdhBOvOehpJu+/7B8ia1HHlAAAA
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=6082;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=zNden+m4S4qeBBrgrI7oJVPZCF0D5TInPx+aEZ7wheQ=;
 b=UUZqRammNe7VcfWZLb30fPL0Xxh1/CVZzJysjzjyy73+yDJfntHzaz6edzfCSsVZPKwnXtfqT
 U0ypRVySOtbBmhAnJqwywXsdHXAhJEiJ+ZWn4X6xLJ47gQEVHvejpSv
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Add support for new features:
- sound (headphones and mics only)
- gpu
- panel
- buttons
- MAX77705 MFD:
  - charger
  - fuelgauge
  - haptic
  - led

Changes in version 2:
- s2dos05 regulator:
  - hex to decimal in regulator values
  - fix compatible value
  - remove interrupt specific code, because it's
    empty in vendor kernel, and I cannot test it on
    available hardware anyway.

Changes in version 3:
Version 3 has significant changes:
- more drivers added
- s2dos05 driver converted to MFD
- disable crypto patch removed(disabled on distro level)
- dts framebuffer node along with related patches removed,
because panel driver added
- fix 'make O=.output_arm64 CHECK_DTBS=y qcom/sdm845-samsung-starqltechn.dtb'
errors, but it still complains on 'monitored-battery' and
'power-supplies' though I have 'power-supply.yaml' link in charger
and fuel gauge bindings.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v4:
- Rewrite max77705, max77705_charger, max77705_fuel_gauge from scratch
- Reorder patches:
  - squash max77705 subdevice bindings in core file because
    no resources there
  - split device tree changes
- Use _ as space for filenames in power/supply like the majority
- Replace gcc-845 freq_tbl frequencies patch with new approach,
  based on automatic m/n/pre_div value generation
- Link to v3: https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com

---
Dzmitry Sankouski (27):
      power: supply: add undervoltage health status property
      clk: qcom: clk-rcg2: name refactoring
      gcc-sdm845: Add general purpose clock ops
      dt-bindings: panel: add Samsung s6e3ha8
      dt-bindings: mfd: add maxim,max77705
      dt-bindings: mfd: add samsung,s2dos05
      drm/panel: Add support for S6E3HA8 panel driver
      mfd: max77693: remove unused declarations
      mfd: Add new driver for MAX77705 PMIC
      input: max77693: add max77705 haptic support
      power: supply: max77705: Add charger driver for Maxim 77705
      power: supply: max77705: Add fuel gauge driver for Maxim 77705
      leds: max77705: Add LEDs support
      mfd: sec-core: add s2dos05 support
      regulator: add s2dos05 regulator support
      arm64: dts: qcom: sdm845: enable gmu
      arm64: dts: qcom: starqltechn: remove wifi
      arm64: dts: qcom: starqltechn: fix usb regulator mistake
      arm64: dts: qcom: starqltechn: refactor node order
      arm64: dts: qcom: starqltechn: remove excess reserved gpios
      arm64: dts: qcom: starqltechn: add gpio keys
      arm64: dts: qcom: starqltechn: add max77705 PMIC
      arm64: dts: qcom: starqltechn: add display PMIC
      arm64: dts: qcom: starqltechn: add touchscreen support
      arm64: dts: qcom: starqltechn: add initial sound support
      arm64: dts: qcom: starqltechn: add graphics support
      arm64: dts: qcom: starqltechn: add modem support

 .../bindings/display/panel/samsung,s6e3ha8.yaml    |  75 +++
 .../devicetree/bindings/mfd/maxim,max77705.yaml    | 169 ++++++
 .../devicetree/bindings/mfd/samsung,s2dos05.yaml   |  99 ++++
 MAINTAINERS                                        |  12 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |   4 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   4 -
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   4 -
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   4 -
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 573 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   4 -
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |   4 -
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   4 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   2 -
 drivers/clk/qcom/clk-rcg.h                         |   1 +
 drivers/clk/qcom/clk-rcg2.c                        | 243 ++++++++-
 drivers/clk/qcom/gcc-sdm845.c                      |  21 +-
 drivers/gpu/drm/panel/Kconfig                      |   7 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c      | 350 ++++++++++++
 drivers/input/misc/Kconfig                         |   4 +-
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/max77693-haptic.c               |  15 +-
 drivers/leds/Kconfig                               |   6 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-max77705.c                       | 158 ++++++
 drivers/mfd/Kconfig                                |  12 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/max77705.c                             | 248 +++++++++
 drivers/mfd/sec-core.c                             |  11 +
 drivers/power/supply/Kconfig                       |  13 +
 drivers/power/supply/Makefile                      |   2 +
 drivers/power/supply/max77705_charger.c            | 585 +++++++++++++++++++++
 drivers/power/supply/max77705_fuel_gauge.c         | 348 ++++++++++++
 drivers/regulator/Kconfig                          |   8 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/s2dos05-regulator.c              | 176 +++++++
 include/linux/mfd/max77693-common.h                |   6 +-
 include/linux/mfd/max77693-private.h               |  11 -
 include/linux/mfd/max77705-private.h               | 180 +++++++
 include/linux/mfd/max77705_charger.h               | 215 ++++++++
 include/linux/mfd/samsung/core.h                   |   1 +
 include/linux/power/max77705_fuelgauge.h           |  65 +++
 include/linux/power_supply.h                       |   1 +
 include/linux/regulator/s2dos05.h                  |  73 +++
 45 files changed, 3627 insertions(+), 101 deletions(-)
---
base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

