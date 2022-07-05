Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A55679A7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D554C91ACE;
	Tue,  5 Jul 2022 21:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21B191AC4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a5so4698519wrx.12
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j2Z7TaOJeXWEtVLR0e0XhsP1PHcFQhAlsDhisuCTI68=;
 b=XggLeeA/WTS9mEYdccjis5lFemn3ADc/NC/Rio0Njit6fDYwe4KqULiDHCG1BZE6D7
 xE1+PrCMW9skQC1G33FqTwwPeBVBm/URrT/J92o4sQSWXYea58XJ8ipPVetQcYT5JnKf
 mZMGjP9ep5bFp6GU9hORlbtT4huMBIwRMdf0/KPbAZpcIRuPjVBV3UH8TZOhacY8n4dM
 PAM8XYn2VU8Fb8hzhh1pfmCjiAz+jbVzQe5YMIidd2uNKPz+nr7Nw2qaI4Snuqv4SzxU
 fRbg2ISKK9sV333yjUBDG+pIjyUIkQl6puDYlat0+7RJr6DyNpJs9468VUk0tOPfCyhB
 qhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j2Z7TaOJeXWEtVLR0e0XhsP1PHcFQhAlsDhisuCTI68=;
 b=n6KdEBgG5xb34cAa4i1ogUeQWaKSPTYKX4Kf32yqC3jebi9XsbQfwledF/vA/kHukL
 p4jDP8o7Y7UsFLe/UkCLYd2K3OKGooZdmwUuFfgbdovsghFpm6OmqUNJNtdxV3uojwRH
 OjR+PRKLUDqN7byazAa09gbw+fuFi6SBN/ZYkcHhcTHr1+IGNyoHRWptf4Y46raVkVJp
 F6s94+gC7M6dfJjMW8awz1xxMsyS3yvD6AaycaGminxLWE4cNhUiYSu+fFrsPw0RALaT
 5y5Yzp+aIyUzafu+gkex+zGCgoNdIuYpu+eA8pPlakDT2sC15LGxOAD5gn6UC5o6f5Ok
 Wblg==
X-Gm-Message-State: AJIora9Zf/fGKjvDFfQkQF3GhUwFSMdI4khebr32TxiYwRcKnknMAFbh
 XIjZ2UaQjJmDHFmcR9RIjP15/g==
X-Google-Smtp-Source: AGRyM1tF/SegsE28614QkBK2sYVrZTXXYKFS981VORFpPqAQkmqnt12b3RBEdHc9eSvsFhzUnB+QyQ==
X-Received: by 2002:a5d:5292:0:b0:21d:6c3b:a30a with SMTP id
 c18-20020a5d5292000000b0021d6c3ba30amr10584330wrv.602.1657057959345; 
 Tue, 05 Jul 2022 14:52:39 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:38 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 11/13] riscv: dts: canaan: fix bus {ranges,reg} warnings
Date: Tue,  5 Jul 2022 22:52:12 +0100
Message-Id: <20220705215213.1802496-12-mail@conchuod.ie>
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

The k210 devicetrees warn about missing/empty reg and/or ranges
properties:
arch/riscv/boot/dts/canaan/k210.dtsi:408.22-460.5: Warning (unit_address_vs_reg): /soc/bus@52000000: node has a unit name, but no reg or ranges property
arch/riscv/boot/dts/canaan/k210.dtsi:352.22-406.5: Warning (simple_bus_reg): /soc/bus@50400000: missing or empty reg/ranges property

Add a ranges properties that naively caps the buses after the
allocation of their last devices.

Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 948dc235e39d..a515e5fb1af3 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -163,7 +163,7 @@ apb0: bus@50200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			ranges = <0x50200000 0x50200000 0x200000>;
 			clocks = <&sysclk K210_CLK_APB0>;
 
 			gpio1: gpio@50200000 {
@@ -382,7 +382,7 @@ apb1: bus@50400000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			ranges = <0x50400000 0x50400000 0x40100>;
 			clocks = <&sysclk K210_CLK_APB1>;
 
 			wdt0: watchdog@50400000 {
@@ -437,7 +437,7 @@ apb2: bus@52000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			ranges = <0x52000000 0x52000000 0x2000200>;
 			clocks = <&sysclk K210_CLK_APB2>;
 
 			spi0: spi@52000000 {
-- 
2.37.0

