Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E2523305D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 12:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689116E8CA;
	Thu, 30 Jul 2020 10:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754F96E43A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 10:28:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 675B3AE66;
 Thu, 30 Jul 2020 10:29:01 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, lyude@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, krzk@kernel.org, john.p.donnelly@Oracle.com,
 rong.a.chen@intel.com, kraxel@redhat.com, eich@suse.com, tiwai@suse.de
Subject: [PATCH v2 2/8] drm/mgag200: Move register initialization into helper
 function
Date: Thu, 30 Jul 2020 12:28:38 +0200
Message-Id: <20200730102844.10995-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730102844.10995-1-tzimmermann@suse.de>
References: <20200730102844.10995-1-tzimmermann@suse.de>
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

The mgag200 driver maps registers into the address space. Move the
code into a separate helper function. No functional changes.

One small difference is in the handling of SDRAM/SGRAM. MGA devices
can come with either SDRAM or SGRAM. So far, the driver checked for
SDRAM, which is the common case. The patch moves this code into a
separate helper and checks for SGRAM, which is the special case. The
test itself is the same as before.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 37 ++++++++++++++++++++++-----
 drivers/gpu/drm/mgag200/mgag200_reg.h |  2 ++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 7189c7745baf..e50c682c4702 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -44,18 +44,26 @@ static struct drm_driver mgag200_driver = {
  * DRM device
  */
 
-static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
+static bool mgag200_has_sgram(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
-	int ret, option;
+	u32 option;
+	int ret;
 
-	mdev->flags = mgag200_flags_from_driver_data(flags);
-	mdev->type = mgag200_type_from_driver_data(flags);
+	ret = pci_read_config_dword(dev->pdev, PCI_MGA_OPTION, &option);
+	if (drm_WARN(dev, ret, "failed to read PCI config dword: %d\n", ret))
+		return false;
+
+	return !!(option & PCI_MGA_OPTION_HARDPWMSK);
+}
 
-	pci_read_config_dword(dev->pdev, PCI_MGA_OPTION, &option);
-	mdev->has_sdram = !(option & (1 << 14));
+static int mgag200_regs_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+
+	mdev->has_sdram = !mgag200_has_sgram(mdev);
 
-	/* BAR 0 is the framebuffer, BAR 1 contains registers */
+	/* BAR 1 contains registers */
 	mdev->rmmio_base = pci_resource_start(dev->pdev, 1);
 	mdev->rmmio_size = pci_resource_len(dev->pdev, 1);
 
@@ -69,6 +77,21 @@ static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
 	if (mdev->rmmio == NULL)
 		return -ENOMEM;
 
+	return 0;
+}
+
+static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
+{
+	struct drm_device *dev = &mdev->base;
+	int ret;
+
+	mdev->flags = mgag200_flags_from_driver_data(flags);
+	mdev->type = mgag200_type_from_driver_data(flags);
+
+	ret = mgag200_regs_init(mdev);
+	if (ret)
+		return ret;
+
 	/* stash G200 SE model number for later use */
 	if (IS_G200_SE(mdev)) {
 		mdev->unique_rev_id = RREG32(0x1e24);
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index c3b7bcad52ed..a44c08bf4074 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -282,6 +282,8 @@
 #define PCI_MGA_OPTION2		0x50
 #define PCI_MGA_OPTION3		0x54
 
+#define PCI_MGA_OPTION_HARDPWMSK	BIT(14)
+
 #define RAMDAC_OFFSET		0x3c00
 
 /* TVP3026 direct registers */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
