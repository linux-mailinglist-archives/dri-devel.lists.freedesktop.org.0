Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2C2570786
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEE68F452;
	Mon, 11 Jul 2022 15:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959498F450
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:50:39 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id trqd2700e4C55Sk01rqd4B; Mon, 11 Jul 2022 17:50:38 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgD-0036wz-AP; Mon, 11 Jul 2022 17:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgC-006shN-T7; Mon, 11 Jul 2022 17:50:36 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 03/10] video: fbdev: atari: Fix inverse handling
Date: Mon, 11 Jul 2022 17:50:27 +0200
Message-Id: <b24ff02cb947e5b3a00ca74268db1b504d7346ba.1657554353.git.geert@linux-m68k.org>
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

Currently, the "inverse" option does not do anything, as it just sets a
flag, which is further unused.

Fix this by calling fb_invert_cmaps() instead, like other drivers do.
As this only affects the console colormap, this does not affect X.
Update the documentation to match the actual behavior.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 Documentation/m68k/kernel-options.rst | 4 ++--
 drivers/video/fbdev/atafb.c           | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/m68k/kernel-options.rst b/Documentation/m68k/kernel-options.rst
index cabd9419740d5ada..2008a20b43295bd5 100644
--- a/Documentation/m68k/kernel-options.rst
+++ b/Documentation/m68k/kernel-options.rst
@@ -367,8 +367,8 @@ activated by a "external:" sub-option.
 4.1.2) inverse
 --------------
 
-Invert the display. This affects both, text (consoles) and graphics
-(X) display. Usually, the background is chosen to be black. With this
+Invert the display. This affects only text consoles.
+Usually, the background is chosen to be black. With this
 option, you can make the background white.
 
 4.1.3) font
diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 172ef547ff6f4883..39c3b860a797d4bc 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -236,8 +236,6 @@ static int *MV300_reg = MV300_reg_8bit;
 #endif /* ATAFB_EXT */
 
 
-static int inverse;
-
 /*
  * struct fb_ops {
  *	* open/release and usage marking
@@ -2971,7 +2969,7 @@ static int __init atafb_setup(char *options)
 			default_par = temp;
 			mode_option = this_opt;
 		} else if (!strcmp(this_opt, "inverse"))
-			inverse = 1;
+			fb_invert_cmaps();
 		else if (!strncmp(this_opt, "hwscroll_", 9)) {
 			hwscroll = simple_strtoul(this_opt + 9, NULL, 10);
 			if (hwscroll < 0)
-- 
2.25.1

