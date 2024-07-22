Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300BC9393C6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 20:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C77A10E283;
	Mon, 22 Jul 2024 18:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gbZfvNPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F1F10E081
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 18:43:25 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7a1a6af9401so169804285a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 11:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721673804; x=1722278604;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1Q+WtxgLGLDV4vft3U4bEIvX489UvKjK9odMCfURBQ=;
 b=gbZfvNPk53AWae9Qb6x2VDvrpxVBIE5To+JQOxvqXco8+igYpm+7pzdIvw48LZNyM6
 o3zLkFvQWDs/75PLUHJ0QCqT3Su3V5wYNLSkSPHvZ8EWfgAc7uA7OIwEm5VmWYvVbtdb
 NnjpCyhcaOf5BHVajw/Fm0un7VaWNl1N8J2/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721673804; x=1722278604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1Q+WtxgLGLDV4vft3U4bEIvX489UvKjK9odMCfURBQ=;
 b=nxfE9DNIaTzkh2MD+csBsuGZ39Sho/geh4zKRhL7bI24LH3DZe1FKEiEtqZW4gAExO
 tflvfgL4Ql2VQEHFmFmZh+g8H2XjBPHPKS4YyxvhS4r31Mpdx6hN0OIMxWs/xoVSjsB/
 vg0/x3DdE2F/PiqJNityaWowhh0WN8OkB8olJHMJN1dyEKmD+7Ugv/O2BGh5dM1NkfI8
 pNg6XjAFBujXriOSbVCimz74wUE/kbA5ub3HZBdqRPiEDzJjPiz2OB1w5Tjg+QavTr6k
 rlgz3b3jSOWUWDMHLY7wNkvBNxuMB+qUKEkD7VFRfG+2vg9B4MLcadqWuDbmFdu7eq9t
 jEPg==
X-Gm-Message-State: AOJu0YwA8kGBrJufY126QXc302M3a52gcj88clBntPJtX1LfSBzdDCMV
 O4AsUhMaiGJMWF5t67KcWN9+xJcA1wzrWjsFJid0WSYQb1JbkR2kFfzp0XHdIuemwuhfbpKqjq1
 p+RbCOHrmRHCaxc/ob6DMfkdQHvOjzpll3irmRuttn0gmvDmv9OqUGxnnXdaVoKRT/TxyWhwdSS
 pij6PLAqCC3ZEXRe0hO3NwdwpIFexlOIq8uEmQkX7xG3+tNOAOfQ==
X-Google-Smtp-Source: AGHT+IFF/GbzZPq76eDZtucxkmDivWerAfkitA5HZ2DK3idQSjKvXTXA7UuPHqhVfUTIICxlmpmRTQ==
X-Received: by 2002:a05:6214:5093:b0:6b7:6544:c004 with SMTP id
 6a1803df08f44-6b96106e06emr110345866d6.1.1721673804048; 
 Mon, 22 Jul 2024 11:43:24 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7acafdb01sm38261466d6.129.2024.07.22.11.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 11:43:23 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH v5 1/4] drm/vmwgfx: Fix a deadlock in dma buf fence polling
Date: Mon, 22 Jul 2024 14:41:13 -0400
Message-ID: <20240722184313.181318-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722184313.181318-1-zack.rusin@broadcom.com>
References: <20240722184313.181318-1-zack.rusin@broadcom.com>
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

Introduce a version of the fence ops that on release doesn't remove
the fence from the pending list, and thus doesn't require a lock to
fix poll->fence wait->fence unref deadlocks.

vmwgfx overwrites the wait callback to iterate over the list of all
fences and update their status, to do that it holds a lock to prevent
the list modifcations from other threads. The fence destroy callback
both deletes the fence and removes it from the list of pending
fences, for which it holds a lock.

dma buf polling cb unrefs a fence after it's been signaled: so the poll
calls the wait, which signals the fences, which are being destroyed.
The destruction tries to acquire the lock on the pending fences list
which it can never get because it's held by the wait from which it
was called.

Old bug, but not a lot of userspace apps were using dma-buf polling
interfaces. Fix those, in particular this fixes KDE stalls/deadlock.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 2298e804e96e ("drm/vmwgfx: rework to new fence interface, v2")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 5efc6a766f64..588d50ababf6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -32,7 +32,6 @@
 #define VMW_FENCE_WRAP (1 << 31)
 
 struct vmw_fence_manager {
-	int num_fence_objects;
 	struct vmw_private *dev_priv;
 	spinlock_t lock;
 	struct list_head fence_list;
@@ -124,13 +123,13 @@ static void vmw_fence_obj_destroy(struct dma_fence *f)
 {
 	struct vmw_fence_obj *fence =
 		container_of(f, struct vmw_fence_obj, base);
-
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 
-	spin_lock(&fman->lock);
-	list_del_init(&fence->head);
-	--fman->num_fence_objects;
-	spin_unlock(&fman->lock);
+	if (!list_empty(&fence->head)) {
+		spin_lock(&fman->lock);
+		list_del_init(&fence->head);
+		spin_unlock(&fman->lock);
+	}
 	fence->destroy(fence);
 }
 
@@ -257,7 +256,6 @@ static const struct dma_fence_ops vmw_fence_ops = {
 	.release = vmw_fence_obj_destroy,
 };
 
-
 /*
  * Execute signal actions on fences recently signaled.
  * This is done from a workqueue so we don't have to execute
@@ -355,7 +353,6 @@ static int vmw_fence_obj_init(struct vmw_fence_manager *fman,
 		goto out_unlock;
 	}
 	list_add_tail(&fence->head, &fman->fence_list);
-	++fman->num_fence_objects;
 
 out_unlock:
 	spin_unlock(&fman->lock);
@@ -403,7 +400,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 				      u32 passed_seqno)
 {
 	u32 goal_seqno;
-	struct vmw_fence_obj *fence;
+	struct vmw_fence_obj *fence, *next_fence;
 
 	if (likely(!fman->seqno_valid))
 		return false;
@@ -413,7 +410,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 		return false;
 
 	fman->seqno_valid = false;
-	list_for_each_entry(fence, &fman->fence_list, head) {
+	list_for_each_entry_safe(fence, next_fence, &fman->fence_list, head) {
 		if (!list_empty(&fence->seq_passed_actions)) {
 			fman->seqno_valid = true;
 			vmw_fence_goal_write(fman->dev_priv,
-- 
2.43.0

