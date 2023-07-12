Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6549574FD39
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 04:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A34010E48A;
	Wed, 12 Jul 2023 02:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1843F10E48A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689129726; x=1720665726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qlhvIYFDZsRkccAuqns/tmcijlZ/1ZjDUHf/bvJuyVk=;
 b=IAcVXcdFevCCxRSlmopdsC0v5pRz89zg04PSxYDrr6XAypgRLYkLVqoO
 X0yth/uJuha3iJHUa/U3250qugfGwImm+Lu3ir/MzWb15iP+U2iwi277x
 I2jnphqMwjIAipmyc4Aju5yf5/ekf3iPxpoKdyiarXMVjUV8BBrOVDiWD
 5q7dgVjfoZdaJp3yTUdlloryneurd33iTEirxjDw8XmybRnIEMeyuq2jj
 Oq2Q4aAJeH/ab6nuEuhfJ0UB6QhWzAOgUy+j44cSOgETh5HX+Pr6+ZGRQ
 MHHhDGkzSqYr/UzDsAqi1dCfrqEinyXaYSMXj0Aor8HeIn9y5anITu8uI g==;
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="223259478"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2023 19:42:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Jul 2023 19:42:02 -0700
Received: from che-lt-i67131.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 11 Jul 2023 19:41:54 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 9/9] drm: atmel-hlcdc: add support for DSI output formats
Date: Wed, 12 Jul 2023 08:10:17 +0530
Message-ID: <20230712024017.218921-10-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712024017.218921-1-manikandan.m@microchip.com>
References: <20230712024017.218921-1-manikandan.m@microchip.com>
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
 Durai Manickam KR <durai.manickamkr@microchip.com>,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the following DPI mode if the encoder type
is DSI as per the XLCDC IP datasheet:
- 16BPPCFG1
- 16BPPCFG2
- 16BPPCFG3
- 18BPPCFG1
- 18BPPCFG2
- 24BPP

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
[durai.manickamkr@microchip.com: update output format using is_xlcdc flag]
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 117 +++++++++++++-----
 1 file changed, 86 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index c0a1d2d31ed2..4035410ba1df 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -269,11 +269,18 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 
 }
 
-#define ATMEL_HLCDC_RGB444_OUTPUT	BIT(0)
-#define ATMEL_HLCDC_RGB565_OUTPUT	BIT(1)
-#define ATMEL_HLCDC_RGB666_OUTPUT	BIT(2)
-#define ATMEL_HLCDC_RGB888_OUTPUT	BIT(3)
-#define ATMEL_HLCDC_OUTPUT_MODE_MASK	GENMASK(3, 0)
+#define ATMEL_HLCDC_RGB444_OUTPUT		BIT(0)
+#define ATMEL_HLCDC_RGB565_OUTPUT		BIT(1)
+#define ATMEL_HLCDC_RGB666_OUTPUT		BIT(2)
+#define ATMEL_HLCDC_RGB888_OUTPUT		BIT(3)
+#define ATMEL_HLCDC_DPI_RGB565C1_OUTPUT		BIT(4)
+#define ATMEL_HLCDC_DPI_RGB565C2_OUTPUT		BIT(5)
+#define ATMEL_HLCDC_DPI_RGB565C3_OUTPUT		BIT(6)
+#define ATMEL_HLCDC_DPI_RGB666C1_OUTPUT		BIT(7)
+#define ATMEL_HLCDC_DPI_RGB666C2_OUTPUT		BIT(8)
+#define ATMEL_HLCDC_DPI_RGB888_OUTPUT		BIT(9)
+#define ATMEL_HLCDC_OUTPUT_MODE_MASK		GENMASK(3, 0)
+#define ATMEL_XLCDC_OUTPUT_MODE_MASK		GENMASK(9, 0)
 
 static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
 {
@@ -287,37 +294,83 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
 	if (!encoder)
 		encoder = connector->encoder;
 
-	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
-	case 0:
-		break;
-	case MEDIA_BUS_FMT_RGB444_1X12:
-		return ATMEL_HLCDC_RGB444_OUTPUT;
-	case MEDIA_BUS_FMT_RGB565_1X16:
-		return ATMEL_HLCDC_RGB565_OUTPUT;
-	case MEDIA_BUS_FMT_RGB666_1X18:
-		return ATMEL_HLCDC_RGB666_OUTPUT;
-	case MEDIA_BUS_FMT_RGB888_1X24:
-		return ATMEL_HLCDC_RGB888_OUTPUT;
-	default:
-		return -EINVAL;
-	}
-
-	for (j = 0; j < info->num_bus_formats; j++) {
-		switch (info->bus_formats[j]) {
-		case MEDIA_BUS_FMT_RGB444_1X12:
-			supported_fmts |= ATMEL_HLCDC_RGB444_OUTPUT;
+	if (encoder->encoder_type == DRM_MODE_ENCODER_DSI) {
+		/*
+		 * atmel-hlcdc to support DSI formats with DSI video pipeline
+		 * when DRM_MODE_ENCODER_DSI type is set by
+		 * connector driver component.
+		 */
+		switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
+		case 0:
 			break;
 		case MEDIA_BUS_FMT_RGB565_1X16:
-			supported_fmts |= ATMEL_HLCDC_RGB565_OUTPUT;
-			break;
+			return ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;
 		case MEDIA_BUS_FMT_RGB666_1X18:
-			supported_fmts |= ATMEL_HLCDC_RGB666_OUTPUT;
-			break;
+			return ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;
+		case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+			return ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;
 		case MEDIA_BUS_FMT_RGB888_1X24:
-			supported_fmts |= ATMEL_HLCDC_RGB888_OUTPUT;
-			break;
+			return ATMEL_HLCDC_DPI_RGB888_OUTPUT;
 		default:
+			return -EINVAL;
+		}
+
+		for (j = 0; j < info->num_bus_formats; j++) {
+			switch (info->bus_formats[j]) {
+			case MEDIA_BUS_FMT_RGB565_1X16:
+				supported_fmts |=
+					ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;
+				break;
+			case MEDIA_BUS_FMT_RGB666_1X18:
+				supported_fmts |=
+					ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;
+				break;
+			case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+				supported_fmts |=
+					ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;
+				break;
+			case MEDIA_BUS_FMT_RGB888_1X24:
+				supported_fmts |=
+					ATMEL_HLCDC_DPI_RGB888_OUTPUT;
+				break;
+			default:
+				break;
+			}
+		}
+
+	} else {
+		switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
+		case 0:
 			break;
+		case MEDIA_BUS_FMT_RGB444_1X12:
+			return ATMEL_HLCDC_RGB444_OUTPUT;
+		case MEDIA_BUS_FMT_RGB565_1X16:
+			return ATMEL_HLCDC_RGB565_OUTPUT;
+		case MEDIA_BUS_FMT_RGB666_1X18:
+			return ATMEL_HLCDC_RGB666_OUTPUT;
+		case MEDIA_BUS_FMT_RGB888_1X24:
+			return ATMEL_HLCDC_RGB888_OUTPUT;
+		default:
+			return -EINVAL;
+		}
+
+		for (j = 0; j < info->num_bus_formats; j++) {
+			switch (info->bus_formats[j]) {
+			case MEDIA_BUS_FMT_RGB444_1X12:
+				supported_fmts |= ATMEL_HLCDC_RGB444_OUTPUT;
+				break;
+			case MEDIA_BUS_FMT_RGB565_1X16:
+				supported_fmts |= ATMEL_HLCDC_RGB565_OUTPUT;
+				break;
+			case MEDIA_BUS_FMT_RGB666_1X18:
+				supported_fmts |= ATMEL_HLCDC_RGB666_OUTPUT;
+				break;
+			case MEDIA_BUS_FMT_RGB888_1X24:
+				supported_fmts |= ATMEL_HLCDC_RGB888_OUTPUT;
+				break;
+			default:
+				break;
+			}
 		}
 	}
 
@@ -326,7 +379,7 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
 
 static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 {
-	unsigned int output_fmts = ATMEL_HLCDC_OUTPUT_MODE_MASK;
+	unsigned int output_fmts;
 	struct atmel_hlcdc_crtc_state *hstate;
 	struct drm_connector_state *cstate;
 	struct drm_connector *connector;
@@ -334,6 +387,8 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 	int i;
 
 	crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);
+	output_fmts = crtc->dc->desc->is_xlcdc ? ATMEL_XLCDC_OUTPUT_MODE_MASK :
+		      ATMEL_HLCDC_OUTPUT_MODE_MASK;
 
 	for_each_new_connector_in_state(state->state, connector, cstate, i) {
 		unsigned int supported_fmts = 0;
-- 
2.25.1

