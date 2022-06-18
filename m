Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D06E550483
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8358510E5E3;
	Sat, 18 Jun 2022 12:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D20A10E5E7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:32:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso3548770wmc.4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yCkvd1rq89W/6SrEihtrV93zPOh8bp4EvU/AesUDp5c=;
 b=aHjW5VkiLOJuMraDAkim12MSrvxYtcnkUa+6XugCv/phW+l8JDcGEqmFOjtiPLghjo
 iDjWHIMizesLDejsxE38i+OtY7WWj3x11BBfb0BRUdXpK4pu3MkmLgAa5dvPF4Y79U7L
 UBw2DK7UQ4hfNaYZxuStYUEYkp5i7TbAmelLvl2Ui/7w8TkzozVKIQaX5ZY57N429Zl0
 xgWDMpxIW3ayHXhWUHqQjQuXwVBfy/ElkaLVd2hLdCEkKi4zy0N/eTrZ8OwQ4dltk65u
 J4kCuiGGXyE3akVz8UzRk2HQ3opmwMzKwoXk0plpXwMqySPXygB+SYToa/Kb5HF8Q3nD
 BP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yCkvd1rq89W/6SrEihtrV93zPOh8bp4EvU/AesUDp5c=;
 b=06bDPoZe73YYEznzjFFKlKrI09jHcxQlepgYfcb7oz0/rZLO2NmAr7+yhINVnHBEnO
 g2eL4XwJOTF6VyL1/2ksPYYnPjrhBm/khDJGdmUe/1N9MMZKMo9ao7U3Kg1rr85FHnB0
 jsuykJgj0S4cQCak0l9iHe2fpJzXg1Mn9/6QkC0omUuuaJdJe3nmPVjlMzfzqo4LjDZR
 HVVNNnuxrWeyq8X0mWiMMFVhgfmRKJugnHxvdvj8ahMee3kKcifZYpLwZh0/xTHF+Kps
 nDBkpERTw+aHJcCiOqEqcGfH71V9qVvHrzMxptVYHnroUr1ZzWRxtmr/dJ9pczumbFoT
 wILA==
X-Gm-Message-State: AJIora83VE3DRX91GUM4j0f3XDfdBil9CBf6KNDwJzbIRRS54TAX+Sc4
 S1j9mwq6gMPeu9TlkGURNFqImw==
X-Google-Smtp-Source: AGRyM1s4BntBiZAtPtsynxF7uq+efiHJQnjp6f4ztefKsZzCsrAEC1MDiI+wsPar7tnOzz3WAfpCIg==
X-Received: by 2002:a05:600c:1906:b0:39c:8573:f330 with SMTP id
 j6-20020a05600c190600b0039c8573f330mr15063952wmq.5.1655555533520; 
 Sat, 18 Jun 2022 05:32:13 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:12 -0700 (PDT)
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
Subject: [PATCH 08/14] riscv: dts: canaan: add a specific compatible for
 k210's dma
Date: Sat, 18 Jun 2022 13:30:30 +0100
Message-Id: <20220618123035.563070-9-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
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

The DMAC on the k210 has a non standard interrupt configuration, which
leads to dtbs_check warnings:

k210_generic.dtb: dma-controller@50000000: interrupts: [[27], [28], [29], [30], [31], [32]] is too long
From schema: linux/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml

Update the binding to use a custom compatible to avoid the warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 287ea6eebe47..314f6da5d7f6 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -135,7 +135,7 @@ gpio0: gpio-controller@38001000 {
 		};
 
 		dmac0: dma-controller@50000000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
 			reg = <0x50000000 0x1000>;
 			interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
 			#dma-cells = <1>;
-- 
2.36.1

