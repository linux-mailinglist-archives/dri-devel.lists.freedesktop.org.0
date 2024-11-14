Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A189C8E19
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213D610E80A;
	Thu, 14 Nov 2024 15:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cWJkFtPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A4910E816;
 Thu, 14 Nov 2024 15:30:32 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso143050366b.1; 
 Thu, 14 Nov 2024 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731598230; x=1732203030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ETDe7un/JWIbuM3P/iFQm3j6qLUZiVYIWE/wIZIF+UQ=;
 b=cWJkFtPW/MDMOq02Ra9halagBMGSRWxgVFpnW8z7FsgwM8Ce01o4ElctzJS7kH7++I
 9M57Jo/NK0aDoXozy9AYCc0chC/vSggxLMQnrVG+dwlC4gNJ4+MqC40x42+r9K9gqFx/
 AKCQzlIST43WMq4x+yguiTQSbT6hTC1wB96YwuCNBRiq9XFmmAsSU7aWl1w8NYmcnuKZ
 LL5HKOXd8kLyzjFisCw57CxpneVPEsEIZ6dImypLrzlzvzBvtX16bRObswNve9ecZCEp
 8caftWfZPDajFMNbwVutqeMIaipf8wbjpEqqpBx0Hx5Nl3gh7aAgo3/aYXXWIpfpAOq0
 1yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731598230; x=1732203030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETDe7un/JWIbuM3P/iFQm3j6qLUZiVYIWE/wIZIF+UQ=;
 b=lC/gz4O/GRHGxrmXVVNLbdmbgNlyY7JsffwYfvQvkgh01YsXLIbRDBDcphSAHYZTBO
 6D+/PniFI1P35cchAifR+LnEoP50RWPzRfWrjHdEWL/ltklKjfHcX9Gq6K/0GPst8crO
 96/MOoRCmQHCbxHQaG6/AYDEoW6ytJnlO86Inf5zJI6RVA3QTOtaaU+xwk7Rxh0L460+
 AkWWuQ8kVotjmdZk65XwTAWUmIOY+b8khft7l9TeJ4RtOZ28E4Ep5qCv7ThFHFRZHP8R
 BBV8TDotOHpEkt2RTc60Mx29eePthxej8W7jzEFXyPJlJL8zyFOr93RwfFjBjO11ZY5+
 fuIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQUBOeONuMSZeFjOVZDTQd6VWA++FRcDxaxjZHBO3iVynBnAUWu8HQnXbBiFBoPlXy75RLyMkYJZ86@lists.freedesktop.org,
 AJvYcCX3cXwgQQG7Wc+I/v17n2V5MgcoOgvktU6yPbMKZdiMurDvd2NsCIovRwCO7CGVLDvdiVCF07r/XkQ=@lists.freedesktop.org,
 AJvYcCXYo5g3bSbrrnN5z9hNeAVr5Alv+Zqv2Qq3RobBCUKQ0e2E9Y69U5tQSz9SJ5Q4xaae5siQhhgI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwF+LsnRrx/RJN6gHSceHaljnr5sJgoi9n6acPvN5jcnMRlJVlL
 zwAjIZfNUDvROrgqjYpZZusR0TEqoq7DCltBnsp5UZ9A9KZQwQth
X-Google-Smtp-Source: AGHT+IHMJ32RN2lfwiWsru/LwaWKk6ticRANDC7RG1vXcvThsUFNdNXUsMhAHyN7Z0gz/veli4lJ8A==
X-Received: by 2002:a17:907:3f07:b0:a9a:82e2:e8ce with SMTP id
 a640c23a62f3a-aa20cdc555cmr258205666b.40.1731598230245; 
 Thu, 14 Nov 2024 07:30:30 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15c9:2500:bb23:40f5:fe29:201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046919sm74063266b.156.2024.11.14.07.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 07:30:29 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: kraxel@redhat.com, airlied@redhat.com, alexander.deucher@amd.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 7/7] drm/ttm: remove ttm_execbug_util
Date: Thu, 14 Nov 2024 16:30:20 +0100
Message-Id: <20241114153020.6209-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114153020.6209-1-christian.koenig@amd.com>
References: <20241114153020.6209-1-christian.koenig@amd.com>
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

Replaced by drm_exec and not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/Makefile           |   4 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c | 161 -------------------------
 include/drm/ttm/ttm_execbuf_util.h     | 119 ------------------
 3 files changed, 2 insertions(+), 282 deletions(-)
 delete mode 100644 drivers/gpu/drm/ttm/ttm_execbuf_util.c
 delete mode 100644 include/drm/ttm/ttm_execbuf_util.h

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index dad298127226..25937e4ad91a 100644
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
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
deleted file mode 100644
index f1c60fa80c2d..000000000000
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ /dev/null
@@ -1,161 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR MIT */
-/**************************************************************************
- *
- * Copyright (c) 2006-2009 VMware, Inc., Palo Alto, CA., USA
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- **************************************************************************/
-
-#include <drm/ttm/ttm_execbuf_util.h>
-#include <drm/ttm/ttm_bo.h>
-
-static void ttm_eu_backoff_reservation_reverse(struct list_head *list,
-					      struct ttm_validate_buffer *entry)
-{
-	list_for_each_entry_continue_reverse(entry, list, head) {
-		struct ttm_buffer_object *bo = entry->bo;
-
-		dma_resv_unlock(bo->base.resv);
-	}
-}
-
-void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
-				struct list_head *list)
-{
-	struct ttm_validate_buffer *entry;
-
-	if (list_empty(list))
-		return;
-
-	list_for_each_entry(entry, list, head) {
-		struct ttm_buffer_object *bo = entry->bo;
-
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-		dma_resv_unlock(bo->base.resv);
-	}
-
-	if (ticket)
-		ww_acquire_fini(ticket);
-}
-EXPORT_SYMBOL(ttm_eu_backoff_reservation);
-
-/*
- * Reserve buffers for validation.
- *
- * If a buffer in the list is marked for CPU access, we back off and
- * wait for that buffer to become free for GPU access.
- *
- * If a buffer is reserved for another validation, the validator with
- * the highest validation sequence backs off and waits for that buffer
- * to become unreserved. This prevents deadlocks when validating multiple
- * buffers in different orders.
- */
-
-int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
-			   struct list_head *list, bool intr,
-			   struct list_head *dups)
-{
-	struct ttm_validate_buffer *entry;
-	int ret;
-
-	if (list_empty(list))
-		return 0;
-
-	if (ticket)
-		ww_acquire_init(ticket, &reservation_ww_class);
-
-	list_for_each_entry(entry, list, head) {
-		struct ttm_buffer_object *bo = entry->bo;
-		unsigned int num_fences;
-
-		ret = ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
-		if (ret == -EALREADY && dups) {
-			struct ttm_validate_buffer *safe = entry;
-			entry = list_prev_entry(entry, head);
-			list_del(&safe->head);
-			list_add(&safe->head, dups);
-			continue;
-		}
-
-		num_fences = max(entry->num_shared, 1u);
-		if (!ret) {
-			ret = dma_resv_reserve_fences(bo->base.resv,
-						      num_fences);
-			if (!ret)
-				continue;
-		}
-
-		/* uh oh, we lost out, drop every reservation and try
-		 * to only reserve this buffer, then start over if
-		 * this succeeds.
-		 */
-		ttm_eu_backoff_reservation_reverse(list, entry);
-
-		if (ret == -EDEADLK) {
-			ret = ttm_bo_reserve_slowpath(bo, intr, ticket);
-		}
-
-		if (!ret)
-			ret = dma_resv_reserve_fences(bo->base.resv,
-						      num_fences);
-
-		if (unlikely(ret != 0)) {
-			if (ticket) {
-				ww_acquire_done(ticket);
-				ww_acquire_fini(ticket);
-			}
-			return ret;
-		}
-
-		/* move this item to the front of the list,
-		 * forces correct iteration of the loop without keeping track
-		 */
-		list_del(&entry->head);
-		list_add(&entry->head, list);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(ttm_eu_reserve_buffers);
-
-void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
-				 struct list_head *list,
-				 struct dma_fence *fence)
-{
-	struct ttm_validate_buffer *entry;
-
-	if (list_empty(list))
-		return;
-
-	list_for_each_entry(entry, list, head) {
-		struct ttm_buffer_object *bo = entry->bo;
-
-		dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
-				   DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-		dma_resv_unlock(bo->base.resv);
-	}
-	if (ticket)
-		ww_acquire_fini(ticket);
-}
-EXPORT_SYMBOL(ttm_eu_fence_buffer_objects);
diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
deleted file mode 100644
index fac1e3e57ebd..000000000000
--- a/include/drm/ttm/ttm_execbuf_util.h
+++ /dev/null
@@ -1,119 +0,0 @@
-/**************************************************************************
- *
- * Copyright (c) 2006-2009 VMware, Inc., Palo Alto, CA., USA
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- **************************************************************************/
-/*
- * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
- */
-
-#ifndef _TTM_EXECBUF_UTIL_H_
-#define _TTM_EXECBUF_UTIL_H_
-
-#include <linux/list.h>
-
-struct ww_acquire_ctx;
-struct dma_fence;
-struct ttm_buffer_object;
-
-/**
- * struct ttm_validate_buffer
- *
- * @head:           list head for thread-private list.
- * @bo:             refcounted buffer object pointer.
- * @num_shared:     How many shared fences we want to add.
- */
-
-struct ttm_validate_buffer {
-	struct list_head head;
-	struct ttm_buffer_object *bo;
-	unsigned int num_shared;
-};
-
-/**
- * ttm_eu_backoff_reservation
- *
- * @ticket:   ww_acquire_ctx from reserve call
- * @list:     thread private list of ttm_validate_buffer structs.
- *
- * Undoes all buffer validation reservations for bos pointed to by
- * the list entries.
- */
-void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
-				struct list_head *list);
-
-/**
- * ttm_eu_reserve_buffers
- *
- * @ticket:  [out] ww_acquire_ctx filled in by call, or NULL if only
- *           non-blocking reserves should be tried.
- * @list:    thread private list of ttm_validate_buffer structs.
- * @intr:    should the wait be interruptible
- * @dups:    [out] optional list of duplicates.
- *
- * Tries to reserve bos pointed to by the list entries for validation.
- * If the function returns 0, all buffers are marked as "unfenced",
- * taken off the lru lists and are not synced for write CPU usage.
- *
- * If the function detects a deadlock due to multiple threads trying to
- * reserve the same buffers in reverse order, all threads except one will
- * back off and retry. This function may sleep while waiting for
- * CPU write reservations to be cleared, and for other threads to
- * unreserve their buffers.
- *
- * If intr is set to true, this function may return -ERESTARTSYS if the
- * calling process receives a signal while waiting. In that case, no
- * buffers on the list will be reserved upon return.
- *
- * If dups is non NULL all buffers already reserved by the current thread
- * (e.g. duplicates) are added to this list, otherwise -EALREADY is returned
- * on the first already reserved buffer and all buffers from the list are
- * unreserved again.
- *
- * Buffers reserved by this function should be unreserved by
- * a call to either ttm_eu_backoff_reservation() or
- * ttm_eu_fence_buffer_objects() when command submission is complete or
- * has failed.
- */
-int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
-			   struct list_head *list, bool intr,
-			   struct list_head *dups);
-
-/**
- * ttm_eu_fence_buffer_objects
- *
- * @ticket:      ww_acquire_ctx from reserve call
- * @list:        thread private list of ttm_validate_buffer structs.
- * @fence:       The new exclusive fence for the buffers.
- *
- * This function should be called when command submission is complete, and
- * it will add a new sync object to bos pointed to by entries on @list.
- * It also unreserves all buffers, putting them on lru lists.
- *
- */
-void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
-				 struct list_head *list,
-				 struct dma_fence *fence);
-
-#endif
-- 
2.34.1

