Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC893A41A1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 14:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FC46EE85;
	Fri, 11 Jun 2021 12:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A443E6EE7F;
 Fri, 11 Jun 2021 12:03:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q5so5800893wrm.1;
 Fri, 11 Jun 2021 05:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PUBnSqjifeABnYmtmaOv5fGKIFLMtAzhnEogHRJYJ2s=;
 b=IQ6cxtfx0dDVBgLtGbUsWjH82+HOlHaz13d5FupguKUOej8LIDYJnr7f2ozl6dhywq
 LkPevhrlWxiyerzaoR40MCmHIoYoaOmhMwVHDCMZynl86ag23J3oU4vPRIO8ib0VDOWq
 RB/64FfFVNoTz0MhvFGqKZCA3vjYcIafEfjcAdUlaffWZfKeTjb/pkhM5gedU8VSwS0e
 4x96OSGOcTTd1mA682an1FzsOGQpKcJiF5yTE7/c7An64Sc0NMWjgb0r0ScodlfFv5G3
 m3lzqfvIinHk/WcmK8AyP75nsBxU4YAH9Pt47TXzrHduQtTQCYRjzJQDmHAEc3/DD0mt
 tYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PUBnSqjifeABnYmtmaOv5fGKIFLMtAzhnEogHRJYJ2s=;
 b=ggS3nzPaMhk0/N82k4pGMxjd4bOwQw8VUP9fXOAOlslnFtvXK0emvFrmCSJPJxoxL7
 5CgyGeIj7SboE59ayv/HPxTDFv0hs79D7WA0+DO8XhITBkDwr3mgQZR/eBs3nuQjAg8j
 Mc2eadHGWzx2isl+cBYqH7XOIyMup1zqWHmZbvqxk3z0H+JGHkNKHuoTUwg8vzXM6e/e
 1pHo8e0w1/Ip5fthEReaq9go50IKfsieiG1Meexkm32ywrJ9+HYPzgrAlaHFfU+5ZwM8
 D1hrt3hPZk4lDM/zLuAJ2ZAPcq9IVg2Z0ChLY0ENHu2yH6DPijrQzAXgAd6RTwRA0DJZ
 pfpA==
X-Gm-Message-State: AOAM533pGjDMFQNfVFXSrc2V9rlksTdCHP0LWRS1b0DV/DYU1375w542
 a4PyWfB3SvbsyUxPd+6pOKVrfc5NIhE=
X-Google-Smtp-Source: ABdhPJyoP6aAfNQ5tdKkfx+y2yxUVXP3KJD8ncxOLdSBMRjyp63lkEt/dZD3rrtVBAVCNWOtcrKQcw==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr3498770wrm.177.1623412984329; 
 Fri, 11 Jun 2021 05:03:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:657d:4ae8:def3:d96a])
 by smtp.gmail.com with ESMTPSA id f13sm6898361wrt.86.2021.06.11.05.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 05:03:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/amdgpu: unwrap fence chains in the explicit sync fence
Date: Fri, 11 Jun 2021 14:03:00 +0200
Message-Id: <20210611120301.10595-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611120301.10595-1-christian.koenig@amd.com>
References: <20210611120301.10595-1-christian.koenig@amd.com>
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

Unwrap the explicit fence if it is a dma_fence_chain and
sync to the first fence not matching the owner rules.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 118 +++++++++++++----------
 1 file changed, 68 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 1b2ceccaf5b0..862eb3c1c4c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -28,6 +28,8 @@
  *    Christian König <christian.koenig@amd.com>
  */
 
+#include <linux/dma-fence-chain.h>
+
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -186,6 +188,55 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, struct dma_fence *fence)
 	return amdgpu_sync_fence(sync, fence);
 }
 
+/* Determine based on the owner and mode if we should sync to a fence or not */
+static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
+				   enum amdgpu_sync_mode mode,
+				   void *owner, struct dma_fence *f)
+{
+	void *fence_owner = amdgpu_sync_get_owner(f);
+
+	/* Always sync to moves, no matter what */
+	if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED)
+		return true;
+
+	/* We only want to trigger KFD eviction fences on
+	 * evict or move jobs. Skip KFD fences otherwise.
+	 */
+	if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
+	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
+		return false;
+
+	/* Never sync to VM updates either. */
+	if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
+	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
+		return false;
+
+	/* Ignore fences depending on the sync mode */
+	switch (mode) {
+	case AMDGPU_SYNC_ALWAYS:
+		return true;
+
+	case AMDGPU_SYNC_NE_OWNER:
+		if (amdgpu_sync_same_dev(adev, f) &&
+		    fence_owner == owner)
+			return false;
+		break;
+
+	case AMDGPU_SYNC_EQ_OWNER:
+		if (amdgpu_sync_same_dev(adev, f) &&
+		    fence_owner != owner)
+			return false;
+		break;
+
+	case AMDGPU_SYNC_EXPLICIT:
+		return false;
+	}
+
+	WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
+	     "Adding eviction fence to sync obj");
+	return true;
+}
+
 /**
  * amdgpu_sync_resv - sync to a reservation object
  *
@@ -211,67 +262,34 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 
 	/* always sync to the exclusive fence */
 	f = dma_resv_excl_fence(resv);
-	r = amdgpu_sync_fence(sync, f);
+	dma_fence_chain_for_each(f, f) {
+		struct dma_fence_chain *chain = to_dma_fence_chain(f);
+
+		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
+					   chain->fence : f)) {
+			r = amdgpu_sync_fence(sync, f);
+			dma_fence_put(f);
+			if (r)
+				return r;
+			break;
+		}
+	}
 
 	flist = dma_resv_shared_list(resv);
-	if (!flist || r)
-		return r;
+	if (!flist)
+		return 0;
 
 	for (i = 0; i < flist->shared_count; ++i) {
-		void *fence_owner;
-
 		f = rcu_dereference_protected(flist->shared[i],
 					      dma_resv_held(resv));
 
-		fence_owner = amdgpu_sync_get_owner(f);
-
-		/* Always sync to moves, no matter what */
-		if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED) {
+		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
 			r = amdgpu_sync_fence(sync, f);
 			if (r)
-				break;
-		}
-
-		/* We only want to trigger KFD eviction fences on
-		 * evict or move jobs. Skip KFD fences otherwise.
-		 */
-		if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
-		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
-			continue;
-
-		/* Never sync to VM updates either. */
-		if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
-		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
-			continue;
-
-		/* Ignore fences depending on the sync mode */
-		switch (mode) {
-		case AMDGPU_SYNC_ALWAYS:
-			break;
-
-		case AMDGPU_SYNC_NE_OWNER:
-			if (amdgpu_sync_same_dev(adev, f) &&
-			    fence_owner == owner)
-				continue;
-			break;
-
-		case AMDGPU_SYNC_EQ_OWNER:
-			if (amdgpu_sync_same_dev(adev, f) &&
-			    fence_owner != owner)
-				continue;
-			break;
-
-		case AMDGPU_SYNC_EXPLICIT:
-			continue;
+				return r;
 		}
-
-		WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
-		     "Adding eviction fence to sync obj");
-		r = amdgpu_sync_fence(sync, f);
-		if (r)
-			break;
 	}
-	return r;
+	return 0;
 }
 
 /**
-- 
2.25.1

