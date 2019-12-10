Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8981182C1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329F06E866;
	Tue, 10 Dec 2019 08:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9352D6E860
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:49:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 22BB3B354;
 Tue, 10 Dec 2019 08:49:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v3 9/9] drm/udl: Remove udl_fb.c
Date: Tue, 10 Dec 2019 09:49:05 +0100
Message-Id: <20191210084905.5570-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210084905.5570-1-tzimmermann@suse.de>
References: <20191210084905.5570-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The remaining code in udl_fb.c is unused. Remove the file entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/udl/Makefile |  2 +-
 drivers/gpu/drm/udl/udl_fb.c | 51 ------------------------------------
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 drivers/gpu/drm/udl/udl_fb.c

diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefile
index 177ce74f4cf4..b50179bb4de0 100644
--- a/drivers/gpu/drm/udl/Makefile
+++ b/drivers/gpu/drm/udl/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-udl-y := udl_drv.o udl_modeset.o udl_connector.o udl_main.o udl_fb.o udl_transfer.o udl_gem.o
+udl-y := udl_drv.o udl_modeset.o udl_connector.o udl_main.o udl_transfer.o udl_gem.o
 
 obj-$(CONFIG_DRM_UDL) := udl.o
diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb.c
deleted file mode 100644
index 84cff9d9edbe..000000000000
--- a/drivers/gpu/drm/udl/udl_fb.c
+++ /dev/null
@@ -1,51 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2012 Red Hat
- *
- * based in parts on udlfb.c:
- * Copyright (C) 2009 Roberto De Ioris <roberto@unbit.it>
- * Copyright (C) 2009 Jaya Kumar <jayakumar.lkml@gmail.com>
- * Copyright (C) 2009 Bernie Thompson <bernie@plugable.com>
- */
-
-#include <linux/moduleparam.h>
-
-#include "udl_drv.h"
-
-/** Read the red component (0..255) of a 32 bpp colour. */
-#define DLO_RGB_GETRED(col) (uint8_t)((col) & 0xFF)
-
-/** Read the green component (0..255) of a 32 bpp colour. */
-#define DLO_RGB_GETGRN(col) (uint8_t)(((col) >> 8) & 0xFF)
-
-/** Read the blue component (0..255) of a 32 bpp colour. */
-#define DLO_RGB_GETBLU(col) (uint8_t)(((col) >> 16) & 0xFF)
-
-/** Return red/green component of a 16 bpp colour number. */
-#define DLO_RG16(red, grn) (uint8_t)((((red) & 0xF8) | ((grn) >> 5)) & 0xFF)
-
-/** Return green/blue component of a 16 bpp colour number. */
-#define DLO_GB16(grn, blu) (uint8_t)(((((grn) & 0x1C) << 3) | ((blu) >> 3)) & 0xFF)
-
-/** Return 8 bpp colour number from red, green and blue components. */
-#define DLO_RGB8(red, grn, blu) ((((red) << 5) | (((grn) & 3) << 3) | ((blu) & 7)) & 0xFF)
-
-#if 0
-static uint8_t rgb8(uint32_t col)
-{
-	uint8_t red = DLO_RGB_GETRED(col);
-	uint8_t grn = DLO_RGB_GETGRN(col);
-	uint8_t blu = DLO_RGB_GETBLU(col);
-
-	return DLO_RGB8(red, grn, blu);
-}
-
-static uint16_t rgb16(uint32_t col)
-{
-	uint8_t red = DLO_RGB_GETRED(col);
-	uint8_t grn = DLO_RGB_GETGRN(col);
-	uint8_t blu = DLO_RGB_GETBLU(col);
-
-	return (DLO_RG16(red, grn) << 8) + DLO_GB16(grn, blu);
-}
-#endif
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
