Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CED53BBBC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 17:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C1B112FEE;
	Thu,  2 Jun 2022 15:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F71112FDF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 15:42:58 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 324CC335F74;
 Thu,  2 Jun 2022 16:42:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1654184577; bh=T9HhNSfi5AnKwEfNZfuiXyCBSG+nQnnzb4aLUx3U6Mc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ft9wfIZQ+/5Q8mDVnVl4JlJga8ou2Q+rzoYUprPxSAOaucDx4aaDN2KWLNG+uRvWw
 E+86qlUXaYvKOs5IEceDeNCt38F07SeTT5dLnqv6vFX81e+KFediCUDzMcEqLZ/1nw
 Bp/m1KKfPcgaaVLfUd+X1c8hjQIuFHclA97opEeoHrs+EMbq6UxsdAC0R+UG4cfjhW
 DzoQufSRmlf1TX4w+MNPZO82PVn93hM9pn3+Sr4BphnD3+Y4RU+j7r77K+oVoJ0mZq
 ZIGZKNrslrkASVqPIiIWW6aNbEIhvvKJOiNiOykTxt7wO2pRRwcjROhiEX05gqj90K
 Tgxw69L6YCtmA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/vmwgfx: Create mouse hotspot properties on cursor
 planes
Date: Thu,  2 Jun 2022 11:42:39 -0400
Message-Id: <20220602154243.1015688-3-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602154243.1015688-1-zack@kde.org>
References: <20220602154243.1015688-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Drivers need to create those properties on cursor planes
which require the mouse hotspot coordinates.

Add the code creating hotspot properties and port away from old legacy
hotspot API. The legacy hotspot paths have an implementation that works
with new atomic properties so there's no reason to keep them and it
makes sense to unify both paths.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Martin Krastev <krastevm@vmware.com>
Cc: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 11 ++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 ++
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 693028c31b6b..a4cd312fee46 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -652,13 +652,8 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
 	s32 hotspot_x, hotspot_y;
 
-	hotspot_x = du->hotspot_x;
-	hotspot_y = du->hotspot_y;
-
-	if (new_state->fb) {
-		hotspot_x += new_state->fb->hot_x;
-		hotspot_y += new_state->fb->hot_y;
-	}
+	hotspot_x = du->hotspot_x + new_state->hotspot_x;
+	hotspot_y = du->hotspot_y + new_state->hotspot_y;
 
 	du->cursor_surface = vps->surf;
 	du->cursor_bo = vps->bo;
@@ -2270,8 +2265,6 @@ int vmw_du_crtc_gamma_set(struct drm_crtc *crtc,
 	int i;
 
 	for (i = 0; i < size; i++) {
-		DRM_DEBUG("%d r/g/b = 0x%04x / 0x%04x / 0x%04x\n", i,
-			  r[i], g[i], b[i]);
 		vmw_write(dev_priv, SVGA_PALETTE_BASE + i * 3 + 0, r[i] >> 8);
 		vmw_write(dev_priv, SVGA_PALETTE_BASE + i * 3 + 1, g[i] >> 8);
 		vmw_write(dev_priv, SVGA_PALETTE_BASE + i * 3 + 2, b[i] >> 8);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index e4347faccee0..43e89c6755b2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -474,6 +474,8 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 			(&connector->base,
 			 dev_priv->implicit_placement_property,
 			 1);
+	if (vmw_cmd_supported(dev_priv))
+		drm_plane_create_hotspot_properties(&cursor->base);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index c89ad3a2d141..8d46b0cbe640 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -932,6 +932,7 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 				   dev->mode_config.suggested_x_property, 0);
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
+	drm_plane_create_hotspot_properties(&cursor->base);
 	return 0;
 
 err_free_unregister:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index eb014b97d156..d940b9a525e7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1822,6 +1822,8 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 				   dev->mode_config.suggested_x_property, 0);
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
+	drm_plane_create_hotspot_properties(&cursor->base);
+
 	return 0;
 
 err_free_unregister:
-- 
2.34.1

