Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5167F6415E3
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 11:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8050E10E1DF;
	Sat,  3 Dec 2022 10:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-219.mta0.migadu.com (out-219.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::db])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838A310E1DF
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 10:33:24 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1670063602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JPYiBbSVMnruEeNKBfFmoLr+cv12l5P6JDa/2Es+dY=;
 b=RrfUvF8zipRwCeZncWfqkdw37dekkA4OMqhAZn3IAu6K/JDm3xvlXD6wMGA25R5DEdVazV
 mBVfYPjFaReojA1KcXlT9323Zwvjc/QEBTMLMjXgpDHDQNJtdCUmrs4WXUvGpYCKW2xPtR
 qKdQdwYwg0tXILhWzrReuVb+mjdf2e8=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: tzimmermann@suse.de
Subject: [RESEND PATCH linux-next v2 06/10] drm: Remove the obsolete
 driver-tdfx
Date: Sat,  3 Dec 2022 18:22:57 +0800
Message-Id: <20221203102502.3185-7-cai.huoqing@linux.dev>
In-Reply-To: <20221203102502.3185-1-cai.huoqing@linux.dev>
References: <20221203102502.3185-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Cai Huoqing <cai.huoqing@linux.dev>,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 399516ab0fee ("MAINTAINERS: Add a bunch of legacy (UMS) DRM drivers")
marked tdfx driver obsolete 7 years ago.
And the mesa UMD of this drm driver already in deprecated list
in the link: https://docs.mesa3d.org/systems.html
3dfx Glide-->driver/gpu/drm/tdfx

It's time to remove this driver.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/gpu/drm/Kconfig         |  7 ---
 drivers/gpu/drm/Makefile        |  1 -
 drivers/gpu/drm/tdfx/Makefile   |  8 ---
 drivers/gpu/drm/tdfx/tdfx_drv.c | 90 ---------------------------------
 drivers/gpu/drm/tdfx/tdfx_drv.h | 47 -----------------
 5 files changed, 153 deletions(-)
 delete mode 100644 drivers/gpu/drm/tdfx/Makefile
 delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.c
 delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dbe51b65e481..a70a87798894 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -392,13 +392,6 @@ menuconfig DRM_LEGACY
 
 if DRM_LEGACY
 
-config DRM_TDFX
-	tristate "3dfx Banshee/Voodoo3+"
-	depends on DRM && PCI
-	help
-	  Choose this option if you have a 3dfx Banshee or Voodoo3 (or later),
-	  graphics card.  If M is selected, the module will be called tdfx.
-
 config DRM_VIA
 	tristate "Via unichrome video cards"
 	depends on DRM && PCI
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c4e3cdf814ce..489fadf19507 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -134,7 +134,6 @@ obj-y			+= arm/
 obj-y			+= display/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
 obj-$(CONFIG_DRM_SCHED)	+= scheduler/
-obj-$(CONFIG_DRM_TDFX)	+= tdfx/
 obj-$(CONFIG_DRM_RADEON)+= radeon/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
 obj-$(CONFIG_DRM_I915)	+= i915/
diff --git a/drivers/gpu/drm/tdfx/Makefile b/drivers/gpu/drm/tdfx/Makefile
deleted file mode 100644
index 03b7d0f087b0..000000000000
--- a/drivers/gpu/drm/tdfx/Makefile
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for the drm device driver.  This driver provides support for the
-# Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
-
-tdfx-y := tdfx_drv.o
-
-obj-$(CONFIG_DRM_TDFX)	+= tdfx.o
diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/tdfx_drv.c
deleted file mode 100644
index 58c185c299f4..000000000000
--- a/drivers/gpu/drm/tdfx/tdfx_drv.c
+++ /dev/null
@@ -1,90 +0,0 @@
-/* tdfx_drv.c -- tdfx driver -*- linux-c -*-
- * Created: Thu Oct  7 10:38:32 1999 by faith@precisioninsight.com
- *
- * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
- * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
- * Authors:
- *    Rickard E. (Rik) Faith <faith@valinux.com>
- *    Daryll Strauss <daryll@valinux.com>
- *    Gareth Hughes <gareth@valinux.com>
- */
-
-#include <linux/module.h>
-#include <linux/pci.h>
-
-#include <drm/drm_drv.h>
-#include <drm/drm_file.h>
-#include <drm/drm_ioctl.h>
-#include <drm/drm_legacy.h>
-#include <drm/drm_pciids.h>
-
-#include "tdfx_drv.h"
-
-static struct pci_device_id pciidlist[] = {
-	tdfx_PCI_IDS
-};
-
-static const struct file_operations tdfx_driver_fops = {
-	.owner = THIS_MODULE,
-	.open = drm_open,
-	.release = drm_release,
-	.unlocked_ioctl = drm_ioctl,
-	.mmap = drm_legacy_mmap,
-	.poll = drm_poll,
-	.compat_ioctl = drm_compat_ioctl,
-	.llseek = noop_llseek,
-};
-
-static const struct drm_driver driver = {
-	.driver_features = DRIVER_LEGACY,
-	.fops = &tdfx_driver_fops,
-	.name = DRIVER_NAME,
-	.desc = DRIVER_DESC,
-	.date = DRIVER_DATE,
-	.major = DRIVER_MAJOR,
-	.minor = DRIVER_MINOR,
-	.patchlevel = DRIVER_PATCHLEVEL,
-};
-
-static struct pci_driver tdfx_pci_driver = {
-	.name = DRIVER_NAME,
-	.id_table = pciidlist,
-};
-
-static int __init tdfx_init(void)
-{
-	return drm_legacy_pci_init(&driver, &tdfx_pci_driver);
-}
-
-static void __exit tdfx_exit(void)
-{
-	drm_legacy_pci_exit(&driver, &tdfx_pci_driver);
-}
-
-module_init(tdfx_init);
-module_exit(tdfx_exit);
-
-MODULE_AUTHOR(DRIVER_AUTHOR);
-MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.h b/drivers/gpu/drm/tdfx/tdfx_drv.h
deleted file mode 100644
index 84204ec1b046..000000000000
--- a/drivers/gpu/drm/tdfx/tdfx_drv.h
+++ /dev/null
@@ -1,47 +0,0 @@
-/* tdfx.h -- 3dfx DRM template customization -*- linux-c -*-
- * Created: Wed Feb 14 12:32:32 2001 by gareth@valinux.com
- */
-/*
- * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors:
- *    Gareth Hughes <gareth@valinux.com>
- */
-
-#ifndef __TDFX_H__
-#define __TDFX_H__
-
-/* General customization:
- */
-
-#define DRIVER_AUTHOR		"VA Linux Systems Inc."
-
-#define DRIVER_NAME		"tdfx"
-#define DRIVER_DESC		"3dfx Banshee/Voodoo3+"
-#define DRIVER_DATE		"20010216"
-
-#define DRIVER_MAJOR		1
-#define DRIVER_MINOR		0
-#define DRIVER_PATCHLEVEL	0
-
-#endif
-- 
2.25.1

