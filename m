Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ADC9C8E13
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C6B10E815;
	Thu, 14 Nov 2024 15:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mg92O/vy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653D410E811;
 Thu, 14 Nov 2024 15:30:30 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso124339966b.0; 
 Thu, 14 Nov 2024 07:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731598229; x=1732203029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xPm55Pwtu4kgmX9u5F7awU8bGFwJkGhVqwW5/U+ueg0=;
 b=mg92O/vyWO8hEwHzrXxDc+z/RmTrTBLZmP0F1FKPHKnK7vpXvern5N/hpFChAUBt17
 I6jNhWFVGZcEAJUk1QjGxPwy5tK2eiuv0mFCb3XLtXGZynRmT5ccLSr2wOrEnk9lgQLQ
 mXFPOdhYSt+L5wNPTtdCO2K10uuOii8Ayc6bK73ETdwUxqpefH1/BnFtsoZInDolvuC0
 Vd1ylkPkLhfQ5dWO3WidTWGPFFBM0rT7VVLliCvLuwYMWf0pvb46Gy/HjPaMmxxrV0lw
 jqI/Z609hweNY3lui8MqTVnXqw7gX6Q1ZZ3O7fF+Y6ai3k8EbHaiZBtEUiXcrAZm8uYb
 Ua8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731598229; x=1732203029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xPm55Pwtu4kgmX9u5F7awU8bGFwJkGhVqwW5/U+ueg0=;
 b=i1lsuPMBQHQl9lL+/N/8mgIcNYfeOMv+NFLZr8DhapWwdvwBzQgy2dyECCCEP+Mm2H
 l1E6lZ6N70zCyeDSN52DJJrViQgrHh+d2X5mbqzooYRpL4DYz94+MUtdpuSNCsZKaq43
 zyfpYW9jJQkSbmNKL4/v4uPkOAXQkXcKlGo4r96275xmwgzErHM9cxNAfrZOTLhhvK6I
 Q/aUJcDXQ69rBF02wP1ZNgqSlTB767dvS09GppvTkkrlFjTCCWo9NG7UmGMcMz1t1E/9
 yOdSiZTk+bS3Kwt2y+G6SSN9psmx9/swiNCNeprpcIZo6SI6V8Lje69cWO2F5SgXUXnd
 PZRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjkhgwAJ1yKMj4drAI7SkTwmJxfJXc8izWXKk0wkFM0WuxS9v+A+mo925cXujelzsvZyTjK0n0fac=@lists.freedesktop.org,
 AJvYcCWTDuULfP99CVr9NHKKyxZmAtTHK6pnGJXrG+h/0Vdx7hiovFTcKJOSJ2rZEQlMDJaB2JzE79QnpBbJ@lists.freedesktop.org,
 AJvYcCXzgnLYML3JuIeuRdj74CXYHoAo5R75vwpdbFNlPoH1dUMWz9o1oqT7dcGpH/KewfX9FdmLK/0S@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAVcOpW5y67uAzfnVvoRTFsKSkI3gDEilptBNV5PS+1qC2t7NH
 R4P3UqOXzpFpUkBES0IfbIy+/fzdWpIxlan+6AXvZKLJIOax7qVm
X-Google-Smtp-Source: AGHT+IHez/r+pxObixtYZyLuh+6hvpx1jN0SLlNc2B+bwVGL+guo/uQ9btCQ0hVVFC0EvW3aSuEo8g==
X-Received: by 2002:a17:906:b44:b0:aa1:dd58:aebc with SMTP id
 a640c23a62f3a-aa1dd58b0cfmr811146366b.39.1731598228398; 
 Thu, 14 Nov 2024 07:30:28 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15c9:2500:bb23:40f5:fe29:201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046919sm74063266b.156.2024.11.14.07.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 07:30:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: kraxel@redhat.com, airlied@redhat.com, alexander.deucher@amd.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 5/7] drm/vmwgfx: replace ttm_validate_buffer with separate
 struct
Date: Thu, 14 Nov 2024 16:30:18 +0100
Message-Id: <20241114153020.6209-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114153020.6209-1-christian.koenig@amd.com>
References: <20241114153020.6209-1-christian.koenig@amd.com>
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

Finish remove the ttm_eu depoendency.

No functional difference.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c       | 16 ++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       | 12 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      | 14 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        | 16 ++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c  |  8 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       | 24 +++++++++----------
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |  5 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h    | 10 ++++++++
 10 files changed, 57 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
index ecc503e42790..c496413e7c86 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
@@ -48,17 +48,17 @@ vmw_user_context_base_to_res(struct ttm_base_object *base);
 
 static int vmw_gb_context_create(struct vmw_resource *res);
 static int vmw_gb_context_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf);
+			       struct vmw_validate_buffer *val_buf);
 static int vmw_gb_context_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf);
+				 struct vmw_validate_buffer *val_buf);
 static int vmw_gb_context_destroy(struct vmw_resource *res);
 static int vmw_dx_context_create(struct vmw_resource *res);
 static int vmw_dx_context_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf);
+			       struct vmw_validate_buffer *val_buf);
 static int vmw_dx_context_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf);
+				 struct vmw_validate_buffer *val_buf);
 static int vmw_dx_context_destroy(struct vmw_resource *res);
 
 static const struct vmw_user_resource_conv user_context_conv = {
@@ -339,7 +339,7 @@ static int vmw_gb_context_create(struct vmw_resource *res)
 }
 
 static int vmw_gb_context_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf)
+			       struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct {
@@ -367,7 +367,7 @@ static int vmw_gb_context_bind(struct vmw_resource *res,
 
 static int vmw_gb_context_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf)
+				 struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct ttm_buffer_object *bo = val_buf->bo;
@@ -506,7 +506,7 @@ static int vmw_dx_context_create(struct vmw_resource *res)
 }
 
 static int vmw_dx_context_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf)
+			       struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct {
@@ -576,7 +576,7 @@ void vmw_dx_context_scrub_cotables(struct vmw_resource *ctx,
 
 static int vmw_dx_context_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf)
+				 struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct ttm_buffer_object *bo = val_buf->bo;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index a7c07692262b..2714238e21da 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -122,10 +122,10 @@ const SVGACOTableType vmw_cotable_scrub_order[] = {
 };
 
 static int vmw_cotable_bind(struct vmw_resource *res,
-			    struct ttm_validate_buffer *val_buf);
+			    struct vmw_validate_buffer *val_buf);
 static int vmw_cotable_unbind(struct vmw_resource *res,
 			      bool readback,
-			      struct ttm_validate_buffer *val_buf);
+			      struct vmw_validate_buffer *val_buf);
 static int vmw_cotable_create(struct vmw_resource *res);
 static int vmw_cotable_destroy(struct vmw_resource *res);
 
@@ -214,14 +214,14 @@ static int vmw_cotable_unscrub(struct vmw_resource *res)
  * vmw_cotable_bind - Undo a cotable unscrub operation
  *
  * @res: Pointer to the cotable resource
- * @val_buf: Pointer to a struct ttm_validate_buffer prepared by the caller
+ * @val_buf: Pointer to a struct vmw_validate_buffer prepared by the caller
  * for convenience / fencing.
  *
  * This function issues commands to (re)bind the cotable to
  * its backing mob, which needs to be validated and reserved at this point.
  */
 static int vmw_cotable_bind(struct vmw_resource *res,
-			    struct ttm_validate_buffer *val_buf)
+			    struct vmw_validate_buffer *val_buf)
 {
 	/*
 	 * The create() callback may have changed @res->backup without
@@ -313,14 +313,14 @@ int vmw_cotable_scrub(struct vmw_resource *res, bool readback)
  *
  * @res: Pointer to the cotable resource.
  * @readback: Whether to read back cotable data to the backup buffer.
- * @val_buf: Pointer to a struct ttm_validate_buffer prepared by the caller
+ * @val_buf: Pointer to a struct vmw_validate_buffer prepared by the caller
  * for convenience / fencing.
  *
  * Unbinds the cotable from the device and fences the backup buffer.
  */
 static int vmw_cotable_unbind(struct vmw_resource *res,
 			      bool readback,
-			      struct ttm_validate_buffer *val_buf)
+			      struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_cotable *vcotbl = vmw_cotable(res);
 	struct vmw_private *dev_priv = res->dev_priv;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index b21831ef214a..0542e24a80e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -38,7 +38,6 @@
 #include <drm/drm_file.h>
 #include <drm/drm_rect.h>
 
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_bo.h>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 793293b59d43..495f776491d3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -130,10 +130,9 @@ static void vmw_resource_release(struct kref *kref)
 		BUG_ON(ret);
 		if (vmw_resource_mob_attached(res) &&
 		    res->func->unbind != NULL) {
-			struct ttm_validate_buffer val_buf;
+			struct vmw_validate_buffer val_buf;
 
 			val_buf.bo = bo;
-			val_buf.num_shared = 0;
 			res->func->unbind(res, false, &val_buf);
 		}
 		res->guest_memory_size = false;
@@ -370,7 +369,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource *res,
  * should be retried once resources have been freed up.
  */
 static int vmw_resource_do_validate(struct vmw_resource *res,
-				    struct ttm_validate_buffer *val_buf,
+				    struct vmw_validate_buffer *val_buf,
 				    bool dirtying)
 {
 	int ret = 0;
@@ -614,14 +613,13 @@ int vmw_resource_reserve(struct vmw_resource *res, bool interruptible,
 static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
 				 struct vmw_resource *res, bool interruptible)
 {
-	struct ttm_validate_buffer val_buf;
+	struct vmw_validate_buffer val_buf;
 	const struct vmw_res_func *func = res->func;
 	int ret;
 
 	BUG_ON(!func->may_evict);
 
 	val_buf.bo = NULL;
-	val_buf.num_shared = 0;
 	ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf.bo);
 	if (unlikely(ret != 0))
 		return ret;
@@ -668,14 +666,13 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
 	struct vmw_resource *evict_res;
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct list_head *lru_list = &dev_priv->res_lru[res->func->res_type];
-	struct ttm_validate_buffer val_buf;
+	struct vmw_validate_buffer val_buf;
 	unsigned err_count = 0;
 
 	if (!res->func->create)
 		return 0;
 
 	val_buf.bo = NULL;
-	val_buf.num_shared = 0;
 	if (res->guest_memory_bo)
 		val_buf.bo = &res->guest_memory_bo->tbo;
 	do {
@@ -742,9 +739,8 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
  */
 void vmw_resource_unbind_list(struct vmw_bo *vbo)
 {
-	struct ttm_validate_buffer val_buf = {
+	struct vmw_validate_buffer val_buf = {
 		.bo = &vbo->tbo,
-		.num_shared = 0
 	};
 
 	dma_resv_assert_held(vbo->tbo.base.resv);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h
index aa7cbd396bea..ac2ea9d688c1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource_priv.h
@@ -93,10 +93,10 @@ struct vmw_res_func {
 	int (*create) (struct vmw_resource *res);
 	int (*destroy) (struct vmw_resource *res);
 	int (*bind) (struct vmw_resource *res,
-		     struct ttm_validate_buffer *val_buf);
+		     struct vmw_validate_buffer *val_buf);
 	int (*unbind) (struct vmw_resource *res,
 		       bool readback,
-		       struct ttm_validate_buffer *val_buf);
+		       struct vmw_validate_buffer *val_buf);
 	void (*commit_notify)(struct vmw_resource *res,
 			      enum vmw_cmdbuf_res_state state);
 	int (*dirty_alloc)(struct vmw_resource *res);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index a01ca3226d0a..b1eea51b2aba 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -60,18 +60,18 @@ vmw_user_shader_base_to_res(struct ttm_base_object *base);
 
 static int vmw_gb_shader_create(struct vmw_resource *res);
 static int vmw_gb_shader_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf);
+			       struct vmw_validate_buffer *val_buf);
 static int vmw_gb_shader_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf);
+				 struct vmw_validate_buffer *val_buf);
 static int vmw_gb_shader_destroy(struct vmw_resource *res);
 
 static int vmw_dx_shader_create(struct vmw_resource *res);
 static int vmw_dx_shader_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf);
+			       struct vmw_validate_buffer *val_buf);
 static int vmw_dx_shader_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf);
+				 struct vmw_validate_buffer *val_buf);
 static void vmw_dx_shader_commit_notify(struct vmw_resource *res,
 					enum vmw_cmdbuf_res_state state);
 static bool vmw_shader_id_ok(u32 user_key, SVGA3dShaderType shader_type);
@@ -243,7 +243,7 @@ static int vmw_gb_shader_create(struct vmw_resource *res)
 }
 
 static int vmw_gb_shader_bind(struct vmw_resource *res,
-			      struct ttm_validate_buffer *val_buf)
+			      struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct {
@@ -271,7 +271,7 @@ static int vmw_gb_shader_bind(struct vmw_resource *res,
 
 static int vmw_gb_shader_unbind(struct vmw_resource *res,
 				bool readback,
-				struct ttm_validate_buffer *val_buf)
+				struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct {
@@ -443,7 +443,7 @@ static int vmw_dx_shader_create(struct vmw_resource *res)
  *
  */
 static int vmw_dx_shader_bind(struct vmw_resource *res,
-			      struct ttm_validate_buffer *val_buf)
+			      struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct ttm_buffer_object *bo = val_buf->bo;
@@ -505,7 +505,7 @@ static int vmw_dx_shader_scrub(struct vmw_resource *res)
  */
 static int vmw_dx_shader_unbind(struct vmw_resource *res,
 				bool readback,
-				struct ttm_validate_buffer *val_buf)
+				struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct vmw_fence_obj *fence;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c b/drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c
index edcc40659038..4d6dcf585f58 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c
@@ -55,9 +55,9 @@ struct vmw_dx_streamoutput {
 
 static int vmw_dx_streamoutput_create(struct vmw_resource *res);
 static int vmw_dx_streamoutput_bind(struct vmw_resource *res,
-				    struct ttm_validate_buffer *val_buf);
+				    struct vmw_validate_buffer *val_buf);
 static int vmw_dx_streamoutput_unbind(struct vmw_resource *res, bool readback,
-				      struct ttm_validate_buffer *val_buf);
+				      struct vmw_validate_buffer *val_buf);
 static void vmw_dx_streamoutput_commit_notify(struct vmw_resource *res,
 					      enum vmw_cmdbuf_res_state state);
 
@@ -136,7 +136,7 @@ static int vmw_dx_streamoutput_create(struct vmw_resource *res)
 }
 
 static int vmw_dx_streamoutput_bind(struct vmw_resource *res,
-				    struct ttm_validate_buffer *val_buf)
+				    struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct ttm_buffer_object *bo = val_buf->bo;
@@ -191,7 +191,7 @@ static int vmw_dx_streamoutput_scrub(struct vmw_resource *res)
 }
 
 static int vmw_dx_streamoutput_unbind(struct vmw_resource *res, bool readback,
-				      struct ttm_validate_buffer *val_buf)
+				      struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct vmw_fence_obj *fence;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5721c74da3e0..f16f0d85fe2c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -81,18 +81,18 @@ static void vmw_user_surface_free(struct vmw_resource *res);
 static struct vmw_resource *
 vmw_user_surface_base_to_res(struct ttm_base_object *base);
 static int vmw_legacy_srf_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf);
+			       struct vmw_validate_buffer *val_buf);
 static int vmw_legacy_srf_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf);
+				 struct vmw_validate_buffer *val_buf);
 static int vmw_legacy_srf_create(struct vmw_resource *res);
 static int vmw_legacy_srf_destroy(struct vmw_resource *res);
 static int vmw_gb_surface_create(struct vmw_resource *res);
 static int vmw_gb_surface_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf);
+			       struct vmw_validate_buffer *val_buf);
 static int vmw_gb_surface_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf);
+				 struct vmw_validate_buffer *val_buf);
 static int vmw_gb_surface_destroy(struct vmw_resource *res);
 static int
 vmw_gb_surface_define_internal(struct drm_device *dev,
@@ -461,7 +461,7 @@ static int vmw_legacy_srf_create(struct vmw_resource *res)
  *
  * @res:            Pointer to a struct vmw_res embedded in a struct
  *                  vmw_surface.
- * @val_buf:        Pointer to a struct ttm_validate_buffer containing
+ * @val_buf:        Pointer to a struct vmw_validate_buffer containing
  *                  information about the backup buffer.
  * @bind:           Boolean wether to DMA to the surface.
  *
@@ -473,7 +473,7 @@ static int vmw_legacy_srf_create(struct vmw_resource *res)
  * will also be returned reserved iff @bind is true.
  */
 static int vmw_legacy_srf_dma(struct vmw_resource *res,
-			      struct ttm_validate_buffer *val_buf,
+			      struct vmw_validate_buffer *val_buf,
 			      bool bind)
 {
 	SVGAGuestPtr ptr;
@@ -515,14 +515,14 @@ static int vmw_legacy_srf_dma(struct vmw_resource *res,
  *
  * @res:            Pointer to a struct vmw_res embedded in a struct
  *                  vmw_surface.
- * @val_buf:        Pointer to a struct ttm_validate_buffer containing
+ * @val_buf:        Pointer to a struct vmw_validate_buffer containing
  *                  information about the backup buffer.
  *
  * This function will copy backup data to the surface if the
  * backup buffer is dirty.
  */
 static int vmw_legacy_srf_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf)
+			       struct vmw_validate_buffer *val_buf)
 {
 	if (!res->guest_memory_dirty)
 		return 0;
@@ -538,14 +538,14 @@ static int vmw_legacy_srf_bind(struct vmw_resource *res,
  * @res:            Pointer to a struct vmw_res embedded in a struct
  *                  vmw_surface.
  * @readback:       Readback - only true if dirty
- * @val_buf:        Pointer to a struct ttm_validate_buffer containing
+ * @val_buf:        Pointer to a struct vmw_validate_buffer containing
  *                  information about the backup buffer.
  *
  * This function will copy backup data from the surface.
  */
 static int vmw_legacy_srf_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf)
+				 struct vmw_validate_buffer *val_buf)
 {
 	if (unlikely(readback))
 		return vmw_legacy_srf_dma(res, val_buf, false);
@@ -1285,7 +1285,7 @@ static int vmw_gb_surface_create(struct vmw_resource *res)
 
 
 static int vmw_gb_surface_bind(struct vmw_resource *res,
-			       struct ttm_validate_buffer *val_buf)
+			       struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct {
@@ -1331,7 +1331,7 @@ static int vmw_gb_surface_bind(struct vmw_resource *res,
 
 static int vmw_gb_surface_unbind(struct vmw_resource *res,
 				 bool readback,
-				 struct ttm_validate_buffer *val_buf)
+				 struct vmw_validate_buffer *val_buf)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	struct ttm_buffer_object *bo = val_buf->bo;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index 34436504fcdb..c0977c853244 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -43,7 +43,7 @@
  * large numbers and space conservation is desired.
  */
 struct vmw_validation_bo_node {
-	struct ttm_validate_buffer base;
+	struct vmw_validate_buffer base;
 	struct vmwgfx_hash_item hash;
 	unsigned int coherent_count;
 };
@@ -250,7 +250,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
 
 	bo_node = vmw_validation_find_bo_dup(ctx, vbo);
 	if (!bo_node) {
-		struct ttm_validate_buffer *val_buf;
+		struct vmw_validate_buffer *val_buf;
 
 		bo_node = vmw_validation_mem_alloc(ctx, sizeof(*bo_node));
 		if (!bo_node)
@@ -265,7 +265,6 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
 		val_buf->bo = ttm_bo_get_unless_zero(&vbo->tbo);
 		if (!val_buf->bo)
 			return -ESRCH;
-		val_buf->num_shared = 0;
 		list_add_tail(&val_buf->head, &ctx->bo_list);
 	}
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
index 55a7d8b68d5c..f68cc1fd1eb4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
@@ -65,6 +65,16 @@ struct vmw_validation_context {
 	u8 *page_address;
 };
 
+/**
+ * struct vmw_validate_buffer - Linked list of TTM BOs for validation
+ * @head: linked list node
+ * @bo: The TTM BO
+ */
+struct vmw_validate_buffer {
+	struct list_head head;
+	struct ttm_buffer_object *bo;
+};
+
 struct vmw_bo;
 struct vmw_resource;
 struct vmw_fence_obj;
-- 
2.34.1

