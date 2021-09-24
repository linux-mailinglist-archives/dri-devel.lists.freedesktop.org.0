Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195074177C7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BE66EE4B;
	Fri, 24 Sep 2021 15:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B80E6E1D7;
 Fri, 24 Sep 2021 15:31:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w29so28589129wra.8;
 Fri, 24 Sep 2021 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=DPqiK0QGMir4AEcKBE/0nJK0LmfPdYfiAUEmkA8qHxsVVv4LHPBhMaUJcZ/9gZjTdQ
 t6x7gI9t20wuBPVwNG3Fxep4a0efbXOXwcjjcqvS0ozmwcvmRw1JAcScYGuMBElbKzTv
 970VEWqKQtlqmQ3gljOAP+h2G1t/MnAZABZoExQGXuV/BrWljEYsfNWRsalMTEEmlxM0
 nLme9UJU5PEsk0IPB481MpiNIGjKP6sKSVQqRJ2GjrVyMSGNIL3rvpWAyDSqtHKIGsRT
 2fcVAYIRoOkcbn+lW7wN/Asidz25tHjtcpoxS6QnUr+8eofclLZhmGD7AyWsgp5Atwys
 dLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
 b=eUbzCyjOnISni/6d7UOf6WMjaSQCopd3aZLewkXN97ifvvh+9lWl3yzLlVjweI0YQm
 0CMo+zFXX8FX+2rU1z8bkp+92Udm5ZNKXQYbihNPb+REIN6p6zuEaH+lJaDHsOnscqrS
 RwLzhbgZx8ARwUPswaMe6AzrJrGGQwKclaUeKTkIEzaJnIygXIjibUQCttpAY5nYSWQw
 mpbfRyjnb/7543drhzc8jpIdKF1+kXlKT1kZs79NS8Xp6/M455tcGfnhC8jS2lD4DTES
 gctYbTFUSRYi4AdFgjk+CvQ2JX8FsohRPyRbI0/hgf15KpehpQb8OdMtBPEtsl/SVOBc
 ijfw==
X-Gm-Message-State: AOAM532xdc4OEdH0EfnFd7HABp/vnl1g5prTFP3PkRvLZSwtVgaWbKBk
 k/3Xj8qhuFARb6rMFBuObWfYa2kJ5U8=
X-Google-Smtp-Source: ABdhPJxlt6d85SaAGgSvsRODSO3oHYmCGLPQqiQ540iLtKWHx5U8VK/yjhJbPFlndLeFvwsgGPUDFw==
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr12256993wrw.225.1632497497105; 
 Fri, 24 Sep 2021 08:31:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 20/27] drm/i915: use new iterator in
 i915_gem_object_wait_priority
Date: Fri, 24 Sep 2021 17:31:06 +0200
Message-Id: <20210924153113.2159-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

