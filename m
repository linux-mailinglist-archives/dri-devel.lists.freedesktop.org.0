Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C460C74FD23
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 04:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2073410E063;
	Wed, 12 Jul 2023 02:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455D210E063
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689129639; x=1720665639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UQ+Ty7QCLmzuZeUmH8ApBFkuw242Jg4ATJz0g4JujM4=;
 b=pCYgb0qvj/t4pwcCgFb2mDugq9WkSw5ElHfZowGmkhWTj4gV57HYnTcl
 9EZO2cswZ0jD9OFbQOeQfz/nEjsiWpwU4JaGk/Ij6Lr32ySSAIxcL+YYq
 XMShKbSf6vIypfzJSUvcGuK7rIDcGz8LZcH9VXHu37KxWCCkxkn0MwiR6
 KVJkxtlaNR5wO9zjtVKMCLVZBhpqdIFZmjZ1P2E3qMOwjVizvpuSVOeoq
 tApcXXYK755gHyJOTGNMbYNgxeVLGIUgcdUSwzvTTS9weVnXCvIcnjppj
 VJnk+GuBONLFHjYBZrVdzfozdu7Ji+6Km1JsiFyGpRX+L9wMgwtq0Qibt Q==;
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="234987599"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2023 19:40:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Jul 2023 19:40:36 -0700
Received: from che-lt-i67131.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 11 Jul 2023 19:40:27 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/9] Add support for XLCDC to sam9x7 SoC family.
Date: Wed, 12 Jul 2023 08:10:08 +0530
Message-ID: <20230712024017.218921-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Varshini.Rajendran@microchip.com, Dharma.B@microchip.com,
 Durai.ManickamKR@microchip.com, Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series aims to add support for XLCDC IP of sam9x7 SoC family
to the DRM subsystem.XLCDC IP has additional registers and new
configuration bits compared to the existing register set of HLCDC IP.
The new compatible string "microchip,sam9x75-xlcdc" is defined for sam9x75
variant of the sam9x7 SoC family.The is_xlcdc flag under driver data helps
to differentiate the XLCDC and existing HLCDC code within the same driver.

changes in v2:
* Change the driver compatible name from "microchip,sam9x7-xlcdc" to
"microchip,sam9x75-xlcdc".
* Move is_xlcdc flag to driver data.
* Remove unsed Macro definitions.
* Add co-developed-bys tags
* Replace regmap_read() with regmap_read_poll_timeout() call
* Split code into two helpers for code readablitity.

Durai Manickam KR (1):
  drm: atmel-hlcdc: Define SAM9X7 SoC XLCDC specific registers

Manikandan Muralidharan (8):
  dt-bindings: mfd: Add bindings for SAM9X75 LCD controller
  mfd: atmel-hlcdc: Add compatible for sam9x75 XLCD controller
  drm: atmel-hlcdc: add flag to differentiate XLCDC and HLCDC IP
  drm: atmel-hlcdc: add LCD controller layer definition for sam9x75
  drm: atmel_hlcdc: Add support for XLCDC in atmel LCD driver
  drm: atmel-hlcdc: add DPI mode support for XLCDC
  drm: atmel-hlcdc: add vertical and horizontal scaling support for
    XLCDC
  drm: atmel-hlcdc: add support for DSI output formats

 .../devicetree/bindings/mfd/atmel-hlcdc.txt   |   1 +
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 171 +++++++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  99 +++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |  48 +++
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 357 +++++++++++++++---
 drivers/mfd/atmel-hlcdc.c                     |   1 +
 include/linux/mfd/atmel-hlcdc.h               |  10 +
 7 files changed, 596 insertions(+), 91 deletions(-)

-- 
2.25.1

