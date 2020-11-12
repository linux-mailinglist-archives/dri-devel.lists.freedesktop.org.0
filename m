Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0BE2B0648
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 14:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C7A6E235;
	Thu, 12 Nov 2020 13:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D748C6E223;
 Thu, 12 Nov 2020 13:21:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83BE5AD31;
 Thu, 12 Nov 2020 13:21:28 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 2/7] drm/fb-helper: Add hint to enable VT switching during
 suspend/resume
Date: Thu, 12 Nov 2020 14:21:12 +0100
Message-Id: <20201112132117.27228-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112132117.27228-1-tzimmermann@suse.de>
References: <20201112132117.27228-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switching VTs during suspend/resume is required to reliably run radeon
with generic fbdev emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 8 +++++---
 include/drm/drm_mode_config.h   | 7 +++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d2ba404a23b3..987cd781e62c 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -508,11 +508,11 @@ EXPORT_SYMBOL(drm_fb_helper_init);
  */
 struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
 {
-	struct device *dev = fb_helper->dev->dev;
+	struct drm_device *dev = fb_helper->dev;
 	struct fb_info *info;
 	int ret;
 
-	info = framebuffer_alloc(0, dev);
+	info = framebuffer_alloc(0, dev->dev);
 	if (!info)
 		return ERR_PTR(-ENOMEM);
 
@@ -535,7 +535,9 @@ struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
 	}
 
 	fb_helper->fbdev = info;
-	info->skip_vt_switch = true;
+
+	if (!dev->mode_config.require_vt_switch_fbdev)
+		info->skip_vt_switch = true;
 
 	return info;
 
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index ab424ddd7665..59e0796c6928 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -877,6 +877,13 @@ struct drm_mode_config {
 	 */
 	bool prefer_shadow_fbdev;
 
+	/**
+	 * @require_vt_switch_fbdev:
+	 *
+	 * Hint to framebuffer emulation to enable VT switching on suspend/resume.
+	 */
+	bool require_vt_switch_fbdev;
+
 	/**
 	 * @quirk_addfb_prefer_xbgr_30bpp:
 	 *
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
