Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2A81D483A
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0037F6EC25;
	Fri, 15 May 2020 08:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4493C6EC1F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6BF57AFF6;
 Fri, 15 May 2020 08:32:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 12/15] drm/mgag200: Remove out-commented suspend/resume
 helpers
Date: Fri, 15 May 2020 10:32:30 +0200
Message-Id: <20200515083233.32036-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515083233.32036-1-tzimmermann@suse.de>
References: <20200515083233.32036-1-tzimmermann@suse.de>
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

The suspend/resume helpers are unused. Also remove associated state
from struct mga_device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 -
 drivers/gpu/drm/mgag200/mgag200_mode.c | 71 --------------------------
 2 files changed, 72 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index cf71a4ec84158..0cf498d1e900c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -164,7 +164,6 @@ struct mga_device {
 
 	size_t vram_fb_available;
 
-	bool				suspended;
 	enum mga_type			type;
 	int				has_sdram;
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 199ae08976e16..d6f9763a4a450 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1357,65 +1357,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	return 0;
 }
 
-#if 0 /* code from mjg to attempt D3 on crtc dpms off - revisit later */
-static int mga_suspend(struct drm_crtc *crtc)
-{
-	struct mga_crtc *mga_crtc = to_mga_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
-	struct pci_dev *pdev = dev->pdev;
-	int option;
-
-	if (mdev->suspended)
-		return 0;
-
-	WREG_SEQ(1, 0x20);
-	WREG_ECRT(1, 0x30);
-	/* Disable the pixel clock */
-	WREG_DAC(0x1a, 0x05);
-	/* Power down the DAC */
-	WREG_DAC(0x1e, 0x18);
-	/* Power down the pixel PLL */
-	WREG_DAC(0x1a, 0x0d);
-
-	/* Disable PLLs and clocks */
-	pci_read_config_dword(pdev, PCI_MGA_OPTION, &option);
-	option &= ~(0x1F8024);
-	pci_write_config_dword(pdev, PCI_MGA_OPTION, option);
-	pci_set_power_state(pdev, PCI_D3hot);
-	pci_disable_device(pdev);
-
-	mdev->suspended = true;
-
-	return 0;
-}
-
-static int mga_resume(struct drm_crtc *crtc)
-{
-	struct mga_crtc *mga_crtc = to_mga_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = dev->dev_private;
-	struct pci_dev *pdev = dev->pdev;
-	int option;
-
-	if (!mdev->suspended)
-		return 0;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_device(pdev);
-
-	/* Disable sysclk */
-	pci_read_config_dword(pdev, PCI_MGA_OPTION, &option);
-	option &= ~(0x4);
-	pci_write_config_dword(pdev, PCI_MGA_OPTION, option);
-
-	mdev->suspended = false;
-
-	return 0;
-}
-
-#endif
-
 static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct drm_device *dev = crtc->dev;
@@ -1442,11 +1383,6 @@ static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
 		break;
 	}
 
-#if 0
-	if (mode == DRM_MODE_DPMS_OFF) {
-		mga_suspend(crtc);
-	}
-#endif
 	WREG8(MGAREG_SEQ_INDEX, 0x01);
 	seq1 |= RREG8(MGAREG_SEQ_DATA) & ~0x20;
 	mga_wait_vsync(mdev);
@@ -1456,13 +1392,6 @@ static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
 	WREG8(MGAREG_CRTCEXT_INDEX, 0x01);
 	crtcext1 |= RREG8(MGAREG_CRTCEXT_DATA) & ~0x30;
 	WREG8(MGAREG_CRTCEXT_DATA, crtcext1);
-
-#if 0
-	if (mode == DRM_MODE_DPMS_ON && mdev->suspended == true) {
-		mga_resume(crtc);
-		drm_helper_resume_force_mode(dev);
-	}
-#endif
 }
 
 /*
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
