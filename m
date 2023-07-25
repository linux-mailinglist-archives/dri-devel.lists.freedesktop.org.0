Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC40761DAB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 17:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A003F10E3DE;
	Tue, 25 Jul 2023 15:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6130310E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 15:52:14 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2d50:2ea4:d4e1:2af3])
 by laurent.telenet-ops.be with bizsmtp
 id RTsB2A0092TBYXr01TsBc4; Tue, 25 Jul 2023 17:52:12 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qOKKM-002Vj4-Ib;
 Tue, 25 Jul 2023 17:52:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qOKKZ-009cbZ-Mo;
 Tue, 25 Jul 2023 17:52:11 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
Date: Tue, 25 Jul 2023 17:52:06 +0200
Message-Id: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
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

If CONFIG_FB_CORE=y but CONFIG_FB=n, the frame buffer bootup logos can
no longer be enabled.  Fix this by making CONFIG_LOGO depend on
CONFIG_FB_CORE instead of CONFIG_FB, as there is no good reason for the
logo code to depend on the presence of real frame buffer device drivers.

Fixes: 55bffc8170bb5813 ("fbdev: Split frame buffer support in FB and FB_CORE symbols")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

