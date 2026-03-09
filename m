Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPQRGZzWrmlhJAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:18:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3A23A630
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D8710E4FD;
	Mon,  9 Mar 2026 14:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cRRZpnjF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WQnm4dfE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cRRZpnjF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WQnm4dfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7227810E4FA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 14:18:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B41034D247;
 Mon,  9 Mar 2026 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773065852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VD3gHpmdp8P8rU92GmLBwjvNtErqvykFq2ll5j1U+Qc=;
 b=cRRZpnjFj1njqpgpHGh1rY5lditMLCnEffRXh4OblKUxs937JYoDlJnTC+OTPx7/poe1Pq
 IOWcLQm+h9hoi5bPFtmWTIxzxELkLu65ve93kRH1Z5nXa28rXLfzlZdYtdaKwk1zPtyBQs
 hiBgIzssCtU3ZZsxUdHejyzmc4HupmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773065852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VD3gHpmdp8P8rU92GmLBwjvNtErqvykFq2ll5j1U+Qc=;
 b=WQnm4dfEyq4sgn6Vjtzca+ZZ11oHx1xl4m5j8vvV1bqi/U0MZl6jNpEFN/dODketaHEmme
 mYzXKXXyqT70I2Dg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cRRZpnjF;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WQnm4dfE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773065852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VD3gHpmdp8P8rU92GmLBwjvNtErqvykFq2ll5j1U+Qc=;
 b=cRRZpnjFj1njqpgpHGh1rY5lditMLCnEffRXh4OblKUxs937JYoDlJnTC+OTPx7/poe1Pq
 IOWcLQm+h9hoi5bPFtmWTIxzxELkLu65ve93kRH1Z5nXa28rXLfzlZdYtdaKwk1zPtyBQs
 hiBgIzssCtU3ZZsxUdHejyzmc4HupmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773065852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VD3gHpmdp8P8rU92GmLBwjvNtErqvykFq2ll5j1U+Qc=;
 b=WQnm4dfEyq4sgn6Vjtzca+ZZ11oHx1xl4m5j8vvV1bqi/U0MZl6jNpEFN/dODketaHEmme
 mYzXKXXyqT70I2Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AA5F3EF3B;
 Mon,  9 Mar 2026 14:17:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gAaFHHzWrmldPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Mar 2026 14:17:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 12/13] lib/fonts: Store font data for user space with
 font_data_export()
Date: Mon,  9 Mar 2026 15:14:54 +0100
Message-ID: <20260309141723.137364-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309141723.137364-1-tzimmermann@suse.de>
References: <20260309141723.137364-1-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 0DA3A23A630
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add font_data_export() and update consoles to use it.

The helper font_data_export() is based on code in fbcon_get_font().
It extends the size of a single glyph to match the requested vpitch,
which us usually 32 bytes for fonts from user space. Internal fonts
have a pitch according to the glyph's height.

The implementation of font_data_export() differs in several ways from
the original code. The original implementation distinguished between
different pitches of the font data. This is not necessary as the pitch
is a parameter in the copying.

There was also special handling for a font pitch of 3 bytes, which got
expanded to 4 bytes (with trailing bits on each scanline). The logic
originated from long before git history exists even in the historical
tree. So it is not clear why this was implemented. It is not what user
space expects. The setfont utitlity loads font with 3-bytes pitches and
expects to read such fonts with a 3-byte pitch. For any font width, the
font pitch is always the width extended to the next multiple of 8. See
[1] for the user-space font-reading code.

With the changes to handling the font pitches, font_data_export() replaces
the original code's various special cases with a single copying logic.

v3:
- fix typos (Helge)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://github.com/legionus/kbd/blob/v2.9.0/src/libkfont/kdfontop.c#L73 # [1]
---
 drivers/video/fbdev/core/fbcon.c | 57 ++------------------------------
 include/linux/font.h             |  1 +
 lib/fonts/fonts.c                | 40 ++++++++++++++++++++++
 3 files changed, 43 insertions(+), 55 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 53677c09a0ec..8641b0b3edc4 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2282,68 +2282,15 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 
 static int fbcon_get_font(struct vc_data *vc, struct console_font *font, unsigned int vpitch)
 {
-	struct fbcon_display *p = &fb_display[vc->vc_num];
-	font_data_t *fontdata = p->fontdata;
-	u8 *data = font->data;
-	int i, j;
+	const struct fbcon_display *p = &fb_display[vc->vc_num];
 
 	font->width = vc->vc_font.width;
 	font->height = vc->vc_font.height;
 	if (font->height > vpitch)
 		return -ENOSPC;
 	font->charcount = vc->vc_hi_font_mask ? 512 : 256;
-	if (!font->data)
-		return 0;
-
-	if (font->width <= 8) {
-		j = vc->vc_font.height;
-		if (font->charcount * j > font_data_size(fontdata))
-			return -EINVAL;
 
-		for (i = 0; i < font->charcount; i++) {
-			memcpy(data, fontdata, j);
-			memset(data + j, 0, vpitch - j);
-			data += vpitch;
-			fontdata += j;
-		}
-	} else if (font->width <= 16) {
-		j = vc->vc_font.height * 2;
-		if (font->charcount * j > font_data_size(fontdata))
-			return -EINVAL;
-
-		for (i = 0; i < font->charcount; i++) {
-			memcpy(data, fontdata, j);
-			memset(data + j, 0, 2*vpitch - j);
-			data += 2*vpitch;
-			fontdata += j;
-		}
-	} else if (font->width <= 24) {
-		if (font->charcount * (vc->vc_font.height * sizeof(u32)) > font_data_size(fontdata))
-			return -EINVAL;
-
-		for (i = 0; i < font->charcount; i++) {
-			for (j = 0; j < vc->vc_font.height; j++) {
-				*data++ = fontdata[0];
-				*data++ = fontdata[1];
-				*data++ = fontdata[2];
-				fontdata += sizeof(u32);
-			}
-			memset(data, 0, 3 * (vpitch - j));
-			data += 3 * (vpitch - j);
-		}
-	} else {
-		j = vc->vc_font.height * 4;
-		if (font->charcount * j > font_data_size(fontdata))
-			return -EINVAL;
-
-		for (i = 0; i < font->charcount; i++) {
-			memcpy(data, fontdata, j);
-			memset(data + j, 0, 4 * vpitch - j);
-			data += 4 * vpitch;
-			fontdata += j;
-		}
-	}
-	return 0;
+	return font_data_export(p->fontdata, font, vpitch);
 }
 
 /* set/clear vc_hi_font_mask and update vc attrs accordingly */
diff --git a/include/linux/font.h b/include/linux/font.h
index 3eb4818402c5..d80db66a5c17 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -62,6 +62,7 @@ void font_data_get(font_data_t *fd);
 bool font_data_put(font_data_t *fd);
 unsigned int font_data_size(font_data_t *fd);
 bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs);
+int font_data_export(font_data_t *fd, struct console_font *font, unsigned int vpitch);
 
 /*
  * Font description
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index 16e75c3d2a0f..a861b375e35d 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -198,6 +198,46 @@ bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs)
 }
 EXPORT_SYMBOL_GPL(font_data_is_equal);
 
+/**
+ * font_data_export - Stores font data for user space
+ * @fd: Font data
+ * @font: A font for user space
+ * @vpitch: The size of a single glyph in @font in bytes
+ *
+ * Store the font data given in @fd to the font in @font. Values and
+ * pointers in @font are pre-initialized. This helper mostly checks some
+ * corner cases and translates glyph sizes according to the value given
+ * @vpitch.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int font_data_export(font_data_t *fd, struct console_font *font, unsigned int vpitch)
+{
+	const unsigned char *font_data = font_data_buf(fd);
+	unsigned char *data = font->data;
+	unsigned int pitch = console_font_pitch(font);
+	unsigned int glyphsize, i;
+
+	if (!font->width || !font->height || !font->charcount || !font->data)
+		return 0;
+
+	glyphsize = font->height * pitch;
+
+	if (font->charcount * glyphsize > font_data_size(fd))
+		return -EINVAL;
+
+	for (i = 0; i < font->charcount; i++) {
+		memcpy(data, font_data, glyphsize);
+		memset(data + glyphsize, 0, pitch * vpitch - glyphsize);
+		data += pitch * vpitch;
+		font_data += glyphsize;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(font_data_export);
+
 /*
  * Font lookup
  */
-- 
2.53.0

