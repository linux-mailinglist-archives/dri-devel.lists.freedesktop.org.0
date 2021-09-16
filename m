Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60F40D8BA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5156ECE5;
	Thu, 16 Sep 2021 11:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69CD6ECE7;
 Thu, 16 Sep 2021 11:31:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q26so8905974wrc.7;
 Thu, 16 Sep 2021 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iq9h+maBGJJf9BVUbLIQUotRRugg6V58mN3q2rJ4PzA=;
 b=mOru/iz48nbXfiXpei533afpCC1JsV0f/WVHUBvqOIQxJg9YTQKNvYDgsO77hgOuiq
 +oqdLQODlKui2M+TrUZJaEyzjL9LVQ5sb6IYfYy+0qLYqUBNpT2pqkVkwBxth/BjSlkE
 9CHYgnFnmeO44nrVLxnGHKpxRnpP4YJhVmkyJq/CfXmH2H1/R2ZWaW4Lajcf8vMz7t8E
 Ak5y+SSZwYpCvzfj2PrePEtHgOutpGYBj89DoOIHYccDIeJ2Ag/fVg5lTs23/nmm2hOz
 m6oBkn8IUIllt68kOV7mptPr4LqIWjIcokU1Xqa27kq6YOIr6K6Nxrgf9rHS0ktSZU0d
 0ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iq9h+maBGJJf9BVUbLIQUotRRugg6V58mN3q2rJ4PzA=;
 b=GhPLiQkYs53/Aqxz0y+jGdfuhbdBwmUKK7ZznmI1Nar6+C8Xpqm1yQ0DUgLsZC7YXs
 oddVVv7jXdVYiVBX3Bl2upODaMgu6IJnCDF5zUU4yTPVSojEw4WfSnoYFHHi2KqGSAzC
 WXJHs55AFdnC6FV6+XjpNXVQfViR5MOjf5jDWIesqBHSMXuMN64VLAZhDCXASCURnsmW
 3LWKCUX9inmyKSl0gGAR7XXSVyaDiLBbQkaNoknYWbyz+4INQIqvuZSoE7FX4Wjj8nw4
 bRh+k8nzgLL6MQDMGWpgXBBh/lO4jw3CBz7dsoKjatug2yil/H4SpBK1hHtFRWBBlYYG
 00IA==
X-Gm-Message-State: AOAM532ITxNCFUBowHAcqACvQQ9qjALb2EQ/OYZrDg5w7OAjL+UiS6ES
 TUu1QkNHeUlirrsenRviEHM=
X-Google-Smtp-Source: ABdhPJwC8BzcW6+gpF4ajMOfxRqmFsfm8ZOg7Wz/HkiRjhulX/A7jXMLckeH9NePCPqif17J8aoL7Q==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr5452866wrj.12.1631791860200; 
 Thu, 16 Sep 2021 04:31:00 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 16/26] drm/i915: use new iterator in
 i915_gem_object_wait_reservation v2
Date: Thu, 16 Sep 2021 13:30:32 +0200
Message-Id: <20210916113042.3631-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: add missing rcu read unlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 57 +++++++-----------------
 1 file changed, 15 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f909aaa09d9c..a75dee9d7790 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -37,55 +37,28 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 				 unsigned int flags,
 				 long timeout)
 {
-	struct dma_fence *excl;
-	bool prune_fences = false;
-
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
-
-		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			timeout = i915_gem_object_wait_fence(shared[i],
-							     flags, timeout);
-			if (timeout < 0)
-				break;
-
-			dma_fence_put(shared[i]);
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(resv, &cursor, flags & I915_WAIT_ALL,
+					 fence) {
+
+		rcu_read_unlock();
+		timeout = i915_gem_object_wait_fence(fence, flags, timeout);
+		rcu_read_lock();
+		if (timeout < 0) {
+			dma_fence_put(fence);
+			break;
 		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-
-		/*
-		 * If both shared fences and an exclusive fence exist,
-		 * then by construction the shared fences must be later
-		 * than the exclusive fence. If we successfully wait for
-		 * all the shared fences, we know that the exclusive fence
-		 * must all be signaled. If all the shared fences are
-		 * signaled, we can prune the array and recover the
-		 * floating references on the fences/requests.
-		 */
-		prune_fences = count && timeout >= 0;
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
 	}
-
-	if (excl && timeout >= 0)
-		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
-
-	dma_fence_put(excl);
+	rcu_read_unlock();
 
 	/*
 	 * Opportunistically prune the fences iff we know they have *all* been
 	 * signaled.
 	 */
-	if (prune_fences)
+	if (timeout > 0)
 		dma_resv_prune(resv);
 
 	return timeout;
-- 
2.25.1

