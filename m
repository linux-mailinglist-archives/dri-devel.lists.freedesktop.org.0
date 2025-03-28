Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31ABA74EB1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 17:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E0910EA84;
	Fri, 28 Mar 2025 16:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EIzYig1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2C110EA72
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sgu1FnmPGEHmr9bhUSRXubCLO/3C6ejbxS55eGfK6Xg=; b=EIzYig1apG/h3ZNSL0mZQ2m1UW
 tyl//wglTyO2Paxek320bOb3r5rz57ch9vW4ynknYA6+K+asPEXEuRlr/YOOztzKBCdfcyBlo3Zv3
 +3fPsqYMlu0tPBQl9E6IQeq1BF5mXW2FFMCmKx0WDesQv5V63rjG6UuN80nRbipydF5ZbjSYOdV+6
 C/s8yjmAeykt/41oEp//IruRsA3gDt3HL2l+GkdtcdFZlULfE68P+/NCrhiDo3LP5aJbf2fnKCEAR
 JkO+snyi4LH3fKFvXeTLNoQCIoDClG6vtUSKDQEuo+RnUi+jQZgvCVzOs6MuxCmnBBkU7h/na4FzC
 XQ8qm/Kw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tyCqj-0082O9-76; Fri, 28 Mar 2025 17:46:29 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v3 6/7] drm/syncobj: Add a fast path to
 drm_syncobj_array_wait_timeout
Date: Fri, 28 Mar 2025 16:46:19 +0000
Message-ID: <20250328164621.59150-7-tvrtko.ursulin@igalia.com>
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

Running the Cyberpunk 2077 benchmark we can observe that waiting on DRM
sycobjs is relatively hot, but the 96% of the calls are for a single
object. (~4% for two points, and never more than three points. While
a more trivial workload like vkmark under Plasma is even more skewed
to single point waits.)

Therefore lets add a fast path to bypass the kcalloc/kfree and use a pre-
allocated stack array for those cases.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
v2:
 * Document rationale for stack array in a comment.

v3:
 * Added DRM_SYNCOBJ_FAST_PATH_ENTRIES to avoid hardcoding fast path array
   size.
---
 drivers/gpu/drm/drm_syncobj.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index bf2fbe07add2..34a6dc50ec31 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -236,6 +236,14 @@ static void
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
@@ -1035,6 +1043,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  uint32_t *idx,
 						  ktime_t *deadline)
 {
+	struct syncobj_wait_entry stack_entries[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct syncobj_wait_entry *entries;
 	uint32_t signaled_count, i;
 	struct dma_fence *fence;
@@ -1049,9 +1058,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 	    !access_ok(user_points, count * sizeof(*user_points)))
 		return -EFAULT;
 
-	entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
-	if (!entries)
-		return -ENOMEM;
+	if (count > ARRAY_SIZE(stack_entries)) {
+		entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
+		if (!entries)
+			return -ENOMEM;
+	} else {
+		memset(stack_entries, 0, sizeof(stack_entries));
+		entries = stack_entries;
+	}
 
 	/* Walk the list of sync objects and initialize entries.  We do
 	 * this up-front so that we can properly return -EINVAL if there is
@@ -1174,7 +1188,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  &entries[i].fence_cb);
 		dma_fence_put(entries[i].fence);
 	}
-	kfree(entries);
+
+	if (entries != stack_entries)
+		kfree(entries);
 
 	return timeout;
 }
-- 
2.48.0

