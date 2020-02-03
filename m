Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9250150A4B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89926EC6B;
	Mon,  3 Feb 2020 15:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4CC6EC6B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 15:53:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED711AE52;
 Mon,  3 Feb 2020 15:53:03 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 hdegoede@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 2/4] drm/bochs: Implement struct
 drm_mode_config_funcs.mode_valid
Date: Mon,  3 Feb 2020 16:52:56 +0100
Message-Id: <20200203155258.9346-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200203155258.9346-1-tzimmermann@suse.de>
References: <20200203155258.9346-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The implementation of struct drm_mode_config_funcs.mode_valid verifies
that enough video memory is available for a given display mode. This
replaces similar functionality in bochs_connector_mode_valid().

v2:
	* remove bochs_connector_mode_valid(), which now serves no purpose

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/bochs/bochs_kms.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index ff275faee88d..cc93ff74fbd8 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -83,28 +83,8 @@ static int bochs_connector_get_modes(struct drm_connector *connector)
 	return count;
 }
 
-static enum drm_mode_status bochs_connector_mode_valid(struct drm_connector *connector,
-				      struct drm_display_mode *mode)
-{
-	struct bochs_device *bochs =
-		container_of(connector, struct bochs_device, connector);
-	unsigned long size = mode->hdisplay * mode->vdisplay * 4;
-
-	/*
-	 * Make sure we can fit two framebuffers into video memory.
-	 * This allows up to 1600x1200 with 16 MB (default size).
-	 * If you want more try this:
-	 *     'qemu -vga std -global VGA.vgamem_mb=32 $otherargs'
-	 */
-	if (size * 2 > bochs->fb_size)
-		return MODE_BAD;
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_helper_funcs bochs_connector_connector_helper_funcs = {
 	.get_modes = bochs_connector_get_modes,
-	.mode_valid = bochs_connector_mode_valid,
 };
 
 static const struct drm_connector_funcs bochs_connector_connector_funcs = {
@@ -148,6 +128,7 @@ bochs_gem_fb_create(struct drm_device *dev, struct drm_file *file,
 
 const struct drm_mode_config_funcs bochs_mode_funcs = {
 	.fb_create = bochs_gem_fb_create,
+	.mode_valid = drm_vram_helper_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
