Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10214919EB5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 07:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3145410E0EC;
	Thu, 27 Jun 2024 05:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hQEMLP5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A27210E028
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 05:34:58 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4450187d3d4so14937941cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 22:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719466497; x=1720071297;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LK+XwEE01O9MKbEeRLGG6iMONNez/yjAzdrVbw7Inj4=;
 b=hQEMLP5PmAuGDRh42vLFM1qh0uk5SgANqxTmni8c770FWgI/99MrgCSBs1ILUx0BSn
 CXLqMl4mN44vMbH83VflRRmGlH8JcJbeSarO+/Dx07dCuUHcPt/hqw3byXsReEIJ+e7x
 YH12OuFXjg6Ek1E/EWeTMpoThX0ZtKE8q/AFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719466497; x=1720071297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LK+XwEE01O9MKbEeRLGG6iMONNez/yjAzdrVbw7Inj4=;
 b=PJ3C3kRolnhjxMqa1imZFP6ctv5fCEDAvdcYowa+44s0Ct2knBicOwrW0pIP5/Kx38
 oWd8M5Tdakex6tH03yfPjGS4uTDe6bpTzslFa2Vj92D02/KMW1d43sxPP9qxu38y/zt1
 58+dt5gpW839HGW6mOPUUQpwH9wToUtdb/yLd7+sNm0lyvIxZgFWKGyNnTscjr4+DmME
 nTV6Wl1VjB8tIazJQjLxiMj/m8bI2/hPG46jRmVIvew+DCMXGfmh7TMUHQzEBgsj2v9x
 RiPiBor5vM3GYao/AJe4ZM7IwrSHRNCiMjUfpTXDy0DkTSczFcGJqxPiEN7ihepSc0yt
 u07w==
X-Gm-Message-State: AOJu0Yx1jsZ96dzl2SzSb8E9dM4hj+Gn1Ut20G9hundP1mMgQViFeLUR
 mf9vH3e1cNuWtEUuWOVVxTKbhE57i14TsyWRJPFzy64HoE4FQjHTPu2WY/tMETK9K8NnNr5S7Gh
 trJDbVYlvx6/QmfV2+E5Xtibn7C2VUZECbdYU+ze4bXY/LH07xBGVtMOqzb6KmCnt9kVWSXhvCW
 dC4qZjiEjaPmv0f5NVZxUJYEyyucK4/vtUs3Il7pfJHoGOGz1EJhPT
X-Google-Smtp-Source: AGHT+IHp5/i0t5sk4CoNslu9Wp27s7TFeESY5oQsJH6qvvjuav3XPhaIgZjEunVznE4PpUJvExi+LA==
X-Received: by 2002:a05:622a:3cc:b0:446:33d8:791a with SMTP id
 d75a77b69052e-4463d50cb74mr20782831cf.50.1719466495848; 
 Wed, 26 Jun 2024 22:34:55 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44641eebfa0sm2716971cf.48.2024.06.26.22.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 22:34:55 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH 1/4] drm/vmwgfx: Fix a deadlock in dma buf fence polling
Date: Thu, 27 Jun 2024 01:34:49 -0400
Message-Id: <20240627053452.2908605-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240627053452.2908605-1-zack.rusin@broadcom.com>
References: <20240627053452.2908605-1-zack.rusin@broadcom.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 5efc6a766f64..76971ef7801a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -32,7 +32,6 @@
 #define VMW_FENCE_WRAP (1 << 31)
 
 struct vmw_fence_manager {
-	int num_fence_objects;
 	struct vmw_private *dev_priv;
 	spinlock_t lock;
 	struct list_head fence_list;
@@ -120,16 +119,23 @@ static void vmw_fence_goal_write(struct vmw_private *vmw, u32 value)
  * objects with actions attached to them.
  */
 
-static void vmw_fence_obj_destroy(struct dma_fence *f)
+static void vmw_fence_obj_destroy_removed(struct dma_fence *f)
 {
 	struct vmw_fence_obj *fence =
 		container_of(f, struct vmw_fence_obj, base);
 
+	WARN_ON(!list_empty(&fence->head));
+	fence->destroy(fence);
+}
+
+static void vmw_fence_obj_destroy(struct dma_fence *f)
+{
+	struct vmw_fence_obj *fence =
+		container_of(f, struct vmw_fence_obj, base);
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 
 	spin_lock(&fman->lock);
 	list_del_init(&fence->head);
-	--fman->num_fence_objects;
 	spin_unlock(&fman->lock);
 	fence->destroy(fence);
 }
@@ -257,6 +263,13 @@ static const struct dma_fence_ops vmw_fence_ops = {
 	.release = vmw_fence_obj_destroy,
 };
 
+static const struct dma_fence_ops vmw_fence_ops_removed = {
+	.get_driver_name = vmw_fence_get_driver_name,
+	.get_timeline_name = vmw_fence_get_timeline_name,
+	.enable_signaling = vmw_fence_enable_signaling,
+	.wait = vmw_fence_wait,
+	.release = vmw_fence_obj_destroy_removed,
+};
 
 /*
  * Execute signal actions on fences recently signaled.
@@ -355,7 +368,6 @@ static int vmw_fence_obj_init(struct vmw_fence_manager *fman,
 		goto out_unlock;
 	}
 	list_add_tail(&fence->head, &fman->fence_list);
-	++fman->num_fence_objects;
 
 out_unlock:
 	spin_unlock(&fman->lock);
@@ -403,7 +415,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 				      u32 passed_seqno)
 {
 	u32 goal_seqno;
-	struct vmw_fence_obj *fence;
+	struct vmw_fence_obj *fence, *next_fence;
 
 	if (likely(!fman->seqno_valid))
 		return false;
@@ -413,7 +425,7 @@ static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
 		return false;
 
 	fman->seqno_valid = false;
-	list_for_each_entry(fence, &fman->fence_list, head) {
+	list_for_each_entry_safe(fence, next_fence, &fman->fence_list, head) {
 		if (!list_empty(&fence->seq_passed_actions)) {
 			fman->seqno_valid = true;
 			vmw_fence_goal_write(fman->dev_priv,
@@ -471,6 +483,7 @@ static void __vmw_fences_update(struct vmw_fence_manager *fman)
 rerun:
 	list_for_each_entry_safe(fence, next_fence, &fman->fence_list, head) {
 		if (seqno - fence->base.seqno < VMW_FENCE_WRAP) {
+			fence->base.ops = &vmw_fence_ops_removed;
 			list_del_init(&fence->head);
 			dma_fence_signal_locked(&fence->base);
 			INIT_LIST_HEAD(&action_list);
@@ -662,6 +675,7 @@ void vmw_fence_fifo_down(struct vmw_fence_manager *fman)
 					 VMW_FENCE_WAIT_TIMEOUT);
 
 		if (unlikely(ret != 0)) {
+			fence->base.ops = &vmw_fence_ops_removed;
 			list_del_init(&fence->head);
 			dma_fence_signal(&fence->base);
 			INIT_LIST_HEAD(&action_list);
-- 
2.40.1

