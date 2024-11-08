Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C6D9C3098
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 03:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C87F10E3A7;
	Sun, 10 Nov 2024 02:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NJHJ84ZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304F410EA34
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:06:13 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-720b2d8bcd3so2081130b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 12:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731096373; x=1731701173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+pxJEv6PwGkDmgf7vlb0xaf/TsB7THqnGutHjf9Yl8=;
 b=NJHJ84ZG8BHg0GPIEgsLiD7SfQjHGnZUzL6Tv6XN2J6I+6jEuA4STk44dXGsehIE7+
 w830xtlqZe1qfpL8iaNDCwvAZJZyQt8VNXlodlxf+Zi5NcbzEpTfktmI9RBeB+TfHTMB
 wPN35gpcIAtoWcDFgk8SJBG4RiOGpsxMrdyJG5vFUOrjBKFnZ/ucYl8I9S5PPPm7cdDk
 UXqfJDcvaT0i6qf6+YlO4PlLep744Dx7k0dg3htc71wcYgoIYrIrhXW9cXMJbcLkTOBj
 51BmnYViihujBAgdy6PsR4E2HrI8mKg6kUx0+vVux1gBK+zRGKmw8/mLKUvm+Ppfs2wa
 +22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731096373; x=1731701173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+pxJEv6PwGkDmgf7vlb0xaf/TsB7THqnGutHjf9Yl8=;
 b=gSUWBNNOCp5d8yfNtvksSV1ZyrgB9P7TlYhA4foQ9d8ctxYgKc4fRt/vRHMlDuORZu
 4WSowmrQHl4lx6Rnv3LFGsEGwLX98vk60ku6ISwofQxeYzRLaqT4SWu7OiySY95GImPQ
 iCXibh0Yr9G727Mq9Lcd245Jchab1/V7ZBFFhmtRP8mnuHculYL1HZa3rgx90lb/gJJU
 ui2y7GIbfd/NfNu12V9puhIOdlnS2ZRz4x4PSEfY+SVLejRCa3aLQumStN4joD3eRkUT
 wavZ2GKzoyApPQo+vlEycP5vtQUyX3oAbqLwpDhLwqHOsbN3SwaSxYZk1kz0e/ApUhnV
 CTNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzmkD4nVxcZ9wCosN66T6m89fUM7apKo5jPb3+YSZng+apF/1C+mZyHS+P19t5Iqov8wXWM8ohM/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvfAqJsPixCImE0QjpRC0CBBbAE9AV+78WmvAhDGGOY2s9aZ2I
 h2i8Pn6X8eezC5GVE0iVtLHoUKGdywP3Sej8pVPmSjxNd9yDsWVC
X-Google-Smtp-Source: AGHT+IFwHvYMTTEotxw6SwVshq1ogJkCQXDcpNbNEFSr+fROy51ZN1A2AXf0NpMGBrlyOm6+qYerlg==
X-Received: by 2002:a05:6a20:7faa:b0:1d0:2531:b2b9 with SMTP id
 adf61e73a8af0-1dc22b00bd8mr5826318637.36.1731096372599; 
 Fri, 08 Nov 2024 12:06:12 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:06:12 -0800 (PST)
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
Subject: [PATCH v3 10/10] ARM: dts: ti: omap: samsung-espresso10: Add initial
 support for Galaxy Tab 2 10.1
Date: Fri,  8 Nov 2024 20:04:39 +0000
Message-ID: <20241108200440.7562-11-bavishimithil@gmail.com>
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

Create a device tree for the 10 inch variants (P5100, P5110, P5113)

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 .../dts/ti/omap/omap4-samsung-espresso10.dts  | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts

diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
new file mode 100644
index 000000000..70bbef468
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "omap4-samsung-espresso-common.dtsi"
+#include <dt-bindings/power/summit,smb347-charger.h>
+/ {
+	model = "Samsung Galaxy Tab 2 (10 inch)";
+	compatible = "samsung,espresso10", "ti,omap4430", "ti,omap4";
+
+	i2c-gpio-5 {
+		smb347: charger@6 {
+			compatible = "summit,smb347";
+			reg = <0x6>; // 0x0C >> 1
+			interrupt-parent = <&gpio2>;
+			interrupts = <0 IRQ_TYPE_EDGE_BOTH>;
+
+			summit,enable-usb-charging;
+			summit,enable-charge-control = <SMB3XX_CHG_ENABLE_SW>;
+			summit,chip-temperature-threshold-celsius = <120>;
+			summit,usb-current-limit-microamp = <1800000>;
+		};
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins>;
+		pwms = <&pwm10 0 1600 0>;
+		power-supply = <&reg_lcd>;
+		enable-gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+	};
+
+	panel {
+		compatible = "samsung,ltn101al03", "panel-lvds";
+		power-supply = <&reg_lcd>;
+		width-mm = <223>;
+		height-mm = <125>;
+		data-mapping = "vesa-24";
+		backlight = <&backlight>;
+
+		panel-timing {
+			clock-frequency = <69818000>;
+
+			hback-porch = <64>;
+			hactive = <1280>;
+			hfront-porch = <16>;
+			hsync-len = <48>;
+
+			vback-porch = <11>;
+			vactive = <800>;
+			vfront-porch = <16>;
+			vsync-len = <3>;
+
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+			pixelclk-active = <1>;
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
+	touchscreen: synaptics-rmi4-i2c@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&gpio2>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+
+		avdd-supply = <&reg_touch_ldo_en>;
+		vdd-supply = <&ldo6>;
+
+		syna,reset-delay-ms = <200>;
+		syna,startup-delay-ms = <200>;
+
+		touchscreen-size-x = <1279>;
+		touchscreen-size-y = <799>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
-- 
2.43.0

