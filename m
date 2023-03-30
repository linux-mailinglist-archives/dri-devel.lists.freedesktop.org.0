Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB3A6CFEF7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 10:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B6810E191;
	Thu, 30 Mar 2023 08:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE18F10E191
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 08:49:23 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:44746.1405145320
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id B21471002EE;
 Thu, 30 Mar 2023 16:49:21 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-ljp89 with ESMTP id
 14a233d3256440669eb13540df3b3627 for maarten.lankhorst@linux.intel.com; 
 Thu, 30 Mar 2023 16:49:22 CST
X-Transaction-ID: 14a233d3256440669eb13540df3b3627
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH 2/3] drm/drm_gem.c: remove surplus else after return clause
Date: Thu, 30 Mar 2023 16:49:10 +0800
Message-Id: <20230330084911.1565071-2-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330084911.1565071-1-15330273260@189.cn>
References: <20230330084911.1565071-1-15330273260@189.cn>
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
Cc: linaro-mm-sig@lists.linaro.org, loongson-kernel@lists.loongnix.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

 else is not generally useful after return

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
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

