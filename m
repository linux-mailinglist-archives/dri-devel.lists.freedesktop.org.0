Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10795D39CEC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6868110E339;
	Mon, 19 Jan 2026 03:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UEJlVY/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8A310E337
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:30:55 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8c52e25e644so356992585a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768793454; x=1769398254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfxr03p7S9Rer87uRm31FU2g8xU+t3fSe3azXAHj5IA=;
 b=UEJlVY/1WGnKnQkGz77AcWTzCVh6+v1zUoDE0WDViIY5DwREd4syzc6qUXt3w+KL2n
 LtFVE4cDnM7BcxjzE+V4S4QyD17Q9FwsV0eb5xMCkDSOWLGsba/HkcSjpf7s+sg5uWV5
 b3OFJ9h1kxOSyiDYjeRC5aT+W1WDVNfdHaCCsYiU+jGf6DGp+9pG1j0uaYx54aGS9+rn
 XTDce7DdcncIDp5yQDsdKOTdWCWueZunHUPFQYbo/1pl82zIVcgd55+J80tIorQukUNW
 QOR6rEjiW2wDH08FX/kvErznTPjAnWWIf5ogQkqSbyEWpTpFKoKyjZ6xJCBCx7yi7a0I
 Za9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768793454; x=1769398254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dfxr03p7S9Rer87uRm31FU2g8xU+t3fSe3azXAHj5IA=;
 b=LOIgd7P0BL9UW1rJAiX/CJXKF2Sb86xxfmeoOiXECLmCfd9ZwFeg26Ybw+USMMG5ad
 v8K56uSZ4LEpEjIDJnZrfFUVcwiFKzYs3qqJz5t7bAxEIan47EOVBx/GqqsnTPMGN8Ks
 HkYYZ3cBlFalO41psEVrhICX44coVMSILslPiP6PaPWtfbPZVbtOvZU7B8pUufisG9t/
 2KZXkQXvDJZzGEj5FvaLR5tShp3S/5+tOublCcJnDQJp8xLqbvzXi2QsmuGhY4n2yYBT
 peigVTWvuNAdDDN8Q4UXayQ23ETUPvqED4MPkPqRgMPVddYjoQOzWS071Z9Wxhdjrx3J
 hcqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmVdGbwl9uDONA+G3uEtx0jhOYC6HlriCtepfdJRPmCQ2ACngA/+KBmdJDI+tYSwkZOFIKAL69TUQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLljQjzTuiC0EBNw7VREf6vE/Z/4wO9WGKi1XxwusGEVnZc8ZD
 aO1tZJ9NcnVibtFJkh9feWgY9JGltexuBAAMefmlXuZyOppKcyDdzNLm
X-Gm-Gg: AY/fxX6OQ6Vq4zC4ZxFHKO713jQ3R4Whnwoo95QYYoVErlJCClS8xXitC98DSXOlYb5
 4U4BxlJCZer14NnAxKd1rjT/KMNBC/I3TXAly9LuMeI3TQ6WzfEluFCJfHNxghQnphRvflPPtsY
 0llvxKJsSYbdHHcsWNS5CpmjWdbG4qUGPlMSMq/z5Hk8dgTTpqaGG8KOvsqsBmqQdQbZnk7DAW0
 PKKOTPb2u51auzDNvO5xt1ECwiUW7vIWqIGcVkgTuK2YnskBFM5jw/PAUwzGmeYe7f05ETYK+HQ
 THnRYMq1HFu6mkGNXLYjCnFPIjoaP10bCwsDOqqsqF2G9LZqK69+HI3GkiuxeCrAEvHNnuItJD8
 cmsl9iMnVsrEtRogy00fsWXb8NVtF/GmW2ASlpRyJxqUGrKoauZu1kXq8YQPtqMprE2mQ17vviS
 xCGRHrlp3YwokEo3JM+gzYpZ/jWG9oZXON+5Hk9dxAy+KcYnapz67pj0q8wqPkzT+Wqgc=
X-Received: by 2002:a05:620a:29d3:b0:8b2:e513:6419 with SMTP id
 af79cd13be357-8c6a693b0d2mr1393824685a.48.1768793454390; 
 Sun, 18 Jan 2026 19:30:54 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:53 -0800 (PST)
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
Subject: [PATCH v4 08/10] ARM: dts: ti: omap: samsung-espresso7: Add initial
 support for Galaxy Tab 2 7.0
Date: Sun, 18 Jan 2026 22:30:33 -0500
Message-ID: <20260119033035.57538-10-bavishimithil@gmail.com>
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

Create a device tree for the 7 inch variants (P3100, P3110, P3113)

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |  1 +
 .../dts/ti/omap/omap4-samsung-espresso7.dts   | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 14e500846..d24f13efd 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -80,6 +80,7 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-sdp-es23plus.dtb \
 	omap4-var-dvk-om44.dtb \
 	omap4-var-stk-om44.dtb \
+	omap4-samsung-espresso7.dtb \
 	omap4-xyboard-mz609.dtb \
 	omap4-xyboard-mz617.dtb
 dtb-$(CONFIG_SOC_AM33XX) += \
diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
new file mode 100644
index 000000000..cae37ff06
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
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_pins>;
+		avdd-supply = <&reg_touch_ldo_en>;
+		vdd-supply = <&ldo6>;
+	};
+};
-- 
2.43.0

