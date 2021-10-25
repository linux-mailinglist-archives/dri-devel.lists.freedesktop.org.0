Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD843A769
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88D789C8F;
	Mon, 25 Oct 2021 22:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6532B6E32A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:20 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id s19so12042549ljj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wv8xniU98qoDn0Njp1PEDIXHWTLWQ5ogL2Iz8Mv60Wc=;
 b=Xs3QBD55PKjB8IbKs+WI6gmgdIGaGHClxcdL/ogk4Ntv9H24cSJn6dAeD2/AY7yLny
 UweftXzTXfCqoKIFxfa6Q3i78C7q8y/nn/vi2sfAH9SAdX4/j2wGv5zInwFK5slZrKyu
 OABIk44wrfAQ9G6LQ5eGGf56r+MtZt6r3AC7DU9/YG30d/eZnN3bGghA40qVbu/XPjBh
 8zrAd94K65coPB7241fjx2M32DM1Nn2Jg4krLlZvBaUh3Z4d8BVNNjHHy7d5HaT3RLMR
 CLefQa5hfMPHhs9arE2dgxhmwLWVtY31/R+FN7pAJVOiYlpLVZ3OjhMXJlNCczJM0V0p
 BzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wv8xniU98qoDn0Njp1PEDIXHWTLWQ5ogL2Iz8Mv60Wc=;
 b=VC8R92o8wsfbKl1C06SVECIuJ/rNbCdE7LbLWCI+xQiTLxnsJcuyh9BkQxKV3v2Oya
 Z4OipaYgCsB46xjli70xLUq/Tk3lCe6t6XRKcLTIIHyRjwa3fzkGRUZBf4CZM1625Liy
 KQD56mdr5kXOBrf+3VIh3GFLnKMz9Jzae/MmkSQuHMWRnAJscoGGby0n2v9ATotmlHD+
 bhHZN27niQP3v4s/9relYU5Cp4Zt4f5ypY7ros75hDZFx1AigPT4nCI3+0c7EWbK/xRf
 w73W/goMLDk94tKp+ko9NT5j9xQaVRUu8yHkwfQEDfLwU7SwpuGSV+1p7UJGjHLS+fLC
 1Pow==
X-Gm-Message-State: AOAM5309J4WiHkJH7d3E5jtrC73xYIYlcFQPHXVgQ+OzB4QwSzUjNQvU
 zmgLAlcc7vICRpivV1rqnfw=
X-Google-Smtp-Source: ABdhPJwhUbTV+d/uTtlr2F4BLAMIFWAS/dPnjgjd8hkofr2rg6lrIeJYLokYvr+a3j9/Ow0x0sDdLQ==
X-Received: by 2002:a2e:a58b:: with SMTP id m11mr6573965ljp.376.1635201978388; 
 Mon, 25 Oct 2021 15:46:18 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:18 -0700 (PDT)
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
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 35/39] ARM: tegra: Add OPP tables and power domains to
 Tegra20 device-trees
Date: Tue, 26 Oct 2021 01:40:28 +0300
Message-Id: <20211025224032.21012-36-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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
index 9a3510dcbb31..777b5a14de55 100644
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
index ae4312eedcbd..b21bab437ebd 100644
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
index 50fe311b2cdf..21884d9d58cc 100644
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
index 92d494b8c3d2..5aeb7bb6c415 100644
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
index dd4d506683de..d5888d958175 100644
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
index 4bc87bc0c2a4..582dc7910ff8 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -321,6 +321,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <3875>;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	pcie@80003000 {
@@ -444,6 +445,14 @@ pci_vdd_reg: regulator@4 {
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
index 5a2578b3707f..e41ce1b1ec3f 100644
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

