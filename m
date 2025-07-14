Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAF6B04352
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FC310E4B5;
	Mon, 14 Jul 2025 15:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EA310E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA0431F7C4;
 Mon, 14 Jul 2025 15:18:23 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8DF313A57;
 Mon, 14 Jul 2025 15:18:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GIfeJ78fdWhbMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 15:18:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/9] drm/sysfb: Find screen_info format with helpers
Date: Mon, 14 Jul 2025 17:13:03 +0200
Message-ID: <20250714151513.309475-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714151513.309475-1-tzimmermann@suse.de>
References: <20250714151513.309475-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: CA0431F7C4
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
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

Convert drm_sysfb_get_format_si() to lookup the screen_info color
format as struct pixel_format with screen_info_pixel_format(). Then
search the list of given formats for the screen_info format with
pixel_format_equal().

Replaces custom code with helpers. The pixel-compare helper
pixel_format_equal() also handles indexed color formats. Prepares
for sysfb drivers to support color palettes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
index 0b3fb874a51f..885864168c54 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
@@ -79,22 +79,19 @@ const struct drm_format_info *drm_sysfb_get_format_si(struct drm_device *dev,
 						      const struct screen_info *si)
 {
 	const struct drm_format_info *format = NULL;
-	u32 bits_per_pixel;
+	struct pixel_format pixel;
 	size_t i;
+	int ret;
 
-	bits_per_pixel = __screen_info_lfb_bits_per_pixel(si);
+	ret = screen_info_pixel_format(si, &pixel);
+	if (ret)
+		return NULL;
 
 	for (i = 0; i < nformats; ++i) {
-		const struct pixel_format *f = &formats[i].pixel;
-
-		if (bits_per_pixel == f->bits_per_pixel &&
-		    si->red_size == f->red.length &&
-		    si->red_pos == f->red.offset &&
-		    si->green_size == f->green.length &&
-		    si->green_pos == f->green.offset &&
-		    si->blue_size == f->blue.length &&
-		    si->blue_pos == f->blue.offset) {
-			format = drm_format_info(formats[i].fourcc);
+		const struct drm_sysfb_format *f = &formats[i];
+
+		if (pixel_format_equal(&pixel, &f->pixel)) {
+			format = drm_format_info(f->fourcc);
 			break;
 		}
 	}
-- 
2.50.0

