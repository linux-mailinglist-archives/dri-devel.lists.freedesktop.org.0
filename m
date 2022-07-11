Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6C3570795
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ECF8F459;
	Mon, 11 Jul 2022 15:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380D08F453
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:50:40 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id trqe270124C55Sk01rqe4s; Mon, 11 Jul 2022 17:50:38 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgD-0036xD-Vl; Mon, 11 Jul 2022 17:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgD-006shx-2d; Mon, 11 Jul 2022 17:50:37 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 08/10] video: fbdev: atari: Fix VGA modes
Date: Mon, 11 Jul 2022 17:50:32 +0200
Message-Id: <d4366ec393e7b69a579d9aaf972d2d36734f1422.1657554353.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657554353.git.geert@linux-m68k.org>
References: <cover.1657554353.git.geert@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pixclock values in the vga and vga70 modes are wrong, as they should
use the 25.175 MHz clock instead of the 32 MHz clock.
Swap the left and right margins to match f25.{right,left} (struct
pixel_clock declares them in a different order), and update the hsync
lengths to match what the driver programs by default.
Correct the (wrong) floating-point vrefresh value for the vga mode.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/atafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 528478f6f30857ef..46a00e0ad5e785ac 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -494,11 +494,11 @@ static struct fb_videomode atafb_modedb[] __initdata = {
 
 	{
 		/* 640x480, 31 kHz, 60 Hz (VGA) */
-		"vga", 63.5, 640, 480, 32000, 18, 42, 31, 11, 96, 3,
+		"vga", 60, 640, 480, 39721, 42, 18, 31, 11, 100, 3,
 		0, FB_VMODE_NONINTERLACED
 	}, {
 		/* 640x400, 31 kHz, 70 Hz (VGA) */
-		"vga70", 70, 640, 400, 32000, 18, 42, 31, 11, 96, 3,
+		"vga70", 70, 640, 400, 39721, 42, 18, 31, 11, 100, 3,
 		FB_SYNC_VERT_HIGH_ACT | FB_SYNC_COMP_HIGH_ACT, FB_VMODE_NONINTERLACED
 	},
 
-- 
2.25.1

