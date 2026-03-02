Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH+bFP2apWmfEwYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E891DA789
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70D210E50A;
	Mon,  2 Mar 2026 14:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VtUiwLca";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="51JqJ04N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VtUiwLca";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="51JqJ04N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E50310E507
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:13:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 165735BD7A;
 Mon,  2 Mar 2026 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuMyw98BBc1i/ocDzpRA4GQMbQA8MGjbmzxVCApHgSM=;
 b=VtUiwLcamGe4Q8T4S5xmv4lb63bVtR4FGL1MLwc7wTf9rxs/HARJ4J84bUdc+Ocb8/e1mC
 9mnAjJT2xb9eQx2/5sCz9qhAo1Y/gBiWBy7a/uUlWod2Pq6kP3Zg0WeshefIwgxJP1PUEx
 A97aLghu5X77SOBjmNuNF9Zno8KfKo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuMyw98BBc1i/ocDzpRA4GQMbQA8MGjbmzxVCApHgSM=;
 b=51JqJ04NNwQ+9Lzj4/YDGU1IF7ajptTDdnaSg+hlnqwnP2MzIh3ojtfJZ35FSkCvSclgHk
 1FTyreUz7z++EnBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VtUiwLca;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=51JqJ04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772460781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuMyw98BBc1i/ocDzpRA4GQMbQA8MGjbmzxVCApHgSM=;
 b=VtUiwLcamGe4Q8T4S5xmv4lb63bVtR4FGL1MLwc7wTf9rxs/HARJ4J84bUdc+Ocb8/e1mC
 9mnAjJT2xb9eQx2/5sCz9qhAo1Y/gBiWBy7a/uUlWod2Pq6kP3Zg0WeshefIwgxJP1PUEx
 A97aLghu5X77SOBjmNuNF9Zno8KfKo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772460781;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuMyw98BBc1i/ocDzpRA4GQMbQA8MGjbmzxVCApHgSM=;
 b=51JqJ04NNwQ+9Lzj4/YDGU1IF7ajptTDdnaSg+hlnqwnP2MzIh3ojtfJZ35FSkCvSclgHk
 1FTyreUz7z++EnBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9B703EA69;
 Mon,  2 Mar 2026 14:13:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CJH2M+yapWleKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 14:13:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/13] vt: Calculate font-buffer size with vc_font_size()
Date: Mon,  2 Mar 2026 15:08:38 +0100
Message-ID: <20260302141255.518657-5-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: B5E891DA789
X-Rspamd-Action: no action

In fbcon, fbcon_resize() computes the size of the font buffer from the
values stored in vc_font. Move these calculations to the dedicated helpers
vc_font_pitch() and vc_font_size().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon.c |  9 ++-------
 include/linux/console_struct.h   | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 247bb90c08d3..103e91c8d874 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2037,7 +2037,6 @@ static void updatescrollmode(struct fbcon_display *p,
 }
 
 #define PITCH(w) (((w) + 7) >> 3)
-#define CALC_FONTSZ(h, p, c) ((h) * (p) * (c)) /* size = height * pitch * charcount */
 
 static int fbcon_resize(struct vc_data *vc, unsigned int width,
 			unsigned int height, bool from_user)
@@ -2049,8 +2048,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 	int x_diff, y_diff, virt_w, virt_h, virt_fw, virt_fh;
 
 	if (p->userfont && FNTSIZE(vc->vc_font.data)) {
-		int size;
-		int pitch = PITCH(vc->vc_font.width);
+		unsigned int size = vc_font_size(&vc->vc_font);
 
 		/*
 		 * If user font, ensure that a possible change to user font
@@ -2059,10 +2057,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 		 * charcount can change and cannot be used to determine the
 		 * font data allocated size.
 		 */
-		if (pitch <= 0)
-			return -EINVAL;
-		size = CALC_FONTSZ(vc->vc_font.height, pitch, vc->vc_font.charcount);
-		if (size > FNTSIZE(vc->vc_font.data))
+		if (!size || size > FNTSIZE(vc->vc_font.data))
 			return -EINVAL;
 	}
 
diff --git a/include/linux/console_struct.h b/include/linux/console_struct.h
index 7fdcae6ed49c..fbb5dd5f6761 100644
--- a/include/linux/console_struct.h
+++ b/include/linux/console_struct.h
@@ -83,6 +83,34 @@ struct vc_font {
 	const unsigned char *data;
 };
 
+/**
+ * vc_font_pitch - Calculates the number of bytes between two adjacent scanlines
+ * @font: The VC font
+ *
+ * Returns:
+ * The number of bytes between two adjacent scanlines in the font data
+ */
+static inline unsigned int vc_font_pitch(const struct vc_font *font)
+{
+	return DIV_ROUND_UP(font->width, 8);
+}
+
+/**
+ * vc_font_size - Calculates the size of the font data in bytes
+ * @font: The VC font
+ *
+ * vc_font_size() calculates the number of bytes of font data in the
+ * font specified by @font. The function calculates the size from the
+ * font parameters.
+ *
+ * Returns:
+ * The size of the font data in bytes.
+ */
+static inline unsigned int vc_font_size(const struct vc_font *font)
+{
+	return font->height * vc_font_pitch(font) * font->charcount;
+}
+
 /*
  * Example: vc_data of a console that was scrolled 3 lines down.
  *
-- 
2.53.0

