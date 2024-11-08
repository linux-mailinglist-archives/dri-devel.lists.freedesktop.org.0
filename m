Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178A69C3093
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 03:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93D510E0FD;
	Sun, 10 Nov 2024 02:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KWSJp8+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E333910EA37
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:05:57 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-71e953f4e7cso2066467b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 12:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096357; x=1731701157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgiTsskyfRZ9Ja75xsEEkSONh3g+5soO7swRS9wzZqs=;
 b=KWSJp8+dgd+eiSyjgZn0ZwpFaCxO0grkzyXTV7UJUQnqWYnBMvWKPs6sX/tgCDOG66
 F6oZ7t5X9WtnNHgpOAzhKcSHiNrEcXwxawo9e39u4yP9L2fZfYfRJ7aom8BIzMxUR5qp
 jU0mqbS/GToek8AIMOwqXruxez0uu+AUk1naSrtE+nlzmXSIsKtD4iyadCUe+uJNSVoZ
 g+qlUukdMr89NLlx4DIvQyrhl4pHdAfYLasJUByHGicAzgcLGd+Vz5dhU9PlDjKcJENE
 PiBBRNUeAif6fq8Rnm+L1jEoDrVO3zfjRP63p2EZOOuu093ry61RDM09Da6/jmbxdBzD
 aKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096357; x=1731701157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgiTsskyfRZ9Ja75xsEEkSONh3g+5soO7swRS9wzZqs=;
 b=cDcnk5+cORKIsr83e1DvCSCq8V6U+B2gECkty3hP2FMXM69JzEVnFxZMGqXAUjeDM4
 BOjuHKGY37PrIMdD/Nav/VKf428EXidpXR2OPFRLufT1vmmvZrqCB9BDUmnqDg9/k+NN
 KeaRrhOv3KRfqV1El0Uz/GABVlDUJYJtlB/WfGs/7+u8P1JOmgMHotj+mOaeSP7rN/K9
 pzu7Okj76d5AYFJjV/RNheziTNjE1W7ipp/dviXXvcPMMB/dDpYX81GisnmxGcbi6Z53
 uv3Gw23NsPBnUi6GPy98RDTGuyrxq5Os8TDq7qo0h74aGIL22wq10JmyzrwJFlzvMZ9y
 Tfbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzQysie5+urBwPdT0LIBFC4FD29z5IbtBgca0KuItuWXYYKhnxozqWdUYxpImgbmLN6z0LvYekANg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0hxV/NZveS4ZVt6QzfKO7O6ID9lIWrQwW69OKklOA0NOAT8y9
 poz6E748Vh4Waf2V8AYAH3UpZaLn5rz/V21Q6dlouhTrs3hKmmTl
X-Google-Smtp-Source: AGHT+IGjDk/AgzVKM2Soq57Du52rPokk3kN+KOkNGWWZXeIgPxQKurnk5CoHUPdkdAuW1IwIY/ZWhA==
X-Received: by 2002:a05:6a00:1744:b0:71d:f64d:ec60 with SMTP id
 d2e1a72fcca58-72413297242mr6023442b3a.7.1731096357381; 
 Fri, 08 Nov 2024 12:05:57 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:05:56 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mithil Bavishi <bavishimithil@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3 08/10] ARM: dts: ti: omap: samsung-espresso7: Add initial
 support for Galaxy Tab 2 7.0
Date: Fri,  8 Nov 2024 20:04:37 +0000
Message-ID: <20241108200440.7562-9-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 Nov 2024 02:30:58 +0000
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

Create a device tree for the 7 inch variants (P3100, P3110, P3113)

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 .../dts/ti/omap/omap4-samsung-espresso7.dts   | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts

diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
new file mode 100644
index 000000000..be3d7a82f
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "omap4-samsung-espresso-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy Tab 2 (7 inch)";
+	compatible = "samsung,espresso7", "ti,omap4430", "ti,omap4";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins>;
+		pwms = <&pwm10 0 1200 0>;
+		power-supply = <&reg_lcd>;
+		enable-gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <2>;
+	};
+
+	panel {
+		compatible = "samsung,ltn070nl01", "panel-lvds";
+		power-supply = <&reg_lcd>;
+		width-mm = <154>;
+		height-mm = <90>;
+		data-mapping = "vesa-24";
+		backlight = <&backlight>;
+
+		panel-timing {
+			clock-frequency = <47255554>;
+
+			hback-porch = <210>;
+			hactive = <1024>;
+			hfront-porch = <186>;
+			hsync-len = <50>;
+
+			vback-porch = <11>;
+			vactive = <600>;
+			vfront-porch = <24>;
+			vsync-len = <10>;
+
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+			pixelclk-active = <1>;
+			syncclk-active = <0>;
+		};
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	touchscreen@48 {
+		compatible = "melfas,mms136";
+		reg = <0x48>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <1023>;
+		touchscreen-size-y = <599>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+		avdd-supply = <&reg_touch_ldo_en>;
+		vdd-supply = <&ldo6>;
+	};
+};
-- 
2.43.0

