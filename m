Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C156B9326AB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C4710E6D2;
	Tue, 16 Jul 2024 12:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6NnVAqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A234A10E6B4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:28 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52ed9b802ceso1845371e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133327; x=1721738127; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pC0+B+n+amDEZ+H7L82C/zzm0o+q9YK7d+/VTkO3gOg=;
 b=b6NnVAqDkI3sZF/uiDiOGzaN+twCn4JL3VP54N5Euehc7wPIgLfB4PIunYfGvEn2Vl
 fEw5ibn+djrZRpVK6asSHrH86FWQgpTGU95wPmgpNb22bowW7erdzR3pLCOSyWRqlFLa
 dGleUtwfwAOpnDztxOLNfQ9vYVTCfC5rV2uyoGkGi/4jJhIWh7ZExdLaA1DRbdF17xHi
 DacM4/1R0l0JdZE2mFKDVwWA8Q30JMUPMznBDQG/OEKWFNUaBbZ0oiJOrzF+lmYqOB42
 sjnqonlvmFNx0wnTVotpNktEOIC6gEusOHGk3u/3pa+DoJNuXgWSxOMJaZ5T5YnX6gzs
 c4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133327; x=1721738127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pC0+B+n+amDEZ+H7L82C/zzm0o+q9YK7d+/VTkO3gOg=;
 b=s3NWiqyt1WQ97vc/etLmNe34a15FqImjsw1gJPuwzLuBhFbr44mmRVPzoBPUoo9cIz
 6KWV9TIRHR2f8nStrP3/SuzBZ+kHMX8k3axOr3xhNQKwxTQHBTP8VX7oXZpVzR0soS2c
 DWVQU9n50kK3av0R7+f/hZGj1jibD5H8TgU1/BL9rgnOPZqgihGfRdxUIN9DSXtijevK
 BNHmcNC0dEdRxqngldmyDEPeE3jsurkrI1uK9tCna1GIiALyaU7pzLIFv720Z0BlnLgx
 Fd7L+NWHc1XsQzXJIp2FqCDc2btREfYG0jDN0CbqLkhfpa7rHFyRuGviiHiF0b4d5CCr
 D9xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx+9PuCxc/8xc4PjxMwuRya4uRTxZFie2BzYxSgVE8FI3BSgKdCak//mrVHMsDoYYpK+zPBjNUdXsMrzHkO4BbyCfq7SqxyjO3ratbIyUn
X-Gm-Message-State: AOJu0YypeLQzv2NeNmJ/ZtTcCEB2iJo/KlRZozBGyYLPvhtUH+RbJPRf
 L75euqhVfqBq6ayRjNWTY+f4d0Wd7ZSMT9G2oVKe/i7YjaQO7CE3
X-Google-Smtp-Source: AGHT+IFmivO7MYvNZrQpDEQE8Nbalj8F0N/JAzkgjLxOFjEH1HhgvajMDvEscKRzftCw0dhGYowhhw==
X-Received: by 2002:a05:6512:1082:b0:52c:a0b8:4dc0 with SMTP id
 2adb3069b0e04-52edf0192bdmr1650216e87.28.1721133325833; 
 Tue, 16 Jul 2024 05:35:25 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/vmwgfx: use GEM references instead of TTMs
Date: Tue, 16 Jul 2024 14:35:15 +0200
Message-Id: <20240716123519.1884-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
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

Instead of a TTM reference grab a GEM reference whenever necessary.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h       | 19 ++-----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c  |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c  |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c      |  6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c  |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 16 ++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c   |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c  |  2 +-
 9 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 00144632c600..3caaacb124ec 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -501,7 +501,7 @@ static int vmw_user_bo_synccpu_release(struct drm_file *filp,
 		if (!(flags & drm_vmw_synccpu_allow_cs)) {
 			atomic_dec(&vmw_bo->cpu_writers);
 		}
-		vmw_user_bo_unref(&vmw_bo);
+		vmw_bo_unreference(&vmw_bo);
 	}
 
 	return ret;
@@ -543,7 +543,7 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
 			return ret;
 
 		ret = vmw_user_bo_synccpu_grab(vbo, arg->flags);
-		vmw_user_bo_unref(&vbo);
+		vmw_bo_unreference(&vbo);
 		if (unlikely(ret != 0)) {
 			if (ret == -ERESTARTSYS || ret == -EBUSY)
 				return -EBUSY;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index f349642e6190..42a58d57409d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -188,30 +188,15 @@ static inline void vmw_bo_unreference(struct vmw_bo **buf)
 
 	*buf = NULL;
 	if (tmp_buf)
-		ttm_bo_put(&tmp_buf->tbo);
+		drm_gem_object_put(&tmp_buf->tbo.base);
 }
 
 static inline struct vmw_bo *vmw_bo_reference(struct vmw_bo *buf)
 {
-	ttm_bo_get(&buf->tbo);
+	drm_gem_object_get(&buf->tbo.base);
 	return buf;
 }
 
-static inline struct vmw_bo *vmw_user_bo_ref(struct vmw_bo *vbo)
-{
-	drm_gem_object_get(&vbo->tbo.base);
-	return vbo;
-}
-
-static inline void vmw_user_bo_unref(struct vmw_bo **buf)
-{
-	struct vmw_bo *tmp_buf = *buf;
-
-	*buf = NULL;
-	if (tmp_buf)
-		drm_gem_object_put(&tmp_buf->tbo.base);
-}
-
 static inline struct vmw_bo *to_vmw_bo(struct drm_gem_object *gobj)
 {
 	return container_of((gobj), struct vmw_bo, tbo.base);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index a7c07692262b..6b700ebd71b1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -502,7 +502,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 
 	vmw_resource_mob_attach(res);
 	/* Let go of the old mob. */
-	vmw_user_bo_unref(&old_buf);
+	vmw_bo_unreference(&old_buf);
 	res->id = vcotbl->type;
 
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
@@ -521,7 +521,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 out_wait:
 	ttm_bo_unpin(bo);
 	ttm_bo_unreserve(bo);
-	vmw_user_bo_unref(&buf);
+	vmw_bo_unreference(&buf);
 
 out_done:
 	MKS_STAT_TIME_POP(MKSSTAT_KERN_COTABLE_RESIZE);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 2e52d73eba48..be29b9ff8901 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1166,7 +1166,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_MOB, VMW_BO_DOMAIN_MOB);
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
 	tmp_bo = vmw_bo;
-	vmw_user_bo_unref(&tmp_bo);
+	vmw_bo_unreference(&tmp_bo);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -1223,7 +1223,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
 			     VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM);
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
 	tmp_bo = vmw_bo;
-	vmw_user_bo_unref(&tmp_bo);
+	vmw_bo_unreference(&tmp_bo);
 	if (unlikely(ret != 0))
 		return ret;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 13b2820cae51..f8158b8d2843 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1476,8 +1476,8 @@ static int vmw_create_bo_proxy(struct drm_device *dev,
 	/* Reserve and switch the backing mob. */
 	mutex_lock(&res->dev_priv->cmdbuf_mutex);
 	(void) vmw_resource_reserve(res, false, true);
-	vmw_user_bo_unref(&res->guest_memory_bo);
-	res->guest_memory_bo = vmw_user_bo_ref(bo_mob);
+	vmw_bo_unreference(&res->guest_memory_bo);
+	res->guest_memory_bo = vmw_bo_reference(bo_mob);
 	res->guest_memory_offset = 0;
 	vmw_resource_unreserve(res, false, false, false, NULL, 0);
 	mutex_unlock(&res->dev_priv->cmdbuf_mutex);
@@ -1670,7 +1670,7 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 err_out:
 	/* vmw_user_lookup_handle takes one ref so does new_fb */
 	if (bo)
-		vmw_user_bo_unref(&bo);
+		vmw_bo_unreference(&bo);
 	if (surface)
 		vmw_surface_unreference(&surface);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index c45b4724e414..c5860f62ec53 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -451,7 +451,7 @@ int vmw_overlay_ioctl(struct drm_device *dev, void *data,
 
 	ret = vmw_overlay_update_stream(dev_priv, buf, arg, true);
 
-	vmw_user_bo_unref(&buf);
+	vmw_bo_unreference(&buf);
 
 out_unlock:
 	mutex_unlock(&overlay->mutex);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 848dba09981b..cb786da99fd3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -141,7 +141,7 @@ static void vmw_resource_release(struct kref *kref)
 		if (res->coherent)
 			vmw_bo_dirty_release(res->guest_memory_bo);
 		ttm_bo_unreserve(bo);
-		vmw_user_bo_unref(&res->guest_memory_bo);
+		vmw_bo_unreference(&res->guest_memory_bo);
 	}
 
 	if (likely(res->hw_destroy != NULL)) {
@@ -457,11 +457,11 @@ void vmw_resource_unreserve(struct vmw_resource *res,
 			vmw_resource_mob_detach(res);
 			if (res->coherent)
 				vmw_bo_dirty_release(res->guest_memory_bo);
-			vmw_user_bo_unref(&res->guest_memory_bo);
+			vmw_bo_unreference(&res->guest_memory_bo);
 		}
 
 		if (new_guest_memory_bo) {
-			res->guest_memory_bo = vmw_user_bo_ref(new_guest_memory_bo);
+			res->guest_memory_bo = vmw_bo_reference(new_guest_memory_bo);
 
 			/*
 			 * The validation code should already have added a
@@ -522,7 +522,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 	}
 
 	INIT_LIST_HEAD(&val_list);
-	ttm_bo_get(&res->guest_memory_bo->tbo);
+	drm_gem_object_get(&res->guest_memory_bo->tbo.base);
 	val_buf->bo = &res->guest_memory_bo->tbo;
 	val_buf->num_shared = 0;
 	list_add_tail(&val_buf->head, &val_list);
@@ -548,10 +548,10 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 out_no_validate:
 	ttm_eu_backoff_reservation(ticket, &val_list);
 out_no_reserve:
-	ttm_bo_put(val_buf->bo);
+	drm_gem_object_put(&val_buf->bo->base);
 	val_buf->bo = NULL;
 	if (guest_memory_dirty)
-		vmw_user_bo_unref(&res->guest_memory_bo);
+		vmw_bo_unreference(&res->guest_memory_bo);
 
 	return ret;
 }
@@ -610,7 +610,7 @@ vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
 	INIT_LIST_HEAD(&val_list);
 	list_add_tail(&val_buf->head, &val_list);
 	ttm_eu_backoff_reservation(ticket, &val_list);
-	ttm_bo_put(val_buf->bo);
+	drm_gem_object_put(&val_buf->bo->base);
 	val_buf->bo = NULL;
 }
 
@@ -727,7 +727,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
 		goto out_no_validate;
 	else if (!res->func->needs_guest_memory && res->guest_memory_bo) {
 		WARN_ON_ONCE(vmw_resource_mob_attached(res));
-		vmw_user_bo_unref(&res->guest_memory_bo);
+		vmw_bo_unreference(&res->guest_memory_bo);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index a01ca3226d0a..6b8e984695ed 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -180,7 +180,7 @@ static int vmw_gb_shader_init(struct vmw_private *dev_priv,
 
 	res->guest_memory_size = size;
 	if (byte_code) {
-		res->guest_memory_bo = vmw_user_bo_ref(byte_code);
+		res->guest_memory_bo = vmw_bo_reference(byte_code);
 		res->guest_memory_offset = offset;
 	}
 	shader->size = size;
@@ -809,7 +809,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
 				    shader_type, num_input_sig,
 				    num_output_sig, tfile, shader_handle);
 out_bad_arg:
-	vmw_user_bo_unref(&buffer);
+	vmw_bo_unreference(&buffer);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index e7a744dfcecf..c275bb074a60 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1505,7 +1505,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 		if (ret == 0) {
 			if (res->guest_memory_bo->tbo.base.size < res->guest_memory_size) {
 				VMW_DEBUG_USER("Surface backup buffer too small.\n");
-				vmw_user_bo_unref(&res->guest_memory_bo);
+				vmw_bo_unreference(&res->guest_memory_bo);
 				ret = -EINVAL;
 				goto out_unlock;
 			} else {
-- 
2.34.1

