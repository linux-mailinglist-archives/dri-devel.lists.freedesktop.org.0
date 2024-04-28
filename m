Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B8D8B4BD1
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 14:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FEC10FDF1;
	Sun, 28 Apr 2024 12:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aJVWrb2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F58E10FDF1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ffe9sySfd79ctQGHNtaWqDiQ/IZG8JT0mqgQShO/gzo=; b=aJVWrb2ygNBUFCZmN8kncPnqyJ
 YsIiSgt/ZlMPddWoJOeVow3UhjeouR8Y1xzGT/9+nyU1gF2u5Z7+brWMZUqL4Iyxca/puICcjikKm
 lO0+hqs4fJrf0e+k7tZ3/Nej/vwbP3if5AP1yFeOqtQA7cEBwG0mT/GDwllpjDO9A7HKodx63WtIn
 4cUgFsIj8JcBjmyKJC6IUOlDJplqipuulxCFXaIF+NifGCCmxvn9gO3nq3ql2ThON2jfEG+2iQxr9
 jU4l+N+w2yCRbLRiGh1IbnWkjnJEiq5bAoPYsQItBbxF8L+e4vhgi1590K96dfrS3U+wKqjPV6Fa7
 tjs3v1bA==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s13u2-000rbP-FG; Sun, 28 Apr 2024 14:45:10 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 5/8] drm/v3d: Reduce the alignment of the node allocation
Date: Sun, 28 Apr 2024 09:40:10 -0300
Message-ID: <20240428124426.309096-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240428124426.309096-1-mcanal@igalia.com>
References: <20240428124426.309096-1-mcanal@igalia.com>
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
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
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
index cef2f82b7a75..e1f291db68de 100644
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

