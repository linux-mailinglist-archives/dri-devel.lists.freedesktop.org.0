Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B3B36A8F0
	for <lists+dri-devel@lfdr.de>; Sun, 25 Apr 2021 20:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9906E50D;
	Sun, 25 Apr 2021 18:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 676 seconds by postgrey-1.36 at gabe;
 Sun, 25 Apr 2021 02:34:07 UTC
Received: from toothrot.meleeweb.net (toothrot.meleeweb.net [62.210.131.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72306E43F
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 02:34:07 +0000 (UTC)
Received: from [80.111.226.61] (port=9744 helo=lady-voodoo.local)
 by toothrot.meleeweb.net with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 id 1laUNy-00GNGm-Lx; Sun, 25 Apr 2021 04:20:38 +0200
From: Bertrand Jacquin <bertrand@jacquin.bzh>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH] video/logo: CONFIG_LOGO conflicts with
 FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
Date: Sun, 25 Apr 2021 03:20:06 +0100
Message-Id: <20210425022006.356746-1-bertrand@jacquin.bzh>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Apr 2021 18:57:06 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is enabled, logo are not
being displayed
---
 drivers/video/logo/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
index 6d6f8c08792d..fe07dfb59d3d 100644
--- a/drivers/video/logo/Kconfig
+++ b/drivers/video/logo/Kconfig
@@ -5,9 +5,10 @@
 
 menuconfig LOGO
 	bool "Bootup logo"
-	depends on FB || SGI_NEWPORT_CONSOLE
+	depends on (FB && !FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER) || SGI_NEWPORT_CONSOLE
 	help
-	  Enable and select frame buffer bootup logos.
+	  Enable and select frame buffer bootup logos. Note no logo will be
+	  displayed if FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is enabled
 
 if LOGO
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
