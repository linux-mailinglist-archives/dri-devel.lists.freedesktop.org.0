Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B18B0132
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 07:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853AA10EB50;
	Wed, 24 Apr 2024 05:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="kdbPJAYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4760410EB50
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 05:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713937359; x=1745473359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6nlV4wKxfrlEmIzRqvvA320tp0LjMhonuKXAFTpzlsA=;
 b=kdbPJAYaGvU4XwP4b4TxC3TyqSVA6ARN9ibYPLRqEkU/tkhoYA6fI/w0
 /kFKk2EMCb9cPbbkk8Hc5Si15pQxK+3u+KANYS5hKQSReSpo6r7CK2Ru1
 5heA3ftqk3nLzdjy5hY8mdLMUPN+P8lzd2FOYU1skbE8bILbdqq3Fb7oa
 SBZwNnbwvocyVyKrKX82tHesWuIUb70u9p962zzjpn/xwyCoOq4ORlSFJ
 71SUWQSrSeWtpIp2ulgUEdNzmWQUxqujmBgRNTCS5PzlOFAWJXFfc2dA4
 Y7uAdTOW0d4leDzYnTH2+EUA56k/uKhbvkZz+H+YMry0zHyukCHAfj42f g==;
X-CSE-ConnectionGUID: 66HgaiTNS5a1XaeqM3EXdg==
X-CSE-MsgGUID: LkjvCPGyTs2RY/zYBD1ODg==
X-IronPort-AV: E=Sophos;i="6.07,225,1708412400"; d="scan'208";a="22410968"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Apr 2024 22:35:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 22:35:10 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 22:35:00 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>, 
 <Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
 <Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>, Durai Manickam KR
 <durai.manickamkr@microchip.com>
Subject: [PATCH RESEND v9 5/8] drm: atmel-hlcdc: add DPI mode support for XLCDC
Date: Wed, 24 Apr 2024 11:03:48 +0530
Message-ID: <20240424053351.589830-6-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424053351.589830-1-manikandan.m@microchip.com>
References: <20240424053351.589830-1-manikandan.m@microchip.com>
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

Add support for Display Pixel Interface (DPI) Compatible Mode
support in atmel-hlcdc driver for XLCDC IP along with legacy
pixel mapping. DPI mode BIT is configured in LCDC_CFG5 register.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
[durai.manickamkr@microchip.com: update DPI mode bit using is_xlcdc flag]
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 98a98b5fca85..fdd3a6bc0f79 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -30,10 +30,12 @@
  *
  * @base: base CRTC state
  * @output_mode: RGBXXX output mode
+ * @dpi: output DPI mode
  */
 struct atmel_hlcdc_crtc_state {
 	struct drm_crtc_state base;
 	unsigned int output_mode;
+	u8 dpi;
 };
 
 static inline struct atmel_hlcdc_crtc_state *
@@ -170,6 +172,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 
 		if (adj->flags & DRM_MODE_FLAG_NHSYNC)
 			cfg |= ATMEL_HLCDC_HSPOL;
+	} else {
+		cfg |= state->dpi << 11;
 	}
 
 	regmap_update_bits(regmap, ATMEL_HLCDC_CFG(5),
@@ -177,7 +181,9 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 			   ATMEL_HLCDC_VSPDLYS | ATMEL_HLCDC_VSPDLYE |
 			   ATMEL_HLCDC_DISPPOL | ATMEL_HLCDC_DISPDLY |
 			   ATMEL_HLCDC_VSPSU | ATMEL_HLCDC_VSPHO |
-			   ATMEL_HLCDC_GUARDTIME_MASK | ATMEL_HLCDC_MODE_MASK,
+			   ATMEL_HLCDC_GUARDTIME_MASK |
+			   (crtc->dc->desc->is_xlcdc ? ATMEL_XLCDC_MODE_MASK |
+			   ATMEL_XLCDC_DPI : ATMEL_HLCDC_MODE_MASK),
 			   cfg);
 
 	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
@@ -380,7 +386,15 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 
 	hstate = drm_crtc_state_to_atmel_hlcdc_crtc_state(state);
 	hstate->output_mode = fls(output_fmts) - 1;
-
+	if (crtc->dc->desc->is_xlcdc) {
+		/* check if MIPI DPI bit needs to be set */
+		if (fls(output_fmts) > 3) {
+			hstate->output_mode -= 4;
+			hstate->dpi = 1;
+		} else {
+			hstate->dpi = 0;
+		}
+	}
 	return 0;
 }
 
@@ -484,6 +498,7 @@ static struct drm_crtc_state *
 atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct atmel_hlcdc_crtc_state *state, *cur;
+	struct atmel_hlcdc_crtc *c = drm_crtc_to_atmel_hlcdc_crtc(crtc);
 
 	if (WARN_ON(!crtc->state))
 		return NULL;
@@ -495,6 +510,8 @@ atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
 
 	cur = drm_crtc_state_to_atmel_hlcdc_crtc_state(crtc->state);
 	state->output_mode = cur->output_mode;
+	if (c->dc->desc->is_xlcdc)
+		state->dpi = cur->dpi;
 
 	return &state->base;
 }
-- 
2.25.1

