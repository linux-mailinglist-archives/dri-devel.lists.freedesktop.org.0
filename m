Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MR3G716lWl8RwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:39:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027D1542C2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDCE10E58A;
	Wed, 18 Feb 2026 08:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NTX9HnQn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3JLKVeFI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NTX9HnQn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3JLKVeFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86E610E585
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 08:39:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F4CD5BCD4;
 Wed, 18 Feb 2026 08:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771403946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLnmpUnXpt6L2p3Di4r7+x/zDQOjRKhw+YqPsiGwPHU=;
 b=NTX9HnQnlkK0TUWZ6N4v0Au7otmyAjGdZqMUfoYfKyENxTZDgGYku7j7qNGFUN6/P0HCsD
 CPUTervAy1zPq9f9cYxE0/Be/D4zrOlox5DLaMel/2bOksORZ2CvMqBvqqg5RmP/4m2cKX
 j6yAZrvlcUxsZodMMEXW+j5lMRRa2lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771403946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLnmpUnXpt6L2p3Di4r7+x/zDQOjRKhw+YqPsiGwPHU=;
 b=3JLKVeFIGUToirabuG5sOu4uWrnIDXGbHnwLfqFQ4za2SOlxYm3rgPJwDkJ7LmFHdYHMS1
 o8aTlbr/OLZvJLBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NTX9HnQn;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3JLKVeFI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771403946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLnmpUnXpt6L2p3Di4r7+x/zDQOjRKhw+YqPsiGwPHU=;
 b=NTX9HnQnlkK0TUWZ6N4v0Au7otmyAjGdZqMUfoYfKyENxTZDgGYku7j7qNGFUN6/P0HCsD
 CPUTervAy1zPq9f9cYxE0/Be/D4zrOlox5DLaMel/2bOksORZ2CvMqBvqqg5RmP/4m2cKX
 j6yAZrvlcUxsZodMMEXW+j5lMRRa2lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771403946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLnmpUnXpt6L2p3Di4r7+x/zDQOjRKhw+YqPsiGwPHU=;
 b=3JLKVeFIGUToirabuG5sOu4uWrnIDXGbHnwLfqFQ4za2SOlxYm3rgPJwDkJ7LmFHdYHMS1
 o8aTlbr/OLZvJLBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C69C3EA65;
 Wed, 18 Feb 2026 08:39:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wNAfCap6lWn8LwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 18 Feb 2026 08:39:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/13] lib/fonts: Create font_data_t from struct console_font
 with font_data_import()
Date: Wed, 18 Feb 2026 09:16:02 +0100
Message-ID: <20260218083855.10743-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218083855.10743-1-tzimmermann@suse.de>
References: <20260218083855.10743-1-tzimmermann@suse.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmx.de,ravnborg.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2027D1542C2
X-Rspamd-Action: no action

Add font_data_import() and update consoles to use it.

The implementation of font_data_import() is based on code from fbcon,
which supports overflow checks and crc32 checksums. Fbcon uses the crc32
checksum.

Newport_con now implements the same overflow checks as fbcon. As before,
this console does not support checksums, which are optional. Newport_con
can now also handle input font data with a vertical pitch other than 32
bytes. (The vertical pitch is the offset between two glyphs in the font
data.)

As an internal change, remove the const qualifier from the data field
if struct font_data. This allows font_data_import() to write the data
without type casting. For all users of the font data via font_data_t,
the stored data is still read only.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/newport_con.c | 22 ++--------
 drivers/video/fbdev/core/fbcon.c    | 38 ++----------------
 include/linux/font.h                |  6 ++-
 lib/fonts/fonts.c                   | 62 +++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 53 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 8870555cf837..15451c6512f7 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -501,31 +501,17 @@ static int newport_set_font(int unit, const struct console_font *op,
 {
 	int w = op->width;
 	int h = op->height;
-	int size = h * op->charcount;
 	int i;
 	font_data_t *new_data;
-	unsigned char *data = op->data, *p;
 
 	/* ladis: when I grow up, there will be a day... and more sizes will
 	 * be supported ;-) */
-	if ((w != 8) || (h != 16) || (vpitch != 32)
-	    || (op->charcount != 256 && op->charcount != 512))
+	if (w != 8 || h != 16 || (op->charcount != 256 && op->charcount != 512))
 		return -EINVAL;
 
-	if (!(new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size,
-	     GFP_USER))) return -ENOMEM;
-
-	new_data += FONT_EXTRA_WORDS * sizeof(int);
-	FNTSIZE(new_data) = size;
-	REFCOUNT(new_data) = 1;	/* usage counter */
-	FNTSUM(new_data) = 0;
-
-	p = (unsigned char *)font_data_buf(new_data);
-	for (i = 0; i < op->charcount; i++) {
-		memcpy(p, data, h);
-		data += 32;
-		p += h;
-	}
+	new_data = font_data_import(op, vpitch, NULL);
+	if (IS_ERR(new_data))
+		return PTR_ERR(new_data);
 
 	/* check if font is already used by other console */
 	for (i = 0; i < MAX_NR_CONSOLES; i++) {
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b1123f3911d7..30d82290d01f 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2044,8 +2044,6 @@ static void updatescrollmode(struct fbcon_display *p,
 	updatescrollmode_accel(p, info, vc);
 }
 
-#define PITCH(w) (((w) + 7) >> 3)
-
 static int fbcon_resize(struct vc_data *vc, unsigned int width,
 			unsigned int height, bool from_user)
 {
@@ -2429,7 +2427,6 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	resize = (w != vc->vc_font.width) || (h != vc->vc_font.height);
 	p->fontdata = data;
 	vc->vc_font.data = font_data_buf(p->fontdata);
-
 	old_width = vc->vc_font.width;
 	old_height = vc->vc_font.height;
 	old_charcount = vc->vc_font.charcount;
@@ -2487,11 +2484,8 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	unsigned charcount = font->charcount;
 	int w = font->width;
 	int h = font->height;
-	int size, alloc_size;
-	int i, csum, ret;
+	int i, ret;
 	font_data_t *new_data;
-	const u8 *data = font->data;
-	int pitch = PITCH(font->width);
 
 	/* Is there a reason why fbconsole couldn't handle any charcount >256?
 	 * If not this check should be changed to charcount < 256 */
@@ -2515,34 +2509,10 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	if (fbcon_invalid_charcount(info, charcount))
 		return -EINVAL;
 
-	/* Check for integer overflow in font size calculation */
-	if (check_mul_overflow(h, pitch, &size) ||
-	    check_mul_overflow(size, charcount, &size))
-		return -EINVAL;
-
-	/* Check for overflow in allocation size calculation */
-	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &alloc_size))
-		return -EINVAL;
-
-	new_data = kmalloc(alloc_size, GFP_USER);
-
-	if (!new_data)
-		return -ENOMEM;
-
-	memset((u8 *)new_data, 0, FONT_EXTRA_WORDS * sizeof(int));
-
-	new_data += FONT_EXTRA_WORDS * sizeof(int);
-	FNTSIZE(new_data) = size;
-	REFCOUNT(new_data) = 1;	/* usage counter */
-	for (i=0; i< charcount; i++) {
-		memcpy((u8 *)new_data + i * h * pitch, data + i * vpitch * pitch, h * pitch);
-	}
-
-	/* Since linux has a nice crc32 function use it for counting font
-	 * checksums. */
-	csum = crc32(0, new_data, size);
+	new_data = font_data_import(font, vpitch, crc32);
+	if (IS_ERR(new_data))
+		return PTR_ERR(new_data);
 
-	FNTSUM(new_data) = csum;
 	/* Check if the same font is on some other console already */
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
 		if (fb_display[i].fontdata &&
diff --git a/include/linux/font.h b/include/linux/font.h
index d548684e6430..5a1bf433b275 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -13,6 +13,8 @@
 
 #include <linux/types.h>
 
+struct console_font;
+
 /*
  * font_data_t and helpers
  */
@@ -54,6 +56,8 @@ static inline const unsigned char *font_data_buf(font_data_t *fd)
 	return (const unsigned char *)fd;
 }
 
+font_data_t *font_data_import(const struct console_font *font, unsigned int vpitch,
+			      u32 (*calc_csum)(u32, const void *, size_t));
 void font_data_get(font_data_t *fd);
 bool font_data_put(font_data_t *fd);
 unsigned int font_data_size(font_data_t *fd);
@@ -124,7 +128,7 @@ extern const struct font_desc *get_default_font(int xres, int yres,
 
 struct font_data {
 	unsigned int extra[FONT_EXTRA_WORDS];
-	const unsigned char data[];
+	unsigned char data[];
 } __packed;
 
 #endif /* _VIDEO_FONT_H */
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index 1da0acdebf53..9b5355f6d2dc 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -14,7 +14,9 @@
 
 #include <linux/container_of.h>
 #include <linux/font.h>
+#include <linux/kd.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -24,6 +26,8 @@
 #include <asm/setup.h>
 #endif
 
+#define console_font_pitch(font) DIV_ROUND_UP((font)->width, 8)
+
 /*
  * Helpers for font_data_t
  */
@@ -46,6 +50,64 @@ static void font_data_free(font_data_t *fd)
 	kfree(to_font_data_struct(fd));
 }
 
+/**
+ * font_data_import - Allocates and initializes font data from user space
+ * @font: A font from user space
+ * @vpitch: The size of a single glyph in @font in bytes
+ * @calc_csum: An optional helper to calculate a chechsum
+ *
+ * Font data from user space must be translated to the kernel's format. The
+ * font's glyph geometry and data is provided in @font. The parameter @vpitch
+ * gives the number of bytes per glyph, including trailing bytes.
+ *
+ * The parameter @calc_sum is optional. Fbcon passes crc32() to calculate the
+ * font data's checksum.
+ *
+ * Returns:
+ * Newly initialized font data on success, or a pointer-encoded errno value otherwise.
+ */
+font_data_t *font_data_import(const struct console_font *font, unsigned int vpitch,
+			      u32 (*calc_csum)(u32, const void *, size_t))
+{
+	unsigned int pitch = console_font_pitch(font);
+	unsigned int h = font->height;
+	unsigned int charcount = font->charcount;
+	const unsigned char *data = font->data;
+	u32 csum = 0;
+	struct font_data *font_data;
+	int size, alloc_size;
+	unsigned int i;
+	font_data_t *fd;
+
+	/* Check for integer overflow in font-size calculation */
+	if (check_mul_overflow(h, pitch, &size) ||
+	    check_mul_overflow(size, charcount, &size))
+		return ERR_PTR(-EINVAL);
+
+	/* Check for overflow in allocation size calculation */
+	if (check_add_overflow(sizeof(*font_data), size, &alloc_size))
+		return ERR_PTR(-EINVAL);
+
+	font_data = kmalloc(alloc_size, GFP_USER);
+	if (!font_data)
+		return ERR_PTR(-ENOMEM);
+	memset(font_data->extra, 0, sizeof(font_data->extra));
+
+	for (i = 0; i < charcount; ++i)
+		memcpy(font_data->data + i * h * pitch, data + i * vpitch * pitch, h * pitch);
+
+	if (calc_csum)
+		csum = calc_csum(0, font_data->data, size);
+
+	fd = font_data->data;
+	REFCOUNT(fd) = 1; /* start with reference acquired */
+	FNTSIZE(fd) = size;
+	FNTSUM(fd) = csum;
+
+	return fd;
+}
+EXPORT_SYMBOL_GPL(font_data_import);
+
 /**
  * font_data_get - Acquires a reference on font data
  * @fd: Font data
-- 
2.52.0

