Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0DE6C8C4C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 08:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F1510E14A;
	Sat, 25 Mar 2023 07:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4907B10E029
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 07:46:43 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:33334.1902543559
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id BAD471001EF;
 Sat, 25 Mar 2023 15:46:36 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 5e01f141a15042c193eaa3c38bd182e1 for maarten.lankhorst@linux.intel.com; 
 Sat, 25 Mar 2023 15:46:38 CST
X-Transaction-ID: 5e01f141a15042c193eaa3c38bd182e1
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 liyi <liyi@loongson.cn>
Subject: [PATCH] drm/fbdev-generic: optimize out a redundant assignment clause
Date: Sat, 25 Mar 2023 15:46:36 +0800
Message-Id: <20230325074636.136833-1-15330273260@189.cn>
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

 The assignment already done in drm_client_buffer_vmap(),
 just trival clean, no functional change.

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 4d6325e91565..1da48e71c7f1 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -282,7 +282,7 @@ static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
 				 struct drm_clip_rect *clip)
 {
 	struct drm_client_buffer *buffer = fb_helper->buffer;
-	struct iosys_map map, dst;
+	struct iosys_map map;
 	int ret;
 
 	/*
@@ -302,8 +302,7 @@ static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
 	if (ret)
 		goto out;
 
-	dst = map;
-	drm_fbdev_damage_blit_real(fb_helper, clip, &dst);
+	drm_fbdev_damage_blit_real(fb_helper, clip, &map);
 
 	drm_client_buffer_vunmap(buffer);
 
-- 
2.25.1

