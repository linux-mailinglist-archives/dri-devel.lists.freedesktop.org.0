Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B898DA72BAE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEA510E87B;
	Thu, 27 Mar 2025 08:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="P5uiYF5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5930010E87E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mo/zS0AR04mbs1TeRdiXaSHrD+7lvTGjkC/E/q0r3VI=; b=P5uiYF5+qj4Fu1hB7yAJ4v7xdc
 fQIaU4uITCgv06/V1zEeG4GDMvb25I3sQG+lt2KzwKmGOz+5H2vZovMlzuT+BL0X04XPfScc+HBfh
 kwPlPaSEihpagZZae30FzcPRMvxoRWWFBY7p1z+11VOav3UAw4nfa/K1UkUW7LCxOGog/XSTyfkUV
 YK4kyWB9ZvuDizRbCHr1sg1A7nXFRP2p52YVv5QpAXI1S2KIudKHaWBliiDaNV9aO5Cecrr4sl72a
 eMyf9TXevl2xlZ4WzMd5sE69838l08HfthTzeCUaGwjHd0RKursosPOHxAhpOk14xW1OK3N7heMb+
 Rw1txCsA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1txiof-0078kx-3U; Thu, 27 Mar 2025 09:42:21 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 2/7] drm/syncobj: Do not allocate an array to store zeros
 when waiting
Date: Thu, 27 Mar 2025 08:42:09 +0000
Message-ID: <20250327084215.26662-3-tvrtko.ursulin@igalia.com>
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

When waiting on syncobjs the current code allocates a temporary array only
to fill it up with all zeros.

We can avoid that by relying on the allocated entry array already being
zero allocated.

For the timeline mode we can fetch the timeline point values as we
populate the entries array so also do not need this additional temporary
allocation.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 39 ++++++++++++++---------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 55bb99f1af7e..28081cf74052 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1028,7 +1028,7 @@ static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 }
 
 static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
-						  void __user *user_points,
+						  u64 __user *user_points,
 						  uint32_t count,
 						  uint32_t flags,
 						  signed long timeout,
@@ -1036,9 +1036,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  ktime_t *deadline)
 {
 	struct syncobj_wait_entry *entries;
-	struct dma_fence *fence;
-	uint64_t *points;
 	uint32_t signaled_count, i;
+	struct dma_fence *fence;
 
 	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
 		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
@@ -1046,24 +1045,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		lockdep_assert_none_held_once();
 	}
 
-	points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
-	if (points == NULL)
-		return -ENOMEM;
-
-	if (!user_points) {
-		memset(points, 0, count * sizeof(uint64_t));
-
-	} else if (copy_from_user(points, user_points,
-				  sizeof(uint64_t) * count)) {
-		timeout = -EFAULT;
-		goto err_free_points;
-	}
+	if (user_points &&
+	    !access_ok(user_points, count * sizeof(*user_points)))
+		return -EFAULT;
 
 	entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
-	if (!entries) {
-		timeout = -ENOMEM;
-		goto err_free_points;
-	}
+	if (!entries)
+		return -ENOMEM;
+
 	/* Walk the list of sync objects and initialize entries.  We do
 	 * this up-front so that we can properly return -EINVAL if there is
 	 * a syncobj with a missing fence and then never have the chance of
@@ -1074,9 +1063,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		struct dma_fence *fence;
 
 		entries[i].task = current;
-		entries[i].point = points[i];
+		if (user_points &&
+		    __get_user(entries[i].point, user_points++)) {
+			timeout = -EFAULT;
+			goto cleanup_entries;
+		}
 		fence = drm_syncobj_fence_get(syncobjs[i]);
-		if (!fence || dma_fence_chain_find_seqno(&fence, points[i])) {
+		if (!fence ||
+		    dma_fence_chain_find_seqno(&fence, entries[i].point)) {
 			dma_fence_put(fence);
 			if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
 				     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
@@ -1182,9 +1176,6 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 	}
 	kfree(entries);
 
-err_free_points:
-	kfree(points);
-
 	return timeout;
 }
 
-- 
2.48.0

