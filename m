Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPH2GbUEemlg1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC073A16FE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124A110E6CE;
	Wed, 28 Jan 2026 12:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eLDK+TFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D4010E6CA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:44:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3EE38416A8;
 Wed, 28 Jan 2026 12:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB9FC16AAE;
 Wed, 28 Jan 2026 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604262;
 bh=QZQULfLMOP+4WeM34GZlFglSh/CLRGCkOp+wlvSk0EQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eLDK+TFeK38VyrfTl5qB9v25vcfBDNL/s7AVr+t9xlwxS+pulcJbWj+kV7uZaLpcI
 thxby9Pe+vsfmr/NbC1jxMFIgUWEunBHlcn79ikNqh7AoN2KUTYzHDRXvCmvhCqS8e
 89ytEjXCGE/QBftf9GZUm0lU1x/3NEk7+UCYwy9XyuGvjLn9/6w/gGU9u/3Vno1MVo
 yRXk9Dt39h/4sPM9Y5lm9D5g39vs5niM4HWvoyWkjUFJO1vTl8cPr9xrB80prxsu0P
 OAczI4+0q8kN5uVajkj9x65c8xwh7Ija6zxgqyGVuJED123tOyNVzS1sriye1yzFsC
 DOmcTgViK3Isw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:52 +0100
Subject: [PATCH v4 08/15] drm/arm: komeda: Switch private_obj
 initialization to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-private-obj-reset-v4-8-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12691; i=mripard@redhat.com;
 h=from:subject:message-id; bh=QZQULfLMOP+4WeM34GZlFglSh/CLRGCkOp+wlvSk0EQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLB0Kgl1zptfGKPFXfu2QDO7p11NJtZjH2+JhtlC1/
 7y2S1THVBYGYU4GWTFFlicyYaeXty+ucrBf+QNmDisTyBAGLk4BmMijRYwN88Q6/s+KDdZbK+j5
 Tk4lT7T5e03767vqR6PSVSzqqkxXrdy5Z2K3V+kO9z2eT4JPe5gw1krcdF6azPDLjFfyw9JLXxf
 ffLKP76zoaznRvgv5nU2X5CMnmC489Kqxmn3FVJkal552bwA=
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mripard@kernel.org,m:liviu.dudau@arm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,arm.com:email]
X-Rspamd-Queue-Id: AC073A16FE
X-Rspamd-Action: no action

The ARM komeda driver relies on a number of drm_private_objs, that are
initialized by allocating and initializing a state, and then passing it
to drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

