Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6398373413
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 05:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1936E413;
	Wed,  5 May 2021 03:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C36C6E40C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 03:57:43 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 4 May 2021 20:57:40 -0700
Received: from vertex.localdomain (unknown [10.21.250.233])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id A78D22047D;
 Tue,  4 May 2021 20:57:41 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/vmwgfx: Fix incorrect enum usage
Date: Tue, 4 May 2021 23:57:35 -0400
Message-ID: <20210505035740.286923-2-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505035740.286923-1-zackr@vmware.com>
References: <20210505035740.286923-1-zackr@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: krastevm@vmware.com, sroland@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SVGA_REG_ENABLE is a register name, and SVGA_REG_ENABLE_(ENABLE|
DISABLE|HIDE) are its valid values. We were incorrectly setting
the register value to itself. This happened to work because
the SVGA_REG_ENABLE is happens to to be the same value as
SVGA_REG_ENABLE_ENABLE, but is still semantically incorrect.
Lets use the correct enum when setting SVGA_REG_ENABLE.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 7805ba0e1c49..1b27d7f7fcfa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1179,7 +1179,7 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
 	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 
 	if (!ttm_resource_manager_used(man)) {
-		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
+		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE_ENABLE);
 		ttm_resource_manager_set_used(man, true);
 	}
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
