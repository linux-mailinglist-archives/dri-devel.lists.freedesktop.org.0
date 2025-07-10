Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79BB00293
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73B310E8CB;
	Thu, 10 Jul 2025 12:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qF/piWid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9206D10E8C7;
 Thu, 10 Jul 2025 12:54:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 78379460E6;
 Thu, 10 Jul 2025 12:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A953C4CEE3;
 Thu, 10 Jul 2025 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752152094;
 bh=OZBWcl+PCUb2kCnaY8+5TU8XsQRk5Xln7k2Zc73mGUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qF/piWidgViJQKbU9AQf6smJBFPJPxD4mpoxb3zZiCEu7+1jjMun0I5cbK4++pjhF
 lCCub41aB9wEjr/v3YV6nIVHNre0fZgevtFBxcEVehsnCSZzq9G+TP+cZJbj5taNWj
 WHbdHK/1+rHqvDHif6/2cBlp5yJzxJwcfuwm/fSJIFTMqBDxYQGqFO25Ja8hGr7u6F
 gDweB4gHgLB0EU5SncFa/XxukfsFlclyxchJTRjCC21oVCtyiuK/O3+sTY/d2kd3RM
 jiwiUUFnDMhuEWALVQILVhAZpHj+WY+DHZrWJWjl/Dlrpxp2FVod2LkLsuJVR4/WJs
 lHauO74b7LcuQ==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 6/8] drm/nouveau: Make fence container helper usable
 driver-wide
Date: Thu, 10 Jul 2025 14:54:10 +0200
Message-ID: <20250710125412.128476-8-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710125412.128476-2-phasta@kernel.org>
References: <20250710125412.128476-2-phasta@kernel.org>
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
Acked-by: Danilo Krummrich <dakr@kernel.org>
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

