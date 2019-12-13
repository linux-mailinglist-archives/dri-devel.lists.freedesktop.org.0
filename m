Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB911E73D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541EA6EA47;
	Fri, 13 Dec 2019 15:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454096E9B2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 5C74E292D2B
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 12/36] drm/komeda: Move pitches comparison to
 komeda_fb_create
Date: Fri, 13 Dec 2019 16:58:43 +0100
Message-Id: <20191213155907.16581-13-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213155907.16581-1-andrzej.p@collabora.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
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
index 157b73005ef8..4fa01b2e3f1c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -133,13 +133,6 @@ komeda_fb_none_afbc_size_check(struct komeda_dev *mdev,
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
 
@@ -189,6 +182,13 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
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
