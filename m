Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08697B86E75
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 22:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C58F10E3BC;
	Thu, 18 Sep 2025 20:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dL5GL0et";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E0B10E3BC;
 Thu, 18 Sep 2025 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WL6Kw9YUWCG0W8YCQWVk37aQPOOB+kRzsZn1Ep3RQ9E=; b=dL5GL0etsWf87csUiJUWIysuyb
 8NGFGem8xV12Rc4e5BNHP74oOwMmbfW/kFPjw1xU35v81QjAQZv4FCP4qhq5GWM1UDq5gNvQwD8dd
 bqWJbsl2EHJfxtcc0v2n4dFT4ss+XU0codakbqRYSO64j0Q3s4S6yIkM/tVF5XZMK9ha0S09t6cez
 RtDJYqNxYhlTq1viV5FQ8uyyyW1g+idVZ8mzPGlOIWw/T4sqc2iF4LeNfWvFmqvqB/lsPYD6YVVhI
 ZkpgiCmXCduHtdFGfwEU+IhkJe9wmGqih7CReNYgCxNSXGul1/dza0OdU1cVC0SQKqhResx1r14pU
 EZCxTu8w==;
Received: from 179-125-87-227-dinamico.pombonet.net.br ([179.125.87.227]
 helo=[127.0.0.1]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzLBu-00Dp3q-CC; Thu, 18 Sep 2025 22:25:18 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Thu, 18 Sep 2025 17:09:26 -0300
Subject: [PATCH RFC v2 3/3] drm/amdgpu: allow allocation preferences when
 creating GEM object
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-ttm_pool_no_direct_reclaim-v2-3-135294e1f8a2@igalia.com>
References: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
In-Reply-To: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
To: Christian Koenig <christian.koenig@amd.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2
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

When creating a GEM object on amdgpu, it may be specified that latency
during allocation should be preferred over throughput when processing.

That will reflect into the TTM operation, which will lead to the use of
direct reclaim for higher order pages when throughput is preferred, even if
latency is configured to be preferred in the system.

If latency is preferred, no direct reclaim will be used for higher order
pages, which might lead to more use of lower order pages, which can also
compromised throughput.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
 include/uapi/drm/amdgpu_drm.h              | 9 +++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index d1ccbfcf21fa62a8d4fe1b8f020cf00d34efe1ab..0a0333e7ed1a45de63fedfbc161094f6de7fda00 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -451,7 +451,8 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
 		      AMDGPU_GEM_CREATE_EXPLICIT_SYNC |
 		      AMDGPU_GEM_CREATE_ENCRYPTED |
 		      AMDGPU_GEM_CREATE_GFX12_DCC |
-		      AMDGPU_GEM_CREATE_DISCARDABLE))
+		      AMDGPU_GEM_CREATE_DISCARDABLE |
+		      AMDGPU_GEM_ALLOCATION_MASK))
 		return -EINVAL;
 
 	/* reject invalid gem domains */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 122a882948839464dc197d40ff8e46cf161f7b42..54350460bb41e4bc057eb61d7bb6014457e56c6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -632,7 +632,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 		/* We opt to avoid OOM on system pages allocations */
 		.gfp_retry_mayfail = true,
 		.allow_res_evict = bp->type != ttm_bo_type_kernel,
-		.resv = bp->resv
+		.resv = bp->resv,
+		.alloc_method = AMDGPU_GEM_ALLOCATION(bp->flags)
 	};
 	struct amdgpu_bo *bo;
 	unsigned long page_align, size = bp->size;
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index bdedbaccf776db0c86cec939725a435c37f09f77..b796744abeba2bf4b14556251b36938ba0905c1e 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -180,6 +180,15 @@ extern "C" {
 /* Set PTE.D and recompress during GTT->VRAM moves according to TILING flags. */
 #define AMDGPU_GEM_CREATE_GFX12_DCC		(1 << 16)
 
+/* Prioritize allocation latency or high-order allocations that favor
+ * throughput */
+#define AMDGPU_GEM_OVERRIDE_ALLOCATION_SHIFT	(17)
+#define AMDGPU_GEM_ALLOCATION_DEFAULT		(0 << AMDGPU_GEM_OVERRIDE_ALLOCATION_SHIFT)
+#define AMDGPU_GEM_ALLOCATION_LATENCY		(2 << AMDGPU_GEM_OVERRIDE_ALLOCATION_SHIFT)
+#define AMDGPU_GEM_ALLOCATION_THROUGHPUT	(3 << AMDGPU_GEM_OVERRIDE_ALLOCATION_SHIFT)
+#define AMDGPU_GEM_ALLOCATION_MASK		(3 << AMDGPU_GEM_OVERRIDE_ALLOCATION_SHIFT)
+#define AMDGPU_GEM_ALLOCATION(flags)		((flags & AMDGPU_GEM_ALLOCATION_MASK) >> AMDGPU_GEM_OVERRIDE_ALLOCATION_SHIFT)
+
 struct drm_amdgpu_gem_create_in  {
 	/** the requested memory size */
 	__u64 bo_size;

-- 
2.47.3

