Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749C88313A4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 08:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973D010E731;
	Thu, 18 Jan 2024 07:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722C910E718
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:58:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 06D35B815CC;
 Thu, 18 Jan 2024 07:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CBFC43399;
 Thu, 18 Jan 2024 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564729;
 bh=7/5TAfily06+zDgTtFfNscdJe8rylw0W1s4rmhLZJx4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o7XjKTyb7ha08zfAft6E4AXMu7IPPDHT2GEBd7xqRIWlP4MN/r6eXbObCNxLpcDe3
 jYm3t4iaLrMGiJnOrnGKzyGd0OJG6YLcHx29qyG1c6CtpxkHmJVSksBMHovAO4Umpi
 q8rxjEXalAJReXbTj0Nkbg6Cfwf2F1dgSKjKmubihiptBVfCL2OoIeKroK+hpMwiN7
 246mqDzM5bqHaH63f+Q7Gfs5tBmZwvbbVyy1bT6CCo/+7yMfID1CmUT+gNqVzqimDj
 S4YGfnDLLb/Mz3r7Y/KER+320HfaRw06a8nt8CFMkZzlsT0rd9NQfs2qTy/j43LU4G
 WHv3wkn8ev3fw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 23/45] tty: vt: eliminate unneeded consw::con_putc()
 implementations
Date: Thu, 18 Jan 2024 08:57:34 +0100
Message-ID: <20240118075756.10541-24-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118075756.10541-1-jirislaby@kernel.org>
References: <20240118075756.10541-1-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All these consw::con_putc() implementations do the same as
consw::con_putcs() (only for one charattr) or even call
consw::con_putcs() on their own.

Drop them, as thanks to the new con_putc() helper in the previous patch,
the console code performs this already -- exactly if consw::con_putc()
is missing (NULL).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/video/console/mdacon.c   |  6 ------
 drivers/video/console/sticon.c   | 12 ------------
 drivers/video/console/vgacon.c   |  2 --
 drivers/video/fbdev/core/fbcon.c |  9 ---------
 4 files changed, 29 deletions(-)

diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
index 2ff2c9394d40..01e779943c00 100644
--- a/drivers/video/console/mdacon.c
+++ b/drivers/video/console/mdacon.c
@@ -427,11 +427,6 @@ static inline u16 *mda_addr(unsigned int x, unsigned int y)
 	return mda_vram_base + y * mda_num_columns + x;
 }
 
-static void mdacon_putc(struct vc_data *c, int ch, int y, int x)
-{
-	scr_writew(mda_convert_attr(ch), mda_addr(x, y));
-}
-
 static void mdacon_putcs(struct vc_data *c, const unsigned short *s,
 		         int count, int y, int x)
 {
@@ -536,7 +531,6 @@ static const struct consw mda_con = {
 	.con_init =		mdacon_init,
 	.con_deinit =		mdacon_deinit,
 	.con_clear =		mdacon_clear,
-	.con_putc =		mdacon_putc,
 	.con_putcs =		mdacon_putcs,
 	.con_cursor =		mdacon_cursor,
 	.con_scroll =		mdacon_scroll,
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index b1d972d9a31c..2f87b5909d0d 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -71,17 +71,6 @@ static const char *sticon_startup(void)
     return "STI console";
 }
 
-static void sticon_putc(struct vc_data *conp, int c, int ypos, int xpos)
-{
-    if (vga_is_gfx || console_blanked)
-	    return;
-
-    if (conp->vc_mode != KD_TEXT)
-    	    return;
-
-    sti_putc(sticon_sti, c, ypos, xpos, font_data[conp->vc_num]);
-}
-
 static void sticon_putcs(struct vc_data *conp, const unsigned short *s,
 			 int count, int ypos, int xpos)
 {
@@ -362,7 +351,6 @@ static const struct consw sti_con = {
 	.con_init		= sticon_init,
 	.con_deinit		= sticon_deinit,
 	.con_clear		= sticon_clear,
-	.con_putc		= sticon_putc,
 	.con_putcs		= sticon_putcs,
 	.con_cursor		= sticon_cursor,
 	.con_scroll		= sticon_scroll,
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index c6bd4acbe1d2..2cb75be74c38 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -1193,7 +1193,6 @@ static bool vgacon_scroll(struct vc_data *c, unsigned int t, unsigned int b,
 
 static void vgacon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 			 unsigned int width) { }
-static void vgacon_putc(struct vc_data *vc, int c, int ypos, int xpos) { }
 static void vgacon_putcs(struct vc_data *vc, const unsigned short *s,
 			 int count, int ypos, int xpos) { }
 
@@ -1203,7 +1202,6 @@ const struct consw vga_con = {
 	.con_init = vgacon_init,
 	.con_deinit = vgacon_deinit,
 	.con_clear = vgacon_clear,
-	.con_putc = vgacon_putc,
 	.con_putcs = vgacon_putcs,
 	.con_cursor = vgacon_cursor,
 	.con_scroll = vgacon_scroll,
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 8a31a36483ea..38de0f8723aa 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1292,14 +1292,6 @@ static void fbcon_putcs(struct vc_data *vc, const unsigned short *s,
 			   get_color(vc, info, scr_readw(s), 0));
 }
 
-static void fbcon_putc(struct vc_data *vc, int c, int ypos, int xpos)
-{
-	unsigned short chr;
-
-	scr_writew(c, &chr);
-	fbcon_putcs(vc, &chr, 1, ypos, xpos);
-}
-
 static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
@@ -3159,7 +3151,6 @@ static const struct consw fb_con = {
 	.con_init 		= fbcon_init,
 	.con_deinit 		= fbcon_deinit,
 	.con_clear 		= fbcon_clear,
-	.con_putc 		= fbcon_putc,
 	.con_putcs 		= fbcon_putcs,
 	.con_cursor 		= fbcon_cursor,
 	.con_scroll 		= fbcon_scroll,
-- 
2.43.0

