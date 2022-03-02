Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F020C4CA905
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7658210E459;
	Wed,  2 Mar 2022 15:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52F910E378
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 15:24:46 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 21B7228729D;
 Wed,  2 Mar 2022 15:24:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1646234685; bh=VaoQAWlNKWhjTgJFA1lyXvXwkZMBG56WRFcxaVNCQbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HakD2jdkmQPOKPIIZ6TgzAobbCEdgm1hJruZrOqzWQDWH3KSACnTLBvlSF0J/SZ6c
 fVh362Xq2cnsBkXZz1q4yzbnU/+bOo0RwfAh0dlrIQWZJ1TcCRBf1oi4V5eBfdQObE
 CKOvqR7X2VYmvZZj8fjY1QvGfti6LybaF9AfeCkUFL9fvLKDJY9boj3b0VgnLbJalG
 GpHLr2NJj2mcldpkRiQVc2MFI71voWt/Ha3jGHOoeCE6NUUs8PY9spHj5N4Z4JGXQX
 T6RbDpOxUJAuEgiJAr+sTlgUgi8a/BctrfAqw7uXndTE7Q4XNon7faPm8lAzScRPTD
 Qy0DMo6Nx1eLw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/vmwgfx: Stop using surface dma commands on most
 configurations
Date: Wed,  2 Mar 2022 10:24:26 -0500
Message-Id: <20220302152426.885214-9-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302152426.885214-1-zack@kde.org>
References: <20220302152426.885214-1-zack@kde.org>
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

Initial version of guest backed objects in the host had some performance
issues that made using surface-dma's instead of direct copies faster.
Surface dma's force a migration to vram which at best is slow and at
worst is impossible (e.g. on svga3 where there's not enough vram
to migrate fb's to it).

Slowly migrate away from surface dma's to direct copies by limiting
their usage to systems with more than 32MB of vram.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 42b5ecb0c5e9..eb014b97d156 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -138,6 +138,11 @@ static void vmw_stdu_destroy(struct vmw_screen_target_display_unit *stdu);
  * Screen Target Display Unit CRTC Functions
  *****************************************************************************/
 
+static bool vmw_stdu_use_cpu_blit(const struct vmw_private *vmw)
+{
+	return !(vmw->capabilities & SVGA_CAP_3D) || vmw->vram_size < (32 * 1024 * 1024);
+}
+
 
 /**
  * vmw_stdu_crtc_destroy - cleans up the STDU
@@ -689,7 +694,7 @@ int vmw_kms_stdu_dma(struct vmw_private *dev_priv,
 		container_of(vfb, struct vmw_framebuffer_bo, base)->buffer;
 	struct vmw_stdu_dirty ddirty;
 	int ret;
-	bool cpu_blit = !(dev_priv->capabilities & SVGA_CAP_3D);
+	bool cpu_blit = vmw_stdu_use_cpu_blit(dev_priv);
 	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
 
 	/*
@@ -1164,7 +1169,7 @@ vmw_stdu_primary_plane_prepare_fb(struct drm_plane *plane,
 	 * so cache these mappings
 	 */
 	if (vps->content_fb_type == SEPARATE_BO &&
-	    !(dev_priv->capabilities & SVGA_CAP_3D))
+	    vmw_stdu_use_cpu_blit(dev_priv))
 		vps->cpp = new_fb->pitches[0] / new_fb->width;
 
 	return 0;
@@ -1368,7 +1373,7 @@ static int vmw_stdu_plane_update_bo(struct vmw_private *dev_priv,
 	bo_update.base.vfb = vfb;
 	bo_update.base.out_fence = out_fence;
 	bo_update.base.mutex = NULL;
-	bo_update.base.cpu_blit = !(dev_priv->capabilities & SVGA_CAP_3D);
+	bo_update.base.cpu_blit = vmw_stdu_use_cpu_blit(dev_priv);
 	bo_update.base.intr = false;
 
 	/*
-- 
2.32.0

