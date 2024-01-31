Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875168443C9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 17:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CE910FB23;
	Wed, 31 Jan 2024 16:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14910FB20
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 16:10:02 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4TQ6Rq01wTz4wyKp
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 17:09:27 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
 by andre.telenet-ops.be with bizsmtp
 id hU8R2B0094efzLr01U8Rmn; Wed, 31 Jan 2024 17:08:25 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rVD7d-00GrUM-1K;
 Wed, 31 Jan 2024 17:08:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rVD8T-008lTG-9T;
 Wed, 31 Jan 2024 17:08:25 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH
Date: Wed, 31 Jan 2024 17:08:23 +0100
Message-Id: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit f402f7a02af6956d ("staging: board: Remove Armadillo-800-EVA
board staging code"), there are no more users of the legacy SuperH
Mobile LCDC framebuffer driver on Renesas ARM platforms.  All former
users on these platforms have been converted to the SH-Mobile DRM
driver, using DT.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Commit f402f7a02af6956d is in staging-next (next-20240129 and later).
---
 drivers/video/fbdev/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 2d0bcc1d786e50bb..b688900bb67eed55 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1554,7 +1554,7 @@ config FB_FSL_DIU
 config FB_SH_MOBILE_LCDC
 	tristate "SuperH Mobile LCDC framebuffer support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
-	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
+	depends on SUPERH || COMPILE_TEST
 	depends on FB_DEVICE
 	select FB_BACKLIGHT
 	select FB_DEFERRED_IO
-- 
2.34.1

