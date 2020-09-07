Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6850525FC15
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A1F6E488;
	Mon,  7 Sep 2020 14:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC5F89590
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 12:31:45 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.125])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 8CED0482A30;
 Mon,  7 Sep 2020 20:31:37 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm: cleanup coding style a bit
Date: Mon,  7 Sep 2020 05:31:29 -0700
Message-Id: <20200907123129.27905-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZT0xMQkkfGBhJThpPVkpOQkJPQ0pDQkxMSU1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K1E6Fio4Ij8tGhgpMjwyVjUt
 DUoKFD1VSlVKTkJCT0NKQ0JDSk1NVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSU1ITjcG
X-HM-Tid: 0a74688ce2f893bakuws8ced0482a30
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:29:04 +0000
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

Remove first assignment to info which is meaningless.
Put the width and higth check first.
This change is to make the code a bit readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index df656366a530..2f5b0c2bb0fe 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -176,8 +176,7 @@ static int framebuffer_check(struct drm_device *dev,
 	int i;
 
 	/* check if the format is supported at all */
-	info = __drm_format_info(r->pixel_format);
-	if (!info) {
+	if (!__drm_format_info(r->pixel_format)) {
 		struct drm_format_name_buf format_name;
 
 		DRM_DEBUG_KMS("bad framebuffer format %s\n",
@@ -186,9 +185,6 @@ static int framebuffer_check(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	/* now let the driver pick its own format info */
-	info = drm_get_format_info(dev, r);
-
 	if (r->width == 0) {
 		DRM_DEBUG_KMS("bad framebuffer width %u\n", r->width);
 		return -EINVAL;
@@ -199,6 +195,9 @@ static int framebuffer_check(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	/* now let the driver pick its own format info */
+	info = drm_get_format_info(dev, r);
+
 	for (i = 0; i < info->num_planes; i++) {
 		unsigned int width = fb_plane_width(r->width, info, i);
 		unsigned int height = fb_plane_height(r->height, info, i);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
