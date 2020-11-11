Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFAD2AEA81
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3EB89F2D;
	Wed, 11 Nov 2020 07:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C6489E0E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so541426wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dchum/w5tW6S8qZoSmLsyitcs7JqpsShTrIAD3uRjUU=;
 b=m9NDdA8OOZIq2hLYDAs/C4kbBePsA4I65uhZCDFtyB53kehuGAgUVHckVWCXcSWLDx
 6ybiptEWUIdAQhAz1rL9Mvfcn3MeGB9XrxG88rPWRExt47SCxhmv/wA5KZAMhGO7ogj7
 E31/v4uR12KothdxIyjF6AFd6LmwTZgnGdU83ChmYVxDmA14RoPdpw8nXyCczabnrWxp
 YeirpxKSEoMXN/tbuUn2JQWv8jxGY1hCVwAGHQ/IdpGd5CFJ1hQLnwFUqMDIqRB8Uutm
 Vvxr8u7djXicfQ2meM/WoNhnUuQVHO/G9CmbyWmlIOoZg8mmvP/Ap7JSb4XV6trUFLhn
 XFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dchum/w5tW6S8qZoSmLsyitcs7JqpsShTrIAD3uRjUU=;
 b=R0Nf83UTO+htQKZ8SODIfR4ZICtE+1U9IYYw/dpfDusLXsUN82n9UUhV3oVs7lo5H1
 p06pQoMyGhh9Ld8oc8phOkfL7OU7ZM6x71/IXFUGqo0S5W50SZb46OhjnIWcYzki8Kb0
 7F2/0WODKI/It54cJfX54w1sREcVHC4ZhdudumqDd8A1+5lwDGkMWQC4y8jAZalxul8G
 rDXvWPTyOUwp4E/22cP2p2gXcDEKVTEYvfWLLaY6s9EboMc1utoHBnntwKqYHrTjP9Ix
 kgx1lIsBpC3eK6tv7Ud1EiAVxD/83ympv1UJchjUwSjT4w1iB6gp4xpfWiL1hDkNi2yB
 a7Fw==
X-Gm-Message-State: AOAM532Df3Wplk7meGn8iaXczyZ5PpIm7ANlK9xGzN9WW8f0l4Or4KMk
 lzmG0BSjq8j/vsDbcylNGPk=
X-Google-Smtp-Source: ABdhPJzs0bRwr/NryVGDcaMMn0Cs3kjM8URNT94BureqqJTHZIkhv/pU3SvX1KEK+orredPlZTL97g==
X-Received: by 2002:a1c:2d93:: with SMTP id t141mr950325wmt.104.1605057343686; 
 Tue, 10 Nov 2020 17:15:43 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:43 -0800 (PST)
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
Subject: [PATCH v8 20/26] ARM: tegra: Add interconnect properties to Tegra20
 device-tree
Date: Wed, 11 Nov 2020 04:14:50 +0300
Message-Id: <20201111011456.7875-21-digetx@gmail.com>
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

Add interconnect properties to the Memory Controller, External Memory
Controller and the Display Controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 9347f7789245..2e1304493f7d 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -111,6 +111,17 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
+					<&mc TEGRA20_MC_DISPLAY0B &emc>,
+					<&mc TEGRA20_MC_DISPLAY1B &emc>,
+					<&mc TEGRA20_MC_DISPLAY0C &emc>,
+					<&mc TEGRA20_MC_DISPLAYHC &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -128,6 +139,17 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY1BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA20_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -630,15 +652,17 @@ mc: memory-controller@7000f000 {
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 		#reset-cells = <1>;
 		#iommu-cells = <0>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#interconnect-cells = <0>;
 	};
 
 	fuse@7000f800 {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
