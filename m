Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB3A4144D6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E8B6EB3B;
	Wed, 22 Sep 2021 09:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E1F6EB27;
 Wed, 22 Sep 2021 09:11:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w29so4624450wra.8;
 Wed, 22 Sep 2021 02:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=UEJYZHOyM5FWBh9nFOlDTSRbwlHNw/8R8L9nK56tUJVXe7V/Ima+jW2VZw79JO7ka5
 cwoWdjIm9cs5G6xD0D6y8VuS/watKoxa8d/UNOMfg8GszX4sOsfkzjzV0XYC9fIWclKK
 /P4nvvEmmNMAqQnYiexWsKOfznTEAwGPGPyhPkzbsoyqxZOp99fDoYBBQIiTwOC4MF0O
 /IgJEPAeTiCKfmLDL7RT4EPLT0Z4AgjvVCNNGf5R2ubbC8ncoiGYIa/OB2vc/GGgJNzM
 BohW0I5Vi6ffGgY6Lx4WV6D9P/vqlF1qFv5p+BkHL/TXYoSUowrshpIl9weAL3duuDBo
 wjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=y7ryBBJx6SjTZOje0ps8nbRgd0FuXAPwZnNRwuIxg0jHyBD1iHub3tqqNtT/AOgwkO
 yipmeQHSS7ZsDQNi1FbCVFQtBO7gDFrE1gCxa0X9f9PKTFDLe4W3oLxswDUp4NW8McbL
 WLwWwBXrwoInZEGhAt7GV8CHXPDNxgmi35s06sEBXSC7o3JPCjC8orn8KqFpleZnA0Ml
 b5QDpzX2rx33M328hJjpMukPMJkL7xqbAYSgBsCy9WjVIUn6vddBjdKDkybNUMD01tc3
 7sFFN24Cp0EEe80WcEj5gZBeph+WsvuQW4ECRNCckUfPnPzz4aZPbRP77SV8G3HbB4sh
 SZSw==
X-Gm-Message-State: AOAM531v/FdwuRt02wtggHF4wAYKpQgw1ehnuLCWVCDtrUeOVmSOJ8oN
 R/Zf/zAPyz+6Yg281NQc2jw=
X-Google-Smtp-Source: ABdhPJz1tDCj/P5Xzak0LokdOWDqixMC4Hm+RqE58sLy9CPecXzeoWkCE/IuZQKIb8Y1zBAL+6TWYg==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr33406906wri.96.1632301863666; 
 Wed, 22 Sep 2021 02:11:03 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:11:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/26] drm/i915: use new iterator in
 i915_gem_object_wait_priority
Date: Wed, 22 Sep 2021 11:10:35 +0200
Message-Id: <20210922091044.2612-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

