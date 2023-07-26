Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA567641D9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 00:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5149310E4C3;
	Wed, 26 Jul 2023 22:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BBA10E4C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 22:03:37 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4RB7Fj1KnPz9sNy;
 Wed, 26 Jul 2023 22:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1690409017; bh=YBCnn4JNwNbAT6zF6vw9dtW3ezSU8S9r0vignDtdN2A=;
 h=From:To:Cc:Subject:Date:From;
 b=E0f9eoIG3D6B7frdRiWZvW3mGWMpsow6UZ/0H/xR55Q/H4GY8w0MFeZGCshIxI80r
 ElsITTi3fsYdSS7IZbiOChHqOSJD4eTte7qeiROBwfj+9QMtEl2+tDiYNlJjNZ3oPL
 /IusCcgdWu9FjdsT9RNamnObNiS9BB+1XI1DhbTo=
X-Riseup-User-ID: 2DDC59D87F4DCD8025E06F65B7CA54D0364FF75A4E16E025E3899CF44BB42641
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RB7Ff0Xg5zJq7L;
 Wed, 26 Jul 2023 22:03:33 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tests: Remove CONFIG_DRM_FBDEV_EMULATION on .kunitconfig
Date: Wed, 26 Jul 2023 19:03:25 -0300
Message-ID: <20230726220325.278976-1-arthurgrillo@riseup.net>
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
Cc: arnd@arndb.de, tales.aparecida@gmail.com, deller@gmx.de, javierm@redhat.com,
 mairacanal@riseup.net, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using the `kunit_tool` with the command:

tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests/

Lead to this error[0]. Fix it by expliciting removing the
CONFIG_DRM_FBDEV_EMULATION.

[0]
ERROR:root:
WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
  Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
  Selected by [y]:
  - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]

WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
  Depends on [n]: VT [=n] && FRAMEBUFFER_CONSOLE [=y]
  Selected by [y]:
  - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && FRAMEBUFFER_CONSOLE [=y]

WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
  Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
  Selected by [y]:
  - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]

WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
  Depends on [n]: VT [=n] && FRAMEBUFFER_CONSOLE [=y]
  Selected by [y]:
  - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && FRAMEBUFFER_CONSOLE [=y]

WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
  Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
  Selected by [y]:
  - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]

WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
  Depends on [n]: VT [=n] && FRAMEBUFFER_CONSOLE [=y]
  Selected by [y]:
  - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && FRAMEBUFFER_CONSOLE [=y]
/usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_suspended':
fbcon.c:(.text+0x1c): undefined reference to `vc_cons'
/usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_cursor':
fbcon.c:(.text+0x1ac): undefined reference to `console_blanked'
/usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_resumed':
fbcon.c:(.text+0x39c): undefined reference to `vc_cons'
/usr/bin/ld: fbcon.c:(.text+0x3aa): undefined reference to `redraw_screen'
/usr/bin/ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_update_vcs':
.
.
.
make[3]: *** [../scripts/Makefile.vmlinux:36: vmlinux] Error 1
make[2]: *** [/home/grillo/projects/linux/Makefile:1238: vmlinux] Error 2
make[1]: *** [/home/grillo/projects/linux/Makefile:234: __sub-make] Error 2
make: *** [Makefile:234: __sub-make] Error 2

Fixes: c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled")
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/.kunitconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tests/.kunitconfig b/drivers/gpu/drm/tests/.kunitconfig
index 6ec04b4c979d..c50b5a12faae 100644
--- a/drivers/gpu/drm/tests/.kunitconfig
+++ b/drivers/gpu/drm/tests/.kunitconfig
@@ -1,3 +1,4 @@
 CONFIG_KUNIT=y
 CONFIG_DRM=y
 CONFIG_DRM_KUNIT_TEST=y
+CONFIG_DRM_FBDEV_EMULATION=n

base-commit: 45b58669e532bcdfd6e1593488d1f23eabd55428
-- 
2.41.0

