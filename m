Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 951E642255B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA786ED8E;
	Tue,  5 Oct 2021 11:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0206EB5F;
 Tue,  5 Oct 2021 11:38:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t8so36889993wri.1;
 Tue, 05 Oct 2021 04:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=LOkDrX5kmHlbm47kFr5l0RkVNK4shdMdXMUe+U3Svea0mwFo58mjd8xTPgXVfdc1ZX
 2AYZjw8P+oSRc0bGJn/9sDrNJ7ZQgFl/F13iLjnOi4ncnuzkUP37mnK8FBcpZRxQuPGN
 mpg//UNV/5G4H9TWYyUljcJ1ML6hWeEnNVsvUrbucCH1+/cl1M3Rko6sByUUz5957pe4
 TtjoLJtoox7JFTX+UhXj/rhJihxU+MOPIwmQ4BkGmjrY2gEZQfqwSXo0QEVe/Fa6Pwxi
 I+zPizL+p1u3EcCMVAe8cO5TX9w13JrxntgzdlNE61PGOmm2ShYISCT+RJ4+x0FSvZaR
 qdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=bLHvzJkyKAJhbaPKBOOE1zZKME+c3A/spcheGdpSr4dBqpazqk+TiFWR1tK5VHyiE4
 e73L5APBkwhrdlwOGAfjcoKoCFFbB/0BKiBEGC5mL+GySXLZSslyZbG3WPZ1Ww0nPyDG
 4ephl8+9ggA7UUPR9KlXM3xbK5cQHZLHBl3SlipGX2S/9jgG/8sTxQmA34aC4NfTRYqi
 aUBBmEJawazMxRA7DTs2IB2c2IEZ5VddErKxpARYCs1IszpV528GWl5bA/y0VBgqfVzo
 H8U8uqW+oG1a03ZH9cEBV8g4w6gS6xaMuGIJuNHDCO8B3j2ag55Z+iXoIDCwamrX6rMK
 EfgQ==
X-Gm-Message-State: AOAM533SmMo/Kbb4asBrb8qGJQH1O8VWBZvq2WEre3DDOqS/D3hKdpea
 +EZoQ2+EZKGzHLF9sJW5sTQ=
X-Google-Smtp-Source: ABdhPJxtTxnwjKovdU0Rjv3RbUzLJkRjACt0BpWwHhqBj/MwXIZsKIw7vGrNqBD7rqtyxYiTJkOO5g==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr21116706wrz.264.1633433883965; 
 Tue, 05 Oct 2021 04:38:03 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:38:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/28] drm/i915: use new iterator in
 i915_gem_object_wait_priority
Date: Tue,  5 Oct 2021 13:37:35 +0200
Message-Id: <20211005113742.1101-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 31 +++++-------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index a13193db1dba..569658c7859c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -118,32 +118,13 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
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
-	}
+	dma_resv_iter_begin(&cursor, obj->base.resv, flags & I915_WAIT_ALL);
+	dma_resv_for_each_fence_unlocked(&cursor, fence)
+		i915_gem_fence_wait_priority(fence, attr);
+	dma_resv_iter_end(&cursor);
 	return 0;
 }
 
-- 
2.25.1

