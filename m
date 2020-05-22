Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752DC1DE84E
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 15:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B516E9D7;
	Fri, 22 May 2020 13:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFBD6E0CC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 13:52:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67C1AB00E;
 Fri, 22 May 2020 13:52:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: abrodkin@synopsys.com, airlied@linux.ie, daniel@ffwll.ch,
 james.qian.wang@arm.com, liviu.dudau@arm.com, mihail.atanassov@arm.com,
 brian.starkey@arm.com, joel@jms.id.au, andrew@aj.id.au, sam@ravnborg.org,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, xinliang.liu@linaro.org, zourongrong@gmail.com,
 john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, linus.walleij@linaro.org,
 narmstrong@baylibre.com, khilman@baylibre.com, marex@denx.de,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com,
 philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 wens@csie.org, jsarha@ti.com, tomi.valkeinen@ti.com, noralf@tronnes.org
Subject: [PATCH 01/21] drm/cma-helper: Rework DRM_GEM_CMA_VMAP_DRIVER_OPS macro
Date: Fri, 22 May 2020 15:52:26 +0200
Message-Id: <20200522135246.10134-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522135246.10134-1-tzimmermann@suse.de>
References: <20200522135246.10134-1-tzimmermann@suse.de>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the macro to DRM_GEM_CMA_DRIVER_OPS to align with SHMEM
helpers. An internal version is provided for drivers that override
the default .dumb_create callback. Adapt drivers to the changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_cma_helper.c |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c    |  3 +--
 drivers/gpu/drm/tidss/tidss_drv.c    |  2 +-
 drivers/gpu/drm/tiny/hx8357d.c       |  2 +-
 drivers/gpu/drm/tiny/ili9225.c       |  2 +-
 drivers/gpu/drm/tiny/ili9341.c       |  2 +-
 drivers/gpu/drm/tiny/ili9486.c       |  2 +-
 drivers/gpu/drm/tiny/mi0283qt.c      |  2 +-
 drivers/gpu/drm/tiny/repaper.c       |  2 +-
 drivers/gpu/drm/tiny/st7586.c        |  2 +-
 drivers/gpu/drm/tiny/st7735r.c       |  2 +-
 include/drm/drm_gem_cma_helper.h     | 24 ++++++++++++++++++++----
 12 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 12e98fb28229d..6fa4d2f2e3987 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -620,7 +620,7 @@ EXPORT_SYMBOL(drm_cma_gem_create_object_default_funcs);
  * address set. This address is released when the object is freed.
  *
  * This function can be used as the &drm_driver.gem_prime_import_sg_table
- * callback. The DRM_GEM_CMA_VMAP_DRIVER_OPS() macro provides a shortcut to set
+ * callback. The &DRM_GEM_CMA_DRIVER_OPS macro provides a shortcut to set
  * the necessary DRM driver operations.
  *
  * Returns:
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 328272ff77d84..012855fd89c24 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -52,8 +52,7 @@ static struct drm_driver sun4i_drv_driver = {
 	.minor			= 0,
 
 	/* GEM Operations */
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
-	.dumb_create		= drm_sun4i_gem_dumb_create,
+	__DRM_GEM_CMA_DRIVER_OPS(drm_sun4i_gem_dumb_create),
 };
 
 static int sun4i_drv_bind(struct device *dev)
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 99edc66ebdef2..1753cdc74ebda 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -112,7 +112,7 @@ static struct drm_driver tidss_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &tidss_fops,
 	.release		= tidss_release,
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS,
 	.name			= "tidss",
 	.desc			= "TI Keystone DSS",
 	.date			= "20180215",
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index b4bc358a3269a..592da71d7ca70 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -196,7 +196,7 @@ DEFINE_DRM_GEM_CMA_FOPS(hx8357d_fops);
 static struct drm_driver hx8357d_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &hx8357d_fops,
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS,
 	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "hx8357d",
 	.desc			= "HX8357D",
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index d1a5ab6747d5c..368ff6c8a1efb 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -346,7 +346,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9225_fops);
 static struct drm_driver ili9225_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &ili9225_fops,
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS,
 	.name			= "ili9225",
 	.desc			= "Ilitek ILI9225",
 	.date			= "20171106",
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index bb819f45a5d3b..e1b9043ef7a0a 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -152,7 +152,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9341_fops);
 static struct drm_driver ili9341_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &ili9341_fops,
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS,
 	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "ili9341",
 	.desc			= "Ilitek ILI9341",
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 2702ea557d297..90a17f40fdf0c 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -165,7 +165,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9486_fops);
 static struct drm_driver ili9486_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &ili9486_fops,
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS,
 	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "ili9486",
 	.desc			= "Ilitek ILI9486",
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index 08ac549ab0f7f..6624c2098fba2 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -156,7 +156,7 @@ DEFINE_DRM_GEM_CMA_FOPS(mi0283qt_fops);
 static struct drm_driver mi0283qt_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &mi0283qt_fops,
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS,
 	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "mi0283qt",
 	.desc			= "Multi-Inno MI0283QT",
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 1c0e7169545b4..877dcece25828 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -946,7 +946,7 @@ DEFINE_DRM_GEM_CMA_FOPS(repaper_fops);
 static struct drm_driver repaper_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &repaper_fops,
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS,
 	.name			= "repaper",
 	.desc			= "Pervasive Displays RePaper e-ink panels",
 	.date			= "20170405",
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 2a1fae422f7a2..ec84bdc51f60d 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -285,7 +285,7 @@ DEFINE_DRM_GEM_CMA_FOPS(st7586_fops);
 static struct drm_driver st7586_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &st7586_fops,
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS,
 	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "st7586",
 	.desc			= "Sitronix ST7586",
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 0af1b15efdf8a..cfd4933f3b30c 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -157,7 +157,7 @@ DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
 static struct drm_driver st7735r_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops			= &st7735r_fops,
-	DRM_GEM_CMA_VMAP_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS,
 	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "st7735r",
 	.desc			= "Sitronix ST7735R",
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 947ac95eb24a9..917d42603db06 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -110,21 +110,37 @@ struct drm_gem_object *
 drm_cma_gem_create_object_default_funcs(struct drm_device *dev, size_t size);
 
 /**
- * DRM_GEM_CMA_VMAP_DRIVER_OPS - CMA GEM driver operations ensuring a virtual
- *                               address on the buffer
+ * __DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations ensuring a
+ *                            virtual address on the buffer
+ * @__dumb_create: callback function for .dumb_create
  *
  * This macro provides a shortcut for setting the default GEM operations in the
  * &drm_driver structure for drivers that need the virtual address also on
  * imported buffers.
+ *
+ * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS for drivers that
+ * override the default implementation of .dumb_create. Use
+ * DRM_GEM_CMA_DRIVER_OPS if possible.
  */
-#define DRM_GEM_CMA_VMAP_DRIVER_OPS \
+#define __DRM_GEM_CMA_DRIVER_OPS(__dumb_create) \
 	.gem_create_object	= drm_cma_gem_create_object_default_funcs, \
-	.dumb_create		= drm_gem_cma_dumb_create, \
+	.dumb_create		= (__dumb_create), \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
 	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table_vmap, \
 	.gem_prime_mmap		= drm_gem_prime_mmap
 
+/**
+ * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations ensuring a virtual
+ *                          address on the buffer
+ *
+ * This macro provides a shortcut for setting the default GEM operations in the
+ * &drm_driver structure for drivers that need the virtual address also on
+ * imported buffers.
+ */
+#define DRM_GEM_CMA_DRIVER_OPS \
+	__DRM_GEM_CMA_DRIVER_OPS(drm_gem_cma_dumb_create)
+
 struct drm_gem_object *
 drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
 				       struct dma_buf_attachment *attach,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
