Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED022B3B0D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62C089F55;
	Mon, 16 Nov 2020 01:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5E96E9F0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:34 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id b17so17824371ljf.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EQFGtDz+eXLg7dXb4gglyvWDP06c+/8mo10e9Fv/CVo=;
 b=eGhOmYLXIiyHKIPsHGH5GAFZHYG54DspuJmR0drQy7XKv9l/R3ah57bz05zAk1pv3K
 3p7QjKNFhNLYxDhr7TmEj/ZUwWf2IDi7l4nT6LdkLzCYgjfqlqa2W3igJxJz0geS6Vsd
 DpJSkqr5owOdSOr+7bqhf1NRzjK20XILbWFY97f4Skxhx75Wg+G65EmNthtbrbvcbmYA
 py4H87rY7tGo+/AxZVS2XZIU6cX2+656gKuomr1ZePK21auiYVj80tFS29RYfH39Qp1W
 79wWi+Ny/X/3KD+cqCsEfvsQc2RPBfY0Ucv2cVko2HU1Qp2WvJeGTv1rFJrC+ET2TxIL
 bMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EQFGtDz+eXLg7dXb4gglyvWDP06c+/8mo10e9Fv/CVo=;
 b=EutKKvodM4/Cvvqu2OxUOWp7dqsuJU2t2WbvuBjGC9CHf5A5W4P8Fw0sIS8TbVrjQ3
 Q6qaEGalxA3+Us7X/nca65qvptxVlvrj48FQ/7Qp6ApS/2CCzwXyqt76mBRvkkCP+s2z
 RoKdR3SBCPx7e6u2JSnosoPlZOqarQtad+KFwwbizAavxQxjfTksdsiDOBlYh6LyLVQb
 XP8pPeGNiRYHTxKaCZzemao4EBVBMKXpmMQ4FVGaifWzvh2QqKNcQTlnvDSrerBQmnx1
 lXGakSy6CrDfiETnVEtwrpjdTBUmQ6eCagvYdKbRwtza6edI0G8av6QETRjnDy6Fw97g
 LN4g==
X-Gm-Message-State: AOAM530FLFS78zTMMVyotHi85fqqzh6D3QPRHA91pWRz6mFYtRHsdh8r
 oCPqcrpVjghDUX9/ZteHnn4=
X-Google-Smtp-Source: ABdhPJwepzSpIrx3/E3wKYYlKv5By8ueG752qAXvWsiWkeIODRI21B1YaXFSNBmCWpfrLyzz5hgegA==
X-Received: by 2002:a2e:a17c:: with SMTP id u28mr5292290ljl.453.1605476012561; 
 Sun, 15 Nov 2020 13:33:32 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:32 -0800 (PST)
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
Subject: [PATCH v9 15/17] ARM: tegra: Add EMC OPP properties to Tegra20
 device-trees
Date: Mon, 16 Nov 2020 00:29:20 +0300
Message-Id: <20201115212922.4390-16-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115212922.4390-1-digetx@gmail.com>
References: <20201115212922.4390-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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

Add EMC OPP DVFS tables and update board device-trees by removing
unsupported OPPs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../boot/dts/tegra20-acer-a500-picasso.dts    |  5 +
 arch/arm/boot/dts/tegra20-colibri.dtsi        |  4 +
 arch/arm/boot/dts/tegra20-paz00.dts           |  4 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi | 92 +++++++++++++++++++
 arch/arm/boot/dts/tegra20.dtsi                |  3 +
 5 files changed, 108 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index dd6fb134ee39..a29b44837855 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1451,3 +1451,8 @@ emc-table@300000 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@666000000;
+	/delete-node/ opp@760000000;
+};
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 6162d193e12c..585a5b441cf6 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -742,6 +742,10 @@ sound {
 	};
 };
 
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@760000000;
+};
+
 &gpio {
 	lan-reset-n {
 		gpio-hog;
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ada2bed8b1b5..7e49112cd9a1 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -662,3 +662,7 @@ cpu@1 {
 		};
 	};
 };
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp@760000000;
+};
diff --git a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
new file mode 100644
index 000000000000..25b1ba73951e
--- /dev/null
+++ b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	emc_icc_dvfs_opp_table: emc-dvfs-opp-table {
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
+};
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 8f8ad81916e7..6ce498178105 100644
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
@@ -664,6 +666,7 @@ emc: memory-controller@7000f400 {
 		#size-cells = <0>;
 		#interconnect-cells = <0>;
 
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 		nvidia,memory-controller = <&mc>;
 	};
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
