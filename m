Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502CFBF55FE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA4D10E5A3;
	Tue, 21 Oct 2025 08:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="uPsWNRB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9F510E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:56:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1826F4E4122D;
 Tue, 21 Oct 2025 08:56:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D530260680;
 Tue, 21 Oct 2025 08:56:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B6201102F23CA; 
 Tue, 21 Oct 2025 10:55:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761036973; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=2jsZwBtV7vcAxoIXxBFATWt9hXEb5kKdYra5Pb8R+Ow=;
 b=uPsWNRB0+A4j4p75d9ZIHFcTGJnIUItQv++zY88SDuQTyJ26WNQw6boN4+M7z62kHlLqz4
 X5RtR90esp+xo0ut9aGXxL3bw2h+hakY15G92owMYPe0kEmFx5eqyzgHyU7Gqw1oErwc9n
 NQvzK6lkr4i3bHid2qDrqvKh1SrQS7xeReUnwjY0t/JCIGhLI/J117ijGWvDo71uaQ23dI
 38hWbAVlcGD1j2Br2T5NEMnvNAu70hZbX5UzqVjQuKIuiSvHwMVsg/8Q1F7Ym4QHVRSCR6
 W7J2+pYQGxbWLFBARxxD1fvAb86Iau8RkH0F6o0wjkKZufRFsPIpnzDbB4SmOA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 21 Oct 2025 10:55:36 +0200
Subject: [PATCH v2] drm/atomic: drm_atomic_private_obj_fini: protect
 private_obj removal from list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251021-drm-bridge-atomic-vs-remove-private_obj-v2-1-412a18399bac@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIdK92gC/5WQy04DMQxFf2WUNUZ5dCbprPgPVFV5eKgRmZQkR
 EVV/510yoIty2tLPsf3ygpmwsLm4coyNiqU1h7k08D8ya5vCBR6ZpLLUXChIOQILlPoG1tTJA+
 tQMaYGsI5U7MVj8m9Q9B7afjo0AXP+rVzxoUuG+n10POJSk35ewM3cZ/+n9EEcBCLlzgawSXyF
 5dS/aD12afIDrcHNuPnV/+rPtjM2YLQ95HqPGi0fDcZZbgUkxfcaTUp5fZ6CkrhYo0XMig9sr9
 99Ho2U242018juBtlLFjBokCpd11J27nJbnL7AcDtjglpAQAA
X-Change-ID: 20251013-drm-bridge-atomic-vs-remove-private_obj-d792805bebdc
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

Currently drm_bridge_detach() expects that the bridge private_obj is not
locked by a drm_modeset_acquire_ctx, and it warns in case that happens:

  drm_bridge_detach()
  -> drm_atomic_private_obj_fini()
     -> list_del(&obj->head) // removes priv_obj from
                             // dev->mode_config.privobj_list
     -> obj->funcs->atomic_destroy_state()
     -> drm_modeset_lock_fini(&obj->lock)
        -> WARN_ON(!list_empty(&lock->head)) // warn if priv_obj->lock
	                                     // is still in ctx->locked

The expectation is not respected when introducing bridge hot-plugging. In
such case the warning triggers if the bridge is being removed concurrently
to an operation that locks the private object using a
drm_modeset_acquire_ctx, such as in this execution scenario:

  CPU0:
  drm_mode_obj_get_properties_ioctl() // userspace request
  -> DRM_MODESET_LOCK_ALL_BEGIN()
  .  -> drm_for_each_privobj() // loop on dev->mode_config.privobj_list
  .     - lock the privobj mutex
  .	- add priv_obj->lock to ctx->locked
  .	  (list of locks to be released later)
  .
  .                         CPU1:
  .                         drm_bridge_detach() // bridge hot-unplug
  .		            -> WARN triggers!
  .
  -> DRM_MODESET_LOCK_ALL_END()
     -> for each lock in ctx->locked
	- remove priv_obj->lock from ctx->locked
        - unlock the privobj mutex

Fix this by using DRM_MODESET_LOCK_ALL_BEGIN/END() around the list removal
in drm_atomic_private_obj_fini(). This ensures that exactly one of these
happens:

 * the concurrent code (e.g. drm_mode_obj_get_properties_ioctl()) acquires
   all the locks first, so it can execute fully and release the
   privobj->lock before drm_atomic_private_obj_fini() calls list_del() and
   before the WARN_ON()
 * drm_atomic_private_obj_fini() acquires all the locks first, so it
   removes its privobj->lock from the dev->mode_config.privobj_list; the
   concurrent code will run afterwards and not acquire that lock because it
   is not present anymore

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
This series prevents a race between DRM bridge removal and usage of the
bridge private_obj during DRM_MODESET_LOCK_ALL_BEGIN/END() and other
locking operations.

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [0].
Here's the work breakdown (➜ marks the current series):

 1. … add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. … add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. … protect encoder bridge chain with a mutex
       7. of_drm_find_bridge
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. … enforce drm_bridge_add before drm_bridge_attach
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. ➜ handle gracefully atomic updates during bridge removal
    A. … Add drm_dev_enter/exit() to protect device resources
    B. ➜ protect private_obj removal from list
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

The need for this series emerged during testing of DRM bridge
hot-plugging. Very rarely on hot-unplug the following warning has appeared:

  WARNING: CPU: 0 PID: 123 at include/drm/drm_modeset_lock.h:114 drm_atomic_private_obj_fini+0x64/0x80
  ...
  Call trace:
   drm_atomic_private_obj_fini+0x64/0x80
   drm_bridge_detach+0x38/0x98

This series depends on:
 * https://lore.kernel.org/dri-devel/20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org
   - dependency on patch 1 only
   - reason: this patch uses the obj->dev introduced by the other series
---
Changes in v2:
- Adapted to work on top of "drm/atomic: Add dev pointer to drm_private_obj"
- Removed 'To: jessica.zhang@oss.qualcomm.com', invalid address
- Link to v1: https://lore.kernel.org/r/20251013-drm-bridge-atomic-vs-remove-private_obj-v1-0-1fc2e58102e0@bootlin.com
---

Changes in v2:
- added 'drm/atomic:' prefix to commit title
- Adapted to work on top of "drm/atomic: Add dev pointer to drm_private_obj"
- Slightly improved commit message
---
 drivers/gpu/drm/drm_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c161f561d937e2e26de617912078c739adb521dd..107530c1b9978122d2ebf05f7af2ca77f9faa21b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -810,7 +810,13 @@ EXPORT_SYMBOL(drm_atomic_private_obj_init);
 void
 drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 {
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
+
+	DRM_MODESET_LOCK_ALL_BEGIN(obj->dev, ctx, 0, ret);
 	list_del(&obj->head);
+	DRM_MODESET_LOCK_ALL_END(obj->dev, ctx, ret);
+
 	obj->funcs->atomic_destroy_state(obj, obj->state);
 	drm_modeset_lock_fini(&obj->lock);
 }

---
base-commit: 7ea0468380216c10b73633b976d33efa8c12d375
change-id: 20251013-drm-bridge-atomic-vs-remove-private_obj-d792805bebdc
prerequisite-change-id: 20251008-drm-private-obj-reset-ae1e2741027a:v2
prerequisite-patch-id: 031aec6ea9c41371568d42df2ab6dc3ca35ac85c
prerequisite-patch-id: cd9c28ecb798993ed3c3550191cb0fbafbf90bde
prerequisite-patch-id: e05cb0386e8ed0c82ec6a914f6c6ad47a7c841fa
prerequisite-patch-id: a68ff4bb5ba6fd882ca11946d92bb33253812e7d
prerequisite-patch-id: ed1c29018986837cfb0030796a7bfce98aef3445
prerequisite-patch-id: 1e1efb36e40d79bea5ee70380abcbb956508326a
prerequisite-patch-id: 48fcc6b38c7acc1e00d57002a4973ccae6b2889d
prerequisite-patch-id: a122d6d3dd86039f7bf64c082f30c4de676066f9
prerequisite-patch-id: b1ae0e3be3cb2304ed8820cf36a29b88ef110d5b
prerequisite-patch-id: e061eea62a9ee500c239229e3d4c8d7e8edd2964
prerequisite-patch-id: 7e94f6a9760cf58b31d709be849eed855275e140
prerequisite-patch-id: dd3ac7d8cb8af58ea5f41b6c4b43dd844fb29d81
prerequisite-patch-id: 410a9287f82c1af0caf3d8ff4f562b83a33c514b
prerequisite-patch-id: 51e733e1ad1973889a75131c62521b11b16d54d5
prerequisite-patch-id: bf0a8bf82d137cfd1d672df246116136c82523ca
prerequisite-patch-id: fcc237e7836e87b3cad72b32ea976bd6a6190dad

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

