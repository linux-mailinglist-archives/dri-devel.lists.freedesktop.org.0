Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C2147628B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 21:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20DA10E45D;
	Wed, 15 Dec 2021 20:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289C910E45D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 20:02:38 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 737C12841E9;
 Wed, 15 Dec 2021 20:02:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1639598556; bh=EGdE6AlTiPorB9nCfwymHYgKluUiL6dlw63nY7or5ZE=;
 h=From:To:Cc:Subject:Date:From;
 b=C5oHD9JoborxpYc3ilZJMoM8whQxFTCG7o9O54fnlqvVXYBqEvC5gNOGCxWN971Oe
 in8DVVcULYYRc1DAGjiU4pwsEcxXJtHDn+EYTc16OLVhIYh0UCFDbgZHkmpaGepY15
 TVujZFWU+6CE372YEqo1JQQrEJ8V6EtOT/YYkXI70H+m3NhJxDu2wY2G6o5Us0NJTU
 EszzVMsudo8ln4IqK8Cr+ndBPiFS9rKGu2Tau3Eedi8hSCtRkpUwPTT7JSwJ7U3WhH
 H4Z6lB3++xCuxLBL9hUFnsJ2LGEa26YFWl0FcBtomTgAI0RN42GamwMIHy8XtaXSMw
 saO2jl/B5uDuA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Fix possible usage of an uninitialized variable
Date: Wed, 15 Dec 2021 15:02:24 -0500
Message-Id: <20211215200224.3693345-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Cc: krastevm@vmware.com, Dan Carpenter <dan.carpenter@oracle.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

vmw_user_bo_lookup can fail to lookup user buffers, especially because
the buffer handles come from the userspace. The return value has
to be checked before the buffers are put back.

This was spotted by Dan's Smatch statick checker:
    drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:574 vmw_user_bo_synccpu_release()
	error: uninitialized symbol 'vmw_bo'.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 15fead85450c..31aecc46624b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -568,10 +568,12 @@ static int vmw_user_bo_synccpu_release(struct drm_file *filp,
 	struct vmw_buffer_object *vmw_bo;
 	int ret = vmw_user_bo_lookup(filp, handle, &vmw_bo);
 
-	if (!(flags & drm_vmw_synccpu_allow_cs)) {
-		atomic_dec(&vmw_bo->cpu_writers);
+	if (!ret) {
+		if (!(flags & drm_vmw_synccpu_allow_cs)) {
+			atomic_dec(&vmw_bo->cpu_writers);
+		}
+		ttm_bo_put(&vmw_bo->base);
 	}
-	ttm_bo_put(&vmw_bo->base);
 
 	return ret;
 }
-- 
2.32.0

