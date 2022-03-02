Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0EF4CA900
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C050B10E52C;
	Wed,  2 Mar 2022 15:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19EA10E11D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 15:24:42 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id C679E287297;
 Wed,  2 Mar 2022 15:24:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1646234681; bh=V8eUzX43DhUQfu4aEgjqN49QCXk4XynlzQf/WzqRq40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JtKTrcmWuYVKx/ZsGcpTV5ToDb2mChALcnS6rQw2zQO8TYj7F7uyXhjW952I8T9zj
 hNJbgZ8tf85d2SlnUc6pkvpfNesmuXBYUwD0aBEUcisoHYMbAM54Pg7aroc+H8EMiG
 UrrCBys3oox/pTqXYskO1JlLZ/69+fba4PI2usMXJRrDhklosATQH6bpRIlPSqU3uR
 hQqSCGOZzTDhXrG91wal2IP/D3AQApcKOnyYThIoudY3uwXzTOZwbm9ymFot7rqLlE
 KU8//EgfkubFWV1CVpc46VZx2u29a48DFDYUMxlZtYXAVrFvDdNZhHfh5zKgUSdIbJ
 qIBAlKyKilxqw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/vmwgfx: Cleanup multimon initialization code
Date: Wed,  2 Mar 2022 10:24:20 -0500
Message-Id: <20220302152426.885214-3-zack@kde.org>
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

The results of the legacy display unit initialization were being silently
ignored. Unifying the selection of number of display units based
on whether the underlying device supports multimon makes it easier
to add error checking to all paths.

This makes the driver report the errors in ldu initialization paths
and try to recover from them.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 643c1608ddfd..e4347faccee0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -492,6 +492,8 @@ int vmw_kms_ldu_init_display(struct vmw_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
 	int i, ret;
+	int num_display_units = (dev_priv->capabilities & SVGA_CAP_MULTIMON) ?
+					VMWGFX_NUM_DISPLAY_UNITS : 1;
 
 	if (unlikely(dev_priv->ldu_priv)) {
 		return -EINVAL;
@@ -506,21 +508,17 @@ int vmw_kms_ldu_init_display(struct vmw_private *dev_priv)
 	dev_priv->ldu_priv->last_num_active = 0;
 	dev_priv->ldu_priv->fb = NULL;
 
-	/* for old hardware without multimon only enable one display */
-	if (dev_priv->capabilities & SVGA_CAP_MULTIMON)
-		ret = drm_vblank_init(dev, VMWGFX_NUM_DISPLAY_UNITS);
-	else
-		ret = drm_vblank_init(dev, 1);
+	ret = drm_vblank_init(dev, num_display_units);
 	if (ret != 0)
 		goto err_free;
 
 	vmw_kms_create_implicit_placement_property(dev_priv);
 
-	if (dev_priv->capabilities & SVGA_CAP_MULTIMON)
-		for (i = 0; i < VMWGFX_NUM_DISPLAY_UNITS; ++i)
-			vmw_ldu_init(dev_priv, i);
-	else
-		vmw_ldu_init(dev_priv, 0);
+	for (i = 0; i < num_display_units; ++i) {
+		ret = vmw_ldu_init(dev_priv, i);
+		if (ret != 0)
+			goto err_free;
+	}
 
 	dev_priv->active_display_unit = vmw_du_legacy;
 
-- 
2.32.0

