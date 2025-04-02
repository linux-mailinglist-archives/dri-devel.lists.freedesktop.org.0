Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAFAA79461
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D3910E8B3;
	Wed,  2 Apr 2025 17:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a7dpzCy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4A610E8AC;
 Wed,  2 Apr 2025 17:43:06 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-85b3f92c866so338339f.3; 
 Wed, 02 Apr 2025 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615786; x=1744220586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmamZMwYgFpi0j7+3VuOLzPrfkXXmhZ2avEG64/SS20=;
 b=a7dpzCy6r9vff1Z949GSSbX0UE1mznfVBocvgojgUmHqL+H/CIJPAxCj9AfyWig2ev
 R4mtKzLQtRyGzSZtV9sXcKfo1iClV4cT7ALJYWUvI+TDdvDpb+xdOtkMnipKOPQZVpyn
 7Z2RM5Pe5nEC9OKa4CFP8qpAOPMq+WkkqhUDmd2cYY5C6OwHb8BlR0nWbglpMXjNfbkP
 2jkTQ53swcthA/G9Ldy9A8doMNjzqKyV4op7dDWTWM17xTnSBGlIMV209beFnWcGBhRP
 wxvXAeJE7u/K9BH3nNnkoJWYUgpILz+NNt9QKjiDxJnUTE8ADEqqe3Omj2s8F3cM/1sP
 +CUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615786; x=1744220586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmamZMwYgFpi0j7+3VuOLzPrfkXXmhZ2avEG64/SS20=;
 b=Q4xWYZQVu+/j16cZOYEFOm3EPghD9mGPIPbFjMWDuMK/FomSz2FZ2ez1CVr7ePQc4I
 BI5bffPgH16YDsLJvqQg3TDG0xW2eAD3jAtsqRDFNpWF5WBhxk0x/RQRE9fopFL+G21P
 E734Kla21mQvZlXiZaRlDCUbsF+sqvYcXjvPDVrPNhLHAFb7MLXBzRx3IZ62WsVgDG8r
 NvV44gD6F9euvA79luxkGAxbzHcX+mBG2uy1NqkWkykJ/sXeFWbD+05Srcl7IHN5Dm7c
 Cd5Cl2RjfRiXQQE6YnZTaabd0a8kJ5LKI//Cfph3fGD5W6I4xkkE7cez4JY4xKRBvwRI
 HHkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQkOEbcXqc0OL2RrEx/DXmhhTpQ5ojOhlDMhZ6N0+pV4hrrFvj8RwSvwaen/E38TOJoU52CrY2rCJeeXVABQ==@lists.freedesktop.org,
 AJvYcCWDBdnbJWNq0EDaREKjcf4rnyGptVFDfvIqytX4wMCikh3SxjLtubww7DD4YvBcAkboO6StxR86v/NZ@lists.freedesktop.org,
 AJvYcCWW4rGy1R+aNmCaEt6XC9VpmVElLw2OsOENYgWKBEl0VGUBufpaTZrIkKjxO6B+r/jmPUhnL588@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywS5khXRnOqwLoULaweDyVmrlp/b+QxNs4MRe9hM0zx1aKFQnW
 +vHZXeT/JGpVJ2R5+8qMjdegd0Nuv/Ph4h6/fSW7XG4grNQ7CLbv
X-Gm-Gg: ASbGncttbb9fn/gSVQ8nkPOfYTpSyi2Ay2TeI3Vg/Nuni764JCfCDZHnO8a3Kqv1JHB
 1bvdCWwa3TQTv4PTooOxXN/ftwGavLWMGqkXpV6CEVhmOyNDXvN2PPr16GWZ7q2g5SoPIkbYe+3
 mZHDAIa4QhM07H4x3gLCoopH+Xl/h9k8x8Rbgh+/DH12gQb69uRmeOQLiSFLTeYlpB797KrLu/4
 V59CeDnPqEikI67XER4DT0XUJCx3JA6OEetZewMGE4kiAymsDLROT7Lq7tP1llrcyH4xxO4Uxg5
 m3dxYK5FuLCOoWJU7h/MEW6qm+5gGXzH2wbXV0f1+UIX8A8eATY3nmWYhCi9wRHlTdLgfTl4/+Z
 BdA==
X-Google-Smtp-Source: AGHT+IHals0Ha6Jbgxu6ZrP/iyj69ILFezhPsXy3WvO7TTJBtm+wHjVRufglAOrxetkFLageXKmqeg==
X-Received: by 2002:a92:cda4:0:b0:3d3:fcff:edae with SMTP id
 e9e14a558f8ab-3d5e08eb18amr200191655ab.3.1743615785891; 
 Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 54/54] drm: RFC - make drm_dyndbg_user.o for drm-*_helpers,
 drivers
Date: Wed,  2 Apr 2025 11:41:56 -0600
Message-ID: <20250402174156.1246171-55-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

Add new drm_dyndbg_user.c with a single call to
DYNDBG_CLASSMAP_USE(drm_debug_classes).  This creates a _class_user
record (and a linkage dependency).

If a driver adds this object to its Makefile target, it gets the
record, which authorizes dyndbg to enable the module's class'd
pr_debugs, such as DRMs <category>_dbg() macros.

So Id like to automatically inject this object into drivers.  I tried
subdir-objs-y, but thats not a thing.

In drm/Makefile:

Add object dependency to drm_*_helper-y targets:

  $targ-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o

Attempt a foreach:

  to add $driver-y += ../drm_dyndbg_user.o

this appears to be a train-wreck for impl reasons, but it describes a
want/need reasonably well.  It might not be a good maintainble idea.

Explicitly adding to radeon/Makefile worked:

  $radeon-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += ../drm_dyndbg_user.o

But doing this is just as per-module as just adding the _USE()
explicitly to the main .c file, which is less magical than make-fu.

Also, it appears to cause make && make rebuilds.

and try to link it to helpers and everything

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile          |  9 +++++++++
 drivers/gpu/drm/drm_dyndbg_user.c | 11 +++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_dyndbg_user.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 704f94efc804..1adb5a262180 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -74,10 +74,12 @@ drm-y := \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
 	drm_writeback.o
+
 drm-$(CONFIG_DRM_CLIENT) += \
 	drm_client.o \
 	drm_client_event.o \
 	drm_client_modeset.o
+
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
@@ -111,20 +113,25 @@ obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 drm_dma_helper-y := drm_gem_dma_helper.o
 drm_dma_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_dma.o
 drm_dma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_dma_helper.o
+drm_dma_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_GEM_DMA_HELPER) += drm_dma_helper.o
 
 drm_shmem_helper-y := drm_gem_shmem_helper.o
 drm_shmem_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_shmem.o
+drm_shmem_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
 
 drm_suballoc_helper-y := drm_suballoc.o
+drm_suballoc_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
 
 drm_vram_helper-y := drm_gem_vram_helper.o
+drm_vram_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
 drm_ttm_helper-y := drm_gem_ttm_helper.o
 drm_ttm_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_ttm.o
+drm_ttm_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 
 #
@@ -149,11 +156,13 @@ drm_kms_helper-y := \
 	drm_simple_kms_helper.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
+drm_kms_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
 #
 # Drivers and the rest
 #
+subdir-obj-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 
 obj-y			+= tests/
 
diff --git a/drivers/gpu/drm/drm_dyndbg_user.c b/drivers/gpu/drm/drm_dyndbg_user.c
new file mode 100644
index 000000000000..9e4aa87d4b58
--- /dev/null
+++ b/drivers/gpu/drm/drm_dyndbg_user.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include "drm/drm_print.h"
+/*
+ * if DRM_USE_DYNAMIC_DEBBUG:
+ *    DYNDBG_CLASSMAP_USE(drm_debug_classes);
+ *
+ * dyndbg classmaps are opt-in, so modules which call drm:_*_dbg must
+ * link this to authorize dyndbg to change the static-keys underneath.
+ */
+DRM_CLASSMAP_USE(drm_debug_classes);
-- 
2.49.0

