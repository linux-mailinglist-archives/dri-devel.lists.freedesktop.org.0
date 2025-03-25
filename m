Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D899A6EE7C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0258B10E532;
	Tue, 25 Mar 2025 11:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EsUwJ08A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CS5gd06X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x03JgFh1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p2jalhIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA5A10E532
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:04:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F18FE1F449;
 Tue, 25 Mar 2025 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBM9J2wMiuCcYhA4thfPDxIUSvwPc5XUMTLd08O5Njk=;
 b=EsUwJ08ASFnow++bz5layDzzE0929GK3p/DaW9ChQtFABmZCoetaDcelBnk9ENKdTj5WMx
 4dTc+2OVD9fh5r4sb+NzLo2anUWQcRarerYl7ERQXhZKcoz/vGGQt/tRGm59by5KNG29aP
 O2vWgHU1a7EpzwGVHTe+DQF3ZBd7Kkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBM9J2wMiuCcYhA4thfPDxIUSvwPc5XUMTLd08O5Njk=;
 b=CS5gd06XePwlKtz6DDrM6rN8QTNjXtYfrstQFIaHxAzwpN1ZDOaCrEDhuPVvn/F/rxp1AC
 h8mI63utNj5zbGAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=x03JgFh1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p2jalhIo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBM9J2wMiuCcYhA4thfPDxIUSvwPc5XUMTLd08O5Njk=;
 b=x03JgFh1/77WFnb/yQPv6Fb+6SaLNPtM+7j8gG7BO30qJvTwHOmqQtc+s5GEQaijBe2RgE
 BcfFQOIBh7SURwAIQOqfx+n7Ey7KE261zRVMdr2S73UyUuHFGKLvW6YyKhdt9lhBdhLDf+
 16KA8Yo0EKCRIVfucAIcVycars+iZwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBM9J2wMiuCcYhA4thfPDxIUSvwPc5XUMTLd08O5Njk=;
 b=p2jalhIok0GeYxZ193lRV7CVAEJ5J1qlsxGe1pgFm/COZGExgkJyAiqCrKq82NQF6IkVBT
 L0IM+TLJ17IfvEAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B753413957;
 Tue, 25 Mar 2025 11:04:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oF1oK7CN4meFVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 11:04:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/8] drm/format-helper: Optimize 32-to-8-bpp conversion
Date: Tue, 25 Mar 2025 11:31:13 +0100
Message-ID: <20250325110407.81107-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325110407.81107-1-tzimmermann@suse.de>
References: <20250325110407.81107-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F18FE1F449
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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
for 8-bit formats write each pixel individually. Optimize the
performance by writing mulitple pixels in a single 32-bit store.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 66137df85725..73833db28c3c 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -250,10 +250,31 @@ static __always_inline void drm_fb_xfrm_line_32to8(void *dbuf, const void *sbuf,
 						   unsigned int pixels,
 						   u32 (*xfrm_pixel)(u32))
 {
-	u8 *dbuf8 = dbuf;
+	__le32 *dbuf32 = dbuf;
+	u8 *dbuf8;
 	const __le32 *sbuf32 = sbuf;
 	const __le32 *send32 = sbuf32 + pixels;
 
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
+		u32 val32 = xfrm_pixel(pix[0]) |
+			   (xfrm_pixel(pix[1]) << 8) |
+			   (xfrm_pixel(pix[2]) << 16) |
+			   (xfrm_pixel(pix[3]) << 24);
+		*dbuf32++ = cpu_to_le32(val32);
+	}
+	send32 += pixels & GENMASK(1, 0);
+
+	/* write trailing pixels */
+	dbuf8 = (u8 __force *)dbuf32;
 	while (sbuf32 < send32)
 		*dbuf8++ = xfrm_pixel(le32_to_cpup(sbuf32++));
 }
-- 
2.48.1

