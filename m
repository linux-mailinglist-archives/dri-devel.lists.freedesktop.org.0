Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75C55BBCF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7371111B2E7;
	Mon, 27 Jun 2022 19:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F82511B2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q9so14486054wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQ9wIHwlRmT7tO1Hd8om5LpzXV8vNgzmPbgMU2oiknY=;
 b=B5C/Gw1koJ2gCfNSuN+oniQsxKz/C0BbgCMWl8rQMBYqrHqfXovlJGRG6EhbKDmSUI
 YMrDLvEKPR9I0xmZ6/f2UkBdvxHfzIFOCu/+tXXA400uNFasRF2Y5Rw3V4t8exfluRsl
 pDrVCx2/y3GyUEYGpK1TCxM/gQf1o4TtNjiohPthJ+tyggDe+vxCZqFMZp1iemAhJKUy
 KSoBOo6zKZnIFSTr/b+WCGZwNY/WRUWR4JU5U/op5XzoBDI7nlRb87RvgWMkI41Uf2mC
 De6OwVU/r5tClMepVijT6V+kPZ/riqI+R5m1lGoFaN+/TWN3PGYd3lIy7cYtXlUQ7b2n
 ouTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQ9wIHwlRmT7tO1Hd8om5LpzXV8vNgzmPbgMU2oiknY=;
 b=uNtLf6Dck7iDRtzqHPLftinLqSSTrnT6H3S5UkN8fPx0mI2eteZk10+e0dL7ivEPr9
 XMd6sR+qMUrA5zkY3rK3WKoJqO9V1tr+j+eAKeVKfYjwSZG7r7rCswBFOwYAVBv0FfPR
 IK8p4miFejw0LNIqK4AT0bskTS3ubKR5xOtZCPJhDK8OynyCIP8El2Z65hCB4dqr/8f6
 cwANvoiZncn9rsCR/EXmmk2nYLJwZaTreZ2bCEu8rrlVofMbNgn2a92oDD8CXBQaJVh2
 v2uOKbv9pqt708iTgYFUvgLnBTjZ/XaG9GxgqimXCneHcNWJnDmt9l28s27M7dvpKhLy
 +yTg==
X-Gm-Message-State: AJIora+5WrO/OPI9o605gdrSCynoG8OcBbLxEJEE18IhY3f5//rpc9bH
 qt35FkyT25YwBSB/Ey8RKQAslw==
X-Google-Smtp-Source: AGRyM1v27GhUxgqPtyg8Cu4ponuVEz4YhpnLDi4l6+vjZ86LHo5Wws49r6JewDbqir0IgLXBgCXSdg==
X-Received: by 2002:a5d:6883:0:b0:21b:9408:8ba0 with SMTP id
 h3-20020a5d6883000000b0021b94088ba0mr14086640wru.419.1656358903073; 
 Mon, 27 Jun 2022 12:41:43 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:42 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 15/16] riscv: dts: canaan: fix bus {ranges,reg} warnings
Date: Mon, 27 Jun 2022 20:40:03 +0100
Message-Id: <20220627194003.2395484-16-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The k210 devicetrees warn about missing/empty reg and/or ranges
properties:
arch/riscv/boot/dts/canaan/k210.dtsi:408.22-460.5: Warning (unit_address_vs_reg): /soc/bus@52000000: node has a unit name, but no reg or ranges property
arch/riscv/boot/dts/canaan/k210.dtsi:352.22-406.5: Warning (simple_bus_reg): /soc/bus@50400000: missing or empty reg/ranges property

Add reg and ranges properties that naively cap the buses after the
allocation of their last devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 84a7ab363d72..337ce2b879e7 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -163,7 +163,8 @@ apb0: bus@50200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x50200000 0x200000>;
+			ranges = <0x50200000 0x50200000 0x200000>;
 			clocks = <&sysclk K210_CLK_APB0>;
 
 			gpio1: gpio@50200000 {
@@ -352,7 +353,8 @@ apb1: bus@50400000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x50400000 0x40100>;
+			ranges = <0x50400000 0x50400000 0x40100>;
 			clocks = <&sysclk K210_CLK_APB1>;
 
 			wdt0: watchdog@50400000 {
@@ -407,7 +409,8 @@ apb2: bus@52000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x52000000 0x2000200>;
+			ranges = <0x52000000 0x52000000 0x2000200>;
 			clocks = <&sysclk K210_CLK_APB2>;
 
 			spi0: spi@52000000 {
-- 
2.36.1

