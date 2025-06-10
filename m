Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76372AD305F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71FA10E4B5;
	Tue, 10 Jun 2025 08:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lDrKsGMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A0810E264;
 Tue, 10 Jun 2025 08:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YOjqMe/tuuD75cYyDJpqDWi3JSyTU2QIgA+7utXEbb8=; b=lDrKsGMW4vFegfMhil/z3M8V1o
 lqVC21QxOcZKBRND6vxmHpN4mYyEF5U0+K9RDQeAtOOLavBYbQuFneBCZHmvR9evtr5bFXDMz9JBe
 T+bljFqIvaw2San0Ukva0lWpSMhOGuk6vCExAquDamlvaFKyq9lcWXqGM/1XCLD20xZ67nI27gmLm
 2tLLt+mQOcq4EmX4HHk3dhiCE7wLXUOhdvG936A7cq0iCglDjXbRFdp0KW0z+MRlNAy7kLmsm81dx
 2IPjWhtPBQz4aW9PK8AEnIsQ/HB+kxnrWUip2sW2Cvdcky3sBIUnkqoz4BUCVTBH0uo5nwChsEJcW
 DsvO1jKA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uOuMv-001jmk-Kh; Tue, 10 Jun 2025 10:30:05 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 2/6] drm/syncobj: Do not allocate an array to store zeros
 when waiting
Date: Tue, 10 Jun 2025 09:29:57 +0100
Message-ID: <20250610083001.4120-3-tvrtko.ursulin@igalia.com>
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

When waiting on syncobjs the current code allocates a temporary array only
to fill it up with all zeros.

We can avoid that by relying on the allocated entry array already being
zero allocated.

For the timeline mode we can fetch the timeline point values as we
populate the entries array so also do not need this additional temporary
allocation.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com> # v1
---
v2:
 * Change back to copy_from_user due 32-bit ARM not implementing 64-bit
   get_user.
---
 drivers/gpu/drm/drm_syncobj.c | 38 ++++++++++++-----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e2d97dd6e45b..67efdd22f9bc 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1055,7 +1055,7 @@ static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 }
 
 static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
-						  void __user *user_points,
+						  u64 __user *user_points,
 						  uint32_t count,
 						  uint32_t flags,
 						  signed long timeout,
@@ -1063,9 +1063,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  ktime_t *deadline)
 {
 	struct syncobj_wait_entry *entries;
-	struct dma_fence *fence;
-	uint64_t *points;
 	uint32_t signaled_count, i;
+	struct dma_fence *fence;
 
 	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
 		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
@@ -1073,24 +1072,10 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
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
-
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
@@ -1101,9 +1086,15 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		struct dma_fence *fence;
 
 		entries[i].task = current;
-		entries[i].point = points[i];
+		if (user_points &&
+		    copy_from_user(user_points++, &entries[i].point,
+				   sizeof(*user_points))) {
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
@@ -1209,9 +1200,6 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 	}
 	kfree(entries);
 
-err_free_points:
-	kfree(points);
-
 	return timeout;
 }
 
-- 
2.48.0

