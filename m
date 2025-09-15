Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199CFB575DF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5E410E3CB;
	Mon, 15 Sep 2025 10:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gSzJDiXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB63210E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:14:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 30A451A0E12;
 Mon, 15 Sep 2025 10:14:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0491F6063F;
 Mon, 15 Sep 2025 10:14:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7526C102F2AA2; 
 Mon, 15 Sep 2025 12:13:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757931240; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=ClgjtsTa+fjb0PUWeFBk56M8yGoBllTGlfLie6WA88E=;
 b=gSzJDiXBgTlxZCdVMadgiYCy81b2QDR7BjERq14Ho2oRJniBwV7alxdJdLRufitoTXem3+
 XoZVRJSLtgIOg3k5j45NDUBG6HHD+iJ1LravybZSyVAgxwbcvIO/bWNE2Qs2m3LoEeGLKI
 5rTCFWgGRMDLlY/oQ3nFrwVkMkHbMjxkkJ+tQ0oi/XdrXgNuS98XriuUqkf4zmPbDxFEps
 VeSfHeMuNwBbBoow+ZOmx3u3DZdaOxvb2aJ0Yb+cJcZ3N0KqDr3bT+GrW12+vmxT3EJd2n
 soM4fz6OPESSy0pho/drROUJhyCgTIyQ/fu0UZ5qJE9OT+6pC9PnxWCsv2pvfQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v9 0/3] drm/bridge: debugfs: show refcount and list removed
 bridges
Date: Mon, 15 Sep 2025 12:12:45 +0200
Message-Id: <20250915-drm-bridge-debugfs-removed-v9-0-6e5c0aff5de9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ3mx2gC/32P22rEIBCGXyV4XYuag5qrvkcpi4cxEZK4a4y0L
 Hn3mmyh7M3eDPwz8M3339EK0cOK+uqOImS/+rCUIN8qZEa1DIC9LRkxwlrSEIFtnLGO3paLBb0
 NbsUR5pDBYtZy6YRk0OgaFcA1gvPfJ/zz65Ej3LbyIz2WSKsVsAnz7FNfMcsctYY3xmmtGyGpE
 s52XUeYNJ0zIFmZzh7oU4fTJx01TcHgAdJ1S9iFeAFlxsvf0dGGKqBcd63qM0OHz+jXFOLP2T3
 zU+jkCipf1cwcEyw54eQoLLn40CGkyS/vpckJzuIfJil7CRMF1pq6toIbo9v2Gbbv+y8lj3djo
 wEAAA==
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

This series shows removed bridges to the global <debugfs>/dri/bridges file.
Removed bridges are bridges after drm_bridges_remove() but before they are
eventually freed on the last drm_bridge_put().

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [1].
Here's the work breakdown (➜ marks the current series):

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
       3. …✔ drm_bridge_get_next_bridge() (partially in drm-misc-next)
       4. …✔ drm_for_each_bridge_in_chain() (partially in drm-misc-next)
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
   Reason: trivial conflict in context (drm_for_each_bridge_in_chain_scoped())

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v9:
- Renamed leftover instances of "removed" to "lingering"
- Added Maxime R-by
- Link to v8: https://lore.kernel.org/r/20250912-drm-bridge-debugfs-removed-v8-0-5c33d87ccb55@bootlin.com

Changes in v8:
- Removed patch 1, now in drm-misc-next
- Renamed "removed" -> "lingering"
- Rewrote documentation changes to use "register" in lieu of "publish",
  split them to a separate patch
- Link to v7: https://lore.kernel.org/r/20250819-drm-bridge-debugfs-removed-v7-0-970702579978@bootlin.com

This series was initially part of v6 of this other series:
- Link to v6: https://lore.kernel.org/dri-devel/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/

---
Luca Ceresoli (3):
      drm/bridge: add list of removed refcounted bridges
      drm/debugfs: show lingering bridges
      drm/bridge: adapt drm_bridge_add/remove() docs, mention the lingering list

 drivers/gpu/drm/drm_bridge.c | 46 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)
---
base-commit: 2d2f1dc74cfbbb4891a8fd666029c6fce926fcfd
change-id: 20250408-drm-bridge-debugfs-removed-2579f892e4b3

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

