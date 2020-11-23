Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA12BFDED
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 02:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D029E89B7D;
	Mon, 23 Nov 2020 01:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BC589B65
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 00:31:31 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l10so16172490lji.4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 16:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ut4rNgrrQw383P8FZa2N0ozXLVcx9JLLFGbYsH5MMcE=;
 b=dP2zdOqLZ5ODOB59aKMkhKnWZwJIazjJkUCM5tQ3BdVNTNXTYOg+A8sca9ezdn89eq
 Lt9ZJnnNyfq5oaGiZHQC370BBP221G+FG1Rt/6lVSAgYNoSAGxvbT7QVi2ckpDggn7jM
 aDMqYZogQsQKjb+dr0Z92n6ATWenoLLffY17I3lwPRXZSNuxM8ZaN0qdVwH0yb6a69CM
 xcJavtuywY/VAyRhhOm6/xhElAxGtuGsBtaQ1SBv8GQrhf9yJVuyzpBj4BEgLd9nYWt8
 SfUZq5R0AjWecXz64CerXqPrvtrXyoZwQJCTorjHsYtafJOrjxgTYl3VUYVakWTGGtXQ
 R0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ut4rNgrrQw383P8FZa2N0ozXLVcx9JLLFGbYsH5MMcE=;
 b=qrIfHA0q31/lndRgFHiHSWf1cwLCMm9v0ZnjREj1mJiFinCkSvzqCGXknf5uEh5hj9
 VAlJyp/deY9O2eYR3SZcDmFLCv4bpmuObQVZm6VxMPGlvqoxRll8bA9X+CVqO9/cWY6p
 OmXusn9fWSNxT73j2+M6YMSSNg5fVI0irSSsiqCXk1LiAzUcy3sNoNN++z64e3uL6J+N
 VUzKxtTRKX0QTiQLN/s+FIUrXHfNQ3PO3uMXdYdDOuI13Ffz93sz1cr9bbLyD5NB58rl
 cMms+82DM52qA4K8MNBqXC20KOLGGXURgMLyJuT//P5UOJRGSMfQJhyQGp3I8ZrIyowa
 L69A==
X-Gm-Message-State: AOAM530sKvWpqt+zR4WcjKESz40SIw2p3i2Wd01rAZE3EaRClDDqdz0+
 iDxApSgTlY0Frxz0RCdpM88=
X-Google-Smtp-Source: ABdhPJwUZiamqmpZxftcyYNOMIhgBNC9thd7Va9wuv8RX8AkEDvD6KUQzkpZ98BpbOe/iOVBLqLlCg==
X-Received: by 2002:a2e:9b58:: with SMTP id o24mr13247351ljj.84.1606091489567; 
 Sun, 22 Nov 2020 16:31:29 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id r27sm1225823lfn.290.2020.11.22.16.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 16:31:29 -0800 (PST)
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
Subject: [PATCH v10 14/19] ARM: tegra: Add interconnect properties to Tegra30
 device-tree
Date: Mon, 23 Nov 2020 03:27:18 +0300
Message-Id: <20201123002723.28463-15-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 01:06:28 +0000
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
