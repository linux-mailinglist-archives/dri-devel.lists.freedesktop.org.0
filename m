Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF89A74EB0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 17:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB9E10EA81;
	Fri, 28 Mar 2025 16:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Oe3umECI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FD410EA7E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 16:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oFdYMgXJRSvV+g7KlNdVHdP7XMS6CWyhVK2Jn2Q6M9k=; b=Oe3umECId30VweExAY+jdNSk05
 umu3gVCxUjif2ORU79vEygKCtDjiq5dJyZ60Szn5JoSy5r6s5gStvuy/RK10ptm2za2eKaXm8L9pj
 1d7Aehna/1km5Fl54krcGHBT044cWV5sissz36N745wGmG1CjIhbqcrpEG0hPyAu2kUOJILbZfPyt
 r+M/6OBtUYJrXiU18drbMQ371befdhqjr6rLUbI1framG+zWTdI2gvIALHeqf/cT4AcBttKzh0OVh
 yuro7sCnh4OHL1m408T8MMLD8sK8kTHM3+nFTmbhTZtzwFjr9Ba9mbvLGBh3xNnSwfpz3Q/1m2EtW
 ZGs8YjYg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tyCqj-0082OG-UF; Fri, 28 Mar 2025 17:46:30 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v3 7/7] drm/syncobj: Add a fast path to drm_syncobj_array_find
Date: Fri, 28 Mar 2025 16:46:20 +0000
Message-ID: <20250328164621.59150-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250328164621.59150-1-tvrtko.ursulin@igalia.com>
References: <20250328164621.59150-1-tvrtko.ursulin@igalia.com>
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
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
v2:
 * Added comments describing how the fast path arrays were sized.
 * Make container freeing criteria clearer by using a boolean.
---
 drivers/gpu/drm/drm_syncobj.c | 56 +++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 34a6dc50ec31..d5b99bfea9a5 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1231,6 +1231,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
 static int drm_syncobj_array_find(struct drm_file *file_private,
 				  u32 __user *handles,
 				  uint32_t count,
+				  struct drm_syncobj **stack_syncobjs,
+				  u32 stack_count,
 				  struct drm_syncobj ***syncobjs_out)
 {
 	struct drm_syncobj **syncobjs;
@@ -1240,9 +1242,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
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
 		u32 handle;
@@ -1264,25 +1270,31 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 err_put_syncobjs:
 	while (i-- > 0)
 		drm_syncobj_put(syncobjs[i]);
-	kfree(syncobjs);
+
+	if (syncobjs != stack_syncobjs)
+		kfree(syncobjs);
 
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
 	struct drm_syncobj_wait *args = data;
 	ktime_t deadline, *pdeadline = NULL;
 	u32 count = args->count_handles;
@@ -1308,6 +1320,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1326,7 +1340,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 						 &first,
 						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
 
 	if (timeout < 0)
 		return timeout;
@@ -1340,6 +1354,7 @@ int
 drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_wait *args = data;
 	ktime_t deadline, *pdeadline = NULL;
 	u32 count = args->count_handles;
@@ -1366,6 +1381,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1384,7 +1401,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 						 &first,
 						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
 
 	if (timeout < 0)
 		return timeout;
@@ -1501,6 +1518,7 @@ int
 drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
@@ -1518,6 +1536,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1525,7 +1545,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	for (i = 0; i < args->count_handles; i++)
 		drm_syncobj_replace_fence(syncobjs[i], NULL);
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return 0;
 }
@@ -1534,6 +1555,7 @@ int
 drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
@@ -1551,6 +1573,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1561,7 +1585,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			break;
 	}
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1570,6 +1595,7 @@ int
 drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_array *args = data;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
 	uint32_t i, j, count = args->count_handles;
@@ -1592,6 +1618,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1628,7 +1656,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 err_chains:
 	kfree(chains);
 out:
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1636,6 +1664,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
@@ -1657,6 +1686,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1700,7 +1731,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			break;
 		}
 	}
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return ret;
 }
-- 
2.48.0

