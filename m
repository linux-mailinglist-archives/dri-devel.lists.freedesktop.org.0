Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3967B6B9C52
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 17:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA22E10E175;
	Tue, 14 Mar 2023 16:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3828A10E175
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 16:57:34 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:51764.1378362099
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 1024910029F;
 Wed, 15 Mar 2023 00:57:25 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-698c9d7bb7-s8g24 with ESMTP id
 9cace5e29154469986979a83f13f6eed for maarten.lankhorst@linux.intel.com; 
 Wed, 15 Mar 2023 00:57:32 CST
X-Transaction-ID: 9cace5e29154469986979a83f13f6eed
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 liyi <liyi@loongson.cn>
Subject: [PATCH] drm/vram-helper: remove a redundant iosys_map_clear call in
 move_notify
Date: Wed, 15 Mar 2023 00:57:22 +0800
Message-Id: <20230314165722.2290209-1-15330273260@189.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 As it is already called in ttm_bo_vunmap()

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 0bea3df2a16d..b0c2a7ef91bf 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -558,7 +558,6 @@ static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo)
 		return;
 
 	ttm_bo_vunmap(bo, &gbo->map);
-	iosys_map_clear(&gbo->map); /* explicitly clear mapping for next vmap call */
 }
 
 static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
-- 
2.25.1

