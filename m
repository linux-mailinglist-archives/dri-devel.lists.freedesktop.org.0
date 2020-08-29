Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E2F25695C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 19:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE9B6E20B;
	Sat, 29 Aug 2020 17:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F176E20B
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 17:25:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 069A320714;
 Sat, 29 Aug 2020 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598721945;
 bh=jlnlsBMlKXrkOdFQa9f0gqcbNKcSuLQh0Ah9oW8TIcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IY9GkRDpdokU8Qw4KBE/GAtPw4sE/H/PPR3ZQMN3aPBpNxpQgBrUT/DuSIT1eLQZM
 p5NKkaNGW0sm7BiFSpqsl3TKJ3KqE8H+Xn1NVmJzwXO5qVnTNhS5Va1qj1iQA7e4pW
 E3QJGS4vKyIfYS2Jme3pp7wLDSxDwE60kBaSWEVg=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: [RFT 2/4] ARM: dts: exynos: Move fixed clocks under root node in
 Exynos3250
Date: Sat, 29 Aug 2020 19:25:30 +0200
Message-Id: <20200829172532.29358-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829172532.29358-1-krzk@kernel.org>
References: <20200829172532.29358-1-krzk@kernel.org>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fixed clocks are kept under dedicated node fixed-rate-clocks, thus a
fake "reg" was added.  This is not correct with dtschema as fixed-clock
binding does not have a "reg" property:

  arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: clock@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 42 +++++++++++++------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index d3fb45a56527..c67c70e46794 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -97,33 +97,25 @@
 		};
 	};
 
-	fixed-rate-clocks {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		xusbxti: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			clock-frequency = <0>;
-			#clock-cells = <0>;
-			clock-output-names = "xusbxti";
-		};
+	xusbxti: clock-0 {
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		#clock-cells = <0>;
+		clock-output-names = "xusbxti";
+	};
 
-		xxti: clock@1 {
-			compatible = "fixed-clock";
-			reg = <1>;
-			clock-frequency = <0>;
-			#clock-cells = <0>;
-			clock-output-names = "xxti";
-		};
+	xxti: clock-1 {
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		#clock-cells = <0>;
+		clock-output-names = "xxti";
+	};
 
-		xtcxo: clock@2 {
-			compatible = "fixed-clock";
-			reg = <2>;
-			clock-frequency = <0>;
-			#clock-cells = <0>;
-			clock-output-names = "xtcxo";
-		};
+	xtcxo: clock-2 {
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		#clock-cells = <0>;
+		clock-output-names = "xtcxo";
 	};
 
 	pmu {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
