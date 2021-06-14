Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA20E3A6D6F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 19:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B006E0D5;
	Mon, 14 Jun 2021 17:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF706E0D4;
 Mon, 14 Jun 2021 17:45:39 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id l1so17936077ejb.6;
 Mon, 14 Jun 2021 10:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUBnSqjifeABnYmtmaOv5fGKIFLMtAzhnEogHRJYJ2s=;
 b=ppPZADw+QT7N33huZ+DamqtRdGuphRtdQTBYLg2s43S1UernvauzDTwKKOUD+Jfz1+
 wo4SQA+Klem3QZd8xirUuurk8YxroKP/Enkg7mMbeAS1YVVgoP8wrPqOnDEZ83g3+xWc
 /lHiqYjeAS4qSnTZDV8CrVBOKP+1leW7/I0E9VmzGauGMnSC2KZ+aSXdc5+dor6fagKG
 ftxaoqd3Mu/ssVFFO48nHWo5QC5Fwt4M0uyfg/FmMk5J8HSUVvpU62MlKE9YSpOu4oay
 oOffNJjvAb6CYcvQsuOTFKtgsPOl3++e19KhbNUWMUgARER2mHTNRBfWXYqyo0Js5y1g
 fzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUBnSqjifeABnYmtmaOv5fGKIFLMtAzhnEogHRJYJ2s=;
 b=RmQo84P0s1BN17W5h+OOPQqAWZLEK/o3H5Bk4utQ8rUFSaod/GYrK0lACbIbitqjgV
 CvUWnFkNeSGGfKIUrLxyzMKfnQe/nPdRksGgzCa/HMvIDBetPLzOh/gVkAMZwnQyiBIs
 2G2hhU8XY3OWSFLzPG5GKpet1W8cJl0DDio3rj+u+C9g5VE6yeGsG4Jr/aoIa3bdNDfb
 yNQdfjqpEaL5PUJUk6KKLLbnMNr5QmqxVNgDo4Nb06oribZcXY6gKjO2L4ivCqM1CphI
 u/E2H/xofvb+56PjjPJC5do8c0DkmOoncm9oYoC7OLWLKoVtaXwPQpsWFNcUeT3oococ
 x0pw==
X-Gm-Message-State: AOAM5300cgVnUBLau6pC9W0nvGfFnZN5TSVMTeMRojdCgbyGh00QeV9L
 SoE/qPRWhd9xuRgqYdDo8WU=
X-Google-Smtp-Source: ABdhPJyMqKpeVbOoiq5EPXQZv8wXG409C6WvYONsDz7q1O3JojCYYv5OYtR+or5GVviUlpwgkzb6/w==
X-Received: by 2002:a17:907:1b29:: with SMTP id
 mp41mr15278003ejc.459.1623692737888; 
 Mon, 14 Jun 2021 10:45:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3d13:a2c3:d033:759a])
 by smtp.gmail.com with ESMTPSA id a3sm77485edu.61.2021.06.14.10.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 10:45:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: unwrap fence chains in the explicit sync fence
Date: Mon, 14 Jun 2021 19:45:35 +0200
Message-Id: <20210614174536.5188-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

