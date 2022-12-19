Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC820650FBF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9A810E2AF;
	Mon, 19 Dec 2022 16:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D83310E002;
 Mon, 19 Dec 2022 16:05:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0796461067;
 Mon, 19 Dec 2022 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69qvRJt9dPgqQNta8R4MzEBubU4rlE+sQe1t6RNuAKU=;
 b=QTBorkF0/jrcJexym83GrqOAhTMVDvYEGm3m2hcE+ofn/1DEesjc40qGagcGmqFOIi8VML
 kPp0/BAgAb0vhHNNj2HDwUWLUqBz6Ay7SCfn8vyiyo8Jvu0lV9B1WZK7K7RacxyRDsvA4E
 vp1TMkh6hO8sSC3/Uaw2M3uoG6Voz0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465919;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69qvRJt9dPgqQNta8R4MzEBubU4rlE+sQe1t6RNuAKU=;
 b=/2sPOhMvtrkhzdSGV3gI9/CKIROCWhDl2D3pPAWtpbx8/HnrMbiv/j+1pui+bnA0+zgXiW
 AaiNk+TKvuw9OxCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4A2513910;
 Mon, 19 Dec 2022 16:05:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EDcHL76LoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 02/18] Revert "fbcon: don't lose the console font across
 generic->chip driver switch"
Date: Mon, 19 Dec 2022 17:05:00 +0100
Message-Id: <20221219160516.23436-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219160516.23436-1-tzimmermann@suse.de>
References: <20221219160516.23436-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit ae1287865f5361fa138d4d3b1b6277908b54eac9.

Always free the console font when deinitializing the framebuffer
console. Subsequent framebuffer consoles will then use the default
font. Rely on userspace to load any user-configured font for these
consoles.

Commit ae1287865f53 ("fbcon: don't lose the console font across
generic->chip driver switch") was introduced to work around losing
the font during graphics-device handover. [1][2] It kept a dangling
pointer with the font data between loading the two consoles, which is
fairly adventurous hack. It also never covered cases when the other
consoles, such as VGA text mode, where involved.

The problem has meanwhile been solved in userspace. Systemd comes
with a udev rule that re-installs the configured font when a console
comes up. [3] So the kernel workaround can be removed.

This also removes one of the two special cases triggered by setting
FBINFO_MISC_FIRMWARE in an fbdev driver.

Tested during device handover from efifb and simpledrm to radeon. Udev
reloads the configured console font for the new driver's terminal.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://bugzilla.redhat.com/show_bug.cgi?id=892340 # 1
Link: https://bugzilla.redhat.com/show_bug.cgi?id=1074624 # 2
Link: https://cgit.freedesktop.org/systemd/systemd/tree/src/vconsole/90-vconsole.rules.in?h=v222 # 3
---
 drivers/video/fbdev/core/fbcon.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 500b26d652f6..90b36b3adfd0 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -958,7 +958,7 @@ static const char *fbcon_startup(void)
 	set_blitting_type(vc, info);
 
 	/* Setup default font */
-	if (!p->fontdata && !vc->vc_font.data) {
+	if (!p->fontdata) {
 		if (!fontname[0] || !(font = find_font(fontname)))
 			font = get_default_font(info->var.xres,
 						info->var.yres,
@@ -968,8 +968,6 @@ static const char *fbcon_startup(void)
 		vc->vc_font.height = font->height;
 		vc->vc_font.data = (void *)(p->fontdata = font->data);
 		vc->vc_font.charcount = font->charcount;
-	} else {
-		p->fontdata = vc->vc_font.data;
 	}
 
 	cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
@@ -1135,9 +1133,9 @@ static void fbcon_init(struct vc_data *vc, int init)
 	ops->p = &fb_display[fg_console];
 }
 
-static void fbcon_free_font(struct fbcon_display *p, bool freefont)
+static void fbcon_free_font(struct fbcon_display *p)
 {
-	if (freefont && p->userfont && p->fontdata && (--REFCOUNT(p->fontdata) == 0))
+	if (p->userfont && p->fontdata && (--REFCOUNT(p->fontdata) == 0))
 		kfree(p->fontdata - FONT_EXTRA_WORDS * sizeof(int));
 	p->fontdata = NULL;
 	p->userfont = 0;
@@ -1172,8 +1170,8 @@ static void fbcon_deinit(struct vc_data *vc)
 	struct fb_info *info;
 	struct fbcon_ops *ops;
 	int idx;
-	bool free_font = true;
 
+	fbcon_free_font(p);
 	idx = con2fb_map[vc->vc_num];
 
 	if (idx == -1)
@@ -1184,8 +1182,6 @@ static void fbcon_deinit(struct vc_data *vc)
 	if (!info)
 		goto finished;
 
-	if (info->flags & FBINFO_MISC_FIRMWARE)
-		free_font = false;
 	ops = info->fbcon_par;
 
 	if (!ops)
@@ -1197,9 +1193,8 @@ static void fbcon_deinit(struct vc_data *vc)
 	ops->initialized = false;
 finished:
 
-	fbcon_free_font(p, free_font);
-	if (free_font)
-		vc->vc_font.data = NULL;
+	fbcon_free_font(p);
+	vc->vc_font.data = NULL;
 
 	if (vc->vc_hi_font_mask && vc->vc_screenbuf)
 		set_vc_hi_font(vc, false);
-- 
2.39.0

