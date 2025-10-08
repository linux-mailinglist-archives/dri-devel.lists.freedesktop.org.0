Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7EFBC4B11
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1107C10E320;
	Wed,  8 Oct 2025 12:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C1dN5gPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CDB10E7F0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 391A361F7F;
 Wed,  8 Oct 2025 12:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D08FC4CEF4;
 Wed,  8 Oct 2025 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925076;
 bh=6cr7a4Oi7nR6tykRdmPtBan+JL2S8tj3pWBBjqTArYI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=C1dN5gPQtSN5+wSct/4iBKoIFpTNWSRfn4VBvj7XK2wMqOPbXabGyw+EBmpvGLz91
 FBieFScsrCURkmSfk4LDfQUKEsmMTjFbFlWHgdu5nKGOVAEvXVnEiSHsUY0+se6dLT
 +ZXd/P9ALDDvl47KXakccuRqRydIxgsjtxJ6qUwN2jOkCb1QPOrF6QgC2fB5w0vPud
 ZFQhykotiYrBLAF2w93BtNRU93cIxC8GOxHjXlScJ7Z4LgkOtRdv7wexufKXaA3AO5
 c2CAGafNdCIfdAextzJNHo106qFYPZWBjeFZmnqCNYxD6qvzs/J5iNhnjPnIMmahP0
 U7PKx7Qlylqxw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:06 +0200
Subject: [PATCH 08/16] drm/arm: komeda: Switch private_obj initialization
 to reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-8-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12544; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6cr7a4Oi7nR6tykRdmPtBan+JL2S8tj3pWBBjqTArYI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgs3q/uzsPWZswqgZ1bPhw+PlkecbRGp2W6qW+/Kaf
 r3Lv+l/x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIvwrGOivBpPccW/n4zn2r
 n8w7W/v9j7Xh5i4T7x0sMDtUo3tae07E3tLfs3qCjC6peWsdCre4y9jQ+vpa/PfJeyoyfD7cdp5
 4/+nDsGsTnx6cdEdAwFK0KzMulvmqiknMkYOrVpww1G0yPHEGAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The ARM komeda driver relies on a number of drm_private_objs, that are
initialized by allocating and initializing a state, and then passing it
to drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Liviu Dudau <liviu.dudau@arm.com>
---
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   2 +
 .../drm/arm/display/komeda/komeda_private_obj.c    | 232 +++++++++++++++------
 2 files changed, 170 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
index ac8725e248537e5737d16cd36860401c42073500..37b9e92202443cc72adc0666ed047d4f77d79782 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
@@ -126,10 +126,12 @@ struct komeda_component {
 	 * @funcs: chip functions to access HW
 	 */
 	const struct komeda_component_funcs *funcs;
 };
 
+#define to_component(o)	container_of(o, struct komeda_component, obj)
+
 /**
  * struct komeda_component_output
  *
  * a component has multiple outputs, if want to know where the data
  * comes from, only know the component is not enough, we still need to know
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
index 914400c4af73824e52dda76425a73a74e681a146..0c7b7a5dd10900016f64df2a86d54f9178d1cf5e 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
@@ -38,26 +38,39 @@ komeda_layer_atomic_destroy_state(struct drm_private_obj *obj,
 	struct komeda_layer_state *st = to_layer_st(priv_to_comp_st(state));
 
 	kfree(st);
 }
 
+static void
+komeda_layer_reset(struct drm_private_obj *obj)
+{
+	struct komeda_layer_state *st;
+
+	if (obj->state) {
+		komeda_layer_atomic_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+}
+
 static const struct drm_private_state_funcs komeda_layer_obj_funcs = {
 	.atomic_duplicate_state	= komeda_layer_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_layer_atomic_destroy_state,
+	.reset			= komeda_layer_reset,
 };
 
 static int komeda_layer_obj_add(struct komeda_kms_dev *kms,
 				struct komeda_layer *layer)
 {
-	struct komeda_layer_state *st;
-
-	st = kzalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
-	st->base.component = &layer->base;
-	drm_atomic_private_obj_init(&kms->base, &layer->base.obj, &st->base.obj,
+	drm_atomic_private_obj_init(&kms->base, &layer->base.obj, NULL,
 				    &komeda_layer_obj_funcs);
 	return 0;
 }
 
 static struct drm_private_state *
@@ -80,27 +93,40 @@ komeda_scaler_atomic_destroy_state(struct drm_private_obj *obj,
 				   struct drm_private_state *state)
 {
 	kfree(to_scaler_st(priv_to_comp_st(state)));
 }
 
+static void
+komeda_scaler_reset(struct drm_private_obj *obj)
+{
+	struct komeda_scaler_state *st;
+
+	if (obj->state) {
+		komeda_scaler_atomic_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+}
+
 static const struct drm_private_state_funcs komeda_scaler_obj_funcs = {
 	.atomic_duplicate_state	= komeda_scaler_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_scaler_atomic_destroy_state,
+	.reset			= komeda_scaler_reset,
 };
 
 static int komeda_scaler_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_scaler *scaler)
 {
-	struct komeda_scaler_state *st;
-
-	st = kzalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
-	st->base.component = &scaler->base;
 	drm_atomic_private_obj_init(&kms->base,
-				    &scaler->base.obj, &st->base.obj,
+				    &scaler->base.obj, NULL,
 				    &komeda_scaler_obj_funcs);
 	return 0;
 }
 
 static struct drm_private_state *
@@ -123,26 +149,39 @@ komeda_compiz_atomic_destroy_state(struct drm_private_obj *obj,
 				   struct drm_private_state *state)
 {
 	kfree(to_compiz_st(priv_to_comp_st(state)));
 }
 
+static void
+komeda_compiz_reset(struct drm_private_obj *obj)
+{
+	struct komeda_compiz_state *st;
+
+	if (obj->state) {
+		komeda_compiz_atomic_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+}
+
 static const struct drm_private_state_funcs komeda_compiz_obj_funcs = {
 	.atomic_duplicate_state	= komeda_compiz_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_compiz_atomic_destroy_state,
+	.reset			= komeda_compiz_reset,
 };
 
 static int komeda_compiz_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_compiz *compiz)
 {
-	struct komeda_compiz_state *st;
-
-	st = kzalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
-	st->base.component = &compiz->base;
-	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj, &st->base.obj,
+	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj, NULL,
 				    &komeda_compiz_obj_funcs);
 
 	return 0;
 }
 
@@ -166,27 +205,40 @@ komeda_splitter_atomic_destroy_state(struct drm_private_obj *obj,
 				     struct drm_private_state *state)
 {
 	kfree(to_splitter_st(priv_to_comp_st(state)));
 }
 
+static void
+komeda_splitter_reset(struct drm_private_obj *obj)
+{
+	struct komeda_splitter_state *st;
+
+	if (obj->state) {
+		komeda_splitter_atomic_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+}
+
 static const struct drm_private_state_funcs komeda_splitter_obj_funcs = {
 	.atomic_duplicate_state	= komeda_splitter_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_splitter_atomic_destroy_state,
+	.reset			= komeda_splitter_reset,
 };
 
 static int komeda_splitter_obj_add(struct komeda_kms_dev *kms,
 				   struct komeda_splitter *splitter)
 {
-	struct komeda_splitter_state *st;
-
-	st = kzalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
-	st->base.component = &splitter->base;
 	drm_atomic_private_obj_init(&kms->base,
-				    &splitter->base.obj, &st->base.obj,
+				    &splitter->base.obj, NULL,
 				    &komeda_splitter_obj_funcs);
 
 	return 0;
 }
 
@@ -209,27 +261,40 @@ static void komeda_merger_atomic_destroy_state(struct drm_private_obj *obj,
 					       struct drm_private_state *state)
 {
 	kfree(to_merger_st(priv_to_comp_st(state)));
 }
 
+static void
+komeda_merger_reset(struct drm_private_obj *obj)
+{
+	struct komeda_merger_state *st;
+
+	if (obj->state) {
+		komeda_merger_atomic_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+}
+
 static const struct drm_private_state_funcs komeda_merger_obj_funcs = {
 	.atomic_duplicate_state	= komeda_merger_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_merger_atomic_destroy_state,
+	.reset			= komeda_merger_reset,
 };
 
 static int komeda_merger_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_merger *merger)
 {
-	struct komeda_merger_state *st;
-
-	st = kzalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
-	st->base.component = &merger->base;
 	drm_atomic_private_obj_init(&kms->base,
-				    &merger->base.obj, &st->base.obj,
+				    &merger->base.obj, NULL,
 				    &komeda_merger_obj_funcs);
 
 	return 0;
 }
 
@@ -253,26 +318,39 @@ komeda_improc_atomic_destroy_state(struct drm_private_obj *obj,
 				   struct drm_private_state *state)
 {
 	kfree(to_improc_st(priv_to_comp_st(state)));
 }
 
+static void
+komeda_improc_reset(struct drm_private_obj *obj)
+{
+	struct komeda_improc_state *st;
+
+	if (obj->state) {
+		komeda_improc_atomic_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+}
+
 static const struct drm_private_state_funcs komeda_improc_obj_funcs = {
 	.atomic_duplicate_state	= komeda_improc_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_improc_atomic_destroy_state,
+	.reset			= komeda_improc_reset,
 };
 
 static int komeda_improc_obj_add(struct komeda_kms_dev *kms,
 				 struct komeda_improc *improc)
 {
-	struct komeda_improc_state *st;
-
-	st = kzalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
-	st->base.component = &improc->base;
-	drm_atomic_private_obj_init(&kms->base, &improc->base.obj, &st->base.obj,
+	drm_atomic_private_obj_init(&kms->base, &improc->base.obj, NULL,
 				    &komeda_improc_obj_funcs);
 
 	return 0;
 }
 
@@ -296,26 +374,39 @@ komeda_timing_ctrlr_atomic_destroy_state(struct drm_private_obj *obj,
 					 struct drm_private_state *state)
 {
 	kfree(to_ctrlr_st(priv_to_comp_st(state)));
 }
 
+static void
+komeda_timing_ctrlr_reset(struct drm_private_obj *obj)
+{
+	struct komeda_timing_ctrlr_state *st;
+
+	if (obj->state) {
+		komeda_timing_ctrlr_atomic_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+}
+
 static const struct drm_private_state_funcs komeda_timing_ctrlr_obj_funcs = {
 	.atomic_duplicate_state	= komeda_timing_ctrlr_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_timing_ctrlr_atomic_destroy_state,
+	.reset			= komeda_timing_ctrlr_reset,
 };
 
 static int komeda_timing_ctrlr_obj_add(struct komeda_kms_dev *kms,
 				       struct komeda_timing_ctrlr *ctrlr)
 {
-	struct komeda_compiz_state *st;
-
-	st = kzalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
-	st->base.component = &ctrlr->base;
-	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj, &st->base.obj,
+	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj, NULL,
 				    &komeda_timing_ctrlr_obj_funcs);
 
 	return 0;
 }
 
@@ -340,26 +431,39 @@ komeda_pipeline_atomic_destroy_state(struct drm_private_obj *obj,
 				     struct drm_private_state *state)
 {
 	kfree(priv_to_pipe_st(state));
 }
 
+static void
+komeda_pipeline_reset(struct drm_private_obj *obj)
+{
+	struct komeda_pipeline_state *st;
+
+	if (obj->state) {
+		komeda_pipeline_atomic_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &st->obj);
+	st->active_comps = 0;
+	st->pipe = container_of(obj, struct komeda_pipeline, obj);
+}
+
 static const struct drm_private_state_funcs komeda_pipeline_obj_funcs = {
 	.atomic_duplicate_state	= komeda_pipeline_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_pipeline_atomic_destroy_state,
+	.reset			= komeda_pipeline_reset,
 };
 
 static int komeda_pipeline_obj_add(struct komeda_kms_dev *kms,
 				   struct komeda_pipeline *pipe)
 {
-	struct komeda_pipeline_state *st;
-
-	st = kzalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
-
-	st->pipe = pipe;
-	drm_atomic_private_obj_init(&kms->base, &pipe->obj, &st->obj,
+	drm_atomic_private_obj_init(&kms->base, &pipe->obj, NULL,
 				    &komeda_pipeline_obj_funcs);
 
 	return 0;
 }
 

-- 
2.51.0

