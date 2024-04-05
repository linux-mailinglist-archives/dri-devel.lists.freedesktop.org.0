Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B289A595
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 22:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B22210EF71;
	Fri,  5 Apr 2024 20:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Y3tsFkUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DFB1129F4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 20:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FYrZXpjl4jDc4vWpPHPQPeSJ4O/f7bOSiH1A955RYsA=; b=Y3tsFkUVI+dmo4gJB4ZbXwEc4o
 jzYREJ43HK0taAftqLfFg4Vk2FdOrEv042ROsrqner7jmCTsC/1UFFTzABtRmRL6ZMO1Eg0GfWZLT
 FUoQXOct3IwWtpVAZGdKTO9b4ttCshWljt4xa2RQHJWoe0oWmcE2ZcBvxxICUXrOzT/NFCJCLaQPA
 KHE+JI0Ro5SjMmEtkBeIooPxy4QLLPh8GTWZUl0a9YbOOOV3mAynScobmAJV4KFP8xZMtMf42VLOq
 i7t7G/BsWjirL5WMNw0nqsJRhuNsysvUE3hXn90ojunIwIPPhxFI9yl46v+VJXC1/INxn1d2QYyx8
 yrnpYoqg==;
Received: from [177.34.169.255] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rsq1O-001kwR-Ud; Fri, 05 Apr 2024 22:18:47 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 5/6] drm/v3d: Reduce the alignment of the node allocation
Date: Fri,  5 Apr 2024 15:29:08 -0300
Message-ID: <20240405201753.1176914-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405201753.1176914-1-mcanal@igalia.com>
References: <20240405201753.1176914-1-mcanal@igalia.com>
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

Currently, we are using an alignment of 128 kB to insert a node, which
ends up wasting memory as we perform plenty of small BOs allocations
(<= 4 kB). We require that allocations are aligned to 128Kb so for any
allocation smaller than that, we are wasting the difference.

This implies that we cannot effectively use the whole 4 GB address space
available for the GPU in the RPi 4. Currently, we can allocate up to
32000 BOs of 4 kB (~140 MB) and 3000 BOs of 400 kB (~1,3 GB). This can be
quite limiting for applications that have a high memory requirement, such
as vkoverhead [1].

By reducing the page alignment to 4 kB, we can allocate up to 1000000 BOs
of 4 kB (~4 GB) and 10000 BOs of 400 kB (~4 GB). Moreover, by performing
benchmarks, we were able to attest that reducing the page alignment to
4 kB can provide a general performance improvement in OpenGL
applications (e.g. glmark2).

Therefore, this patch reduces the alignment of the node allocation to 4
kB, which will allow RPi users to explore the whole 4GB virtual
address space provided by the hardware. Also, this patch allow users to
fully run vkoverhead in the RPi 4/5, solving the issue reported in [1].

[1] https://github.com/zmike/vkoverhead/issues/14

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c  | 2 +-
 drivers/gpu/drm/v3d/v3d_drv.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index a07ede668cc1..79e31c5299b1 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -110,7 +110,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	 */
 	ret = drm_mm_insert_node_generic(&v3d->mm, &bo->node,
 					 obj->size >> V3D_MMU_PAGE_SHIFT,
-					 GMP_GRANULARITY >> V3D_MMU_PAGE_SHIFT, 0, 0);
+					 SZ_4K >> V3D_MMU_PAGE_SHIFT, 0, 0);
 	spin_unlock(&v3d->mm_lock);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index d2ce8222771a..17236ee23490 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -17,8 +17,6 @@ struct clk;
 struct platform_device;
 struct reset_control;
 
-#define GMP_GRANULARITY (128 * 1024)
-
 #define V3D_MMU_PAGE_SHIFT 12
 
 #define V3D_MAX_QUEUES (V3D_CPU + 1)
-- 
2.44.0

