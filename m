Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C963E3A8C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 15:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A6F89A8B;
	Sun,  8 Aug 2021 13:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BF589A8B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 13:45:57 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/8] drm/ingenic: Remove dead code
Date: Sun,  8 Aug 2021 15:45:19 +0200
Message-Id: <20210808134526.119198-2-paul@crapouillou.net>
In-Reply-To: <20210808134526.119198-1-paul@crapouillou.net>
References: <20210808134526.119198-1-paul@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The priv->ipu_plane would get a different value further down the code,
without the first assigned value being read first; so the first
assignation can be dropped.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index d261f7a03b18..e42eb43d8020 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -984,9 +984,6 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	priv->dma_hwdescs->hwdesc_pal.cmd = JZ_LCD_CMD_ENABLE_PAL
 		| (sizeof(priv->dma_hwdescs->palette) / 4);
 
-	if (soc_info->has_osd)
-		priv->ipu_plane = drm_plane_from_index(drm, 0);
-
 	primary = priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
 
 	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
-- 
2.30.2

