Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616BD1F0F1D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3300A6E3E1;
	Sun,  7 Jun 2020 19:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05866E181
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c21so8860393lfb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THFCg3hKPmLC0meEu1tU7N3iWwUxXusX7wxKM7keO5E=;
 b=NND7CpEGn20ervIHoTdlyo6+Op+rxFkv0PTdj3otZabrL/ZgPfNXZeeO9+bJ//nNIk
 UZGGY4o9hdUzDBhZ98FOdoqE5sWo7vOtdzKnJOCRyEN3o6AotXOY9hFC0EtZ12G3E1nY
 Gbj83WvexpFRqVFoyX2qLsVG1fRRtijfmMTLwEebjlVfZ36eTXMtylzEgyRYeT9bB4Ki
 q6JdaV+l91GOk3kkVV/Rs6mHTTmCpPv/qt0RX6DoxowgQ+xajfZG4ucERlNtKvO4lpC2
 u3fHtJYCQ8shpghn7IpP+ev37QZaTX2uTxAgDBGlAH3TQVc0mtmH78kG0le5jVeNngD8
 TGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=THFCg3hKPmLC0meEu1tU7N3iWwUxXusX7wxKM7keO5E=;
 b=DK/0x71t8I8ueELCEoWMV0YeIKgNAHwKfEfByIoJcaVfNpFof6FuAP7f6h2OBlG5DP
 nbI/z2J9TrLe1oDQ3Xyi7GTDknezMBveXQm69ytPs1W6VaNbFa9+5hlamZG7+cT/H25p
 jgrFUOB7eEcVLZfAAAONMUKD6dxaRNC5pI7SxawsrcQ9GFplp1/RFDsfW2gaZnEYeNkn
 YKdGLGvgkVUYT9KTSUboUXskNIvrYH0sICgO6GGRJK4p/XnIin4fZO0bsnbxybSck91r
 0P89YUjZI8cwGPyLZL94X8d3h0Q4GeogOhUiCZn4E71602U+5dJhmd7JCZtBJHYk/Z65
 grCQ==
X-Gm-Message-State: AOAM533pbjqNFqS9KUQJVD4n13VBQ1POA2mT5KSuaOf+S3Nw5R3+l6n+
 +fDePlPQ247sR/TjCkbLHPI=
X-Google-Smtp-Source: ABdhPJxAtHo5jbvdut7LI2tbRskKxWJ0DGnB4bT2RT3mZaYwsIsN0IKDDQQpcmrKy90iwLiA8f+E+w==
X-Received: by 2002:a19:c3c5:: with SMTP id
 t188mr10802411lff.149.1591556263342; 
 Sun, 07 Jun 2020 11:57:43 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:42 -0700 (PDT)
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
Subject: [PATCH v3 25/39] ARM: tegra: Add interconnect properties to Tegra20
 device-tree
Date: Sun,  7 Jun 2020 21:55:16 +0300
Message-Id: <20200607185530.18113-26-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index c3b8ad53b967..974048e83541 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -109,6 +109,15 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
+					<&mc TEGRA20_MC_DISPLAY0B &emc>,
+					<&mc TEGRA20_MC_DISPLAY0C &emc>,
+					<&mc TEGRA20_MC_DISPLAY1B &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -126,6 +135,15 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA20_MC_DISPLAY1BB &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -626,15 +644,17 @@ mc: memory-controller@7000f000 {
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 		#reset-cells = <1>;
 		#iommu-cells = <0>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f400 0x200>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#interconnect-cells = <0>;
 	};
 
 	fuse@7000f800 {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
