Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA1E4B6AC0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 12:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8307F10E448;
	Tue, 15 Feb 2022 11:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAAB10E44A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 11:26:37 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8c73:faf1:1d11:4a47])
 by michel.telenet-ops.be with bizsmtp
 id vPMY2600n3BmCM306PMZ0u; Tue, 15 Feb 2022 12:21:33 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nJvtk-000rqd-Gw; Tue, 15 Feb 2022 12:21:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nJvtk-00B34n-50; Tue, 15 Feb 2022 12:21:32 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/3] video: fbdev: atari: Fix TT High video mode
Date: Tue, 15 Feb 2022 12:21:24 +0100
Message-Id: <20220215112126.2633383-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215112126.2633383-1-geert@linux-m68k.org>
References: <20220215112126.2633383-1-geert@linux-m68k.org>
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
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The horizontal resolution (640) for the TT High video mode (1280x960) is
definitely bogus.  While fixing that, correct the timings to match the
TTM195 service manual.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Untested on actual hardware.

v3:
  - Adjust pixclock from 7761 to 7760 to match 4 * 32.215905 MHz
    crystal oscillator frequency,
  - Make it part of a series.

v2[1]:
  - Use correct base.

[1] https://lore.kernel.org/r/20201101102759.2890612-1-geert@linux-m68k.org/
---
 drivers/video/fbdev/atafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index e3812a8ff55a4fb8..a9f25cab4a1e6737 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -487,8 +487,8 @@ static struct fb_videomode atafb_modedb[] __initdata = {
 		"tt-mid", 60, 640, 480, 31041, 120, 100, 8, 16, 140, 30,
 		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
 	}, {
-		/* 1280x960, 29 kHz, 60 Hz (TT high) */
-		"tt-high", 57, 640, 960, 31041, 120, 100, 8, 16, 140, 30,
+		/* 1280x960, 72 kHz, 72 Hz (TT high) */
+		"tt-high", 57, 1280, 960, 7760, 260, 60, 36, 4, 192, 4,
 		0, FB_VMODE_NONINTERLACED | FB_VMODE_YWRAP
 	},
 
-- 
2.25.1

