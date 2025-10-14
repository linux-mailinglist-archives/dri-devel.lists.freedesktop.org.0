Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC59BD92FB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2190510E5D1;
	Tue, 14 Oct 2025 12:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i8sQCqML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBCE10E5D2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:00:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 05EE844A42;
 Tue, 14 Oct 2025 12:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E60C4CEE7;
 Tue, 14 Oct 2025 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443256;
 bh=g3hVHe6/k5Thy6FclgKbXpaG8bl0LO//EH9m6yfRdKg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=i8sQCqMLppDnEA+tbuZgPUAybu0utFVz0lz3WYaHk7M2tLMBOdO0XFh/BiJE4Y5M8
 vuZYbaZEp0FZSD+++93jAEOXj+tIz8Ie+dPnr0tQOwGM4botH5Br0K2WZ+vJo+VL2D
 LGdeORpaAc1yYyyaufSyaDxk3ZmL8+unMAqk1G17fNYiCIQq7tR1O+1yLaduhMriMb
 bvKP2jvqn/7iGOrWfdA3ICNpYowRU9IVC6QQ0Fdcf+62380NwDYJuhY8HSD82mVdZ+
 85K4Wqh5VXjN28ZLIUb6BHms5cculeKaLlNdpV9+MQQgDw8O1PHIfsbb9i+0ZGhnq2
 gvACYH71e1xMQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:59 +0200
Subject: [PATCH v2 15/16] drm/vc4: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-drm-private-obj-reset-v2-15-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 kernel-list@raspberrypi.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5435; i=mripard@kernel.org;
 h=from:subject:message-id; bh=g3hVHe6/k5Thy6FclgKbXpaG8bl0LO//EH9m6yfRdKg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrL0kJnplRN5onVi0y4L1QO7Hud885tYWF3w4W6eee
 nyumU5Xx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI91HGWsmKBMH1da2Ge3/N
 vL/lws4TTHdu55yPv89WIZ80u3GvCn/Fvc5rMpeXiJ7O0XzuEVybwdhwJmnpqUIfl+Do0gYDmf4
 phvEaLG/1dqc/2sF5a15zaVGXPcurPSLdMz0UUjnf3F/tLgoA
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

The vc4 driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: kernel-list@raspberrypi.com
---
 drivers/gpu/drm/vc4/vc4_kms.c | 69 ++++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 8f983edb81ff0e3b11bbc8465e69f838050f0d07..f52ab17f24956fdb22669b4074901bff900e60a0 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -82,11 +82,26 @@ static void vc4_ctm_destroy_state(struct drm_private_obj *obj,
 	struct vc4_ctm_state *ctm_state = to_vc4_ctm_state(state);
 
 	kfree(ctm_state);
 }
 
+static struct drm_private_state *
+vc4_ctm_create_state(struct drm_private_obj *obj)
+{
+	struct vc4_ctm_state *ctm_state;
+
+	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
+	if (!ctm_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &ctm_state->base);
+
+	return &ctm_state->base;
+}
+
 static const struct drm_private_state_funcs vc4_ctm_state_funcs = {
+	.atomic_create_state = vc4_ctm_create_state,
 	.atomic_duplicate_state = vc4_ctm_duplicate_state,
 	.atomic_destroy_state = vc4_ctm_destroy_state,
 };
 
 static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
@@ -96,19 +111,13 @@ static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
 	drm_atomic_private_obj_fini(&vc4->ctm_manager);
 }
 
 static int vc4_ctm_obj_init(struct vc4_dev *vc4)
 {
-	struct vc4_ctm_state *ctm_state;
-
 	drm_modeset_lock_init(&vc4->ctm_state_lock);
 
-	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
-	if (!ctm_state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, &ctm_state->base,
+	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, NULL,
 				    &vc4_ctm_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_ctm_obj_fini, NULL);
 }
 
@@ -715,13 +724,28 @@ static void vc4_load_tracker_destroy_state(struct drm_private_obj *obj,
 
 	load_state = to_vc4_load_tracker_state(state);
 	kfree(load_state);
 }
 
+static struct drm_private_state *
+vc4_load_tracker_create_state(struct drm_private_obj *obj)
+{
+	struct vc4_load_tracker_state *load_state;
+
+	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
+	if (!load_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &load_state->base);
+
+	return &load_state->base;
+}
+
 static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 	.atomic_duplicate_state = vc4_load_tracker_duplicate_state,
 	.atomic_destroy_state = vc4_load_tracker_destroy_state,
+	.atomic_create_state = vc4_load_tracker_create_state,
 };
 
 static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -729,18 +753,12 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 	drm_atomic_private_obj_fini(&vc4->load_tracker);
 }
 
 static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 {
-	struct vc4_load_tracker_state *load_state;
-
-	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
-	if (!load_state)
-		return -ENOMEM;
-
 	drm_atomic_private_obj_init(&vc4->base, &vc4->load_tracker,
-				    &load_state->base,
+				    NULL,
 				    &vc4_load_tracker_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
@@ -797,11 +815,26 @@ static void vc4_hvs_channels_print_state(struct drm_printer *p,
 		drm_printf(p, "\t\tin use=%d\n", hvs_state->fifo_state[i].in_use);
 		drm_printf(p, "\t\tload=%lu\n", hvs_state->fifo_state[i].fifo_load);
 	}
 }
 
+static struct drm_private_state *
+vc4_hvs_channels_create_state(struct drm_private_obj *obj)
+{
+	struct vc4_hvs_state *hvs_state;
+
+	hvs_state = kzalloc(sizeof(*hvs_state), GFP_KERNEL);
+	if (!hvs_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &hvs_state->base);
+
+	return &hvs_state->base;
+}
+
 static const struct drm_private_state_funcs vc4_hvs_state_funcs = {
+	.atomic_create_state = vc4_hvs_channels_create_state,
 	.atomic_duplicate_state = vc4_hvs_channels_duplicate_state,
 	.atomic_destroy_state = vc4_hvs_channels_destroy_state,
 	.atomic_print_state = vc4_hvs_channels_print_state,
 };
 
@@ -812,18 +845,12 @@ static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
 	drm_atomic_private_obj_fini(&vc4->hvs_channels);
 }
 
 static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
 {
-	struct vc4_hvs_state *state;
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
 	drm_atomic_private_obj_init(&vc4->base, &vc4->hvs_channels,
-				    &state->base,
+				    NULL,
 				    &vc4_hvs_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini, NULL);
 }
 

-- 
2.51.0

