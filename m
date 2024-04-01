Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1586893E8E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 18:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2F410F280;
	Mon,  1 Apr 2024 16:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ky8yzTEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4340910F280
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 16:05:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6DAC360CEC;
 Mon,  1 Apr 2024 16:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE2CC433F1;
 Mon,  1 Apr 2024 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1711987499;
 bh=PMSCh7YeYZ43I2lXPNxKk0Z1n/LS5UVy6jt5QNbm+QQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ky8yzTEMM0UmPuWfp4z/xvG5YMhSUuu/VJAqOqv1IoCyHd+gFoOXP+gDH9UZ3YGiO
 SuZLYOkdRjjpvU676fGPphDXm/XKIaA4PuK4hMjzfg3v9jihRgc44nlBLEgyDfJE73
 22pgApMMcz8hQCd87gpa49rjFjkjlT11P6mEWLjU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Nick Bowler <nbowler@draconx.ca>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6.8 306/399] fbdev: Select I/O-memory framebuffer ops for SBus
Date: Mon,  1 Apr 2024 17:44:32 +0200
Message-ID: <20240401152558.322745905@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240401152549.131030308@linuxfoundation.org>
References: <20240401152549.131030308@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.8-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit a8eb93b42d7e068306ca07f51055cbcde893fea3 upstream.

Framebuffer I/O on the Sparc Sbus requires read/write helpers for
I/O memory. Select FB_IOMEM_FOPS accordingly.

Reported-by: Nick Bowler <nbowler@draconx.ca>
Closes: https://lore.kernel.org/lkml/5bc21364-41da-a339-676e-5bb0f4faebfb@draconx.ca/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 8813e86f6d82 ("fbdev: Remove default file-I/O implementations")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240322083005.24269-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -501,6 +501,7 @@ config FB_SBUS_HELPERS
 	select FB_CFB_COPYAREA
 	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 
 config FB_BW2
 	bool "BWtwo support"
@@ -521,6 +522,7 @@ config FB_CG6
 	depends on (FB = y) && (SPARC && FB_SBUS)
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  This is the frame buffer device driver for the CGsix (GX, TurboGX)
 	  frame buffer.
@@ -530,6 +532,7 @@ config FB_FFB
 	depends on FB_SBUS && SPARC64
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  This is the frame buffer device driver for the Creator, Creator3D,
 	  and Elite3D graphics boards.


