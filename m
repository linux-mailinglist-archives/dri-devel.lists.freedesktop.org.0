Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E182F2401C7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 07:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAAF6E177;
	Mon, 10 Aug 2020 05:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24516E177
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:42:25 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-Lx4OAyyoMeqDCX6u26tYww-1; Mon, 10 Aug 2020 01:41:15 -0400
X-MC-Unique: Lx4OAyyoMeqDCX6u26tYww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 245351DE2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:41:14 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-169.bne.redhat.com
 [10.64.54.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A7E2289B5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 05:41:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx/ttm: fix the non-THP cleanup path.
Date: Mon, 10 Aug 2020 15:41:10 +1000
Message-Id: <20200810054110.4192239-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

I fixed the init path, but missed the cleanup path.

Fixes: e0830704de7c ("drm/vmwgfx: takedown vram manager")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index a68ae0204bf5..2c4858ea89b1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -639,7 +639,7 @@ static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	vmw_thp_fini(dev_priv);
 #else
-	ttm_bo_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
 #endif
 }
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
