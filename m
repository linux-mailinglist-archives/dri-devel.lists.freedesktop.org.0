Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F0357A0A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 04:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE206E9E5;
	Thu,  8 Apr 2021 02:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A71C6E9E5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 02:06:50 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FG4MS0NXRzyNgH;
 Thu,  8 Apr 2021 10:04:36 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 10:06:39 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <robert.foss@linaro.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: simplify devm_drm_panel_bridge_add_typed
Date: Thu, 8 Apr 2021 10:07:04 +0800
Message-ID: <1617847624-53611-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
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
Cc: Tian Tao <tiantao6@hisilicon.com>, dri-devel@lists.freedesktop.org,
 Yicong Yang <yangyicong@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_add_action_or_reset() instead of devres_alloc() and
devres_add(), which works the same. This will simplify the
code. There is no functional changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/gpu/drm/bridge/panel.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index c916f4b..e5ddefb 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -250,11 +250,9 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 
-static void devm_drm_panel_bridge_release(struct device *dev, void *res)
+static void devm_drm_panel_bridge_release(void *bridge)
 {
-	struct drm_bridge **bridge = res;
-
-	drm_panel_bridge_remove(*bridge);
+	drm_panel_bridge_remove(bridge);
 }
 
 /**
@@ -295,20 +293,17 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
 						   u32 connector_type)
 {
-	struct drm_bridge **ptr, *bridge;
-
-	ptr = devres_alloc(devm_drm_panel_bridge_release, sizeof(*ptr),
-			   GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+	struct drm_bridge *bridge;
+	int ret;
 
 	bridge = drm_panel_bridge_add_typed(panel, connector_type);
-	if (!IS_ERR(bridge)) {
-		*ptr = bridge;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+	if (IS_ERR(bridge))
+		return bridge;
+
+	ret = devm_add_action_or_reset(dev, devm_drm_panel_bridge_release,
+				       bridge);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return bridge;
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
