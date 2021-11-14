Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A958844FAA7
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093756E8C2;
	Sun, 14 Nov 2021 19:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C937F6E89A
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:31 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z34so37502227lfu.8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SJo67SBxSZIl9tg9BQXncMlIm6N9xP0oO6cS2X119SU=;
 b=EhzvMkY+TH9blNQfU9XLi7Y1N+ERw6at5MQ+yRjuIVSej3fbLF5lRRb30GpOapOASL
 jmtlpEAQOP4g7Nngmb3dFLWXVYTr5aZz0YdVOjf5cD68BsgwBnb3c9sHHdR2VItATjyQ
 ojts8s0qFVsVHmxpBcMcTGJ8Ciz15EYpdEA5OXh60xefR/JFag7BjNm1J7PcW/aKPXvS
 RW3eqWWfpDvJDA2N7b/oCjEaKDZaWDY3dYmYcqLBVhyZsRuxgg13+rxfGvLxcAY86xvn
 9hRYhvW146r043ufPZzdFoBTewAMUL1+v5CNjIV9Ep1sDvBjpJg1oloznYffI+TPnzRa
 QN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SJo67SBxSZIl9tg9BQXncMlIm6N9xP0oO6cS2X119SU=;
 b=TNL+BYKicY9KRZGo/in6LFIM705WRkHXSxofOxtwPF/F5l33OyNXTdk/Lugz1b5ztI
 80UdH1pXMxOfuzqjSxSZd2hQGxYa9n18IFxxBCm99GpPOdlhTVdpYc8z9zN/YjWIODEz
 YkpD4jUY3Q5uFFa8n562bNjQDFK7gpZZ3VJKR/XLsKlJqkrKqgjmRSuHMzILq6UvbJcX
 730eOHYY8catgqDpu+oZKf75CUjVuc4uwu1Ve/Uyp1sIQSnBJL7Zq1qTQ+0LoaURX8F0
 BqAydHCuup3SwK1/Q63njjpIPRXIVM+aiCRBXMmez0iiPq5FiMsin8ufyMZf/uXYQDyM
 x1xA==
X-Gm-Message-State: AOAM532tsQyIQYML5XYaVkf3b9W3yj8e8M1+PGr8SifEO2O7okMx5sxH
 0WltEr7rgL/a4JL8uhJP5Q4=
X-Google-Smtp-Source: ABdhPJz9uOQdomVmxilhSMa3Su/zPQ39XYvxAa+/JtIN1pUqo8eCHDgvsvV5x+d2upfAsrh2vipnMw==
X-Received: by 2002:a19:ac44:: with SMTP id r4mr31102566lfc.347.1636918589907; 
 Sun, 14 Nov 2021 11:36:29 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:29 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v15 35/39] ARM: tegra: Add OPP tables and power domains to
 Tegra20 device-trees
Date: Sun, 14 Nov 2021 22:34:31 +0300
Message-Id: <20211114193435.7705-36-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add OPP tables and power domains to all peripheral devices which
support power management on Tegra20 SoC.

Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   1 +
 arch/arm/boot/dts/tegra20-colibri.dtsi        |   3 +-
 arch/arm/boot/dts/tegra20-harmony.dts         |   3 +-
 arch/arm/boot/dts/tegra20-paz00.dts           |   1 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi | 913 ++++++++++++++++++
 arch/arm/boot/dts/tegra20-seaboard.dts        |   3 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |   3 +-
 arch/arm/boot/dts/tegra20-trimslice.dts       |   9 +
 arch/arm/boot/dts/tegra20-ventana.dts         |   1 +
 arch/arm/boot/dts/tegra20.dtsi                | 102 +-
 10 files changed, 1034 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index e1b33d25b6e0..db388ddd062f 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -716,6 +716,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <458>;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	usb@c5000000 {
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 3f9cb5cd6bd8..eb5b3feb5907 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -495,7 +495,7 @@ reg_3v3_vsys: sys {
 					regulator-always-on;
 				};
 
-				sm0 {
+				vdd_core: sm0 {
 					regulator-name = "VDD_CORE_1.2V";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
@@ -601,6 +601,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <3875>;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 
 		/* Set SLEEP MODE bit in SUPPLYENE register of TPS658643 PMIC */
 		i2c-thermtrip {
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index a8494378c382..b4cc88b0f130 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -339,7 +339,7 @@ sys_reg: sys {
 					regulator-always-on;
 				};
 
-				sm0 {
+				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
@@ -565,6 +565,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <3875>;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	pcie@80003000 {
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 1fd5a7458c7a..f68d37ae6c64 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -519,6 +519,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&core_vdd_reg>;
 	};
 
 	usb@c5000000 {
diff --git a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
index d4d0a5fa7015..e7477b129e34 100644
--- a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
@@ -1,6 +1,46 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
+	core_opp_table: opp-table-core {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		core_opp_950: opp-950000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-level = <950000>;
+		};
+
+		core_opp_1000: opp-1000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-level = <1000000>;
+		};
+
+		core_opp_1100: opp-1100000 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-level = <1100000>;
+		};
+
+		core_opp_1200: opp-1200000 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-level = <1200000>;
+		};
+
+		core_opp_1225: opp-1225000 {
+			opp-microvolt = <1225000 1225000 1300000>;
+			opp-level = <1225000>;
+		};
+
+		core_opp_1275: opp-1275000 {
+			opp-microvolt = <1275000 1275000 1300000>;
+			opp-level = <1275000>;
+		};
+
+		core_opp_1300: opp-1300000 {
+			opp-microvolt = <1300000 1300000 1300000>;
+			opp-level = <1300000>;
+		};
+	};
+
 	emc_icc_dvfs_opp_table: opp-table-emc {
 		compatible = "operating-points-v2";
 
@@ -8,66 +48,77 @@ opp-36000000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <36000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-47500000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <47500000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-50000000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <50000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-54000000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-57000000 {
 			opp-microvolt = <950000 950000 1300000>;
 			opp-hz = /bits/ 64 <57000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp-100000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <100000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-108000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-126666000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <126666000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-150000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <150000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-190000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <190000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-216000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <216000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 			opp-suspend;
 		};
 
@@ -75,36 +126,898 @@ opp-300000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <300000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-333000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <333000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-380000000 {
 			opp-microvolt = <1100000 1100000 1300000>;
 			opp-hz = /bits/ 64 <380000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
 		};
 
 		opp-600000000 {
 			opp-microvolt = <1200000 1200000 1300000>;
 			opp-hz = /bits/ 64 <600000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-666000000 {
 			opp-microvolt = <1200000 1200000 1300000>;
 			opp-hz = /bits/ 64 <666000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp-760000000 {
 			opp-microvolt = <1300000 1300000 1300000>;
 			opp-hz = /bits/ 64 <760000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1300>;
+		};
+	};
+
+	host1x_dvfs_opp_table: opp-table-host1x {
+		compatible = "operating-points-v2";
+
+		opp-104500000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <104500000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-133000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <133000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-166000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <166000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	mpe_dvfs_opp_table: opp-table-mpe {
+		compatible = "operating-points-v2";
+
+		opp-104500000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <104500000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-142500000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <142500000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-152000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <152000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-190000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-190000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-228000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-228000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-237500000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <237500000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-266000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <266000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-275500000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <275500000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-300000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-300000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	vi_dvfs_opp_table: opp-table-vi {
+		compatible = "operating-points-v2";
+
+		opp-85000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <85000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-100000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-150000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <150000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	epp_dvfs_opp_table: opp-table-epp {
+		compatible = "operating-points-v2";
+
+		opp-133000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <133000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-171000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <171000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-247000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-300000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	gr2d_dvfs_opp_table: opp-table-gr2d {
+		compatible = "operating-points-v2";
+
+		opp-133000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <133000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-171000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <171000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-247000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-300000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	gr3d_dvfs_opp_table: opp-table-gr3d {
+		compatible = "operating-points-v2";
+
+		opp-114000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <114000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-161500000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <161500000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-161500000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <161500000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-209000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <209000000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-218500000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <218500000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-247000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-247000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-256500000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <256500000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-285000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-285000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-304000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-323000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <323000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-333500000-1275 {
+			opp-microvolt = <1275000 1275000 1300000>;
+			opp-hz = /bits/ 64 <333500000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1275>;
+		};
+
+		opp-333500000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <333500000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-351500000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <351500000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-361000000-1275 {
+			opp-microvolt = <1275000 1275000 1300000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1275>;
+		};
+
+		opp-380000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-400000000-1275 {
+			opp-microvolt = <1275000 1275000 1300000>;
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1275>;
+		};
+
+		opp-400000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	disp1_dvfs_opp_table: opp-table-disp1 {
+		compatible = "operating-points-v2";
+
+		opp-158000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <158000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-190000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	disp2_dvfs_opp_table: opp-table-disp2 {
+		compatible = "operating-points-v2";
+
+		opp-158000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <158000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-190000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	dsi_dvfs_opp_table: opp-table-dsi {
+		compatible = "operating-points-v2";
+
+		opp-100000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-500000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <500000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	hdmi_dvfs_opp_table: opp-table-hdmi {
+		compatible = "operating-points-v2";
+
+		opp-148500000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <148500000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	tvo_dvfs_opp_table: opp-table-tvo {
+		compatible = "operating-points-v2";
+
+		opp-250000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <250000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sclk_dvfs_opp_table: opp-table-sclk {
+		compatible = "operating-points-v2";
+
+		opp-95000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <95000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-123500000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <123500000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-133000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <133000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-152000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <152000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-159500000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <159500000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-171000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <171000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-180500000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <180500000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-190000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-207000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <207000000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-218500000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <218500000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-222500000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <222500000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-229500000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <229500000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-240000000-1225 {
+			opp-microvolt = <1225000 1225000 1300000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1225>;
+		};
+
+		opp-240000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-247000000-1275 {
+			opp-microvolt = <1275000 1275000 1300000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1275>;
+		};
+
+		opp-256500000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <256500000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-260000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <260000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-262000000-1300 {
+			opp-microvolt = <1300000 1300000 1300000>;
+			opp-hz = /bits/ 64 <262000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp-264000000-1275 {
+			opp-microvolt = <1275000 1275000 1300000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1275>;
+		};
+
+		opp-277500000-1300 {
+			opp-microvolt = <1300000 1300000 1300000>;
+			opp-hz = /bits/ 64 <277500000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp-285000000-1275 {
+			opp-microvolt = <1275000 1275000 1300000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1275>;
+		};
+
+		opp-292500000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <292500000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-300000000-1300 {
+			opp-microvolt = <1300000 1300000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp-300000000-1275 {
+			opp-microvolt = <1275000 1275000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1275>;
+		};
+	};
+
+	vde_dvfs_opp_table: opp-table-vde {
+		compatible = "operating-points-v2";
+
+		opp-95000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <95000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-123500000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <123500000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-123500000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <123500000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-152000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <152000000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-152000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <152000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-171000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <171000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-209000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <209000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-209000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <209000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-218500000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <218500000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-237500000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <237500000>;
+			opp-supported-hw = <0x0002>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-275500000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <275500000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-285000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-300000000-1275 {
+			opp-microvolt = <1275000 1275000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1275>;
+		};
+
+		opp-300000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-300000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	ndflash_dvfs_opp_table: opp-table-ndflash {
+		compatible = "operating-points-v2";
+
+		opp-130000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <130000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-150000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <150000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-158000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <158000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-164000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <164000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	nor_dvfs_opp_table: opp-table-nor {
+		compatible = "operating-points-v2";
+
+		opp-92000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <92000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sdmmc1_dvfs_opp_table: opp-table-sdmmc1 {
+		compatible = "operating-points-v2";
+
+		opp-44000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <44000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sdmmc2_dvfs_opp_table: opp-table-sdmmc2 {
+		compatible = "operating-points-v2";
+
+		opp-44000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <44000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sdmmc3_dvfs_opp_table: opp-table-sdmmc3 {
+		compatible = "operating-points-v2";
+
+		opp-44000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <44000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sdmmc4_dvfs_opp_table: opp-table-sdmmc4 {
+		compatible = "operating-points-v2";
+
+		opp-44000000-950 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <44000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-52000000-1000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	pcie_dvfs_opp_table: opp-table-pcie {
+		compatible = "operating-points-v2";
+
+		opp-250000000-1200 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <250000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	usbd_dvfs_opp_table: opp-table-usbd {
+		compatible = "operating-points-v2";
+
+		opp-480000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	usb2_dvfs_opp_table: opp-table-usb2 {
+		compatible = "operating-points-v2";
+
+		opp-480000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	usb3_dvfs_opp_table: opp-table-usb3 {
+		compatible = "operating-points-v2";
+
+		opp-480000000-1100 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
 		};
 	};
 };
+
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index ca7adeb1fdd9..e270d6d3b817 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -444,7 +444,7 @@ sys_reg: sys {
 					regulator-always-on;
 				};
 
-				sm0 {
+				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
 					regulator-min-microvolt = <1300000>;
 					regulator-max-microvolt = <1300000>;
@@ -689,6 +689,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <3875>;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	memory-controller@7000f400 {
diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index 2ad56f84bb62..de39c5465c0a 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -357,7 +357,7 @@ sys_reg: sys {
 					regulator-always-on;
 				};
 
-				sm0 {
+				vdd_core: sm0 {
 					regulator-name = "vdd_sys_sm0,vdd_core";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
@@ -477,6 +477,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <3875>;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	pcie@80003000 {
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 1f4893699614..306e5f33e7f8 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -321,6 +321,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <3875>;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	pcie@80003000 {
@@ -444,6 +445,14 @@ pci_vdd_reg: regulator-pcivdd {
 		regulator-always-on;
 	};
 
+	vdd_core: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_core";
+		regulator-min-microvolt = <1300000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-always-on;
+	};
+
 	sound {
 		compatible = "nvidia,tegra-audio-trimslice";
 		nvidia,i2s-controller = <&tegra_i2s1>;
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 4284054ebd2c..3d3a7f23792a 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -544,6 +544,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <458>;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	usb@c5000000 {
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 9508248fd166..1898351a099f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -42,6 +42,8 @@ host1x@50000000 {
 		clock-names = "host1x";
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&host1x_dvfs_opp_table>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -55,6 +57,8 @@ mpe@54040000 {
 			clocks = <&tegra_car TEGRA20_CLK_MPE>;
 			resets = <&tegra_car 60>;
 			reset-names = "mpe";
+			power-domains = <&pd_mpe>;
+			operating-points-v2 = <&mpe_dvfs_opp_table>;
 		};
 
 		vi@54080000 {
@@ -64,6 +68,8 @@ vi@54080000 {
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 20>;
 			reset-names = "vi";
+			power-domains = <&pd_venc>;
+			operating-points-v2 = <&vi_dvfs_opp_table>;
 		};
 
 		epp@540c0000 {
@@ -73,6 +79,8 @@ epp@540c0000 {
 			clocks = <&tegra_car TEGRA20_CLK_EPP>;
 			resets = <&tegra_car 19>;
 			reset-names = "epp";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&epp_dvfs_opp_table>;
 		};
 
 		isp@54100000 {
@@ -82,6 +90,7 @@ isp@54100000 {
 			clocks = <&tegra_car TEGRA20_CLK_ISP>;
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
+			power-domains = <&pd_venc>;
 		};
 
 		gr2d@54140000 {
@@ -91,6 +100,8 @@ gr2d@54140000 {
 			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
 			resets = <&tegra_car 21>;
 			reset-names = "2d";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 		};
 
 		gr3d@54180000 {
@@ -99,6 +110,8 @@ gr3d@54180000 {
 			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
 			resets = <&tegra_car 24>;
 			reset-names = "3d";
+			power-domains = <&pd_3d>;
+			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 		};
 
 		dc@54200000 {
@@ -110,6 +123,8 @@ dc@54200000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&disp1_dvfs_opp_table>;
 
 			nvidia,head = <0>;
 
@@ -138,6 +153,8 @@ dc@54240000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&disp2_dvfs_opp_table>;
 
 			nvidia,head = <1>;
 
@@ -166,6 +183,8 @@ hdmi@54280000 {
 			clock-names = "hdmi", "parent";
 			resets = <&tegra_car 51>;
 			reset-names = "hdmi";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&hdmi_dvfs_opp_table>;
 			status = "disabled";
 		};
 
@@ -174,6 +193,8 @@ tvo@542c0000 {
 			reg = <0x542c0000 0x00040000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_TVO>;
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&tvo_dvfs_opp_table>;
 			status = "disabled";
 		};
 
@@ -185,6 +206,8 @@ dsi@54300000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&dsi_dvfs_opp_table>;
 			status = "disabled";
 		};
 	};
@@ -242,6 +265,13 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		sclk {
+			compatible = "nvidia,tegra20-sclk";
+			clocks = <&tegra_car TEGRA20_CLK_SCLK>;
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&sclk_dvfs_opp_table>;
+		};
 	};
 
 	flow-controller@60007000 {
@@ -319,6 +349,8 @@ vde@6001a000 {
 		clocks = <&tegra_car TEGRA20_CLK_VDE>;
 		reset-names = "vde", "mc";
 		resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
+		power-domains = <&pd_vde>;
+		operating-points-v2 = <&vde_dvfs_opp_table>;
 	};
 
 	apbmisc@70000800 {
@@ -460,6 +492,8 @@ nand-controller@70008000 {
 		reset-names = "nand";
 		assigned-clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
 		assigned-clock-rates = <150000000>;
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&ndflash_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -473,6 +507,8 @@ gmi@70009000 {
 		clock-names = "gmi";
 		resets = <&tegra_car 42>;
 		reset-names = "gmi";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&nor_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -643,6 +679,52 @@ tegra_pmc: pmc@7000e400 {
 		clocks = <&tegra_car TEGRA20_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
 		#clock-cells = <1>;
+
+		pd_core: core-domain {
+			#power-domain-cells = <0>;
+			operating-points-v2 = <&core_opp_table>;
+		};
+
+		powergates {
+			pd_3d: td {
+				clocks = <&tegra_car TEGRA20_CLK_GR3D>;
+				resets = <&mc TEGRA20_MC_RESET_3D>,
+					 <&tegra_car TEGRA20_CLK_GR3D>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_venc: venc {
+				clocks = <&tegra_car TEGRA20_CLK_ISP>,
+					 <&tegra_car TEGRA20_CLK_VI>,
+					 <&tegra_car TEGRA20_CLK_CSI>;
+				resets = <&mc TEGRA20_MC_RESET_ISP>,
+					 <&mc TEGRA20_MC_RESET_VI>,
+					 <&tegra_car TEGRA20_CLK_ISP>,
+					 <&tegra_car 20 /* VI */>,
+					 <&tegra_car TEGRA20_CLK_CSI>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_vde: vdec {
+				clocks = <&tegra_car TEGRA20_CLK_VDE>;
+				resets = <&mc TEGRA20_MC_RESET_VDE>,
+					 <&tegra_car TEGRA20_CLK_VDE>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_mpe: mpe {
+				clocks = <&tegra_car TEGRA20_CLK_MPE>;
+				resets = <&mc TEGRA20_MC_RESET_MPEA>,
+					 <&mc TEGRA20_MC_RESET_MPEB>,
+					 <&mc TEGRA20_MC_RESET_MPEC>,
+					 <&tegra_car TEGRA20_CLK_MPE>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+		};
 	};
 
 	mc: memory-controller@7000f000 {
@@ -662,12 +744,13 @@ emc: memory-controller@7000f400 {
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
+		power-domains = <&pd_core>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interconnect-cells = <0>;
 
-		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 		nvidia,memory-controller = <&mc>;
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 	};
 
 	fuse@7000f800 {
@@ -712,6 +795,9 @@ pcie@80003000 {
 			 <&tegra_car 72>,
 			 <&tegra_car 74>;
 		reset-names = "pex", "afi", "pcie_x";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&pcie_dvfs_opp_table>;
+
 		status = "disabled";
 
 		pci@1,0 {
@@ -753,6 +839,8 @@ usb@c5000000 {
 		reset-names = "usb";
 		nvidia,needs-double-reset;
 		nvidia,phy = <&phy1>;
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&usbd_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -792,6 +880,8 @@ usb@c5004000 {
 		resets = <&tegra_car 58>;
 		reset-names = "usb";
 		nvidia,phy = <&phy2>;
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&usb2_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -820,6 +910,8 @@ usb@c5008000 {
 		resets = <&tegra_car 59>;
 		reset-names = "usb";
 		nvidia,phy = <&phy3>;
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&usb3_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -856,6 +948,8 @@ mmc@c8000000 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sdmmc1_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -867,6 +961,8 @@ mmc@c8000200 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sdmmc2_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -878,6 +974,8 @@ mmc@c8000400 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sdmmc3_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -889,6 +987,8 @@ mmc@c8000600 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sdmmc4_dvfs_opp_table>;
 		status = "disabled";
 	};
 
-- 
2.33.1

