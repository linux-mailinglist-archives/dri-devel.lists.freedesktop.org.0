Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B7155BBCA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B585611B2C1;
	Mon, 27 Jun 2022 19:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7285611B2B0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so6262125wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/4pSTzmZJtMPfdZhp3nJkb++kMPSJ1FDzT5rHgbkyFo=;
 b=fUcGP1N8oyv9wbrxArow7bj9CcdpzDUZQAModO/c79V3MzgRbDNNV/8LgF4H1T1GQs
 IChP1zjgi/XOcXFhZIkbV0TCnP/aEmt30Qt/x1j/QHaiLaw6W7XR/ZcK5lCplaamVDzb
 m6w/B2QGiflnmfO1WZS7VEaMRJK0e3ugiRjiGSRO0gWg6iojMRzR5V4a0KyyQUXAI3fT
 ePAmN8ijusyEpXfItpVgKuiAKLDnsyTJqmZX5NWTsvckGK1LX1/XQ9zMdcZhLecowRCr
 rvyMkn21VBG8epRNjd1ed0nDT3oBvlHa57V6rwoKJH5h/ATmx4dpU3nicZ3JbdF7uof3
 6JRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/4pSTzmZJtMPfdZhp3nJkb++kMPSJ1FDzT5rHgbkyFo=;
 b=Mjge4OJn+k1uB8ADe54kcUXOb9saun/ZyX2PbpKiePXV1JbpZHChZs6wZtk6B2ae59
 dgEMdKOt6wpQSxdM59z3KEgFP2w7t4jKX7ZIsDFBcuYKlAfr3m362IVg5LQ60T/OJLf2
 EcabGO0ZHtG1zbtEKAU0wTXbyf8GdnJOudBwHolSZYwe8q4WdJLKtwDWI7PzIPkGFC4/
 LGPDOYR0TgG+IHRjNMr0eNKZjVVcMrVcZ7PS/TT0O9EKFYkb+xSR13bbWgCAn8R3YHeQ
 UwG07C3VOujMpdROQW/fyxelCAYTa+MFO4X0Ftl0pClGLw6x7rHBvtvgwtMZkJhnz2gm
 tNsQ==
X-Gm-Message-State: AJIora+4HZFTAmkDJXfiXRkeHg3UFcm+i6XkV3DuZC0eoS301ztjXzPa
 OHP7R55VlwK1pL1WIXeLo8WydA==
X-Google-Smtp-Source: AGRyM1ulzUVwSrZMGumLgKk0IITcW4JskOSYSyGzeL5vL40TAZn2Pd2mkHEB4lIYztTEoPvb5D5DGQ==
X-Received: by 2002:a1c:ed08:0:b0:39c:80b1:b0b3 with SMTP id
 l8-20020a1ced08000000b0039c80b1b0b3mr17522441wmh.134.1656358890978; 
 Mon, 27 Jun 2022 12:41:30 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:30 -0700 (PDT)
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
Subject: [PATCH v2 09/16] riscv: dts: canaan: add a specific compatible for
 k210's dma
Date: Mon, 27 Jun 2022 20:39:57 +0100
Message-Id: <20220627194003.2395484-10-mail@conchuod.ie>
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

The DMAC on the k210 has a non standard interrupt configuration, which
leads to dtbs_check warnings:

k210_generic.dtb: dma-controller@50000000: interrupts: [[27], [28], [29], [30], [31], [32]] is too long
From schema: Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml

Update the binding to use a custom compatible to avoid the warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index cd4eae82d8b2..45ccab36618a 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -143,7 +143,7 @@ gpio0: gpio-controller@38001000 {
 		};
 
 		dmac0: dma-controller@50000000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
 			reg = <0x50000000 0x1000>;
 			interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
 			#dma-cells = <1>;
-- 
2.36.1

