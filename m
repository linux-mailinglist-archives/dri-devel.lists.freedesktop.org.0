Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7C1F0F23
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853E26E41B;
	Sun,  7 Jun 2020 19:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315736E392
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:46 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 9so17748579ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AG+TQmILbbrHUh9/3fg4pGtkuDKOX+TOZbe0Aj0MBf0=;
 b=LIq4c8YbjlyO0sK/gqRyiPHgJQTiyjSMFqPnqw8CnrhRifowuVWK/bN5TPuol27HNH
 XQYOD4rqSMx+ziPSh4b0n/OKjA/EqAJw1igg7gKrXlJMwNQjd0iBbEKBVft6leByyE+o
 s4s0Sf2PwuayhukHlDP7Cgh2bqyxK9uZADTErRWShkosBV6huDREWh4EG44YCrxlc6Ak
 FMIl3qTb15u4Ten/09SY8bt2rT1YcgBZWVzJzf+HiHbhu6E7GoQMvGEEsqHC1PYic5nN
 FITSTnuJBt+7tI+pZ1JlBx2kpcQ6YF9rIFOF2TQLCEDFLt3/LPRophmf+lx0tOOBu6L3
 sBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AG+TQmILbbrHUh9/3fg4pGtkuDKOX+TOZbe0Aj0MBf0=;
 b=PU8vYQAmRGtxPtjOMLcgpscVaKviNSAiklXA+xElTESANnjo32ntS9G6jERGN00QjW
 MvOPRO2j+RMfpzS1ydbeMFoUZCN9AfiSHSW9yEZrhJWrkmkq1oyDoBQV33kQE+yWkm6q
 zLGNEdehl+hRADYsFrmT3XDwhT4xrjGrt9+5xuSY6fer6H16j0QBHZ/4aqEb1toGWcPP
 UwOlrCXCr3dQ+iXUP/h7y7m/2nzl/8uUX67amuKQKNEt8vcnGfnWrbtunfFMc8VT6g3r
 T/ybV/Th+Ub59z+oirGz9I4ww+AFcEgw71yWRs+qD/glE395RP0Xv3ikASBY/4Qa1oG7
 OtyA==
X-Gm-Message-State: AOAM531J/Jp83AIkil9l6q8XDuI3QM3l6vkKhXCyZD1MeRdlOgLyFVP3
 0rChtB/7cLxcKC3cMc/WiT4=
X-Google-Smtp-Source: ABdhPJyzHgDDjmNOTd8FYboo4P8nIdCH9ClNwLd7hbY9gzNdY2NSabkELJ2Zn6ABhqGtUXsXbGNkzQ==
X-Received: by 2002:a2e:911:: with SMTP id 17mr9786613ljj.411.1591556264654;
 Sun, 07 Jun 2020 11:57:44 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v3 26/39] ARM: tegra: Add interconnect properties to Tegra30
 device-tree
Date: Sun,  7 Jun 2020 21:55:17 +0300
Message-Id: <20200607185530.18113-27-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnect properties to the memory controller, external memory
controller and the display controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index d2d05f1da274..2b183025629f 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -208,6 +208,15 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0A &emc>,
+					<&mc TEGRA30_MC_DISPLAY0B &emc>,
+					<&mc TEGRA30_MC_DISPLAY0C &emc>,
+					<&mc TEGRA30_MC_DISPLAY1B &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -227,6 +236,15 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA30_MC_DISPLAY1BB &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -733,15 +751,18 @@ mc: memory-controller@7000f000 {
 
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
