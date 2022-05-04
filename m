Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D351989E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B89310F225;
	Wed,  4 May 2022 07:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3488010F06B;
 Wed,  4 May 2022 07:47:51 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id k27so765239edk.4;
 Wed, 04 May 2022 00:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZZ1jzNY8pawj0YAEhEymaYhtZjWOMsP9FrrLO7QQCg=;
 b=iKVKNUWvNCJ+B76VOd6TgvvCoIsvMKIKKNFCEvOSAaRaqETA4ygqewWHYKMkG4YGoa
 QkC/Gr/2KcYBDlwC6Qxoh3Trxk7UeIKBUcSft8cg07kuRNaREIIWPqKA52QSKY7My88Z
 yMnTEje60tpGkAWoQx1CIAO2tkoh0/0QW4+BRhPLTvEamg6V3t0FJzKNDZqTkta1kyTL
 mTzR+xtwNRBEJAbcMHmYywbCf0Ra/uxb+429QIhCpHb8rk74pEom8VzkBsapFTn3P9ty
 r2jX2Cf27Lg3FgfcnlHWHOM0UEZD6G4jUEerlVlpcPENRfUrJAPxIjdBAyIIDQcx/z1L
 Hsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZZ1jzNY8pawj0YAEhEymaYhtZjWOMsP9FrrLO7QQCg=;
 b=ZSNAZkYwAb1XlgaVNfMSLcpkWbqi5Ucql4iABo6zBhedoV5OcnhvuDPUG9mj8N7paW
 U9pULJFn5gSJyAKNb+hNmscR5w+shFMy03wZUV2Z/EfevafIt6K3uBFMalP4efse2qFO
 vQHM91IB1tSzs6cJCJVj2G4Ali26ihr7yrP5uEcdIxsHr+AnG8mQ5soDTtpywepf3iZk
 8EdaF5jBCCGMsMBY7eU8jN7xBf31bOO1+HEae+h9JfXUlXnCVCLOWxLDnu9+9p0dyq5P
 v+LmIogEx9LJVCndRpVB0KgeKW8hOs6rCAUY2CoFeoo7PevVRrnak8psN+poWiA1tFM7
 WxRA==
X-Gm-Message-State: AOAM531IXnIw+LnoukebIhu4lfzO/pNhK5HTYj10IPD1dUBgy4nsivHp
 z9eBtTCbPzfppZMHTAwUUHOn9iQJ/bE=
X-Google-Smtp-Source: ABdhPJwUvMrf7tX9e3qYa/nuAQ9V+5JEwr2HpTNb+7U6tsc2p7vqthr9vNiIRrObAmMAu9MIytgpIQ==
X-Received: by 2002:a05:6402:3292:b0:427:b4c9:6522 with SMTP id
 f18-20020a056402329200b00427b4c96522mr17118322eda.406.1651650469571; 
 Wed, 04 May 2022 00:47:49 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214dc2sm5433686ejc.40.2022.05.04.00.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:47:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 8/8] drm: move ttm_execbuf_util into vmwgfx
Date: Wed,  4 May 2022 09:47:39 +0200
Message-Id: <20220504074739.2231-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504074739.2231-1-christian.koenig@amd.com>
References: <20220504074739.2231-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VMWGFX is the only remaining user of this and should probably moved over
to drm_exec when it starts using GEM as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/Makefile                                  | 4 ++--
 drivers/gpu/drm/vmwgfx/Makefile                               | 2 +-
 drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c            | 3 ++-
 .../drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h     | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                           | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h                    | 2 +-
 6 files changed, 8 insertions(+), 7 deletions(-)
 rename drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c (99%)
 rename {include/drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h (99%)

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index f906b22959cf..b05a8477d0d0 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -3,8 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 
 ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
-	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
-	ttm_device.o ttm_sys_manager.o
+	ttm_range_manager.o ttm_resource.o ttm_pool.o ttm_device.o \
+	ttm_sys_manager.o
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 obj-$(CONFIG_DRM_TTM) += ttm.o
diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index eee73b9aa404..c2c836103b23 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_hashtab.o vmwgfx_kms.o vmwgfx_drv.o \
-	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
+	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o ttm_execbuf_util.o \
 	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
 	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
 	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
similarity index 99%
rename from drivers/gpu/drm/ttm/ttm_execbuf_util.c
rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
index dbee34a058df..1030f263ba07 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
@@ -26,13 +26,14 @@
  *
  **************************************************************************/
 
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/module.h>
 
+#include "ttm_execbuf_util.h"
+
 static void ttm_eu_backoff_reservation_reverse(struct list_head *list,
 					      struct ttm_validate_buffer *entry)
 {
diff --git a/include/drm/ttm/ttm_execbuf_util.h b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
similarity index 99%
rename from include/drm/ttm/ttm_execbuf_util.h
rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
index a99d7fdf2964..47553bf31c73 100644
--- a/include/drm/ttm/ttm_execbuf_util.h
+++ b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
@@ -33,7 +33,7 @@
 
 #include <linux/list.h>
 
-#include "ttm_bo_api.h"
+#include <drm/ttm/ttm_bo_api.h>
 
 /**
  * struct ttm_validate_buffer
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index be19aa6e1f13..cae306c60af9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -37,8 +37,8 @@
 #include <drm/drm_rect.h>
 
 #include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
+#include "ttm_execbuf_util.h"
 #include "ttm_object.h"
 
 #include "vmwgfx_fence.h"
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
index f21df053882b..3613a3d52528 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
@@ -31,7 +31,7 @@
 #include <linux/list.h>
 #include <linux/ww_mutex.h>
 
-#include <drm/ttm/ttm_execbuf_util.h>
+#include "ttm_execbuf_util.h"
 
 #include "vmwgfx_hashtab.h"
 
-- 
2.25.1

