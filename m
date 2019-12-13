Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C2211E757
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACCE6EA9A;
	Fri, 13 Dec 2019 15:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3F66EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 4529F292CDF
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 22/36] drm/komeda: Move helper invocation to after size
 checks
Date: Fri, 13 Dec 2019 16:58:53 +0100
Message-Id: <20191213155907.16581-23-andrzej.p@collabora.com>
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

Between the old and new place nothing depends on data retrieved with the
helper, so it is safe to move its invocation.
The err_cleanup case is changed accordingly.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index ab067f89533c..1a03318ec73a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -155,7 +155,6 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	if (ret < 0)
 		goto err_free;
 
-	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
 	info = drm_get_format_info(dev, mode_cmd);
 
 	if (mode_cmd->modifier[0]) {
@@ -186,6 +185,8 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 			goto err_cleanup;
 		}
 
+	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
+
 	for (i = 0; i < info->num_planes; ++i)
 		kfb->base.obj[i] = objs[i];
 
@@ -201,7 +202,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	return &kfb->base;
 
 err_cleanup:
-	for (i = 0; i < kfb->base.format->num_planes; i++)
+	for (i = 0; i < info->num_planes; i++)
 		drm_gem_object_put_unlocked(objs[i]);
 err_free:
 	kfree(kfb);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
