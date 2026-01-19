Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B5D39DC3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 06:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFF910E35D;
	Mon, 19 Jan 2026 05:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dlhVpvN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE43C10E35E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 05:28:22 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-29f102b013fso34643745ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 21:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768800502; x=1769405302; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
 b=dlhVpvN18u5Q2thfQW2yFXpnOXQoRPUo1LqhDc3uMkwfkn57indNV3wtgJhvtLcn7y
 C1Xy7Y0pMAxquosDZOiyQtf1N9pwmqytigBS1OhVQk/7H72bmeOaK4dmC1ElRD3A9kjy
 /Nyked5mXpl5t9IG6u7qr5L2e6x1GJRinzwkJVaIQpDPGEpi+ZgR14IW2wnBgh9J4PKm
 hNdgYIxbdhjWA7+UuQ/ZpmnJ1+2JTGUBc4kcbhCWKcSf2kAgSuUWCmu6h41/maTCXHgn
 /lVeYCyjYe5vkPDZxPRjBF0YmYhOLb9Fxmu1t14H2agZMWnUqw1Z/Cevg9eV2lNcHLXY
 K3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768800502; x=1769405302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
 b=QoZUNpmDtg4cwQltaho6rddyUu7bgFH4W3ao+WqS4B2PtFhkt5ApDbY05LDD8lfrYd
 CYurg6rZL1OhNqyhyo0f7sHbUb52HCXFiPAULLqWaQ7uARtg4Mvmi+kzpGc4tLb2hkId
 9l3j9oE0prYIvhOIFMa9SDdF2tRbU4rHOzMFYwGOC4uFC5BopKenTcFfp9W3Dzbn9Cch
 pt/iQ8bspsdTwcR5/qVP8VbcT9E2mNM1BfqUH9O4RwUzBBniKIlj+ecVuq+wF5VPT19y
 NObryI1WkM2GYvzmkWKiZ/ZQsp/NUBAXKPlMEGxUTVGH1AEKz8F5LGuzF1eRpu2acMC0
 2t8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuP4SHpI3us6P4NfoAExWP8oUpkXplEeFKmLJhMOVBGOqXORuQvex9y/cdfomiNOXJ98MQE7fjcRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqT1XZk4pCEfh+OekHQ0E69SSX9/Yr9SMiLnWwJPkNJo7cUd9Q
 3OJI8CnNjNph4BLZxQfvYd9XBh1oy/iHmxkOC1HGEIy+FbF2GDZtXIbf8IMpGw==
X-Gm-Gg: AY/fxX5h9259/7q3a7HEYDMpuMoQVJRGlVRrnH76aJvEJ+fdnyQYuKdVdh3MuPiHFu5
 8fmmCznEw55VVEK1Krl15BqNER1XxVnRHmp7jDHE8EIh36UFuHNhbAHr5V9UGHEz/3C8UAgTM1H
 ySJ7RRc8psTuwFnhoramP8U2dHCbmmamc7PszrsqeV55QKC6m3yz+Rd5Z8aqPEeXZi+rVIWgoX4
 ZFVLUEH8O49owKvjK9otDutdGrqG3NyC+nAp7YaD/VcRoZ9rHz5xh77NoDV7B8IZobUgqBbCKYI
 sz1usrS+a3itflEsBriimybHIimkU8TCtF1rh/c1+0XYp+c2VPEp+B6fdFV3DCtVCd3GammM2ri
 ZE+DN6Q6RORXUadzrKB9zE1szx4HFo19sC1HYLgj1Tgm2IjsMCJE0dYBW/F5Mj79Q0e2mkYAEGG
 goqIQpQzM/HFn3t9JBgBoVyYQOVqhYkaOprBqoNIUFuv1sz4QEXkwXfQSfXlkWOUkHXRI=
X-Received: by 2002:a05:622a:15c6:b0:4ff:c63c:525b with SMTP id
 d75a77b69052e-502a1e5d13cmr132927051cf.26.1768794044833; 
 Sun, 18 Jan 2026 19:40:44 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1f1b872sm64030801cf.31.2026.01.18.19.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:40:44 -0800 (PST)
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
Subject: [PATCH v4 01/10] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Sun, 18 Jan 2026 22:40:25 -0500
Message-ID: <20260119034025.58091-2-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119034025.58091-1-bavishimithil@gmail.com>
References: <20260119034025.58091-1-bavishimithil@gmail.com>
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

Add a dedicated DTS file for the TWL6032 PMIC (Phoenix Lite). Already
has driver support with TWL6030 (Phoenix) since both of them are so
similar, some nodes can be reused from TWL6030 as well.

This can be included in the board files like twl6030.
Example:
...
&i2c1 {
    twl: twl@48 {
        reg = <0x48>;
        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-controller;
        interrupt-parent = <&gic>;
    };
};

/include/ "twl6032.dtsi"
...

Used in devices like samsung-espresso, amazon-jem, epson-embt2ws etc.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/twl6032.dtsi | 77 ++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/twl6032.dtsi b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
new file mode 100644
index 000000000..d599a2ca6
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Integrated Power Management Chip
+ * https://www.ti.com/lit/ds/symlink/twl6032.pdf
+ */
+
+&twl {
+	compatible = "ti,twl6032";
+	interrupt-controller;
+	#interrupt-cells = <1>;
+
+	rtc {
+		compatible = "ti,twl4030-rtc";
+		interrupts = <11>;
+	};
+
+	vio: regulator-vio {
+		compatible = "ti,twl6032-vio";
+	};
+
+	ldo1: regulator-ldo1 {
+		compatible = "ti,twl6032-ldo1";
+	};
+
+	ldo2: regulator-ldo2 {
+		compatible = "ti,twl6032-ldo2";
+	};
+
+	ldo3: regulator-ldo3 {
+		compatible = "ti,twl6032-ldo3";
+	};
+
+	ldo4: regulator-ldo4 {
+		compatible = "ti,twl6032-ldo4";
+	};
+
+	ldo5: regulator-ldo5 {
+		compatible = "ti,twl6032-ldo5";
+	};
+
+	ldo6: regulator-ldo6 {
+		compatible = "ti,twl6032-ldo6";
+	};
+
+	ldoln: regulator-ldoln {
+		compatible = "ti,twl6032-ldoln";
+	};
+
+	ldousb: regulator-ldousb {
+		compatible = "ti,twl6032-ldousb";
+	};
+
+	smps4: regulator-smps4 {
+		compatible = "ti,twl6032-smps4";
+	};
+
+	gpadc: gpadc {
+		compatible = "ti,twl6032-gpadc";
+		interrupts = <3>;
+		#io-channel-cells = <1>;
+	};
+
+	twl_usb_comparator: usb-comparator {
+		compatible = "ti,twl6030-usb";
+		interrupts = <4>, <10>;
+	};
+
+	twl_pwm: pwm {
+		compatible = "ti,twl6030-pwm";
+		#pwm-cells = <2>;
+	};
+
+	twl_pwmled: pwmled {
+		compatible = "ti,twl6030-pwmled";
+		#pwm-cells = <2>;
+	};
+};
-- 
2.43.0

