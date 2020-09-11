Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC32B2660BF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A24E6EA6B;
	Fri, 11 Sep 2020 13:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD556EA57
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:54:25 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kGjVN-0007wc-Qz; Fri, 11 Sep 2020 15:54:24 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kGjVH-00FKo5-QP; Fri, 11 Sep 2020 15:54:15 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Fri, 11 Sep 2020 15:54:12 +0200
Message-Id: <20200911135413.3654800-16-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH v2 15/16] drm/exynos: split out platform specific code
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: jy0922.shim@samsung.com, b.zolnierkie@samsung.com, narmstrong@baylibre.com,
 sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>,
 krzk@kernel.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the driver into the drm bridge driver and the exynos platform
specific driver.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2: none
---
 drivers/gpu/drm/exynos/Makefile               |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 372 +-----------------
 drivers/gpu/drm/exynos/exynos_drm_dsi.h       |  64 +++
 drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c | 333 ++++++++++++++++
 4 files changed, 405 insertions(+), 366 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dsi.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c

diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 2fd2f3ee4fcf..add70b336935 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -11,7 +11,7 @@ exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
 exynosdrm-$(CONFIG_DRM_EXYNOS5433_DECON)	+= exynos5433_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS7_DECON)	+= exynos7_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DPI)	+= exynos_drm_dpi.o
-exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o exynos_drm_dsi_pltfm.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_MIXER)	+= exynos_mixer.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ad70f5ce81ad..e8aea9d90c34 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -32,8 +32,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
-#include "exynos_drm_crtc.h"
-#include "exynos_drm_drv.h"
+#include "exynos_drm_dsi.h"
 
 /* returns true iff both arguments logically differs */
 #define NEQV(a, b) (!(a) ^ !(b))
@@ -44,10 +43,6 @@
 #define DSIM_TX_READY_HS_CLK		(1 << 10)
 #define DSIM_PLL_STABLE			(1 << 31)
 
-/* DSIM_SWRST */
-#define DSIM_FUNCRST			(1 << 16)
-#define DSIM_SWRST			(1 << 0)
-
 /* DSIM_TIMEOUT */
 #define DSIM_LPDR_TIMEOUT(x)		((x) << 0)
 #define DSIM_BTA_TIMEOUT(x)		((x) << 16)
@@ -239,31 +234,6 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
-struct exynos_dsi;
-struct exynos_dsi_host_ops {
-	int (*attach)(struct device *dev, struct mipi_dsi_device *device);
-	int (*detach)(struct device *dev, struct mipi_dsi_device *device);
-	void (*te_handler)(struct device *dev);
-};
-
-enum exynos_reg_offset {
-	EXYNOS_REG_OFS,
-	EXYNOS5433_REG_OFS
-};
-
-struct exynos_dsi_driver_data {
-	enum exynos_reg_offset reg_ofs;
-	unsigned int plltmr_reg;
-	unsigned int has_freqband:1;
-	unsigned int has_clklane_stop:1;
-	unsigned int num_clks;
-	unsigned int max_freq;
-	unsigned int wait_for_reset;
-	unsigned int num_bits_resol;
-	const unsigned int *reg_values;
-	const struct exynos_dsi_host_ops *host_ops;
-};
-
 struct exynos_dsi {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
@@ -400,201 +370,6 @@ static inline u32 exynos_dsi_read(struct exynos_dsi *dsi, enum reg_idx idx)
 	return readl(dsi->reg_base + reg_ofs[idx]);
 }
 
-enum reg_value_idx {
-	RESET_TYPE,
-	PLL_TIMER,
-	STOP_STATE_CNT,
-	PHYCTRL_ULPS_EXIT,
-	PHYCTRL_VREG_LP,
-	PHYCTRL_SLEW_UP,
-	PHYTIMING_LPX,
-	PHYTIMING_HS_EXIT,
-	PHYTIMING_CLK_PREPARE,
-	PHYTIMING_CLK_ZERO,
-	PHYTIMING_CLK_POST,
-	PHYTIMING_CLK_TRAIL,
-	PHYTIMING_HS_PREPARE,
-	PHYTIMING_HS_ZERO,
-	PHYTIMING_HS_TRAIL
-};
-
-struct exynos_dsi_pltfm {
-	struct exynos_dsi *dsi;
-	struct drm_encoder encoder;
-};
-
-static const unsigned int reg_values[] = {
-	[RESET_TYPE] = DSIM_SWRST,
-	[PLL_TIMER] = 500,
-	[STOP_STATE_CNT] = 0xf,
-	[PHYCTRL_ULPS_EXIT] = 0x0af,
-	[PHYCTRL_VREG_LP] = 0,
-	[PHYCTRL_SLEW_UP] = 0,
-	[PHYTIMING_LPX] = 0x06,
-	[PHYTIMING_HS_EXIT] = 0x0b,
-	[PHYTIMING_CLK_PREPARE] = 0x07,
-	[PHYTIMING_CLK_ZERO] = 0x27,
-	[PHYTIMING_CLK_POST] = 0x0d,
-	[PHYTIMING_CLK_TRAIL] = 0x08,
-	[PHYTIMING_HS_PREPARE] = 0x09,
-	[PHYTIMING_HS_ZERO] = 0x0d,
-	[PHYTIMING_HS_TRAIL] = 0x0b,
-};
-
-static const unsigned int exynos5422_reg_values[] = {
-	[RESET_TYPE] = DSIM_SWRST,
-	[PLL_TIMER] = 500,
-	[STOP_STATE_CNT] = 0xf,
-	[PHYCTRL_ULPS_EXIT] = 0xaf,
-	[PHYCTRL_VREG_LP] = 0,
-	[PHYCTRL_SLEW_UP] = 0,
-	[PHYTIMING_LPX] = 0x08,
-	[PHYTIMING_HS_EXIT] = 0x0d,
-	[PHYTIMING_CLK_PREPARE] = 0x09,
-	[PHYTIMING_CLK_ZERO] = 0x30,
-	[PHYTIMING_CLK_POST] = 0x0e,
-	[PHYTIMING_CLK_TRAIL] = 0x0a,
-	[PHYTIMING_HS_PREPARE] = 0x0c,
-	[PHYTIMING_HS_ZERO] = 0x11,
-	[PHYTIMING_HS_TRAIL] = 0x0d,
-};
-
-static const unsigned int exynos5433_reg_values[] = {
-	[RESET_TYPE] = DSIM_FUNCRST,
-	[PLL_TIMER] = 22200,
-	[STOP_STATE_CNT] = 0xa,
-	[PHYCTRL_ULPS_EXIT] = 0x190,
-	[PHYCTRL_VREG_LP] = 1,
-	[PHYCTRL_SLEW_UP] = 1,
-	[PHYTIMING_LPX] = 0x07,
-	[PHYTIMING_HS_EXIT] = 0x0c,
-	[PHYTIMING_CLK_PREPARE] = 0x09,
-	[PHYTIMING_CLK_ZERO] = 0x2d,
-	[PHYTIMING_CLK_POST] = 0x0e,
-	[PHYTIMING_CLK_TRAIL] = 0x09,
-	[PHYTIMING_HS_PREPARE] = 0x0b,
-	[PHYTIMING_HS_ZERO] = 0x10,
-	[PHYTIMING_HS_TRAIL] = 0x0c,
-};
-
-static int __exynos_dsi_host_attach(struct device *dev,
-				    struct mipi_dsi_device *device)
-{
-	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
-	struct drm_device *drm = dsi->encoder.dev;
-	struct exynos_drm_crtc *crtc;
-
-	mutex_lock(&drm->mode_config.mutex);
-	crtc = exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD);
-	crtc->i80_mode = !(device->mode_flags & MIPI_DSI_MODE_VIDEO);
-	mutex_unlock(&drm->mode_config.mutex);
-
-	if (drm->mode_config.poll_enabled)
-		drm_kms_helper_hotplug_event(drm);
-
-	return 0;
-}
-
-static int __exynos_dsi_host_detach(struct device *dev,
-				     struct mipi_dsi_device *device)
-{
-	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
-	struct drm_device *drm = dsi->encoder.dev;
-
-	if (drm->mode_config.poll_enabled)
-		drm_kms_helper_hotplug_event(drm);
-
-	return 0;
-}
-
-static void __exynos_dsi_te_handler(struct device *dev)
-{
-	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
-
-	exynos_drm_crtc_te_handler(dsi->encoder.crtc);
-}
-
-static const struct exynos_dsi_host_ops exynos_dsi_host_ops = {
-	.attach = __exynos_dsi_host_attach,
-	.detach = __exynos_dsi_host_detach,
-	.te_handler = __exynos_dsi_te_handler,
-};
-
-static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
-	.reg_ofs = EXYNOS_REG_OFS,
-	.plltmr_reg = 0x50,
-	.has_freqband = 1,
-	.has_clklane_stop = 1,
-	.num_clks = 2,
-	.max_freq = 1000,
-	.wait_for_reset = 1,
-	.num_bits_resol = 11,
-	.reg_values = reg_values,
-	.host_ops = &exynos_dsi_host_ops,
-};
-
-static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
-	.reg_ofs = EXYNOS_REG_OFS,
-	.plltmr_reg = 0x50,
-	.has_freqband = 1,
-	.has_clklane_stop = 1,
-	.num_clks = 2,
-	.max_freq = 1000,
-	.wait_for_reset = 1,
-	.num_bits_resol = 11,
-	.reg_values = reg_values,
-	.host_ops = &exynos_dsi_host_ops,
-};
-
-static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
-	.reg_ofs = EXYNOS_REG_OFS,
-	.plltmr_reg = 0x58,
-	.num_clks = 2,
-	.max_freq = 1000,
-	.wait_for_reset = 1,
-	.num_bits_resol = 11,
-	.reg_values = reg_values,
-	.host_ops = &exynos_dsi_host_ops,
-};
-
-static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
-	.reg_ofs = EXYNOS5433_REG_OFS,
-	.plltmr_reg = 0xa0,
-	.has_clklane_stop = 1,
-	.num_clks = 5,
-	.max_freq = 1500,
-	.wait_for_reset = 0,
-	.num_bits_resol = 12,
-	.reg_values = exynos5433_reg_values,
-	.host_ops = &exynos_dsi_host_ops,
-};
-
-static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
-	.reg_ofs = EXYNOS5433_REG_OFS,
-	.plltmr_reg = 0xa0,
-	.has_clklane_stop = 1,
-	.num_clks = 2,
-	.max_freq = 1500,
-	.wait_for_reset = 1,
-	.num_bits_resol = 12,
-	.reg_values = exynos5422_reg_values,
-	.host_ops = &exynos_dsi_host_ops,
-};
-
-static const struct of_device_id exynos_dsi_of_match[] = {
-	{ .compatible = "samsung,exynos3250-mipi-dsi",
-	  .data = &exynos3_dsi_driver_data },
-	{ .compatible = "samsung,exynos4210-mipi-dsi",
-	  .data = &exynos4_dsi_driver_data },
-	{ .compatible = "samsung,exynos5410-mipi-dsi",
-	  .data = &exynos5_dsi_driver_data },
-	{ .compatible = "samsung,exynos5422-mipi-dsi",
-	  .data = &exynos5422_dsi_driver_data },
-	{ .compatible = "samsung,exynos5433-mipi-dsi",
-	  .data = &exynos5433_dsi_driver_data },
-	{ }
-};
-
 static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
 {
 	if (wait_for_completion_timeout(&dsi->completed, msecs_to_jiffies(300)))
@@ -1677,8 +1452,6 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.mode_set = exynos_dsi_bridge_mode_set,
 };
 
-MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
-
 static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
@@ -1779,11 +1552,6 @@ static int exynos_dsi_of_read_u32(const struct device_node *np,
 	return ret;
 }
 
-enum {
-	DSI_PORT_IN,
-	DSI_PORT_OUT
-};
-
 static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 {
 	struct device *dev = dsi->dev;
@@ -1808,59 +1576,6 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static int exynos_dsi_bind(struct exynos_dsi *dsi, struct drm_encoder *encoder);
-static void exynos_dsi_unbind(struct exynos_dsi *dsi);
-
-static int exynos_dsi_pltfm_bind(struct device *dev, struct device *master, void *data)
-{
-	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_device *drm_dev = data;
-	struct device_node *in_bridge_node;
-	struct drm_bridge *in_bridge;
-	int ret;
-
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
-
-	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
-	if (ret < 0)
-		return ret;
-
-	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
-	if (in_bridge_node) {
-		in_bridge = of_drm_find_bridge(in_bridge_node);
-		if (in_bridge)
-			drm_bridge_attach(encoder, in_bridge, NULL, 0);
-		of_node_put(in_bridge_node);
-	}
-
-	ret = exynos_dsi_bind(dsi->dsi, encoder);
-	if (ret)
-		goto err;
-
-	return 0;
-
-err:
-	drm_encoder_cleanup(encoder);
-	return ret;
-}
-
-static void exynos_dsi_pltfm_unbind(struct device *dev, struct device *master,
-				    void *data)
-{
-	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dsi->encoder;
-
-	exynos_dsi_unbind(dsi->dsi);
-
-	drm_encoder_cleanup(encoder);
-}
-
-static const struct component_ops exynos_dsi_pltfm_component_ops = {
-	.bind	= exynos_dsi_pltfm_bind,
-	.unbind	= exynos_dsi_pltfm_unbind,
-};
-
 static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1972,12 +1687,12 @@ static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 /*
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
-static struct exynos_dsi *exynos_dsi_probe(struct platform_device *pdev)
+struct exynos_dsi *exynos_dsi_probe(struct platform_device *pdev)
 {
 	return __exynos_dsi_probe(pdev);
 }
 
-static void exynos_dsi_remove(struct exynos_dsi *dsi)
+void exynos_dsi_remove(struct exynos_dsi *dsi)
 {
 	return __exynos_dsi_remove(dsi);
 }
@@ -1985,61 +1700,19 @@ static void exynos_dsi_remove(struct exynos_dsi *dsi)
 /*
  * Bind/unbind API, used from platforms based on the component framework.
  */
-static int exynos_dsi_bind(struct exynos_dsi *dsi, struct drm_encoder *encoder)
+int exynos_dsi_bind(struct exynos_dsi *dsi, struct drm_encoder *encoder)
 {
 	struct drm_bridge *previous = drm_bridge_chain_get_first_bridge(encoder);
 
 	return drm_bridge_attach(encoder, &dsi->bridge, previous, 0);
 }
 
-static void exynos_dsi_unbind(struct exynos_dsi *dsi)
+void exynos_dsi_unbind(struct exynos_dsi *dsi)
 {
 	exynos_dsi_disable(dsi);
 }
 
-static int exynos_dsi_pltfm_probe(struct platform_device *pdev)
-{
-	struct exynos_dsi_pltfm *dsi;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
-	if (!dsi)
-		return -ENOMEM;
-	platform_set_drvdata(pdev, dsi);
-
-	dsi->dsi = exynos_dsi_probe(pdev);
-	if (IS_ERR(dsi->dsi))
-		return PTR_ERR(dsi->dsi);
-
-	pm_runtime_enable(dev);
-
-	ret = component_add(dev, &exynos_dsi_pltfm_component_ops);
-	if (ret)
-		goto err_disable_runtime;
-
-	return 0;
-
-err_disable_runtime:
-	pm_runtime_disable(dev);
-
-	return ret;
-}
-
-static int exynos_dsi_pltfm_remove(struct platform_device *pdev)
-{
-	struct exynos_dsi_pltfm *dsi = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(&pdev->dev);
-
-	exynos_dsi_remove(dsi->dsi);
-
-	component_del(&pdev->dev, &exynos_dsi_pltfm_component_ops);
-
-	return 0;
-}
-
-static int exynos_dsi_suspend(struct exynos_dsi *dsi)
+int exynos_dsi_suspend(struct exynos_dsi *dsi)
 {
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
@@ -2068,7 +1741,7 @@ static int exynos_dsi_suspend(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static int exynos_dsi_resume(struct exynos_dsi *dsi)
+int exynos_dsi_resume(struct exynos_dsi *dsi)
 {
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
@@ -2101,37 +1774,6 @@ static int exynos_dsi_resume(struct exynos_dsi *dsi)
 	return ret;
 }
 
-static int __maybe_unused exynos_dsi_pltfm_suspend(struct device *dev)
-{
-	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
-
-	return exynos_dsi_suspend(dsi->dsi);
-}
-
-static int __maybe_unused exynos_dsi_pltfm_resume(struct device *dev)
-{
-	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
-
-	return exynos_dsi_resume(dsi->dsi);
-}
-
-static const struct dev_pm_ops exynos_dsi_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos_dsi_pltfm_suspend, exynos_dsi_pltfm_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-};
-
-struct platform_driver dsi_driver = {
-	.probe = exynos_dsi_pltfm_probe,
-	.remove = exynos_dsi_pltfm_remove,
-	.driver = {
-		   .name = "exynos-dsi",
-		   .owner = THIS_MODULE,
-		   .pm = &exynos_dsi_pm_ops,
-		   .of_match_table = exynos_dsi_of_match,
-	},
-};
-
 MODULE_AUTHOR("Tomasz Figa <t.figa@samsung.com>");
 MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
 MODULE_DESCRIPTION("Samsung SoC MIPI DSI Master");
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.h b/drivers/gpu/drm/exynos/exynos_drm_dsi.h
new file mode 100644
index 000000000000..8fa3276889de
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __EXYNOS_DRM_DSI__
+#define __EXYNOS_DRM_DSI__
+
+struct drm_encoder;
+struct exynos_dsi;
+struct platform_device;
+struct mipi_dsi_device;
+
+enum exynos_reg_offset {
+	EXYNOS_REG_OFS,
+	EXYNOS5433_REG_OFS
+};
+
+struct exynos_dsi *exynos_dsi_probe(struct platform_device *pdev);
+void exynos_dsi_remove(struct exynos_dsi *dsi);
+int exynos_dsi_bind(struct exynos_dsi *dsi, struct drm_encoder *encoder);
+void exynos_dsi_unbind(struct exynos_dsi *dsi);
+
+int exynos_dsi_suspend(struct exynos_dsi *dsi);
+int exynos_dsi_resume(struct exynos_dsi *dsi);
+
+enum reg_value_idx {
+	RESET_TYPE,
+	PLL_TIMER,
+	STOP_STATE_CNT,
+	PHYCTRL_ULPS_EXIT,
+	PHYCTRL_VREG_LP,
+	PHYCTRL_SLEW_UP,
+	PHYTIMING_LPX,
+	PHYTIMING_HS_EXIT,
+	PHYTIMING_CLK_PREPARE,
+	PHYTIMING_CLK_ZERO,
+	PHYTIMING_CLK_POST,
+	PHYTIMING_CLK_TRAIL,
+	PHYTIMING_HS_PREPARE,
+	PHYTIMING_HS_ZERO,
+	PHYTIMING_HS_TRAIL
+};
+
+/* DSIM_SWRST */
+#define DSIM_FUNCRST			(1 << 16)
+#define DSIM_SWRST			(1 << 0)
+
+struct exynos_dsi_host_ops {
+	int (*attach)(struct device *dev, struct mipi_dsi_device *device);
+	int (*detach)(struct device *dev, struct mipi_dsi_device *device);
+	void (*te_handler)(struct device *dev);
+};
+
+struct exynos_dsi_driver_data {
+	enum exynos_reg_offset reg_ofs;
+	unsigned int plltmr_reg;
+	unsigned int has_freqband:1;
+	unsigned int has_clklane_stop:1;
+	unsigned int num_clks;
+	unsigned int max_freq;
+	unsigned int wait_for_reset;
+	unsigned int num_bits_resol;
+	const unsigned int *reg_values;
+	const struct exynos_dsi_host_ops *host_ops;
+};
+
+#endif /* __EXYNOS_DRM_DSI__ */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c b/drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c
new file mode 100644
index 000000000000..79d9ec6ade45
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi_pltfm.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Samsung SoC MIPI DSI Master driver.
+ *
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd
+ *
+ * Contacts: Tomasz Figa <t.figa@samsung.com>
+ */
+
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "exynos_drm_crtc.h"
+#include "exynos_drm_drv.h"
+#include "exynos_drm_dsi.h"
+
+enum {
+	DSI_PORT_IN,
+	DSI_PORT_OUT
+};
+
+struct exynos_dsi_pltfm {
+	struct exynos_dsi *dsi;
+	struct drm_encoder encoder;
+};
+
+static const unsigned int reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = 0x0af,
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = 0x06,
+	[PHYTIMING_HS_EXIT] = 0x0b,
+	[PHYTIMING_CLK_PREPARE] = 0x07,
+	[PHYTIMING_CLK_ZERO] = 0x27,
+	[PHYTIMING_CLK_POST] = 0x0d,
+	[PHYTIMING_CLK_TRAIL] = 0x08,
+	[PHYTIMING_HS_PREPARE] = 0x09,
+	[PHYTIMING_HS_ZERO] = 0x0d,
+	[PHYTIMING_HS_TRAIL] = 0x0b,
+};
+
+static const unsigned int exynos5422_reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = 0xaf,
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = 0x08,
+	[PHYTIMING_HS_EXIT] = 0x0d,
+	[PHYTIMING_CLK_PREPARE] = 0x09,
+	[PHYTIMING_CLK_ZERO] = 0x30,
+	[PHYTIMING_CLK_POST] = 0x0e,
+	[PHYTIMING_CLK_TRAIL] = 0x0a,
+	[PHYTIMING_HS_PREPARE] = 0x0c,
+	[PHYTIMING_HS_ZERO] = 0x11,
+	[PHYTIMING_HS_TRAIL] = 0x0d,
+};
+
+static const unsigned int exynos5433_reg_values[] = {
+	[RESET_TYPE] = DSIM_FUNCRST,
+	[PLL_TIMER] = 22200,
+	[STOP_STATE_CNT] = 0xa,
+	[PHYCTRL_ULPS_EXIT] = 0x190,
+	[PHYCTRL_VREG_LP] = 1,
+	[PHYCTRL_SLEW_UP] = 1,
+	[PHYTIMING_LPX] = 0x07,
+	[PHYTIMING_HS_EXIT] = 0x0c,
+	[PHYTIMING_CLK_PREPARE] = 0x09,
+	[PHYTIMING_CLK_ZERO] = 0x2d,
+	[PHYTIMING_CLK_POST] = 0x0e,
+	[PHYTIMING_CLK_TRAIL] = 0x09,
+	[PHYTIMING_HS_PREPARE] = 0x0b,
+	[PHYTIMING_HS_ZERO] = 0x10,
+	[PHYTIMING_HS_TRAIL] = 0x0c,
+};
+
+static int __exynos_dsi_host_attach(struct device *dev,
+				    struct mipi_dsi_device *device)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+	struct drm_device *drm = dsi->encoder.dev;
+	struct exynos_drm_crtc *crtc;
+
+	mutex_lock(&drm->mode_config.mutex);
+	crtc = exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD);
+	crtc->i80_mode = !(device->mode_flags & MIPI_DSI_MODE_VIDEO);
+	mutex_unlock(&drm->mode_config.mutex);
+
+	if (drm->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(drm);
+
+	return 0;
+}
+
+static int __exynos_dsi_host_detach(struct device *dev,
+				    struct mipi_dsi_device *device)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+	struct drm_device *drm = dsi->encoder.dev;
+
+	if (drm->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(drm);
+
+	return 0;
+}
+
+static void __exynos_dsi_te_handler(struct device *dev)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	exynos_drm_crtc_te_handler(dsi->encoder.crtc);
+}
+
+static const struct exynos_dsi_host_ops exynos_dsi_host_ops = {
+	.attach = __exynos_dsi_host_attach,
+	.detach = __exynos_dsi_host_detach,
+	.te_handler = __exynos_dsi_te_handler,
+};
+
+static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
+	.reg_ofs = EXYNOS_REG_OFS,
+	.plltmr_reg = 0x50,
+	.has_freqband = 1,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
+	.host_ops = &exynos_dsi_host_ops,
+};
+
+static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
+	.reg_ofs = EXYNOS_REG_OFS,
+	.plltmr_reg = 0x50,
+	.has_freqband = 1,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
+	.host_ops = &exynos_dsi_host_ops,
+};
+
+static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
+	.reg_ofs = EXYNOS_REG_OFS,
+	.plltmr_reg = 0x58,
+	.num_clks = 2,
+	.max_freq = 1000,
+	.wait_for_reset = 1,
+	.num_bits_resol = 11,
+	.reg_values = reg_values,
+	.host_ops = &exynos_dsi_host_ops,
+};
+
+static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
+	.reg_ofs = EXYNOS5433_REG_OFS,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 5,
+	.max_freq = 1500,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	.reg_values = exynos5433_reg_values,
+	.host_ops = &exynos_dsi_host_ops,
+};
+
+static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
+	.reg_ofs = EXYNOS5433_REG_OFS,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1500,
+	.wait_for_reset = 1,
+	.num_bits_resol = 12,
+	.reg_values = exynos5422_reg_values,
+	.host_ops = &exynos_dsi_host_ops,
+};
+
+static const struct of_device_id exynos_dsi_of_match[] = {
+	{ .compatible = "samsung,exynos3250-mipi-dsi",
+	  .data = &exynos3_dsi_driver_data },
+	{ .compatible = "samsung,exynos4210-mipi-dsi",
+	  .data = &exynos4_dsi_driver_data },
+	{ .compatible = "samsung,exynos5410-mipi-dsi",
+	  .data = &exynos5_dsi_driver_data },
+	{ .compatible = "samsung,exynos5422-mipi-dsi",
+	  .data = &exynos5422_dsi_driver_data },
+	{ .compatible = "samsung,exynos5433-mipi-dsi",
+	  .data = &exynos5433_dsi_driver_data },
+	{ }
+};
+
+static int exynos_dsi_pltfm_bind(struct device *dev, struct device *master, void *data)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+	struct drm_encoder *encoder = &dsi->encoder;
+	struct drm_device *drm_dev = data;
+	struct device_node *in_bridge_node;
+	struct drm_bridge *in_bridge;
+	int ret;
+
+	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+
+	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
+	if (ret < 0)
+		return ret;
+
+	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
+	if (in_bridge_node) {
+		in_bridge = of_drm_find_bridge(in_bridge_node);
+		if (in_bridge)
+			drm_bridge_attach(encoder, in_bridge, NULL, 0);
+		of_node_put(in_bridge_node);
+	}
+
+	ret = exynos_dsi_bind(dsi->dsi, encoder);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	drm_encoder_cleanup(encoder);
+	return ret;
+}
+
+static void exynos_dsi_pltfm_unbind(struct device *dev, struct device *master,
+				    void *data)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+	struct drm_encoder *encoder = &dsi->encoder;
+
+	exynos_dsi_unbind(dsi->dsi);
+
+	drm_encoder_cleanup(encoder);
+}
+
+static const struct component_ops exynos_dsi_pltfm_component_ops = {
+	.bind	= exynos_dsi_pltfm_bind,
+	.unbind	= exynos_dsi_pltfm_unbind,
+};
+
+static int exynos_dsi_pltfm_probe(struct platform_device *pdev)
+{
+	struct exynos_dsi_pltfm *dsi;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, dsi);
+
+	dsi->dsi = exynos_dsi_probe(pdev);
+	if (IS_ERR(dsi->dsi))
+		return PTR_ERR(dsi->dsi);
+
+	pm_runtime_enable(dev);
+
+	ret = component_add(dev, &exynos_dsi_pltfm_component_ops);
+	if (ret)
+		goto err_disable_runtime;
+
+	return 0;
+
+err_disable_runtime:
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int exynos_dsi_pltfm_remove(struct platform_device *pdev)
+{
+	struct exynos_dsi_pltfm *dsi = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	exynos_dsi_remove(dsi->dsi);
+
+	component_del(&pdev->dev, &exynos_dsi_pltfm_component_ops);
+
+	return 0;
+}
+
+static int __maybe_unused exynos_dsi_pltfm_suspend(struct device *dev)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	return exynos_dsi_suspend(dsi->dsi);
+}
+
+static int __maybe_unused exynos_dsi_pltfm_resume(struct device *dev)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	return exynos_dsi_resume(dsi->dsi);
+}
+
+static const struct dev_pm_ops exynos_dsi_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos_dsi_pltfm_suspend, exynos_dsi_pltfm_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+struct platform_driver dsi_driver = {
+	.probe = exynos_dsi_pltfm_probe,
+	.remove = exynos_dsi_pltfm_remove,
+	.driver = {
+		   .name = "exynos-dsi",
+		   .owner = THIS_MODULE,
+		   .pm = &exynos_dsi_pm_ops,
+		   .of_match_table = exynos_dsi_of_match,
+	},
+};
+
+MODULE_AUTHOR("Tomasz Figa <t.figa@samsung.com>");
+MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
+MODULE_DESCRIPTION("Samsung SoC MIPI DSI Master");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
