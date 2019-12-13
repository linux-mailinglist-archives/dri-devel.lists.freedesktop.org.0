Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D279D11E745
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E566EA76;
	Fri, 13 Dec 2019 15:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA3A6EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 94D9C292D72
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 21/36] drm/komeda: Make the size checks independent from
 framebuffer structure
Date: Fri, 13 Dec 2019 16:58:52 +0100
Message-Id: <20191213155907.16581-22-andrzej.p@collabora.com>
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

The same data is available in mode_cmd.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../gpu/drm/arm/display/komeda/komeda_framebuffer.c    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 4c78ae1a4845..ab067f89533c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -156,9 +156,9 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		goto err_free;
 
 	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
-	info = kfb->base.format;
+	info = drm_get_format_info(dev, mode_cmd);
 
-	if (kfb->base.modifier) {
+	if (mode_cmd->modifier[0]) {
 		if (info->num_planes != 1) {
 			DRM_DEBUG_KMS("AFBC requires exactly 1 plane.\n");
 			ret = -EINVAL;
@@ -168,8 +168,8 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		ret = komeda_fb_afbc_size_check(kfb, info, objs, file,
 						mode_cmd);
 	} else {
-		ret = komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
-						 kfb->base.height);
+		ret = komeda_fb_check_src_coords(kfb, 0, 0, mode_cmd->width,
+						 mode_cmd->height);
 		if (ret)
 			goto err_cleanup;
 
@@ -180,7 +180,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		goto err_cleanup;
 
 	if (info->num_planes == 3)
-		if (kfb->base.pitches[1] != kfb->base.pitches[2]) {
+		if (mode_cmd->pitches[1] != mode_cmd->pitches[2]) {
 			DRM_DEBUG_KMS("The pitch[1] and [2] are not same\n");
 			ret = -EINVAL;
 			goto err_cleanup;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
