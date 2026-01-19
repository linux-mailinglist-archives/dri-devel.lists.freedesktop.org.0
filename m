Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B97D3A967
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EA010E440;
	Mon, 19 Jan 2026 12:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tA8ritYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC3010E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4243C444A3;
 Mon, 19 Jan 2026 12:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77D3C116C6;
 Mon, 19 Jan 2026 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827034;
 bh=QfKB5aRXtHaH0G67fC+l1jm7dzwwk6GJR8vY3QrwcJw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tA8ritYpIl+xI5lOrxvVTw0g/OFYOezFKM6AOBTnh01pOzmzLgmu/aHIf0yh4S/5H
 Z2YelnUTg0YCJC55Lje9MPUPCYK9WSWZ7wn/Uej5sz5xjyK2R9AI6SIZbehih7/PvE
 T+yWxi7e9/XHHs3n8RFaPiRBvoLQKF/8Wv3F/r6NlQlsZp7ltgZbiG92JkcVsmB1R/
 qwxT5uRLI/yxsfhaw/92sn0CMSS/z7GuogC5+jvqfvw1Y/ib213PfNDiJXgOr2T7sB
 LgV6ZSmBymJMNbc4X7FjcbMiC7Jx+Hn7jpVjb2SPAgVa5I1sWIivRI9of+iuGFDVHQ
 niJRTYDuFJ2tg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:04 +0100
Subject: [PATCH v3 08/15] drm/arm: komeda: Switch private_obj
 initialization to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-8-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12584; i=mripard@redhat.com;
 h=from:subject:message-id; bh=QfKB5aRXtHaH0G67fC+l1jm7dzwwk6GJR8vY3QrwcJw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GrU86/YwGF2ZySx3aq7Lop6a/xIz52fuPyb+7eq6d
 SH/X+cs75jKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATWXyTsWF3UEfZrL4LTR1z
 /6WfT9u3tY+1+nLjb9Vd5VoLlfoaOI7oz9jdlhPUPSmu6d+VJ3fPiDI2bP5zb6NJRPITI+HHDvL
 1s/sWsy707zI5EvHjqFQiz5ykmIl8siyqLR+nt574MiO3bZ8sAA==
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
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
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Liviu Dudau <liviu.dudau@arm.com>
---
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   2 +
 .../drm/arm/display/komeda/komeda_private_obj.c    | 208 ++++++++++++++-------
 2 files changed, 146 insertions(+), 64 deletions(-)

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
index 914400c4af73824e52dda76425a73a74e681a146..4994b69c6595637ea832b97629b052e3aea97ee7 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
@@ -38,26 +38,36 @@ komeda_layer_atomic_destroy_state(struct drm_private_obj *obj,
 	struct komeda_layer_state *st = to_layer_st(priv_to_comp_st(state));
 
 	kfree(st);
 }
 
+static struct drm_private_state *
+komeda_layer_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct komeda_layer_state *st;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+
+	return &st->base.obj;
+}
+
 static const struct drm_private_state_funcs komeda_layer_obj_funcs = {
+	.atomic_create_state	= komeda_layer_atomic_create_state,
 	.atomic_duplicate_state	= komeda_layer_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_layer_atomic_destroy_state,
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
@@ -80,27 +90,37 @@ komeda_scaler_atomic_destroy_state(struct drm_private_obj *obj,
 				   struct drm_private_state *state)
 {
 	kfree(to_scaler_st(priv_to_comp_st(state)));
 }
 
+static struct drm_private_state *
+komeda_scaler_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct komeda_scaler_state *st;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+
+	return &st->base.obj;
+}
+
 static const struct drm_private_state_funcs komeda_scaler_obj_funcs = {
+	.atomic_create_state	= komeda_scaler_atomic_create_state,
 	.atomic_duplicate_state	= komeda_scaler_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_scaler_atomic_destroy_state,
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
@@ -123,26 +143,36 @@ komeda_compiz_atomic_destroy_state(struct drm_private_obj *obj,
 				   struct drm_private_state *state)
 {
 	kfree(to_compiz_st(priv_to_comp_st(state)));
 }
 
+static struct drm_private_state *
+komeda_compiz_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct komeda_compiz_state *st;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+
+	return &st->base.obj;
+}
+
 static const struct drm_private_state_funcs komeda_compiz_obj_funcs = {
+	.atomic_create_state	= komeda_compiz_atomic_create_state,
 	.atomic_duplicate_state	= komeda_compiz_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_compiz_atomic_destroy_state,
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
 
@@ -166,27 +196,37 @@ komeda_splitter_atomic_destroy_state(struct drm_private_obj *obj,
 				     struct drm_private_state *state)
 {
 	kfree(to_splitter_st(priv_to_comp_st(state)));
 }
 
+static struct drm_private_state *
+komeda_splitter_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct komeda_splitter_state *st;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+
+	return &st->base.obj;
+}
+
 static const struct drm_private_state_funcs komeda_splitter_obj_funcs = {
+	.atomic_create_state	= komeda_splitter_atomic_create_state,
 	.atomic_duplicate_state	= komeda_splitter_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_splitter_atomic_destroy_state,
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
 
@@ -209,27 +249,37 @@ static void komeda_merger_atomic_destroy_state(struct drm_private_obj *obj,
 					       struct drm_private_state *state)
 {
 	kfree(to_merger_st(priv_to_comp_st(state)));
 }
 
+static struct drm_private_state *
+komeda_merger_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct komeda_merger_state *st;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+
+	return &st->base.obj;
+}
+
 static const struct drm_private_state_funcs komeda_merger_obj_funcs = {
+	.atomic_create_state	= komeda_merger_atomic_create_state,
 	.atomic_duplicate_state	= komeda_merger_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_merger_atomic_destroy_state,
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
 
@@ -253,26 +303,36 @@ komeda_improc_atomic_destroy_state(struct drm_private_obj *obj,
 				   struct drm_private_state *state)
 {
 	kfree(to_improc_st(priv_to_comp_st(state)));
 }
 
+static struct drm_private_state *
+komeda_improc_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct komeda_improc_state *st;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+
+	return &st->base.obj;
+}
+
 static const struct drm_private_state_funcs komeda_improc_obj_funcs = {
+	.atomic_create_state	= komeda_improc_atomic_create_state,
 	.atomic_duplicate_state	= komeda_improc_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_improc_atomic_destroy_state,
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
 
@@ -296,26 +356,36 @@ komeda_timing_ctrlr_atomic_destroy_state(struct drm_private_obj *obj,
 					 struct drm_private_state *state)
 {
 	kfree(to_ctrlr_st(priv_to_comp_st(state)));
 }
 
+static struct drm_private_state *
+komeda_timing_ctrlr_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct komeda_timing_ctrlr_state *st;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
+	komeda_component_state_reset(&st->base);
+	st->base.component = to_component(obj);
+
+	return &st->base.obj;
+}
+
 static const struct drm_private_state_funcs komeda_timing_ctrlr_obj_funcs = {
+	.atomic_create_state	= komeda_timing_ctrlr_atomic_create_state,
 	.atomic_duplicate_state	= komeda_timing_ctrlr_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_timing_ctrlr_atomic_destroy_state,
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
 
@@ -340,26 +410,36 @@ komeda_pipeline_atomic_destroy_state(struct drm_private_obj *obj,
 				     struct drm_private_state *state)
 {
 	kfree(priv_to_pipe_st(state));
 }
 
+static struct drm_private_state *
+komeda_pipeline_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct komeda_pipeline_state *st;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &st->obj);
+	st->active_comps = 0;
+	st->pipe = container_of(obj, struct komeda_pipeline, obj);
+
+	return &st->obj;
+}
+
 static const struct drm_private_state_funcs komeda_pipeline_obj_funcs = {
+	.atomic_create_state	= komeda_pipeline_atomic_create_state,
 	.atomic_duplicate_state	= komeda_pipeline_atomic_duplicate_state,
 	.atomic_destroy_state	= komeda_pipeline_atomic_destroy_state,
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
2.52.0

