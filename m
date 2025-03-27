Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3159BA72BB4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8E310E882;
	Thu, 27 Mar 2025 08:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ixvPCqkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595D310E880
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wZXx3sHF1k1Yx5LlZENkCx+Vktr73zpXlL+YEjRy9Sg=; b=ixvPCqkf0L0RBGVFaQ5V4IUnkg
 D903nkEz2gfr+sR6miXUEU0+/2kLcTiR4cMItyEdJw1PCkz/0noYpq/byR+gPDpYefmgYjuMTJvgo
 qyIjtqI4eOvMnvba3Sv2CsnvLrQ9f6XaIZobX0Jt0TYrRjLhe4xhU1UCKjTuNLG32obAaMmYrFRys
 pOcxeRpBGpFM0KjqEQSJwsJ7k+u0jilbEvBmNowA5WbHmdpfRqBEiPlJgbZQT2BiWXotEhjr4wSls
 pmk3OuNNCpmiYh/iyobCzWNxQeDfEsMQh+daWmqzl4t8dGkqi1nHuJnxVK4yyRDCgYVA4hokjZIyP
 VKjO1Vwg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1txioh-0078lG-6u; Thu, 27 Mar 2025 09:42:23 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 5/7] drm/syncobj: Avoid temporary allocation in
 drm_syncobj_timeline_signal_ioctl
Date: Thu, 27 Mar 2025 08:42:12 +0000
Message-ID: <20250327084215.26662-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250327084215.26662-1-tvrtko.ursulin@igalia.com>
References: <20250327084215.26662-1-tvrtko.ursulin@igalia.com>
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

We can avoid one of the two temporary allocations if we read the userspace
supplied timeline points as we go along.

The only new complication is to unwind unused fence chains on the error
path, but even that code was already present in the function.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 46 +++++++++++++++--------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 9f51bd4dbfc4..bf2fbe07add2 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1555,10 +1555,10 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_private)
 {
 	struct drm_syncobj_timeline_array *args = data;
+	uint64_t __user *points = u64_to_user_ptr(args->points);
+	uint32_t i, j, count = args->count_handles;
 	struct drm_syncobj **syncobjs;
 	struct dma_fence_chain **chains;
-	uint64_t *points;
-	uint32_t i, j;
 	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
@@ -1570,33 +1570,22 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	if (args->count_handles == 0)
 		return -EINVAL;
 
+	if (!access_ok(points, count * sizeof(*points)))
+		return -EFAULT;
+
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
-				     args->count_handles,
+				     count,
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
 
-	points = kmalloc_array(args->count_handles, sizeof(*points),
-			       GFP_KERNEL);
-	if (!points) {
-		ret = -ENOMEM;
-		goto out;
-	}
-	if (!u64_to_user_ptr(args->points)) {
-		memset(points, 0, args->count_handles * sizeof(uint64_t));
-	} else if (copy_from_user(points, u64_to_user_ptr(args->points),
-				  sizeof(uint64_t) * args->count_handles)) {
-		ret = -EFAULT;
-		goto err_points;
-	}
-
-	chains = kmalloc_array(args->count_handles, sizeof(void *), GFP_KERNEL);
+	chains = kmalloc_array(count, sizeof(void *), GFP_KERNEL);
 	if (!chains) {
 		ret = -ENOMEM;
-		goto err_points;
+		goto out;
 	}
-	for (i = 0; i < args->count_handles; i++) {
+	for (i = 0; i < count; i++) {
 		chains[i] = dma_fence_chain_alloc();
 		if (!chains[i]) {
 			for (j = 0; j < i; j++)
@@ -1606,19 +1595,24 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	for (i = 0; i < args->count_handles; i++) {
+	for (i = 0; i < count; i++) {
 		struct dma_fence *fence = dma_fence_get_stub();
+		u64 point = 0;
 
-		drm_syncobj_add_point(syncobjs[i], chains[i],
-				      fence, points[i]);
+		if (points && __get_user(point, points++)) {
+			ret =  -EFAULT;
+			for (j = i; j < count; j++)
+				dma_fence_chain_free(chains[j]);
+			goto err_chains;
+		}
+
+		drm_syncobj_add_point(syncobjs[i], chains[i], fence, point);
 		dma_fence_put(fence);
 	}
 err_chains:
 	kfree(chains);
-err_points:
-	kfree(points);
 out:
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, count);
 
 	return ret;
 }
-- 
2.48.0

