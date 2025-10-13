Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6229BD4FA5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 18:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95B410E390;
	Mon, 13 Oct 2025 16:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="04OTVAjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C85610E182;
 Mon, 13 Oct 2025 16:25:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B8570C093B0;
 Mon, 13 Oct 2025 16:24:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9DF6A6067B;
 Mon, 13 Oct 2025 16:24:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98BE7102F2240; 
 Mon, 13 Oct 2025 18:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760372697; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=PC31koJdVp7I18KJXXznsupuFReAJu7dqL5WcMJcy3A=;
 b=04OTVAjTiOEFsDi5yuKJEPPMia+eupmavbDoA7y9ukJCInFmK1cylzLMINZpgRiKkjS12R
 LHD1uKGL0p4tiUjnB760f9sOkZbD072dMYy2ndR8Q1xN4kIu4ig4qZnV8CdJkckoMLui+D
 NV8q+5fjRt5FWWtTT5Pz1ZATGth7vynV5yEPDJcODpBltuIZj5/1X/Aa4+8Tv+CrIJSdZz
 CT/iRbBrdfgm0YaFNloPsvdwqK1mQEQzLU+8Ibg7GMTbfYllbtOreoa6w4psXE2nlABLY9
 b4JA2+aW1E5j1pbLPT5DLwhnEulgEwtuOly7fAUjaROdsK8sqTwtzOd/1iomrg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] drm/atomic: protect bridge private_obj during bridge
 removal
Date: Mon, 13 Oct 2025 18:24:21 +0200
Message-Id: <20251013-drm-bridge-atomic-vs-remove-private_obj-v1-0-1fc2e58102e0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALUn7WgC/x2N0QqDMAwAf0XyvEDbIW7+iozRNtFlUCuplIH47
 ys+Hgd3BxRW4QJjd4BylSJ5bWBvHcSPXxdGocbgjOutsXckTRhUqBm/5yQRa0HllCvjplL9zu8
 cvkjD0z1MHzhQhFbblGf5XafpdZ5/1Mbq7nkAAAA=
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
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
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

This series avoids a race between DRM bridge removal and usage of the
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

The actual change is in patch 2 along with a detailed explanation.
Patch 1 is just a preparation step.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      drm/atomic: pass drm_device pointer to drm_atomic_private_obj_fini()
      drm_atomic_private_obj_fini: protect private_obj removal from list

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c | 2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c           | 2 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c                 | 2 +-
 drivers/gpu/drm/drm_atomic.c                            | 9 ++++++++-
 drivers/gpu/drm/drm_bridge.c                            | 2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c               | 2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c                   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                 | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c                | 2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                      | 2 +-
 drivers/gpu/drm/tegra/hub.c                             | 2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                           | 6 +++---
 include/drm/drm_atomic.h                                | 3 ++-
 14 files changed, 24 insertions(+), 16 deletions(-)
---
base-commit: 3b80ba4fb2d81c77cfef535b202162cbb8aa1f6e
change-id: 20251013-drm-bridge-atomic-vs-remove-private_obj-d792805bebdc

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

