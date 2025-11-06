Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB610C3B336
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720E610E8C1;
	Thu,  6 Nov 2025 13:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MDU7zTdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28A710E8C0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PL6ygnh3WyVXEguLm5GU6bm7OwmgVSNzHl3QKIqbj38=; b=MDU7zTdXbIh1Gryd91Dacuayiu
 raz1FcYUHSgvEkvWAqrJPwqzLtUnlK09gCO5iJQP843OTDq0ieuGLPKHRWK5zbtI3RB806KfrUCck
 h3NuQtkXBKZMlqQbDbpg2mG6OU8EdKOKZhE7+gKCrvBhxsnArxc7jQIxWQTQhZlufsXl9nEDAUZ6i
 7PHJc/BY/x2P6Vx75uJe7kFqwGHvEfUs0IMTqXHMFGj59dY9eeECQCXGBpuXZxbqki7r8g2qtMEBq
 NRkScGsdO76976LLG+r3TAwTuIHiWGhP4qywtdp9X+JPuo3fHkvl1/tWnGGzY4euy4Mufs98urcdX
 Vo3yj+vA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH00o-0030kX-4l; Thu, 06 Nov 2025 14:26:50 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 3/3] drm/syncobj: Add a fast path to drm_syncobj_array_find
Date: Thu,  6 Nov 2025 13:26:45 +0000
Message-ID: <20251106132645.28208-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251106132645.28208-1-tvrtko.ursulin@igalia.com>
References: <20251106132645.28208-1-tvrtko.ursulin@igalia.com>
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

Running the Cyberpunk 2077 benchmark we can observe that the lookup helper
is relatively hot, but the 97% of the calls are for a single object. (~3%
for two points, and never more than three points. While a more trivial
workload like vkmark under Plasma is even more skewed to single point
lookups.)

Therefore lets add a fast path to bypass the kmalloc_array/kfree and use a
pre-allocated stack array for those cases.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com> # v2
---
v2:
 * Added comments describing how the fast path arrays were sized.
 * Make container freeing criteria clearer by using a boolean.

v3:
 * Rebased to be standalone.
---
 drivers/gpu/drm/drm_syncobj.c | 92 +++++++++++++++++++++++++++--------
 1 file changed, 73 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 99aada85865d..ba64119a664c 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1310,21 +1310,33 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 static int drm_syncobj_array_find(struct drm_file *file_private,
 				  void __user *user_handles,
 				  uint32_t count_handles,
+				  uint32_t *stack_handles,
+				  struct drm_syncobj **stack_syncobjs,
+				  u32 stack_count,
 				  struct drm_syncobj ***syncobjs_out)
 {
 	uint32_t i, *handles;
 	struct drm_syncobj **syncobjs;
 	int ret;
 
-	handles = memdup_array_user(user_handles, count_handles,
-				    sizeof(*handles));
-	if (IS_ERR(handles))
-		return PTR_ERR(handles);
+	if (count_handles > stack_count) {
+		handles = memdup_array_user(user_handles, count_handles,
+					    sizeof(*handles));
+		if (IS_ERR(handles))
+			return PTR_ERR(handles);
 
-	syncobjs = kmalloc_array(count_handles, sizeof(*syncobjs), GFP_KERNEL);
-	if (syncobjs == NULL) {
-		ret = -ENOMEM;
-		goto err_free_handles;
+		syncobjs = kmalloc_array(count_handles, sizeof(*syncobjs),
+					 GFP_KERNEL);
+		if (!syncobjs) {
+			ret = -ENOMEM;
+			goto err_free_handles;
+		}
+	} else {
+		handles = stack_handles;
+		syncobjs = stack_syncobjs;
+		if (copy_from_user(handles, user_handles,
+				   count_handles * sizeof(*handles)))
+			return -EFAULT;
 	}
 
 	for (i = 0; i < count_handles; i++) {
@@ -1335,34 +1347,42 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 		}
 	}
 
-	kfree(handles);
+	if (handles != stack_handles)
+		kfree(handles);
 	*syncobjs_out = syncobjs;
 	return 0;
 
 err_put_syncobjs:
 	while (i-- > 0)
 		drm_syncobj_put(syncobjs[i]);
-	kfree(syncobjs);
+	if (syncobjs != stack_syncobjs)
+		kfree(syncobjs);
 err_free_handles:
-	kfree(handles);
+	if (handles != stack_handles)
+		kfree(handles);
 
 	return ret;
 }
 
 static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
-				   uint32_t count)
+				   uint32_t count,
+				   bool free_container)
 {
 	uint32_t i;
 
 	for (i = 0; i < count; i++)
 		drm_syncobj_put(syncobjs[i]);
-	kfree(syncobjs);
+
+	if (free_container)
+		kfree(syncobjs);
 }
 
 int
 drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
+	uint32_t stack_handles[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_wait *args = data;
 	struct drm_syncobj **syncobjs;
 	unsigned int possible_flags;
@@ -1385,6 +1405,9 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1397,7 +1420,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_wait(dev, file_private,
 				     args, NULL, syncobjs, false, tp);
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1406,6 +1430,8 @@ int
 drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
+	uint32_t stack_handles[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_wait *args = data;
 	struct drm_syncobj **syncobjs;
 	unsigned int possible_flags;
@@ -1429,6 +1455,9 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1441,7 +1470,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_wait(dev, file_private,
 				     NULL, args, syncobjs, true, tp);
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1553,6 +1583,8 @@ int
 drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
+	uint32_t stack_handles[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
@@ -1570,6 +1602,9 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1577,7 +1612,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	for (i = 0; i < args->count_handles; i++)
 		drm_syncobj_replace_fence(syncobjs[i], NULL);
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return 0;
 }
@@ -1586,6 +1622,8 @@ int
 drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
+	uint32_t stack_handles[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
@@ -1603,6 +1641,9 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1613,7 +1654,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			break;
 	}
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1622,6 +1664,8 @@ int
 drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
+	uint32_t stack_handles[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
 	struct dma_fence_chain **chains;
@@ -1641,6 +1685,9 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1686,7 +1733,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 err_points:
 	kfree(points);
 out:
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1694,6 +1742,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
+	uint32_t stack_handles[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
@@ -1712,6 +1762,9 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1755,7 +1808,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 		if (ret)
 			break;
 	}
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return ret;
 }
-- 
2.48.0

