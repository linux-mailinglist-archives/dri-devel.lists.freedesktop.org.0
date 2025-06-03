Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183A8ACCB14
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 18:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048DE10E5C5;
	Tue,  3 Jun 2025 16:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oQmq8kfc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qz61EFl2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FFxHicqc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i6OHtlHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FD410E5C5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 16:15:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E51AC2192D;
 Tue,  3 Jun 2025 16:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748967340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+hUXKsw+XdrLsCxboRt50/8rmWxUAwRQPgZpo9H7SzU=;
 b=oQmq8kfc8PLXcAgCRff+bO+qQGxQFiLRQsxdxZ/afbak582s3UKSow0b578DFYNfpn5fv5
 ZVt7QXGXOLVl1bXifCaAK2LAZBdk1lW4cwLWyrz9NUujmR0KOjXLQDL4lrf5cn28j0ltih
 m5eLPZ8Fgt0/wjweY1oKkUxELfRMPMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748967340;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+hUXKsw+XdrLsCxboRt50/8rmWxUAwRQPgZpo9H7SzU=;
 b=Qz61EFl2QQ1jLhifKWe5ZI7pBfP7Z4Yrjru4QXSv+wRyl2mkRl4t/gGAtRc8VzivSncPws
 xanFdnUmwRr3nmBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FFxHicqc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=i6OHtlHN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748967339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+hUXKsw+XdrLsCxboRt50/8rmWxUAwRQPgZpo9H7SzU=;
 b=FFxHicqc3JJvvR7QNAhOlt/eXKxeK7//nO3yrM5QhUpzymOHeERYB4jOs/7KliLqvpaXwF
 sHv3F0jmpLTBprpwTE5QiCUCHWHYwrOLjVeFMP8C8UiFKZlBvTn2XG7tW6PeIvEIj+AEC4
 UdeLwnVB/gDtS9ujc0xX6cvST8mZq5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748967339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+hUXKsw+XdrLsCxboRt50/8rmWxUAwRQPgZpo9H7SzU=;
 b=i6OHtlHNDjQIzbu3R0SxgGVfAvf/ZAinUVUSD2XhIrbXDRGn/33QVchDnSaDrrp357odxO
 VXQOhJTaST0HnEDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBA9313A92;
 Tue,  3 Jun 2025 16:15:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sTAiLKsfP2h3RgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Jun 2025 16:15:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/format-helper: Normalize BT.601 factors to 256
Date: Tue,  3 Jun 2025 18:11:50 +0200
Message-ID: <20250603161158.423962-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E51AC2192D
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid, suse.de:dkim, suse.de:email]
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

BT.601 weights RGB components by certain factors to convert the
color to grayscale. Normalize the constants to 256 instead of 10.
Allows for slightly more precise rounding. The division by 256 can
be compiled as an 8-bit shift, which might be faster on some hardware.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
index 9f857bfa368d..3020ff267513 100644
--- a/drivers/gpu/drm/drm_format_internal.h
+++ b/drivers/gpu/drm/drm_format_internal.h
@@ -42,7 +42,7 @@ static inline u32 drm_pixel_xrgb8888_to_r8_bt601(u32 pix)
 	u32 b =  pix & 0x000000ff;
 
 	/* ITU-R BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
-	return (3 * r + 6 * g + b) / 10;
+	return (77 * r + 150 * g + 29 * b) / 256;
 }
 
 static inline u32 drm_pixel_xrgb8888_to_rgb332(u32 pix)
-- 
2.49.0

