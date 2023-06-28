Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D62740941
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 07:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDBB10E356;
	Wed, 28 Jun 2023 05:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091C910E354
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 05:21:50 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E1BF03224D2;
 Wed, 28 Jun 2023 06:21:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1687929708; bh=qI5o564wKTDAHbBz4M1qvgS+Ng4J7DHrYPOXfzvG99o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fq9SaTAtiUeEymK2zX2UR6vbBNZKW8oO/y/dX1fIXR4rdc98xAM74aZzGs7sQUmBN
 KyE+XJsZg80GxhFlI/O3dOzl5Or/053Xow51I8v0NsVk1iGq1Yqngn33mPxYxthnES
 1GFIzECNdDI4E85615mQTlXrLIUZKsbK4YT1Io44EdDvSNdQRTA3FKmHDOlfGcWYez
 zECaSlQSKNfS/uG27OejmS/69ON/MtWfbHx1cI5+Fw6ySkTtupdqxZ86E9v3tLwWBP
 VZr/5GbvRK5u/b7PEXPMLPJvVhDk4WaBOUtK4rhG7G31NrIR2ngrEkIr3PwqrEDAa9
 4E8zVUUQdLLPg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/8] drm/vmwgfx: Use the hotspot properties from cursor
 planes
Date: Wed, 28 Jun 2023 01:21:28 -0400
Message-Id: <20230628052133.553154-4-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628052133.553154-1-zack@kde.org>
References: <20230628052133.553154-1-zack@kde.org>
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
Cc: javierm@redhat.com, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Port the legacy kms hotspot handling to the new properties
on cursor planes.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index b62207be3363..de294dfe05d0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -768,13 +768,8 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
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
-- 
2.39.2

