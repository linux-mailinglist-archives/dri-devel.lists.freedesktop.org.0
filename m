Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B99D4ADF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 11:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F4710E8D0;
	Thu, 21 Nov 2024 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WCiKrCL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26F410E1CB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 10:27:30 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so8366865e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 02:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732184849; x=1732789649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9jxy8nHq7ZEXkys7bCB9OhjPu6tUBHKnBmqrURartuE=;
 b=WCiKrCL4Tf0zPdkias4jgD6volK4K8gX1LfOlkK/hO4dAED35WsKdp5t9b3Wbgor9b
 rERBT4fG0MNjcidXdEyzAZ0Bw+X/DGGhuF8xXJmwiyXNDjtQto1PGwpfjJNxe8uW44on
 EX0kNI86uDr+acSMFhMnFUz8IrlTwi+S07nvlaQakzZyYTirgigQZ3UXcng5HUNT9TCD
 U0MinYdoWiJ4/IFpHQVpVPT1TX7KmJYkXejuRsfCVVjaU0fhKTBl11XS89Ane7Kx/BCn
 /7c8mBhAyLV7WiEr7KPBa8Vln6nCLqB/42cGnL9JnGI6/zfhRl5clA077nc4noedKAb5
 45sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732184849; x=1732789649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9jxy8nHq7ZEXkys7bCB9OhjPu6tUBHKnBmqrURartuE=;
 b=J0ciW+xJh70UHzYEX+yPbT2uVa3VO3r89wj0BtRIp/0CvG8IakELkQ8gj8by1lTP5w
 KAB7BceSTsFdXqkRSePFs1sD9cb41CtVn9UXYCP6dYZ6DZiIHMXH9jT0E1OYIA+QfLr0
 XRw8/6b8uhicGHD2nInWngyfBICR7N2F7UnF+jGe6sH0pm+0+F7kzs4euMXDKvqJ2JC4
 ow1eim18RVKGcRGpdT3ls7eVjBIR3IIQkE9sgNhepg5r0rWfYApPmNejDlqSw8HamqiN
 qDblwmYcelWHPvmpRqjX4gV6Hi6DBy1IhmBdY6K2o0sa6iRkkBL0bVOaljvVj3oLidq2
 P0FQ==
X-Gm-Message-State: AOJu0Yx8YLJORj6KzTueI4KLv33pztRiF7VVCOBC1YLvUtSBwraCDlav
 ngPk4/r9U5OaajnPnD1rM4DnHLkjVLuAGEGB7BlNLMMsfGPRR22Fz1mt+NVB
X-Google-Smtp-Source: AGHT+IF7JYwf0vN4IGOn+C8Nu+p41stRTwEDk/V4KgUZILO7rN+tW3PKmNYt1gDUQn8FydOVy8GSAw==
X-Received: by 2002:a7b:cde1:0:b0:431:24c3:dbaa with SMTP id
 5b1f17b1804b1-433c546cbc2mr36740055e9.2.1732184849113; 
 Thu, 21 Nov 2024 02:27:29 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1564:d000:2ed:2997:a6e4:61cb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d17ccsm52533165e9.6.2024.11.21.02.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 02:27:28 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: zack.rusin@broadcom.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/vmwgfx: start to phase out ttm_exec v2
Date: Thu, 21 Nov 2024 11:27:22 +0100
Message-Id: <20241121102725.4195-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121102725.4195-1-christian.koenig@amd.com>
References: <20241121102725.4195-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start switching over vmwgfx to drm_exec as well. Replacing some
unnecessary complex calls with just just single BO dma_resv locking.

No intentional functional change, but only compile tested for now.

v2: fix kerneldoc issues

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 53 ++++++++----------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index a73af8a355fb..0002b2f9a6c9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -510,14 +510,14 @@ void vmw_resource_unreserve(struct vmw_resource *res,
  * @res:            The resource for which to allocate a backup buffer.
  * @interruptible:  Whether any sleeps during allocation should be
  *                  performed while interruptible.
- * @val_buf:        On successful return contains data about the
- *                  reserved and validated backup buffer.
+ * @bo:             On successful return contains the reserved and validated
+ *                  backup buffer.
  */
 static int
 vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 			  struct vmw_resource *res,
 			  bool interruptible,
-			  struct ttm_validate_buffer *val_buf)
+			  struct ttm_buffer_object **bo)
 {
 	struct ttm_operation_ctx ctx = { true, false };
 	struct list_head val_list;
@@ -532,10 +532,12 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 
 	INIT_LIST_HEAD(&val_list);
 	ttm_bo_get(&res->guest_memory_bo->tbo);
-	val_buf->bo = &res->guest_memory_bo->tbo;
-	val_buf->num_shared = 0;
-	list_add_tail(&val_buf->head, &val_list);
-	ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
+
+	*bo = &res->guest_memory_bo->tbo;
+	if (ticket)
+		ww_acquire_init(ticket, &reservation_ww_class);
+
+	ret = ttm_bo_reserve(*bo, interruptible, (ticket == NULL), ticket);
 	if (unlikely(ret != 0))
 		goto out_no_reserve;
 
@@ -555,10 +557,11 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 	return 0;
 
 out_no_validate:
-	ttm_eu_backoff_reservation(ticket, &val_list);
+	dma_resv_unlock((*bo)->base.resv);
+	if (ticket)
+		ww_acquire_fini(ticket);
 out_no_reserve:
-	ttm_bo_put(val_buf->bo);
-	val_buf->bo = NULL;
+	ttm_bo_put(*bo);
 	if (guest_memory_dirty)
 		vmw_user_bo_unref(&res->guest_memory_bo);
 
@@ -600,29 +603,6 @@ int vmw_resource_reserve(struct vmw_resource *res, bool interruptible,
 	return 0;
 }
 
-/**
- * vmw_resource_backoff_reservation - Unreserve and unreference a
- *                                    guest memory buffer
- *.
- * @ticket:         The ww acquire ctx used for reservation.
- * @val_buf:        Guest memory buffer information.
- */
-static void
-vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
-				 struct ttm_validate_buffer *val_buf)
-{
-	struct list_head val_list;
-
-	if (likely(val_buf->bo == NULL))
-		return;
-
-	INIT_LIST_HEAD(&val_list);
-	list_add_tail(&val_buf->head, &val_list);
-	ttm_eu_backoff_reservation(ticket, &val_list);
-	ttm_bo_put(val_buf->bo);
-	val_buf->bo = NULL;
-}
-
 /**
  * vmw_resource_do_evict - Evict a resource, and transfer its data
  *                         to a backup buffer.
@@ -642,7 +622,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
 
 	val_buf.bo = NULL;
 	val_buf.num_shared = 0;
-	ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
+	ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf.bo);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -657,7 +637,10 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
 	res->guest_memory_dirty = true;
 	res->res_dirty = false;
 out_no_unbind:
-	vmw_resource_backoff_reservation(ticket, &val_buf);
+	dma_resv_unlock(val_buf.bo->base.resv);
+	if (ticket)
+		ww_acquire_fini(ticket);
+	ttm_bo_put(val_buf.bo);
 
 	return ret;
 }
-- 
2.34.1

