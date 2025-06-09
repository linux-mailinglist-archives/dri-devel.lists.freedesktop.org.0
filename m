Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC00AD1C7E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 13:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBFA10E24D;
	Mon,  9 Jun 2025 11:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ir/UH2gR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848610E231;
 Mon,  9 Jun 2025 11:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nX1hf1qC7IRwZ+/wtY3T4sj93LTGYJpLpfe1lzKGs1k=; b=ir/UH2gRXbfN2kO9LJUW9SQLAr
 E3IyJp9z1KWvkRKXQk455qZfO2q6V6poOT7NKigqAkP57mbZkiJnGOv70Pnoeqvxy5kHAWa5jgjmS
 +m9cNHFXnAyu49/pVj/mkMhXKPnv8K12ujJyOYH9je8DW93pKW6prm3HKlDrSbYK3iUaWjZZIEiJI
 yeq2mmlWM8rHBGMlcU1V/pZC4Qm6/RFaqP8pTKh0ZNZuhFSUI+Tj3eoQ3I0Pjd14mMvJipD0ljSt0
 umtsH35uMxnII9WlNoohmFvpGCNJWxDVV9murYZX6b6c1R2MyyXti+BemY7SFNFidcI5Z9O1rycsp
 fA9VE1jg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uOakw-001Odz-2T; Mon, 09 Jun 2025 13:33:34 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 7/7] drm/syncobj: Add a fast path to drm_syncobj_array_find
Date: Mon,  9 Jun 2025 12:33:13 +0100
Message-ID: <20250609113313.75395-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250609113313.75395-1-tvrtko.ursulin@igalia.com>
References: <20250609113313.75395-1-tvrtko.ursulin@igalia.com>
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
index 0822ed237abc..3e8ebedcc409 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1258,6 +1258,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
 static int drm_syncobj_array_find(struct drm_file *file_private,
 				  u32 __user *handles,
 				  uint32_t count,
+				  struct drm_syncobj **stack_syncobjs,
+				  u32 stack_count,
 				  struct drm_syncobj ***syncobjs_out)
 {
 	struct drm_syncobj **syncobjs;
@@ -1267,9 +1269,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
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
@@ -1291,25 +1297,31 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
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
@@ -1335,6 +1347,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1353,7 +1367,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 						 &first,
 						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
 
 	if (timeout < 0)
 		return timeout;
@@ -1367,6 +1381,7 @@ int
 drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_wait *args = data;
 	ktime_t deadline, *pdeadline = NULL;
 	u32 count = args->count_handles;
@@ -1393,6 +1408,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1411,7 +1428,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 						 &first,
 						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
 
 	if (timeout < 0)
 		return timeout;
@@ -1528,6 +1545,7 @@ int
 drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
@@ -1545,6 +1563,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1552,7 +1572,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	for (i = 0; i < args->count_handles; i++)
 		drm_syncobj_replace_fence(syncobjs[i], NULL);
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return 0;
 }
@@ -1561,6 +1582,7 @@ int
 drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
@@ -1578,6 +1600,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1588,7 +1612,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			break;
 	}
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1597,6 +1622,7 @@ int
 drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_array *args = data;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
 	uint32_t i, j, count = args->count_handles;
@@ -1619,6 +1645,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1655,7 +1683,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 err_chains:
 	kfree(chains);
 out:
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1663,6 +1691,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
@@ -1684,6 +1713,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1727,7 +1758,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
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

