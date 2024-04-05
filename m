Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F45899428
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 06:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA40A113898;
	Fri,  5 Apr 2024 04:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="luoDzLQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679FC113893
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 04:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1712291844; x=1743827844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9uINqyvWMsG3URlq2A0h6yqig1bkApNedwXa+jRDhH0=;
 b=luoDzLQILiz+Hbp7fBwwAKkXhhQORpnoeUi/ur56yoOzz1z1SpYKO3h0
 L4Z9ltS2VR9KEg4jXQrLmpBFVcdFF+78cWiW1UuIaZgNjwJ8wqhZe7vCy
 yp14MJXuEfWioNqnp28uIhIYT3KH740JCGzzN770bG2NXEnIZ+8ijEDDg
 lmxWsc7pRO7U3OpYrKHWmNDGEIUIc1tmYWLjmVi/L739CJRCmD4ldSr2M
 baYDmg12w+cNvR3yfC2XiaGCHW+KCvwWy68MClF7D1qxYs1sKDqWSsUPU
 PCE/C5sJXDUXUeffDCeAWLIDb12K/dqqR0gB07QlkMyXFevd16LnUNRP9 w==;
X-CSE-ConnectionGUID: pa7nRkquTYe1ezaz9E3PHg==
X-CSE-MsgGUID: ppkgSPbcQh6PVDkk0xUVZQ==
X-IronPort-AV: E=Sophos;i="6.07,180,1708412400"; d="scan'208";a="186866933"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2024 21:37:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 21:37:01 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 21:36:49 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>, "neil .
 armstrong @ linaro . org" <neil.armstrong@linaro.org>, "rfoss @ kernel . org"
 <rfoss@kernel.org>, "Laurent . pinchart @ ideasonboard . com"
 <Laurent.pinchart@ideasonboard.com>, "jonas @ kwiboo . se" <jonas@kwiboo.se>, 
 "jernej . skrabec @ gmail . com" <jernej.skrabec@gmail.com>, "maarten .
 lankhorst @ linux . intel . com" <maarten.lankhorst@linux.intel.com>,
 "mripard @ kernel . org" <mripard@kernel.org>, "tzimmermann @ suse . de"
 <tzimmermann@suse.de>, "airlied @ gmail . com" <airlied@gmail.com>, "daniel @
 ffwll . ch" <daniel@ffwll.ch>, "robh+dt @ kernel . org" <robh+dt@kernel.org>, 
 "krzysztof . kozlowski+dt @ linaro . org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt @ kernel . org"
 <conor+dt@kernel.org>, "linux @ armlinux . org . uk" <linux@armlinux.org.uk>, 
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>, "alexandre
 . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>, "claudiu . beznea
 @ tuxon . dev" <claudiu.beznea@tuxon.dev>, "Manikandan . M @ microchip . com"
 <Manikandan.M@microchip.com>, "Dharma . B @ microchip . com"
 <Dharma.B@microchip.com>, "arnd @ arndb . de" <arnd@arndb.de>, "geert+renesas
 @ glider . be" <geert+renesas@glider.be>, "Jason @ zx2c4 . com"
 <Jason@zx2c4.com>, "mpe @ ellerman . id . au" <mpe@ellerman.id.au>, "gerg @
 linux-m68k . org" <gerg@linux-m68k.org>, "rdunlap @ infradead . org"
 <rdunlap@infradead.org>, "vbabka @ suse . cz" <vbabka@suse.cz>, "dri-devel @
 lists . freedesktop . org" <dri-devel@lists.freedesktop.org>, "devicetree @
 vger . kernel . org" <devicetree@vger.kernel.org>, "linux-kernel @ vger .
 kernel . org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel @ lists .
 infradead . org" <linux-arm-kernel@lists.infradead.org>, "Hari . PrasathGE @
 microchip . com" <Hari.PrasathGE@microchip.com>, "akpm @ linux-foundation .
 org" <akpm@linux-foundation.org>, "deller @ gmx . de" <deller@gmx.de>
CC: Dharma Balasubiramani <dharma.b@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>
Subject: [PATCH v5 3/4] MAINTAINERS: add SAM9X7 SoC's LVDS controller
Date: Fri, 5 Apr 2024 10:05:35 +0530
Message-ID: <20240405043536.274220-4-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405043536.274220-1-dharma.b@microchip.com>
References: <20240405043536.274220-1-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the newly added LVDS controller for the SAM9X7 SoC to the existing
MAINTAINERS entry.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Changelog
v4 -> v5
v3 -> v4
- No changes.
v2 -> v3
- Move the entry before "MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER".
v1 -> v2
- No Changes.
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa3b947fb080..3dd93dbe9542 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14562,6 +14562,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/pwm/atmel,at91sam-pwm.yaml
 F:	drivers/pwm/pwm-atmel.c
 
+MICROCHIP SAM9x7-COMPATIBLE LVDS CONTROLLER
+M:	Manikandan Muralidharan <manikandan.m@microchip.com>
+M:	Dharma Balasubiramani <dharma.b@microchip.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml
+F:	drivers/gpu/drm/bridge/microchip-lvds.c
+
 MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-iio@vger.kernel.org
-- 
2.25.1

