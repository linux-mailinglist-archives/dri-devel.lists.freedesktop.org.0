Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D910B2B3AE1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584DB89CCE;
	Mon, 16 Nov 2020 01:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53DB6E9EE
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:30 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 142so4216699ljj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ut4rNgrrQw383P8FZa2N0ozXLVcx9JLLFGbYsH5MMcE=;
 b=GRtqvc2q8dO93a60kdUhp5K3pOxuG68UyAX4VACO/4y99AktJpF5l3dpSpOTVI7Rb8
 eh+nOtCAxu1mcySJr+fPmU0QMWdCtngc9RyIzyrALuaxu0mFhh15GAWVjdLJCRrruL8U
 VO0WK6TcWKacjeBcMw280Ixi6qLMDRD5+0YObSy6ItyBDhawLXSn+Zu+6cOiGI2nf+3v
 JQ2W+nS+ExuRw73flIaAW9/7F1nNmj5B+z9CqZng09JOnAWVrYhXRSz6vVDeF3wsW6m/
 1GL2c7UMzR6nHzoVDQ44bNOLBvW0IuludV/25pPp4ekU9knyMlAdhfLfalzsLRGMjVUu
 Dgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ut4rNgrrQw383P8FZa2N0ozXLVcx9JLLFGbYsH5MMcE=;
 b=Xy1SOeW+hZlWynLVdY6B0SWteEr8esXNbusS/Y8Vw4WZD3/PBQKd1nol6ggZUG3151
 vjFoWHWfOGH8h/VUhpjNv/v/Eb2IUhWY6arpJA4hlQJvioE9Ag17Z1mhPXrVBP2CisMg
 u8gVT/2uQVjNkrNjKl9WGzMLuC8yqFMtdl+BWOAdPN8TgSkh3xMHLAoEptLty8e2MHMN
 DeRts0KCLUY6SbTQQ4PEx9l8r9Eui1XIMIC44hTWHK9uvSFy3U//PcQH86/2u/t+877R
 vGgRv8eVxAXonarnCAj0VwLSu1OE72tp5ctl82urFsNBnJhg70l7uVT228Yi2GPbIrVf
 RvvA==
X-Gm-Message-State: AOAM533pIXKGu8Dp0plu4ZPCS8wkkbHORUyI84iu2EsFYmaW2M3i9czV
 bpcW1OLf6Z9bDZbNj9CovtA=
X-Google-Smtp-Source: ABdhPJxybgnqOCG6DnARd9geNRpBLynab2T192Aru8hxG1In2GacOtt8Ok9PGemMQGZ8YWVH9Z3yyw==
X-Received: by 2002:a2e:908c:: with SMTP id l12mr4733883ljg.60.1605476009369; 
 Sun, 15 Nov 2020 13:33:29 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:28 -0800 (PST)
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
Subject: [PATCH v9 12/17] ARM: tegra: Add interconnect properties to Tegra30
 device-tree
Date: Mon, 16 Nov 2020 00:29:17 +0300
Message-Id: <20201115212922.4390-13-digetx@gmail.com>
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
