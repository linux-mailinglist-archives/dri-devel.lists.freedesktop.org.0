Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331E730A8A2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 14:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F786E5A2;
	Mon,  1 Feb 2021 13:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850CB6E5A0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:26:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id q12so22702217lfo.12
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 05:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gcsz3XtUPFim4PcbMueqFgdOJnEWbAOsJhB2c5QWaFI=;
 b=s6ChM99/N0r0JExoiYFfG3ZidHshkKAOEPjxqTxhcnkk/asDfLf26HOY7tKJKUUvmg
 aL9wSdxgyULZcT4KQUYfVXf0p6MMvEksScz5D6Qa9FGQgxkUzB0hULSd0nVQpfbNCOcF
 QVU+gL+AHbAl2F8xpQDnCVe5vGa2s3DoT08nsprgCLjKJ3EHZvU/WKd9srMj136c0Oo9
 uQS1zmdKlX6K4nFs23w3cvHwAGgT+0IckUlr/mxOYaBnKTlJ2L/IhOcerf9aNFRhvsUW
 hgKj9yKx1VWFhNBJBz11lHHNoscHzDllezGCpxzknwf9ssjNwuubPW0r99lK6gRU1LDz
 NGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gcsz3XtUPFim4PcbMueqFgdOJnEWbAOsJhB2c5QWaFI=;
 b=pciiueNP1k8U4UwyHDmnG4t1AWsRivjFiGGrjKegrjEDw2V7EZf8+2hmOlBillvWlC
 BNsc0PD6RXPs4o1170E42QdLff2aTVJmWJi5eLzq6RbFaoe8O/pLuHaDpbjHZdRAiM2C
 BDOo1wGdUF8vViIcsb5ac88Pxk2thdX8rr91qD7pcCXRhIi+fLk9br3spH1ZuOscNYdQ
 CBo7OU1R2YHFXRangN9g7b1ZXMErpNp005kF0g+gPTumBe/nXezMOZNZQDtnnXk0SWSO
 1RVONKCiHLUrgtnQYzT9Js975FmovGRNYUBcccKIjdhViUy3Hg9dJxo4RBmoebGLT58u
 M9Ag==
X-Gm-Message-State: AOAM532E1JSmMjiqFCecxah3oK222MznJNHAZYkdTcyQy23Q+bQuyD15
 1IkBQ+zhpV/G7FeWEEqslzMTDic3RTU=
X-Google-Smtp-Source: ABdhPJxSG0eIWN0gFPxY6cGbQ8NacvihqCXhw2WzQ/Wt3Nx5ajDT/fNz4G3k36DsAydkbdvpkQSTJg==
X-Received: by 2002:a05:6512:224c:: with SMTP id
 i12mr8894626lfu.520.1612185996650; 
 Mon, 01 Feb 2021 05:26:36 -0800 (PST)
Received: from workstation.lan (81-229-85-231-no13.tbcn.telia.com.
 [81.229.85.231])
 by smtp.gmail.com with ESMTPSA id p21sm2984737lfu.227.2021.02.01.05.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 05:26:35 -0800 (PST)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/gma500: psb_spank() doesn't need it's own file
Date: Mon,  1 Feb 2021 14:26:16 +0100
Message-Id: <20210201132617.1233-5-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
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
Cc: airlied@linux.ie, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since everything else in accel_2d.c got removed we can move psb_spank()
into psb_drv.c where it is used.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/Makefile   |  1 -
 drivers/gpu/drm/gma500/accel_2d.c | 60 -------------------------------
 drivers/gpu/drm/gma500/psb_drv.c  | 31 ++++++++++++++++
 3 files changed, 31 insertions(+), 61 deletions(-)
 delete mode 100644 drivers/gpu/drm/gma500/accel_2d.c

diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
index 884ab1f9063e..6ee1ef389979 100644
--- a/drivers/gpu/drm/gma500/Makefile
+++ b/drivers/gpu/drm/gma500/Makefile
@@ -4,7 +4,6 @@
 #
 
 gma500_gfx-y += \
-	  accel_2d.o \
 	  backlight.o \
 	  blitter.o \
 	  cdv_device.o \
diff --git a/drivers/gpu/drm/gma500/accel_2d.c b/drivers/gpu/drm/gma500/accel_2d.c
deleted file mode 100644
index 437bbb6af9e6..000000000000
--- a/drivers/gpu/drm/gma500/accel_2d.c
+++ /dev/null
@@ -1,60 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/**************************************************************************
- * Copyright (c) 2007-2011, Intel Corporation.
- * All Rights Reserved.
- *
- * Intel funded Tungsten Graphics (http://www.tungstengraphics.com) to
- * develop this driver.
- *
- **************************************************************************/
-
-#include <linux/console.h>
-#include <linux/delay.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/string.h>
-#include <linux/tty.h>
-
-#include <drm/drm.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
-
-#include "psb_drv.h"
-#include "psb_reg.h"
-
-/**
- *	psb_spank		-	reset the 2D engine
- *	@dev_priv: our PSB DRM device
- *
- *	Soft reset the graphics engine and then reload the necessary registers.
- *	We use this at initialisation time but it will become relevant for
- *	accelerated X later
- */
-void psb_spank(struct drm_psb_private *dev_priv)
-{
-	PSB_WSGX32(_PSB_CS_RESET_BIF_RESET | _PSB_CS_RESET_DPM_RESET |
-		_PSB_CS_RESET_TA_RESET | _PSB_CS_RESET_USE_RESET |
-		_PSB_CS_RESET_ISP_RESET | _PSB_CS_RESET_TSP_RESET |
-		_PSB_CS_RESET_TWOD_RESET, PSB_CR_SOFT_RESET);
-	PSB_RSGX32(PSB_CR_SOFT_RESET);
-
-	msleep(1);
-
-	PSB_WSGX32(0, PSB_CR_SOFT_RESET);
-	wmb();
-	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) | _PSB_CB_CTRL_CLEAR_FAULT,
-		   PSB_CR_BIF_CTRL);
-	wmb();
-	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
-
-	msleep(1);
-	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) & ~_PSB_CB_CTRL_CLEAR_FAULT,
-		   PSB_CR_BIF_CTRL);
-	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
-	PSB_WSGX32(dev_priv->gtt.gatt_start, PSB_CR_BIF_TWOD_REQ_BASE);
-}
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 0bcab065242c..bd55b0c4f4b3 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -12,6 +12,7 @@
 #include <linux/notifier.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
+#include <linux/delay.h>
 
 #include <asm/set_memory.h>
 
@@ -92,6 +93,36 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 static const struct drm_ioctl_desc psb_ioctls[] = {
 };
 
+/**
+ *	psb_spank		-	reset the 2D engine
+ *	@dev_priv: our PSB DRM device
+ *
+ *	Soft reset the graphics engine and then reload the necessary registers.
+ */
+void psb_spank(struct drm_psb_private *dev_priv)
+{
+	PSB_WSGX32(_PSB_CS_RESET_BIF_RESET | _PSB_CS_RESET_DPM_RESET |
+		_PSB_CS_RESET_TA_RESET | _PSB_CS_RESET_USE_RESET |
+		_PSB_CS_RESET_ISP_RESET | _PSB_CS_RESET_TSP_RESET |
+		_PSB_CS_RESET_TWOD_RESET, PSB_CR_SOFT_RESET);
+	PSB_RSGX32(PSB_CR_SOFT_RESET);
+
+	msleep(1);
+
+	PSB_WSGX32(0, PSB_CR_SOFT_RESET);
+	wmb();
+	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) | _PSB_CB_CTRL_CLEAR_FAULT,
+		   PSB_CR_BIF_CTRL);
+	wmb();
+	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
+
+	msleep(1);
+	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) & ~_PSB_CB_CTRL_CLEAR_FAULT,
+		   PSB_CR_BIF_CTRL);
+	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
+	PSB_WSGX32(dev_priv->gtt.gatt_start, PSB_CR_BIF_TWOD_REQ_BASE);
+}
+
 static int psb_do_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
