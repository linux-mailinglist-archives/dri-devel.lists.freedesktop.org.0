Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E89FD39DBC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 06:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B0010E357;
	Mon, 19 Jan 2026 05:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F1rGl5Yf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C2810E357
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 05:25:50 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-88a367a1dbbso65066476d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 21:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768800350; x=1769405150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcbVa3268lyqxBGM305ylj+tBhZM3T/QjOKg0r4LL34=;
 b=F1rGl5Yfp/r7jjOEyXZgkoL3dDHZQ7KzAaiDwR8M4tsyFPKYtcG1qPOd0851fOfU2E
 j9Gln0OFnQi9Vay8UQn13jCFZyhkN1Kp5JJ5t61suWiiagma7QmPH/o5B38YMertdADP
 bFaGJxjc5A+M19O5xL2+N/Uiz4prtpK8MCKz1WPefqEzF4QgainsHgc5lgLWSLLQJuLr
 2hZvL53tRv1PuvEoOQVvYo8BpZJkIYYSdkrDRb6O/8m5VN08f68w12NHEY2FishtrTBW
 AzxkSx7CJ2HqLVkR2xcVGdoU1rrHIDkt3Js9rciGtTjEJ0hYnFMpLF8hajUH+wpZkg0X
 m6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768800350; x=1769405150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KcbVa3268lyqxBGM305ylj+tBhZM3T/QjOKg0r4LL34=;
 b=oe2mh6ysCuuhtf9Ur184ISBNiZR1GNYR0Gquz3mPDr0EMNxI2Yy02ZZgXfZQtjcCMU
 +OIQ10nN4+FlGHIiCb92CxxW+VPPXIV+Q+lZZ1Ai9ibY2eomZFitRdN/TYrnI9ljdH4q
 ZCmlBg/QdJ5okxHC2ueOQMsvYNJFJeJZ7HF7KQkgMv9xUvbEvDtIgqSRZsGs/MZt+7Rw
 DZBCR50SFFDN+yvJhfbrLlJnCCEyD4NrJuUgzNIJsS6OvCaIJfwacPnpxWqtMXctrqat
 p71FQdomOXw300bfM9LO4rehfxRcL5pgHGEwrYILsEAS08Q7ZHH7y/+hHoVwPkCx9euH
 UMGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW82gEDOS44RRRO0aFxXq/JMyrnkf7OSM9viv6iJttvVvGJQKcHCk/Y4IHY5YIaXDwUQqxLg0iqF/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn4T94scBxoU0QESYakVZiEnRcFYfIsgP0SHv31m0dpkOU1b3t
 LTKU30l48VEYt6RNIXhDAzdZsRV10hGEtVbd2/74zTIU71G105CXcxp+ALhKjQ==
X-Gm-Gg: AZuq6aKkZPQQOzklfDGyA7hrE3vBuz4HLtD8CGnGBmjNjjUAiKIAuY/7st2WS4qAUpP
 slMHj2+PgX9TGa1OOQslhrM/mVzP7FdVU2Rok0t/ie45J2IR/O0Ll7R7A5gFMSv5V32rwuab7mQ
 hvDNIQWDtfCy3qXYOcKMQSDTUoQyddGp1mz6eWa20vcZZgQDoya/8Tv3dU1ayKfdDC6Lg6drfjI
 t2BLaAPYCEhIJlNT54qeaoUfVxBlAfTi2+F/EWbedqkgAge7vCl3+ePPfBRWpXQXmQe2khcASyX
 mX9d1l1KcN98xXTVrU3g1KLG19+o0FTE5HOzyMAmw04PEVs5dKladr6aC4uheeMAgHiQ267hol5
 ylO1DrKOyROgVkZxbsfILroJy/TIVNIDVYpU5301Uq5KElzOF+K67XcIlYVnsGCu04gk04XAkZE
 RnUGVSnw3p29iVy1F1akDJYWNuhoZfjIknSME19adeFhhu0MjXoIv4WDXTgy7g6bDmzfM=
X-Received: by 2002:a05:620a:4490:b0:8c5:c9a0:ac28 with SMTP id
 af79cd13be357-8c6a68ea37dmr1331140285a.21.1768793442571; 
 Sun, 18 Jan 2026 19:30:42 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:42 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, bavishimithil@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: 
Date: Sun, 18 Jan 2026 22:30:25 -0500
Message-ID: <20260119033035.57538-2-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Subject: [PATCH v4 00/10] Initial support for Samsung Galaxy Tab 2 series

This series adds initial support for the Samsung Galaxy Tab 2
(samsung-espresso7/10) series of devices. It adds support for 6 variants
(P3100, P3110, P3113, P5100, P5110, P5113). Downstream categorised them
based on 3G and WiFi, but since they use different panel, touch
controllers, batteries, I decided to categorise them based on screen
size as espresso7 and espresso10.

It adds basic functionality for both the models including panel, drm,
sdcard, touchscreen, mmc, wifi, bluetooth, keys, battery, fuel gauge,
pmic, sensors.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
Changes in v4
- Fixed syntax in doestek vendor
- Changed - to _ in node names
- Removed address/size-cells in chosen
- Added pinmux for i2c-gpio5,6,7, irled
- Allow sdcard to poweroff (reg_espresso_external)
- Changed power to key-power
- Order alphabetically in omap4_pmx_wkup and omap4_pmx_core
- Use generic node names
- Added TODO for future nodes
- Fix touchscreen values in espresso7 and espresso10
- Add dts to Makefile
- Commit message length under 75
- Link to v3: https://lore.kernel.org/linux-omap/20241108200440.7562-1-bavishimithil@gmail.com/
Changes in v3
- Use device tree from the correct branch
- Fix commit subjects to matching the subsystem
- Add Doestek vendor
- Add compatible for LVDS encoder
- Add compatibles for 7 and 10 inch panels
- Clean up device tree using "make CHECK_DTBS=y"
- Link to v2: https://lore.kernel.org/all/20241030211215.347710-1-bavishimithil@gmail.com/
Changes in v2
- Fix node names in common dtsi to have - instead of _
- Removed import for twl6030.dtsi
- Edited dts to completely use twl6032 nodes
- Fixed typo ldosb -> ldousb
- Link to v1: https://lore.kernel.org/all/20241030194136.297648-1-bavishimithil@gmail.com/
--

Mithil Bavishi (10):
  ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
  dt-bindings: vendor-prefixes: Add Doestek
  dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
  dt-bindings: display: panel-lvds: Add compatible for Samsung
    LTN070NL01 Panel
  dt-bindings: display: panel-lvds: Add compatible for Samsung
    LTN101AL03 Panel
  ARM: dts: ti: omap: espresso-common: Add common device tree for
    Samsung Galaxy Tab 2 series
  dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
  ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy
    Tab 2 7.0
  dt-bindings: omap: Add Samsung Galaxy Tab 2 10.1
  ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy
    Tab 2 10.1

 .../devicetree/bindings/arm/ti/omap.yaml      |   2 +
 .../bindings/display/bridge/lvds-codec.yaml   |   1 +
 .../bindings/display/panel/panel-lvds.yaml    |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/ti/omap/Makefile            |   2 +
 .../omap/omap4-samsung-espresso-common.dtsi   | 762 ++++++++++++++++++
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 104 +++
 .../dts/ti/omap/omap4-samsung-espresso7.dts   |  70 ++
 arch/arm/boot/dts/ti/omap/twl6032.dtsi        |  77 ++
 9 files changed, 1024 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

-- 
2.43.0

