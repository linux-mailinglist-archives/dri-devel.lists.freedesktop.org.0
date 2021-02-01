Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3630A8A1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 14:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAE86E5A3;
	Mon,  1 Feb 2021 13:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923126E5A3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:26:39 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a25so19564783ljn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 05:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJRVRhCiZdOOMqSiHStFtF9cFhaoFc/Q0xGR+0WLl8M=;
 b=m2g+SfpIDt8MK2QjGUUDnvbxGggjhMyUo0T1DdJ7869coCJWa2XBodAAfaLsyelyXT
 4+TK2EztsnRghbHVXNsFeEPyFjbV/PnCtb1b1pK6aQR/YU0TXoBXVYoBxj6u/hPCp+Ho
 I0xc/V+F1eojMVtiKUhH6eonkDzy0QZHbmzxIZdDxS5vLa5FMIEXjljLTlYmdmS7RjwC
 ZY5SsAQkk2/2+DSXCZnJba9pYPWDjD1jCGPu5a4pmdnX63t7X+c8qMBl91RA6UI78brB
 aZ3DeQLruuhQt9OsSMGaIkVNHcyzTDgLt0zm29WJefN89fKLJ4XwVLEjq6L6lxb11LiC
 C3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJRVRhCiZdOOMqSiHStFtF9cFhaoFc/Q0xGR+0WLl8M=;
 b=FZw4HEg89wUOiVqV+oplpFPtkBSvexyYzJfEQ4+s5nO93EvxqQGS5X3zNxTP1l//vZ
 SjFMj47r6VaJq14DmgUcAnCeopL0cCY5c8dy+iJX2DiHkYbvFRFjsT7S61W3p/y5cPRq
 +rFZDGhrbSBbGv88NcDbV/KNrZldzczVbQCGW9EwD50K4zS1SjkIcrcXbQuDq4jY7Kos
 ASs2upW6JL37wgMQl/SSovM+jQmnFqqZ7AncZ6swMTnEA80H0dTnlRfHdUEn+FxZ/F6F
 LkxH770qn9bjdpCeNaIu6sX5LAZEzgJp7fVEP/JsCtI+zkOr0wPH9uAedz0nz2g3aDaX
 EAOQ==
X-Gm-Message-State: AOAM533tNRr75eXLevnnTJ+p5+X0jJ/KRT3pi8Ma9LX5d2itbPvQaE+2
 lq8h2eMGgngl2L1963nJX6KEJkrsa1o=
X-Google-Smtp-Source: ABdhPJyx60tp7mF76/lE12NsJbJwXdasr6P+a4lronjCUZmT6EmFf/lWcQEhMY9lGMEW3a3XWos2ug==
X-Received: by 2002:a2e:b04e:: with SMTP id d14mr10372786ljl.414.1612185997692; 
 Mon, 01 Feb 2021 05:26:37 -0800 (PST)
Received: from workstation.lan (81-229-85-231-no13.tbcn.telia.com.
 [81.229.85.231])
 by smtp.gmail.com with ESMTPSA id p21sm2984737lfu.227.2021.02.01.05.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 05:26:36 -0800 (PST)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/gma500: Never wait for blits
Date: Mon,  1 Feb 2021 14:26:17 +0100
Message-Id: <20210201132617.1233-6-patrik.r.jakobsson@gmail.com>
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

Blits cannot happen anymore since we removed the 2d accel code. Stop
checking for a busy blitter and remove the remaining blitter code.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/Makefile  |  1 -
 drivers/gpu/drm/gma500/blitter.c | 43 --------------------------------
 drivers/gpu/drm/gma500/blitter.h | 16 ------------
 drivers/gpu/drm/gma500/gtt.c     | 11 --------
 4 files changed, 71 deletions(-)
 delete mode 100644 drivers/gpu/drm/gma500/blitter.c
 delete mode 100644 drivers/gpu/drm/gma500/blitter.h

diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
index 6ee1ef389979..8c649d3ef6a4 100644
--- a/drivers/gpu/drm/gma500/Makefile
+++ b/drivers/gpu/drm/gma500/Makefile
@@ -5,7 +5,6 @@
 
 gma500_gfx-y += \
 	  backlight.o \
-	  blitter.o \
 	  cdv_device.o \
 	  cdv_intel_crt.o \
 	  cdv_intel_display.o \
diff --git a/drivers/gpu/drm/gma500/blitter.c b/drivers/gpu/drm/gma500/blitter.c
deleted file mode 100644
index cb2504a4a15f..000000000000
--- a/drivers/gpu/drm/gma500/blitter.c
+++ /dev/null
@@ -1,43 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2014, Patrik Jakobsson
- * All Rights Reserved.
- *
- * Authors: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
- */
-
-#include "psb_drv.h"
-
-#include "blitter.h"
-#include "psb_reg.h"
-
-/* Wait for the blitter to be completely idle */
-int gma_blt_wait_idle(struct drm_psb_private *dev_priv)
-{
-	unsigned long stop = jiffies + HZ;
-	int busy = 1;
-
-	/* NOP for Cedarview */
-	if (IS_CDV(dev_priv->dev))
-		return 0;
-
-	/* First do a quick check */
-	if ((PSB_RSGX32(PSB_CR_2D_SOCIF) == _PSB_C2_SOCIF_EMPTY) &&
-	    ((PSB_RSGX32(PSB_CR_2D_BLIT_STATUS) & _PSB_C2B_STATUS_BUSY) == 0))
-		return 0;
-
-	do {
-		busy = (PSB_RSGX32(PSB_CR_2D_SOCIF) != _PSB_C2_SOCIF_EMPTY);
-	} while (busy && !time_after_eq(jiffies, stop));
-
-	if (busy)
-		return -EBUSY;
-
-	do {
-		busy = ((PSB_RSGX32(PSB_CR_2D_BLIT_STATUS) &
-			_PSB_C2B_STATUS_BUSY) != 0);
-	} while (busy && !time_after_eq(jiffies, stop));
-
-	/* If still busy, we probably have a hang */
-	return (busy) ? -EBUSY : 0;
-}
diff --git a/drivers/gpu/drm/gma500/blitter.h b/drivers/gpu/drm/gma500/blitter.h
deleted file mode 100644
index 8d67dabd9ba3..000000000000
--- a/drivers/gpu/drm/gma500/blitter.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2014, Patrik Jakobsson
- * All Rights Reserved.
- *
- * Authors: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
- */
-
-#ifndef __BLITTER_H
-#define __BLITTER_H
-
-struct drm_psb_private;
-
-extern int gma_blt_wait_idle(struct drm_psb_private *dev_priv);
-
-#endif
diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index e884750bc123..df9b611b856a 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -11,7 +11,6 @@
 
 #include <asm/set_memory.h>
 
-#include "blitter.h"
 #include "psb_drv.h"
 
 
@@ -229,18 +228,9 @@ void psb_gtt_unpin(struct gtt_range *gt)
 	struct drm_device *dev = gt->gem.dev;
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	u32 gpu_base = dev_priv->gtt.gatt_start;
-	int ret;
 
-	/* While holding the gtt_mutex no new blits can be initiated */
 	mutex_lock(&dev_priv->gtt_mutex);
 
-	/* Wait for any possible usage of the memory to be finished */
-	ret = gma_blt_wait_idle(dev_priv);
-	if (ret) {
-		DRM_ERROR("Failed to idle the blitter, unpin failed!");
-		goto out;
-	}
-
 	WARN_ON(!gt->in_gart);
 
 	gt->in_gart--;
@@ -251,7 +241,6 @@ void psb_gtt_unpin(struct gtt_range *gt)
 		psb_gtt_detach_pages(gt);
 	}
 
-out:
 	mutex_unlock(&dev_priv->gtt_mutex);
 }
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
