Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D137AD1C7B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 13:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7811610E231;
	Mon,  9 Jun 2025 11:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IKsvK07X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167BC10E0C2;
 Mon,  9 Jun 2025 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vx21XCrAVIdwf8cjTuBOuwx9ViJQx7gQf3FejrjVEPk=; b=IKsvK07X3YZ15ltMed4ro70UC1
 ka1nKKzgWs6AjF6CQagrZEr1sP83T+Z+K3Z3FB+E3US8IAkx2cx1FJmHYeYwgIPSUc8bO9hNQPkiv
 D1sRS6cwY4ldbF3XaHADXyI+sqiAR6Snn1kD28pDgkfCxakHmB5Y8iYV6u25Tkg1kbihdHcesCWQF
 FiQjQ42Tv/A/hgUskSjc2wo4hTje0XNIllzDezqCqgMJ8JKlKJTPMRUOMSdbGGQPurJ6/srcjaUIQ
 pEro0PMufDFrLyGLvgY2oS+Bzih/tYonhVxGn7ICjNGbdviuerCixANOA02w83A3rFWmpa0UcpzD2
 +CxJ3Mbg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uOakv-001Ods-BE; Mon, 09 Jun 2025 13:33:33 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 6/7] drm/syncobj: Add a fast path to
 drm_syncobj_array_wait_timeout
Date: Mon,  9 Jun 2025 12:33:12 +0100
Message-ID: <20250609113313.75395-7-tvrtko.ursulin@igalia.com>
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
index b8dd75b61633..0822ed237abc 100644
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
@@ -1062,6 +1070,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  uint32_t *idx,
 						  ktime_t *deadline)
 {
+	struct syncobj_wait_entry stack_entries[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
 	struct syncobj_wait_entry *entries;
 	uint32_t signaled_count, i;
 	struct dma_fence *fence;
@@ -1076,9 +1085,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
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
@@ -1201,7 +1215,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
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

