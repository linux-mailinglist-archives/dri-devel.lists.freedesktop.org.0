Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4203A4138A6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACA96E9C9;
	Tue, 21 Sep 2021 17:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1556C6E9D6;
 Tue, 21 Sep 2021 17:37:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i23so41644922wrb.2;
 Tue, 21 Sep 2021 10:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=ASeqxfhV9w2u70s80hnfGNFnU5dmjRz2YBiQ7UHNSa6DuGjH6nEjSaGOFwjoGr3Ngk
 OsF6e8rljOOHzPaM6Uqo+nNAkMenqie0UR85wYUOMF2itNkuiZxgp+PcNuoFkh0uAR+o
 JCO5W25qt9EiZ5MAlAbwfVhOeHFAIs82EXwXLh9sZwVM1cqEmD0rX+cEsi4gFtAOpmIN
 And+T7i3omYCqT/+l4z0ZAG7LaYrj9oxsxh1FiKcpQXNHbQV65w2ipTVrRwtcNYWNkI6
 6uD9G0l6ICgnEPEYBG3H7aMWoIFirlglUQZrYgEFE++swyz3i5KTGb+NpmtqgIOSwgBW
 3nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=02Pmow2LZzjsxqX8ZS0n7wQ2SWHem1FtCe7GdJWQjEhXQbo2G63Keh3B7INjk845XO
 oAZWdKQaQSGBqLDcepxQ/mu7rGrnbuQLpKaloLMCUJv1rFTxeWRMtlsFBkTTd8JXChxT
 0JD0P50fddWEWC8EGzE4DTn523Q9Qv0p01QUYKLmGvvqZL8p+6EOpd+K0n6QbmXaPId2
 /cy/zeCskrduB6eKUpHFKc0dPbp+26ST5IDB7LlAi85FX463r8LPc+RBHh+2XQN9wbFa
 Gbtk8y3gfaOfx1uMDQU8I4eaJPOw4xasLb4HK5EJ9egDazIP7LEGwzZrgSEpnlESkCe5
 LzkQ==
X-Gm-Message-State: AOAM533DDpnwm1kej2tyvIFzEQp2jvnBmQOxj/fhHYLJPfBlkF1Khb7L
 LOjBmdBPuecQJgGsYtjysFYrNv4ID5g=
X-Google-Smtp-Source: ABdhPJwlzB0biUHAG3WLi9lDLjR+cNGbXPohCdHBMasqxBhW5gM4Vorg44beBvytvEnF/f+/0iN96g==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr36944797wrm.394.1632245838354; 
 Tue, 21 Sep 2021 10:37:18 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/26] drm/i915: use new iterator in
 i915_gem_object_wait_priority
Date: Tue, 21 Sep 2021 19:36:50 +0200
Message-Id: <20210921173659.246165-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

