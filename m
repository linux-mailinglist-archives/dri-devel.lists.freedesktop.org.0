Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E197B86E72
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 22:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AAB10E8F5;
	Thu, 18 Sep 2025 20:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BPICQt7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747D810E3BC;
 Thu, 18 Sep 2025 20:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=woVS27yiYLORVThWbfEQkqZ5Ig2PmX/E6zj72wklklk=; b=BPICQt7zw+lEmchMwkXG065zLd
 WlcCBQbhDtkeMqpBEs6nQSofJmdnkAAJR5jUoXx9nncI/hK/5fVFySTy42O5NvLwRZGcJ6lRg8K2r
 V3OozTQ51zkuklzHsRMcRqTuT7JdQSkxdalVFBNsTs7qzN/w5M5L7w4DDhAMe5IcM4BspmU4H8WNU
 kmj7Gr/+DPHV6Em9EvhQSgYCO5IASqzpIrAIrJvCbVyhF07NyrUglOZkqI4PVIAwQ9Ol/xBu9hsbW
 nQYMTg619AtU3y56khX7KpGI62dBbrsU/7l0Ucfwqt1IiMkikNBjdk0+JOXCVt6Zo9YnqIS/z6rJo
 wCzWHfFA==;
Received: from 179-125-87-227-dinamico.pombonet.net.br ([179.125.87.227]
 helo=[127.0.0.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzLBp-00Dp3q-I8; Thu, 18 Sep 2025 22:25:13 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Thu, 18 Sep 2025 17:09:25 -0300
Subject: [PATCH RFC v2 2/3] ttm: pool: add a module parameter to set
 latency preference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-ttm_pool_no_direct_reclaim-v2-2-135294e1f8a2@igalia.com>
References: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
In-Reply-To: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
To: Christian Koenig <christian.koenig@amd.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2
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

This allows a system-wide setting for allocations of higher order pages not
to use direct reclaim. The default setting is to keep existing behavior and
allow direct reclaim when allocating higher order pages.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 12 ++++++++++--
 drivers/gpu/drm/ttm/ttm_tt.c   |  2 +-
 include/drm/ttm/ttm_pool.h     |  2 +-
 include/drm/ttm/ttm_tt.h       |  2 +-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 02c622a103fcece003bd70ce6b5833ada70f5228..39203f2c247a36b0389682d7fb841088f4c8a95b 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -56,6 +56,11 @@ static DECLARE_FAULT_ATTR(backup_fault_inject);
 #define should_fail(...) false
 #endif
 
+static unsigned int ttm_alloc_method;
+
+MODULE_PARM_DESC(alloc_method, "TTM allocation method (0 - throughput, 1 - latency");
+module_param_named(alloc_method, ttm_alloc_method, uint, 0644);
+
 /**
  * struct ttm_pool_dma - Helper object for coherent DMA mappings
  *
@@ -702,7 +707,7 @@ static unsigned int ttm_pool_alloc_find_order(unsigned int highest,
 }
 
 static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
-			    const struct ttm_operation_ctx *ctx,
+			    struct ttm_operation_ctx *ctx,
 			    struct ttm_pool_alloc_state *alloc,
 			    struct ttm_pool_tt_restore *restore)
 {
@@ -717,6 +722,9 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	WARN_ON(!alloc->remaining_pages || ttm_tt_is_populated(tt));
 	WARN_ON(alloc->dma_addr && !pool->dev);
 
+	if (ctx->alloc_method == ttm_op_alloc_default && ttm_alloc_method == 1)
+		ctx->alloc_method = ttm_op_alloc_latency;
+
 	if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
 		gfp_flags |= __GFP_ZERO;
 
@@ -837,7 +845,7 @@ EXPORT_SYMBOL(ttm_pool_alloc);
  * Returns: 0 on successe, negative error code otherwise.
  */
 int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
-			       const struct ttm_operation_ctx *ctx)
+			       struct ttm_operation_ctx *ctx)
 {
 	struct ttm_pool_alloc_state alloc;
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 506e257dfba8501815f8416e808f437e5f17aa8f..e1975d740b948f9b7fe1d35d913a458026d2c783 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -294,7 +294,7 @@ long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
 }
 
 int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
-		   const struct ttm_operation_ctx *ctx)
+		   struct ttm_operation_ctx *ctx)
 {
 	int ret = ttm_pool_restore_and_alloc(&bdev->pool, tt, ctx);
 
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 54cd34a6e4c0ac5e17844b50fd08e72143b460c1..08f9a1388754fac352058ac2beb2b59bb944477c 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -95,7 +95,7 @@ void ttm_pool_drop_backed_up(struct ttm_tt *tt);
 long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *ttm,
 		     const struct ttm_backup_flags *flags);
 int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
-			       const struct ttm_operation_ctx *ctx);
+			       struct ttm_operation_ctx *ctx);
 
 int ttm_pool_mgr_init(unsigned long num_pages);
 void ttm_pool_mgr_fini(void);
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 406437ad674bf1a96527b45c5a81c58a747271c1..3575e20b77f3ccbc3d9aad0afbb762055b3cb139 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -296,7 +296,7 @@ long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
 		   const struct ttm_backup_flags flags);
 
 int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
-		   const struct ttm_operation_ctx *ctx);
+		   struct ttm_operation_ctx *ctx);
 
 int ttm_tt_setup_backup(struct ttm_tt *tt);
 

-- 
2.47.3

