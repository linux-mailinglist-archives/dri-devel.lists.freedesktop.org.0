Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA2EADD01F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3439010E755;
	Tue, 17 Jun 2025 14:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8C510E752
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:40:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CF7B71F7B3;
 Tue, 17 Jun 2025 14:39:48 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC05413AE2;
 Tue, 17 Jun 2025 14:39:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qB+SKDR+UWh8bQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jun 2025 14:39:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/9] drm/color-mgmt: Prepare for RGB332 palettes
Date: Tue, 17 Jun 2025 16:23:17 +0200
Message-ID: <20250617143649.143967-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617143649.143967-1-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: CF7B71F7B3
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00
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

Add helper drm_crtc_fill_palette_332(), which fills palettes with
RGB332 color data. Each color in RGB332 format serves as an index
into an 8-bit palette that stores the corresponding component-based
colors.

Vesadrm will use the new helper to emulate RGB formats on top of
framebuffers in C8 format.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_color_mgmt.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_color_mgmt.h     |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 37a3270bc3c2..7ef214848313 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -817,6 +817,38 @@ void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *
 }
 EXPORT_SYMBOL(drm_crtc_load_palette_8);
 
+static void fill_palette_332(struct drm_crtc *crtc, u16 r, u16 g, u16 b,
+			     drm_crtc_set_lut_func set_palette)
+{
+	unsigned int i = (r << 5) | (g << 2) | b;
+
+	r = (r << 13) | (r << 10) | (r << 7) | (r << 4) | (r << 1) | (r >> 2);
+	g = (g << 13) | (g << 10) | (g << 7) | (g << 4) | (g << 1) | (g >> 2);
+	b = (b << 14) | (b << 12) | (b << 10) | (b << 8) | (b << 6) | (b << 4) | (b << 2) | b;
+
+	set_palette(crtc, i, r, g, b);
+}
+
+/**
+ * drm_crtc_fill_palette_332 - Programs a default palette for R332-like formats
+ * @crtc: The displaying CRTC
+ * @set_palette: Callback for programming the hardware gamma LUT
+ *
+ * Programs an RGB332 palette to hardware.
+ */
+void drm_crtc_fill_palette_332(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette)
+{
+	unsigned int r, g, b;
+
+	for (r = 0; r < 8; ++r) {
+		for (g = 0; g < 8; ++g) {
+			for (b = 0; b < 4; ++b)
+				fill_palette_332(crtc, r, g, b, set_palette);
+		}
+	}
+}
+EXPORT_SYMBOL(drm_crtc_fill_palette_332);
+
 static void fill_palette_8(struct drm_crtc *crtc, unsigned int i,
 			   drm_crtc_set_lut_func set_palette)
 {
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 6cb577f6dba6..eccb71ab335a 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -143,6 +143,7 @@ void drm_crtc_fill_gamma_555(struct drm_crtc *crtc, drm_crtc_set_lut_func set_ga
 void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *lut,
 			     drm_crtc_set_lut_func set_palette);
 
+void drm_crtc_fill_palette_332(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette);
 void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette);
 
 #endif
-- 
2.49.0

