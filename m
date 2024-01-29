Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B174A8401AB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD4C1127C8;
	Mon, 29 Jan 2024 09:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB3D1127C2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706520744; x=1738056744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LW3pFUStHKEnZSyxevXGQeuoxSERTH8HcpzSlQGWuPU=;
 b=AwiSeJm4waxelw58l27jbBJ2jkI6mOdxjl8Q/8CRTwuCg/5/ue5VcV9J
 rum3oGSC9W8eS3BgDHV7IaKPAFQj29j0x20xlV94ewxgsE+4+h+0w8GGc
 E8AnQYqq3N/XmOWuwbLv5R7z2eiGD2ZWDZEwLRx5WamDjzLBGTqol+fb/
 BMjXyfnwQoP0Jw1ggVTVc1rvFgGgLInnmbK0wAzdNFL7QoTn5sbjBZtWA
 ovunRSTWzsPsEWD2pFYJAmTENoDFyvy+Q/fPLdUpW12yaI4ZhVXnUudPY
 ZihlcYAyI5y5lzRloS85U6Dhr1URg8QZ1x9rUaSKChGRuvLttrPsToEJN w==;
X-CSE-ConnectionGUID: 7jdGMqSJS4uTHBHVby00iw==
X-CSE-MsgGUID: bOAtg531QyK1m/Kbf6Hzzw==
X-IronPort-AV: E=Sophos;i="6.05,226,1701154800"; d="scan'208";a="15433404"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jan 2024 02:25:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 02:25:03 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 02:24:56 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <lee@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v7 5/7] drm: atmel-hlcdc: add DPI mode support for XLCDC
Date: Mon, 29 Jan 2024 14:53:17 +0530
Message-ID: <20240129092319.199365-6-manikandan.m@microchip.com>
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

Add support for Display Pixel Interface (DPI) Compatible Mode
support in atmel-hlcdc driver for XLCDC IP along with legacy
pixel mapping. DPI mode BIT is configured in LCDC_CFG5 register.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
[durai.manickamkr@microchip.com: update DPI mode bit using is_xlcdc flag]
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 1ac31c0c474a..1899be2eb6a3 100644
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
@@ -374,7 +380,15 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 
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
 
@@ -478,6 +492,7 @@ static struct drm_crtc_state *
 atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct atmel_hlcdc_crtc_state *state, *cur;
+	struct atmel_hlcdc_crtc *c = drm_crtc_to_atmel_hlcdc_crtc(crtc);
 
 	if (WARN_ON(!crtc->state))
 		return NULL;
@@ -489,6 +504,8 @@ atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
 
 	cur = drm_crtc_state_to_atmel_hlcdc_crtc_state(crtc->state);
 	state->output_mode = cur->output_mode;
+	if (c->dc->desc->is_xlcdc)
+		state->dpi = cur->dpi;
 
 	return &state->base;
 }
-- 
2.25.1

