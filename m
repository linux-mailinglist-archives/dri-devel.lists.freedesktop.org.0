Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7F455BBC9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D254811B2C2;
	Mon, 27 Jun 2022 19:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB22611B2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 i67-20020a1c3b46000000b003a03567d5e9so6475311wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
 b=JSlI1sImVuIOJXOTiME+vQ4iJzMZIGLs79AVGgFi/4PGzp9uNq+ij4fgaq4v635z96
 iqu+qlmc2CiECMm4cbe0xKFYr+G0bJ9m5w/qt06RqK6+DYgKNGKu64YA1Ggyrg3bTcDj
 h9fgtLqXO7l+D1Ptq7BJ+bfj9GpPhEpyz0OtKZP2fdfMBXf439DK7uOf1R3SGH6PnWaN
 s/MNpEYNLa1akQZc/7jwyPlPi0BCuioZyE578J82CZOAhvUksEUtg9kPuoYFd7foZxqa
 Wz2VVt6ePjVl2/A5ZdagCh18QXlj6Gb36JemsKRegKW5rGQi0MPTcSTuEnFkg8i48gi+
 dWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
 b=i8XBKcgbaRusd+8Y6rydlQlxLTF+tRC+9cBXrw+9jMYOenVq0INjsH6yCW0B4NnkoS
 aq1jnMSZMbpKIOX07koXq91qkuXNU03Uk2/qT4qvLkuqhUvs4LR3Dhx8cQGr2gFW+CkI
 VFOI9nPSfZJsWYAbFDS5V45vj3Kk1FDeZC06hwXrHGhRUNop2FZkOeB6AhBxq1H8RUzI
 gHLhAwBgCAtyGFLP5H78mSZQZpcmbUv+m8+TgvGPmUO+OYizi5YI7V8r9DHPewsBurC7
 G/CchJLLmdtaDKWloYja2uNTe9FTsKIRQzMK4xNrq5pMHsyhT5xaDmiMVP0Fcr3lChDE
 6Rdg==
X-Gm-Message-State: AJIora/7QFh3bZ1fvujMg5sKHyf45Br81q0qsrotJ1btqeeb/mosvtK0
 FzAnlZm066V/Z6TjAgM4fSrPUA==
X-Google-Smtp-Source: AGRyM1sG2h/mawEtIGYv6YucN+AC/fcU+GXYsZ0RG4tU7euqny2eYvUYl3sfYU/deBMVuNdMP0smIQ==
X-Received: by 2002:a1c:790c:0:b0:3a0:3e42:9c7c with SMTP id
 l12-20020a1c790c000000b003a03e429c7cmr17586763wme.171.1656358897396; 
 Mon, 27 Jun 2022 12:41:37 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:36 -0700 (PDT)
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
Subject: [PATCH v2 12/16] riscv: dts: canaan: fix kd233 display spi frequency
Date: Mon, 27 Jun 2022 20:40:00 +0100
Message-Id: <20220627194003.2395484-13-mail@conchuod.ie>
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

The binding for the ili9341 specifies a const spi-max-frequency of 10
MHz but the kd233 devicetree entry has it listed at 15 Mhz.
Align the devicetree with the value in the binding.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 40992d495aa8..4a540158f287 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -130,7 +130,7 @@ panel@0 {
 		compatible = "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
-		spi-max-frequency = <15000000>;
+		spi-max-frequency = <10000000>;
 		status = "disabled";
 	};
 };
-- 
2.36.1

