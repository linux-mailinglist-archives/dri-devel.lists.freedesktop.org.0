Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E8CB5D0F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C3D10E331;
	Thu, 11 Dec 2025 12:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mPapErYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC7510E7F9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso351325e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455865; x=1766060665; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ORLHz2w3HN7577WYeRBNKkUA0nS4mT9h86Mtx8Nxokw=;
 b=mPapErYbOAv2rTg/dYdwNzDJSgituy0vuotwmJw+l+XN6zoRorRGWrwtkQyHkJk/5C
 B3fAVhiDZFLikvFkwRvgvMPI76jMjx5+ZfqeCHmlqyPAYijxaa7d4In/kghWwQerrEHN
 THe3SUT33wregtQZtqbmT5n1qAIMqfku5p6/2Ot24Obpb6FG0ew7+Z4zFeMG9eeA/DrP
 XHdHSpi1TFM3WXBw33OJ29CV8rVa6RnCO48QuvbfrNJJBv6AXgpmEwB7ICHMse5OGej2
 MiZtSI3NPjR55z35EcUCM0bK9r7RRJvQgARM09PVHu5bfwfQAW7ssyQrTmvqnmMLb6Km
 OJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455865; x=1766060665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ORLHz2w3HN7577WYeRBNKkUA0nS4mT9h86Mtx8Nxokw=;
 b=F9Fs9QS7caggv0+3hkWOfwg7xE2RO5Ob30Grj4a4DE4723IRlh8oiwKoo4ckHIGvaq
 cHyY6NeNIMn2XIKZ1EOlYVBASHQW0ffuw98s0yUXvxrChVq+DLf0InvQ2wDuzE/zitY5
 ocDc8ecXaHLzHvg8dOAzZea7WYwCzteucotmO1ZRp+ApcB3RWqDtG06e2/2Rt/Tz5iqA
 y2lwo8pYq2gJjLumV8VGoo8GFGlyrqLAZSKZhaZKaWenKGpHa+u/MvZVx53elEwiQtR9
 HiiDyUdyrGHuiHIO3PGFWvkNQ2lhmQiJBwOm4H5sV2v1uuPnKHGb7Z+BpH6cp/58FeRY
 pVcA==
X-Gm-Message-State: AOJu0Yz/znVbSrlA4OP8jRGlGuP19yAtjis6+JHKZ2ObqxcvUGJCzzmp
 n794gRH09BDhSrYQusoVYPG212c3x8bMYhNb8eqZmOITG/aTSi3LCgt/
X-Gm-Gg: AY/fxX47h+SB96j/QTPmRaj7YagyiPQXa9+TOjdqm35yK3KDAwh1u89Mq7uko4deC2P
 8rc36XnSMh22MDnxUnV7mgYGvdaTM9hH5zXchTMKcpTODS0xiXQIx3+JltAiedoQPF1ib6jOt/9
 5pm+NH+Y206WEt970KB0dVN6M/AtikXAE5YHtvRJD2Ur1uEypPn8Mu3v7mQwcXk83oabAbRbt44
 E9d3u0FdaES91iHn4EfGEH0lmuQ77F2lq1zgx7JXoEJ3GyKI3QomuLUczDoL7VCltmTGGT20UOr
 CxePFh4/gITA1rzk1aSt1sejqXoUD6QrwiBsCwLoQDZ41tcaLOJmFSY//E2qj1w1SoIGh99T2ce
 VAPf4shuLcbpV0wUgAU53G52vhrTaCzIv+07j/m6j3d2GRT6xCaryi5qdVkRWm+yS0DcdeW+3hc
 gT8nmv10otQ5J+1zhY50qBAsoh
X-Google-Smtp-Source: AGHT+IHQf20MGdezP6xuUeOkiQD2QK3yNI8WJQHWSFA0RgATAjf6yJa3ioXgk/P4Upq2VpMN45CmyA==
X-Received: by 2002:a05:600c:3b24:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-47a8bd020d8mr12351965e9.5.1765455864578; 
 Thu, 11 Dec 2025 04:24:24 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:24 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 17/19] drm/xe: Drop HW fence slab
Date: Thu, 11 Dec 2025 13:16:48 +0100
Message-ID: <20251211122407.1709-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Helps with disconnecting fences from Xe module.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 25 ++-----------------------
 drivers/gpu/drm/xe/xe_hw_fence.h |  3 ---
 drivers/gpu/drm/xe/xe_module.c   |  5 -----
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 3d89c660ea73..86bd554bba3e 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -6,7 +6,6 @@
 #include "xe_hw_fence.h"
 
 #include <linux/device.h>
-#include <linux/slab.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -16,28 +15,9 @@
 #include "xe_map.h"
 #include "xe_trace.h"
 
-static struct kmem_cache *xe_hw_fence_slab;
-
-int __init xe_hw_fence_module_init(void)
-{
-	xe_hw_fence_slab = kmem_cache_create("xe_hw_fence",
-					     sizeof(struct xe_hw_fence), 0,
-					     SLAB_HWCACHE_ALIGN, NULL);
-	if (!xe_hw_fence_slab)
-		return -ENOMEM;
-
-	return 0;
-}
-
-void xe_hw_fence_module_exit(void)
-{
-	rcu_barrier();
-	kmem_cache_destroy(xe_hw_fence_slab);
-}
-
 static struct xe_hw_fence *fence_alloc(void)
 {
-	return kmem_cache_zalloc(xe_hw_fence_slab, GFP_KERNEL);
+	return kzalloc(sizeof(struct xe_hw_fence), GFP_KERNEL);
 }
 
 static void fence_free(struct rcu_head *rcu)
@@ -45,8 +25,7 @@ static void fence_free(struct rcu_head *rcu)
 	struct xe_hw_fence *fence =
 		container_of(rcu, struct xe_hw_fence, dma.rcu);
 
-	if (!WARN_ON_ONCE(!fence))
-		kmem_cache_free(xe_hw_fence_slab, fence);
+	kfree(fence);
 }
 
 static void hw_fence_irq_run_cb(struct irq_work *work)
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index f13a1c4982c7..96f34332fd8d 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -11,9 +11,6 @@
 /* Cause an early wrap to catch wrapping errors */
 #define XE_FENCE_INITIAL_SEQNO (-127)
 
-int xe_hw_fence_module_init(void);
-void xe_hw_fence_module_exit(void);
-
 void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..32517bcd533c 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -12,7 +12,6 @@
 
 #include "xe_drv.h"
 #include "xe_configfs.h"
-#include "xe_hw_fence.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_observation.h"
@@ -114,10 +113,6 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_configfs_init,
 		.exit = xe_configfs_exit,
 	},
-	{
-		.init = xe_hw_fence_module_init,
-		.exit = xe_hw_fence_module_exit,
-	},
 	{
 		.init = xe_sched_job_module_init,
 		.exit = xe_sched_job_module_exit,
-- 
2.43.0

