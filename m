Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC9183673C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FE910F305;
	Mon, 22 Jan 2024 15:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jan 2024 15:12:50 UTC
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674F510F305
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:12:50 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4TJYSm01WBz4x03w
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:06:00 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
 by baptiste.telenet-ops.be with bizsmtp
 id dr4z2B0090ZxL6o01r4zwW; Mon, 22 Jan 2024 16:04:59 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rRvqM-00GH0a-0V;
 Mon, 22 Jan 2024 16:04:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rRvr9-00CG2n-0o;
 Mon, 22 Jan 2024 16:04:59 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH] fbcon: Fix incorrect printed function name in
 fbcon_prepare_logo()
Date: Mon, 22 Jan 2024 16:04:58 +0100
Message-Id: <d15dd1d81ffebed4e5028e156f0082c44ebbf2fc.1705935864.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the boot logo does not fit, a message is printed, including a wrong
function name prefix.  Instead of correcting the function name (or using
__func__), just use "fbcon", like is done in several other messages.

While at it, modernize the call by switching to pr_info().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/video/fbdev/core/fbcon.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 63af6ab034b5f1bb..1183e7a871f8b270 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -631,8 +631,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 
 	if (logo_lines > vc->vc_bottom) {
 		logo_shown = FBCON_LOGO_CANSHOW;
-		printk(KERN_INFO
-		       "fbcon_init: disable boot-logo (boot-logo bigger than screen).\n");
+		pr_info("fbcon: disable boot-logo (boot-logo bigger than screen).\n");
 	} else {
 		logo_shown = FBCON_LOGO_DRAW;
 		vc->vc_top = logo_lines;
-- 
2.34.1

