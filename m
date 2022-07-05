Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 470745679A6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2AF91A93;
	Tue,  5 Jul 2022 21:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E189691A8D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:37 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so10506692wmp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btfD2ddLZTsrkxXM+5X0SlRWCSAFkc3crudlByDnEUI=;
 b=R2ZH0gVpmULNTv6IJcLMhpWIi94ZX23K1txij23UvjFeSzC3TosPXLd2Xl8x/lj8HQ
 9Y+0cd3VifBNPS8rtQtjRQbPZHdvl/w4dhwDPWCg0IXB58BUR6JYHlX9ZP1O+AhRmMgu
 B8d/QnrymSEjCT1MzHxmsr77lUPEBwyrqAC5UCUuROQwCAY/g7zB8dSBkrmbVIZd8gTU
 LjBB8oMchg8USlhrITWohYgE19TDziCHl77VuySNrjC2NTXP/bzmxACDHZEouWmEiU0B
 1v7K3pQ5V1polgAp3q7tYlG4glWe6iedMPE5oJAkp24Ur4XhLIAuE8ditoMQgWPaJojK
 TtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btfD2ddLZTsrkxXM+5X0SlRWCSAFkc3crudlByDnEUI=;
 b=NPSEUL+PmkXQdTHmyw9cYmYoZ825z8vRY/uffjSsMJPqgTEIitx+4VtSmj8D5ty0MK
 9nSrwX4BayULk1ajzqjijxa62dkaqOBBf8A8YWdMsk4Vv76jnhDyL1mpCpPanGhpazzn
 amCqXeSoImWfB/v3TECViByPe3aY0+JPfExxrn7MUUwyrPY6kiZ8+mIdo37CpLjcD1m7
 PqH8xUtzuHddbIAPV1EcyAqefEogPzcWyGm69G+d9QKx4TvOI4zVtapJnacvySFQVvnp
 Ht3DYN20JWbcu/HMZudIRJf8RVM+ka6FrbziBqInGaDseTxomtY8ksJs/nsMQqlmCeLd
 6N1g==
X-Gm-Message-State: AJIora9CHUgVxpbgdk8D6KdNF/vmhfP4fq6x5Utdt7T+Qz/oWcvsw1ak
 kv3s0gteUO1LGEYwvueF1UVNwg==
X-Google-Smtp-Source: AGRyM1uXxyzForUKTAh74BBZRKGne5xPz5YmmHzkkj1xxpM+GNVio6fhXm02YyxzMkM3fk0zBgZL5g==
X-Received: by 2002:a7b:cd0d:0:b0:3a1:8f1e:cb2f with SMTP id
 f13-20020a7bcd0d000000b003a18f1ecb2fmr24066595wmj.10.1657057956434; 
 Tue, 05 Jul 2022 14:52:36 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:36 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 09/13] riscv: dts: canaan: use custom compatible for k210
 i2s
Date: Tue,  5 Jul 2022 22:52:10 +0100
Message-Id: <20220705215213.1802496-10-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The devicetrees using the Canaan k210 all have a sound-dai-cells value
of 1, whereas the standard binding example for the DesignWare i2s and
other use cases suggest 0. Use a k210 specific compatible which
supports this difference.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 72f70128d751..900dc629a945 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -251,7 +251,7 @@ spi2: spi@50240000 {
 			};
 
 			i2s0: i2s@50250000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50250000 0x200>;
 				interrupts = <5>;
 				clocks = <&sysclk K210_CLK_I2S0>;
@@ -260,7 +260,7 @@ i2s0: i2s@50250000 {
 			};
 
 			i2s1: i2s@50260000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50260000 0x200>;
 				interrupts = <6>;
 				clocks = <&sysclk K210_CLK_I2S1>;
@@ -269,7 +269,7 @@ i2s1: i2s@50260000 {
 			};
 
 			i2s2: i2s@50270000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50270000 0x200>;
 				interrupts = <7>;
 				clocks = <&sysclk K210_CLK_I2S2>;
-- 
2.37.0

