Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578D655BBD2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDCA11B2F7;
	Mon, 27 Jun 2022 19:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C99D11B2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id n185so6036128wmn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7fNGijI+hr0dTmXMpnscpCDFPOlTGyo8sAtxEfEzZU=;
 b=GerFAD3YrJ4xNZUZH9wuFBjhPGLtwU4LMQ9xLZDfyPgID9HmkvjLT2X70Dv7RK45sE
 Rl7UcLZKjjBEXn6gMFFPFGKqGU8YKteSUBRZgT3q2KCTELbPxEugPVPhsRUTxI6EEFTP
 U7pEG27DbQT4d6LjDNzc6tWTonPRp0kqfUVnKPpDnLikqRJRWZ9vVsU6JuLkkdfI6FCf
 DH8VhTtnOJRQfz2jcXuMHBAiiw2x3DbsLEgNHmVpboCY7IizIW/K+BGFbjzLsujm+vCI
 IHgUW86u00ZgFljJlptTSCnVffs7mtC3wTbTmAl0NcpYIRCtY2jbecDSSyPjyUsCLT2h
 rnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g7fNGijI+hr0dTmXMpnscpCDFPOlTGyo8sAtxEfEzZU=;
 b=W8HHepxLPThT6XSTuUlbXhKG6xlO9lb7B1YmVaSKdYpqZLVPwgSNac7FjD1DqzQueX
 9R4bi3cMlYkNXzVgGr29IlZFkjNGHpjX6xIjiPg+G556asqL5urnFy2wQ8U+Lm7oru59
 720UaiHgBuotwOAWWHdrratvNmvn6nxYHbCQEL9Rlx5MYT59X+zqheoIF0pwZWXSJap9
 Mpxc/KR7nWJPsZQyzEoLj7L3Mq9zvRuPyfmZFc4GkDF9zywGvd6KX4P2B2NARXM4+B0V
 oLwaqbpE5Zc4QirtKc3c7Hftp9hRMUT81eZ4VrBr+qe7VNi/5f9Llcrtp8s5LMM4qRSH
 Fxuw==
X-Gm-Message-State: AJIora+xZk4PpXt8HRUqOzismziK6nuc2m2paIEQZMkBLCzVgBKeR1H4
 K/GiYHxoeQfmqmFMJw1xDzG7ZA==
X-Google-Smtp-Source: AGRyM1vfR8BzEtMkEDzJdyFBjP72bU2FypIWvUEsm3mPIw919lu8Jm/Nyc6yvHG4q/vyYSVc9E5JZg==
X-Received: by 2002:a05:600c:1c04:b0:3a0:512f:b9e5 with SMTP id
 j4-20020a05600c1c0400b003a0512fb9e5mr333292wms.85.1656358901364; 
 Mon, 27 Jun 2022 12:41:41 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:40 -0700 (PDT)
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
Subject: [PATCH v2 14/16] riscv: dts: canaan: remove spi-max-frequency from
 controllers
Date: Mon, 27 Jun 2022 20:40:02 +0100
Message-Id: <20220627194003.2395484-15-mail@conchuod.ie>
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

spi-max-frequency is a device, not a controller  property and should be
removed.

Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 10c2a1417deb..84a7ab363d72 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -421,7 +421,6 @@ spi0: spi@52000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI0>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -437,7 +436,6 @@ spi1: spi@53000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI1>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -453,8 +451,7 @@ spi3: spi@54000000 {
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

