Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3C2987BB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3756E835;
	Mon, 26 Oct 2020 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858116E20C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:18 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b1so9400410lfp.11
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWoeVer2DQ4Ci/3B8ME3CGqRj1U6D4IaN098JD3Mytg=;
 b=gxb+k1hf+1EwD78Exn86L0lJ4S+8qfCUwVItqgrv55I8MhOlS9Klk9RWUjExHu4HQ9
 jlUnoDv6T2njdB+cUajN6QyoKSs1lZCFr9S21eeY29jbWIE4RuKWd8ChgLGhL0bTX335
 af5B1lBJEQ7P7t9YfNtQfrlIsiZTu+FD+pRd7CbUIa2n2VJPL8TAtu+8QOBOvuNeVdxE
 nj/w8L/LxEX+MYyu2NYsNrjN4qyYCssgfXUzPEBWd+mSXhz0XeFaNxieR4/hAN4pw+t5
 CcpyeHf90IczdrswKl41AwtyBLV5z0egy3RJ0YvvlLTXu3nEqHuS7F5Y0ya9UZtu4TTi
 uXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWoeVer2DQ4Ci/3B8ME3CGqRj1U6D4IaN098JD3Mytg=;
 b=Gc+5VlzR7wWbPTDY5f+eOXb9m1SYwtxjSZDXRk4aK8DZD9QJ9k6xCqost87INevYq9
 zuFQ31ifcti//r+vRXJ41HpkRcFyaKmo2gbRwi2/nEg+vc4YX6eKUiF8W6IiHcANtOeC
 a/RRqm7xOUIqAJtJ0B+uREBhi9PBfMYlXYzxVt0JMUNXaGD21jtMfo8IE4AB32sKlolc
 myOaGRE4jEM+bSNAPmIc8zREWJ/kSwaIcGKcCrrcftBknZ2+nZvc+Y9hrAvaMDIyKzGv
 ZJhrWb3/w8yCqvXhY7rle1Aa2L0jMqj5ye4/Lly4BSdXFGG5HAmaVHhaSRdNwKznNa3A
 b1FQ==
X-Gm-Message-State: AOAM5306wAEZE+gCx+uVhFUsvF2lZcGwKwKn2LYoeknmQgCPkTNXtfa6
 TYP9Z1XLNgkhqTWoH9lfTPI=
X-Google-Smtp-Source: ABdhPJy8F3ekilkLnsZ4j+jlUn3nnCvjuMLTsROqeMJeSfte9RBFfuUzA/bp0DJzIiFVvGdGqZm8PQ==
X-Received: by 2002:a19:7009:: with SMTP id h9mr4427340lfc.201.1603664296977; 
 Sun, 25 Oct 2020 15:18:16 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:16 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 25/52] ARM: tegra: Add DVFS properties to Tegra20 EMC
 device-tree node
Date: Mon, 26 Oct 2020 01:17:08 +0300
Message-Id: <20201025221735.3062-26-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add EMC OPP DVFS/DFS tables and emc-stats subdev that will be used for
dynamic memory bandwidth scaling, while EMC itself will perform voltage
scaling. Update board device-trees with optional EMC core supply and
remove unsupported OPPs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../boot/dts/tegra20-acer-a500-picasso.dts    |  12 ++
 arch/arm/boot/dts/tegra20-colibri.dtsi        |   8 +
 arch/arm/boot/dts/tegra20-paz00.dts           |  10 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi | 181 ++++++++++++++++++
 arch/arm/boot/dts/tegra20.dtsi                |  12 +-
 5 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index a0b829738e8f..f5c1591c8ea8 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1058,9 +1058,21 @@ map0 {
 		};
 	};
 
+	emc_opp_table0 {
+		/delete-node/ opp@666000000;
+		/delete-node/ opp@760000000;
+	};
+
+	emc_opp_table1 {
+		/delete-node/ opp@666000000;
+		/delete-node/ opp@760000000;
+	};
+
 	memory-controller@7000f400 {
 		nvidia,use-ram-code;
 
+		core-supply = <&vdd_core>;
+
 		emc-tables@0 {
 			nvidia,ram-code = <0>; /* elpida-8gb */
 
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 6162d193e12c..78a2210bf9ae 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -611,6 +611,14 @@ i2c-thermtrip {
 		};
 	};
 
+	emc_opp_table0 {
+		/delete-node/ opp@760000000;
+	};
+
+	emc_opp_table1 {
+		/delete-node/ opp@760000000;
+	};
+
 	memory-controller@7000f400 {
 		emc-table@83250 {
 			reg = <83250>;
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ada2bed8b1b5..7b9f0f279744 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -311,9 +311,19 @@ nvec@7000c500 {
 		reset-names = "i2c";
 	};
 
+	emc_opp_table0 {
+		/delete-node/ opp@760000000;
+	};
+
+	emc_opp_table1 {
+		/delete-node/ opp@760000000;
+	};
+
 	memory-controller@7000f400 {
 		nvidia,use-ram-code;
 
+		core-supply = <&core_vdd_reg>;
+
 		emc-tables@0 {
 			nvidia,ram-code = <0x0>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
new file mode 100644
index 000000000000..d10c61107702
--- /dev/null
+++ b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	emc_icc_dvfs_opp_table: emc_opp_table0 {
+		compatible = "operating-points-v2";
+
+		opp@36000000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <36000000>;
+		};
+
+		opp@47500000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <47500000>;
+		};
+
+		opp@50000000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <50000000>;
+		};
+
+		opp@54000000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <54000000>;
+		};
+
+		opp@57000000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <57000000>;
+		};
+
+		opp@100000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <100000000>;
+		};
+
+		opp@108000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <108000000>;
+		};
+
+		opp@126666000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <126666000>;
+		};
+
+		opp@150000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <150000000>;
+		};
+
+		opp@190000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <190000000>;
+		};
+
+		opp@216000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <216000000>;
+		};
+
+		opp@300000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+		};
+
+		opp@333000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <333000000>;
+		};
+
+		opp@380000000 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <380000000>;
+		};
+
+		opp@600000000 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <600000000>;
+		};
+
+		opp@666000000 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <666000000>;
+		};
+
+		opp@760000000 {
+			opp-microvolt = <1300000 1300000 1300000>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+	};
+
+	emc_bw_dfs_opp_table: emc_opp_table1 {
+		compatible = "operating-points-v2";
+
+		opp@36000000 {
+			opp-hz = /bits/ 64 <36000000>;
+			opp-peak-kBps = <144000>;
+		};
+
+		opp@47500000 {
+			opp-hz = /bits/ 64 <47500000>;
+			opp-peak-kBps = <190000>;
+		};
+
+		opp@50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+			opp-peak-kBps = <200000>;
+		};
+
+		opp@54000000 {
+			opp-hz = /bits/ 64 <54000000>;
+			opp-peak-kBps = <216000>;
+		};
+
+		opp@57000000 {
+			opp-hz = /bits/ 64 <57000000>;
+			opp-peak-kBps = <228000>;
+		};
+
+		opp@100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-peak-kBps = <400000>;
+		};
+
+		opp@108000000 {
+			opp-hz = /bits/ 64 <108000000>;
+			opp-peak-kBps = <432000>;
+		};
+
+		opp@126666000 {
+			opp-hz = /bits/ 64 <126666000>;
+			opp-peak-kBps = <506664>;
+		};
+
+		opp@150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-peak-kBps = <600000>;
+		};
+
+		opp@190000000 {
+			opp-hz = /bits/ 64 <190000000>;
+			opp-peak-kBps = <760000>;
+		};
+
+		opp@216000000 {
+			opp-hz = /bits/ 64 <216000000>;
+			opp-peak-kBps = <864000>;
+		};
+
+		opp@300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-peak-kBps = <1200000>;
+		};
+
+		opp@333000000 {
+			opp-hz = /bits/ 64 <333000000>;
+			opp-peak-kBps = <1332000>;
+		};
+
+		opp@380000000 {
+			opp-hz = /bits/ 64 <380000000>;
+			opp-peak-kBps = <1520000>;
+		};
+
+		opp@600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-peak-kBps = <2400000>;
+		};
+
+		opp@666000000 {
+			opp-hz = /bits/ 64 <666000000>;
+			opp-peak-kBps = <2664000>;
+		};
+
+		opp@760000000 {
+			opp-hz = /bits/ 64 <760000000>;
+			opp-peak-kBps = <3040000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 8f8ad81916e7..8a90d96c8773 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
+#include "tegra20-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra20";
 	interrupt-parent = <&lic>;
@@ -656,7 +658,7 @@ mc: memory-controller@7000f000 {
 	};
 
 	emc: memory-controller@7000f400 {
-		compatible = "nvidia,tegra20-emc";
+		compatible = "nvidia,tegra20-emc", "simple-mfd";
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
@@ -664,7 +666,15 @@ emc: memory-controller@7000f400 {
 		#size-cells = <0>;
 		#interconnect-cells = <0>;
 
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 		nvidia,memory-controller = <&mc>;
+
+		emc-stats {
+			compatible = "nvidia,tegra20-emc-statistics";
+			operating-points-v2 = <&emc_bw_dfs_opp_table>;
+			interconnects = <&mc TEGRA20_MC_MPCORER &emc>;
+			interconnect-names = "cpu-read";
+		};
 	};
 
 	fuse@7000f800 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
