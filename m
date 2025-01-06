Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD53A02384
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 11:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A268C10E61C;
	Mon,  6 Jan 2025 10:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RGz8buHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA7610E61A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m6I298HLXOcmu0GUv8EEyo0IbcOxZIht5elJ4BjzQ9c=; b=RGz8buHfHdAs2lGHt0JbVEcRDI
 hw8DymEALyFuoL+5M17PwngUJByalNRrMQ3Hvct7UyDDCpFykb2z7f8mEtZRLVSQLQdIq3ceS2xAq
 TV1VBcXtyYGZv3nDSvxKa0IIa4VcpypDN18G6KKfn5Do+ZF+wG4N6KA8COuJXz/J5x84jstfS+d2Q
 DxsOifADMV+M9ipsCgPdIxrcQMRyg//OQkRduS4xAkOz2zk5pMNhBsxvE3BTPYsJySBdA8UI8SPSY
 S0Jj8ZcHQXZ4pW4xdjywlEFErIpJPjxX8Jvl/v+yl5ka0mc4mWZfTcIv2vx4eIZAR5zsPHh5tFbLQ
 S8NOYTlg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tUklZ-00CES4-3H; Mon, 06 Jan 2025 11:55:25 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 2/7] drm/syncobj: Do not allocate an array to store zeros when
 waiting
Date: Mon,  6 Jan 2025 10:55:16 +0000
Message-ID: <20250106105521.53149-3-tursulin@igalia.com>
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

When waiting on syncobjs the current code allocates a temporary array only
to fill it up with all zeros.

We can avoid that by relying on the allocated entry array already being
zero allocated.

For the timeline mode we can fetch the timeline point values as we
populate the entries array so also do not need this additional temporary
allocation.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 39 ++++++++++++++---------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index d0d60c331df8..fd5ba6c89666 100644
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
2.47.1

