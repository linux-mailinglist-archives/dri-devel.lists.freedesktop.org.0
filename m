Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD613A281E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A127A6EC99;
	Thu, 10 Jun 2021 09:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7C46EC93;
 Thu, 10 Jun 2021 09:18:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a20so1452628wrc.0;
 Thu, 10 Jun 2021 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N8zFFA7siWSXhsM7ssma8AGR3gVwyiCeeO2Q4PmVNGY=;
 b=lcCcKJQf9ExQQVGFIODvcl7hW3gqmhXI/AuzmBvWLVXmqplP0ECQniuSJG+jTPmmzQ
 SBmj9QnpIxpq/gU8Ny4smKuS4wFNOHhRl4JKOhWl22fU4+R5WFLwa9r9q6WexGUMn72D
 pWAq2g8G+RCUHr++HQ33Th/onmdKXJLtrf9tWmodx1xVcyBv9nhCFuzGHcjMnrsEZNYW
 uAi/KICNBFtiGx50W2wFwzT5G1blGsrpNd1bnXu5K2SyCWZgjnAdIxflj+cBXLSKedfi
 VbYXiIwBIxsT0CftjpiMEXsQfbHJqYt8/AMv6dzodaTRQ6iBcIKIjSUZR4Ty6iUcMMd5
 UCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N8zFFA7siWSXhsM7ssma8AGR3gVwyiCeeO2Q4PmVNGY=;
 b=o2V+vrIUw+0ygvYSmPvdDxqwiSWQ+2IN2cNNjva7PRQ33dNyTH+tw1mrUYMR6C+8fs
 CoGKPenmV9/ipX834T/uk61i4BVZbSbP3zhxX68HA3rZPxTVwuRnIeWA+hBB9uReyEhB
 lFAVSPWv/00CjBsKVHcblK/WaF+IoMVPa0dxAjz2FuW9EeUNWfUwZMRlQHKmOODvsrdK
 L07WCknGLTd9F6OfgYURuXQ3DIgX7CGT+VHVnsGFCP+GzUsPYRQ//1pHQO/P2LZLU06D
 8fdVl2SjrLcLv2og2+v3iiN7YB8T4zemtjI8MvPyy9eTc5RlrhZRqHd+llOyO4+JVM/l
 /QXw==
X-Gm-Message-State: AOAM531HP/O10LjPIgvs0rxPe7bNYYaJ6WS/t9+XQkra2+N9iBcax0aD
 4G4lv1fhW9t/ytcwrmb9Lek=
X-Google-Smtp-Source: ABdhPJydk/EHMRARgGIrbNpMvGC9LIkDiFOk4reZu9oPtmtgjLmDEgrr49DN4ZqCP6U/N7xVUFe/BQ==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr4325939wrs.298.1623316686161; 
 Thu, 10 Jun 2021 02:18:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:561f:e43a:edf5:8f95])
 by smtp.gmail.com with ESMTPSA id v8sm3087445wrc.29.2021.06.10.02.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:18:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/7] drm/amdgpu: unwrap fence chains in the explicit sync fence
Date: Thu, 10 Jun 2021 11:17:59 +0200
Message-Id: <20210610091800.1833-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610091800.1833-1-christian.koenig@amd.com>
References: <20210610091800.1833-1-christian.koenig@amd.com>
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

Unwrap a the explicit fence if it is a dma_fence_chain and
sync to the first fence not matching the owner rules.

Signed-off-by: Christian König <christian.koenig@amd.com>
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

