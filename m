Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CD41FC734
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFA26E2F2;
	Wed, 17 Jun 2020 07:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m17617.mail.qiye.163.com (m17617.mail.qiye.163.com
 [59.111.176.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCE46E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 02:38:52 +0000 (UTC)
Received: from njvxl5505.vivo.xyz (unknown [157.0.31.125])
 by m17617.mail.qiye.163.com (Hmail) with ESMTPA id 65297261496;
 Wed, 17 Jun 2020 10:38:47 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm: remove drm_modeset_lock protection for drm_error
Date: Wed, 17 Jun 2020 10:38:40 +0800
Message-Id: <20200617023840.11637-1-bernard@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGhhDHkhOSU0fSBlMVkpOQklITUpOSUxOQ0NVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MyI6Tgw4CzgyMw4sM00VSxcM
 FxhPCUlVSlVKTkJJSE1KTklDS0pIVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSUtCSjcG
X-HM-Tid: 0a72c024a8f19375kuws65297261496
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function drm_atomic_helper_shutdown, maybe there is no need
to protect DRM_ERROR log in DRM_MODESET_LOCK_ALL_BEGIN &
DRM_MODESET_LOCK_ALL_END. This change is to make code run a bit
fast.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 85d163f16801..8902fd6316fc 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3100,12 +3100,10 @@ void drm_atomic_helper_shutdown(struct drm_device *dev)
 	int ret;
 
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
-
 	ret = drm_atomic_helper_disable_all(dev, &ctx);
+	DRM_MODESET_LOCK_ALL_END(ctx, ret);
 	if (ret)
 		DRM_ERROR("Disabling all crtc's during unload failed with %i\n", ret);
-
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
 }
 EXPORT_SYMBOL(drm_atomic_helper_shutdown);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
