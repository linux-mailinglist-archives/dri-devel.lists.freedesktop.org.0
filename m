Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D9C8401B8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B091127C2;
	Mon, 29 Jan 2024 09:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98F01127C2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706520766; x=1738056766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A7zhmYqSGF3f91x5Sfj8wc2+BL0d/H7Pomw5rky9/34=;
 b=ZIiT1LvWL+P+HeoF3nAlfTbLxP/fhmFaUVXhSuxqzVigVx0GgdixrAOy
 6huKWDIoQW7rR6qh9dJkWQwE8LNAbYn2PIqhxGGlx4SHT0XUDvGbAD2eZ
 ex07dnCaDdVml0F4e568CMxw6NuhHaQcTSzBRaBIIAJ7Q+blkMYpKcrKv
 iqRmSOtTN9CWfsc/AHzQ6jZ8SOoSnN1On0n+2jQaRTEdVyOnFCw/RCJVa
 QpzvZeIpywXh9+1/5CWKiTpiryQFGQI213GaTNN8vXCNoZk2caDMYxy1A
 263VSPrk4Z9AqNH3y+6Tg7fNUPP9LpBOKNjJRMCZ8mtK9mfLyrwIqwRU2 w==;
X-CSE-ConnectionGUID: JMZNa0W0TwelpxkBzp+3Tg==
X-CSE-MsgGUID: OO2i0OZfQBG2uogTKO6FKA==
X-IronPort-AV: E=Sophos;i="6.05,226,1701154800"; d="scan'208";a="182680029"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jan 2024 02:25:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 02:25:20 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 02:25:13 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <lee@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v7 7/7] drm: atmel-hlcdc: add support for DSI output
 formats
Date: Mon, 29 Jan 2024 14:53:19 +0530
Message-ID: <20240129092319.199365-8-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129092319.199365-1-manikandan.m@microchip.com>
References: <20240129092319.199365-1-manikandan.m@microchip.com>
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
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 123 +++++++++++++-----
 1 file changed, 88 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 1899be2eb6a3..6f529769b036 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -295,11 +295,18 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 
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
@@ -313,53 +320,99 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
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
 		}
-	}
 
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
+		}
+	}
 	return supported_fmts;
 }
 
 static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 {
-	unsigned int output_fmts = ATMEL_HLCDC_OUTPUT_MODE_MASK;
+	unsigned int output_fmts;
 	struct atmel_hlcdc_crtc_state *hstate;
 	struct drm_connector_state *cstate;
 	struct drm_connector *connector;
-	struct atmel_hlcdc_crtc *crtc;
+	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);
 	int i;
+	bool is_xlcdc = crtc->dc->desc->is_xlcdc;
 
-	crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);
+	output_fmts = is_xlcdc ? ATMEL_XLCDC_OUTPUT_MODE_MASK :
+		      ATMEL_HLCDC_OUTPUT_MODE_MASK;
 
 	for_each_new_connector_in_state(state->state, connector, cstate, i) {
 		unsigned int supported_fmts = 0;
@@ -380,7 +433,7 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 
 	hstate = drm_crtc_state_to_atmel_hlcdc_crtc_state(state);
 	hstate->output_mode = fls(output_fmts) - 1;
-	if (crtc->dc->desc->is_xlcdc) {
+	if (is_xlcdc) {
 		/* check if MIPI DPI bit needs to be set */
 		if (fls(output_fmts) > 3) {
 			hstate->output_mode -= 4;
-- 
2.25.1

