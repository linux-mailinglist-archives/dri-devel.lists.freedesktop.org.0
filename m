Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07FF836CF7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 18:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C99910E68E;
	Mon, 22 Jan 2024 17:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064A810E68E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705944089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gn7RaAcMpuDPOvn0RY/QMKtweG/D6by0C9DAzOIOd7A=;
 b=NzVLnq5EnwxBR3JBUW1Z6mGK3cIFr9raH4w/lo9I2G1oCVqwomWWD2AnrT92sd/N54S6vB
 GD6Ge7zV9lLDFOqXTms0GE9r7CkyS0xpujwMwJ05+9IfJbgvCnHJISYp27X73vA7dACLvR
 MAsLfApulHypLPcMA/d12T6UQkDK1Fo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-SuUm2ZWLN-KmpMpaHOT9zg-1; Mon, 22 Jan 2024 12:21:28 -0500
X-MC-Unique: SuUm2ZWLN-KmpMpaHOT9zg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4BF38350E5;
 Mon, 22 Jan 2024 17:21:27 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883A5400D7AB;
 Mon, 22 Jan 2024 17:21:26 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: zack.rusin@broadcom.com, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/vmwgfx: Fix possible invalid drm gem put calls
Date: Mon, 22 Jan 2024 18:10:12 +0100
Message-ID: <20240122172031.243604-2-jfalempe@redhat.com>
In-Reply-To: <20240122172031.243604-1-jfalempe@redhat.com>
References: <20240122172031.243604-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, Zack Rusin <zackr@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

commit f9e96bf1905479f18e83a3a4c314a8dfa56ede2c upstream

vmw_bo_unreference sets the input buffer to null on exit, resulting in
null ptr deref's on the subsequent drm gem put calls.

This went unnoticed because only very old userspace would be exercising
those paths but it wouldn't be hard to hit on old distros with brand
new kernels.

Introduce a new function that abstracts unrefing of user bo's to make
the code cleaner and more explicit.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reported-by: Ian Forbes <iforbes@vmware.com>
Fixes: 9ef8d83e8e25 ("drm/vmwgfx: Do not drop the reference to the handle too soon")
Cc: <stable@vger.kernel.org> # v6.4+
Reviewed-by: Maaz Mombasawala<mombasawalam@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230818041301.407636-1-zack@kde.org
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 6 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     | 8 ++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 6 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 6 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c  | 3 +--
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index ae01d22b8f84..5ac5efea1d60 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -595,10 +595,9 @@ static int vmw_user_bo_synccpu_release(struct drm_file *filp,
 		if (!(flags & drm_vmw_synccpu_allow_cs)) {
 			atomic_dec(&vmw_bo->cpu_writers);
 		}
-		ttm_bo_put(&vmw_bo->base);
+		vmw_user_bo_unref(vmw_bo);
 	}
 
-	drm_gem_object_put(&vmw_bo->base.base);
 	return ret;
 }
 
@@ -638,8 +637,7 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
 			return ret;
 
 		ret = vmw_user_bo_synccpu_grab(vbo, arg->flags);
-		vmw_bo_unreference(&vbo);
-		drm_gem_object_put(&vbo->base.base);
+		vmw_user_bo_unref(vbo);
 		if (unlikely(ret != 0)) {
 			if (ret == -ERESTARTSYS || ret == -EBUSY)
 				return -EBUSY;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 8459fab9d979..5be15732fbc5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1600,6 +1600,14 @@ vmw_bo_reference(struct vmw_buffer_object *buf)
 	return buf;
 }
 
+static inline void vmw_user_bo_unref(struct vmw_buffer_object *vbo)
+{
+	if (vbo) {
+		ttm_bo_put(&vbo->base);
+		drm_gem_object_put(&vbo->base.base);
+	}
+}
+
 static inline void vmw_fifo_resource_inc(struct vmw_private *dev_priv)
 {
 	atomic_inc(&dev_priv->num_fifo_resources);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 7e59469e1cb9..5a8b187619d3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1159,8 +1159,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 		return PTR_ERR(vmw_bo);
 	}
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo, true, false);
-	ttm_bo_put(&vmw_bo->base);
-	drm_gem_object_put(&vmw_bo->base.base);
+	vmw_user_bo_unref(vmw_bo);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -1214,8 +1213,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
 		return PTR_ERR(vmw_bo);
 	}
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo, false, false);
-	ttm_bo_put(&vmw_bo->base);
-	drm_gem_object_put(&vmw_bo->base.base);
+	vmw_user_bo_unref(vmw_bo);
 	if (unlikely(ret != 0))
 		return ret;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index aab6389cb4aa..e4b2d11f2c8b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1599,10 +1599,8 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 
 err_out:
 	/* vmw_user_lookup_handle takes one ref so does new_fb */
-	if (bo) {
-		vmw_bo_unreference(&bo);
-		drm_gem_object_put(&bo->base.base);
-	}
+	if (bo)
+		vmw_user_bo_unref(bo);
 	if (surface)
 		vmw_surface_unreference(&surface);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index b5b311f2a91a..327330055ae5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -457,8 +457,7 @@ int vmw_overlay_ioctl(struct drm_device *dev, void *data,
 
 	ret = vmw_overlay_update_stream(dev_priv, buf, arg, true);
 
-	vmw_bo_unreference(&buf);
-	drm_gem_object_put(&buf->base.base);
+	vmw_user_bo_unref(buf);
 
 out_unlock:
 	mutex_unlock(&overlay->mutex);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index 51e83dfa1cac..6fd4264d6b41 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -806,8 +806,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
 				    shader_type, num_input_sig,
 				    num_output_sig, tfile, shader_handle);
 out_bad_arg:
-	vmw_bo_unreference(&buffer);
-	drm_gem_object_put(&buffer->base.base);
+	vmw_user_bo_unref(buffer);
 	return ret;
 }
 
-- 
2.43.0

