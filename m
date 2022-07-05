Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D6B5679A5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8CA91A8D;
	Tue,  5 Jul 2022 21:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2DD91A8C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b26so19409479wrc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=16q/8fFGCPAcRAarL+3aLoNygoSrExqmYVpC1bRjl2o=;
 b=YYFaUee7gy1W5prTWT0BCaYi4Agi4K/fZPz3HzSu/Bx3zMLRlN6iPr3QbkHb8nmHa1
 OB4MbShSJ6pV3jSxnG3fgJKUgLhGQ98A6yUS6Hr1g5f9oo/CqzYerhyHeDMtY/8/V6h2
 SNh8FrwHsBKxWQIetyAjLLN19P4VrMSyseVBVDmhxS7g75q2gULyOALP1sxruDhkHN2N
 35BCcbcEZn0ZTeLrU+J2Zfur2nhAuZcdZvyFXbL1ZSzObDc51rZ3/tBedaYwAr+Csgr2
 2BkluY0+l9Tx3ndW35NGgpStoxtOrR+02ao1YhadHBLpWQbGp6cMjwnv6DxdGW1rVIR0
 V4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=16q/8fFGCPAcRAarL+3aLoNygoSrExqmYVpC1bRjl2o=;
 b=6juhW3y8T98U/86NZrmUgGhJyrnsgIu8RydCvZVsHyTW4cRFEEGJ/FzBG9PLEFKntd
 u/FXDeE/jJrNL1DB6QWLsqaX3wrIOLtFwuQ5zeMlWdePBhejINm7xUhLijIwq7pOTbrv
 s+ns9CTDbK6iyo3nXTsWai+gru6mbHSQfsOcTaoC3g/bjJgyQJgCdqO19PzDoxmom0S8
 EZuZzQ1R6Pfpwv0kpTgbP+xReNsk5hIINKDyi0I86dTQJpP3hPLgECw6swY7JZgLq+nr
 5yfHV/buL+2dBfCM9Of/wJFKv4FB/dKYxMzfNyETJmMB6fSUOagehe4AjLoXIhxng8fx
 6dTg==
X-Gm-Message-State: AJIora90s/yj6jR2ggnmP5xWAY5Cce4qa1NMZO7GQMn6xHHsDS5XSBin
 Q1v1hgo4UpXK9G7zrk5ijvR3nA==
X-Google-Smtp-Source: AGRyM1t6QNd/sm2WCxNG6Wr6I2YHwVTbjh9TXka92SSnVrAIhc+jsCS3/FhjvWlhLqMVSAqFGD6QKg==
X-Received: by 2002:a05:6000:381:b0:21b:9a20:6543 with SMTP id
 u1-20020a056000038100b0021b9a206543mr32493151wrf.127.1657057955085; 
 Tue, 05 Jul 2022 14:52:35 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:34 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 08/13] riscv: dts: canaan: fix kd233 display spi frequency
Date: Tue,  5 Jul 2022 22:52:09 +0100
Message-Id: <20220705215213.1802496-9-mail@conchuod.ie>
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
2.37.0

