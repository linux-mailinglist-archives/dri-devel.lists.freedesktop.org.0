Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9C941EA87
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458F76EDEB;
	Fri,  1 Oct 2021 10:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFF58967A;
 Fri,  1 Oct 2021 10:06:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s21so14583366wra.7;
 Fri, 01 Oct 2021 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=Ea4WSe15oLwwlNdQvSBetjw7fNJ7A/u0TCKXwUS2Vcmu5XZOlo48VdQej41rFjqpqq
 eYUy0mXBw/fut1muWHXT9+1hqksgRHF+THgYMqbL9k5FUlMmOi1T+aRUA1Y1EWNB8nIg
 14CRVkMV35yMz083mG8awueAhh/p0mRuRB4+OW1j7FsMBVOz/VzCd2taDBnx1lfH3izG
 5TK658+MW+NsmHWlVc8ztktPuQFIk70ARmz3/5rbvmNDPfiI3J3VHWVzUx8kG/9pz4Og
 ukqvNwGCE7yyRFAz7fTKND4foPrqoPRCRq5PcO4qzShXhX+PCfN3hn7VHPM1PjmU7din
 RG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=PYEy9p/Nao1jNVb+abClWYJzzhg8GkDbZpE2107mQ3nxha8HySP9f9+MU2rzyp5WlI
 Pl7L19cGmHOzpopjTNquBQ+lIfKBiEHGxpHN1bHICitvu3j4g9yXWpWi5pqB9eQAdAR9
 rdfG8FaxKWR6IfZZxMSqmAoA+E+t0Knz0nzS4LzapeaKCCmjSXuZCExqwi3mdAxUdh26
 BJ6zTF1mLilsyg1+T+VI/RDZam3jo0JVdI6ZpPK91Qklv3EybH+4nyg7HqdJ7ppSlO9a
 01OjqdJO5FwW1/1WgjxxEJFmgjPssqzGOzJQLjJgLyCqS8bS0eJekYwV+NPlMK14EQA0
 3uIw==
X-Gm-Message-State: AOAM531rze0WsCbB9wDveTfeAUPfIHVd7050ZlJNJLbessgDYDoOQS2f
 wUrS9msh2PuitZ66strrMhI=
X-Google-Smtp-Source: ABdhPJyhTV6eK+nXojv3NtgnfpImqFkB7246DJKrxQRsA2i58ql61cG9cmL2nAfe56n6teyJszJRNw==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr11320275wrb.56.1633082791648; 
 Fri, 01 Oct 2021 03:06:31 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/28] drm/i915: use new iterator in
 i915_gem_object_wait_priority
Date: Fri,  1 Oct 2021 12:06:03 +0200
Message-Id: <20211001100610.2899-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

