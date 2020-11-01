Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446E22A1D56
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 11:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC366E1BA;
	Sun,  1 Nov 2020 10:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A776E1BA
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 10:34:45 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id myVi2300B4C55Sk01yVi9K; Sun, 01 Nov 2020 11:29:42 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kZAcI-001vTN-Dq; Sun, 01 Nov 2020 11:29:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kZAcH-00C871-TI; Sun, 01 Nov 2020 11:29:41 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH/RFC v2] video: fbdev: atari: Fix TT High video mode
Date: Sun,  1 Nov 2020 11:29:41 +0100
Message-Id: <20201101102941.2891076-1-geert@linux-m68k.org>
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

v2:
  - Use correct base.
---
 drivers/video/fbdev/atafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index f253daa05d9d3872..5ecf3ec9f94cb720 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -495,8 +495,8 @@ static struct fb_videomode atafb_modedb[] __initdata = {
 		"tt-mid", 60, 640, 480, 31041, 120, 100, 8, 16, 140, 30,
 		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
 	}, {
-		/* 1280x960, 29 kHz, 60 Hz (TT high) */
-		"tt-high", 57, 640, 960, 31041, 120, 100, 8, 16, 140, 30,
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
