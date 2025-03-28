Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F90A74C61
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487A810EA35;
	Fri, 28 Mar 2025 14:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UM22VOsQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OIsa5K8H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UM22VOsQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OIsa5K8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134CD10EA35
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:21:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 664EB1F395;
 Fri, 28 Mar 2025 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743171658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wach7mSKxEOTKG1Y61/E+/DQLPIg7UyGhX72ervRyM=;
 b=UM22VOsQPmoHAdclHmddFfVJuUHZ5jI0XLik3EwAmLtuT9JYRxM+lLeYwL/Rw+Kig3ebhM
 UBscxHxYWmt5HM2m8psl1548sFB3eMI5FDktbdjABvAYQlb0Xp14WJZp4avw5ZCc9/y8Nu
 1PMDxCYrWe6KP0tXqj9NmCLczJs7xCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743171658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wach7mSKxEOTKG1Y61/E+/DQLPIg7UyGhX72ervRyM=;
 b=OIsa5K8HMWBW+dC3HxyIMskcz2IR2uU1pQgnuFvgEp8K6Yv0nxw+Anq3ka/Z+/zvBAVW2r
 kbEU1FpWYVrY67BQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UM22VOsQ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OIsa5K8H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743171658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wach7mSKxEOTKG1Y61/E+/DQLPIg7UyGhX72ervRyM=;
 b=UM22VOsQPmoHAdclHmddFfVJuUHZ5jI0XLik3EwAmLtuT9JYRxM+lLeYwL/Rw+Kig3ebhM
 UBscxHxYWmt5HM2m8psl1548sFB3eMI5FDktbdjABvAYQlb0Xp14WJZp4avw5ZCc9/y8Nu
 1PMDxCYrWe6KP0tXqj9NmCLczJs7xCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743171658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wach7mSKxEOTKG1Y61/E+/DQLPIg7UyGhX72ervRyM=;
 b=OIsa5K8HMWBW+dC3HxyIMskcz2IR2uU1pQgnuFvgEp8K6Yv0nxw+Anq3ka/Z+/zvBAVW2r
 kbEU1FpWYVrY67BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BB0E139D4;
 Fri, 28 Mar 2025 14:20:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eNleCUqw5mdOdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Mar 2025 14:20:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, jani.nikula@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/8] drm/format-helper: Optimize 32-to-16-bpp conversion
Date: Fri, 28 Mar 2025 15:15:03 +0100
Message-ID: <20250328141709.217283-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328141709.217283-1-tzimmermann@suse.de>
References: <20250328141709.217283-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 664EB1F395
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,ffwll.ch,gmail.com,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

For ease of implementation, existing line-conversion functions
for 16-bit formats write each pixel individually. Optimize the
performance by writing multiple pixels in single 64-bit and 32-bit
stores.

v2:
- simplify address calculation (Jani)
- fix typo in commit message (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 37 ++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index daf5a6d4f2835..5098a00803d23 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -265,10 +265,45 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
 						    unsigned int pixels,
 						    u32 (*xfrm_pixel)(u32))
 {
-	__le16 *dbuf16 = dbuf;
+	__le64 *dbuf64 = dbuf;
+	__le32 *dbuf32;
+	__le16 *dbuf16;
 	const __le32 *sbuf32 = sbuf;
 	const __le32 *send32 = sbuf32 + pixels;
 
+#if defined(CONFIG_64BIT)
+	/* write 4 pixels at once */
+	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
+		u32 pix[4] = {
+			le32_to_cpup(sbuf32++),
+			le32_to_cpup(sbuf32++),
+			le32_to_cpup(sbuf32++),
+			le32_to_cpup(sbuf32++),
+		};
+		/* write output bytes in reverse order for little endianness */
+		u64 val64 = ((u64)xfrm_pixel(pix[0])) |
+			    ((u64)xfrm_pixel(pix[1]) << 16) |
+			    ((u64)xfrm_pixel(pix[2]) << 32) |
+			    ((u64)xfrm_pixel(pix[3]) << 48);
+		*dbuf64++ = cpu_to_le64(val64);
+	}
+#endif
+
+	/* write 2 pixels at once */
+	dbuf32 = (__le32 __force *)dbuf64;
+	while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 2)) {
+		u32 pix[2] = {
+			le32_to_cpup(sbuf32++),
+			le32_to_cpup(sbuf32++),
+		};
+		/* write output bytes in reverse order for little endianness */
+		u32 val32 = xfrm_pixel(pix[0]) |
+			   (xfrm_pixel(pix[1]) << 16);
+		*dbuf32++ = cpu_to_le32(val32);
+	}
+
+	/* write trailing pixel */
+	dbuf16 = (__le16 __force *)dbuf32;
 	while (sbuf32 < send32)
 		*dbuf16++ = cpu_to_le16(xfrm_pixel(le32_to_cpup(sbuf32++)));
 }
-- 
2.48.1

