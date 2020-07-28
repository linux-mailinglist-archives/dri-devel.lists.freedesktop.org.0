Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5434230059
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 05:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27E36E159;
	Tue, 28 Jul 2020 03:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D5E6E159
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:43:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-xMSofP5kOAGMCvRWJWTQvg-1; Mon, 27 Jul 2020 23:42:58 -0400
X-MC-Unique: xMSofP5kOAGMCvRWJWTQvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94B54801A03;
 Tue, 28 Jul 2020 03:42:57 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51CFD1C6;
 Tue, 28 Jul 2020 03:42:56 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] ttm: ttm_bo_swapout_all doesn't use it's argument.
Date: Tue, 28 Jul 2020 13:42:54 +1000
Message-Id: <20200728034254.20114-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Just drop the argument from this.

This does ask the question if this is the function vmwgfx
should be using or should it be doing an evict all like
the other drivers.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c        | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 include/drm/ttm/ttm_bo_api.h        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index b03747717ec7..f297fd5e02d4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1838,7 +1838,7 @@ int ttm_bo_swapout(struct ttm_bo_global *glob, struct ttm_operation_ctx *ctx)
 }
 EXPORT_SYMBOL(ttm_bo_swapout);
 
-void ttm_bo_swapout_all(struct ttm_bo_device *bdev)
+void ttm_bo_swapout_all(void)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 470428387878..fb39826f72c1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1352,7 +1352,7 @@ static int vmw_pm_freeze(struct device *kdev)
 	vmw_execbuf_release_pinned_bo(dev_priv);
 	vmw_resource_evict_all(dev_priv);
 	vmw_release_device_early(dev_priv);
-	ttm_bo_swapout_all(&dev_priv->bdev);
+	ttm_bo_swapout_all();
 	if (dev_priv->enable_fb)
 		vmw_fifo_resource_dec(dev_priv);
 	if (atomic_read(&dev_priv->num_fifo_resources) != 0) {
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index b1c705a93517..a9e13b252820 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -692,7 +692,7 @@ ssize_t ttm_bo_io(struct ttm_bo_device *bdev, struct file *filp,
 
 int ttm_bo_swapout(struct ttm_bo_global *glob,
 			struct ttm_operation_ctx *ctx);
-void ttm_bo_swapout_all(struct ttm_bo_device *bdev);
+void ttm_bo_swapout_all(void);
 
 /**
  * ttm_bo_uses_embedded_gem_object - check if the given bo uses the
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
