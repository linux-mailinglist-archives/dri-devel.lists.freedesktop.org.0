Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203956A5472
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB1E10E64F;
	Tue, 28 Feb 2023 08:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58E310E5E0;
 Tue, 28 Feb 2023 08:34:20 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id cy6so36575710edb.5;
 Tue, 28 Feb 2023 00:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/hmbm/q0nSKNbqQpgu9nQ6qdhK2VpCsSoq4ps+Ylow=;
 b=AGht0Vd60zzLNPAlw4Ol2WZFE57+NhYsd01ieaAnwKAqQ6oxwvmzTEpa81oe5tnL8W
 cYXfGuYierW3h46C/s3Cn8qkRDVmkZ9EQ91IObTjnnq+pubENHcF8bJTbyALPpSIvMnr
 Ms9F6DygwhyMHLfa+WtaybQvkmg03PRcpLBKW5jCNju/SvsTHLXNhJ9dOG+UApCwqcJK
 XrYfuEKnMlYj/ZIi9B4tDxKVBxXshT43q7mDvrYocNCOnTnovevoWBl6Ru3QBFBeMswN
 zpQft/DxtcszyDmrPjwxn8ztekyrIhH4Fm/UTocCF/wpmc48FaufeF1LMTz+RU3zjVgk
 DEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/hmbm/q0nSKNbqQpgu9nQ6qdhK2VpCsSoq4ps+Ylow=;
 b=sSRQJeyLEJBxfamIip0Zi1xGZzYB9WFZs12bI3o/7xk80B+cTaFWpzAZ+vQUnoqZLn
 cDDpfoX1SdC1FMXcURA1sj1bWlwCAU2Pyc5yRPbO0SwV86rubya2Sktz0RaaNU/MYhaM
 ekOQrl/AXHx1jfqLblXWsUOg9vNsXocNu1WjhXDXA408aGN3zCJFfP9DpVpRLQQb3w+P
 9nYwtOJYcbN4pRVHrmGMPY0TzMT/LMK9Yu5ssMt94XAhS2bUy7pR1OxR9A41qb5sFs2O
 BuRLYrQt2eJz9X48kFYGhCb6Anix9co76ef2z3EjVnynR9PYMSzyZourSWql6JK4r6/P
 xnCA==
X-Gm-Message-State: AO0yUKXFO1ktc2OcXvET7xXGGyP1Z4EetG/ZruhGyQ1DGqkn+aR1S5gN
 VQvGWjkH3ED6zwYh2oHVemIzsGBvzvY=
X-Google-Smtp-Source: AK7set/UdJyyW1j1CKa7Ky3v16AMCR3iXoSK1ncaOrr2yq59k1y3rfpOA1wLHCC4BXmjC04gToAbWA==
X-Received: by 2002:a17:906:430b:b0:8af:370a:c1f8 with SMTP id
 j11-20020a170906430b00b008af370ac1f8mr1528509ejm.23.1677573260541; 
 Tue, 28 Feb 2023 00:34:20 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ss17-20020a170907039100b008cf6f8798e1sm4296969ejb.54.2023.02.28.00.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:34:20 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm: move ttm_execbuf_util into vmwgfx
Date: Tue, 28 Feb 2023 09:34:06 +0100
Message-Id: <20230228083406.1720795-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228083406.1720795-1-christian.koenig@amd.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
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
Cc: dakr@redhat.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VMWGFX is the only remaining user of this and should probably moved over
to drm_exec when it starts using GEM as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/Makefile                               | 4 ++--
 drivers/gpu/drm/vmwgfx/Makefile                            | 2 +-
 drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c         | 7 ++++++-
 .../drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h  | 0
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                        | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h                 | 2 +-
 6 files changed, 11 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c (97%)
 rename {include/drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h (100%)

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
index e94479d9cd5b..e30e10e25c53 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
-	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
+	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o ttm_execbuf_util.o \
 	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o \
 	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
 	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
similarity index 97%
rename from drivers/gpu/drm/ttm/ttm_execbuf_util.c
rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
index f1c60fa80c2d..5e4e28899acd 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
@@ -26,8 +26,13 @@
  *
  **************************************************************************/
 
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_placement.h>
+#include <linux/wait.h>
+#include <linux/sched.h>
+#include <linux/module.h>
+
+#include "ttm_execbuf_util.h"
 
 static void ttm_eu_backoff_reservation_reverse(struct list_head *list,
 					      struct ttm_validate_buffer *entry)
diff --git a/include/drm/ttm/ttm_execbuf_util.h b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
similarity index 100%
rename from include/drm/ttm/ttm_execbuf_util.h
rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index fb8f0c0642c0..49e3dd8c04ec 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -37,11 +37,11 @@
 #include <drm/drm_file.h>
 #include <drm/drm_rect.h>
 
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_bo.h>
 
+#include "ttm_execbuf_util.h"
 #include "ttm_object.h"
 
 #include "vmwgfx_fence.h"
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
index 240ee0c4ebfd..927fc8afdbfe 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
@@ -32,7 +32,7 @@
 #include <linux/hashtable.h>
 #include <linux/ww_mutex.h>
 
-#include <drm/ttm/ttm_execbuf_util.h>
+#include "ttm_execbuf_util.h"
 
 #define VMW_RES_DIRTY_NONE 0
 #define VMW_RES_DIRTY_SET BIT(0)
-- 
2.34.1

