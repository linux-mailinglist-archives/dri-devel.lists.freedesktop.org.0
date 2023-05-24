Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC6170FF8D
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F2510E078;
	Wed, 24 May 2023 21:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Wed, 24 May 2023 21:00:48 UTC
Received: from luna.linkmauve.fr (unknown
 [IPv6:2a01:e0a:828:c7c0:e2d5:5eff:fe2d:8e8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B822010E078
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 21:00:48 +0000 (UTC)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 4C4E87AF8BC; Wed, 24 May 2023 22:54:53 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Azkali Manad <a.ffcc7@gmail.com>
Subject: [PATCH] drm/tegra: dc: cap non-cursor plane zpos to 254
Date: Wed, 24 May 2023 22:54:46 +0200
Message-Id: <20230524205446.1778614-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since cursor plane has the immutable zpos 255, other planes can’t take
its place so we can cap them to 254 instead.

Thanks emersion!

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/gpu/drm/tegra/dc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 6e78416e64b0..e9a416fb4db7 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -838,7 +838,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
@@ -1292,7 +1292,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
-- 
2.40.1

