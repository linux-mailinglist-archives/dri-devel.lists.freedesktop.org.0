Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346EAB42537
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A4110E924;
	Wed,  3 Sep 2025 15:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cJwPhsom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD69110E906;
 Wed,  3 Sep 2025 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SXLSUwiUIlTabbsTrZ9U6DGRyZaelV9fPFIu4EG0wU4=; b=cJwPhsomcCYPOHCHv53e17P2ll
 kOcs4nJ5mX1a4vah7q3D94k722d9C/yJBpLWbEEHtv4B7TTBnQ5zhSnCOo5gxMbG4OJKTuAOXSPQ1
 9kDMDmLdOz/1aiofdQBkV3iROtVZCZ4O0Qj4mLwbg2ZPnYLszQmpzonxWS9Wrd61xSE8cDmSvGeTz
 vIypWpF69slqs0F60gNjHD7oQMJPBKpDDi+JidFdE4Aafmkl/tH8EVEEaqYXxFS8+KEgzjwmh0xlx
 TfNlJqCmYEUlxScUh0SrjdW3bY5pa6o7wBFOE8ZFXw9j+tqwz3T4E6CvvXVO2go7Dybhcp7zX1BiT
 Ba5on8yQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utpKr-006GbX-1w; Wed, 03 Sep 2025 17:23:45 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 19/21] drm/amdgpu: Register with the DRM scheduling cgroup
 controller
Date: Wed,  3 Sep 2025 16:23:25 +0100
Message-ID: <20250903152327.66002-20-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
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

Connect the driver to the DRM scheduling cgroup controller by using the
appropriate DRM scheduler helpers.

First part is tracking the scheduling entities belonging to clients and
second is to register the weight change notification helper in the driver
specific struct drm_cgroup_ops.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 13 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  9 +++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index f5d5c45ddc0d..160dddbe892d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -22,6 +22,7 @@
  * Authors: monk liu <monk.liu@amd.com>
  */
 
+#include <linux/cgroup_drm.h>
 #include <drm/drm_auth.h>
 #include <drm/drm_drv.h>
 #include "amdgpu.h"
@@ -258,6 +259,8 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
 	if (cmpxchg(&ctx->entities[hw_ip][ring], NULL, entity))
 		goto cleanup_entity;
 
+	drm_sched_cgroup_track_sched_entity(ctx->filp, &entity->entity);
+
 	return 0;
 
 cleanup_entity:
@@ -331,6 +334,7 @@ static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t priority,
 	memset(ctx, 0, sizeof(*ctx));
 
 	kref_init(&ctx->refcount);
+	ctx->filp = filp;
 	ctx->mgr = mgr;
 	spin_lock_init(&ctx->ring_lock);
 
@@ -511,10 +515,15 @@ static void amdgpu_ctx_do_release(struct kref *ref)
 	ctx = container_of(ref, struct amdgpu_ctx, refcount);
 	for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
 		for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
+			struct drm_sched_entity *entity;
+
 			if (!ctx->entities[i][j])
 				continue;
 
-			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
+			entity = &ctx->entities[i][j]->entity;
+			drm_sched_cgroup_untrack_sched_entity(ctx->filp,
+							      entity);
+			drm_sched_entity_destroy(entity);
 		}
 	}
 
@@ -941,6 +950,8 @@ static void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr)
 					continue;
 
 				entity = &ctx->entities[i][j]->entity;
+				drm_sched_cgroup_untrack_sched_entity(ctx->filp,
+								      entity);
 				drm_sched_entity_fini(entity);
 			}
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 090dfe86f75b..e6541e56da16 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -44,6 +44,7 @@ struct amdgpu_ctx_entity {
 
 struct amdgpu_ctx {
 	struct kref			refcount;
+	struct drm_file			*filp;
 	struct amdgpu_ctx_mgr		*mgr;
 	unsigned			reset_counter;
 	unsigned			reset_counter_query;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 17f754d1135d..a9c38054c0d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3053,6 +3053,12 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
 	DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
 };
 
+#ifdef CONFIG_CGROUP_DRM
+static const struct drm_cgroup_ops amdgpu_drm_cgroup_ops = {
+	.notify_weight = drm_sched_cgroup_notify_weight,
+};
+#endif
+
 static const struct drm_driver amdgpu_kms_driver = {
 	.driver_features =
 	    DRIVER_ATOMIC |
@@ -3071,6 +3077,9 @@ static const struct drm_driver amdgpu_kms_driver = {
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = amdgpu_show_fdinfo,
 #endif
+#ifdef CONFIG_CGROUP_DRM
+	.cg_ops = &amdgpu_drm_cgroup_ops,
+#endif
 
 	.gem_prime_import = amdgpu_gem_prime_import,
 
-- 
2.48.0

