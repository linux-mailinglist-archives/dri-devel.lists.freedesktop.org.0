Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76225B2BDFD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA4F10E2A3;
	Tue, 19 Aug 2025 09:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Z/Q3idA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ADF10E583
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:50:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6B75EC6B390;
 Tue, 19 Aug 2025 09:42:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D94DC60697;
 Tue, 19 Aug 2025 09:42:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34A3B1C22CE69; 
 Tue, 19 Aug 2025 11:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755596553; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=hBqpzbi2Hbxep2bpOtuW7wxw+5uHsx1EqMbGij/dqlY=;
 b=Z/Q3idA+5YgF8Yk+dEOhSqk2M7AgHRazWxtmeOgN0JOjGzjp08Y4spxeBbmPR4zfDuZ6Ix
 xnPnafOMv1Kyop1KlWumZQoku9SeU4p/WnryCJEBDuSjthjXd6K2MSwj1baIf6W4+0+tvv
 D+2QdLlalG+Dr0lYoyevO/AtJoX+zKDvazv9YmHTB/Xzcbznizew8Oph/NO5G0WN3iXkXt
 P9gynn/rBiZZsGrG0QDUiSYK1dhffzOjxYXGHlOgFoV2ceIGlsTxsPq8W0jojtqJQevtr2
 cq1x6ps4DP4TRmCrDHUFksUFCPMqNWgUjQL2Ct0MuSBJRZujUHwGSwbivIDbgQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v7 0/3] drm/bridge: debugfs: show refcount and list removed
 bridges
Date: Tue, 19 Aug 2025 11:42:09 +0200
Message-Id: <20250819-drm-bridge-debugfs-removed-v7-0-970702579978@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPFGpGgC/1WOS4rDMBBEr2K0HoG+luOrhBBarZYjiCNHss1Ay
 N1H+Wxm+argVT1YpZKosrF7sEJ7qinfGrifjuEFbhPxFBozJZQVRgw8lJn7kkJrAvltipUXmvN
 OgSvrDnE4KDJesyZYCsX0+5YfTx8udN/axvoJmYdKHPM8p3XscEACo50kSwhaYICh7wWA91o7Z
 1wAj1aGl/p9x8l/d+B6zcgnWpdt5TGXMwFezt8ySiOBpPO9hXFX7PR8/gFee77X/AAAAA==
X-Change-ID: 20250408-drm-bridge-debugfs-removed-2579f892e4b3
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

This series shows removed bridges to the global <debugfs>/dri/bridges file,
and shows the bridge refcount.  Removed bridges are bridges after
drm_bridges_remove() but before they are eventually freed on the last
drm_bridge_put().

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [1].
Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17-rc1)
    C. ✔ kunit tests (v6.17-rc1)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17-rc1)
    E. … add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
            (drm-misc-next)
       2. ✔ drm_bridge_get_prev_bridge() (drm-misc-next)
       3. … drm_bridge_get_next_bridge()
       4. … drm_for_each_bridge_in_chain()
       5. drm_bridge_connector_init
       6. of_drm_find_bridge
       7. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. ➜ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ➜ show refcount and list removed bridges
 2. … handle gracefully atomic updates during bridge removal
 3. … DSI host-device driver interaction
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

To show the removed bridges we need to keep track of them, thus add a new
global list to store them between drm_bridge_remove() and the eventual
free. This is bit tricky in case a bridge is removed and then re-added
before being freed. This is handled in patch 2.

This series  depends on one other series:
 * [PATCH v2 0/9] drm/bridge: get/put the bridge when looping over the encoder chain
   Link: https://lore.kernel.org/r/20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com
   Reason: it uses drm_for_each_bridge_in_chain_scoped()

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
This series was initially part of v6 of this other series:
- Link to v6: https://lore.kernel.org/dri-devel/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/

---
Luca Ceresoli (3):
      drm/debugfs: bridges_show: show refcount
      drm/bridge: add list of removed refcounted bridges
      drm/debugfs: show removed bridges

 drivers/gpu/drm/drm_bridge.c | 47 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)
---
base-commit: c8cea4371e5eca30cda8660aabb337747dabc51d
change-id: 20250408-drm-bridge-debugfs-removed-2579f892e4b3

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

