Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B611E754
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7796EA87;
	Fri, 13 Dec 2019 15:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFB36EA7B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 07F00292DAC
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 32/36] drm/arm/malidp: Integrate verify functions
Date: Fri, 13 Dec 2019 16:59:03 +0100
Message-Id: <20191213155907.16581-33-andrzej.p@collabora.com>
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

The next step towards using generic afbc-aware helpers.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 36 ++++++++------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 961e5a3f5b08..e1502666bce0 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -270,9 +270,16 @@ static const struct drm_mode_config_helper_funcs malidp_mode_config_helpers = {
 };
 
 static bool
-malidp_verify_afbc_framebuffer_caps(struct drm_device *dev,
-				    const struct drm_mode_fb_cmd2 *mode_cmd)
+malidp_verify_afbc_framebuffer(struct drm_device *dev, struct drm_file *file,
+			       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
+	int n_superblocks = 0;
+	const struct drm_format_info *info;
+	struct drm_gem_object *objs = NULL;
+	u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
+	u32 afbc_superblock_width = 0, afbc_size = 0;
+	int bpp = 0;
+
 	if (malidp_format_mod_supported(dev, mode_cmd->pixel_format,
 					mode_cmd->modifier[0]) == false)
 		return false;
@@ -294,21 +301,6 @@ malidp_verify_afbc_framebuffer_caps(struct drm_device *dev,
 		return false;
 	}
 
-	return true;
-}
-
-static bool
-malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
-				    struct drm_file *file,
-				    const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	int n_superblocks = 0;
-	const struct drm_format_info *info;
-	struct drm_gem_object *objs = NULL;
-	u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
-	u32 afbc_superblock_width = 0, afbc_size = 0;
-	int bpp = 0;
-
 	switch (mode_cmd->modifier[0] & AFBC_SIZE_MASK) {
 	case AFBC_SIZE_16X16:
 		afbc_superblock_height = 16;
@@ -358,16 +350,6 @@ malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
 	return true;
 }
 
-static bool
-malidp_verify_afbc_framebuffer(struct drm_device *dev, struct drm_file *file,
-			       const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	if (!malidp_verify_afbc_framebuffer_caps(dev, mode_cmd))
-		return false;
-
-	return malidp_verify_afbc_framebuffer_size(dev, file, mode_cmd);
-}
-
 static struct drm_framebuffer *
 malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
