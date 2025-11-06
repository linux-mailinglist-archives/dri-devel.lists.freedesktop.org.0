Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D4C3B339
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7699D10E8C3;
	Thu,  6 Nov 2025 13:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Pl+Y/d6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F0A10E8C0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IGZBVAProUhodeN827qKEDJdHkjLr4uYYwA7dxQKMEY=; b=Pl+Y/d6TlbahrOubkiTIiWMK0x
 s6jOl2qGiIm5skmMATAn0SPZS891E7M/c213yNayAU5G0/6Jy6sPI51llpRWQ0pW6UnouhWZ2xSVC
 ZH1Oz/5CLc7NRvsq5FdyYNw/aaFXNkZivp90GoKNNVZ9JCJJn7HtXnwIjJ/UK8FOBtgC77JvUV452
 H0pGuCvWtrQm8iQPdn1YmdI32uICY/sXseZQM4r9A0oN36COG6DgEqu9NXQUXRegLMSpqX9F9ORCJ
 5ppwCQKsxJ8SGYG7PVaimxR2OLpyTDZWCxzWWI6hqRvxvC90eK/vtpsDmUy3g3q0keFMtouaQ7n4Y
 pzY+salg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH00n-0030kR-Bo; Thu, 06 Nov 2025 14:26:49 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 2/3] drm/syncobj: Add a fast path to
 drm_syncobj_array_wait_timeout
Date: Thu,  6 Nov 2025 13:26:44 +0000
Message-ID: <20251106132645.28208-3-tvrtko.ursulin@igalia.com>
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

Running the Cyberpunk 2077 benchmark we can observe that waiting on DRM
sycobjs is relatively hot, but the 96% of the calls are for a single
object. (~4% for two points, and never more than three points. While
a more trivial workload like vkmark under Plasma is even more skewed
to single point waits.)

Therefore lets add a fast path to bypass the kcalloc/kfree and use a pre-
allocated stack array for those cases.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com> # v3
---
v2:
 * Document rationale for stack array in a comment.

v3:
 * Added DRM_SYNCOBJ_FAST_PATH_ENTRIES to avoid hardcoding fast path array
   size.

v4:
 * Rebased to be standalone.
---
 drivers/gpu/drm/drm_syncobj.c | 44 ++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 1333ef0ea03b..99aada85865d 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -237,6 +237,14 @@ static void
 syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
 			   struct syncobj_eventfd_entry *entry);
 
+/*
+ * Empirically vast majority of ioctls pass in a single syncobj (96%) and never
+ * more than three points. Therefore implement a fast path with a small stack
+ * array to avoid going into the allocator sometimes several times per
+ * userspace rendered frame.
+ */
+#define DRM_SYNCOBJ_FAST_PATH_ENTRIES 4
+
 /**
  * drm_syncobj_find - lookup and reference a sync object.
  * @file_private: drm file private pointer
@@ -1063,10 +1071,12 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  uint32_t *idx,
 						  ktime_t *deadline)
 {
+	struct syncobj_wait_entry stack_entries[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
+	u64 stack_points[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct syncobj_wait_entry *entries;
 	struct dma_fence *fence;
-	uint64_t *points;
 	uint32_t signaled_count, i;
+	uint64_t *points;
 
 	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
 		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
@@ -1074,24 +1084,33 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		lockdep_assert_none_held_once();
 	}
 
-	points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
-	if (points == NULL)
-		return -ENOMEM;
+	if (count > ARRAY_SIZE(stack_points)) {
+		points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
+		if (!points)
+			return -ENOMEM;
+	} else {
+		points = stack_points;
+	}
 
 	if (!user_points) {
 		memset(points, 0, count * sizeof(uint64_t));
-
 	} else if (copy_from_user(points, user_points,
 				  sizeof(uint64_t) * count)) {
 		timeout = -EFAULT;
 		goto err_free_points;
 	}
 
-	entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
-	if (!entries) {
-		timeout = -ENOMEM;
-		goto err_free_points;
+	if (count > ARRAY_SIZE(stack_entries)) {
+		entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
+		if (!entries) {
+			timeout = -ENOMEM;
+			goto err_free_points;
+		}
+	} else {
+		memset(stack_entries, 0, sizeof(stack_entries));
+		entries = stack_entries;
 	}
+
 	/* Walk the list of sync objects and initialize entries.  We do
 	 * this up-front so that we can properly return -EINVAL if there is
 	 * a syncobj with a missing fence and then never have the chance of
@@ -1208,10 +1227,13 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  &entries[i].fence_cb);
 		dma_fence_put(entries[i].fence);
 	}
-	kfree(entries);
+
+	if (entries != stack_entries)
+		kfree(entries);
 
 err_free_points:
-	kfree(points);
+	if (points != stack_points)
+		kfree(points);
 
 	return timeout;
 }
-- 
2.48.0

