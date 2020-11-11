Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8E2AEA6B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DBD89EB1;
	Wed, 11 Nov 2020 07:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9587A89D6C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r17so759312wrw.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TB3vTkwxlhuWnP8cBBmfLNH4+yzCIept4MHX0zkacDo=;
 b=lZ8mUk9nmNNHGZDtQIt++joj7/sIkNZhAKVaA85DjvPlv0HFxqUFMl0l6Hkw1pFT1l
 BdWeTqohxrdxeF9wJJwyv5nPc+THWF+zf4qyH0o1B/zfLWywKEO0dJcxQf3w1hbbO080
 OWDg3HeJfPEjVg58ROkGEblCgmOsCzu3DCr/tgo/ygg8uOMh4amDlEL3cXnNS8utLjMW
 zvuDVF8lVTKr6AUnEkgBtYZp87BP+rbEo2tXmM373tPevrWng2igWFpEKg2mJhP2oOm0
 xQ2RkdpKUNJJCdhJUVEt3Dl54epaa9HJyOXFpi+vL8syjVLmrewZX01/7ZC1ZPexzd9W
 j/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TB3vTkwxlhuWnP8cBBmfLNH4+yzCIept4MHX0zkacDo=;
 b=riJYbl8IdTt5JE2tdwQJmczBPmKm45zYqnjRMFyxA3PW/fnR725marXox+618ZFLWY
 5gGw1YymjQ5XMPp/xNrI8UftIv5VaneabI0RFkdwZJQgAhrtoRAkEfSmA64x/RXRdJJ+
 zbbEfP//4whHlJvYRq0sfZm3J4C4qG6HOOc1ZkchmhWCUcrzZUVVIalQYXz5vlwtZw0W
 PQqS7g4KDHXtbt3hD3E+f9r9Qf6bbte8xiAUf3bEoA2CJA3OE8KULhuyRJlUtT/zd6V4
 h3o+p9aYibLCLSwbCb3VydM0Ahfi8f5CA3o9XVYfWXd/ugkxN/J8b+Z/QLDV96vIwp8h
 tzQA==
X-Gm-Message-State: AOAM533pH4jrJvsmHvufx63g5IuU+iIM2Kj5JCoTVW9g0q/D4dqtrKQs
 0E6Cl6IUXvFG0bE9bpgdU8Y=
X-Google-Smtp-Source: ABdhPJx8J/VqYADQly6WIhiNPkIDWNhOmVTfBL8X3cE24N8hxE97pJBlAvT8IRleVEloCdfjsVWHfw==
X-Received: by 2002:adf:c443:: with SMTP id a3mr23588947wrg.249.1605057353268; 
 Tue, 10 Nov 2020 17:15:53 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:52 -0800 (PST)
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
Subject: [PATCH v8 25/26] ARM: tegra: Add DVFS properties to Tegra30 EMC and
 ACTMON device-tree nodes
Date: Wed, 11 Nov 2020 04:14:55 +0300
Message-Id: <20201111011456.7875-26-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111011456.7875-1-digetx@gmail.com>
References: <20201111011456.7875-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add EMC OPP DVFS/DFS tables and interconnect paths that will be used for
dynamic memory bandwidth scaling based on memory utilization statistics.
Update board device-trees with optional EMC core supply and remove
unsupported OPPs.

Note that ACTMON watches all memory interconnect paths, but we use a
single CPU-READ interconnect path for driving memory bandwidth, for
simplicity.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../tegra30-asus-nexus7-grouper-common.dtsi   |   4 +
 ...30-asus-nexus7-grouper-memory-timings.dtsi |  12 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 383 ++++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |   6 +
 4 files changed, 405 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 88ca03f57b3b..261e266c61d8 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -956,6 +956,10 @@ pmc@7000e400 {
 		nvidia,sys-clock-req-active-high;
 	};
 
+	memory-controller@7000f400 {
+		core-supply = <&vdd_core>;
+	};
+
 	ahub@70080000 {
 		i2s@70080400 {
 			status = "okay";
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-memory-timings.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-memory-timings.dtsi
index bc0f6f29b956..bcff0997ee51 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-memory-timings.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-memory-timings.dtsi
@@ -1563,3 +1563,15 @@ timing-667000000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@750000000,1300;
+	/delete-node/ opp@800000000,1300;
+	/delete-node/ opp@900000000,1350;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp@750000000;
+	/delete-node/ opp@800000000;
+	/delete-node/ opp@900000000;
+};
diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
new file mode 100644
index 000000000000..cbe84d25e726
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	emc_icc_dvfs_opp_table: emc-dvfs-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@12750000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@12750000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp@12750000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@25500000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <25500000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@25500000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <25500000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp@25500000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <25500000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@27000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <27000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@27000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <27000000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp@27000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <27000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@51000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <51000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@51000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <51000000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp@51000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <51000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@54000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <54000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@54000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <54000000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp@54000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <54000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@102000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@102000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp@102000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@108000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <108000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@108000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <108000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@204000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@204000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@333500000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <333500000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@333500000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <333500000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp@333500000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <333500000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@375000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <375000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@375000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <375000000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp@375000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <375000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@400000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@400000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp@400000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@416000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@450000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <450000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@450000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <450000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@533000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <533000000>;
+			opp-supported-hw = <0x0007>;
+		};
+
+		opp@533000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <533000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@625000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <625000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@625000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <625000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@667000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <667000000>;
+			opp-supported-hw = <0x0006>;
+		};
+
+		opp@750000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <750000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@800000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@900000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <900000000>;
+			opp-supported-hw = <0x0004>;
+		};
+	};
+
+	emc_bw_dfs_opp_table: emc-bandwidth-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@12750000 {
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <102000>;
+		};
+
+		opp@25500000 {
+			opp-hz = /bits/ 64 <25500000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <204000>;
+		};
+
+		opp@27000000 {
+			opp-hz = /bits/ 64 <27000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <216000>;
+		};
+
+		opp@51000000 {
+			opp-hz = /bits/ 64 <51000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <408000>;
+		};
+
+		opp@54000000 {
+			opp-hz = /bits/ 64 <54000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <432000>;
+		};
+
+		opp@102000000 {
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <816000>;
+		};
+
+		opp@108000000 {
+			opp-hz = /bits/ 64 <108000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <864000>;
+		};
+
+		opp@204000000 {
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <1632000>;
+		};
+
+		opp@333500000 {
+			opp-hz = /bits/ 64 <333500000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <2668000>;
+		};
+
+		opp@375000000 {
+			opp-hz = /bits/ 64 <375000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <3000000>;
+		};
+
+		opp@400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <3200000>;
+		};
+
+		opp@416000000 {
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <3328000>;
+		};
+
+		opp@450000000 {
+			opp-hz = /bits/ 64 <450000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <3600000>;
+		};
+
+		opp@533000000 {
+			opp-hz = /bits/ 64 <533000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <4264000>;
+		};
+
+		opp@625000000 {
+			opp-hz = /bits/ 64 <625000000>;
+			opp-supported-hw = <0x000E>;
+			opp-peak-kBps = <5000000>;
+		};
+
+		opp@667000000 {
+			opp-hz = /bits/ 64 <667000000>;
+			opp-supported-hw = <0x0006>;
+			opp-peak-kBps = <5336000>;
+		};
+
+		opp@750000000 {
+			opp-hz = /bits/ 64 <750000000>;
+			opp-supported-hw = <0x0004>;
+			opp-peak-kBps = <6000000>;
+		};
+
+		opp@800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x0004>;
+			opp-peak-kBps = <6400000>;
+		};
+
+		opp@900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-supported-hw = <0x0004>;
+			opp-peak-kBps = <7200000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 2caf6cc6f4b1..44a6dbba7081 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
+#include "tegra30-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra30";
 	interrupt-parent = <&lic>;
@@ -417,6 +419,9 @@ actmon@6000c800 {
 		clock-names = "actmon", "emc";
 		resets = <&tegra_car TEGRA30_CLK_ACTMON>;
 		reset-names = "actmon";
+		operating-points-v2 = <&emc_bw_dfs_opp_table>;
+		interconnects = <&mc TEGRA30_MC_MPCORER &emc>;
+		interconnect-names = "cpu-read";
 	};
 
 	gpio: gpio@6000d000 {
@@ -780,6 +785,7 @@ emc: memory-controller@7000f400 {
 		clocks = <&tegra_car TEGRA30_CLK_EMC>;
 
 		nvidia,memory-controller = <&mc>;
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 
 		#interconnect-cells = <0>;
 	};
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
