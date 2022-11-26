Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8529C63927C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 01:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D7D10E13C;
	Sat, 26 Nov 2022 00:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BA610E0E1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 00:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=fCEpozuQZzSMlmSX68RJLiCk4zrpL6chfzTq9T/Cx5k=; b=EsUHG75+oID3GB27Y6g35LNJqk
 uHV7H16V2AyNE9Jjrx5LcQPqA/7lRSatnFyjSsmv79n+xloLV5EdP5ct+xZ8ruRygleiDumHWKfzK
 S+rH5/exa9VjcJqkwLGnH5bXeUy2Ml//sDH2MHlDC/gr7vmLxer2HPFg8MXv0UNcqlpjPLnuXG6r7
 7fSvb5ynnF2yi9bVA3b4w+xqb27ZKPhojSap/CmdWytflOHw1QyNS2X8mSUzNBne+FEZPapvec5ZE
 dVG2zaTgtidnqvc9J5awYuFTWkQ10LI6xLfBytJmpKoTvn4L6ytYKPXLHHkIXFvDSUoAb3Lru3zad
 ll2nv8yA==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oyig1-00A0ud-R3; Sat, 26 Nov 2022 00:04:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: make offb driver tristate
Date: Fri, 25 Nov 2022 16:04:01 -0800
Message-Id: <20221126000401.25302-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Masahiro Yamada <masahiroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the offb (Open Firmware frame buffer) driver tristate,
i.e., so that it can be built as a loadable module.

However, it still depends on the setting of DRM_OFDRM
so that both of these drivers cannot be builtin at the same time
nor can one be builtin and the other one a loadable module.

Build-tested successfully with all combination of DRM_OFDRM and FB_OF.

This fixes a build issue that Michal reported when FB_OF=y and
DRM_OFDRM=m:

powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): undefined reference to `cfb_fillrect'
powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): undefined reference to `cfb_copyarea'
powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): undefined reference to `cfb_imageblit'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Suchánek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

---
 drivers/video/fbdev/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -456,8 +456,8 @@ config FB_ATARI
 	  chipset found in Ataris.
 
 config FB_OF
-	bool "Open Firmware frame buffer device support"
-	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
+	tristate "Open Firmware frame buffer device support"
+	depends on FB && PPC && (!PPC_PSERIES || PCI)
 	depends on !DRM_OFDRM
 	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
