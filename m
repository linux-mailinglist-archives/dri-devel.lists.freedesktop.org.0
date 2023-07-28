Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F37668B0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B4110E6BA;
	Fri, 28 Jul 2023 09:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B5210E6BA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:21:14 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
 by michel.telenet-ops.be with bizsmtp
 id SZMC2A00Z0d1nm806ZMC3r; Fri, 28 Jul 2023 11:21:13 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPJed-002ltx-Ki;
 Fri, 28 Jul 2023 11:21:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPJeq-00AoGz-Ou;
 Fri, 28 Jul 2023 11:21:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] video: logo: LOGO should depend on FB_CORE i.s.o. FB
Date: Fri, 28 Jul 2023 11:21:11 +0200
Message-Id: <e4142b7cc9aad9975de1bc6b1c7d86ccee487e4c.1690535997.git.geert+renesas@glider.be>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If CONFIG_FB_CORE=y and CONFIG_FB=n, the frame buffer bootup logos can
no longer be enabled.  Fix this by making CONFIG_LOGO depend on
CONFIG_FB_CORE instead of CONFIG_FB, as there is no good reason for the
logo code to depend on the presence of real frame buffer device drivers.

Fixes: 55bffc8170bb5813 ("fbdev: Split frame buffer support in FB and FB_CORE symbols")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/video/Kconfig      | 2 +-
 drivers/video/logo/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index e5b1cc54cafa10d5..b694d7669d3200b1 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -63,7 +63,7 @@ if VT
 	source "drivers/video/console/Kconfig"
 endif
 
-if FB || SGI_NEWPORT_CONSOLE
+if FB_CORE || SGI_NEWPORT_CONSOLE
 	source "drivers/video/logo/Kconfig"
 
 endif
diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
index 6d6f8c08792dc897..b7d94d1dd1585a84 100644
--- a/drivers/video/logo/Kconfig
+++ b/drivers/video/logo/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig LOGO
 	bool "Bootup logo"
-	depends on FB || SGI_NEWPORT_CONSOLE
+	depends on FB_CORE || SGI_NEWPORT_CONSOLE
 	help
 	  Enable and select frame buffer bootup logos.
 
-- 
2.34.1

