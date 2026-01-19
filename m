Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8ED3A971
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A58110E44D;
	Mon, 19 Jan 2026 12:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aeymzHtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48D910E44D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4722160166;
 Mon, 19 Jan 2026 12:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDD1C19424;
 Mon, 19 Jan 2026 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827051;
 bh=jAn+3MMvEqMNU2Vf3TwT6H1wxmToynEwCpygednmDkk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aeymzHtSmKF98l7LTB3HyYkx9DNcL/FK/IRNtdjv1Z5WbTWGsmBAaWZS5ihiGLP3S
 jPIUKaPU8A3ntzQzDoe2flFClPYut/+2IIUgEBqoCvarsn8uRmnVueZ1VfhHu6qpd6
 2oc6mf/EnccoBWguQRT17WsWwERJBP6EVixlspb2+UV1Yt4DqcQg1yIexrg0axkDo5
 koYnzoP1NI9VNJ//f5cZ1JuuKpo3oiRr7NIePRoEIC+qCxT91jn81ejqUOk+d7Vyae
 JS1sA1rG/iPIwazYoUIBdLkKFopTNro1++ufO9wiyAwJdpxTKUd6uEFTHwdKh3DgZz
 JwN6uJvilPijA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:10 +0100
Subject: [PATCH v3 14/15] drm/vc4: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260119-drm-private-obj-reset-v3-14-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 kernel-list@raspberrypi.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5435; i=mripard@redhat.com;
 h=from:subject:message-id; bh=jAn+3MMvEqMNU2Vf3TwT6H1wxmToynEwCpygednmDkk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GvWrws/cc/uQtcVzA4ti/gwbZqVpk3feSm8uXVt+6
 6V41aLLHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiB1YzNlxrNBF7epzHwbdw
 ddH8eUIPjuy1CZ6z/UvobN71q6O1qgMfqH7P9tkz7Zr+vYUse4JeHGds6EktStsp4rxFfKHOtl+
 B0uJrGKoFv1/mdf+5PC65Z+K8y6tSRb2LDj6vMshj0nby6ykAAA==
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
index e563c12109371619605d8e3f78b0f92694dbe5a5..f82c7ea1d74eeaa075296533a1ffe3561f197748 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -83,11 +83,26 @@ static void vc4_ctm_destroy_state(struct drm_private_obj *obj,
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
@@ -97,19 +112,13 @@ static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
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
 
@@ -716,13 +725,28 @@ static void vc4_load_tracker_destroy_state(struct drm_private_obj *obj,
 
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
@@ -730,18 +754,12 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
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
 
@@ -798,11 +816,26 @@ static void vc4_hvs_channels_print_state(struct drm_printer *p,
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
 
@@ -813,18 +846,12 @@ static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
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
2.52.0

