Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3AA4CA8FF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C5110E1AF;
	Wed,  2 Mar 2022 15:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184C510E11D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 15:24:43 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 74E6D2872A2;
 Wed,  2 Mar 2022 15:24:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1646234681; bh=s3gzlHrhBJIsPWq/5ffBiP7iu7APqAbkJV/LhoPQ5nA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bnEpAb67Wg+CjV1afjhF93JSo9Oew/GGi2L7W26fQz7OCw9lcrgsuhuxQoGePQafO
 QoU01zAHVBW8ZA+EdjKPr0crpJcx4UclEdOASnKXj3rSZ8N/P5IZWyh7CMkafSKlSV
 nt3yka4VbBxV+Gja4kcvECuhvBiPpz5oMoPfG8PFk3NYUhEclEj56zzXvq5p9jQNCV
 Gwyuw4ED1YkO9RtuU48F6D0tOACUqfIXczLfmxR9f+j29ram+ibn4HXzHuT6l20Q7c
 uVqhVCPGDlYFjGrBJg6WPq4GR1H+RYBusYdR8+6alFBlXfLaXF26ovaNpRVpFwzOzc
 /xFp9bcVSuT1g==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/vmwgfx: Print capabilities early during the
 initialization
Date: Wed,  2 Mar 2022 10:24:21 -0500
Message-Id: <20220302152426.885214-4-zack@kde.org>
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

Capabilities were logged at the end of initialization so any early errors
would make them not appear in the logs. Which is also when they're needed
the most.
Print the the capabilities right after fetching them, before the init
code starts using them to make sure they always show up in the logs.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 621231c66fd4..f43afd56915e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -848,12 +848,16 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 
 
 	dev_priv->capabilities = vmw_read(dev_priv, SVGA_REG_CAPABILITIES);
-
+	vmw_print_bitmap(&dev_priv->drm, "Capabilities",
+			 dev_priv->capabilities,
+			 cap1_names, ARRAY_SIZE(cap1_names));
 	if (dev_priv->capabilities & SVGA_CAP_CAP2_REGISTER) {
 		dev_priv->capabilities2 = vmw_read(dev_priv, SVGA_REG_CAP2);
+		vmw_print_bitmap(&dev_priv->drm, "Capabilities2",
+				 dev_priv->capabilities2,
+				 cap2_names, ARRAY_SIZE(cap2_names));
 	}
 
-
 	ret = vmw_dma_select_mode(dev_priv);
 	if (unlikely(ret != 0)) {
 		drm_info(&dev_priv->drm,
@@ -939,14 +943,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		 "MOB limits: max mob size = %u kB, max mob pages = %u\n",
 		 dev_priv->max_mob_size / 1024, dev_priv->max_mob_pages);
 
-	vmw_print_bitmap(&dev_priv->drm, "Capabilities",
-			 dev_priv->capabilities,
-			 cap1_names, ARRAY_SIZE(cap1_names));
-	if (dev_priv->capabilities & SVGA_CAP_CAP2_REGISTER)
-		vmw_print_bitmap(&dev_priv->drm, "Capabilities2",
-				 dev_priv->capabilities2,
-				 cap2_names, ARRAY_SIZE(cap2_names));
-
 	ret = vmw_dma_masks(dev_priv);
 	if (unlikely(ret != 0))
 		goto out_err0;
-- 
2.32.0

