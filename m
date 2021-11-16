Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A298452EFA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 11:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99036E9BF;
	Tue, 16 Nov 2021 10:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1106E3AA;
 Tue, 16 Nov 2021 10:24:41 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 133so16462154wme.0;
 Tue, 16 Nov 2021 02:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I/M6sTf7ATt/rzPF6URMkni7yX+VjLJUHjt0X/PXmv0=;
 b=ndZTe8Y9mlxRHD1/+xdtSC+e40sWXeMCSvdJBE/wZWd1iPQNL2mCLaVO2X02xni34g
 BFyog4vXPqQU6eshAPpGRbAETCP64JTuaqhtpjWB2/15fHa/gSwAG21xWns45cmWUvsc
 EL8x6wIxcyeBwbF0VgPBPiRRXyKufLTDiUX1PMclWY7frcVcOoe5Pad8jUxbae+VaMAk
 NneDHDX8LDSZGfCrEAeYWnDXUZoO4S2XDaIKieyPXktKsXUTHq671Uv8WE80btsx/TA9
 sxYMNsUQp0LD18i8n4Ps1xh8ewlvcs3raWp55sH3fe49WQgIQbpw13qh0Dd/GmKJEOsQ
 K28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I/M6sTf7ATt/rzPF6URMkni7yX+VjLJUHjt0X/PXmv0=;
 b=MVSdhg1tzmjUN5LCfiER9omDCMyD+tL3EcKhKG43L9LNI8YBPJ3xba5dj8Wgc6uxt5
 UIUdya1YyXqEWpokhKIu/D1Vj9pCXoq44KQTi4FtyNuYsSMwlK7tTRn0acGOexddoT9S
 4jsA/UuUr/DFd2DImrR0OXZ3EgK5NbYnRW5/1kQ/qFqRIqq8Bv1/2kJF60pfdQpQYKmX
 5ijs+sIAKqCGbeqre5UJY88Qq/IZZj2/77z52rAt/o5hTTCk7PKxvDyA6pARWBzoJprq
 uJ9u03pMm0mqOmqeFBizxN6aVeqwh5rPfDVEiqJWmJBaYXSwoIhNadOsZqd1S93SJ3BK
 HmlA==
X-Gm-Message-State: AOAM531URECACvVd6Fx5pODaXEuzDVQGRpmO+N+9M40K44Pcu8ItQdWS
 neXJxjjPnB/7iVp240K1hrKfqDCerxpbtw==
X-Google-Smtp-Source: ABdhPJyVjz3Wm6UD2lJOaHzrThq4QhzjSSQzJdbbe9KcUHIUpL+a0yNteV2Wyp/AmL4ZtAwD6gqw/A==
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr6658826wmb.191.1637058279891; 
 Tue, 16 Nov 2021 02:24:39 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 4sm22119334wrz.90.2021.11.16.02.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:24:39 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
Date: Tue, 16 Nov 2021 11:24:31 +0100
Message-Id: <20211116102431.198905-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116102431.198905-1-christian.koenig@amd.com>
References: <20211116102431.198905-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
[mlankhorst: Handle timeout = 0 correctly, use new i915_request_wait_timeout.]
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 63 +++++++-----------------
 1 file changed, 19 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 34e46134326b..f11325484110 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -25,7 +25,7 @@ i915_gem_object_wait_fence(struct dma_fence *fence,
 		return timeout;
 
 	if (dma_fence_is_i915(fence))
-		return i915_request_wait(to_request(fence), flags, timeout);
+		return i915_request_wait_timeout(to_request(fence), flags, timeout);
 
 	return dma_fence_wait_timeout(fence,
 				      flags & I915_WAIT_INTERRUPTIBLE,
@@ -37,58 +37,29 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
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
-		}
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	long ret = timeout ?: 1;
 
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
+	dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		ret = i915_gem_object_wait_fence(fence, flags, timeout);
+		if (ret <= 0)
+			break;
 
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
+		if (timeout)
+			timeout = ret;
 	}
-
-	if (excl && timeout >= 0)
-		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
-
-	dma_fence_put(excl);
+	dma_resv_iter_end(&cursor);
 
 	/*
 	 * Opportunistically prune the fences iff we know they have *all* been
 	 * signaled.
 	 */
-	if (prune_fences)
+	if (timeout > 0)
 		dma_resv_prune(resv);
 
-	return timeout;
+	return ret;
 }
 
 static void fence_set_priority(struct dma_fence *fence,
@@ -177,7 +148,11 @@ i915_gem_object_wait(struct drm_i915_gem_object *obj,
 
 	timeout = i915_gem_object_wait_reservation(obj->base.resv,
 						   flags, timeout);
-	return timeout < 0 ? timeout : 0;
+
+	if (timeout < 0)
+		return timeout;
+
+	return !timeout ? -ETIME : 0;
 }
 
 static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)
-- 
2.25.1

