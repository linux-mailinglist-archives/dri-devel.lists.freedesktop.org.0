Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84142BC4B4D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67AE10E7F3;
	Wed,  8 Oct 2025 12:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kzZrXAQN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9501110E7F3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:05:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 12F2461F82;
 Wed,  8 Oct 2025 12:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D93C113D0;
 Wed,  8 Oct 2025 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925099;
 bh=BTgQdBclKo7NmIGWYu9StywY/1kmhTQ15BwCuZnntRc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kzZrXAQNSr6viEPDa1qjEI0oSgRDEGd/9rhVxe9Dv65adHB6smzMJbb1yrfYy/w2B
 5/N27Awi8hVG/IUA0tcxJQ4zCcF12/74xRLrmNQ4qNiPhKvIVJsKUiCvpUwYn57f+2
 +LgFKULVAlWY3Bb279f2BisEnkzavGEq+4mmh6JK4tRzsbrk14/NysnLWUtp8ddnvs
 4mfDu2W/4XtFajvlTyongQeUJDyR3n/iK2REJyoeuVBLFCUiQikx8Msf+UmJj38L1z
 5LuAwasw35uW8Cw4NMr24V/p4cSiTAzQEtUJ9j5eKKwgOKMjVJCxljArHeTusm/Xn5
 84vTpm72T3enA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:14 +0200
Subject: [PATCH 16/16] drm/mode_config: Call private obj reset with the
 other objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-16-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169; i=mripard@kernel.org;
 h=from:subject:message-id; bh=BTgQdBclKo7NmIGWYu9StywY/1kmhTQ15BwCuZnntRc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgi2fa2cIWUjc2eC4J9Xu1KpXKZI7uXdlcmZNZ9gw5
 XvZgy/nOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE9nIxNnws/nMzT0HInUd+
 2lPlFcWRYm5n1RevPh3TYvKx/5FJfJjECduybUpf54ZMfhyr01ucyNjw959Zau2W28Z1Ew9cvVG
 0wuHD9LJEzWYjjadJnTeXfmjYXWgiVp0W985j2jOpOTGuMjYA
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

Now that we have all the drm_private_obj users relying on the reset
implementation, we can move that call from drm_private_obj_init, where
it was initially supposed to happen, to drm_mode_config_reset, which is
the location reset is called for every other object in KMS.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c      | 3 ---
 drivers/gpu/drm/drm_mode_config.c | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index e409919b0ccb632e869b4a6f8462731484755b73..5e76ae017117ca25a2620b8b3cad4f0d622448fe 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -791,13 +791,10 @@ drm_atomic_private_obj_init(struct drm_device *dev,
 	drm_modeset_lock_init(&obj->lock);
 
 	obj->dev = dev;
 	obj->funcs = funcs;
 	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
-
-	if (obj->funcs->reset)
-		obj->funcs->reset(obj);
 }
 EXPORT_SYMBOL(drm_atomic_private_obj_init);
 
 /**
  * drm_atomic_private_obj_fini - finalize private object
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 25f376869b3a41d47bbe72b0df3e35cad142f3e6..76fcf80fdcec4337992b35ac741189bb32ee670d 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -21,10 +21,11 @@
  */
 
 #include <linux/export.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_managed.h>
@@ -193,12 +194,17 @@ void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
 	struct drm_plane *plane;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
+	struct drm_private_obj *obj;
 	struct drm_connector_list_iter conn_iter;
 
+	drm_for_each_privobj(obj, dev)
+		if (obj->funcs->reset)
+			obj->funcs->reset(obj);
+
 	drm_for_each_plane(plane, dev)
 		if (plane->funcs->reset)
 			plane->funcs->reset(plane);
 
 	drm_for_each_crtc(crtc, dev)

-- 
2.51.0

