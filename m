Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477C3A6ADD3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB0110E6DA;
	Thu, 20 Mar 2025 18:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NktylMKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F88110E6D9;
 Thu, 20 Mar 2025 18:54:12 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-85e15dc8035so24817539f.0; 
 Thu, 20 Mar 2025 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496851; x=1743101651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmamZMwYgFpi0j7+3VuOLzPrfkXXmhZ2avEG64/SS20=;
 b=NktylMKPZ+OSh6I1NaHwBaKwrVoH2nwx7GIZL7dHRlsGUKGvIHStAkJu74cre7Qy01
 rzQHWYcTpYOf7qe1ZGMZauBF7GXM42zWQ9xEJtqxSgKks9FqoVrirkiloaajeOaJDm87
 yFv5GJT/1KFr0xHXdqMBYs++M28XRu3jl0lY3j9A/23yjgI1FndJoaabm2J40PgwAjfW
 nJvYikUVsbwRO6Ggeo/oBqMmh3KBTML3Sg0C/Z1gTDLv43nc05lipgG7ul+DjN/oIP+q
 SkTtL/L5qBYncVtpRXVIvDwjiTfM8qDIvk7YW8/jRJRgNI2PmCRKg1nb+rgDw5IS6syr
 bPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496851; x=1743101651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmamZMwYgFpi0j7+3VuOLzPrfkXXmhZ2avEG64/SS20=;
 b=pMVv2upwBQRLp4GDb6OuYhYz/u4/7FhSIswjTkogX9k3CqhG6r4EjM+5Xz41ID5++w
 dqI/+jVq8Aru2A+/t0sHDT4UFgaTnC0a9FJ/EJPHQoLaOrPVTwXwDklVelZghFLMFLLy
 t8jWU9LIfjhGnzFaCVSr/GdbUHDJOazaVe82zcnQgmmOwqtdwiZgJCyL4ZZm94lL0odc
 j64EIYO17enXt6sPRq6m79SMd1Y2YLMklZb0O7RTxxBcr7m3iaNNqkudDPZWPW1+ZB30
 q99g5+C4LhJLL17rbpX3psJaI5NGekg7Rlgk4p8vkQRo8wycgoK4NOo0itiiNqhGmTOY
 WZ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdK4PVEWC+U4jlQciy2pNuzH4LdNpaQRuY5XOguDmfyzIsJ8idid1U+kGMRH05wrVpzzaevHz+@lists.freedesktop.org,
 AJvYcCVwNacdtzT2yCdfSEBp/Ge+oM5vtmTJY6lAl4U+7Oiwt9aaukxP0n8k3iTh+hX6xZGQpZSgyYduy+A1yn4I/g==@lists.freedesktop.org,
 AJvYcCWG8fu+S7Fz+i9+V2XeEC4lbSvh6SOt/YSpWZURRdT7NelNNZRsQVRUIV+R6wmuda1uO9LMUEdOuEgY@lists.freedesktop.org,
 AJvYcCX20xZfXU9NhwUDXdQb4Bg6u59q/JAiyLw4FLUtn+NnyFekFOSGfEUwaaJAQDhEo0c6DWJBt48fmWtW@lists.freedesktop.org,
 AJvYcCXU/PKcpwCupfPjifcbEI3qZdU4IcL7ozY03YMXrRq7GUeQrSMbFm2NRmWhHh0ncWgU982VMR2fPepJyMsYI8jfiw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwObBnECZHpw3BIUPmlRCHfCGfA7/fR7Cvzln3lnDIidcJ1fN1
 g1bz/TRhtDuZeT8LaQVaJxdE5p5st8lgzKpM3o1K0rJwOqzecMLx
X-Gm-Gg: ASbGncuY0FjBqFUYn5t3xDPbYQTMFkz9kkIdt4a2kKt4tYw0WKf5lTpkdszZcX9Rg1z
 INziCtcPniVXfCZqybYnIZk0KWzyzKReTsw98/8ySmyBou0jlIHYvlInC1RAhHjD/SiAk89VpXu
 w1NA7cIUKuwQpTHTiF/IwCY6xu9Pw8RqivohfYOpmnX6yOjGU5WVLU2vU8OLus30a8C7tLv7/63
 nSaJVmyrJQUr3u/JaOT5YiUuYzPLZiGtL7l8JIwZ/xGSD++NZMZeylpgvOMDQtqE0iooHXHUH4y
 ryOWc3VSbLLDm+d9WeFTSU+DdMyMXd0mSOMnR7IgxPoDJyCYgPLXImJMzxqFATa5TpAPkioXjp9
 Jjw==
X-Google-Smtp-Source: AGHT+IEyrbzWzNkR3QwCwlCn6oXouTTauTHLnXeGSIezaRONhT+4uCAGUm+vEaKPMsebN3xP2W4/iw==
X-Received: by 2002:a05:6602:380a:b0:85b:4185:1f91 with SMTP id
 ca18e2360f4ac-85e2c8f7201mr53612539f.0.1742496851514; 
 Thu, 20 Mar 2025 11:54:11 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 59/59] drm: RFC - make drm_dyndbg_user.o for drm-*_helpers,
 drivers
Date: Thu, 20 Mar 2025 12:52:37 -0600
Message-ID: <20250320185238.447458-60-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

