Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE92A443C6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAD710E705;
	Tue, 25 Feb 2025 15:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.b="OsNqx5kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Tue, 25 Feb 2025 15:01:51 UTC
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278B210E705
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uQ7fEo1WTqvoF7NeNLeJd7S/Z2lG2sVkdEB5cFCoV7U=;
 b=OsNqx5kQQsadqUt7m2psOuHTK7AMaUQ2lxSXx93yY09hR8SUHrNuvoJc
 go2n/LQ4jb/5ViQomcSuCnAjHph3B90pzpS7eZ2g8RoI6hZyL0gk7D3vW
 KTpKrtGPy4BQ8ifANyx6T6n/9/GoHMqwfj5eYszQgI/Abb0Fo53RHd8dK k=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; d="scan'208";a="209994303"
Received: from nr-lil-536.grid5000.fr (HELO gros-98.nancy.grid5000.fr)
 ([194.254.60.35]) by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 15:54:39 +0100
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
To: Zack Rusin <zack.rusin@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 dri-devel@lists.freedesktop.org,
 Keisuke Nishimura <keisuke.nishimura@inria.fr>
Subject: [PATCH] drm/vmwgfx: Add error path for xa_store in
 vmw_bo_add_detached_resource
Date: Tue, 25 Feb 2025 15:52:23 +0100
Message-Id: <20250225145223.34773-1-keisuke.nishimura@inria.fr>
X-Mailer: git-send-email 2.34.1
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

The xa_store() may fail due to memory allocation failure because there
is no guarantee that the index is already used. This fix introduces new
paths to handle the error.

This patch also aligns the order of function calls by calling
vmw_bo_add_detached_resource() before ttm_prime_object_init() in order
to allow consistent error handling.

Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 16 ++++++++++++++--
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9b5b8c1f063b..aa13e4061ff1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -848,9 +848,9 @@ void vmw_bo_placement_set_default_accelerated(struct vmw_bo *bo)
 	vmw_bo_placement_set(bo, domain, domain);
 }
 
-void vmw_bo_add_detached_resource(struct vmw_bo *vbo, struct vmw_resource *res)
+int vmw_bo_add_detached_resource(struct vmw_bo *vbo, struct vmw_resource *res)
 {
-	xa_store(&vbo->detached_resources, (unsigned long)res, res, GFP_KERNEL);
+	return xa_err(xa_store(&vbo->detached_resources, (unsigned long)res, res, GFP_KERNEL));
 }
 
 void vmw_bo_del_detached_resource(struct vmw_bo *vbo, struct vmw_resource *res)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 11e330c7c7f5..51790a11fe64 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -141,7 +141,7 @@ void vmw_bo_move_notify(struct ttm_buffer_object *bo,
 			struct ttm_resource *mem);
 void vmw_bo_swap_notify(struct ttm_buffer_object *bo);
 
-void vmw_bo_add_detached_resource(struct vmw_bo *vbo, struct vmw_resource *res);
+int vmw_bo_add_detached_resource(struct vmw_bo *vbo, struct vmw_resource *res);
 void vmw_bo_del_detached_resource(struct vmw_bo *vbo, struct vmw_resource *res);
 struct vmw_surface *vmw_bo_surface(struct vmw_bo *vbo);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5721c74da3e0..1f7626f6ac0b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -871,7 +871,12 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 			vmw_resource_unreference(&res);
 			goto out_unlock;
 		}
-		vmw_bo_add_detached_resource(res->guest_memory_bo, res);
+
+		ret = vmw_bo_add_detached_resource(res->guest_memory_bo, res);
+		if (unlikely(ret != 0)) {
+			vmw_resource_unreference(&res);
+			goto out_unlock;
+		}
 	}
 
 	tmp = vmw_resource_reference(&srf->res);
@@ -1670,6 +1675,14 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 
 	}
 
+	if (res->guest_memory_bo) {
+		ret = vmw_bo_add_detached_resource(res->guest_memory_bo, res);
+		if (unlikely(ret != 0)) {
+			vmw_resource_unreference(&res);
+			goto out_unlock;
+		}
+	}
+
 	tmp = vmw_resource_reference(res);
 	ret = ttm_prime_object_init(tfile, res->guest_memory_size, &user_srf->prime,
 				    VMW_RES_SURFACE,
@@ -1684,7 +1697,6 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 	rep->handle      = user_srf->prime.base.handle;
 	rep->backup_size = res->guest_memory_size;
 	if (res->guest_memory_bo) {
-		vmw_bo_add_detached_resource(res->guest_memory_bo, res);
 		rep->buffer_map_handle =
 			drm_vma_node_offset_addr(&res->guest_memory_bo->tbo.base.vma_node);
 		rep->buffer_size = res->guest_memory_bo->tbo.base.size;
-- 
2.34.1

