Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC65A27BDBF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3796E44C;
	Tue, 29 Sep 2020 07:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB2489428
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 08:52:15 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9D98AA3994EECB7BA889;
 Mon, 28 Sep 2020 16:52:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 16:52:09 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/hisilicon: Using the to_hibmc_drm_private to convert
Date: Mon, 28 Sep 2020 16:49:38 +0800
Message-ID: <1601282978-45534-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using the to_hibmc_drm_private to convert over all uses of
dev_private, and fix a little formatting issue.

v2:
fixed the commit message.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 22 +++++++++++-----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  |  5 ++---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  4 ++--
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 4d57ec6..a98f993 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -105,7 +105,7 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	u32 reg;
 	s64 gpu_addr = 0;
 	unsigned int line_l;
-	struct hibmc_drm_private *priv = plane->dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(plane->dev);
 	struct drm_gem_vram_object *gbo;
 
 	if (!state->fb)
@@ -159,7 +159,7 @@ static const struct drm_plane_helper_funcs hibmc_plane_helper_funcs = {
 
 static void hibmc_crtc_dpms(struct drm_crtc *crtc, int dpms)
 {
-	struct hibmc_drm_private *priv = crtc->dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
 	unsigned int reg;
 
 	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
@@ -175,7 +175,7 @@ static void hibmc_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
 	unsigned int reg;
-	struct hibmc_drm_private *priv = crtc->dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
 
 	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
 
@@ -194,7 +194,7 @@ static void hibmc_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_state)
 {
 	unsigned int reg;
-	struct hibmc_drm_private *priv = crtc->dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
 
 	hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_OFF);
 	drm_crtc_vblank_off(crtc);
@@ -254,7 +254,7 @@ static unsigned int format_pll_reg(void)
 static void set_vclock_hisilicon(struct drm_device *dev, unsigned long pll)
 {
 	u32 val;
-	struct hibmc_drm_private *priv = dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 
 	val = readl(priv->mmio + CRT_PLL1_HS);
 	val &= ~(CRT_PLL1_HS_OUTER_BYPASS(1));
@@ -315,7 +315,7 @@ static unsigned int display_ctrl_adjust(struct drm_device *dev,
 	unsigned long x, y;
 	u32 pll1; /* bit[31:0] of PLL */
 	u32 pll2; /* bit[63:32] of PLL */
-	struct hibmc_drm_private *priv = dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 
 	x = mode->hdisplay;
 	y = mode->vdisplay;
@@ -363,7 +363,7 @@ static void hibmc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	unsigned int val;
 	struct drm_display_mode *mode = &crtc->state->mode;
 	struct drm_device *dev = crtc->dev;
-	struct hibmc_drm_private *priv = dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	int width = mode->hsync_end - mode->hsync_start;
 	int height = mode->vsync_end - mode->vsync_start;
 
@@ -397,7 +397,7 @@ static void hibmc_crtc_atomic_begin(struct drm_crtc *crtc,
 {
 	unsigned int reg;
 	struct drm_device *dev = crtc->dev;
-	struct hibmc_drm_private *priv = dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 
 	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
 
@@ -427,7 +427,7 @@ static void hibmc_crtc_atomic_flush(struct drm_crtc *crtc,
 
 static int hibmc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct hibmc_drm_private *priv = crtc->dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
 
 	writel(HIBMC_RAW_INTERRUPT_EN_VBLANK(1),
 	       priv->mmio + HIBMC_RAW_INTERRUPT_EN);
@@ -437,7 +437,7 @@ static int hibmc_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void hibmc_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct hibmc_drm_private *priv = crtc->dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
 
 	writel(HIBMC_RAW_INTERRUPT_EN_VBLANK(0),
 	       priv->mmio + HIBMC_RAW_INTERRUPT_EN);
@@ -445,7 +445,7 @@ static void hibmc_crtc_disable_vblank(struct drm_crtc *crtc)
 
 static void hibmc_crtc_load_lut(struct drm_crtc *crtc)
 {
-	struct hibmc_drm_private *priv = crtc->dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
 	void __iomem   *mmio = priv->mmio;
 	u16 *r, *g, *b;
 	unsigned int reg;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 085d1b2..5632bce 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -29,8 +29,7 @@ DEFINE_DRM_GEM_FOPS(hibmc_fops);
 static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
-	struct hibmc_drm_private *priv =
-		(struct hibmc_drm_private *)dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	u32 status;
 
 	status = readl(priv->mmio + HIBMC_RAW_INTERRUPT);
@@ -244,7 +243,7 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
 
 static int hibmc_unload(struct drm_device *dev)
 {
-	struct hibmc_drm_private *priv = dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 
 	drm_atomic_helper_shutdown(dev);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index c6999ed..74e26c2 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -43,7 +43,7 @@ static int hibmc_connector_get_modes(struct drm_connector *connector)
 }
 
 static enum drm_mode_status hibmc_connector_mode_valid(struct drm_connector *connector,
-				      struct drm_display_mode *mode)
+						       struct drm_display_mode *mode)
 {
 	return MODE_OK;
 }
@@ -76,7 +76,7 @@ static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
 {
 	u32 reg;
 	struct drm_device *dev = encoder->dev;
-	struct hibmc_drm_private *priv = dev->dev_private;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 
 	reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
 	reg |= HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
