Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A5AD57DB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 16:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BC710E6A6;
	Wed, 11 Jun 2025 14:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oliHIxB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B196A10E66E;
 Wed, 11 Jun 2025 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Zn5xX5lQkf4T2J1bFqndEIX/CSdFYvmBFIB9IJtSFg=; b=oliHIxB1B6FKzbFdopU94BzwzT
 qnYzooDUkJ3hMkBJri8eWuPJqxS/Tv1F/loTkuVcGlYbwzNxQwhmWzc4q7SGhbeWYBdbVKZwTvWSh
 lSKxK8/hMwPCEmcDP87PJ+DiKFZnehUqogF49Kzlq7kfqLi2KY24yeRV0QcOYT5Ekhrpwog5kQPE/
 UnUY56v1w4bTRkAxA2x5kiR/J7m32oAMw5WRSZSyF8wi3szkWGd/65JxMAFEsxvEFABVAoNuGg8Cs
 WmLqTaGSMBQX9a1O0dVYl1lLmjrPGGEtyWYmSsweIBVYnVFayiiYZtQ+B2F6mA41A5ztkOgf2KkMs
 5005HDwg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uPM0i-002DwL-V1; Wed, 11 Jun 2025 16:01:01 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v5 1/6] drm/syncobj: Remove unhelpful helper
Date: Wed, 11 Jun 2025 15:00:52 +0100
Message-ID: <20250611140057.27259-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250611140057.27259-1-tvrtko.ursulin@igalia.com>
References: <20250611140057.27259-1-tvrtko.ursulin@igalia.com>
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

Helper which fails to consolidate the code and instead just forks into two
copies of the code based on a boolean parameter is not very helpful or
readable. Lets just remove it and proof in the pudding is the net smaller
code.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
v2:
 * Assign timeout to a local variable.
---
 drivers/gpu/drm/drm_syncobj.c | 100 ++++++++++++++++------------------
 1 file changed, 46 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 636cd83ca29e..e2d97dd6e45b 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1248,42 +1248,6 @@ signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec)
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
@@ -1346,9 +1310,12 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
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
@@ -1361,27 +1328,38 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
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
+	timeout = drm_timeout_abs_to_jiffies(args->timeout_nsec);
+	timeout = drm_syncobj_array_wait_timeout(syncobjs,
+						 NULL,
+						 count,
+						 args->flags,
+						 timeout,
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
@@ -1389,9 +1367,12 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
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
@@ -1405,27 +1386,38 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
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
+	timeout = drm_timeout_abs_to_jiffies(args->timeout_nsec);
+	timeout = drm_syncobj_array_wait_timeout(syncobjs,
+						 u64_to_user_ptr(args->points),
+						 count,
+						 args->flags,
+						 timeout,
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
2.48.0

