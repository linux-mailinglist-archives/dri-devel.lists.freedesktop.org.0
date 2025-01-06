Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BCDA02387
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 11:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1110E620;
	Mon,  6 Jan 2025 10:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pa3hI6iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9736610E61D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6mfcNV3dEhuIwudHRhrR7jwGq20pFOKH0SBxg5mIPsA=; b=pa3hI6iwfs5klrdTTNpT7RSp3t
 SGcVlYmsya6+akcfTyuL7lm1YgpTFvEipo7u9TIb/k1tnFq4gPfqlesOeItcuG/l+VQDvW7vcZsBd
 if2kA57aHCD0O8RQ8yzEllqzQrFR3DHz7AWP45Q1zpqYGitp6DF1+BUG07yJCbV6q3e0eg9FmUl+C
 CXgcAJGEeaE8GnvQCfok3DdPzP2yGUOYOvIvHOdrKbGYygldPTyffnU06ECdU+Z5ur/eSkeRTZwLm
 tyA79TLI8D6B1VHulAAS8nXmjg3rSLx54ZTkW8igfjdWo/4M7c9y7kw9FowkBOf7NUnYogdun9waN
 Na+Hj18Q==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tUklb-00CESQ-T4; Mon, 06 Jan 2025 11:55:27 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 6/7] drm/syncobj: Add a fast path to
 drm_syncobj_array_wait_timeout
Date: Mon,  6 Jan 2025 10:55:20 +0000
Message-ID: <20250106105521.53149-7-tursulin@igalia.com>
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

Running the Cyberpunk 2077 benchmark we can observe that waiting on DRM
sycobjs is relatively hot, but the 96% of the calls are for a single
object. (~4% for two points, and never more than three points. While
a more trivial workload like vkmark under Plasma is even more skewed
to single point waits.)

Therefore lets add a fast path to bypass the kcalloc/kfree and use a pre-
allocated stack array for those cases.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index b4563c696056..94932b89298f 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1035,6 +1035,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  uint32_t *idx,
 						  ktime_t *deadline)
 {
+	struct syncobj_wait_entry stack_entries[4];
 	struct syncobj_wait_entry *entries;
 	uint32_t signaled_count, i;
 	struct dma_fence *fence;
@@ -1049,9 +1050,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
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
@@ -1174,7 +1180,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
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
2.47.1

