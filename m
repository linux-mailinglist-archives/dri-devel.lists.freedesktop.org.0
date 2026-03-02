Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO0CJv6apWnxEgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373AD1DA790
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B0610E507;
	Mon,  2 Mar 2026 14:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="w2mQdbtY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s1IkJmGt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w2mQdbtY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s1IkJmGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A72D10E507
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:13:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 442AC3F808;
 Mon,  2 Mar 2026 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9dyZ1v4fg9qIGmkPCG7W/hdjoJTxQ4ir5vYoatE9GM=;
 b=w2mQdbtYzPWsrSORp7qf3oHGfCHtY02rpEOXqKW09v4rq4LSYYKDm68y5j6IxU6w0Tb/D0
 QeoI2Vmt0PL7yJN4oRAQO/OiBVwKcAqaBTQt4Ogd+cPypLW5eMiIqPjMRTBz74YOcA8ihb
 196VecM6/VEcTahGStjOtwMVpZsWQ8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9dyZ1v4fg9qIGmkPCG7W/hdjoJTxQ4ir5vYoatE9GM=;
 b=s1IkJmGt3YmJop2Cr3PTPRA5R4JrpbqqO+RbVXiU+flMUVDdVxfkoVR8dYgmIYkMhG0ddE
 xQ0H4XfaHJr+flAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w2mQdbtY;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=s1IkJmGt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9dyZ1v4fg9qIGmkPCG7W/hdjoJTxQ4ir5vYoatE9GM=;
 b=w2mQdbtYzPWsrSORp7qf3oHGfCHtY02rpEOXqKW09v4rq4LSYYKDm68y5j6IxU6w0Tb/D0
 QeoI2Vmt0PL7yJN4oRAQO/OiBVwKcAqaBTQt4Ogd+cPypLW5eMiIqPjMRTBz74YOcA8ihb
 196VecM6/VEcTahGStjOtwMVpZsWQ8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9dyZ1v4fg9qIGmkPCG7W/hdjoJTxQ4ir5vYoatE9GM=;
 b=s1IkJmGt3YmJop2Cr3PTPRA5R4JrpbqqO+RbVXiU+flMUVDdVxfkoVR8dYgmIYkMhG0ddE
 xQ0H4XfaHJr+flAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F9253EA6C;
 Mon,  2 Mar 2026 14:13:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SG+bAu6apWleKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 14:13:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/13] lib/fonts: Compare font data for equality with
 font_data_is_equal()
Date: Mon,  2 Mar 2026 15:08:43 +0100
Message-ID: <20260302141255.518657-10-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 373AD1DA790
X-Rspamd-Action: no action

Add font_data_is_equal() and update consoles to use it.

Font data is equal if it has the same size and contains the same values
on all bytes. Only fbcon uses a crc32 checksum. If set in both operands
the checksums have to be equal.

The new helper also guarantees to not compare internal fonts against
fonts from user space. Internal fonts cannot be ref-counted, so making
them equal to user-space fonts with the same byte sequence results in
undefined behavior.

The test only compares data buffers. Their interpretation is up each
console. Therefore remove a width test in fbcon_set_font().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/newport_con.c |  3 +--
 drivers/video/fbdev/core/fbcon.c    |  7 +-----
 include/linux/font.h                |  1 +
 lib/fonts/fonts.c                   | 37 +++++++++++++++++++++++++++--
 4 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 1198c6bc2777..4db2b901c709 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -530,8 +530,7 @@ static int newport_set_font(int unit, const struct console_font *op,
 	/* check if font is already used by other console */
 	for (i = 0; i < MAX_NR_CONSOLES; i++) {
 		if (font_data[i] != FONT_DATA
-		    && font_data_size(font_data[i]) == size
-		    && !memcmp(font_data[i], new_data, size)) {
+		    && font_data_is_equal(font_data[i], new_data)) {
 			kfree(new_data - FONT_EXTRA_WORDS * sizeof(int));
 			/* current font is the same as the new one */
 			if (i == unit)
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index fa8f3e4196de..31e812d87d9e 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2548,14 +2548,9 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	FNTSUM(new_data) = csum;
 	/* Check if the same font is on some other console already */
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
-		struct vc_data *tmp = vc_cons[i].d;
-
 		if (fb_display[i].userfont &&
 		    fb_display[i].fontdata &&
-		    FNTSUM(fb_display[i].fontdata) == csum &&
-		    font_data_size(fb_display[i].fontdata) == size &&
-		    tmp->vc_font.width == w &&
-		    !memcmp(fb_display[i].fontdata, new_data, size)) {
+		    font_data_is_equal(fb_display[i].fontdata, new_data)) {
 			kfree(new_data - FONT_EXTRA_WORDS * sizeof(int));
 			new_data = (u8 *)fb_display[i].fontdata;
 			break;
diff --git a/include/linux/font.h b/include/linux/font.h
index 55cc016a9357..1f5b85601c9b 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -55,6 +55,7 @@ static inline const unsigned char *font_data_buf(font_data_t *fd)
 }
 
 unsigned int font_data_size(font_data_t *fd);
+bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs);
 
 /*
  * Font description
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index 8c9a6762061c..c9f6328d5dda 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -12,18 +12,25 @@
  * for more details.
  */
 
+#include <linux/font.h>
 #include <linux/module.h>
-#include <linux/types.h>
 #include <linux/string.h>
+#include <linux/types.h>
+
+#include <asm/sections.h>
 #if defined(__mc68000__)
 #include <asm/setup.h>
 #endif
-#include <linux/font.h>
 
 /*
  * Helpers for font_data_t
  */
 
+static bool font_data_is_internal(font_data_t *fd)
+{
+	return is_kernel_rodata((unsigned long)fd);
+}
+
 /**
  * font_data_size - Return size of the font data in bytes
  * @fd: Font data
@@ -37,6 +44,32 @@ unsigned int font_data_size(font_data_t *fd)
 }
 EXPORT_SYMBOL_GPL(font_data_size);
 
+/**
+ * font_data_is_equal - Compares font data for equality
+ * @lhs: Left-hand side font data
+ * @rhs: Right-hand-size font data
+ *
+ * Font data is equal if is constain the same sequence of values. The
+ * helper also use the checksum, if both arguments contain it. Font data
+ * coming from different origins, internal or from user space, is never
+ * equal. Allowing this would break reference counting.
+ *
+ * Returns:
+ * True if the given font data is equal, false otherwise.
+ */
+bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs)
+{
+	if (font_data_is_internal(lhs) != font_data_is_internal(rhs))
+		return false;
+	if (font_data_size(lhs) != font_data_size(rhs))
+		return false;
+	if (FNTSUM(lhs) && FNTSUM(rhs) && FNTSUM(lhs) != FNTSUM(rhs))
+		return false;
+
+	return !memcmp(lhs, rhs, FNTSIZE(lhs));
+}
+EXPORT_SYMBOL_GPL(font_data_is_equal);
+
 /*
  * Font lookup
  */
-- 
2.53.0

