Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083B118814
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9824F6E8D3;
	Tue, 10 Dec 2019 12:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40806E8D3;
 Tue, 10 Dec 2019 12:31:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:23 -0800
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; d="scan'208";a="387577266"
Received: from orilivne-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.68])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/mipi-dbi: convert to drm device based logging
Date: Tue, 10 Dec 2019 14:30:47 +0200
Message-Id: <20191210123050.8799-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210123050.8799-1-jani.nikula@intel.com>
References: <20191210123050.8799-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer drm device based logging where possible.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index e34058c721be..86d98e7fc30a 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -225,7 +225,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
 		break;
 	default:
-		dev_err_once(fb->dev->dev, "Format is not supported: %s\n",
+		drm_err_once(fb->dev, "Format is not supported: %s\n",
 			     drm_get_format_name(fb->format->format,
 						 &format_name));
 		return -EINVAL;
@@ -242,7 +242,8 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
 	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
+	struct drm_device *dev = fb->dev;
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(dev);
 	unsigned int height = rect->y2 - rect->y1;
 	unsigned int width = rect->x2 - rect->x1;
 	struct mipi_dbi *dbi = &dbidev->dbi;
@@ -259,7 +260,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 
 	full = width == fb->width && height == fb->height;
 
-	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
+	drm_dbg_kms(dev, "Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
 
 	if (!dbi->dc || !full || swap ||
 	    fb->format->format == DRM_FORMAT_XRGB8888) {
@@ -282,7 +283,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 				   width * height * 2);
 err_msg:
 	if (ret)
-		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
+		drm_err_once(dev, "Failed to update display %d\n", ret);
 
 	drm_dev_exit(idx);
 }
@@ -649,14 +650,14 @@ EXPORT_SYMBOL(mipi_dbi_display_is_on);
 
 static int mipi_dbi_poweron_reset_conditional(struct mipi_dbi_dev *dbidev, bool cond)
 {
-	struct device *dev = dbidev->drm.dev;
+	struct drm_device *dev = &dbidev->drm;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int ret;
 
 	if (dbidev->regulator) {
 		ret = regulator_enable(dbidev->regulator);
 		if (ret) {
-			DRM_DEV_ERROR(dev, "Failed to enable regulator (%d)\n", ret);
+			drm_err(dev, "Failed to enable regulator (%d)\n", ret);
 			return ret;
 		}
 	}
@@ -667,7 +668,7 @@ static int mipi_dbi_poweron_reset_conditional(struct mipi_dbi_dev *dbidev, bool
 	mipi_dbi_hw_reset(dbi);
 	ret = mipi_dbi_command(dbi, MIPI_DCS_SOFT_RESET);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "Failed to send reset command (%d)\n", ret);
+		drm_err(dev, "Failed to send reset command (%d)\n", ret);
 		if (dbidev->regulator)
 			regulator_disable(dbidev->regulator);
 		return ret;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
