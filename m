Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F7D39D9A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 06:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B6710E00F;
	Mon, 19 Jan 2026 05:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bkgu6f5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AB610E00F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 05:08:59 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8c5265d06c3so492214685a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 21:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768799338; x=1769404138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
 b=Bkgu6f5IXl/itIO9JkXGijZ9qzyITtDseuaUP8UDJ5WbWi0Bj0BhbfkFnbVp78sckZ
 k4KdOctff9SJ45jSWVodZwmmDRYmtczQScDatlCZZkWAjXzeEBW/n0QZ5ba2f0jPoFDq
 sjvUymHRnaKG+ry8SqnRSG39PDNBMUsQI2Nv4lhcIpyzUfTVQCreSaQhBlSbLIsCLArm
 y8juLVWKToZ27YKVa4vHdCQl4BvXHm3PrLupLw8ZcZM/xz0RkxpmqdKiDdkF7SzkOLXE
 /bVMdNG6Hb170ERiZP1HQfAp2mBttTAPlSt+igi6uWWdE94nqkeIKxcfZOWmhwGsuhh6
 w3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768799338; x=1769404138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nclpl2L8R9cKrulz3mBbfGGvQIswT/qMcBsWKZFoMYo=;
 b=o1IlPWVZWF7cMQbMh+l5IDR+CgtYWDklzjcTO3EA5fZWfzDZTru7B3w75G9ubba46m
 sS6C5IhYwmsulo8ZxMqVDUd46cVFv/sqHWCQYIKufyTWzqNTD1yVlnr8CeD9IZUNfCIV
 4Io/WZ48Bfi5pphxfOOuyf0EpPZr9Vd+kaU7WkWTOeSvl9hjwmIpRZc10o/KKUO+NuVe
 ZmbnkxtbnnxnKk64AIOAzPpRAsjpYwbmi3/E5VP0Kp95ol2VSv2xggjwDRP7I/tETjoK
 2rbkfq/O83Dhki7IF15wGi3xPibIEhduAZqyOuf5kIGcO0/unK7iivuj0E7jMgfZFg2p
 Q0qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6YG4QLpdztKumDiEWXzN6P0oh7+g1gkaB0fGyXVkFQuPGnEdG2I/3/Ex6ASMP48ynGkzmWdYQbIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVW8rxliG1qC+8GV+fiYXUqX69SWrsa5YrT29R3dYVYhQ6wlYw
 SskRCjikGljEmiVxZTxDVv/erexrxZT8aF1MPMHh9XKVgeHHIWELY4pQPD0zLQ==
X-Gm-Gg: AY/fxX5tyo2RHpL3Z1pzTFwONinZ/JrmcZOHqbfq1aa2mx34TDtQzMUCQuKr3rf5AjO
 lKqZUQML+IKbqlDmVSHeKUSrgo/zSHuWyKUtPZmka/Cf2ooXn5fX0pkIutRHUOjwvx3gOkj8oMc
 zSN3q6fPJGr/SqqxUr4a3Q7FqNgatbj24kJuvKvMqhCLITQhTA58f8nUSMi9EIIOfJssZc87doB
 aZW/pDAUgjGnQC8X2vF0yoSuq8MWi1Zx/l6clPp47G1bo1kU90/qLDPapU/5kX3+PC11gjAxWLP
 zYyDHJFM54Y+IZ9Bq66jPcfO4UYZscD9JIy3BaMaCZUxAQD6mFH5iWZbdbxKG8Uu7PfJd7TeoWg
 6j+5BDB9NJE1/dYkOmZmG9tq/u2YwjJZxlm+pdHSejNq8B2fznYTDyC/c6P5Z01YXz53fUbHJ03
 5TOb43WayRyFcb2tuiWQag1I6yW6sJY2+lJzYeIeDBZoihLS8paafmlNCTlwrDw/HcSit91/kUg
 gsJvA==
X-Received: by 2002:a05:620a:450b:b0:8c6:a587:377f with SMTP id
 af79cd13be357-8c6a58737e7mr1680298485a.36.1768793444229; 
 Sun, 18 Jan 2026 19:30:44 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:43 -0800 (PST)
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
Date: Sun, 18 Jan 2026 22:30:26 -0500
Message-ID: <20260119033035.57538-3-bavishimithil@gmail.com>
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

