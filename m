Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED44AD305A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E77E10E49B;
	Tue, 10 Jun 2025 08:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rA8DboqK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C7C10E4C5;
 Tue, 10 Jun 2025 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hbpzCD9UCKGaZL8nWkDn/DdyQA4wvpVz8+LHbq2IVxc=; b=rA8DboqKoJUM0nitsRSebmWX1n
 3LKH7qcy58KsyJMu9LBDXzvd00YqbAbYIopQ2C4x4ZhSAZEMlv61CoaP8J3x1kY6spmbeoILPSKSg
 iEdB8SBxILtEaf5fgW052DTo/uIs0RjTLLAHEg2hPIaSimSBhoxZHA5Yxa9DLiSneIPKYKsKxWTeq
 +ibeZ7uqQL98rboeI2f9cl4yBqB7nLBSx73v14idxA8S1E7wQ23YA2Tx5Ui+l410ssvwfZ0CPtVOV
 HXLC7SuS898G0WKDYq0LX0P2vDKsDOHoIo/i2Bw0Rj6gkBwoIiZuxDWGe4rpQLzbpC/DtF9TXRjDf
 GP2oloyg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uOuMy-001jn6-EW; Tue, 10 Jun 2025 10:30:08 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 6/6] drm/syncobj: Add a fast path to drm_syncobj_array_find
Date: Tue, 10 Jun 2025 09:30:01 +0100
Message-ID: <20250610083001.4120-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250610083001.4120-1-tvrtko.ursulin@igalia.com>
References: <20250610083001.4120-1-tvrtko.ursulin@igalia.com>
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
index 8ca5331d7b67..d8b8ca40266d 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1259,6 +1259,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
 static int drm_syncobj_array_find(struct drm_file *file_private,
 				  u32 __user *handles,
 				  uint32_t count,
+				  struct drm_syncobj **stack_syncobjs,
+				  u32 stack_count,
 				  struct drm_syncobj ***syncobjs_out)
 {
 	struct drm_syncobj **syncobjs;
@@ -1268,9 +1270,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
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
@@ -1292,25 +1298,31 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
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
@@ -1336,6 +1348,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1354,7 +1368,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 						 &first,
 						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
 
 	if (timeout < 0)
 		return timeout;
@@ -1368,6 +1382,7 @@ int
 drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_wait *args = data;
 	ktime_t deadline, *pdeadline = NULL;
 	u32 count = args->count_handles;
@@ -1394,6 +1409,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1412,7 +1429,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 						 &first,
 						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
 
 	if (timeout < 0)
 		return timeout;
@@ -1529,6 +1546,7 @@ int
 drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
@@ -1546,6 +1564,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1553,7 +1573,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 	for (i = 0; i < args->count_handles; i++)
 		drm_syncobj_replace_fence(syncobjs[i], NULL);
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return 0;
 }
@@ -1562,6 +1583,7 @@ int
 drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint32_t i;
@@ -1579,6 +1601,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1589,7 +1613,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
 			break;
 	}
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, args->count_handles,
+			       syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1598,6 +1623,7 @@ int
 drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_array *args = data;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
 	uint32_t i, j, count = args->count_handles;
@@ -1617,6 +1643,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     count,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1653,7 +1681,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 err_chains:
 	kfree(chains);
 out:
-	drm_syncobj_array_free(syncobjs, count);
+	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
 
 	return ret;
 }
@@ -1661,6 +1689,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file_private)
 {
+	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct drm_syncobj_timeline_array *args = data;
 	struct drm_syncobj **syncobjs;
 	uint64_t __user *points = u64_to_user_ptr(args->points);
@@ -1679,6 +1708,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
 				     args->count_handles,
+				     stack_syncobjs,
+				     ARRAY_SIZE(stack_syncobjs),
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
@@ -1722,7 +1753,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
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

