Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E54CAAECF2
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5AE10E8BB;
	Wed,  7 May 2025 20:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g3SJWPT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B86D10E8B2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:46 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7301c227512so140119a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649365; x=1747254165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hb5ufZpV43bt8teP3h3YtOVqm0V+W6AkapWdcxcadM=;
 b=g3SJWPT5ZJuna96DuB1DC4qG75XxsvbX61rOae+UR67DGTif78r5/0qFg9yT27Jgy0
 o470tDVl8WROMYS9Zw2YizQetMDGX4F36Z/PzIA0EU460CWIvrVjJMZP/6CS7UavMDH5
 SmA+vqzNkSjgZl+nrUa5SHIEk/Z24jFrbXy7iyQ9T8GXwnBNec7bOhtWBBUgd6Uaishh
 WcAqgDI2DeFYDDeNmPbQPB0ASIJuHmr7Um3Srb+PAgBDs9ByoiEh9jsTO3PMDhPAK7Aq
 JlvMk7EuzYknKHJ7FpQzMFXYX0+O/StNHw6anV03tsEl8ghjdzObi5kXfDV5ht44X+J4
 66bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649365; x=1747254165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hb5ufZpV43bt8teP3h3YtOVqm0V+W6AkapWdcxcadM=;
 b=vdRYNJ6aBgPP9lFNOpnBJJLUXaUXqFe8HdVY7SxJymBnv4ogp5EkTHMmV4hNGbUIf4
 grZLMe1LqmdItq6uQoV5Lh5Fnz2EOmh5BLXO5uAblZk/63t3vfTq+zemEqBrH06FPyn3
 nRvYjptmgDey+XTTpURYbqMGyraJe9efn8eWdk68wzywFUwwb3h67X35rnZAWIUxMY56
 ea7GqHyHB8bsck1CvEcF87RgJ+BmPi5lVZ3GxHAxPInBdrvGXtfzw7RZRkE/LVLjHZby
 uBKgYRMFFu5dY3mg3r1Y+mTWBz1YX5tMW40qXeveFRyJ1G5cfS+QmCS+5IbxDPS0UazU
 iQYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEQsSbbZACqxbCZufu3jDRyX/wXOg7cdtu7FI5l6+bSgx0UF9e+XJGFu6gkzV0/N7WvIl0liJIMto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1NxOpF2+EtXrI+XUSwUNiFCrAWKrCVXbCGNT1TcfyFIZy0U0u
 A8Fxx/4CQa94uKMvdDeNrhNuBcETUbqXjkKBT58o/YgpzGSx70pb
X-Gm-Gg: ASbGncu2yAMk8aUX3Z2Pb62u61obJ69lPARh0PWJGf0H0DH5AtjH87iJn3Z6Cb464f1
 dSjQWtcA7bMEEtc5+5WJ2hY7umA4PMAqNjBTMTMXsKI/X4xKFqOWLvy6o/vwll/VqcYavbq+z8l
 soGHOCDo+Mbc1blCtwwTHznn5ojR7/Wyb8dIARxTlwMjzrgH/zaVIMLvJ5dXQ87RZXqVVzJ3ebP
 b/z3kvZAp2xpf1zoGL9mBo+S5p6uFb/TWvUcOlFO0IOB1IAssIMiO/FqSzNjI6pj3scaeeVZmp9
 0GWV8b5ODm4JVbuNMJLf8ZT4h9ZriQ/rXrbnQ8AFza5BfAWvdTITCxcumtdS
X-Google-Smtp-Source: AGHT+IEc2bzedU/Bbbz0Jce68RPz4itDPGQFZVpr2AL3l0c19gcdR7gdkcuLajDbJPMrYebzAIA4IQ==
X-Received: by 2002:a05:6830:6181:b0:72b:8a8b:e02c with SMTP id
 46e09a7af769-73210a69ba6mr3020411a34.2.1746649365602; 
 Wed, 07 May 2025 13:22:45 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:45 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 24/24] arm64: dts: allwinner: rg35xx: Enable LCD output
Date: Wed,  7 May 2025 15:19:43 -0500
Message-ID: <20250507201943.330111-25-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The RG35XX has a 640x480 RGB/SPI LCD panel, supported by the SoC display
pipeline and an NV3052C controller. The H616 SOC's GPIO bank D contains
the muxed display pins for RGB and LVDS output support.

Enable the display engine and LCD timing controller, configure the
panel, and add a fixed 3.3v GPIO-controlled regulator for the panel, and
a VCC supply for the display pins as per the other GPIO banks.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 95f2ae04bd95..260c2d55a86e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -187,6 +187,49 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	reg_lcd: regulator-gpio-lcd-vdd {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vdd-lcd";
+		gpio = <&pio 8 15 GPIO_ACTIVE_HIGH>; // PI15
+		enable-active-high;
+	};
+
+	spi_lcd: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
+		mosi-gpios = <&pio 8 10 GPIO_ACTIVE_HIGH>; // PI10
+		cs-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; // PI8
+		num-chipselects = <1>;
+
+		panel: panel@0 {
+			compatible = "anbernic,rg35xx-plus-panel";
+
+			reg = <0>;
+
+			spi-max-frequency = <3125000>;
+			spi-3wire;
+
+			reset-gpios = <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
+
+			backlight = <&backlight>;
+			power-supply = <&reg_lcd>;
+
+			pinctrl-0 = <&lcd0_rgb888_pins>;
+			pinctrl-names = "default";
+
+			port {
+				panel_in_rgb: endpoint {
+					remote-endpoint = <&tcon_lcd0_out_lcd>;
+				};
+			};
+		};
+	};
 };
 
 &codec {
@@ -199,6 +242,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc1>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -218,6 +265,7 @@ &ohci0 {
 &pio {
 	vcc-pa-supply = <&reg_cldo3>;
 	vcc-pc-supply = <&reg_cldo3>;
+	vcc-pd-supply = <&reg_cldo3>;
 	vcc-pe-supply = <&reg_cldo3>;
 	vcc-pf-supply = <&reg_cldo3>;
 	vcc-pg-supply = <&reg_aldo4>;
@@ -377,3 +425,14 @@ &usbotg {
 &usbphy {
 	status = "okay";
 };
+
+&tcon_lcd0 {
+	status = "okay";
+};
+
+&tcon_lcd0_out {
+	tcon_lcd0_out_lcd: endpoint@1 {
+		reg = <1>;
+		remote-endpoint = <&panel_in_rgb>;
+	};
+};
-- 
2.43.0

