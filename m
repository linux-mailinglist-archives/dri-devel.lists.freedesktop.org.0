Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AECA02383
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 11:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0272E10E61A;
	Mon,  6 Jan 2025 10:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nI2A7SkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2473510E627
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n50If28lu3D2Boi7s1daO/n0y1ApO0ZGsYdmhuww6UY=; b=nI2A7SkYqbzdDkDgHIagVl/avK
 XKJuPRemHNGh3uIItzGvGe4Gj6UtHg/oyJETGyt0bHpMf+KrU9x45ZRqQ3vYM2KfDhv62x1asn92V
 QS4DyvfDULR5HY45tN6t4iaRTDZh1p1vEzuN55uxtYqok3rGcSXv1B4jZWuKzsY4yn67NsRoQiZzs
 LpYLQQFDivZrVzLj0ya6CsDq2A4kxPhP9O4m+Vn2jOPg5RS9XDdKlqEYVXvHyf2B2AwTwX4dzsanp
 WZ866+7g/eqXmlvVNRhUIFVmNKju52nzpgHcOKBZwrnh1RYLhqPhz/2bNFyZ685zZHftJX27JghvR
 ek84u7QA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tUklY-00CES0-Co; Mon, 06 Jan 2025 11:55:24 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 1/7] drm/syncobj: Remove unhelpful helper
Date: Mon,  6 Jan 2025 10:55:15 +0000
Message-ID: <20250106105521.53149-2-tursulin@igalia.com>
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

Helper which fails to consolidate the code and instead just forks into two
copies of the code based on a boolean parameter is not very helpful or
readable. Lets just remove it and proof in the pudding is the net smaller
code.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 98 ++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..d0d60c331df8 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1221,42 +1221,6 @@ signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec)
 }
 EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
 
-static int drm_syncobj_array_wait(struct drm_device *dev,
-				  struct drm_file *file_private,
-				  struct drm_syncobj_wait *wait,
-				  struct drm_syncobj_timeline_wait *timeline_wait,
-				  struct drm_syncobj **syncobjs, bool timeline,
-				  ktime_t *deadline)
-{
-	signed long timeout = 0;
-	uint32_t first = ~0;
-
-	if (!timeline) {
-		timeout = drm_timeout_abs_to_jiffies(wait->timeout_nsec);
-		timeout = drm_syncobj_array_wait_timeout(syncobjs,
-							 NULL,
-							 wait->count_handles,
-							 wait->flags,
-							 timeout, &first,
-							 deadline);
-		if (timeout < 0)
-			return timeout;
-		wait->first_signaled = first;
-	} else {
-		timeout = drm_timeout_abs_to_jiffies(timeline_wait->timeout_nsec);
-		timeout = drm_syncobj_array_wait_timeout(syncobjs,
-							 u64_to_user_ptr(timeline_wait->points),
-							 timeline_wait->count_handles,
-							 timeline_wait->flags,
-							 timeout, &first,
-							 deadline);
-		if (timeout < 0)
-			return timeout;
-		timeline_wait->first_signaled = first;
-	}
-	return 0;
-}
-
 static int drm_syncobj_array_find(struct drm_file *file_private,
 				  void __user *user_handles,
 				  uint32_t count_handles,
@@ -1319,9 +1283,12 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_private)
 {
 	struct drm_syncobj_wait *args = data;
+	ktime_t deadline, *pdeadline = NULL;
+	u32 count = args->count_handles;
 	struct drm_syncobj **syncobjs;
 	unsigned int possible_flags;
-	ktime_t t, *tp = NULL;
+	u32 first = ~0;
+	long timeout;
 	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
@@ -1334,27 +1301,37 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & ~possible_flags)
 		return -EINVAL;
 
-	if (args->count_handles == 0)
+	if (count == 0)
 		return 0;
 
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
-				     args->count_handles,
+				     count,
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
 
 	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
-		t = ns_to_ktime(args->deadline_nsec);
-		tp = &t;
+		deadline = ns_to_ktime(args->deadline_nsec);
+		pdeadline = &deadline;
 	}
 
-	ret = drm_syncobj_array_wait(dev, file_private,
-				     args, NULL, syncobjs, false, tp);
+	timeout = drm_syncobj_array_wait_timeout(syncobjs,
+						 NULL,
+						 count,
+						 args->flags,
+						 drm_timeout_abs_to_jiffies(args->timeout_nsec),
+						 &first,
+						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, count);
 
-	return ret;
+	if (timeout < 0)
+		return timeout;
+
+	args->first_signaled = first;
+
+	return 0;
 }
 
 int
@@ -1362,9 +1339,12 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_private)
 {
 	struct drm_syncobj_timeline_wait *args = data;
+	ktime_t deadline, *pdeadline = NULL;
+	u32 count = args->count_handles;
 	struct drm_syncobj **syncobjs;
 	unsigned int possible_flags;
-	ktime_t t, *tp = NULL;
+	u32 first = ~0;
+	long timeout;
 	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
@@ -1378,27 +1358,37 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & ~possible_flags)
 		return -EINVAL;
 
-	if (args->count_handles == 0)
+	if (count == 0)
 		return 0;
 
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
-				     args->count_handles,
+				     count,
 				     &syncobjs);
 	if (ret < 0)
 		return ret;
 
 	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
-		t = ns_to_ktime(args->deadline_nsec);
-		tp = &t;
+		deadline = ns_to_ktime(args->deadline_nsec);
+		pdeadline = &deadline;
 	}
 
-	ret = drm_syncobj_array_wait(dev, file_private,
-				     NULL, args, syncobjs, true, tp);
+	timeout = drm_syncobj_array_wait_timeout(syncobjs,
+						 u64_to_user_ptr(args->points),
+						 count,
+						 args->flags,
+						 drm_timeout_abs_to_jiffies(args->timeout_nsec),
+						 &first,
+						 pdeadline);
 
-	drm_syncobj_array_free(syncobjs, args->count_handles);
+	drm_syncobj_array_free(syncobjs, count);
 
-	return ret;
+	if (timeout < 0)
+		return timeout;
+
+	args->first_signaled = first;
+
+	return 0;
 }
 
 static void syncobj_eventfd_entry_fence_func(struct dma_fence *fence,
-- 
2.47.1

