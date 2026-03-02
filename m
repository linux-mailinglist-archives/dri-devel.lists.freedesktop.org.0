Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IS/GvuapWmfEwYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCFD1DA782
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEC610E505;
	Mon,  2 Mar 2026 14:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FHKrs+b6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e1Yojls1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FHKrs+b6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e1Yojls1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1985610E505
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:13:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 088EA3F7FF;
 Mon,  2 Mar 2026 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuOPJLdwL/exynAtq4za/w0ivcdGcqMQCglRysvbQ6M=;
 b=FHKrs+b6bbjduPx9SMmzk9LNgYbwU62mac4Be3Tfu2ULZId8byyYOtd+jAvlz36X81GF/c
 SUaZW/RdvIPTGf8f+igVJDQQTL3j4LjTdHbP4wCuE5zD40RgLKQboNX9FVopDonBpnFO3W
 uE8i0be4jOIiRKcPh26aa2XH88nkbSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuOPJLdwL/exynAtq4za/w0ivcdGcqMQCglRysvbQ6M=;
 b=e1Yojls1FcIm2qP8R7gBfG2I3x1Yem94OyOlAtOrc0S/ZtppwKjmQNRWx0um0j0fR6jRil
 KIgIKb6Rqyf+pIDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FHKrs+b6;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=e1Yojls1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuOPJLdwL/exynAtq4za/w0ivcdGcqMQCglRysvbQ6M=;
 b=FHKrs+b6bbjduPx9SMmzk9LNgYbwU62mac4Be3Tfu2ULZId8byyYOtd+jAvlz36X81GF/c
 SUaZW/RdvIPTGf8f+igVJDQQTL3j4LjTdHbP4wCuE5zD40RgLKQboNX9FVopDonBpnFO3W
 uE8i0be4jOIiRKcPh26aa2XH88nkbSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuOPJLdwL/exynAtq4za/w0ivcdGcqMQCglRysvbQ6M=;
 b=e1Yojls1FcIm2qP8R7gBfG2I3x1Yem94OyOlAtOrc0S/ZtppwKjmQNRWx0um0j0fR6jRil
 KIgIKb6Rqyf+pIDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA1B43EA69;
 Mon,  2 Mar 2026 14:13:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AK8lMO2apWleKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 14:13:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 08/13] lib/fonts: Read font size with font_data_size()
Date: Mon,  2 Mar 2026 15:08:42 +0100
Message-ID: <20260302141255.518657-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302141255.518657-1-tzimmermann@suse.de>
References: <20260302141255.518657-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmx.de,ravnborg.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EDCFD1DA782
X-Rspamd-Action: no action

Add font_data_size() and update consoles to use it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/newport_con.c |  2 +-
 drivers/video/fbdev/core/fbcon.c    | 14 +++++++-------
 include/linux/font.h                |  2 ++
 lib/fonts/fonts.c                   | 21 +++++++++++++++++++++
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 9b9ed1940404..1198c6bc2777 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -530,7 +530,7 @@ static int newport_set_font(int unit, const struct console_font *op,
 	/* check if font is already used by other console */
 	for (i = 0; i < MAX_NR_CONSOLES; i++) {
 		if (font_data[i] != FONT_DATA
-		    && FNTSIZE(font_data[i]) == size
+		    && font_data_size(font_data[i]) == size
 		    && !memcmp(font_data[i], new_data, size)) {
 			kfree(new_data - FONT_EXTRA_WORDS * sizeof(int));
 			/* current font is the same as the new one */
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 8d7840b9ebad..fa8f3e4196de 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2053,7 +2053,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 	struct fb_var_screeninfo var = info->var;
 	int x_diff, y_diff, virt_w, virt_h, virt_fw, virt_fh;
 
-	if (p->userfont && FNTSIZE(p->fontdata)) {
+	if (p->userfont && font_data_size(p->fontdata)) {
 		unsigned int size = vc_font_size(&vc->vc_font);
 
 		/*
@@ -2063,7 +2063,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 		 * charcount can change and cannot be used to determine the
 		 * font data allocated size.
 		 */
-		if (!size || size > FNTSIZE(p->fontdata))
+		if (!size || size > font_data_size(p->fontdata))
 			return -EINVAL;
 	}
 
@@ -2302,7 +2302,7 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigne
 
 	if (font->width <= 8) {
 		j = vc->vc_font.height;
-		if (font->charcount * j > FNTSIZE(fontdata))
+		if (font->charcount * j > font_data_size(fontdata))
 			return -EINVAL;
 
 		for (i = 0; i < font->charcount; i++) {
@@ -2313,7 +2313,7 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigne
 		}
 	} else if (font->width <= 16) {
 		j = vc->vc_font.height * 2;
-		if (font->charcount * j > FNTSIZE(fontdata))
+		if (font->charcount * j > font_data_size(fontdata))
 			return -EINVAL;
 
 		for (i = 0; i < font->charcount; i++) {
@@ -2323,7 +2323,7 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigne
 			fontdata += j;
 		}
 	} else if (font->width <= 24) {
-		if (font->charcount * (vc->vc_font.height * sizeof(u32)) > FNTSIZE(fontdata))
+		if (font->charcount * (vc->vc_font.height * sizeof(u32)) > font_data_size(fontdata))
 			return -EINVAL;
 
 		for (i = 0; i < font->charcount; i++) {
@@ -2338,7 +2338,7 @@ static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigne
 		}
 	} else {
 		j = vc->vc_font.height * 4;
-		if (font->charcount * j > FNTSIZE(fontdata))
+		if (font->charcount * j > font_data_size(fontdata))
 			return -EINVAL;
 
 		for (i = 0; i < font->charcount; i++) {
@@ -2553,7 +2553,7 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 		if (fb_display[i].userfont &&
 		    fb_display[i].fontdata &&
 		    FNTSUM(fb_display[i].fontdata) == csum &&
-		    FNTSIZE(fb_display[i].fontdata) == size &&
+		    font_data_size(fb_display[i].fontdata) == size &&
 		    tmp->vc_font.width == w &&
 		    !memcmp(fb_display[i].fontdata, new_data, size)) {
 			kfree(new_data - FONT_EXTRA_WORDS * sizeof(int));
diff --git a/include/linux/font.h b/include/linux/font.h
index f19abd112c18..55cc016a9357 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -54,6 +54,8 @@ static inline const unsigned char *font_data_buf(font_data_t *fd)
 	return (const unsigned char *)fd;
 }
 
+unsigned int font_data_size(font_data_t *fd);
+
 /*
  * Font description
  */
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index a7f118b30171..8c9a6762061c 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -20,6 +20,27 @@
 #endif
 #include <linux/font.h>
 
+/*
+ * Helpers for font_data_t
+ */
+
+/**
+ * font_data_size - Return size of the font data in bytes
+ * @fd: Font data
+ *
+ * Returns:
+ * The number of bytes in the given font data.
+ */
+unsigned int font_data_size(font_data_t *fd)
+{
+	return FNTSIZE(fd);
+}
+EXPORT_SYMBOL_GPL(font_data_size);
+
+/*
+ * Font lookup
+ */
+
 static const struct font_desc *fonts[] = {
 #ifdef CONFIG_FONT_8x8
 	&font_vga_8x8,
-- 
2.53.0

