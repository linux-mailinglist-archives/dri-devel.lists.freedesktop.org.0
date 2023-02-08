Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED568F9EE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 22:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6D410E87C;
	Wed,  8 Feb 2023 21:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B8F10E87C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 21:53:45 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id F0FE8320ACF;
 Wed,  8 Feb 2023 21:53:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1675893223; bh=70diEbLFOndJMAMdzahuRcmEjtNEzQSPzOJpjHTEx80=;
 h=From:To:Cc:Subject:Date:From;
 b=NoGvMDu52Zty7Vhz1QZMt/EGZr2d1nVjy1dA+BcKw7gSYufwfeyll4taH4MryEF1t
 f173/jeCu50f0qHy3vZhouyHxVuc8iDjGdhBju8vBHqZMO6YDuVg3+RtjdHblZ29sS
 dQhSGPu5hHsN9BSFY0301UdoEJ2dhbd5VcZkF38r9EUB/HXDlul8c0Rb/CVqclo3ym
 TOJO5WcDyLjbLTcVRh+MO2m1CCsUxDghQntyolX0NXWB+1Tj9hDNh5GnaY1pOO5BUc
 M08m2KIldmxQtvopOy6QfZKJZPagSqeYbkmlVg04j20XioNqUa041Ja6r9AqnYZ8A6
 zO9s6mdKYdrbw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Do not drop the reference to the handle too soon
Date: Wed,  8 Feb 2023 16:53:40 -0500
Message-Id: <20230208215340.2103955-1-zack@kde.org>
X-Mailer: git-send-email 2.38.1
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, stable@vger.kernel.org, banackm@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

It is possible for userspace to predict the next buffer handle and
to destroy the buffer while it's still used by the kernel. Delay
dropping the internal reference on the buffers until kernel is done
with them.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
Cc: <stable@vger.kernel.org> # v5.17+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 1 -
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 43ffa5c7acbd..65bd88c8fef9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -708,7 +708,8 @@ int vmw_dumb_create(struct drm_file *file_priv,
 	ret = vmw_gem_object_create_with_handle(dev_priv, file_priv,
 						args->size, &args->handle,
 						&vbo);
-
+	/* drop reference from allocate - handle holds it now */
+	drm_gem_object_put(&vbo->tbo.base);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index 51bd1f8c5cc4..d6baf73a6458 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -133,8 +133,6 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
 	(*p_vbo)->tbo.base.funcs = &vmw_gem_object_funcs;
 
 	ret = drm_gem_handle_create(filp, &(*p_vbo)->tbo.base, handle);
-	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_put(&(*p_vbo)->tbo.base);
 out_no_bo:
 	return ret;
 }
@@ -161,6 +159,8 @@ int vmw_gem_object_create_ioctl(struct drm_device *dev, void *data,
 	rep->map_handle = drm_vma_node_offset_addr(&vbo->tbo.base.vma_node);
 	rep->cur_gmr_id = handle;
 	rep->cur_gmr_offset = 0;
+	/* drop reference from allocate - handle holds it now */
+	drm_gem_object_put(&vbo->tbo.base);
 out_no_bo:
 	return ret;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 9d4ae9623a00..d18fec953fa7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -867,7 +867,6 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 			goto out_unlock;
 		}
 		vmw_bo_reference(res->guest_memory_bo);
-		drm_gem_object_get(&res->guest_memory_bo->tbo.base);
 	}
 
 	tmp = vmw_resource_reference(&srf->res);
-- 
2.38.1

