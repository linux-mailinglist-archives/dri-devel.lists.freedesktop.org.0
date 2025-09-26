Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF9BA4A87
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A4310E116;
	Fri, 26 Sep 2025 16:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ee90gbZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7536F10E116
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 16:35:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 305E64E40E10;
 Fri, 26 Sep 2025 16:35:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DC49D606B5;
 Fri, 26 Sep 2025 16:35:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 505CB102F1829; 
 Fri, 26 Sep 2025 18:34:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758904503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=dP7cb8o2uFEBoyofslfnxXahVZmwUp4Kz0PnzXuPHDk=;
 b=Ee90gbZTPY8VrFruFBP8JzReQjP4yCTGgwmdTSnbPEtwnphM1TMkESZnek4Vm+iqd+UceN
 Q6MtWKkCC8gRBkETAKXArcBZ8OFo/wTJTvq4bIRPnTDrSbcjKkBJEyawljxr9a27PYJPli
 XJwK3upveKCpexllbgsQ6qWo4bDtaLZRE9yvnOm6Nb/JLHtdQYcdqwwAPI2dwKB6/tMweo
 6JErhkMbI0kKeb/YslsU/tRx8uHa2TBLGCSO6kXby0pR9nGZcJUijToO6pKK1HQfPagMiT
 9XUrMO0AzgSoSqPOtCVYmq31VcA4kCGb05ex6506qNc0CHr59J1fPkJ4E8NqQw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/2] drm/bridge: handle gracefully atomic updates during
 bridge removal
Date: Fri, 26 Sep 2025 18:33:26 +0200
Message-Id: <20250926-drm-bridge-atomic-vs-remove-v2-0-69f7d5ca1a92@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFbA1mgC/42NTQ6CMBCFr0Jm7ZhSQqyuvAdh0Z9BJrGMaUmjI
 dzdyglcfu+9fG+DTIkpw63ZIFHhzLJU0KcG/GyXByGHyqCV7pVRBkOK6BKH2thVInssGRNFKYR
 tuDhXl97QBNXwSjTx+7APY+WZ8yrpc5yV9pf+5y0tKrS9pmvXOWWsuTuR9cnL2UuEcd/3L8AHF
 JHIAAAA
X-Change-ID: 20250808-drm-bridge-atomic-vs-remove-1d7bb202c8ef
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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
       1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
            (drm-misc-next)
       2. ✔ drm_bridge_get_prev_bridge() (drm-misc-next)
       3. ✔ drm_bridge_get_next_bridge() (drm-misc-next)
       4. ✔ drm_for_each_bridge_in_chain() (drm-misc-next)
       5. … drm_bridge_connector_init
       6. …  protect encoder bridge chain with a mutex
       7. of_drm_find_bridge
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list removed bridges (drm-misc-next)
 2. ➜ handle gracefully atomic updates during bridge removal
 3. … DSI host-device driver interaction
 4. removing the need for the "always-disconnected" connector
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
Changes in v2:
- No changes to patch 1, discussion pending
- Use devres instead of a flag in patch 2
- Link to v1: https://lore.kernel.org/r/20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com

---
Luca Ceresoli (2):
      drm/bridge: add drm_bridge_unplug() and drm_bridge_enter/exit()
      drm/bridge: ti-sn65dsi83: protect device resources on unplug

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 85 ++++++++++++++++++++++++++++-------
 drivers/gpu/drm/drm_bridge.c          | 58 ++++++++++++++++++++++++
 include/drm/drm_bridge.h              | 12 +++++
 3 files changed, 138 insertions(+), 17 deletions(-)
---
base-commit: 7acbe30813f04cccf7b2e8b571eb7936cfec0a87
change-id: 20250808-drm-bridge-atomic-vs-remove-1d7bb202c8ef

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

