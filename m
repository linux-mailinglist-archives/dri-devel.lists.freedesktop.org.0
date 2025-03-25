Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A6DA6EE7B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4009110E18B;
	Tue, 25 Mar 2025 11:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="N7J+3Qi8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Id4vCpyL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N7J+3Qi8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Id4vCpyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D8610E532
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:04:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B06F11F397;
 Tue, 25 Mar 2025 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zek0a3KNDjFa4iOiurR5R8GSmCA/Jinby2QvF1mahZE=;
 b=N7J+3Qi8T6blSofLyifFqkscXQTd5p6Ptx4eMHu4ITMP71f9v6JKGZVeJVCL3UDaiA4oS4
 Sy/cgEMCZOvKgRbcaDr0U/KowFAq7bA6TKh4ssSiiZ3K7NCTyEnLZe+cH0q5bxdO2y/Hqz
 7aC+ftBclxSwXHOR2UyTV1bbEdwqKsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zek0a3KNDjFa4iOiurR5R8GSmCA/Jinby2QvF1mahZE=;
 b=Id4vCpyLBuvq/gTt1v/InNiKl8YLW74oFESWNPW50FgjQvoHUsaAT+ld8ZrEZrJxlrF3kG
 jlpvmnB6NxiOsHBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zek0a3KNDjFa4iOiurR5R8GSmCA/Jinby2QvF1mahZE=;
 b=N7J+3Qi8T6blSofLyifFqkscXQTd5p6Ptx4eMHu4ITMP71f9v6JKGZVeJVCL3UDaiA4oS4
 Sy/cgEMCZOvKgRbcaDr0U/KowFAq7bA6TKh4ssSiiZ3K7NCTyEnLZe+cH0q5bxdO2y/Hqz
 7aC+ftBclxSwXHOR2UyTV1bbEdwqKsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zek0a3KNDjFa4iOiurR5R8GSmCA/Jinby2QvF1mahZE=;
 b=Id4vCpyLBuvq/gTt1v/InNiKl8YLW74oFESWNPW50FgjQvoHUsaAT+ld8ZrEZrJxlrF3kG
 jlpvmnB6NxiOsHBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A1BA13A41;
 Tue, 25 Mar 2025 11:04:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0DqIHLCN4meFVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 11:04:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/8] drm/format-helper: Optimize 32-to-16-bpp conversion
Date: Tue, 25 Mar 2025 11:31:12 +0100
Message-ID: <20250325110407.81107-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325110407.81107-1-tzimmermann@suse.de>
References: <20250325110407.81107-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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
performance by writing mulitple pixels in single 64-bit and 32-bit
stores.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 40 ++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b9c9c712aa9c..66137df85725 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -262,10 +262,48 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
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
+	send32 -= pixels & GENMASK(1, 0);
+	while (sbuf32 < send32) {
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
+	send32 += pixels & GENMASK(1, 1);
+#endif
+
+	/* write 2 pixels at once */
+	dbuf32 = (__le32 __force *)dbuf64;
+	while (sbuf32 < send32) {
+		u32 pix[2] = {
+			le32_to_cpup(sbuf32++),
+			le32_to_cpup(sbuf32++),
+		};
+		/* write output bytes in reverse order for little endianness */
+		u32 val32 = xfrm_pixel(pix[0]) |
+			   (xfrm_pixel(pix[1]) << 16);
+		*dbuf32++ = cpu_to_le32(val32);
+	}
+	send32 += pixels & GENMASK(0, 0);
+
+	/* write trailing pixel */
+	dbuf16 = (__le16 __force *)dbuf32;
 	while (sbuf32 < send32)
 		*dbuf16++ = cpu_to_le16(xfrm_pixel(le32_to_cpup(sbuf32++)));
 }
-- 
2.48.1

