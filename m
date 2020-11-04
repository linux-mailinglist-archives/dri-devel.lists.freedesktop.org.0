Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01102A78E7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AFF6E9E7;
	Thu,  5 Nov 2020 08:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FDB6E1F6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:58 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l10so2705167lji.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zMjVAb/o+piDt6czNf33ZOuiJhcOMgOALVgnOUvCv+Q=;
 b=J5T6DekOX2/mStRW2kN+A42EuaML774sXiKphiTQpyCZB1Q3Z1tK4AuJa7JZJggCLP
 18BrszdwXTp7Xl+6S8EcJAO2jHjHh3OpTjVPeizFtXT1zuF0N0xHfGMATTxdM+hC7CLk
 9NZFOJ/kSMJYvsO2csoCvgZQJ60jCU65GVRtqn68Z25XSyZkIXdOojKqdSJiw+JCT6ZN
 1uJyN5ztkmMEs+zsajEeYKjuXs0ezL2Y5/k5oj7I3RMdkXjWSlGcI6mvzSDddjqj6olh
 gVwvdfnuQCFNEZ3RIu0QStI2kH/4Y99S5yOCgCnpYgWChGrncAAdR4MZggy02TgTsERE
 /D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zMjVAb/o+piDt6czNf33ZOuiJhcOMgOALVgnOUvCv+Q=;
 b=JHFhYAKiLlhN6lwkgoAOo5B21D9tww1T0Hi3L+ee36u/xIG2lp9N6j/mG2QqnyjlCn
 e9Pa4moX7gjT2L1B058M5MTsMD5Oh3lWhuCBhq5yx/1E1wrLrPy5C5CdwOsHlZP0zlsm
 OyOFg53yqgLHTGEjuV+U3fBePj0tsJrKomcEWgyDm2avd6ZWEdbIyWFExKaMeO5v3qe4
 VBQQpIdYidfhEeowYC6eJQwnu3dwfx6EGEFL50iqaMs0Pn/YC46PeH5fxWyb1X0Q/Dz1
 U2XIw9Hx5LTj+GLKEiyml2Loa7DZMk+Qcb/XzLnQ41vmjx1c+fSLy2Tw4zhr7Ccc2uYn
 ZWnA==
X-Gm-Message-State: AOAM530uV8oXnO6w3Pld+wtwVBK2uSNHzIdst6y+Dj7HwAEOZikJk48y
 RLBg9aEeMLicYSo2k85MWgE=
X-Google-Smtp-Source: ABdhPJz2HGD4TXgSItk7Rtigv8YIrUYlQARDbDYB5TdVTsgs37ssyr908bh9eWipG2f7efdAPz6+/g==
X-Received: by 2002:a05:651c:234:: with SMTP id
 z20mr11824370ljn.337.1604508596400; 
 Wed, 04 Nov 2020 08:49:56 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:55 -0800 (PST)
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
Subject: [PATCH v7 22/47] ARM: tegra: Add interconnect properties to Tegra30
 device-tree
Date: Wed,  4 Nov 2020 19:48:58 +0300
Message-Id: <20201104164923.21238-23-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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

Add interconnect properties to the Memory Controller, External Memory
Controller and the Display Controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index aeae8c092d41..2caf6cc6f4b1 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -210,6 +210,17 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0A &emc>,
+					<&mc TEGRA30_MC_DISPLAY0B &emc>,
+					<&mc TEGRA30_MC_DISPLAY1B &emc>,
+					<&mc TEGRA30_MC_DISPLAY0C &emc>,
+					<&mc TEGRA30_MC_DISPLAYHC &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -229,6 +240,17 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA30_MC_DISPLAY1BB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA30_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -748,15 +770,18 @@ mc: memory-controller@7000f000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra30-emc";
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_EMC>;
 
 		nvidia,memory-controller = <&mc>;
+
+		#interconnect-cells = <0>;
 	};
 
 	fuse@7000f800 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
