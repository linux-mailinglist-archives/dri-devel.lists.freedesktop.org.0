Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940FB550489
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726F810E5F8;
	Sat, 18 Jun 2022 12:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C066310E5ED
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:32:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l126-20020a1c2584000000b0039c1a10507fso3553266wml.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pg5EtL0V3UHrid7YbhvB+3zhrduzQGisX4A0SVhhM0E=;
 b=Pu1M106xN55HI9pfnOZNoRrDpjX1i4VH9bR0a4BhQ0DJdKnxN33JrDSsp8oMDBO6jp
 LVQ1VI+4atrButRPKUPNqCrIEigfT0IM8RSE/TM7b+yFCd8/4+xiDRZ3O7NsK9REtRLv
 84xM29eeccO+uGrixFZq0EZFXZEdycBvA0ECOB3ZQETpwQOJCmoI57SPRa91RH4Ybiwn
 DHwH4ld25Q7R0o4T9qzfzLsKmjYB53l8b9saZnSz3GnJD24tqYxXVFcv/kp23HP9PpCH
 I+j/f4rZISdty/aA/Vg0TKDsifyuWEt2DZv8kvr86VvPeWNfHBmzINiITLTKs1DLpX1a
 cUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pg5EtL0V3UHrid7YbhvB+3zhrduzQGisX4A0SVhhM0E=;
 b=aGZ7uhbWC8tLpmzQL8/Bl2AiK878NrjZsYdTk1vVSpIS+38Qd89u03215gCeel3aeQ
 l+HJ/lTsxSO654uUEkW3/jNUzqeHdlxscFawmNEGk5WjUw0Z7WKwzbilSVi7EOe4Myyi
 MdXaPOwAR7oUpRHSf4Ufb2yX996uWZ2GVvkAk/3Ebc4H4coWcZJOlCVwqIBHe84xMWH+
 EFhUsXk8g9L7ER9OuCHaxiq/K9NMv4DQVgrU3yGuceVtloAYDO72SO4K3dF96deyzTyy
 YNvJcotIEp+zwt4IxeUXVRyGBWT3LZaR7VzKbBBVv15OpOtYSmX/9G3pEhN/bSVuHBJk
 bgtQ==
X-Gm-Message-State: AJIora+3MQVbT4QPwt9fjCEZtETjbOyGW9ECiWcBYNyrMGH6PLOHzOPj
 OnFoVeCUJ6KkL1yqN6PPWysl3Q==
X-Google-Smtp-Source: AGRyM1t+D1hSYvVv2lyhJXTM8fnBYLleL1Z3z4M3dP8UVmVZwbcohvWxMo8SxFiBx5Zo6H6ulo6zQw==
X-Received: by 2002:a05:600c:3553:b0:39c:63a3:f54a with SMTP id
 i19-20020a05600c355300b0039c63a3f54amr15447271wmq.61.1655555543356; 
 Sat, 18 Jun 2022 05:32:23 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:22 -0700 (PDT)
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
Subject: [PATCH 13/14] riscv: dts: canaan: remove spi-max-frequency from
 controllers
Date: Sat, 18 Jun 2022 13:30:35 +0100
Message-Id: <20220618123035.563070-14-mail@conchuod.ie>
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

spi-max-frequency is a device, not a controller  property and should be
removed.

Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 5eb6b69c1170..ec290db4705c 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -413,7 +413,6 @@ spi0: spi@52000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI0>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -429,7 +428,6 @@ spi1: spi@53000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI1>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -445,8 +443,7 @@ spi3: spi@54000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI3>;
 				reset-names = "spi";
-				/* Could possibly go up to 200 MHz */
-				spi-max-frequency = <100000000>;
+
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
-- 
2.36.1

