Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A6DA72BAF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0719A10E87A;
	Thu, 27 Mar 2025 08:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="b5mFilmE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596F810E881
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HrgU3UAgqGG90OFBgDphyF5w78Vi9g9EncnCtCJmgtU=; b=b5mFilmEMHhaRC84baG0w0K1OA
 ckGwMz5lB2AoDi6Ah+wNUV764zasD9t+tgLuW2RRbbR55f7O7mMrzFXKlcUbZEWfUMk7gHYMATZ2O
 7BtDoa/DZYlKul1ODtHORIiPNSUsGt6k6Hxfh4Q7L9GwFtDK8DJge3HdmxyjuDxraqg42nOfOSw2l
 kfUj0H5lau0j2lKD9Muj2LRGhBqWPY/J505Rh6+O/kS5Cr2FQTncMl8j53FbhzT4gIjkCZzPIewMp
 KAwfwCr2Pj3DXLDtV1N5nv1vi2zi3nBBVE2Xj06opLGDGnFIJH1nk8Rr+RVU7tGL5rMbswfJnJu0Z
 aSF/n3JA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1txioh-0078lL-Tc; Thu, 27 Mar 2025 09:42:23 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 6/7] drm/syncobj: Add a fast path to
 drm_syncobj_array_wait_timeout
Date: Thu, 27 Mar 2025 08:42:13 +0000
Message-ID: <20250327084215.26662-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250327084215.26662-1-tvrtko.ursulin@igalia.com>
References: <20250327084215.26662-1-tvrtko.ursulin@igalia.com>
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
---
 drivers/gpu/drm/drm_syncobj.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index bf2fbe07add2..b906d6acb4ef 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1035,6 +1035,12 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  uint32_t *idx,
 						  ktime_t *deadline)
 {
+	/*
+	 * Empirically vast majority of calls here works with just a single
+	 * point (96%) and never more than three points. Therefore a small stack
+	 * array can cheaply avoid multiple per frame allocations.
+	 */
+	struct syncobj_wait_entry stack_entries[4];
 	struct syncobj_wait_entry *entries;
 	uint32_t signaled_count, i;
 	struct dma_fence *fence;
@@ -1049,9 +1055,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
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
@@ -1174,7 +1185,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
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

