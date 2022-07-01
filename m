Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D25639AC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 21:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6688C10F5A3;
	Fri,  1 Jul 2022 19:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11AD10F5A3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 19:24:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73D2E61F6B;
 Fri,  1 Jul 2022 19:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F266C341CD;
 Fri,  1 Jul 2022 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656703457;
 bh=9C30Qev7stnWudn0PqLeAcm79awAIE9hO8EYlfo4JxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mbDIdmzehFFiNM2LQ8ywgM8iDKq9wGWbuw+t8FjVb3kcN0N2ZHEvI5i0XEHcmb4pM
 ZgLs0p5j6JLwHK/fr2xEONhgrQDohl6PLiFyjZyQRwswrBpH5dRUfdOkotHFI0BtT/
 RLa23WwfUz2dxvD+CH9tenLKRDg1QIIJ36ix9vX5wrnvezpPvrajDBaWRVnmqmFZz6
 wcy4W7TeBciDuMjeF9+eqVsHVIVL+WkDxRzUPjK894ruKij0OdJbisBAHTzBm1zE0n
 2Wq5flOXRxIa+xgCAn62JgwGOSXtXcB1775YmgBuLJzfXBrSSNDrldyTdARDHb9+L7
 jtzAmTb5FxG/w==
From: Conor Dooley <conor@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 07/14] riscv: dts: canaan: fix the k210's timer nodes
Date: Fri,  1 Jul 2022 20:22:53 +0100
Message-Id: <20220701192300.2293643-8-conor@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701192300.2293643-1-conor@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The timers on the k210 have non standard interrupt configurations,
which leads to dtbs_check warnings:

k210_generic.dtb: timer@502d0000: interrupts: [[14], [15]] is too long
From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml

Split the timer nodes in two, so that the second timer in the IP block
can actually be accessed & in the process solve the dtbs_check warning.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 46 +++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index cd4eae82d8b2..72f70128d751 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -319,28 +319,58 @@ fpioa: pinmux@502b0000 {
 
 			timer0: timer@502d0000 {
 				compatible = "snps,dw-apb-timer";
-				reg = <0x502D0000 0x100>;
-				interrupts = <14>, <15>;
+				reg = <0x502D0000 0x14>;
+				interrupts = <14>;
 				clocks = <&sysclk K210_CLK_TIMER0>,
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "timer", "pclk";
 				resets = <&sysrst K210_RST_TIMER0>;
 			};
 
-			timer1: timer@502e0000 {
+			timer1: timer@502d0014 {
 				compatible = "snps,dw-apb-timer";
-				reg = <0x502E0000 0x100>;
-				interrupts = <16>, <17>;
+				reg = <0x502D0014 0x14>;
+				interrupts = <15>;
+				clocks = <&sysclk K210_CLK_TIMER0>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "timer", "pclk";
+				resets = <&sysrst K210_RST_TIMER0>;
+			};
+
+			timer2: timer@502e0000 {
+				compatible = "snps,dw-apb-timer";
+				reg = <0x502E0000 0x14>;
+				interrupts = <16>;
 				clocks = <&sysclk K210_CLK_TIMER1>,
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "timer", "pclk";
 				resets = <&sysrst K210_RST_TIMER1>;
 			};
 
-			timer2: timer@502f0000 {
+			timer3: timer@502e0014 {
+				compatible = "snps,dw-apb-timer";
+				reg = <0x502E0014 0x114>;
+				interrupts = <17>;
+				clocks = <&sysclk K210_CLK_TIMER1>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "timer", "pclk";
+				resets = <&sysrst K210_RST_TIMER1>;
+			};
+
+			timer4: timer@502f0000 {
+				compatible = "snps,dw-apb-timer";
+				reg = <0x502F0000 0x14>;
+				interrupts = <18>;
+				clocks = <&sysclk K210_CLK_TIMER2>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "timer", "pclk";
+				resets = <&sysrst K210_RST_TIMER2>;
+			};
+
+			timer5: timer@502f0014 {
 				compatible = "snps,dw-apb-timer";
-				reg = <0x502F0000 0x100>;
-				interrupts = <18>, <19>;
+				reg = <0x502F0014 0x14>;
+				interrupts = <19>;
 				clocks = <&sysclk K210_CLK_TIMER2>,
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "timer", "pclk";
-- 
2.37.0

