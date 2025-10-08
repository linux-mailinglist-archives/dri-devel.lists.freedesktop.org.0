Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ADBBC4B32
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B567310E80C;
	Wed,  8 Oct 2025 12:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TFtsc/Vj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6640410E808
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DB1F761F7F;
 Wed,  8 Oct 2025 12:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D91AC4CEF4;
 Wed,  8 Oct 2025 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925093;
 bh=95b8s1cuqyYUl7AOSPmoCt4Z6+8pWwFAJbUHt2hgMqg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TFtsc/VjxhhmSE7YdzCmEcfobLHN6o+m8lptEAnm5LxGC03ieLVRodBJoBIAKUVlb
 6yAr72BJqlK2xY01BlcdxOufMiIZjpjVwCit/W1iYudZLAc0agAm0ej6loO4tNkvvx
 ckuYL1p3sqYNK0uQqJiBwojHbh+cRGqtdV4J809sHTTmj2FPqgfoHA5ZWao18O6YEp
 3lTTfD9mQNwwR/n+uxc8hbiuFAPnFnmPl4MoZU4jTDFyTMGay2KIcII4NJnhi6ffdy
 AJENUCwHnpl6QpN2sFqHXp1P66DL/CHmgYQRNVngs+NUypHpFfFa25vVRoj1KHnVmD
 knfQ7B89I0KUg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:12 +0200
Subject: [PATCH 14/16] drm/vc4: Switch private_obj initialization to reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251008-drm-private-obj-reset-v1-14-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 kernel-list@raspberrypi.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5575; i=mripard@kernel.org;
 h=from:subject:message-id; bh=95b8s1cuqyYUl7AOSPmoCt4Z6+8pWwFAJbUHt2hgMqg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgi1ENAP27Tjnrr4rcfORv60iHAH2G7Y4dL7qnnvq7
 sQaR+sPHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi02IZG7ovfmzjl1HnuSR5
 e8tivcxKmeJDjM80g+PmPtn9wj4+4qCuz+UZ131nbrnKVj+39vi3X4wNva3ybOUVzMJu19UupB7
 qEYrxkXG6Hvtd5ojOme817sfT1bnyV/70PXdaWqvq168rVw4DAA==
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
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: kernel-list@raspberrypi.com
---
 drivers/gpu/drm/vc4/vc4_kms.c | 75 +++++++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 8f983edb81ff0e3b11bbc8465e69f838050f0d07..f50ffc1c4b62ae3e180743f9cad4c6d0bc62a922 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -82,13 +82,30 @@ static void vc4_ctm_destroy_state(struct drm_private_obj *obj,
 	struct vc4_ctm_state *ctm_state = to_vc4_ctm_state(state);
 
 	kfree(ctm_state);
 }
 
+static void vc4_ctm_reset(struct drm_private_obj *obj)
+{
+	struct vc4_ctm_state *ctm_state;
+
+	if (obj->state) {
+		vc4_ctm_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
+	if (!ctm_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &ctm_state->base);
+}
+
 static const struct drm_private_state_funcs vc4_ctm_state_funcs = {
 	.atomic_duplicate_state = vc4_ctm_duplicate_state,
 	.atomic_destroy_state = vc4_ctm_destroy_state,
+	.reset = vc4_ctm_reset,
 };
 
 static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -96,19 +113,13 @@ static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
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
 
@@ -715,13 +726,30 @@ static void vc4_load_tracker_destroy_state(struct drm_private_obj *obj,
 
 	load_state = to_vc4_load_tracker_state(state);
 	kfree(load_state);
 }
 
+static void vc4_load_tracker_reset(struct drm_private_obj *obj)
+{
+	struct vc4_load_tracker_state *load_state;
+
+	if (obj->state) {
+		vc4_load_tracker_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
+	if (!load_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &load_state->base);
+}
+
 static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 	.atomic_duplicate_state = vc4_load_tracker_duplicate_state,
 	.atomic_destroy_state = vc4_load_tracker_destroy_state,
+	.reset = vc4_load_tracker_reset,
 };
 
 static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -729,18 +757,12 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
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
 
@@ -797,14 +819,31 @@ static void vc4_hvs_channels_print_state(struct drm_printer *p,
 		drm_printf(p, "\t\tin use=%d\n", hvs_state->fifo_state[i].in_use);
 		drm_printf(p, "\t\tload=%lu\n", hvs_state->fifo_state[i].fifo_load);
 	}
 }
 
+static void vc4_hvs_channels_reset(struct drm_private_obj *obj)
+{
+	struct vc4_hvs_state *hvs_state;
+
+	if (obj->state) {
+		vc4_hvs_channels_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	hvs_state = kzalloc(sizeof(*hvs_state), GFP_KERNEL);
+	if (!hvs_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &hvs_state->base);
+}
+
 static const struct drm_private_state_funcs vc4_hvs_state_funcs = {
 	.atomic_duplicate_state = vc4_hvs_channels_duplicate_state,
 	.atomic_destroy_state = vc4_hvs_channels_destroy_state,
 	.atomic_print_state = vc4_hvs_channels_print_state,
+	.reset = vc4_hvs_channels_reset,
 };
 
 static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -812,18 +851,12 @@ static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
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

