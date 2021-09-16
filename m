Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A640D8C6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAA689388;
	Thu, 16 Sep 2021 11:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA246ECE8;
 Thu, 16 Sep 2021 11:31:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w29so8926222wra.8;
 Thu, 16 Sep 2021 04:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L+JeWSkenc3rnv6OEgzQ/+sXft+O1bz+b+dQLLQQnPs=;
 b=cIbU1aj2FqXDYlTj1UpiY66k2myFtYTJnkKcsfTobpH58cczpQR0i1cTKyaK/yUsxV
 +0oE3avjOWpdGIQmJVhqM5+7wAR2FBz18U34WMWL7Tquyiq9snfcv/C/DQqUzb1DioLp
 sT2zxpfj2XyAFOLsqcP+90nf2dC7vSEEY1CqnZ5AwItQ0rmcceKohAgOPLYKm0PS8wxQ
 B+HdgYZfjDZhnqw5epDETuK6x3v3eBDKfrIjlEQh8UiWtXWAOJH+rhFA/tZD5ivSCWx4
 8gjCZnCZp+gp7m1Akga9O4uFvGxhJF1hJ0ij2XrurjkIl2wcGNNAHeRxwm0LdAr5LpDs
 FzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L+JeWSkenc3rnv6OEgzQ/+sXft+O1bz+b+dQLLQQnPs=;
 b=0oLjblBnSMORv70iMcgzmwKLrU2huXeCYXhHyzKHrN4YQUe6WlxBTu++OfySQ8dCTY
 4DQKzBp5LB48RVCithfCYaPO+ghL8QABRSRc8q7DvUDdgxD10Akmi9XJ0jgP+GHy+egC
 G1BHLzB0AgYiAkSzAUc5ehU8x5L/S0cyUFohD10F70eUThlpJwUNx3RWdeUPOkgf9Rrk
 stHzN5+Ti7SWC+5PK4QNK0UqRnznA6JLrYAUfgXRrRkEWLXfpZqtJMPo/O42JjCurjXG
 TbJHIG+Vg9svgvWqIIRjANJDAlrKUuJ//Kg5GuNRaZWDt672TS6HHRWu6uRUqtTfdCiN
 vOgA==
X-Gm-Message-State: AOAM530HMpYDknuVcf0yrTcdrWsXLuMazPLX23gCZEuSRu5lpmCDQzdD
 Xi10BFe3q0tUCekupJDHFXA=
X-Google-Smtp-Source: ABdhPJy5pNIvHOlHKg+/Q1+JQDe68gKs41mN6XAxrKyNoVbf9sezyMD6dzKzNFWhYUEe09lnxnZgNA==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr5582537wrm.430.1631791861162; 
 Thu, 16 Sep 2021 04:31:01 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:31:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/26] drm/i915: use new iterator in
 i915_gem_object_wait_priority v2
Date: Thu, 16 Sep 2021 13:30:33 +0200
Message-Id: <20210916113042.3631-18-christian.koenig@amd.com>
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

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 33 +++++++-----------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index a75dee9d7790..db8a72556338 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -124,32 +124,17 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 			      unsigned int flags,
 			      const struct i915_sched_attr *attr)
 {
-	struct dma_fence *excl;
-
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			i915_gem_fence_wait_priority(shared[i], attr);
-			dma_fence_put(shared[i]);
-		}
-
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-	if (excl) {
-		i915_gem_fence_wait_priority(excl, attr);
-		dma_fence_put(excl);
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor,
+					 flags & I915_WAIT_ALL, fence) {
+		rcu_read_unlock();
+		i915_gem_fence_wait_priority(fence, attr);
+		rcu_read_lock();
 	}
+	rcu_read_unlock();
 	return 0;
 }
 
-- 
2.25.1

