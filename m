Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 199ED37A1F8
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 10:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6277E6E9F7;
	Tue, 11 May 2021 08:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDD86E9F2;
 Tue, 11 May 2021 08:29:06 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfWHK1jwPzlbM5;
 Tue, 11 May 2021 16:26:53 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 16:28:56 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Pierre Moreau <pierre.morrow@free.fr>, dri-devel
 <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/nouveau: Fix error return code in
 nouveau_backlight_init()
Date: Tue, 11 May 2021 16:28:41 +0800
Message-ID: <20210511082841.4181-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210511082841.4181-1-thunder.leizhen@huawei.com>
References: <20210511082841.4181-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix to return a negative error code from the error handling case instead
of 0, as done elsewhere in this function.

Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
Suggested-by: Pierre Moreau <pierre.morrow@free.fr>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d1c998e645fb4b6..f0856adbe775624 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -47,20 +47,20 @@ struct nouveau_backlight {
 	int id;
 };
 
-static bool
+static int
 nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
 			   struct nouveau_backlight *bl)
 {
 	int nb = ida_simple_get(&bl_ida, 0, 100, GFP_KERNEL);
 
 	if (nb < 0)
-		return false;
+		return nb;
 	if (nb > 0)
 		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
 	else
 		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
 	bl->id = nb;
-	return true;
+	return 0;
 }
 
 static int
@@ -273,7 +273,8 @@ nouveau_backlight_init(struct drm_connector *connector)
 	if (!bl)
 		return -ENOMEM;
 
-	if (!nouveau_get_backlight_name(backlight_name, bl)) {
+	ret = nouveau_get_backlight_name(backlight_name, bl);
+	if (ret) {
 		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
 		goto fail_alloc;
 	}
-- 
2.26.0.106.g9fadedd


