Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A955577F2EC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 11:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A78310E3EC;
	Thu, 17 Aug 2023 09:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7782410E3EC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 09:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692263649; x=1723799649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pfOwtJlDNm4JVHICwmkCdNIGUTaP42Bpvz3u5/oiEVU=;
 b=wSJyHkvgal00IyM9wrRSfS3nA589dOIqQpBztcsyzpTHzVLaQ5LJoko8
 SbiSj6VRkLBAti4ZfspKO/R+A1k95GItZdQfeeIAi6luIpcYUjv8Nywqh
 fx6PZhGMT6zRwC/leq9JZMMe3uhzcmJxyQCso3YdUygVqN/XH5IDFeCwb
 rxbCzm2zyXyVcu2hn4pZ6QoQ1TDesPFC0P+o3wuJr3N5/O3+9mUlDchK5
 c4ZiU4LqQCDDKhftJ1mHfbG9vnsjh3P6fyhwYxzH8epgvylIm53GCXklD
 w+cBw4X3Lapjq5/IduYBUPji0xg6Ja0VYKq2oIpvPOKP//w2ByGlknbgX A==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="230219046"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Aug 2023 02:14:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 17 Aug 2023 02:14:03 -0700
Received: from che-lt-i67131.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Thu, 17 Aug 2023 02:13:57 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/8] drm: atmel-hlcdc: add DPI mode support for XLCDC
Date: Thu, 17 Aug 2023 14:42:48 +0530
Message-ID: <20230817091250.225512-7-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230817091250.225512-1-manikandan.m@microchip.com>
References: <20230817091250.225512-1-manikandan.m@microchip.com>
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

Add support for Display Pixel Interface (DPI) Compatible Mode
support in atmel-hlcdc driver for XLCDC IP along with legacy
pixel mapping.DPI mode BIT is configured in LCDC_CFG5 register.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
[durai.manickamkr@microchip.com: update DPI mode bit using is_xlcdc flag]
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 4b11a1de8af4..c3d0c60ba419 100644
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
+	bool dpi;
 };
 
 static inline struct atmel_hlcdc_crtc_state *
@@ -164,6 +166,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 
 	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
 	cfg = state->output_mode << 8;
+	if (is_xlcdc)
+		cfg |= state->dpi << 11;
 
 	if (!is_xlcdc && (adj->flags & DRM_MODE_FLAG_NVSYNC))
 		cfg |= ATMEL_HLCDC_VSPOL;
@@ -176,7 +180,9 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 			   ATMEL_HLCDC_VSPDLYS | ATMEL_HLCDC_VSPDLYE |
 			   ATMEL_HLCDC_DISPPOL | ATMEL_HLCDC_DISPDLY |
 			   ATMEL_HLCDC_VSPSU | ATMEL_HLCDC_VSPHO |
-			   ATMEL_HLCDC_GUARDTIME_MASK | ATMEL_HLCDC_MODE_MASK,
+			   ATMEL_HLCDC_GUARDTIME_MASK |
+			   (is_xlcdc ? ATMEL_XLCDC_MODE_MASK |
+			   ATMEL_XLCDC_DPI : ATMEL_HLCDC_MODE_MASK),
 			   cfg);
 
 	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
@@ -366,7 +372,15 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 
 	hstate = drm_crtc_state_to_atmel_hlcdc_crtc_state(state);
 	hstate->output_mode = fls(output_fmts) - 1;
-
+	if (crtc->dc->desc->is_xlcdc) {
+		/* check if MIPI DPI bit needs to be set */
+		if (fls(output_fmts) > 3) {
+			hstate->output_mode -= 4;
+			hstate->dpi = true;
+		} else {
+			hstate->dpi = false;
+		}
+	}
 	return 0;
 }
 
@@ -470,7 +484,7 @@ static struct drm_crtc_state *
 atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct atmel_hlcdc_crtc_state *state, *cur;
-
+	struct atmel_hlcdc_crtc *c = drm_crtc_to_atmel_hlcdc_crtc(crtc);
 	if (WARN_ON(!crtc->state))
 		return NULL;
 
@@ -481,6 +495,8 @@ atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
 
 	cur = drm_crtc_state_to_atmel_hlcdc_crtc_state(crtc->state);
 	state->output_mode = cur->output_mode;
+	if (c->dc->desc->is_xlcdc)
+		state->dpi = cur->dpi;
 
 	return &state->base;
 }
-- 
2.25.1

