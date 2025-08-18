Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13EB29F85
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F4210E429;
	Mon, 18 Aug 2025 10:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Yc236tV8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2PIfyHv4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yc236tV8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2PIfyHv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF2210E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:49:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0A6621249;
 Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+T4s3S8FpckczjETGe0in4ru7zspdxpHIBUMeqKfD6o=;
 b=Yc236tV8+OIyMthNFnJvZh7gYsYZyvqAUu3QNTVpLZ7H6QC6PfC/hplWW9LS7ljS0yIL2O
 9ieGn2KUwUQibeNylnQOeh5lQrB8/FjwRh971/hIZo+FLJxTlJCRjKrD7D9DDvBN7Q8v0Z
 Z82plxmwNG2pJPyhFMhQhd9qJ773mJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+T4s3S8FpckczjETGe0in4ru7zspdxpHIBUMeqKfD6o=;
 b=2PIfyHv4DYsMubXg6cbm1hqLKpbReVay+x/kINrIfTbiFwbsb+J1hEKeZzR2CDDpoq5VtX
 1oKQcLVrrK4S/dBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+T4s3S8FpckczjETGe0in4ru7zspdxpHIBUMeqKfD6o=;
 b=Yc236tV8+OIyMthNFnJvZh7gYsYZyvqAUu3QNTVpLZ7H6QC6PfC/hplWW9LS7ljS0yIL2O
 9ieGn2KUwUQibeNylnQOeh5lQrB8/FjwRh971/hIZo+FLJxTlJCRjKrD7D9DDvBN7Q8v0Z
 Z82plxmwNG2pJPyhFMhQhd9qJ773mJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+T4s3S8FpckczjETGe0in4ru7zspdxpHIBUMeqKfD6o=;
 b=2PIfyHv4DYsMubXg6cbm1hqLKpbReVay+x/kINrIfTbiFwbsb+J1hEKeZzR2CDDpoq5VtX
 1oKQcLVrrK4S/dBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 924A913686;
 Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WORLIkkFo2hQVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 10:49:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/6] fbcon: Set rotate_font callback with related callbacks
Date: Mon, 18 Aug 2025 12:36:38 +0200
Message-ID: <20250818104655.235001-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818104655.235001-1-tzimmermann@suse.de>
References: <20250818104655.235001-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

The field struct fbcon.rotate_font points to fbcon_rotate_font() if
the console is rotated. Set the callback in the same place as the other
callbacks. Prepares for declaring all fbcon callbacks in a dedicated
struct type.

If not rotated, fbcon_set_bitops() still clears the callback to NULL.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon_ccw.c    | 1 +
 drivers/video/fbdev/core/fbcon_cw.c     | 1 +
 drivers/video/fbdev/core/fbcon_rotate.c | 4 +---
 drivers/video/fbdev/core/fbcon_rotate.h | 2 ++
 drivers/video/fbdev/core/fbcon_ud.c     | 1 +
 5 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 0f47eb4a792d..4c1a40864e84 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -398,4 +398,5 @@ void fbcon_rotate_ccw(struct fbcon *confb)
 	confb->clear_margins = ccw_clear_margins;
 	confb->cursor = ccw_cursor;
 	confb->update_start = ccw_update_start;
+	confb->rotate_font = fbcon_rotate_font;
 }
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index 9d9cd316b74f..ac3af039fe4a 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -381,4 +381,5 @@ void fbcon_rotate_cw(struct fbcon *confb)
 	confb->clear_margins = cw_clear_margins;
 	confb->cursor = cw_cursor;
 	confb->update_start = cw_update_start;
+	confb->rotate_font = fbcon_rotate_font;
 }
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index acf8e72ae00b..8100d6f28e70 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -18,7 +18,7 @@
 #include "fbcon.h"
 #include "fbcon_rotate.h"
 
-static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
+int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 {
 	struct fbcon *confb = info->fbcon_par;
 	int len, err = 0;
@@ -95,8 +95,6 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 
 void fbcon_set_rotate(struct fbcon *confb)
 {
-	confb->rotate_font = fbcon_rotate_font;
-
 	switch (confb->rotate) {
 	case FB_ROTATE_CW:
 		fbcon_rotate_cw(confb);
diff --git a/drivers/video/fbdev/core/fbcon_rotate.h b/drivers/video/fbdev/core/fbcon_rotate.h
index 5909513bd7b4..c378687dd09d 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.h
+++ b/drivers/video/fbdev/core/fbcon_rotate.h
@@ -90,6 +90,8 @@ static inline void rotate_ccw(const char *in, char *out, u32 width, u32 height)
 	}
 }
 
+int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc);
+
 extern void fbcon_rotate_cw(struct fbcon *confb);
 extern void fbcon_rotate_ud(struct fbcon *confb);
 extern void fbcon_rotate_ccw(struct fbcon *confb);
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index b0ab9babf639..74e1331fae33 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -425,4 +425,5 @@ void fbcon_rotate_ud(struct fbcon *confb)
 	confb->clear_margins = ud_clear_margins;
 	confb->cursor = ud_cursor;
 	confb->update_start = ud_update_start;
+	confb->rotate_font = fbcon_rotate_font;
 }
-- 
2.50.1

