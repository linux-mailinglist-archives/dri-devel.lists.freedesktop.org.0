Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F088446A2C6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC84973A7F;
	Mon,  6 Dec 2021 17:26:37 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163D673A4C
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:36 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 7D42629F4A3;
 Mon,  6 Dec 2021 17:26:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811595; bh=GjXhA0rYCRe4Z8sjxiDkR5OcGme+iJcSRFBER+aRZ0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=crbpx+6X9NPycIJB3q7lOlO/s7xAH5y5ZpDa/pm9iwrfWvQfd0OOBJtC/nMFao8Ge
 EGGv0EF2G5M6G48D1k9F9w/CoNzmA10vWmWw2zNt/3N4IicBss2KiDpNehX9bQKMpd
 DYjfeIZxG88HiQtioClzGNwU1gd2ymtjubxXces5laXOfdeYDT5uimcXOXCr5zLXyU
 K1hYBq9DKIzod4tcZkNZFLoemc+UPP5o27WGxJ6k6TzeDlDBf4PtW9at0EoQJW/xjv
 uoEXrq/GC/kJYhJTg2RTdhnl1M1z6rQc/0wvb/VJRDh1JfBDq6842pNdsBFBCr7yJP
 oPrNm0gElkeBw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 02/12] drm/vmwgfx: Add a debug callback to mobid resource
 manager
Date: Mon,  6 Dec 2021 12:26:10 -0500
Message-Id: <20211206172620.3139754-3-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206172620.3139754-1-zack@kde.org>
References: <20211206172620.3139754-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Mob/GMR id resource manager was lacking the debug print callback
which meant that during memory errors we weren't getting the details
which are needed to fix those errors.

Kernel logs need to contain the information about used/max pages
by the Mob/GMR id resource manager as well as the maximum number
of id's they're allowed to allocate.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index b2c4af331c9d..ebb4505a31a3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -42,6 +42,7 @@ struct vmwgfx_gmrid_man {
 	uint32_t max_gmr_ids;
 	uint32_t max_gmr_pages;
 	uint32_t used_gmr_pages;
+	uint8_t type;
 };
 
 static struct vmwgfx_gmrid_man *to_gmrid_manager(struct ttm_resource_manager *man)
@@ -132,6 +133,18 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
 	kfree(res);
 }
 
+static void vmw_gmrid_man_debug(struct ttm_resource_manager *man,
+				struct drm_printer *printer)
+{
+	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
+
+	BUG_ON(gman->type != VMW_PL_GMR && gman->type != VMW_PL_MOB);
+
+	drm_printf(printer, "%s's used: %u pages, max: %u pages, %u id's\n",
+		   (gman->type == VMW_PL_MOB) ? "Mob" : "GMR",
+		   gman->used_gmr_pages, gman->max_gmr_pages, gman->max_gmr_ids);
+}
+
 static const struct ttm_resource_manager_func vmw_gmrid_manager_func;
 
 int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
@@ -146,12 +159,12 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 	man = &gman->manager;
 
 	man->func = &vmw_gmrid_manager_func;
-	/* TODO: This is most likely not correct */
 	man->use_tt = true;
 	ttm_resource_manager_init(man, 0);
 	spin_lock_init(&gman->lock);
 	gman->used_gmr_pages = 0;
 	ida_init(&gman->gmr_ida);
+	gman->type = type;
 
 	switch (type) {
 	case VMW_PL_GMR:
@@ -190,4 +203,5 @@ void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type)
 static const struct ttm_resource_manager_func vmw_gmrid_manager_func = {
 	.alloc = vmw_gmrid_man_get_node,
 	.free = vmw_gmrid_man_put_node,
+	.debug = vmw_gmrid_man_debug
 };
-- 
2.32.0

