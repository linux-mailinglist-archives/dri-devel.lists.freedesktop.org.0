Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AC61C8551
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 11:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0952F6E95E;
	Thu,  7 May 2020 09:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A699B6E0D3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 09:03:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BA47DAE6D;
 Thu,  7 May 2020 09:03:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH v2 5/6] drm/mgag200: Remove unused fields from struct
 mga_device
Date: Thu,  7 May 2020 11:03:14 +0200
Message-Id: <20200507090315.21274-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200507090315.21274-1-tzimmermann@suse.de>
References: <20200507090315.21274-1-tzimmermann@suse.de>
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
Cc: John Donnelly <John.p.donnelly@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fields mode_info, num_crtcs and mode in struct mga_device serve
no purpose. Remove them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  | 8 --------
 drivers/gpu/drm/mgag200/mgag200_main.c | 3 ---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 6 ------
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 65d7096cad889..40e6ffbe97949 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -104,11 +104,6 @@ struct mga_crtc {
 	bool enabled;
 };
 
-struct mga_mode_info {
-	bool mode_config_initialized;
-	struct mga_crtc *crtc;
-};
-
 struct mga_i2c_chan {
 	struct i2c_adapter adapter;
 	struct drm_device *dev;
@@ -160,17 +155,14 @@ struct mga_device {
 	void __iomem			*rmmio;
 
 	struct mga_mc			mc;
-	struct mga_mode_info		mode_info;
 
 	struct mga_cursor cursor;
 
 	size_t vram_fb_available;
 
 	bool				suspended;
-	int				num_crtc;
 	enum mga_type			type;
 	int				has_sdram;
-	struct drm_display_mode		mode;
 
 	int bpp_shifts[4];
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index fd651eda6f012..86df799fd38c5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -97,9 +97,6 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 	mdev->flags = mgag200_flags_from_driver_data(flags);
 	mdev->type = mgag200_type_from_driver_data(flags);
 
-	/* Hardcode the number of CRTCs to 1 */
-	mdev->num_crtc = 1;
-
 	pci_read_config_dword(dev->pdev, PCI_MGA_OPTION, &option);
 	mdev->has_sdram = !(option & (1 << 14));
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 7dad386913261..1d1e937203fa7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1136,9 +1136,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 
 	WREG8(MGA_MISC_OUT, misc);
 
-	if (adjusted_mode)
-		memcpy(&mdev->mode, mode, sizeof(struct drm_display_mode));
-
 	mga_crtc_do_set_base(crtc, old_fb, x, y, 0);
 
 	/* reset tagfifo */
@@ -1447,7 +1444,6 @@ static void mga_crtc_init(struct mga_device *mdev)
 	drm_crtc_init(dev, &mga_crtc->base, &mga_crtc_funcs);
 
 	drm_mode_crtc_set_gamma_size(&mga_crtc->base, MGAG200_LUT_SIZE);
-	mdev->mode_info.crtc = mga_crtc;
 
 	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
 }
@@ -1647,8 +1643,6 @@ int mgag200_modeset_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	mdev->mode_info.mode_config_initialized = true;
-
 	dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
 	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
