Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0E2AEA75
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE06089F2A;
	Wed, 11 Nov 2020 07:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D5E89D73
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 10so547620wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5uFDBqUvNz+fydkkYDh5aPchuEuZonwIyID57mrW6w=;
 b=XvcmsH8Sk0sBkLE8KYyc9/ISTFV5GpYV9P0IeBgZEkHKFiyO7ItCpEuxDMaGnNxmkH
 v2KFdUHUJ/UOGRVnltkYxwTn2l6KhQELRKy9JlUQEDOsTGzCuGkQzblogP4a0elumdYq
 0qwI9Hp4duGKWiJViXFbxKTKzQvB+i5Tvh2LyHOu7BefIcjHcQDZmSdpIjSYmGnHun/C
 8Nz+xpWY6sMD7z6M8tlWXkvWRfAsmEjbWmxt/NBiS2FJSHLlhxn7GQGEC3I3r+q8proB
 P9b/Z86e381RD+ivw3VHu9NBRO6+nxKQrwzzIFrYOApraEyWgy5NuQoaIcFZsauI5KAW
 gMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5uFDBqUvNz+fydkkYDh5aPchuEuZonwIyID57mrW6w=;
 b=TRpjNEnNBik/QNCU01A0dt/hhDY1Zyx+rOqw8RflfEKDcIeJFel7NgehAezxyqhR9I
 A88CWFIbSQKUX7QorQo9Tu6logv1iXVBohNolWfMnK5QruSf31iNI8pr0hc6omDThNop
 88lHc/rMm/9V1bFf9Qefh0zl7jc3rOCFtF4BzOxue9zQ9aGJUbjjaqk2rytIKTTGUBxM
 3bqfZooKRoEKwsHR4Y53gIhwofARJ5IGPrLmWjrKbF/m7y8Rdzvr7T0ae90w8keowgnZ
 7mgUiMUiF2EEb5ahO378m9oXGuu48a+seteQKBxJ8QGU5gud3jLnxgMrg9FqSba+u4g2
 dY+w==
X-Gm-Message-State: AOAM532BUstrQ5MUnjqePI9vfESEoggDKNDQyRPYHd904VYBgLuTqL8q
 rfbmMIabruMgRgZGWEOE4xU=
X-Google-Smtp-Source: ABdhPJzA17nc1eQJImS9Ck7gUbF13uTwyyAIYA1R6EObwv+tSdAbT2M2VuGyU0+zxeyAj3HPl7Cbyw==
X-Received: by 2002:a1c:6704:: with SMTP id b4mr897802wmc.96.1605057355192;
 Tue, 10 Nov 2020 17:15:55 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:54 -0800 (PST)
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
Subject: [PATCH v8 26/26] ARM: tegra: Add DVFS properties to Tegra124 EMC and
 ACTMON device-tree nodes
Date: Wed, 11 Nov 2020 04:14:56 +0300
Message-Id: <20201111011456.7875-27-digetx@gmail.com>
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
Remove unsupported EMC OPPs from board device-trees.

Note that ACTMON watches all memory interconnect paths, but we use a
single CPU-READ interconnect path for driving memory bandwidth, for
simplicity.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |   8 +
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |   8 +
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  |  10 +
 .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  10 +
 .../boot/dts/tegra124-peripherals-opp.dtsi    | 419 ++++++++++++++++++
 arch/arm/boot/dts/tegra124.dtsi               |   6 +
 6 files changed, 461 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
index 32401457ae71..a7ac805eeed5 100644
--- a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
@@ -1465,3 +1465,11 @@ timing-924000000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@1200000000,1100;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp@1200000000;
+};
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
index 861d3f22116b..df4e463afbd1 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
@@ -2420,3 +2420,11 @@ timing-924000000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@1200000000,1100;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp@1200000000;
+};
diff --git a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
index c91647d13a50..a0f56cc9da5c 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
@@ -6649,3 +6649,13 @@ timing-792000000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@924000000,1100;
+	/delete-node/ opp@1200000000,1100;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp@924000000;
+	/delete-node/ opp@1200000000;
+};
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
index d2beea0bd15f..35c98734d35f 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
@@ -2048,3 +2048,13 @@ timing-792000000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@924000000,1100;
+	/delete-node/ opp@1200000000,1100;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp@924000000;
+	/delete-node/ opp@1200000000;
+};
diff --git a/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
new file mode 100644
index 000000000000..49d9420a3289
--- /dev/null
+++ b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
@@ -0,0 +1,419 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	emc_icc_dvfs_opp_table: emc-dvfs-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@12750000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@12750000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@12750000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@12750000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@20400000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@20400000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@20400000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@20400000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@40800000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@40800000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@40800000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@40800000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@68000000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@68000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@68000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@68000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@102000000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@102000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@102000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@102000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@204000000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@204000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@204000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@204000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@264000000,800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@264000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@264000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@264000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@300000000,850 {
+			opp-microvolt = <850000 850000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@300000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@300000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@300000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@348000000,850 {
+			opp-microvolt = <850000 850000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@348000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@348000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@348000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@396000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@396000000,1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@396000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@396000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@528000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@528000000,1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@528000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@528000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@600000000,950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp@600000000,1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp@600000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@600000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@792000000,1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x000B>;
+		};
+
+		opp@792000000,1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp@792000000,1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp@924000000,1100 {
+			opp-microvolt = <1100000 1100000 1150000>;
+			opp-hz = /bits/ 64 <924000000>;
+			opp-supported-hw = <0x0013>;
+		};
+
+		opp@1200000000,1100 {
+			opp-microvolt = <1100000 1100000 1150000>;
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x0003>;
+		};
+	};
+
+	emc_bw_dfs_opp_table: emc-bandwidth-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@12750000 {
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <204000>;
+		};
+
+		opp@20400000 {
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <326400>;
+		};
+
+		opp@40800000 {
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <652800>;
+		};
+
+		opp@68000000 {
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <1088000>;
+		};
+
+		opp@102000000 {
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <1632000>;
+		};
+
+		opp@204000000 {
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <3264000>;
+		};
+
+		opp@264000000 {
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <4224000>;
+		};
+
+		opp@300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <4800000>;
+		};
+
+		opp@348000000 {
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <5568000>;
+		};
+
+		opp@396000000 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <6336000>;
+		};
+
+		opp@528000000 {
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <8448000>;
+		};
+
+		opp@600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <9600000>;
+		};
+
+		opp@792000000 {
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <12672000>;
+		};
+
+		opp@924000000 {
+			opp-hz = /bits/ 64 <924000000>;
+			opp-supported-hw = <0x0013>;
+			opp-peak-kBps = <14784000>;
+		};
+
+		opp@1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x0003>;
+			opp-peak-kBps = <19200000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 1801e30b1d3a..46441d10a3fc 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/thermal/tegra124-soctherm.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
+#include "tegra124-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra124";
 	interrupt-parent = <&lic>;
@@ -290,6 +292,9 @@ actmon@6000c800 {
 		clock-names = "actmon", "emc";
 		resets = <&tegra_car 119>;
 		reset-names = "actmon";
+		operating-points-v2 = <&emc_bw_dfs_opp_table>;
+		interconnects = <&mc TEGRA124_MC_MPCORER &emc>;
+		interconnect-names = "cpu-read";
 	};
 
 	gpio: gpio@6000d000 {
@@ -660,6 +665,7 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 
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
