Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED28122F62
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5036EA24;
	Tue, 17 Dec 2019 14:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EEC6EA05
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 78001292871
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 21/34] drm/komeda: Use helper for common tasks
Date: Tue, 17 Dec 2019 15:50:07 +0100
Message-Id: <20191217145020.14645-22-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The replaced fragment is 1:1 with the helper code.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../gpu/drm/arm/display/komeda/komeda_framebuffer.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index c2b29d4e6fbb..26d1a3cfb587 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -184,17 +184,10 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 			goto err_cleanup;
 		}
 
-	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
-
-	for (i = 0; i < info->num_planes; ++i)
-		kfb->base.obj[i] = objs[i];
-
-	ret = drm_framebuffer_init(dev, &kfb->base, &komeda_fb_funcs);
-	if (ret < 0) {
-		DRM_DEBUG_KMS("failed to initialize fb\n");
-
+	ret = drm_gem_fb_init_with_funcs(&kfb->base, dev, mode_cmd, objs,
+					 info->num_planes, &komeda_fb_funcs);
+	if (ret < 0)
 		goto err_cleanup;
-	}
 
 	kfb->is_va = mdev->iommu ? true : false;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
