Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F276A122F54
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887696EA05;
	Tue, 17 Dec 2019 14:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B5F6EA02
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id DB7B6292777
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 10/34] drm/komeda: Move pitches comparison to
 komeda_fb_create
Date: Tue, 17 Dec 2019 15:49:56 +0100
Message-Id: <20191217145020.14645-11-andrzej.p@collabora.com>
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

For AFBC case num_planes equals 1 so the check will not affect it.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../drm/arm/display/komeda/komeda_framebuffer.c    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index c0bc499a9c29..5d035f6a76a6 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -132,13 +132,6 @@ komeda_fb_none_afbc_size_check(struct komeda_dev *mdev,
 		}
 	}
 
-	if (info->num_planes == 3) {
-		if (fb->pitches[1] != fb->pitches[2]) {
-			DRM_DEBUG_KMS("The pitch[1] and [2] are not same\n");
-			return -EINVAL;
-		}
-	}
-
 	return 0;
 }
 
@@ -188,6 +181,13 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	if (ret < 0)
 		goto err_cleanup;
 
+	if (info->num_planes == 3)
+		if (kfb->base.pitches[1] != kfb->base.pitches[2]) {
+			DRM_DEBUG_KMS("The pitch[1] and [2] are not same\n");
+			ret = -EINVAL;
+			goto err_cleanup;
+		}
+
 	ret = drm_framebuffer_init(dev, &kfb->base, &komeda_fb_funcs);
 	if (ret < 0) {
 		DRM_DEBUG_KMS("failed to initialize fb\n");
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
