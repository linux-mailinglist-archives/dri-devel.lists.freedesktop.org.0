Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE4A2A1D55
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 11:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECDB6E1B8;
	Sun,  1 Nov 2020 10:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Sun, 01 Nov 2020 10:33:09 UTC
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6965E6E1BA
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 10:33:09 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id myU1230054C55Sk06yU1qi; Sun, 01 Nov 2020 11:28:01 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kZAae-001vQR-SD; Sun, 01 Nov 2020 11:28:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kZAae-00C7zY-Aj; Sun, 01 Nov 2020 11:28:00 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH/RFC] video: fbdev: atari: Fix TT High video mode
Date: Sun,  1 Nov 2020 11:27:59 +0100
Message-Id: <20201101102759.2890612-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The horizontal resolution (640) for the TT High video mode (1280x960) is
definitely bogus.  While fixing that, correct the timings to match the
TTM195 service manual.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Untested on actual hardware, hence the RFC.
---
 drivers/video/fbdev/atafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 198ed539366f21a3..5ecf3ec9f94cb720 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -495,8 +495,8 @@ static struct fb_videomode atafb_modedb[] __initdata = {
 		"tt-mid", 60, 640, 480, 31041, 120, 100, 8, 16, 140, 30,
 		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
 	}, {
-		/* 1280x960, 29 kHz, 60 Hz (TT high) */
-		"tt-high", 57, 1280, 960, 31041, 120, 100, 8, 16, 140, 30,
+		/* 1280x960, 72 kHz, 72 Hz (TT high) */
+		"tt-high", 57, 1280, 960, 7761, 260, 60, 36, 4, 192, 4,
 		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
 	},
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
