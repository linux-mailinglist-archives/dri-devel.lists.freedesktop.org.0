Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0B8A02388
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 11:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC0010E61D;
	Mon,  6 Jan 2025 10:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LG6evZs1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1A210E620
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 10:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fxfNmBAE54mLzEPCeQU5eO4cr/cGKNedITnNTHSh9Co=; b=LG6evZs1RXPrRBP0hBqs3wZZaE
 PuSBT34a0kL4DRUS3GyB7Yx7cOCBcWlcXgXNpsqzP+5BZ/VZE/+/JrGAtS27FM2DLAafTVfp9ohpf
 U/UnoU1dhGW8f0gFAJfCjrRmrvIqyi8nZ/4ltT+P/ylIM6pwI1H/4sJebReXNtAHWUQeEPTFyjwhM
 AHbNX+OCnDhLxeps+73YN477//r+8qvL1TIID5ZJMHqY7zyQZc2/J2HjooTv0C5TbMT3m0zJPgS5R
 YTZX+7hXwstWJK+ihA2EtQ76BjD7uDt7fc6oT+/WYjeK0Pi/gB1FFKq5lhirlq5ba6szsBtPS22Ix
 iy4Ff8dw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tUklc-00CESW-J8; Mon, 06 Jan 2025 11:55:28 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 7/7] drm/syncobj: Add a fast path to drm_syncobj_array_find
Date: Mon,  6 Jan 2025 10:55:21 +0000
Message-ID: <20250106105521.53149-8-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106105521.53149-1-tursulin@igalia.com>
References: <20250106105521.53149-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Running the Cyberpunk 2077 benchmark we can observe that the lookup helper
is relatively hot, but the 97% of the calls are for a single object. (~3%
for two points, and never more than three points. While a more trivial
workload like vkmark under Plasma is even more skewed to single point
lookups.)

Therefore lets add a fast path to bypass the kmalloc_array/kfree and use a
pre-allocated stack array for those cases.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 53 +++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 94932b89298f..233bdef53c87 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1223,6 +1223,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
 static int drm_syncobj_array_find(struct drm_file *file_private,
 				  u32 __user *handles,
 				  uint32_t count,
+				  struct drm_syncobj **stack_syncobjs,
+				  u32 stack_count,
 				  struct drm_syncobj ***syncobjs_out)
 {
 	struct drm_syncobj **syncobjs;
@@ -1232,9 +1234,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 	if (!access_ok(handles, count * sizeof(*handles)))
 		return -EFAULT;
 
-	syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
-	if (!syncobjs)
-		return -ENOMEM;
+	if (count > stack_count) {
+		syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
+		if (!syncobjs)
+			return -ENOMEM;
+	} else {
+		syncobjs = stack_syncobjs;
+	}
 
 	for (i = 0; i < count; i++) {
 		u64 handle;
@@ -1260,25 +1266,31 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 			drm_syncobj_put(syncobjs[i]);
 		i--;
 	}
-	kfree(syncobjs);
+
+	if (syncobjs != stack_syncobjs)
+		kfree(syncobjs);
 
 	return ret;
 }
 
 static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
-				   uint32_t count)
+				   uint32_t count,
+				   struct drm_syncobj **stack_syncobjs)
 {
 	uint32_t i;
 
 	for (i = 0; i < count; i++)
 		drm_syncobj_put(syncobjs[i]);
-	kfree(syncobjs);
+
+	if (syncobjs != stack_syncobjs)
+		kfree(syncobjs);
 }
 
 int
 drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[4];
 	struct drm_syncobj_wait *args = data;
 	ktime_t deadline, *pdeadline = NULL;
 	u32 count = args->count_handles;
@@ -1304,6 +1316,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1321,7 +1335,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 						 &first,
 						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, stack_syncobjs);
 
 	if (timeout < 0)
 		return timeout;
@@ -1336,6 +1350,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_private)
 {
 	struct drm_syncobj_timeline_wait *args = data;
+	struct drm_syncobj *stack_syncobjs[4];
 	ktime_t deadline, *pdeadline = NULL;
 	u32 count = args->count_handles;
 	struct drm_syncobj **syncobjs;
@@ -1361,6 +1376,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1378,7 +1395,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 						 &first,
 						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, stack_syncobjs);
 
 	if (timeout < 0)
 		return timeout;
@@ -1496,6 +1513,7 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_private)
 {
 	struct drm_syncobj_array *args = data;
+	struct drm_syncobj *stack_syncobjs[4];
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
 	int ret;
@@ -1512,6 +1530,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1519,7 +1539,7 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	for (i = 0; i < args->count_handles; i++)
 		drm_syncobj_replace_fence(syncobjs[i], NULL);
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles, stack_syncobjs);
 
 	return 0;
 }
@@ -1529,6 +1549,7 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_private)
 {
 	struct drm_syncobj_array *args = data;
+	struct drm_syncobj *stack_syncobjs[4];
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
 	int ret;
@@ -1545,6 +1566,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1555,7 +1578,7 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			break;
 	}
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles, stack_syncobjs);
 
 	return ret;
 }
@@ -1567,6 +1590,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	struct drm_syncobj_timeline_array *args = data;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
 	uint32_t i, j, count = args->count_handles;
+	struct drm_syncobj *stack_syncobjs[4];
 	struct drm_syncobj **syncobjs;
 	struct dma_fence_chain **chains;
 	int ret;
@@ -1586,6 +1610,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1622,7 +1648,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 err_chains:
 	kfree(chains);
 out:
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, stack_syncobjs);
 
 	return ret;
 }
@@ -1631,6 +1657,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_private)
 {
 	struct drm_syncobj_timeline_array *args = data;
+	struct drm_syncobj *stack_syncobjs[4];
 	struct drm_syncobj **syncobjs;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
 	uint32_t i;
@@ -1651,6 +1678,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1694,7 +1723,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			break;
 		}
 	}
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles, stack_syncobjs);
 
 	return ret;
 }
-- 
2.47.1

