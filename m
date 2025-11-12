Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19A9C536AE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A3410E04F;
	Wed, 12 Nov 2025 16:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1V81eMYT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683A210E04F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:34:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A886C4E41670;
 Wed, 12 Nov 2025 16:34:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6FECA6070B;
 Wed, 12 Nov 2025 16:34:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B3AF102F194E; Wed, 12 Nov 2025 17:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762965290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=EFQ/d0mDDHLA3p6JwHrNOVGaA5Lyvd3F8ihxq1rPJ40=;
 b=1V81eMYTV0tVPKpVTdfqUbEBGLkExMv/CZ4OE9izM91q/+T6INLU4rb5Q7r/+ftVEuyf2d
 VQ3PFToTtL0I7IFcnNnOfQyq7r/CBjhpDGgi/qn3G9qRBWYkxJ+3uD7XUi5mCPFaeXdYhB
 XGMPMnhSMn0gVUiBj6pNg3JVFgUmg9d5CPMmuDd5UpoZAnJL4julCJ+E5EZSjuvT5AeWuT
 RZ/DayR1oGMHILQnyOrD5ZD25/OIpnRJnRp9fsVeg7i34Er8tLBWvQtHbf4eUpZ6cxAmyx
 zdC+LbP40v/+JzSRItmGU3yvrXp1I9M1Wu3f2A4rcmqyBaZ5+Gk4Agis/jORWw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 0/2] drm/bridge: handle gracefully atomic updates during
 bridge removal
Date: Wed, 12 Nov 2025 17:34:33 +0100
Message-Id: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABm3FGkC/43NzQ6CMAzA8VchO1szRoDNk+9hPOyjSBPHzEYWD
 eHdHVyMF+Px3za/LixhJEzsVC0sYqZEYSrRHCpmRz3dEMiVZoKLlksuwUUPJpIrGz0HTxZygog
 +ZITa9caUSytxYEV4RBzoueuXa+mR0hzia3+W6236n5tr4KBbgappDJdank0I852mow2ebXIWH
 02J7rcmitapoXet1bVW4ltb1/UNikiIWRYBAAA=
X-Change-ID: 20250808-drm-bridge-atomic-vs-remove-1d7bb202c8ef
To: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
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

This is a first attempt at gracefully handling the case of atomic updates
happening concurrently to physical removal of DRM bridges.

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [1].

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
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. ➜ handle gracefully atomic updates during bridge removal
    A. ➜ Add drm_dev_enter/exit() to protect device resources
    B. … protect private_obj removal from list
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

The idea was proposed by Maxime [1] and is based on the existing
drm_dev_enter/exit() already existing for the DRM device.

This small series implements the core mechanism in drm_bridge.c and uses it
in the ti-sn65dsi83 driver. This prevents usage of device resources by
various code paths that can happen concurrently to unplug of the SN65DSI8x
bridge.

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t
[1] https://lore.kernel.org/all/20250106-vigorous-talented-viper-fa49d9@houat/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- Call drm_bridge_remove() in drm_bridge_unplug() as suggested by Maxime
- Fix kerneldoc errors (reported here:
  https://lore.kernel.org/lkml/202509271654.j3IsjsAJ-lkp@intel.com/)
- Some cleanups in patch 2
- Link to v2: https://lore.kernel.org/r/20250926-drm-bridge-atomic-vs-remove-v2-0-69f7d5ca1a92@bootlin.com

Changes in v2:
- No changes to patch 1, discussion pending
- Use devres instead of a flag in patch 2
- Link to v1: https://lore.kernel.org/r/20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com

---
Luca Ceresoli (2):
      drm/bridge: add drm_bridge_unplug() and drm_bridge_enter/exit()
      drm/bridge: ti-sn65dsi83: protect device resources on unplug

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 86 +++++++++++++++++++++++++++--------
 drivers/gpu/drm/drm_bridge.c          | 62 +++++++++++++++++++++++++
 include/drm/drm_bridge.h              | 12 +++++
 3 files changed, 140 insertions(+), 20 deletions(-)
---
base-commit: 604046a2d68bf5a67f111579d749a046c3a26669
change-id: 20250808-drm-bridge-atomic-vs-remove-1d7bb202c8ef

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

