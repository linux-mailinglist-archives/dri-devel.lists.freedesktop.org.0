Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8177525BDC7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726E6E45D;
	Thu,  3 Sep 2020 08:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0C16E4A6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 13:17:37 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id AA9431A31B7;
 Wed,  2 Sep 2020 21:17:02 +0800 (CST)
Message-ID: <ADIABQBNDXyW8X9QUmo2xaoL.1.1599052622252.Hmail.bernard@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?W1JlLXNlbmRdW1BBVENIXSBncHUvZHJtOiByZW1vdmUgZHJtX21vZGVzZXRfbG9jayBwcm90ZWN0aW9uIGZvciBkcm1fZXJyb3I=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.124
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.124) ] by ajax-webmail (
 [127.0.0.1] ) ; Wed, 2 Sep 2020 21:17:02 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Wed, 2 Sep 2020 21:17:02 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTUweSx0ZT0gZT0lLVkpOQkJLTklNSUlMT0JVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo*Mjo5Kjk1PyMCLEMjQiouFhRJ
 AxoUN1VKVUpOQkJLTklNSUhKT09VMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWUpOTFVL
 VUhKVUpJT1lXWQgBWUFIS0xNNwY+
X-HM-Tid: 0a744ef6ab6f93b4kuwsaa9431a31b7
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
