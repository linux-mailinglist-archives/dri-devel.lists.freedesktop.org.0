Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792454AB172
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 19:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DD310E4E0;
	Sun,  6 Feb 2022 18:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E1F10E4E0
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 18:56:51 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C92C883BC8;
 Sun,  6 Feb 2022 19:56:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644173810;
 bh=7771urnV84NHRLgMxfwndh8/xeMivwsLCBYvo7vYehA=;
 h=From:To:Cc:Subject:Date:From;
 b=u2GG2abAS5C2x3Q9/+3plYaCMxLZn/b0vmGvDu3C0oYHhFb6VCi+Ol8oqqtop/0nM
 FIS6gcv+oO2kdi6JFys6kaFlF1lFam5LqE8lhSv+GJ5vSxFojNIuyemweuE4PseJT/
 lHVPa4REa+MdFfixSjqjArsb6jjXadKmJMAKiBVez6p4zvFSC5NdvkII3RG265nFwq
 mNGnuWoKvlPfLzteCNn4dcxt6TBawW1z1ZOOnSK23N/zBPa0Cf4jum/ImyXhnC44Z1
 e2r1vAu8GU/3jG8r/UzNy8gqYpaGkKM4A+VQBDbHXiPKUuWmemrVxXq4kyIjgkppWr
 lnFvLP8RIc+IQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
Date: Sun,  6 Feb 2022 19:56:43 +0100
Message-Id: <20220206185643.275811-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LCDIF controller as present in i.MX6SX/i.MX8M Mini/Nano has a CRC_STAT
register, which contains CRC32 of the frame as it was clocked out of the
DPI interface of the LCDIF. This is likely meant as a functional safety
register.

Unfortunatelly, there is zero documentation on how the CRC32 is calculated,
there is no documentation of the polynomial, the init value, nor on which
data is the checksum applied.

By applying brute-force on 8 pixel / 2 line frame, which is the minimum
size LCDIF would work with, it turns out the polynomial is CRC32_POLY_LE
0xedb88320 , init value is 0xffffffff , the input data are bitrev32()
of the entire frame and the resulting CRC has to be also bitrev32()ed.

Doing this calculation in software for each frame is unrealistic due to
the CPU demand, implement at least a sysfs attribute which permits testing
the current frame on demand.

Unfortunatelly, this functionality has another problem. On all of those SoCs,
it is possible to overload interconnect e.g. by concurrent USB and uSDHC
transfers, at which point the LCDIF LFIFO suffers an UNDERFLOW condition,
which results in the image being shifted to the right by exactly LFIFO size
pixels. On i.MX8M Mini, the LFIFO is 76x256 bits = 2432 Byte ~= 810 pixel
at 24bpp. In this case, the LCDIF does not assert UNDERFLOW_IRQ bit, the
frame CRC32 indicated in CRC_STAT register matches the CRC32 of the frame
in DRAM, the RECOVER_ON_UNDERFLOW bit has no effect, so if this mode of
failure occurs, the failure gets undetected and uncorrected.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c  | 38 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h  |  3 +++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 11 +++++----
 drivers/gpu/drm/mxsfb/mxsfb_regs.h |  1 +
 4 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 4ff3c6195dd0c..6f296b398f28c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/crc32.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -292,6 +293,37 @@ static void mxsfb_unload(struct drm_device *drm)
 	pm_runtime_disable(drm->dev);
 }
 
+static ssize_t mxsfb_frame_checksum_show(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct mxsfb_drm_private *mxsfb = drm->dev_private;
+	u32 hwcrc = readl(mxsfb->base, LCDC_V4_CRC_STAT);
+	u32 swcrc = 0xffffffff;
+	int i;
+
+	if (mxsfb->gem_vaddr) {
+		for (i = 0; i < mxsfb->gem_size / 4; i++) {
+			u32 data = bitrev32(((u32 *)mxsfb->gem_vaddr)[i]);
+			swcrc = crc32(swcrc, &data, 4);
+		}
+		swcrc = bitrev32(swcrc);
+	}
+
+	return sysfs_emit(buf, "HW:%08x,SW:%08x,OK:%d\n", hwcrc, swcrc, hwcrc == swcrc);
+}
+static DEVICE_ATTR(frame_checksum, 0444, mxsfb_frame_checksum_show, NULL);
+
+static struct attribute *mxsfb_attributes[] = {
+	&dev_attr_frame_checksum.attr,
+	NULL,
+};
+
+static const struct attribute_group mxsfb_attr_group = {
+	.attrs = mxsfb_attributes,
+};
+
 DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static const struct drm_driver mxsfb_driver = {
@@ -335,10 +367,16 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unload;
 
+	ret = devm_device_add_group(drm->dev, &mxsfb_attr_group);
+	if (ret)
+		goto err_attr;
+
 	drm_fbdev_generic_setup(drm, 32);
 
 	return 0;
 
+err_attr:
+	drm_dev_unregister(drm);
 err_unload:
 	mxsfb_unload(drm);
 err_free:
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index ddb5b0417a82c..0a3e5dd1e8bab 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -44,6 +44,9 @@ struct mxsfb_drm_private {
 	struct drm_encoder		encoder;
 	struct drm_connector		*connector;
 	struct drm_bridge		*bridge;
+
+	void				*gem_vaddr;
+	size_t				gem_size;
 };
 
 static inline struct mxsfb_drm_private *
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 03743a84c8e79..2a4edf5a2ac57 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -196,7 +196,7 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 	return clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_CLKGATE);
 }
 
-static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
+static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb, struct drm_plane *plane)
 {
 	struct drm_framebuffer *fb = plane->state->fb;
 	struct drm_gem_cma_object *gem;
@@ -208,6 +208,9 @@ static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
 	if (!gem)
 		return 0;
 
+	mxsfb->gem_vaddr = gem->vaddr;
+	mxsfb->gem_size = gem->base.size;
+
 	return gem->paddr;
 }
 
@@ -370,7 +373,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = mxsfb_get_fb_paddr(crtc->primary);
+	paddr = mxsfb_get_fb_paddr(mxsfb, crtc->primary);
 	if (paddr) {
 		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
@@ -476,7 +479,7 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	dma_addr_t paddr;
 
-	paddr = mxsfb_get_fb_paddr(plane);
+	paddr = mxsfb_get_fb_paddr(mxsfb, plane);
 	if (paddr)
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
 }
@@ -492,7 +495,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	dma_addr_t paddr;
 	u32 ctrl;
 
-	paddr = mxsfb_get_fb_paddr(plane);
+	paddr = mxsfb_get_fb_paddr(mxsfb, plane);
 	if (!paddr) {
 		writel(0, mxsfb->base + LCDC_AS_CTRL);
 		return;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
index 694fea13e893e..cf813a1da1d78 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
@@ -26,6 +26,7 @@
 #define LCDC_VDCTRL2			0x90
 #define LCDC_VDCTRL3			0xa0
 #define LCDC_VDCTRL4			0xb0
+#define LCDC_V4_CRC_STAT		0x1a0
 #define LCDC_V4_DEBUG0			0x1d0
 #define LCDC_V3_DEBUG0			0x1f0
 #define LCDC_AS_CTRL			0x210
-- 
2.34.1

