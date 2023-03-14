Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA386B94EE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3FC10E7CF;
	Tue, 14 Mar 2023 12:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBD5110E7CF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:53:16 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:37148.1527112473
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 01481100210;
 Tue, 14 Mar 2023 20:53:07 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-698c9d7bb7-s8g24 with ESMTP id
 b02789160bc149b7bddb9270b1f317fc for maarten.lankhorst@linux.intel.com; 
 Tue, 14 Mar 2023 20:53:13 CST
X-Transaction-ID: b02789160bc149b7bddb9270b1f317fc
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 liyi <liyi@loongson.cn>
Subject: [PATCH] drm/drm_gem.c: remove surplus else after return clause
Date: Tue, 14 Mar 2023 20:53:05 +0800
Message-Id: <20230314125305.2278964-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 else is not generally useful after return

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 drivers/gpu/drm/drm_gem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a6208e2c089b..364e3733af98 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1150,8 +1150,8 @@ int drm_gem_pin(struct drm_gem_object *obj)
 {
 	if (obj->funcs->pin)
 		return obj->funcs->pin(obj);
-	else
-		return 0;
+
+	return 0;
 }
 
 void drm_gem_unpin(struct drm_gem_object *obj)
@@ -1172,7 +1172,8 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	ret = obj->funcs->vmap(obj, map);
 	if (ret)
 		return ret;
-	else if (iosys_map_is_null(map))
+
+	if (iosys_map_is_null(map))
 		return -ENOMEM;
 
 	return 0;
-- 
2.25.1

