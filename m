Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00915407FF7
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 22:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59826E059;
	Sun, 12 Sep 2021 20:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA526E059
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 20:09:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u16so11318388wrn.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+TXI1PsD2CP95PVSZQdBoUU6aVsve75rwezr3hbKqQc=;
 b=gszyN4Ob1/oTX3YH7MjCAHMRrfD1D08CcHDvg+2Eaba3Hp18pl+snY9UTTj6XI8Fii
 QSsiZRyR4VSgcsD7hvV8fmhFMmrFvE9OEEgfeB4Xsj2buu6U0PISTrd78ArRWV9lpAfv
 +FlU38BkxMhEXM9QxQ9cJOQ6R14gReIDdA1CQWajhzrJPWrExvibMAC1JDUqgjCNfrXO
 qChnqFGlsNDY7x74H+CyYFkiGZh+VXJx6bipF8ZjhilCppzsc2MAgubfU3wNNfqs8sqG
 hf0KrBfB2RFomn2QT0xLpz+snJWWUJuGxxsjUe6oXZM2S8IgVgLOL83n+0capBaigXIC
 ew1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+TXI1PsD2CP95PVSZQdBoUU6aVsve75rwezr3hbKqQc=;
 b=ZCrwPfkRM6PGphs0hf8rIV2U43nD2EZBIUD5M1Bp97rRD+BcRZ1jKwDVFfEi66A6Ub
 zIuAGukQ2AdtFYL6JCyvpv5ElXxEoEK0mPJ/VjBtF6IB6E9besrSYAyK1CvSBpaSDZzW
 zHa0iA+stXYrmiRqYWlTaplceSXbEWya2ORBqqLYtGLCAbrfeDQfJSIZZ+mxzu1tfxZY
 izWbP6CV51KaeSUcbfZz/5fg634kRrVTjaUh3HVhQOQozyZzkztQleVlO9LPkvBRiH3R
 dMmkIgniaEuJeVd3EMJwOIIGyYrfyVhE7ibd8z406Y6Xg9Ku8o8i4DajMsW6yZ6FlQbT
 Cqqg==
X-Gm-Message-State: AOAM533q0ZIWZkumQjhdomlZ86NvrxFeu8/QJKCypGVIVjwwsd4tvV4I
 a7VE8SmEGoOLADeb3VCoNSY=
X-Google-Smtp-Source: ABdhPJxrC7UvXeGBzJzc3ULNujz5pyNgDGwAX1heJBjx3fkEqLqFO8sByFpQCLZ8KKKBKtScaKoZ5Q==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr8786552wrn.251.1631477389947; 
 Sun, 12 Sep 2021 13:09:49 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:49 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v11 07/34] dt-bindings: host1x: Document OPP and power domain
 properties
Date: Sun, 12 Sep 2021 23:08:05 +0300
Message-Id: <20210912200832.12312-8-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
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

Document new DVFS OPP table and power domain properties of the Host1x bus
and devices sitting on the bus.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 8a6d3e1ee306..62861a8fb5c6 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -20,6 +20,18 @@ Required properties:
 - reset-names: Must include the following entries:
   - host1x
 
+Optional properties:
+- operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to HEG or core power domain.
+
+For each opp entry in 'operating-points-v2' table of host1x and its modules:
+- opp-supported-hw: One bitfield indicating:
+	On Tegra20: SoC process ID mask
+	On Tegra30+: SoC speedo ID mask
+
+	A bitwise AND is performed against the value and if any bit
+	matches, the OPP gets enabled.
+
 Each host1x client module having to perform DMA through the Memory Controller
 should have the interconnect endpoints set to the Memory Client and External
 Memory respectively.
@@ -45,6 +57,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to MPE power domain.
 
 - vi: video input
 
@@ -128,6 +142,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to VENC power domain.
 
 - epp: encoder pre-processor
 
@@ -147,6 +163,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to HEG or core power domain.
 
 - isp: image signal processor
 
@@ -166,6 +184,7 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - power-domains: Phandle to VENC or core power domain.
 
 - gr2d: 2D graphics engine
 
@@ -185,6 +204,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to HEG or core power domain.
 
 - gr3d: 3D graphics engine
 
@@ -209,6 +230,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandles to 3D or core power domain.
 
 - dc: display controller
 
@@ -241,6 +264,8 @@ of the following host1x client modules:
   - interconnect-names: Must include name of the interconnect path for each
     interconnect entry. Consult TRM documentation for information about
     available memory clients, see MEMORY CONTROLLER section.
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to core power domain.
 
 - hdmi: High Definition Multimedia Interface
 
@@ -267,6 +292,7 @@ of the following host1x client modules:
   - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
 
 - tvo: TV encoder output
 
@@ -277,6 +303,10 @@ of the following host1x client modules:
   - clocks: Must contain one entry, for the module clock.
     See ../clocks/clock-bindings.txt for details.
 
+  Optional properties:
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - power-domains: Phandle to core power domain.
+
 - dsi: display serial interface
 
   Required properties:
@@ -305,6 +335,7 @@ of the following host1x client modules:
   - nvidia,panel: phandle of a display panel
   - nvidia,ganged-mode: contains a phandle to a second DSI controller to gang
     up with in order to support up to 8 data lanes
+  - operating-points-v2: See ../bindings/opp/opp.txt for details.
 
 - sor: serial output resource
 
@@ -408,6 +439,8 @@ Example:
 		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
+		operating-points-v2 = <&dvfs_opp_table>;
+		power-domains = <&domain>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -421,6 +454,8 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_MPE>;
 			resets = <&tegra_car 60>;
 			reset-names = "mpe";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 		};
 
 		vi@54080000 {
@@ -429,6 +464,7 @@ Example:
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
 			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+			operating-points-v2 = <&dvfs_opp_table>;
 
 			clocks = <&tegra_car TEGRA210_CLK_VI>;
 			power-domains = <&pd_venc>;
@@ -510,6 +546,8 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_EPP>;
 			resets = <&tegra_car 19>;
 			reset-names = "epp";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 		};
 
 		isp {
@@ -528,6 +566,8 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
 			resets = <&tegra_car 21>;
 			reset-names = "2d";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 		};
 
 		gr3d {
@@ -536,6 +576,8 @@ Example:
 			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
 			resets = <&tegra_car 24>;
 			reset-names = "3d";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 		};
 
 		dc@54200000 {
@@ -547,6 +589,8 @@ Example:
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 
 			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
 					<&mc TEGRA20_MC_DISPLAY0B &emc>,
@@ -571,6 +615,8 @@ Example:
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
+			operating-points-v2 = <&dvfs_opp_table>;
+			power-domains = <&domain>;
 
 			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
 					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
@@ -596,6 +642,7 @@ Example:
 			resets = <&tegra_car 51>;
 			reset-names = "hdmi";
 			status = "disabled";
+			operating-points-v2 = <&dvfs_opp_table>;
 		};
 
 		tvo {
@@ -604,6 +651,7 @@ Example:
 			interrupts = <0 76 0x04>;
 			clocks = <&tegra_car TEGRA20_CLK_TVO>;
 			status = "disabled";
+			operating-points-v2 = <&dvfs_opp_table>;
 		};
 
 		dsi {
@@ -615,6 +663,7 @@ Example:
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
 			status = "disabled";
+			operating-points-v2 = <&dvfs_opp_table>;
 		};
 	};
 
-- 
2.32.0

