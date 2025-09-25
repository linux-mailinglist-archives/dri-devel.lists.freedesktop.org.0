Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE588BA0CD4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 19:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2D10E27F;
	Thu, 25 Sep 2025 17:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sMWcWiwm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEE210E27F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 17:20:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3B3711A0FB7;
 Thu, 25 Sep 2025 17:20:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECB1F60665;
 Thu, 25 Sep 2025 17:20:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1E0A0102F18A2; 
 Thu, 25 Sep 2025 19:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758820808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=eacb3MYzvcQFMQrjvneoIfPXPJZ29MiM8xMOZ7tQvUs=;
 b=sMWcWiwm70JV6yQe408JsPHrJJHRnDnhorWQY8aABxiaOPYHxqQG/lsfIQVA8aK3Obqrnn
 Fq+thaIQKtVMvIO7v1yoegxq9r7hTCQWuJwuzuxcBv4Y2SL2tcOee/6gBIjR1bjLSZ3S75
 dYj85H4sjQeUpiT7zAMQ2eCjBOEeLJLCd+I0sOElkQrNo1Ww8cp9SP8wEGf4/pVJqsEdry
 P0NBnGF6Zuv/EgQJbug+yDCzltPPUwE1dT8pizd5bSlb3XCq9/xn85Yfv9qIaC7lKv0YKR
 aj8Xf5oMvAj/M0nl6RYn4tEV+q5XZph5ElFtGn6zuYwtT80dp1+jw9e5RCPF9w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] drm/bridge: bridge-connector: get/put the stored bridges
Date: Thu, 25 Sep 2025 19:19:48 +0200
Message-Id: <20250925-drm-bridge-alloc-getput-bridge-connector-v1-0-f0736e1c73ee@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALR51WgC/zWNQQqDMBBFryKz7oAGI22vUrqIk4kO2EQmaRHEu
 xsKLt9/8N8OmVU4w7PZQfknWVKs0N0aoNnFiVF8ZTCtse3DWPT6wVHFV+OWJRFOXNZvuTZKMTK
 VpGjtEO6eut6FHurdqhxk+6de7+M4AQzlG016AAAA
X-Change-ID: 20250925-drm-bridge-alloc-getput-bridge-connector-556f8dc14af4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
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

This series ensures the bridge-connector gets a reference to bridges when
storing a pointer to them, and releases them afterwards.

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [1].
Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
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
       5. ➜ drm_bridge_connector_init
       6. protect encoder bridge chain with a mutex
       7. of_drm_find_bridge
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. ➜ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list removed bridges (drm-misc-next)
 2. … handle gracefully atomic updates during bridge removal
 3. … DSI host-device driver interaction
 4. removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

This was tricky both because there is no central place in
drm_bridge_connector.c to put the references on disposal (handled by patch
1) and because of the complex code flow of drm_bridge_connector_init()
(handled by patch 2).

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      drm/connector: allow a .destroy callback for drmm-allocated connectors
      drm/display: bridge-connector: get/put the stored bridges

 drivers/gpu/drm/display/drm_bridge_connector.c | 112 +++++++++++++++++--------
 drivers/gpu/drm/drm_connector.c                |   6 +-
 2 files changed, 78 insertions(+), 40 deletions(-)
---
base-commit: 063db451832b8849faf1b0b8404b3a6a39995b29
change-id: 20250925-drm-bridge-alloc-getput-bridge-connector-556f8dc14af4

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

