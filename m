Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD31560987
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3AC10EA76;
	Wed, 29 Jun 2022 18:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABA810E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so179581wmb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gc2vKH3KC5MkBHyxjlffpbpmjSYGhMGK8SuLLVbLMmA=;
 b=b1HmM61mdW8GYiqxKQWSEMxCNUDxJBTTrlRtl15fqNYIuCkZc0o2CJdTeGIajSwT7X
 u7/zOLw3G6g6qk7W2pP9C3CQg/YA4QDwKXxQMrOAFOIojMwCO5d2ivXFP3OKepL8vOrF
 i3WcjcHbDjI30K+2b7eP7wJDRUdhrnDeDzRa50oEfXZTzW0Ic8RRtaW04pEbNja6qUT/
 bCjIKRloecgdHSLASblaD+5TKC4S8bh/hwR54jV1iqeGBFZH+pojBdoaqMRd3VHtqb8k
 aKuNrjFgo2M7HEKDHx0EAotjuGjsu78spyPlqsDURW+PCQz8XYT/XjNBhIQ6xvLK6pHA
 ju7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gc2vKH3KC5MkBHyxjlffpbpmjSYGhMGK8SuLLVbLMmA=;
 b=1UsMl2mZDclM387FdVnASaPOOevlgBoa4PgmpV25WA7+jDUXuL0G0z9R+57DKt3MWL
 7J2tTl3xA+gjdAwkUAOMJaVOHN5QsL+n1BBDufDjv4kQuuOZtg4iqJ8/RS5+Vjo81R6O
 Z5AaLBjavSCh8+73r9WgePBKGq64GEmdhpr4mT0v8a9mhH/m+qDKyoWEspxhr7DiNdqS
 ByppBhM0zlvKpjWvs2EbYjoWG3/R0e1p6iPwqTdTTBBe/Ia0lsKVmw/p6zeeUfYNr4M4
 cvdf0VEvVvQQUdqPJgALX0Me8qiponqxDhYPgu9sc4u9CWiMkap4BF10/PZhscAFy+eL
 DXBg==
X-Gm-Message-State: AJIora+0N5lBEC2s4kYH2c2pjmkKpFunzwMabvAgfP7gcNgjImtQKfQq
 PBmN1QoDzw97hCtHILOqrjnv8w==
X-Google-Smtp-Source: AGRyM1tiQTiUML69pSH/X379WColqfSCa/BD0WFCrjuoimppJGuQP+xpNrdH6dUuJmGqYoVcprXwFA==
X-Received: by 2002:a05:600c:34ce:b0:3a0:3240:92ca with SMTP id
 d14-20020a05600c34ce00b003a0324092camr7157169wmq.130.1656528294078; 
 Wed, 29 Jun 2022 11:44:54 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:53 -0700 (PDT)
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
Subject: [PATCH v3 11/15] riscv: dts: canaan: use custom compatible for k210
 i2s
Date: Wed, 29 Jun 2022 19:43:40 +0100
Message-Id: <20220629184343.3438856-12-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
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
2.36.1

