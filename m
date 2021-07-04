Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B13BAC48
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD0E89D66;
	Sun,  4 Jul 2021 09:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14EA89D5E
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:04:53 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id kt19so9579126pjb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8DbojDoEb5uY2A25IR0p63F/P/5IlsfDnb3J5qKSYc=;
 b=rEorpVedLG1oQSRSSrGYnCBfnLDbabcwXssx1B6hMLIqKt69o4ff788l87rMdxf/pp
 pwDtiBvQJtdNdVn/k8VG9HVHce/GFm8U/2ylCENloi5gRCYHqPLAN42Ji5H/paBAAaMr
 LXScI9ZNQLzeSwjkN8Sxf64eJQtK5noK3fuu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8DbojDoEb5uY2A25IR0p63F/P/5IlsfDnb3J5qKSYc=;
 b=m7kf26/OjYjRAGFBTuEpekoE1Ii1jgL+zP6suowPeAL9NulshbOqdqOGTjQkAWWI6H
 nZRWMvPhNbKIH7FnnDk1S6nrGKP5+Zz1S2LgnHNYMAO6ut7Oyr7+X34ELHGqrPGZY6Fg
 tHq2JlAmiMVr+J1Y5nd/wAZzS+r590pul/cLUDzCS15jqWFxWBqLJVD6jGr2XzE0bh6d
 4QQJZ8kMOZaAbxjGuar7TWXNB1QXpD+gCBtjcvFqJL+g6B1RL72T0TNekwWkjR6oAUiu
 kiIj/ujRDiKZnqtBfcNbT+EobqmFUwIiFs8P4DCRJPjsQ2eEeBM5X2/XPtFMI+qeMo8+
 1rHA==
X-Gm-Message-State: AOAM531IfOE8j5pX6dquwrmUUNR3Q2N/DGYbXFjb7LH/UZjn488+1lEt
 W0sbx+Od1sCBCZzONMLNigwv8A==
X-Google-Smtp-Source: ABdhPJzYYBARwzR5yMlFsILzXaBPaBOK0zUuORaq+uVPg1s53a5rVb2Ko/Qi+cQQksrJdZ+L3SbLmA==
X-Received: by 2002:a17:90a:1d43:: with SMTP id
 u3mr8833730pju.121.1625389493174; 
 Sun, 04 Jul 2021 02:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:04:52 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 07/17] drm: bridge: Move exynos_drm_dsi into bridges
Date: Sun,  4 Jul 2021 14:32:20 +0530
Message-Id: <20210704090230.26489-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MIPI DSI IP used in Exynos and i.MX8MM are based
Samsung MIPI DSIM bridge.
   
In order to access the common bridge between platforms
the ideal way to push the driver into the bridge area.
   
So, this patch will move the exynos_drm_dsi.c driver
into samsung-dsim.c and do the necessary function name
changes.
   
This would help to improve the bridge driver in future
patches in order to make use of different SoC families
and platforms.

The bridge now support two implementations,

A. With component_ops and exynos specific code exclusively
   for exynos dsi drivers and it's legacy bindings.

B. Without componenet_ops for newly implemented bridges
   and its users like i.MX8MM.

The future plan is to fix the implementation A) by dropping
component_ops and fixing exynos specific code in order to
make the bridge more mature to use.

Updated MAINTAINERS file for this bridge with exynos drm
maintainers along with Andrzej as he is the original author.

Tomasz Figa has been not included in MAINTAINERS as he is
not available via samsung.com.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 MAINTAINERS                                   |  11 +
 drivers/gpu/drm/bridge/Kconfig                |  15 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../samsung-dsim.c}                           | 433 +++++++++---------
 drivers/gpu/drm/exynos/Kconfig                |   9 -
 drivers/gpu/drm/exynos/Makefile               |   1 -
 6 files changed, 246 insertions(+), 224 deletions(-)
 rename drivers/gpu/drm/{exynos/exynos_drm_dsi.c => bridge/samsung-dsim.c} (77%)

diff --git a/MAINTAINERS b/MAINTAINERS
index cae0c6148590..733c2ebc0393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5864,6 +5864,17 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-db7430.c
 
+DRM DRIVER FOR SAMSUNG MIPI DSIM BRIDGE
+M:	Inki Dae <inki.dae@samsung.com>
+M:	Joonyoung Shim <jy0922.shim@samsung.com>
+M:	Seung-Woo Kim <sw0312.kim@samsung.com>
+M:	Kyungmin Park <kyungmin.park@samsung.com>
+M:	Andrzej Hajda <a.hajda@samsung.com>
+M:	Jagan Teki <jagan@amarulasolutions.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/bridge/samsung-dsim.c
+
 DRM DRIVER FOR SITRONIX ST7703 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
 R:	Purism Kernel Team <kernel@puri.sm>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 4de6dbb8821b..c8a3b13f730b 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -190,6 +190,21 @@ config DRM_PARADE_PS8640
 	  The PS8640 is a high-performance and low-power
 	  MIPI DSI to eDP converter
 
+config DRM_SAMSUNG_DSIM
+	tristate "Samsung MIPI DSIM bridge driver"
+	depends on DRM
+	depends on COMMON_CLK
+	depends on OF && HAS_IOMEM
+	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS5433_DECON || DRM_EXYNOS7_DECON
+	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
+	select DRM_PANEL_BRIDGE
+	select REGMAP_MMIO
+	help
+	  This enables the Samsung MIPI DSIM bridge controller driver.
+	  This MIPI DSIM bridge can be found it on Exynos and NXP's
+	  i.MX8M Mini and Nano SoC's.
+
 config DRM_SIL_SII8620
 	tristate "Silicon Image SII8620 HDMI/MHL bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index ec2b9fa2699e..1eb04e4857e5 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
+obj-$(CONFIG_DRM_SAMSUNG_DSIM) += samsung-dsim.o
 obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
 obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_SII9234) += sii9234.o
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/bridge/samsung-dsim.c
similarity index 77%
rename from drivers/gpu/drm/exynos/exynos_drm_dsi.c
rename to drivers/gpu/drm/bridge/samsung-dsim.c
index 53d878d4d2d7..eed6b3ffdea7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1,11 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Samsung SoC MIPI DSI Master driver.
+ * Samsung MIPI DSIM bridge driver.
  *
+ * Copyright (C) 2021 Amarula Solutions(India)
  * Copyright (c) 2014 Samsung Electronics Co., Ltd
  *
- * Contacts: Tomasz Figa <t.figa@samsung.com>
-*/
+ * TODO:
+ * - Move or handle exynos specifics in exynos drm drivers stack.
+ * - Try to drop component_ops, but it indeed require to change
+ *   exynos drm drivers stack.
+ */
 
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -33,8 +37,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
-#include "exynos_drm_crtc.h"
-#include "exynos_drm_drv.h"
+#include "../exynos/exynos_drm_crtc.h"
+#include "../exynos/exynos_drm_drv.h"
 
 /* returns true iff both arguments logically differs */
 #define NEQV(a, b) (!(a) ^ !(b))
@@ -217,12 +221,12 @@ static const char *const clk_names[5] = { "bus_clk", "sclk_mipi",
 	"phyclk_mipidphy0_bitclkdiv8", "phyclk_mipidphy0_rxclkesc0",
 	"sclk_rgb_vclk_to_dsim0" };
 
-enum exynos_dsi_transfer_type {
+enum samsung_dsim_transfer_type {
 	EXYNOS_DSI_TX,
 	EXYNOS_DSI_RX,
 };
 
-struct exynos_dsi_transfer {
+struct samsung_dsim_transfer {
 	struct list_head list;
 	struct completion completed;
 	int result;
@@ -240,7 +244,7 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
-struct exynos_dsi_driver_data {
+struct samsung_dsim_driver_data {
 	const unsigned int *reg_ofs;
 	unsigned int plltmr_reg;
 	unsigned int has_freqband:1;
@@ -253,7 +257,7 @@ struct exynos_dsi_driver_data {
 	bool exynos_specific;
 };
 
-struct exynos_dsi {
+struct samsung_dsim {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 	struct drm_bridge bridge;
@@ -283,14 +287,14 @@ struct exynos_dsi {
 	spinlock_t transfer_lock; /* protects transfer_list */
 	struct list_head transfer_list;
 
-	const struct exynos_dsi_driver_data *driver_data;
+	const struct samsung_dsim_driver_data *driver_data;
 };
 
-#define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
+#define host_to_dsi(host) container_of(host, struct samsung_dsim, dsi_host)
 
-static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
+static inline struct samsung_dsim *bridge_to_dsi(struct drm_bridge *b)
 {
-	return container_of(b, struct exynos_dsi, bridge);
+	return container_of(b, struct samsung_dsim, bridge);
 }
 
 enum reg_idx {
@@ -318,14 +322,14 @@ enum reg_idx {
 	NUM_REGS
 };
 
-static inline void exynos_dsi_write(struct exynos_dsi *dsi, enum reg_idx idx,
-				    u32 val)
+static inline void samsung_dsim_write(struct samsung_dsim *dsi, enum reg_idx idx,
+				      u32 val)
 {
 
 	writel(val, dsi->reg_base + dsi->driver_data->reg_ofs[idx]);
 }
 
-static inline u32 exynos_dsi_read(struct exynos_dsi *dsi, enum reg_idx idx)
+static inline u32 samsung_dsim_read(struct samsung_dsim *dsi, enum reg_idx idx)
 {
 	return readl(dsi->reg_base + dsi->driver_data->reg_ofs[idx]);
 }
@@ -450,7 +454,7 @@ static const unsigned int exynos5433_reg_values[] = {
 	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
 };
 
-static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
+static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
@@ -463,7 +467,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.exynos_specific = true,
 };
 
-static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
+static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
@@ -476,7 +480,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 	.exynos_specific = true,
 };
 
-static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
+static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x58,
 	.num_clks = 2,
@@ -487,7 +491,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.exynos_specific = true,
 };
 
-static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
+static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
 	.has_clklane_stop = 1,
@@ -499,7 +503,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 	.exynos_specific = true,
 };
 
-static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
+static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
 	.has_clklane_stop = 1,
@@ -511,7 +515,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.exynos_specific = true,
 };
 
-static const struct of_device_id exynos_dsi_of_match[] = {
+static const struct of_device_id samsung_dsim_of_match[] = {
 	{ .compatible = "samsung,exynos3250-mipi-dsi",
 	  .data = &exynos3_dsi_driver_data },
 	{ .compatible = "samsung,exynos4210-mipi-dsi",
@@ -525,7 +529,7 @@ static const struct of_device_id exynos_dsi_of_match[] = {
 	{ }
 };
 
-static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
+static void samsung_dsim_wait_for_reset(struct samsung_dsim *dsi)
 {
 	if (wait_for_completion_timeout(&dsi->completed, msecs_to_jiffies(300)))
 		return;
@@ -533,22 +537,22 @@ static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
 	dev_err(dsi->dev, "timeout waiting for reset\n");
 }
 
-static void exynos_dsi_reset(struct exynos_dsi *dsi)
+static void samsung_dsim_reset(struct samsung_dsim *dsi)
 {
 	u32 reset_val = dsi->driver_data->reg_values[RESET_TYPE];
 
 	reinit_completion(&dsi->completed);
-	exynos_dsi_write(dsi, DSIM_SWRST_REG, reset_val);
+	samsung_dsim_write(dsi, DSIM_SWRST_REG, reset_val);
 }
 
 #ifndef MHZ
 #define MHZ	(1000*1000)
 #endif
 
-static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
+static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
 		unsigned long fin, unsigned long fout, u8 *p, u16 *m, u8 *s)
 {
-	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	unsigned long best_freq = 0;
 	u32 min_delta = 0xffffffff;
 	u8 p_min, p_max;
@@ -599,10 +603,10 @@ static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
 	return best_freq;
 }
 
-static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
-					unsigned long freq)
+static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
+					  unsigned long freq)
 {
-	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	unsigned long fin, fout;
 	int timeout;
 	u8 p, s;
@@ -610,7 +614,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 	u32 reg;
 
 	fin = dsi->pll_clk_rate;
-	fout = exynos_dsi_pll_find_pms(dsi, fin, freq, &p, &m, &s);
+	fout = samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
 	if (!fout) {
 		dev_err(dsi->dev,
 			"failed to find PLL PMS for requested frequency\n");
@@ -641,7 +645,7 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 		reg |= DSIM_FREQ_BAND(band);
 	}
 
-	exynos_dsi_write(dsi, DSIM_PLLCTRL_REG, reg);
+	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
 	timeout = 1000;
 	do {
@@ -649,19 +653,19 @@ static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 			dev_err(dsi->dev, "PLL failed to stabilize\n");
 			return 0;
 		}
-		reg = exynos_dsi_read(dsi, DSIM_STATUS_REG);
+		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);
 
 	return fout;
 }
 
-static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
+static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 {
 	unsigned long hs_clk, byte_clk, esc_clk;
 	unsigned long esc_div;
 	u32 reg;
 
-	hs_clk = exynos_dsi_set_pll(dsi, dsi->burst_clk_rate);
+	hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
 	if (!hs_clk) {
 		dev_err(dsi->dev, "failed to configure DSI PLL\n");
 		return -EFAULT;
@@ -679,7 +683,7 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 	dev_dbg(dsi->dev, "hs_clk = %lu, byte_clk = %lu, esc_clk = %lu\n",
 		hs_clk, byte_clk, esc_clk);
 
-	reg = exynos_dsi_read(dsi, DSIM_CLKCTRL_REG);
+	reg = samsung_dsim_read(dsi, DSIM_CLKCTRL_REG);
 	reg &= ~(DSIM_ESC_PRESCALER_MASK | DSIM_LANE_ESC_CLK_EN_CLK
 			| DSIM_LANE_ESC_CLK_EN_DATA_MASK | DSIM_PLL_BYPASS
 			| DSIM_BYTE_CLK_SRC_MASK);
@@ -689,14 +693,14 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
 			| DSIM_BYTE_CLK_SRC(0)
 			| DSIM_TX_REQUEST_HSCLK;
-	exynos_dsi_write(dsi, DSIM_CLKCTRL_REG, reg);
+	samsung_dsim_write(dsi, DSIM_CLKCTRL_REG, reg);
 
 	return 0;
 }
 
-static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
+static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 {
-	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	const unsigned int *reg_values = driver_data->reg_values;
 	u32 reg;
 
@@ -706,7 +710,7 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	/* B D-PHY: D-PHY Master & Slave Analog Block control */
 	reg = reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
 		reg_values[PHYCTRL_SLEW_UP];
-	exynos_dsi_write(dsi, DSIM_PHYCTRL_REG, reg);
+	samsung_dsim_write(dsi, DSIM_PHYCTRL_REG, reg);
 
 	/*
 	 * T LPX: Transmitted length of any Low-Power state period
@@ -714,7 +718,7 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 *	burst
 	 */
 	reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
-	exynos_dsi_write(dsi, DSIM_PHYTIMING_REG, reg);
+	samsung_dsim_write(dsi, DSIM_PHYTIMING_REG, reg);
 
 	/*
 	 * T CLK-PREPARE: Time that the transmitter drives the Clock Lane LP-00
@@ -734,7 +738,7 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 		reg_values[PHYTIMING_CLK_POST] |
 		reg_values[PHYTIMING_CLK_TRAIL];
 
-	exynos_dsi_write(dsi, DSIM_PHYTIMING1_REG, reg);
+	samsung_dsim_write(dsi, DSIM_PHYTIMING1_REG, reg);
 
 	/*
 	 * T HS-PREPARE: Time that the transmitter drives the Data Lane LP-00
@@ -747,47 +751,47 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	 */
 	reg = reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO] |
 		reg_values[PHYTIMING_HS_TRAIL];
-	exynos_dsi_write(dsi, DSIM_PHYTIMING2_REG, reg);
+	samsung_dsim_write(dsi, DSIM_PHYTIMING2_REG, reg);
 }
 
-static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
+static void samsung_dsim_disable_clock(struct samsung_dsim *dsi)
 {
 	u32 reg;
 
-	reg = exynos_dsi_read(dsi, DSIM_CLKCTRL_REG);
+	reg = samsung_dsim_read(dsi, DSIM_CLKCTRL_REG);
 	reg &= ~(DSIM_LANE_ESC_CLK_EN_CLK | DSIM_LANE_ESC_CLK_EN_DATA_MASK
 			| DSIM_ESC_CLKEN | DSIM_BYTE_CLKEN);
-	exynos_dsi_write(dsi, DSIM_CLKCTRL_REG, reg);
+	samsung_dsim_write(dsi, DSIM_CLKCTRL_REG, reg);
 
-	reg = exynos_dsi_read(dsi, DSIM_PLLCTRL_REG);
+	reg = samsung_dsim_read(dsi, DSIM_PLLCTRL_REG);
 	reg &= ~DSIM_PLL_EN;
-	exynos_dsi_write(dsi, DSIM_PLLCTRL_REG, reg);
+	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 }
 
-static void exynos_dsi_enable_lane(struct exynos_dsi *dsi, u32 lane)
+static void samsung_dsim_enable_lane(struct samsung_dsim *dsi, u32 lane)
 {
-	u32 reg = exynos_dsi_read(dsi, DSIM_CONFIG_REG);
+	u32 reg = samsung_dsim_read(dsi, DSIM_CONFIG_REG);
 	reg |= (DSIM_NUM_OF_DATA_LANE(dsi->lanes - 1) | DSIM_LANE_EN_CLK |
 			DSIM_LANE_EN(lane));
-	exynos_dsi_write(dsi, DSIM_CONFIG_REG, reg);
+	samsung_dsim_write(dsi, DSIM_CONFIG_REG, reg);
 }
 
-static int exynos_dsi_init_link(struct exynos_dsi *dsi)
+static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 {
-	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	int timeout;
 	u32 reg;
 	u32 lanes_mask;
 
 	/* Initialize FIFO pointers */
-	reg = exynos_dsi_read(dsi, DSIM_FIFOCTRL_REG);
+	reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
 	reg &= ~0x1f;
-	exynos_dsi_write(dsi, DSIM_FIFOCTRL_REG, reg);
+	samsung_dsim_write(dsi, DSIM_FIFOCTRL_REG, reg);
 
 	usleep_range(9000, 11000);
 
 	reg |= 0x1f;
-	exynos_dsi_write(dsi, DSIM_FIFOCTRL_REG, reg);
+	samsung_dsim_write(dsi, DSIM_FIFOCTRL_REG, reg);
 	usleep_range(9000, 11000);
 
 	/* DSI configuration */
@@ -856,10 +860,10 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 			dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
 		reg |= DSIM_CLKLANE_STOP;
 	}
-	exynos_dsi_write(dsi, DSIM_CONFIG_REG, reg);
+	samsung_dsim_write(dsi, DSIM_CONFIG_REG, reg);
 
 	lanes_mask = BIT(dsi->lanes) - 1;
-	exynos_dsi_enable_lane(dsi, lanes_mask);
+	samsung_dsim_enable_lane(dsi, lanes_mask);
 
 	/* Check clock and data lane state are stop state */
 	timeout = 100;
@@ -869,24 +873,24 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 			return -EFAULT;
 		}
 
-		reg = exynos_dsi_read(dsi, DSIM_STATUS_REG);
+		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
 		if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
 		    != DSIM_STOP_STATE_DAT(lanes_mask))
 			continue;
 	} while (!(reg & (DSIM_STOP_STATE_CLK | DSIM_TX_READY_HS_CLK)));
 
-	reg = exynos_dsi_read(dsi, DSIM_ESCMODE_REG);
+	reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
 	reg &= ~DSIM_STOP_STATE_CNT_MASK;
 	reg |= DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
-	exynos_dsi_write(dsi, DSIM_ESCMODE_REG, reg);
+	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
 
 	reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
-	exynos_dsi_write(dsi, DSIM_TIMEOUT_REG, reg);
+	samsung_dsim_write(dsi, DSIM_TIMEOUT_REG, reg);
 
 	return 0;
 }
 
-static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
+static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 {
 	struct drm_display_mode *m = &dsi->mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
@@ -896,42 +900,42 @@ static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
 		reg = DSIM_CMD_ALLOW(0xf)
 			| DSIM_STABLE_VFP(m->vsync_start - m->vdisplay)
 			| DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
-		exynos_dsi_write(dsi, DSIM_MVPORCH_REG, reg);
+		samsung_dsim_write(dsi, DSIM_MVPORCH_REG, reg);
 
 		reg = DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
 			| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
-		exynos_dsi_write(dsi, DSIM_MHPORCH_REG, reg);
+		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
 
 		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
 			| DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
-		exynos_dsi_write(dsi, DSIM_MSYNC_REG, reg);
+		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
 	}
 	reg =  DSIM_MAIN_HRESOL(m->hdisplay, num_bits_resol) |
 		DSIM_MAIN_VRESOL(m->vdisplay, num_bits_resol);
 
-	exynos_dsi_write(dsi, DSIM_MDRESOL_REG, reg);
+	samsung_dsim_write(dsi, DSIM_MDRESOL_REG, reg);
 
 	dev_dbg(dsi->dev, "LCD size = %dx%d\n", m->hdisplay, m->vdisplay);
 }
 
-static void exynos_dsi_set_display_enable(struct exynos_dsi *dsi, bool enable)
+static void samsung_dsim_set_display_enable(struct samsung_dsim *dsi, bool enable)
 {
 	u32 reg;
 
-	reg = exynos_dsi_read(dsi, DSIM_MDRESOL_REG);
+	reg = samsung_dsim_read(dsi, DSIM_MDRESOL_REG);
 	if (enable)
 		reg |= DSIM_MAIN_STAND_BY;
 	else
 		reg &= ~DSIM_MAIN_STAND_BY;
-	exynos_dsi_write(dsi, DSIM_MDRESOL_REG, reg);
+	samsung_dsim_write(dsi, DSIM_MDRESOL_REG, reg);
 }
 
-static int exynos_dsi_wait_for_hdr_fifo(struct exynos_dsi *dsi)
+static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
 {
 	int timeout = 2000;
 
 	do {
-		u32 reg = exynos_dsi_read(dsi, DSIM_FIFOCTRL_REG);
+		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
 
 		if (!(reg & DSIM_SFR_HEADER_FULL))
 			return 0;
@@ -943,27 +947,27 @@ static int exynos_dsi_wait_for_hdr_fifo(struct exynos_dsi *dsi)
 	return -ETIMEDOUT;
 }
 
-static void exynos_dsi_set_cmd_lpm(struct exynos_dsi *dsi, bool lpm)
+static void samsung_dsim_set_cmd_lpm(struct samsung_dsim *dsi, bool lpm)
 {
-	u32 v = exynos_dsi_read(dsi, DSIM_ESCMODE_REG);
+	u32 v = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
 
 	if (lpm)
 		v |= DSIM_CMD_LPDT_LP;
 	else
 		v &= ~DSIM_CMD_LPDT_LP;
 
-	exynos_dsi_write(dsi, DSIM_ESCMODE_REG, v);
+	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, v);
 }
 
-static void exynos_dsi_force_bta(struct exynos_dsi *dsi)
+static void samsung_dsim_force_bta(struct samsung_dsim *dsi)
 {
-	u32 v = exynos_dsi_read(dsi, DSIM_ESCMODE_REG);
+	u32 v = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
 	v |= DSIM_FORCE_BTA;
-	exynos_dsi_write(dsi, DSIM_ESCMODE_REG, v);
+	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, v);
 }
 
-static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
-					struct exynos_dsi_transfer *xfer)
+static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
+				      struct samsung_dsim_transfer *xfer)
 {
 	struct device *dev = dsi->dev;
 	struct mipi_dsi_packet *pkt = &xfer->packet;
@@ -983,7 +987,7 @@ static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
 	/* Send payload */
 	while (length >= 4) {
 		reg = get_unaligned_le32(payload);
-		exynos_dsi_write(dsi, DSIM_PAYLOAD_REG, reg);
+		samsung_dsim_write(dsi, DSIM_PAYLOAD_REG, reg);
 		payload += 4;
 		length -= 4;
 	}
@@ -998,7 +1002,7 @@ static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
 		fallthrough;
 	case 1:
 		reg |= payload[0];
-		exynos_dsi_write(dsi, DSIM_PAYLOAD_REG, reg);
+		samsung_dsim_write(dsi, DSIM_PAYLOAD_REG, reg);
 		break;
 	}
 
@@ -1007,25 +1011,25 @@ static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
 		return;
 
 	reg = get_unaligned_le32(pkt->header);
-	if (exynos_dsi_wait_for_hdr_fifo(dsi)) {
+	if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
 		dev_err(dev, "waiting for header FIFO timed out\n");
 		return;
 	}
 
 	if (NEQV(xfer->flags & MIPI_DSI_MSG_USE_LPM,
 		 dsi->state & DSIM_STATE_CMD_LPM)) {
-		exynos_dsi_set_cmd_lpm(dsi, xfer->flags & MIPI_DSI_MSG_USE_LPM);
+		samsung_dsim_set_cmd_lpm(dsi, xfer->flags & MIPI_DSI_MSG_USE_LPM);
 		dsi->state ^= DSIM_STATE_CMD_LPM;
 	}
 
-	exynos_dsi_write(dsi, DSIM_PKTHDR_REG, reg);
+	samsung_dsim_write(dsi, DSIM_PKTHDR_REG, reg);
 
 	if (xfer->flags & MIPI_DSI_MSG_REQ_ACK)
-		exynos_dsi_force_bta(dsi);
+		samsung_dsim_force_bta(dsi);
 }
 
-static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
-					struct exynos_dsi_transfer *xfer)
+static void samsung_dsim_read_from_fifo(struct samsung_dsim *dsi,
+					struct samsung_dsim_transfer *xfer)
 {
 	u8 *payload = xfer->rx_payload + xfer->rx_done;
 	bool first = !xfer->rx_done;
@@ -1034,7 +1038,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 	u32 reg;
 
 	if (first) {
-		reg = exynos_dsi_read(dsi, DSIM_RXFIFO_REG);
+		reg = samsung_dsim_read(dsi, DSIM_RXFIFO_REG);
 
 		switch (reg & 0x3f) {
 		case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
@@ -1073,7 +1077,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 
 	/* Receive payload */
 	while (length >= 4) {
-		reg = exynos_dsi_read(dsi, DSIM_RXFIFO_REG);
+		reg = samsung_dsim_read(dsi, DSIM_RXFIFO_REG);
 		payload[0] = (reg >>  0) & 0xff;
 		payload[1] = (reg >>  8) & 0xff;
 		payload[2] = (reg >> 16) & 0xff;
@@ -1083,7 +1087,7 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 	}
 
 	if (length) {
-		reg = exynos_dsi_read(dsi, DSIM_RXFIFO_REG);
+		reg = samsung_dsim_read(dsi, DSIM_RXFIFO_REG);
 		switch (length) {
 		case 3:
 			payload[2] = (reg >> 16) & 0xff;
@@ -1102,16 +1106,16 @@ static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
 clear_fifo:
 	length = DSI_RX_FIFO_SIZE / 4;
 	do {
-		reg = exynos_dsi_read(dsi, DSIM_RXFIFO_REG);
+		reg = samsung_dsim_read(dsi, DSIM_RXFIFO_REG);
 		if (reg == DSI_RX_FIFO_EMPTY)
 			break;
 	} while (--length);
 }
 
-static void exynos_dsi_transfer_start(struct exynos_dsi *dsi)
+static void samsung_dsim_transfer_start(struct samsung_dsim *dsi)
 {
 	unsigned long flags;
-	struct exynos_dsi_transfer *xfer;
+	struct samsung_dsim_transfer *xfer;
 	bool start = false;
 
 again:
@@ -1123,7 +1127,7 @@ static void exynos_dsi_transfer_start(struct exynos_dsi *dsi)
 	}
 
 	xfer = list_first_entry(&dsi->transfer_list,
-					struct exynos_dsi_transfer, list);
+					struct samsung_dsim_transfer, list);
 
 	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
 
@@ -1132,7 +1136,7 @@ static void exynos_dsi_transfer_start(struct exynos_dsi *dsi)
 		/* waiting for RX */
 		return;
 
-	exynos_dsi_send_to_fifo(dsi, xfer);
+	samsung_dsim_send_to_fifo(dsi, xfer);
 
 	if (xfer->packet.payload_length || xfer->rx_len)
 		return;
@@ -1151,9 +1155,9 @@ static void exynos_dsi_transfer_start(struct exynos_dsi *dsi)
 		goto again;
 }
 
-static bool exynos_dsi_transfer_finish(struct exynos_dsi *dsi)
+static bool samsung_dsim_transfer_finish(struct samsung_dsim *dsi)
 {
-	struct exynos_dsi_transfer *xfer;
+	struct samsung_dsim_transfer *xfer;
 	unsigned long flags;
 	bool start = true;
 
@@ -1165,7 +1169,7 @@ static bool exynos_dsi_transfer_finish(struct exynos_dsi *dsi)
 	}
 
 	xfer = list_first_entry(&dsi->transfer_list,
-					struct exynos_dsi_transfer, list);
+					struct samsung_dsim_transfer, list);
 
 	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
 
@@ -1178,7 +1182,7 @@ static bool exynos_dsi_transfer_finish(struct exynos_dsi *dsi)
 		return true;
 
 	if (xfer->rx_done != xfer->rx_len)
-		exynos_dsi_read_from_fifo(dsi, xfer);
+		samsung_dsim_read_from_fifo(dsi, xfer);
 
 	if (xfer->rx_done != xfer->rx_len)
 		return true;
@@ -1197,8 +1201,8 @@ static bool exynos_dsi_transfer_finish(struct exynos_dsi *dsi)
 	return start;
 }
 
-static void exynos_dsi_remove_transfer(struct exynos_dsi *dsi,
-					struct exynos_dsi_transfer *xfer)
+static void samsung_dsim_remove_transfer(struct samsung_dsim *dsi,
+					 struct samsung_dsim_transfer *xfer)
 {
 	unsigned long flags;
 	bool start;
@@ -1207,12 +1211,12 @@ static void exynos_dsi_remove_transfer(struct exynos_dsi *dsi,
 
 	if (!list_empty(&dsi->transfer_list) &&
 	    xfer == list_first_entry(&dsi->transfer_list,
-				     struct exynos_dsi_transfer, list)) {
+				     struct samsung_dsim_transfer, list)) {
 		list_del_init(&xfer->list);
 		start = !list_empty(&dsi->transfer_list);
 		spin_unlock_irqrestore(&dsi->transfer_lock, flags);
 		if (start)
-			exynos_dsi_transfer_start(dsi);
+			samsung_dsim_transfer_start(dsi);
 		return;
 	}
 
@@ -1221,8 +1225,8 @@ static void exynos_dsi_remove_transfer(struct exynos_dsi *dsi,
 	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
 }
 
-static int exynos_dsi_transfer(struct exynos_dsi *dsi,
-					struct exynos_dsi_transfer *xfer)
+static int samsung_dsim_transfer(struct samsung_dsim *dsi,
+				 struct samsung_dsim_transfer *xfer)
 {
 	unsigned long flags;
 	bool stopped;
@@ -1240,13 +1244,13 @@ static int exynos_dsi_transfer(struct exynos_dsi *dsi,
 	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
 
 	if (stopped)
-		exynos_dsi_transfer_start(dsi);
+		samsung_dsim_transfer_start(dsi);
 
 	wait_for_completion_timeout(&xfer->completed,
 				    msecs_to_jiffies(DSI_XFER_TIMEOUT_MS));
 	if (xfer->result == -ETIMEDOUT) {
 		struct mipi_dsi_packet *pkt = &xfer->packet;
-		exynos_dsi_remove_transfer(dsi, xfer);
+		samsung_dsim_remove_transfer(dsi, xfer);
 		dev_err(dsi->dev, "xfer timed out: %*ph %*ph\n", 4, pkt->header,
 			(int)pkt->payload_length, pkt->payload);
 		return -ETIMEDOUT;
@@ -1256,25 +1260,25 @@ static int exynos_dsi_transfer(struct exynos_dsi *dsi,
 	return xfer->result;
 }
 
-static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
+static irqreturn_t samsung_dsim_irq(int irq, void *dev_id)
 {
-	struct exynos_dsi *dsi = dev_id;
+	struct samsung_dsim *dsi = dev_id;
 	u32 status;
 
-	status = exynos_dsi_read(dsi, DSIM_INTSRC_REG);
+	status = samsung_dsim_read(dsi, DSIM_INTSRC_REG);
 	if (!status) {
 		static unsigned long int j;
 		if (printk_timed_ratelimit(&j, 500))
 			dev_warn(dsi->dev, "spurious interrupt\n");
 		return IRQ_HANDLED;
 	}
-	exynos_dsi_write(dsi, DSIM_INTSRC_REG, status);
+	samsung_dsim_write(dsi, DSIM_INTSRC_REG, status);
 
 	if (status & DSIM_INT_SW_RST_RELEASE) {
 		u32 mask = ~(DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
 			DSIM_INT_SFR_HDR_FIFO_EMPTY | DSIM_INT_RX_ECC_ERR |
 			DSIM_INT_SW_RST_RELEASE);
-		exynos_dsi_write(dsi, DSIM_INTMSK_REG, mask);
+		samsung_dsim_write(dsi, DSIM_INTMSK_REG, mask);
 		complete(&dsi->completed);
 		return IRQ_HANDLED;
 	}
@@ -1283,15 +1287,15 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 			DSIM_INT_PLL_STABLE)))
 		return IRQ_HANDLED;
 
-	if (exynos_dsi_transfer_finish(dsi))
-		exynos_dsi_transfer_start(dsi);
+	if (samsung_dsim_transfer_finish(dsi))
+		samsung_dsim_transfer_start(dsi);
 
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
+static irqreturn_t samsung_dsim_te_irq_handler(int irq, void *dev_id)
 {
-	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
+	struct samsung_dsim *dsi = (struct samsung_dsim *)dev_id;
 	struct drm_encoder *encoder = &dsi->encoder;
 
 	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
@@ -1300,7 +1304,7 @@ static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
+static void samsung_dsim_enable_irq(struct samsung_dsim *dsi)
 {
 	enable_irq(dsi->irq);
 
@@ -1308,7 +1312,7 @@ static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
 		enable_irq(gpio_to_irq(dsi->te_gpio));
 }
 
-static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
+static void samsung_dsim_disable_irq(struct samsung_dsim *dsi)
 {
 	if (gpio_is_valid(dsi->te_gpio))
 		disable_irq(gpio_to_irq(dsi->te_gpio));
@@ -1316,27 +1320,27 @@ static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
 	disable_irq(dsi->irq);
 }
 
-static int exynos_dsi_init(struct exynos_dsi *dsi)
+static int samsung_dsim_init(struct samsung_dsim *dsi)
 {
-	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 
-	exynos_dsi_reset(dsi);
-	exynos_dsi_enable_irq(dsi);
+	samsung_dsim_reset(dsi);
+	samsung_dsim_enable_irq(dsi);
 
 	if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
-		exynos_dsi_enable_lane(dsi, BIT(dsi->lanes) - 1);
+		samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
 
-	exynos_dsi_enable_clock(dsi);
+	samsung_dsim_enable_clock(dsi);
 	if (driver_data->wait_for_reset)
-		exynos_dsi_wait_for_reset(dsi);
-	exynos_dsi_set_phy_ctrl(dsi);
-	exynos_dsi_init_link(dsi);
+		samsung_dsim_wait_for_reset(dsi);
+	samsung_dsim_set_phy_ctrl(dsi);
+	samsung_dsim_init_link(dsi);
 
 	return 0;
 }
 
-static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
-				      struct device *panel)
+static int samsung_dsim_register_te_irq(struct samsung_dsim *dsi,
+					struct device *panel)
 {
 	int ret;
 	int te_gpio_irq;
@@ -1359,7 +1363,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 
 	te_gpio_irq = gpio_to_irq(dsi->te_gpio);
 
-	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
+	ret = request_threaded_irq(te_gpio_irq, samsung_dsim_te_irq_handler, NULL,
 				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
 		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
@@ -1371,7 +1375,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	return ret;
 }
 
-static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
+static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
 {
 	if (gpio_is_valid(dsi->te_gpio)) {
 		free_irq(gpio_to_irq(dsi->te_gpio), dsi);
@@ -1380,9 +1384,9 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static void exynos_dsi_bridge_enable(struct drm_bridge *bridge)
+static void samsung_dsim_bridge_enable(struct drm_bridge *bridge)
 {
-	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 	int ret;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
@@ -1396,39 +1400,39 @@ static void exynos_dsi_bridge_enable(struct drm_bridge *bridge)
 
 	dsi->state |= DSIM_STATE_ENABLED;
 
-	exynos_dsi_set_display_mode(dsi);
-	exynos_dsi_set_display_enable(dsi, true);
+	samsung_dsim_set_display_mode(dsi);
+	samsung_dsim_set_display_enable(dsi, true);
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 	return;
 }
 
-static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
+static void samsung_dsim_bridge_disable(struct drm_bridge *bridge)
 {
-	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
 
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
-	exynos_dsi_set_display_enable(dsi, false);
+	samsung_dsim_set_display_enable(dsi, false);
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
 }
 
-static void exynos_dsi_bridge_mode_set(struct drm_bridge *bridge,
-				       const struct drm_display_mode *mode,
-				       const struct drm_display_mode *adjusted_mode)
+static void samsung_dsim_bridge_mode_set(struct drm_bridge *bridge,
+					 const struct drm_display_mode *mode,
+					 const struct drm_display_mode *adjusted_mode)
 {
-	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
 	drm_mode_copy(&dsi->mode, adjusted_mode);
 }
 
-static int exynos_dsi_panel_or_bridge(struct exynos_dsi *dsi,
-				      struct device_node *node)
+static int samsung_dsim_panel_or_bridge(struct samsung_dsim *dsi,
+					struct device_node *node)
 {
 	struct drm_bridge *panel_bridge;
 	struct drm_panel *panel;
@@ -1453,10 +1457,10 @@ static int exynos_dsi_panel_or_bridge(struct exynos_dsi *dsi,
 	return 0;
 }
 
-static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
-				    enum drm_bridge_attach_flags flags)
+static int samsung_dsim_bridge_attach(struct drm_bridge *bridge,
+				      enum drm_bridge_attach_flags flags)
 {
-	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
 	dsi->drm = bridge->dev;
 
@@ -1464,23 +1468,23 @@ static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
 				 flags);
 }
 
-static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
-	.enable = exynos_dsi_bridge_enable,
-	.disable = exynos_dsi_bridge_disable,
-	.mode_set = exynos_dsi_bridge_mode_set,
-	.attach = exynos_dsi_bridge_attach,
+static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
+	.enable = samsung_dsim_bridge_enable,
+	.disable = samsung_dsim_bridge_disable,
+	.mode_set = samsung_dsim_bridge_mode_set,
+	.attach = samsung_dsim_bridge_attach,
 };
 
-MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
+MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
 
-static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
-				  struct mipi_dsi_device *device)
+static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
+				    struct mipi_dsi_device *device)
 {
-	struct exynos_dsi *dsi = host_to_dsi(host);
+	struct samsung_dsim *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->drm;
 	int ret;
 
-	ret = exynos_dsi_panel_or_bridge(dsi, device->dev.of_node);
+	ret = samsung_dsim_panel_or_bridge(dsi, device->dev.of_node);
 	if (ret)
 		return ret;
 
@@ -1492,7 +1496,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	 */
 	if (dsi->driver_data->exynos_specific &&
 	    !(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
-		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
+		int ret = samsung_dsim_register_te_irq(dsi, &device->dev);
 		if (ret)
 			return ret;
 	}
@@ -1514,33 +1518,33 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	return 0;
 }
 
-static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
-				  struct mipi_dsi_device *device)
+static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
+				    struct mipi_dsi_device *device)
 {
-	struct exynos_dsi *dsi = host_to_dsi(host);
+	struct samsung_dsim *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->drm;
 
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
 	if (dsi->driver_data->exynos_specific)
-		exynos_dsi_unregister_te_irq(dsi);
+		samsung_dsim_unregister_te_irq(dsi);
 
 	return 0;
 }
 
-static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
-					 const struct mipi_dsi_msg *msg)
+static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
+					  const struct mipi_dsi_msg *msg)
 {
-	struct exynos_dsi *dsi = host_to_dsi(host);
-	struct exynos_dsi_transfer xfer;
+	struct samsung_dsim *dsi = host_to_dsi(host);
+	struct samsung_dsim_transfer xfer;
 	int ret;
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
 	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = exynos_dsi_init(dsi);
+		ret = samsung_dsim_init(dsi);
 		if (ret)
 			return ret;
 		dsi->state |= DSIM_STATE_INITIALIZED;
@@ -1554,18 +1558,18 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	xfer.rx_payload = msg->rx_buf;
 	xfer.flags = msg->flags;
 
-	ret = exynos_dsi_transfer(dsi, &xfer);
+	ret = samsung_dsim_transfer(dsi, &xfer);
 	return (ret < 0) ? ret : xfer.rx_done;
 }
 
-static const struct mipi_dsi_host_ops exynos_dsi_ops = {
-	.attach = exynos_dsi_host_attach,
-	.detach = exynos_dsi_host_detach,
-	.transfer = exynos_dsi_host_transfer,
+static const struct mipi_dsi_host_ops samsung_dsim_ops = {
+	.attach = samsung_dsim_host_attach,
+	.detach = samsung_dsim_host_detach,
+	.transfer = samsung_dsim_host_transfer,
 };
 
-static int exynos_dsi_of_read_u32(const struct device_node *np,
-				  const char *propname, u32 *out_value)
+static int samsung_dsim_of_read_u32(const struct device_node *np,
+				    const char *propname, u32 *out_value)
 {
 	int ret = of_property_read_u32(np, propname, out_value);
 
@@ -1580,23 +1584,23 @@ enum {
 	DSI_PORT_OUT
 };
 
-static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
+static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 {
 	struct device *dev = dsi->dev;
 	struct device_node *node = dev->of_node;
 	int ret;
 
-	ret = exynos_dsi_of_read_u32(node, "samsung,pll-clock-frequency",
+	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
 				     &dsi->pll_clk_rate);
 	if (ret < 0)
 		return ret;
 
-	ret = exynos_dsi_of_read_u32(node, "samsung,burst-clock-frequency",
+	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
 				     &dsi->burst_clk_rate);
 	if (ret < 0)
 		return ret;
 
-	ret = exynos_dsi_of_read_u32(node, "samsung,esc-clock-frequency",
+	ret = samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequency",
 				     &dsi->esc_clk_rate);
 	if (ret < 0)
 		return ret;
@@ -1604,10 +1608,10 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static int exynos_dsi_bind(struct device *dev, struct device *master,
-				void *data)
+static int samsung_dsim_bind(struct device *dev, struct device *master,
+			     void *data)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct samsung_dsim *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm_dev = data;
 	struct device_node *in_bridge_node;
@@ -1650,26 +1654,26 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	return mipi_dsi_host_register(&dsi->dsi_host);
 }
 
-static void exynos_dsi_unbind(struct device *dev, struct device *master,
+static void samsung_dsim_unbind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct samsung_dsim *dsi = dev_get_drvdata(dev);
 
-	exynos_dsi_bridge_disable(&dsi->bridge);
+	samsung_dsim_bridge_disable(&dsi->bridge);
 	drm_encoder_cleanup(&dsi->encoder);
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
-static const struct component_ops exynos_dsi_component_ops = {
-	.bind	= exynos_dsi_bind,
-	.unbind	= exynos_dsi_unbind,
+static const struct component_ops samsung_dsim_component_ops = {
+	.bind	= samsung_dsim_bind,
+	.unbind	= samsung_dsim_unbind,
 };
 
-static int exynos_dsi_probe(struct platform_device *pdev)
+static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *res;
-	struct exynos_dsi *dsi;
+	struct samsung_dsim *dsi;
 	int ret, i;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -1683,7 +1687,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
 
-	dsi->dsi_host.ops = &exynos_dsi_ops;
+	dsi->dsi_host.ops = &samsung_dsim_ops;
 	dsi->dsi_host.dev = dev;
 
 	dsi->dev = dev;
@@ -1734,7 +1738,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		return dsi->irq;
 
 	ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
-					exynos_dsi_irq,
+					samsung_dsim_irq,
 					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					dev_name(dev), dsi);
 	if (ret) {
@@ -1742,7 +1746,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = exynos_dsi_parse_dt(dsi);
+	ret = samsung_dsim_parse_dt(dsi);
 	if (ret)
 		return ret;
 
@@ -1759,14 +1763,14 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
+	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	drm_bridge_add(&dsi->bridge);
 
 	if (dsi->driver_data->exynos_specific) {
-		ret = component_add(dev, &exynos_dsi_component_ops);
+		ret = component_add(dev, &samsung_dsim_component_ops);
 		if (ret)
 			goto err_disable_runtime;
 	}
@@ -1779,24 +1783,24 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int exynos_dsi_remove(struct platform_device *pdev)
+static int samsung_dsim_remove(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
+	struct samsung_dsim *dsi = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&dsi->bridge);
 
 	pm_runtime_disable(&pdev->dev);
 
 	if (dsi->driver_data->exynos_specific)
-		component_del(&pdev->dev, &exynos_dsi_component_ops);
+		component_del(&pdev->dev, &samsung_dsim_component_ops);
 
 	return 0;
 }
 
-static int __maybe_unused exynos_dsi_suspend(struct device *dev)
+static int __maybe_unused samsung_dsim_suspend(struct device *dev)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
-	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	struct samsung_dsim *dsi = dev_get_drvdata(dev);
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
 	usleep_range(10000, 20000);
@@ -1804,9 +1808,9 @@ static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 	if (dsi->state & DSIM_STATE_INITIALIZED) {
 		dsi->state &= ~DSIM_STATE_INITIALIZED;
 
-		exynos_dsi_disable_clock(dsi);
+		samsung_dsim_disable_clock(dsi);
 
-		exynos_dsi_disable_irq(dsi);
+		samsung_dsim_disable_irq(dsi);
 	}
 
 	dsi->state &= ~DSIM_STATE_CMD_LPM;
@@ -1823,10 +1827,10 @@ static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused exynos_dsi_resume(struct device *dev)
+static int __maybe_unused samsung_dsim_resume(struct device *dev)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
-	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	struct samsung_dsim *dsi = dev_get_drvdata(dev);
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
@@ -1857,24 +1861,25 @@ static int __maybe_unused exynos_dsi_resume(struct device *dev)
 	return ret;
 }
 
-static const struct dev_pm_ops exynos_dsi_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume, NULL)
+static const struct dev_pm_ops samsung_dsim_pm_ops = {
+	SET_RUNTIME_PM_OPS(samsung_dsim_suspend, samsung_dsim_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
 
 struct platform_driver dsi_driver = {
-	.probe = exynos_dsi_probe,
-	.remove = exynos_dsi_remove,
+	.probe = samsung_dsim_probe,
+	.remove = samsung_dsim_remove,
 	.driver = {
-		   .name = "exynos-dsi",
+		   .name = "samsung-dsim",
 		   .owner = THIS_MODULE,
-		   .pm = &exynos_dsi_pm_ops,
-		   .of_match_table = exynos_dsi_of_match,
+		   .pm = &samsung_dsim_pm_ops,
+		   .of_match_table = samsung_dsim_of_match,
 	},
 };
 
 MODULE_AUTHOR("Tomasz Figa <t.figa@samsung.com>");
 MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
-MODULE_DESCRIPTION("Samsung SoC MIPI DSI Master");
+MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
+MODULE_DESCRIPTION("Samsung MIPI DSIM bridge");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 6a251e3aa779..6bcd0fe03c70 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -53,15 +53,6 @@ config DRM_EXYNOS_DPI
 	help
 	  This enables support for Exynos parallel output.
 
-config DRM_EXYNOS_DSI
-	bool "MIPI-DSI host"
-	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS5433_DECON || DRM_EXYNOS7_DECON
-	select DRM_MIPI_DSI
-	select DRM_PANEL
-	default n
-	help
-	  This enables support for Exynos MIPI-DSI device.
-
 config DRM_EXYNOS_DP
 	bool "Exynos specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 2fd2f3ee4fcf..04832f92051d 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -11,7 +11,6 @@ exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
 exynosdrm-$(CONFIG_DRM_EXYNOS5433_DECON)	+= exynos5433_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS7_DECON)	+= exynos7_drm_decon.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DPI)	+= exynos_drm_dpi.o
-exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_MIXER)	+= exynos_mixer.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o
-- 
2.25.1

