Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A391560983
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD05810E95C;
	Wed, 29 Jun 2022 18:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7A010E7EC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:45:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 t17-20020a1c7711000000b003a0434b0af7so200880wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qoN7yg76UgsEFXHXaQt2AveJ+WlGKI9wi9pTAfeqlpQ=;
 b=e4CuTg/9p48DvSTUNdv17K46g3T0j+a8aeAGEEKwZCfJKs9OjS34vhGZ7HFoE764Hd
 j8xFaBJnEvmew0GGSReaaY9xNCu/fR2Sc34atEiERkguYgduxUnuc58gW9QTCtElfHoh
 +e4aG+8roo0EfND8Dp2rzL5lveRBxroMVkaiGySBPM8Qh9bYqkiTIqpFq/W5RA0SiiOj
 PkZRxnuQRLUqrKTYridgjCyNZyMdVCaIDrvKh8cbK07c3fQ7hSJhIcZF+zo6hofXTYZU
 rLSvEmCJJCmqf5LBxTtJA5BYCL/pC3D+iLf1VIJRxuvt++JTQuIt9u9ZtTRVQGNCwcNI
 LZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qoN7yg76UgsEFXHXaQt2AveJ+WlGKI9wi9pTAfeqlpQ=;
 b=CKXUhYly/I305tuPiqrPzGGlNjZSdl710GknDphWaT1gNkoK16//KI7AP5Xm1E3RaK
 1cr6yHqr3M3sK0TT6M8O88ZNJ0WxrT0QdPCUYE7P4KPAYhBtU+6nbDgCewKAbniS5bYX
 QhUCJjTQE+DBRjbpL8L92dZca3XFfxLnRi4zk8qZZPEqzVNA0dT7UPLytetfXnBePz6Z
 uCHVNFsOZYhQMjMTYLuOOhFcdD3nRqrAWDX6LgpIirvfx5b86vdSnhjsdzUQURy4OqIv
 0OOqQ54V8jGGe9uSD36F+Gh8JOuUbOL51tTbgYYE9z6GyQefrDryrROniHbwABaM95qn
 Np9g==
X-Gm-Message-State: AJIora+GxHFVarFEgY15ZOK1fe7dI4VY4wR10Ibr2DfGkyMMQ7hcNg45
 /tk77pq7EnYUbHGWulBJ3Kkd0w==
X-Google-Smtp-Source: AGRyM1sAH2pQyXCWdny+eGMynhGGuuyXhbj2gCp3uhWDHvXjt8YqOA4VdUet5wJ8GqcAeQgDcQfsCA==
X-Received: by 2002:a7b:c1ca:0:b0:3a0:3b9e:fd96 with SMTP id
 a10-20020a7bc1ca000000b003a03b9efd96mr5210627wmj.86.1656528299365; 
 Wed, 29 Jun 2022 11:44:59 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:58 -0700 (PDT)
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
Subject: [PATCH v3 14/15] riscv: dts: canaan: add specific compatible for
 kd233's LCD
Date: Wed, 29 Jun 2022 19:43:43 +0100
Message-Id: <20220629184343.3438856-15-mail@conchuod.ie>
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

Add the recently introduced compatible for the LCD on the Canaan KD233.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 4a540158f287..b0cd0105a5bd 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -127,7 +127,7 @@ &spi0 {
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
 
 	panel@0 {
-		compatible = "ilitek,ili9341";
+		compatible = "canaan,kd233-tft", "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
 		spi-max-frequency = <10000000>;
-- 
2.36.1

