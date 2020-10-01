Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0102527F862
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 06:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0CF898BE;
	Thu,  1 Oct 2020 04:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4709898BE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 04:20:20 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-zOUQyz4KMgO_z5IwOoM56Q-1; Thu, 01 Oct 2020 00:20:15 -0400
X-MC-Unique: zOUQyz4KMgO_z5IwOoM56Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BA4E1084D67;
 Thu,  1 Oct 2020 04:20:14 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC44410013C4;
 Thu,  1 Oct 2020 04:20:13 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	sroland@vmware.com
Subject: [PATCH] drm/vmwgfx: fix regression in thp code due to ttm init
 refactor.
Date: Thu,  1 Oct 2020 14:20:12 +1000
Message-Id: <20201001042012.13114-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
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

When I refactored this code with the new init paths, I failed to
set the funcs back up properly, this caused a failure to bringup
gdm properly.

Fixes: 252f8d7b9174 ("drm/vmwgfx/ttm: convert vram mm init to new code paths")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 63fe7da4cbf4..c158e672b762 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -26,6 +26,8 @@ static struct vmw_thp_manager *to_thp_manager(struct ttm_resource_manager *man)
 	return container_of(man, struct vmw_thp_manager, manager);
 }
 
+static const struct ttm_resource_manager_func vmw_thp_func;
+
 static int vmw_thp_insert_aligned(struct drm_mm *mm, struct drm_mm_node *node,
 				  unsigned long align_pages,
 				  const struct ttm_place *place,
@@ -132,6 +134,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 	ttm_resource_manager_init(&rman->manager,
 				  dev_priv->vram_size >> PAGE_SHIFT);
 
+	rman->manager.func = &vmw_thp_func;
 	drm_mm_init(&rman->mm, 0, rman->manager.size);
 	spin_lock_init(&rman->lock);
 
@@ -171,7 +174,7 @@ static void vmw_thp_debug(struct ttm_resource_manager *man,
 	spin_unlock(&rman->lock);
 }
 
-const struct ttm_resource_manager_func vmw_thp_func = {
+static const struct ttm_resource_manager_func vmw_thp_func = {
 	.alloc = vmw_thp_get_node,
 	.free = vmw_thp_put_node,
 	.debug = vmw_thp_debug
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
