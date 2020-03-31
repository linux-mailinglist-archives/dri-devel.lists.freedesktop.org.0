Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C374199A5D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 17:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8EB6E343;
	Tue, 31 Mar 2020 15:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A936E343
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 15:53:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 848DB296BFC
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/core: Calculate bpp in afbc helper
Date: Tue, 31 Mar 2020 17:53:08 +0200
Message-Id: <20200331155308.6345-3-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331155308.6345-1-andrzej.p@collabora.com>
References: <CAKMK7uE67t-qWLXNo5FHDUubVWdb+sDxF=yijtM-0n626d-10g@mail.gmail.com>
 <20200331155308.6345-1-andrzej.p@collabora.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers (komeda, malidp) don't set anything in cpp. If that is the
case the right value can be inferred from the format. Then the "bpp" member
can be eliminated from struct drm_afbc_framebuffer.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 Documentation/gpu/todo.rst                   | 15 --------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 39 ++++++++++++++++----
 include/drm/drm_framebuffer.h                |  7 ----
 3 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 37a3a023c114..439656f55c5d 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -404,21 +404,6 @@ Contact: Laurent Pinchart, respective driver maintainers
 
 Level: Intermediate
 
-Encode cpp properly in malidp
------------------------------
-
-cpp (chars per pixel) is not encoded properly in malidp, zero is
-used instead. afbc implementation needs bpp or cpp, but if it is
-zero it needs to be provided elsewhere, and so the bpp field exists
-in struct drm_afbc_framebuffer.
-
-Properly encode cpp in malidp and remove the bpp field in struct
-drm_afbc_framebuffer.
-
-Contact: malidp maintainers
-
-Level: Intermediate
-
 Core refactorings
 =================
 
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 6fb1841fa71c..cac15294aef6 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -309,11 +309,37 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
 
+static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
+				  const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	const struct drm_format_info *info;
+
+	info = drm_get_format_info(dev, mode_cmd);
+
+	/* use whatever a driver has set */
+	if (info->cpp[0])
+		return info->cpp[0] * 8;
+
+	/* guess otherwise */
+	switch (info->format) {
+	case DRM_FORMAT_YUV420_8BIT:
+		return 12;
+	case DRM_FORMAT_YUV420_10BIT:
+		return 15;
+	case DRM_FORMAT_VUY101010:
+		return 30;
+	default:
+		break;
+	}
+
+	/* all attempts failed */
+	return 0;
+}
+
 static int drm_gem_afbc_min_size(struct drm_device *dev,
 				 const struct drm_mode_fb_cmd2 *mode_cmd,
 				 struct drm_afbc_framebuffer *afbc_fb)
 {
-	const struct drm_format_info *info;
 	__u32 n_blocks, w_alignment, h_alignment, hdr_alignment;
 	/* remove bpp when all users properly encode cpp in drm_format_info */
 	__u32 bpp;
@@ -351,12 +377,11 @@ static int drm_gem_afbc_min_size(struct drm_device *dev,
 	afbc_fb->aligned_height = ALIGN(mode_cmd->height, h_alignment);
 	afbc_fb->offset = mode_cmd->offsets[0];
 
-	info = drm_get_format_info(dev, mode_cmd);
-	/*
-	 * Change to always using info->cpp[0]
-	 * when all users properly encode it
-	 */
-	bpp = info->cpp[0] ? info->cpp[0] * 8 : afbc_fb->bpp;
+	bpp = drm_gem_afbc_get_bpp(dev, mode_cmd);
+	if (!bpp) {
+		drm_dbg_kms(dev, "Invalid AFBC bpp value: %d\n", bpp);
+		return -EINVAL;
+	}
 
 	n_blocks = (afbc_fb->aligned_width * afbc_fb->aligned_height)
 		   / AFBC_SUPERBLOCK_PIXELS;
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index b53c0332f040..be658ebbec72 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -331,13 +331,6 @@ struct drm_afbc_framebuffer {
 	 * @afbc_size: minimum size of afbc buffer
 	 */
 	u32 afbc_size;
-	/**
-	 * @bpp: bpp value for this afbc buffer
-	 * To be removed when users such as malidp
-	 * properly store the cpp in drm_format_info.
-	 * New users should not start using this field.
-	 */
-	u32 bpp;
 };
 
 #define fb_to_afbc_fb(x) container_of(x, struct drm_afbc_framebuffer, base)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
