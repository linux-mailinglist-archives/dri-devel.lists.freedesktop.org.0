Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1512987CC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB67B6E873;
	Mon, 26 Oct 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25B56E192
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:19 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a5so7686609ljj.11
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EtARSQ1UZsWVrXhXXqbnFXVqC6PrHyWbac6GNR/RfRE=;
 b=hC5cytcQTbhten/DNQthBaeEMzs/CCbANDVKp+c2h8xrDi77e+RFk2B9eHY1/+/9RU
 fUZP9n5f46SI2oKNEl52z4zvCgfnx+CBghzqZgy3h+vV1zbgxSY5i1RBmtwUfaTLx0eA
 U4nNLcgujhv94iz3lJyfInXhm+3c+uBbGqVEmn3xVMPEYViWiC48+AGTKV92vEN/bKVr
 2p8x5/yps7b82dKXp46RmTq0x810Ri/kxVVhr7hTwxm+pk0ebKKDOg5/3SCzGZaki0CY
 hDh9XlYyOlDiBPjWrzr5jG9ms/Ia/+IfOD6MxlbbaFdFjDyGK//uItcInCiXKmmwsCHs
 hYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EtARSQ1UZsWVrXhXXqbnFXVqC6PrHyWbac6GNR/RfRE=;
 b=ViIuS2mK6B5gW/U4+berMhLiABBI02HbLNf8nEaWClbZ3iraAr61CUkJHNWG1lZBmE
 A6B8/izDfa3kJtgcDjtXp2I9z6W+kOPWNDY6zO+zP3eWPkSVlMcPM2O/qARxU2h2F+VO
 kYtNqLKDuBdGfrUHqlt0/pNDntWgBVGs8RA5Oc/jhfV3WE5Py44uGHMxlyS2WYU/SvO+
 +53f7eemKsIzU4eHpU8zW/LBDTs6TMGOAxhdHSyiJTPeUqEgiDVL0OWJAUOJ5lVBmcTb
 ulHf7xDYUp6TISnqotekUfgacZknbAX32ZYc+LOfqrvcZi+VpDnd3CTrhytbQvpQQdXd
 50Rg==
X-Gm-Message-State: AOAM5334yMV4JhM4IYl4Ow4oA1nIx+pjmJS2nKyDjqP+7WeJOBD8jLAn
 B8g1opOMcguNiz2OKjqhDuw=
X-Google-Smtp-Source: ABdhPJx1eXsXHCL6Qmt4pTPp+1AQn6lO6MdaP0mqXTZTBSluDWIYYkqvw+zb3NoVFT5/+8T0m/o3EQ==
X-Received: by 2002:a2e:9210:: with SMTP id k16mr4917881ljg.9.1603664298114;
 Sun, 25 Oct 2020 15:18:18 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:17 -0700 (PDT)
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
Subject: [PATCH v6 26/52] ARM: tegra: Add DVFS properties to Tegra30 EMC and
 ACTMON device-tree nodes
Date: Mon, 26 Oct 2020 01:17:09 +0300
Message-Id: <20201025221735.3062-27-digetx@gmail.com>
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

Add EMC OPP DVFS/DFS tables and interconnect paths that will be used for
dynamic memory bandwidth scaling based on memory utilization statistics.
Update board device-trees with optional EMC core supply and remove
unsupported OPPs.

Note that ACTMON watches all memory interconnect paths, but we use a
single CPU-READ interconnect path for driving memory bandwidth, for
simplicity.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../tegra30-asus-nexus7-grouper-common.dtsi   |  16 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 383 ++++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |   6 +
 3 files changed, 405 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 88ca03f57b3b..8758bd39e0db 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -956,6 +956,22 @@ pmc@7000e400 {
 		nvidia,sys-clock-req-active-high;
 	};
 
+	emc_opp_table0 {
+		/delete-node/ opp@750000000,1300;
+		/delete-node/ opp@800000000,1300;
+		/delete-node/ opp@900000000,1350;
+	};
+
+	emc_opp_table1 {
+		/delete-node/ opp@750000000;
+		/delete-node/ opp@800000000;
+		/delete-node/ opp@900000000;
+	};
+
+	memory-controller@7000f400 {
+		core-supply = <&vdd_core>;
+	};
+
 	ahub@70080000 {
 		i2s@70080400 {
 			status = "okay";
diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
new file mode 100644
index 000000000000..a6e171f65f6c
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	emc_icc_dvfs_opp_table: emc_opp_table0 {
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
+	emc_bw_dfs_opp_table: emc_opp_table1 {
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
