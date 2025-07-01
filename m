Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4188FAEFA41
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 15:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4AE10E5AB;
	Tue,  1 Jul 2025 13:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aUyjcazN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4D610E2BC;
 Tue,  1 Jul 2025 13:22:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1105E5C560F;
 Tue,  1 Jul 2025 13:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07B4C4CEEB;
 Tue,  1 Jul 2025 13:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751376159;
 bh=QPT51nD7e7AHwZ27sJjHwy+UmpkZSyFDrE7MKORACwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aUyjcazN1qGH9bivXxKWfTg67qgyJoURtVk5CGRZQe/PRMxHT53CAnVUrVbwLnBa4
 3Ug7jwkXtem6lrSlRFJPGDoABmoAk8Mv6ZR4NaZHDSLxKLkmAbNQANoTjDQNuCZxTj
 4QHnx+c/PhLiiAhwx4CUC0l6srLR6oAFFvmmvhpUzhTyJbX1vxErL/nPpAvDc9OvuN
 uXiTN7S0vy1zwi+O71pQ/mhUS9dxivm9PlJKd4grBl23GpBbWrr0ShGxFR1Iam0oXT
 rntwg7NUbg11zwZpVGQhrizf+qCAFv+rJOAvfb2oizGOe6+DlVQPfqTP3RCRpmseC0
 bPe4CCkU6ArFA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/6] drm/nouveau: Make fence container helper usable
 driver-wide
Date: Tue,  1 Jul 2025 15:21:42 +0200
Message-ID: <20250701132142.76899-7-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701132142.76899-3-phasta@kernel.org>
References: <20250701132142.76899-3-phasta@kernel.org>
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

In order to implement a new DRM GPU scheduler callback in Nouveau, a
helper for obtaining a nouveau_fence from a dma_fence is necessary. Such
a helper exists already inside nouveau_fence.c, called from_fence().

Make that helper available to other C files with a more precise name.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 20 +++++++-------------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  6 ++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index d5654e26d5bc..869d4335c0f4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -38,12 +38,6 @@
 static const struct dma_fence_ops nouveau_fence_ops_uevent;
 static const struct dma_fence_ops nouveau_fence_ops_legacy;
 
-static inline struct nouveau_fence *
-from_fence(struct dma_fence *fence)
-{
-	return container_of(fence, struct nouveau_fence, base);
-}
-
 static inline struct nouveau_fence_chan *
 nouveau_fctx(struct nouveau_fence *fence)
 {
@@ -77,7 +71,7 @@ nouveau_local_fence(struct dma_fence *fence, struct nouveau_drm *drm)
 	    fence->ops != &nouveau_fence_ops_uevent)
 		return NULL;
 
-	return from_fence(fence);
+	return to_nouveau_fence(fence);
 }
 
 void
@@ -268,7 +262,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 static long
 nouveau_fence_wait_legacy(struct dma_fence *f, bool intr, long wait)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	unsigned long sleep_time = NSEC_PER_MSEC / 1000;
 	unsigned long t = jiffies, timeout = t + wait;
 
@@ -448,7 +442,7 @@ static const char *nouveau_fence_get_get_driver_name(struct dma_fence *fence)
 
 static const char *nouveau_fence_get_timeline_name(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 	return !fctx->dead ? fctx->name : "dead channel";
@@ -462,7 +456,7 @@ static const char *nouveau_fence_get_timeline_name(struct dma_fence *f)
  */
 static bool nouveau_fence_is_signaled(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 	struct nouveau_channel *chan;
 	bool ret = false;
@@ -478,7 +472,7 @@ static bool nouveau_fence_is_signaled(struct dma_fence *f)
 
 static bool nouveau_fence_no_signaling(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 
 	/*
 	 * caller should have a reference on the fence,
@@ -503,7 +497,7 @@ static bool nouveau_fence_no_signaling(struct dma_fence *f)
 
 static void nouveau_fence_release(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
@@ -521,7 +515,7 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy = {
 
 static bool nouveau_fence_enable_signaling(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = from_fence(f);
+	struct nouveau_fence *fence = to_nouveau_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 	bool ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 6a983dd9f7b9..183dd43ecfff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -17,6 +17,12 @@ struct nouveau_fence {
 	unsigned long timeout;
 };
 
+static inline struct nouveau_fence *
+to_nouveau_fence(struct dma_fence *fence)
+{
+	return container_of(fence, struct nouveau_fence, base);
+}
+
 int  nouveau_fence_create(struct nouveau_fence **, struct nouveau_channel *);
 int  nouveau_fence_new(struct nouveau_fence **, struct nouveau_channel *);
 void nouveau_fence_unref(struct nouveau_fence **);
-- 
2.49.0

