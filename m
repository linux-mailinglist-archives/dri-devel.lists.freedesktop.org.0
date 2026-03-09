Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CMFIZjWrmlhJAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:18:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3710023A623
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A66310E505;
	Mon,  9 Mar 2026 14:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="koGCXSmG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xqiys0qg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="koGCXSmG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xqiys0qg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2139810E504
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 14:17:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 331114D246;
 Mon,  9 Mar 2026 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773065852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWzmPpeiXpnE41gcoTXD2KgTeEwpYCVbgY+rouAHnjs=;
 b=koGCXSmGU9uGLrsJ6fKCSXVAvSfkW0kpe42ZgugU2XgUHS4JerP8FXYjGYmCg1m308iEpb
 FXEO/cfuwBHtDZWBZkydRe5L0yuHtqNBB/CS2/gqpXs/jUGyOdb0ygSTRw3kG36zWR6KjQ
 Lgh2Pie6bMS52bm/SSXY4mT6AyDQ+6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773065852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWzmPpeiXpnE41gcoTXD2KgTeEwpYCVbgY+rouAHnjs=;
 b=Xqiys0qgC6VNeeDQ8RhsU+/fcaX8wmzDTRGJV/15+HRbgOJcSasEqcZIly43CoNAkd7GJ9
 7xo5enWZW7tv4ZCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773065852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWzmPpeiXpnE41gcoTXD2KgTeEwpYCVbgY+rouAHnjs=;
 b=koGCXSmGU9uGLrsJ6fKCSXVAvSfkW0kpe42ZgugU2XgUHS4JerP8FXYjGYmCg1m308iEpb
 FXEO/cfuwBHtDZWBZkydRe5L0yuHtqNBB/CS2/gqpXs/jUGyOdb0ygSTRw3kG36zWR6KjQ
 Lgh2Pie6bMS52bm/SSXY4mT6AyDQ+6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773065852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWzmPpeiXpnE41gcoTXD2KgTeEwpYCVbgY+rouAHnjs=;
 b=Xqiys0qgC6VNeeDQ8RhsU+/fcaX8wmzDTRGJV/15+HRbgOJcSasEqcZIly43CoNAkd7GJ9
 7xo5enWZW7tv4ZCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECEA63EF3B;
 Mon,  9 Mar 2026 14:17:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cIVoOHvWrmldPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Mar 2026 14:17:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 10/13] lib/fonts: Compare font data for equality with
 font_data_is_equal()
Date: Mon,  9 Mar 2026 15:14:52 +0100
Message-ID: <20260309141723.137364-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309141723.137364-1-tzimmermann@suse.de>
References: <20260309141723.137364-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
X-Rspamd-Queue-Id: 3710023A623
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
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

v3:
- rebase onto font_data_{get,put}()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/newport_con.c |  4 +---
 drivers/video/fbdev/core/fbcon.c    |  7 +------
 include/linux/font.h                |  1 +
 lib/fonts/fonts.c                   | 26 ++++++++++++++++++++++++++
 4 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 43a1a4f41057..1bc3cb1ea116 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -529,9 +529,7 @@ static int newport_set_font(int unit, const struct console_font *op,
 
 	/* check if font is already used by other console */
 	for (i = 0; i < MAX_NR_CONSOLES; i++) {
-		if (font_data[i] != FONT_DATA
-		    && font_data_size(font_data[i]) == size
-		    && !memcmp(font_data[i], new_data, size)) {
+		if (font_data_is_equal(font_data[i], new_data)) {
 			font_data_put(new_data);
 			/* current font is the same as the new one */
 			if (i == unit)
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index ac59480c98cb..00255ac92e42 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2540,13 +2540,8 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	FNTSUM(new_data) = csum;
 	/* Check if the same font is on some other console already */
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
-		struct vc_data *tmp = vc_cons[i].d;
-
 		if (fb_display[i].fontdata &&
-		    FNTSUM(fb_display[i].fontdata) == csum &&
-		    font_data_size(fb_display[i].fontdata) == size &&
-		    tmp->vc_font.width == w &&
-		    !memcmp(fb_display[i].fontdata, new_data, size)) {
+		    font_data_is_equal(fb_display[i].fontdata, new_data)) {
 			font_data_get(fb_display[i].fontdata);
 			font_data_put(new_data);
 			new_data = fb_display[i].fontdata;
diff --git a/include/linux/font.h b/include/linux/font.h
index dd319d0f0201..58bf3c64cabb 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -57,6 +57,7 @@ static inline const unsigned char *font_data_buf(font_data_t *fd)
 void font_data_get(font_data_t *fd);
 bool font_data_put(font_data_t *fd);
 unsigned int font_data_size(font_data_t *fd);
+bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs);
 
 /*
  * Font description
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index d25efd8d6c31..3fb76d185647 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -110,6 +110,32 @@ unsigned int font_data_size(font_data_t *fd)
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

