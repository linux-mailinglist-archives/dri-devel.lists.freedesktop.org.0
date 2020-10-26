Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485532987CF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64426E875;
	Mon, 26 Oct 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A4A6E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 06:42:54 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09Q6Podt001404; Mon, 26 Oct 2020 02:42:50 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 34ce45pmqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 02:42:50 -0400
Received: from ASHBMBX9.ad.analog.com (ashbmbx9.ad.analog.com [10.64.17.10])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 09Q6gmW2009306
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL); 
 Mon, 26 Oct 2020 02:42:48 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 26 Oct
 2020 02:42:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Mon, 26 Oct 2020 02:42:47 -0400
Received: from btogorean-pc.ad.analog.com ([10.48.65.113])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 09Q6geJP003008;
 Mon, 26 Oct 2020 02:42:40 -0400
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm: adi: axi-hdmi-tx: Add support for AXI HDMI TX IP
 core
Date: Mon, 26 Oct 2020 08:41:04 +0200
Message-ID: <20201026064122.2831-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_04:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260045
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Mike Looijmans <mike.looijmans@topic.nl>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lars-Peter Clausen <lars@metafoo.de>

The AXI HDMI HDL driver is the driver for the HDL graphics core which is
used on various FPGA designs. It's mostly used to interface with the
ADV7511 bridge driver on some Zynq boards (e.g. ZC702 & ZedBoard).

Link: https://wiki.analog.com/resources/tools-software/linux-drivers/drm/hdl-axi-hdmi
Link: https://wiki.analog.com/resources/fpga/docs/axi_hdmi_tx

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
---
 drivers/gpu/drm/Kconfig                   |   2 +
 drivers/gpu/drm/Makefile                  |   1 +
 drivers/gpu/drm/adi/Kconfig               |  14 +
 drivers/gpu/drm/adi/Makefile              |   4 +
 drivers/gpu/drm/adi/axi_hdmi_tx_crtc.c    | 225 +++++++++++++++
 drivers/gpu/drm/adi/axi_hdmi_tx_drv.c     | 196 +++++++++++++
 drivers/gpu/drm/adi/axi_hdmi_tx_drv.h     |  38 +++
 drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c | 331 ++++++++++++++++++++++
 8 files changed, 811 insertions(+)
 create mode 100755 drivers/gpu/drm/adi/Kconfig
 create mode 100644 drivers/gpu/drm/adi/Makefile
 create mode 100755 drivers/gpu/drm/adi/axi_hdmi_tx_crtc.c
 create mode 100755 drivers/gpu/drm/adi/axi_hdmi_tx_drv.c
 create mode 100755 drivers/gpu/drm/adi/axi_hdmi_tx_drv.h
 create mode 100755 drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 147d61b9674e..fca4c7e89fab 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -231,6 +231,8 @@ config DRM_SCHED
 
 source "drivers/gpu/drm/i2c/Kconfig"
 
+source "drivers/gpu/drm/adi/Kconfig"
+
 source "drivers/gpu/drm/arm/Kconfig"
 
 config DRM_RADEON
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2f31579f91d4..6ef28d1422ee 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_DRM)	+= drm.o
 obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
+obj-y			+= adi/
 obj-y			+= arm/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
 obj-$(CONFIG_DRM_SCHED)	+= scheduler/
diff --git a/drivers/gpu/drm/adi/Kconfig b/drivers/gpu/drm/adi/Kconfig
new file mode 100755
index 000000000000..b4f8a06756ff
--- /dev/null
+++ b/drivers/gpu/drm/adi/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_ADI_AXI_HDMI_TX
+	tristate "DRM Support for Analog Devices HDMI FPGA platforms"
+	depends on DRM && OF
+	default	n
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DMA_CMA if HAVE_DMA_CONTIGUOUS
+	select CMA if HAVE_DMA_CONTIGUOUS
+	help
+	  Choose this option if you have an FPGA board using this AXI HDMI
+	  Controller (aka GFX).
+
+	  If M is selected this module will be called adi_axi_hdmi_tx.
diff --git a/drivers/gpu/drm/adi/Makefile b/drivers/gpu/drm/adi/Makefile
new file mode 100644
index 000000000000..2451cdc4480f
--- /dev/null
+++ b/drivers/gpu/drm/adi/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+adi_axi_hdmi_tx-y := axi_hdmi_tx_encoder.o axi_hdmi_tx_crtc.o axi_hdmi_tx_drv.o
+
+obj-$(CONFIG_DRM_ADI_AXI_HDMI_TX) += adi_axi_hdmi_tx.o
diff --git a/drivers/gpu/drm/adi/axi_hdmi_tx_crtc.c b/drivers/gpu/drm/adi/axi_hdmi_tx_crtc.c
new file mode 100755
index 000000000000..88702763fda5
--- /dev/null
+++ b/drivers/gpu/drm/adi/axi_hdmi_tx_crtc.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Analog Devices AXI HDMI TX DRM driver.
+ *
+ * Copyright 2012-2020 Analog Devices Inc.
+ *  Author: Lars-Peter Clausen <lars@metafoo.de>
+ */
+
+#include <linux/dmaengine.h>
+#include <linux/slab.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "axi_hdmi_tx_drv.h"
+
+struct axi_hdmi_tx_crtc {
+	struct drm_crtc drm_crtc;
+	struct drm_plane plane;
+
+	struct dma_chan *dma;
+	struct dma_interleaved_template *dma_template;
+};
+
+static struct axi_hdmi_tx_crtc *plane_to_axi_hdmi_tx_crtc(struct drm_plane *plane)
+{
+	return container_of(plane, struct axi_hdmi_tx_crtc, plane);
+}
+
+static struct axi_hdmi_tx_crtc *to_axi_hdmi_tx_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct axi_hdmi_tx_crtc, drm_crtc);
+}
+
+static inline struct axi_hdmi_tx_private *drm_device_get_priv(struct drm_device *drm)
+{
+	return container_of(drm, struct axi_hdmi_tx_private, drm_dev);
+}
+
+static struct dma_async_tx_descriptor *axi_hdmi_tx_vdma_prep_interleaved_desc(
+	struct drm_plane *plane)
+{
+	struct axi_hdmi_tx_crtc *axi_hdmi_tx_crtc = plane_to_axi_hdmi_tx_crtc(plane);
+	struct drm_framebuffer *fb = plane->state->fb;
+	size_t offset, hw_row_size;
+	struct drm_gem_cma_object *obj;
+
+	obj = drm_fb_cma_get_gem_obj(plane->state->fb, 0);
+
+	offset = plane->state->crtc_x * fb->format->cpp[0] +
+		plane->state->crtc_y * fb->pitches[0];
+
+	/* Interleaved DMA is used that way:
+	 * Each interleaved frame is a row (hsize) implemented in ONE
+	 * chunk (sgl has len 1).
+	 * The number of interleaved frames is the number of rows (vsize).
+	 * The icg in used to pack data to the HW, so that the buffer len
+	 * is fb->piches[0], but the actual size for the hw is somewhat less
+	 */
+	axi_hdmi_tx_crtc->dma_template->dir = DMA_MEM_TO_DEV;
+	axi_hdmi_tx_crtc->dma_template->src_start = obj->paddr + offset;
+	/* sgl list have just one entry (each interleaved frame have 1 chunk) */
+	axi_hdmi_tx_crtc->dma_template->frame_size = 1;
+	/* the number of interleaved frame, each has the size specified in sgl */
+	axi_hdmi_tx_crtc->dma_template->numf = plane->state->crtc_h;
+	axi_hdmi_tx_crtc->dma_template->src_sgl = 1;
+	axi_hdmi_tx_crtc->dma_template->src_inc = 1;
+
+	/* vdma IP does not provide any addr to the hdmi IP, so dst_inc
+	 * and dst_sgl should make no any difference.
+	 */
+	axi_hdmi_tx_crtc->dma_template->dst_inc = 0;
+	axi_hdmi_tx_crtc->dma_template->dst_sgl = 0;
+
+	hw_row_size = plane->state->crtc_w * fb->format->cpp[0];
+	axi_hdmi_tx_crtc->dma_template->sgl[0].size = hw_row_size;
+
+	/* the vdma driver seems to look at icg, and not src_icg */
+	axi_hdmi_tx_crtc->dma_template->sgl[0].icg =
+		fb->pitches[0] - hw_row_size;
+
+	return dmaengine_prep_interleaved_dma(axi_hdmi_tx_crtc->dma,
+				axi_hdmi_tx_crtc->dma_template, DMA_CYCLIC);
+}
+
+static void axi_hdmi_tx_plane_atomic_update(struct drm_plane *plane,
+	struct drm_plane_state *old_state)
+{
+	struct axi_hdmi_tx_crtc *axi_hdmi_tx_crtc = plane_to_axi_hdmi_tx_crtc(plane);
+	struct dma_async_tx_descriptor *desc;
+
+	if (!plane->state->crtc || !plane->state->fb)
+		return;
+
+	dmaengine_terminate_all(axi_hdmi_tx_crtc->dma);
+
+	desc = axi_hdmi_tx_vdma_prep_interleaved_desc(plane);
+	if (!desc) {
+		pr_err("Failed to prepare DMA descriptor\n");
+		return;
+	}
+
+	dmaengine_submit(desc);
+	dma_async_issue_pending(axi_hdmi_tx_crtc->dma);
+}
+
+static void axi_hdmi_tx_crtc_enable(struct drm_crtc *crtc,
+				 struct drm_crtc_state *old_state)
+{
+}
+
+static void axi_hdmi_tx_crtc_disable(struct drm_crtc *crtc,
+				  struct drm_crtc_state *old_state)
+{
+	struct axi_hdmi_tx_crtc *axi_hdmi_tx_crtc = to_axi_hdmi_tx_crtc(crtc);
+
+	dmaengine_terminate_all(axi_hdmi_tx_crtc->dma);
+}
+
+static void axi_hdmi_tx_crtc_atomic_begin(struct drm_crtc *crtc,
+	struct drm_crtc_state *state)
+{
+	struct drm_pending_vblank_event *event = crtc->state->event;
+
+	if (event) {
+		crtc->state->event = NULL;
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+}
+
+static const struct drm_crtc_helper_funcs axi_hdmi_tx_crtc_helper_funcs = {
+	.atomic_enable = axi_hdmi_tx_crtc_enable,
+	.atomic_disable = axi_hdmi_tx_crtc_disable,
+	.atomic_begin = axi_hdmi_tx_crtc_atomic_begin,
+};
+
+static const struct drm_crtc_funcs axi_hdmi_tx_crtc_funcs = {
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.reset = drm_atomic_helper_crtc_reset,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_plane_helper_funcs axi_hdmi_tx_plane_helper_funcs = {
+	.atomic_update = axi_hdmi_tx_plane_atomic_update,
+};
+
+static const struct drm_plane_funcs axi_hdmi_tx_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	.reset = drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+};
+
+static const u32 axi_hdmi_tx_supported_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+int axi_hdmi_tx_crtc_create(struct drm_device *ddev)
+{
+	struct axi_hdmi_tx_private *priv = drm_device_get_priv(ddev);
+	struct axi_hdmi_tx_crtc *axi_hdmi_tx_crtc;
+	struct drm_crtc *crtc;
+	struct drm_plane *plane;
+	int ret;
+
+	if (!dma_has_cap(DMA_INTERLEAVE, priv->dma->device->cap_mask)) {
+		DRM_ERROR("DMA needs to support interleaved transfers\n");
+		return -EINVAL;
+	}
+
+	axi_hdmi_tx_crtc = devm_kzalloc(priv->dev, sizeof(*axi_hdmi_tx_crtc),
+					GFP_KERNEL);
+	if (!axi_hdmi_tx_crtc)
+		return -ENOMEM;
+
+	crtc = &axi_hdmi_tx_crtc->drm_crtc;
+	plane = &axi_hdmi_tx_crtc->plane;
+
+	/* we know we'll always use only one data chunk */
+	axi_hdmi_tx_crtc->dma_template = devm_kzalloc(priv->dev,
+		sizeof(struct dma_interleaved_template) +
+		sizeof(struct data_chunk), GFP_KERNEL);
+	if (!axi_hdmi_tx_crtc->dma_template)
+		return -ENOMEM;
+
+	ret = drm_universal_plane_init(ddev, plane, 0xff,
+		&axi_hdmi_tx_plane_funcs,
+		axi_hdmi_tx_supported_formats,
+		ARRAY_SIZE(axi_hdmi_tx_supported_formats), NULL,
+		DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(plane, &axi_hdmi_tx_plane_helper_funcs);
+
+	axi_hdmi_tx_crtc->dma = priv->dma;
+
+	ret = drm_crtc_init_with_planes(ddev, crtc, plane, NULL,
+		&axi_hdmi_tx_crtc_funcs, NULL);
+	if (ret)
+		goto err_plane_destroy;
+	drm_crtc_helper_add(crtc, &axi_hdmi_tx_crtc_helper_funcs);
+
+	priv->crtc = crtc;
+
+	return 0;
+
+err_plane_destroy:
+	drm_plane_cleanup(plane);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/adi/axi_hdmi_tx_drv.c b/drivers/gpu/drm/adi/axi_hdmi_tx_drv.c
new file mode 100755
index 000000000000..1ebdfd58764c
--- /dev/null
+++ b/drivers/gpu/drm/adi/axi_hdmi_tx_drv.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Analog Devices AXI HDMI TX DRM driver.
+ *
+ * Copyright 2012-2020 Analog Devices Inc.
+ *  Author: Lars-Peter Clausen <lars@metafoo.de>
+ */
+
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_dma.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "axi_hdmi_tx_drv.h"
+
+#define DRIVER_NAME	"axi_hdmi_tx_drm"
+#define DRIVER_DESC	"AXI HDMI TX DRM"
+#define DRIVER_DATE	"20200910"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static struct drm_mode_config_funcs axi_hdmi_tx_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.output_poll_changed = drm_fb_helper_output_poll_changed,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int axi_hdmi_tx_mode_config_init(struct drm_device *ddev)
+{
+	int ret;
+
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		return ret;
+
+	ddev->mode_config.min_width = 0;
+	ddev->mode_config.min_height = 0;
+
+	ddev->mode_config.max_width = 4096;
+	ddev->mode_config.max_height = 4096;
+
+	ddev->mode_config.funcs = &axi_hdmi_tx_mode_config_funcs;
+
+	return 0;
+}
+
+static int axi_hdmi_tx_init(struct drm_device *ddev)
+{
+	int ret;
+
+	ret = axi_hdmi_tx_mode_config_init(ddev);
+	if (ret)
+		return ret;
+
+	ret = axi_hdmi_tx_crtc_create(ddev);
+	if (ret)
+		return ret;
+
+	ret = axi_hdmi_tx_encoder_create(ddev);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(ddev);
+
+	drm_kms_helper_poll_init(ddev);
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret)
+		return ret;
+
+	drm_fbdev_generic_setup(ddev, 32);
+
+	return 0;
+}
+
+DEFINE_DRM_GEM_CMA_FOPS(axi_hdmi_tx_driver_fops);
+
+static struct drm_driver axi_hdmi_tx_driver = {
+	.driver_features		= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	DRM_GEM_CMA_DRIVER_OPS,
+	.fops				= &axi_hdmi_tx_driver_fops,
+	.name				= DRIVER_NAME,
+	.desc				= DRIVER_DESC,
+	.date				= DRIVER_DATE,
+	.major				= DRIVER_MAJOR,
+	.minor				= DRIVER_MINOR,
+};
+
+static const struct of_device_id axi_hdmi_tx_encoder_of_match[] = {
+	{
+		.compatible = "adi,axi-hdmi-tx-1.00.a",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, axi_hdmi_tx_encoder_of_match);
+
+static int axi_hdmi_tx_platform_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct axi_hdmi_tx_private *priv;
+	struct device_node *slave_node, *ep_node;
+	struct of_endpoint ep;
+	int ret;
+
+	priv = devm_drm_dev_alloc(&pdev->dev, &axi_hdmi_tx_driver,
+				  struct axi_hdmi_tx_private, drm_dev);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->dev = &pdev->dev;
+
+	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->hdmi_clock = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->hdmi_clock))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->hdmi_clock),
+				     "HDMI pixel clock not found\n");
+
+	ep_node = of_graph_get_next_endpoint(np, NULL);
+	if (ep_node) {
+		ret = of_graph_parse_endpoint(ep_node, &ep);
+		if (ret) {
+			of_node_put(ep_node);
+			return ret;
+		}
+		if (ep.port != 0 && ep.id != 0) {
+			of_node_put(ep_node);
+			return -EINVAL;
+		}
+		slave_node = of_graph_get_remote_port_parent(ep_node);
+		of_node_put(ep_node);
+	}
+
+	if (!slave_node)
+		return -EINVAL;
+
+	priv->is_rgb = of_property_read_bool(np, "adi,is-rgb");
+
+	priv->bridge = of_drm_find_bridge(slave_node);
+	of_node_put(slave_node);
+
+	if (!priv->bridge)
+		return -EPROBE_DEFER;
+
+	priv->dma = dma_request_slave_channel(&pdev->dev, "video");
+	if (priv->dma == NULL)
+		return -EPROBE_DEFER;
+
+	platform_set_drvdata(pdev, priv);
+
+	return axi_hdmi_tx_init(&priv->drm_dev);
+}
+
+static int axi_hdmi_tx_platform_remove(struct platform_device *pdev)
+{
+	struct axi_hdmi_tx_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = &priv->drm_dev;
+
+	drm_dev_unregister(ddev);
+	drm_kms_helper_poll_fini(ddev);
+	drm_atomic_helper_shutdown(ddev);
+	dma_release_channel(priv->dma);
+
+	return 0;
+}
+
+static struct platform_driver axi_hdmi_tx_encoder_driver = {
+	.driver = {
+		.name = "axi-hdmi-tx",
+		.of_match_table = axi_hdmi_tx_encoder_of_match,
+	},
+	.probe = axi_hdmi_tx_platform_probe,
+	.remove = axi_hdmi_tx_platform_remove,
+};
+module_platform_driver(axi_hdmi_tx_encoder_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
+MODULE_DESCRIPTION("Analog Devices HDMI TX HDL driver");
diff --git a/drivers/gpu/drm/adi/axi_hdmi_tx_drv.h b/drivers/gpu/drm/adi/axi_hdmi_tx_drv.h
new file mode 100755
index 000000000000..352cea4ac970
--- /dev/null
+++ b/drivers/gpu/drm/adi/axi_hdmi_tx_drv.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Analog Devices AXI HDMI DRM driver.
+ *
+ * Copyright 2012-2020 Analog Devices Inc.
+ *  Author: Lars-Peter Clausen <lars@metafoo.de>
+ */
+
+#ifndef _AXI_HDMI_DRV_H_
+#define _AXI_HDMI_DRV_H_
+
+#include <drm/drm.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+
+struct axi_hdmi_tx_private {
+	struct device *dev;
+	struct drm_device drm_dev;
+	struct drm_crtc *crtc;
+	struct drm_encoder encoder;
+	struct drm_connector *connector;
+	struct drm_bridge *bridge;
+
+	void __iomem *base;
+
+	struct clk *hdmi_clock;
+	bool clk_enabled;
+
+	struct dma_chan *dma;
+
+	bool is_rgb;
+};
+
+int axi_hdmi_tx_crtc_create(struct drm_device *ddev);
+int axi_hdmi_tx_encoder_create(struct drm_device *ddev);
+
+#endif /* _AXI_HDMI_DRV_H_ */
diff --git a/drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c b/drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c
new file mode 100755
index 000000000000..a8da0f358475
--- /dev/null
+++ b/drivers/gpu/drm/adi/axi_hdmi_tx_encoder.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Analog Devices AXI HDMI DRM driver.
+ *
+ * Copyright 2012-2020 Analog Devices Inc.
+ *  Author: Lars-Peter Clausen <lars@metafoo.de>
+ */
+
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_file.h>
+#include <drm/drm_print.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "axi_hdmi_tx_drv.h"
+
+#define AXI_HDMI_TX_STATUS_VMDA_UNDERFLOW		BIT(4)
+#define AXI_HDMI_TX_STATUS_VMDA_OVERFLOW		BIT(3)
+#define AXI_HDMI_TX_STATUS_VMDA_BE_ERROR		BIT(2)
+#define AXI_HDMI_TX_STATUS_VMDA_TPM_OOS			BIT(1)
+#define AXI_HDMI_TX_STATUS_HDMI_TPM_OOS			BIT(0)
+
+#define AXI_HDMI_TX_COLOR_PATTERN_ENABLE		BIT(24)
+
+#define AXI_HDMI_TX_REG_RESET				0x040
+#define AXI_HDMI_TX_REG_CTRL				0x044
+#define AXI_HDMI_TX_REG_SOURCE_SEL			0x048
+#define AXI_HDMI_TX_REG_COLORPATTERN			0x04c
+#define AXI_HDMI_TX_REG_STATUS				0x05c
+#define AXI_HDMI_TX_REG_VDMA_STATUS			0x060
+#define AXI_HDMI_TX_REG_TPM_STATUS			0x064
+#define AXI_HDMI_TX_REG_CLIPP_MAX			0x068
+#define AXI_HDMI_TX_REG_CLIPP_MIN			0x06c
+#define AXI_HDMI_TX_REG_HTIMING1			0x400
+#define AXI_HDMI_TX_REG_HTIMING2			0x404
+#define AXI_HDMI_TX_REG_HTIMING3			0x408
+#define AXI_HDMI_TX_REG_VTIMING1			0x440
+#define AXI_HDMI_TX_REG_VTIMING2			0x444
+#define AXI_HDMI_TX_REG_VTIMING3			0x448
+
+#define AXI_HDMI_TX_RESET_ENABLE			BIT(0)
+
+#define AXI_HDMI_TX_CTRL_SS_BYPASS			BIT(2)
+#define AXI_HDMI_TX_CTRL_FULL_RANGE			BIT(1)
+#define AXI_HDMI_TX_CTRL_CSC_BYPASS			BIT(0)
+
+#define AXI_HDMI_TX_SOURCE_SEL_COLORPATTERN		0x3
+#define AXI_HDMI_TX_SOURCE_SEL_TESTPATTERN		0x2
+#define AXI_HDMI_TX_SOURCE_SEL_NORMAL			0x1
+#define AXI_HDMI_TX_SOURCE_SEL_NONE			0x0
+
+static const struct debugfs_reg32 axi_hdmi_tx_encoder_debugfs_regs[] = {
+	{ "Reset", AXI_HDMI_TX_REG_RESET },
+	{ "Control", AXI_HDMI_TX_REG_CTRL },
+	{ "Source select", AXI_HDMI_TX_REG_SOURCE_SEL },
+	{ "Colorpattern", AXI_HDMI_TX_REG_COLORPATTERN },
+	{ "Status", AXI_HDMI_TX_REG_STATUS },
+	{ "VDMA status", AXI_HDMI_TX_REG_VDMA_STATUS },
+	{ "TPM status", AXI_HDMI_TX_REG_TPM_STATUS },
+	{ "HTiming1", AXI_HDMI_TX_REG_HTIMING1 },
+	{ "HTiming2", AXI_HDMI_TX_REG_HTIMING2 },
+	{ "HTiming3", AXI_HDMI_TX_REG_HTIMING3 },
+	{ "VTiming1", AXI_HDMI_TX_REG_VTIMING1 },
+	{ "VTiming2", AXI_HDMI_TX_REG_VTIMING2 },
+	{ "VTiming3", AXI_HDMI_TX_REG_VTIMING3 },
+};
+
+static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
+	0x0734, 0x04ad, 0x0000, 0x1c1b,
+	0x1ddc, 0x04ad, 0x1f24, 0x0135,
+	0x0000, 0x04ad, 0x087c, 0x1b77,
+};
+
+static inline struct axi_hdmi_tx_private *drm_device_get_priv(struct drm_device *drm)
+{
+	return container_of(drm, struct axi_hdmi_tx_private, drm_dev);
+}
+
+static void axi_hdmi_tx_set_color_range(struct axi_hdmi_tx_private *priv,
+					unsigned int low, unsigned int high)
+{
+	writel(high, priv->base + AXI_HDMI_TX_REG_CLIPP_MAX);
+	writel(low, priv->base + AXI_HDMI_TX_REG_CLIPP_MIN);
+}
+
+#ifdef CONFIG_DEBUG_FS
+
+static int axi_hdmi_tx_debugfs_cp_get(void *data, u64 *val)
+{
+	struct axi_hdmi_tx_private *priv = data;
+	*val = readl(priv->base + AXI_HDMI_TX_REG_COLORPATTERN);
+	return 0;
+}
+
+static int axi_hdmi_tx_debugfs_cp_set(void *data, u64 val)
+{
+	struct axi_hdmi_tx_private *priv = data;
+
+	writel(val, priv->base + AXI_HDMI_TX_REG_COLORPATTERN);
+
+	return 0;
+}
+DEFINE_SIMPLE_ATTRIBUTE(axi_hdmi_tx_cp_fops, axi_hdmi_tx_debugfs_cp_get,
+	axi_hdmi_tx_debugfs_cp_set, "0x%06llx\n");
+
+static const char * const axi_hdmi_tx_mode_text[] = {
+	[AXI_HDMI_TX_SOURCE_SEL_NONE] = "none",
+	[AXI_HDMI_TX_SOURCE_SEL_NORMAL] = "normal",
+	[AXI_HDMI_TX_SOURCE_SEL_TESTPATTERN] = "testpattern",
+	[AXI_HDMI_TX_SOURCE_SEL_COLORPATTERN] = "colorpattern",
+};
+
+static ssize_t axi_hdmi_tx_read_mode(struct file *file, char __user *userbuf,
+	size_t count, loff_t *ppos)
+{
+	struct axi_hdmi_tx_private *priv = file->private_data;
+	uint32_t src;
+	const char *fmt;
+	size_t len = 0;
+	char buf[50];
+	int i;
+
+	src = readl(priv->base + AXI_HDMI_TX_REG_SOURCE_SEL);
+
+	for (i = 0; i < ARRAY_SIZE(axi_hdmi_tx_mode_text); i++) {
+		if (src == i)
+			fmt = "[%s] ";
+		else
+			fmt = "%s ";
+		len += scnprintf(buf + len, sizeof(buf) - len, fmt,
+				axi_hdmi_tx_mode_text[i]);
+	}
+
+	buf[len - 1] = '\n';
+
+	return simple_read_from_buffer(userbuf, count, ppos, buf, len);
+}
+
+static ssize_t axi_hdmi_tx_set_mode(struct file *file, const char __user *userbuf,
+				 size_t count, loff_t *ppos)
+{
+	struct axi_hdmi_tx_private *priv = file->private_data;
+	char buf[20];
+	unsigned int ctrl;
+	unsigned int i;
+
+	count = min_t(size_t, count, sizeof(buf) - 1);
+	if (copy_from_user(buf, userbuf, count))
+		return -EFAULT;
+
+	buf[count] = '\0';
+
+	for (i = 0; i < ARRAY_SIZE(axi_hdmi_tx_mode_text); i++) {
+		if (sysfs_streq(axi_hdmi_tx_mode_text[i], buf))
+			break;
+	}
+
+	if (i == ARRAY_SIZE(axi_hdmi_tx_mode_text))
+		return -EINVAL;
+
+	writel(i, priv->base + AXI_HDMI_TX_REG_SOURCE_SEL);
+
+	if (i == AXI_HDMI_TX_SOURCE_SEL_TESTPATTERN) {
+		axi_hdmi_tx_set_color_range(priv, 0, 0xffffff);
+		ctrl = AXI_HDMI_TX_CTRL_CSC_BYPASS | AXI_HDMI_TX_CTRL_SS_BYPASS |
+			AXI_HDMI_TX_CTRL_FULL_RANGE;
+	} else {
+		if (priv->is_rgb) {
+			axi_hdmi_tx_set_color_range(priv, 0, 0xffffff);
+			ctrl = AXI_HDMI_TX_CTRL_CSC_BYPASS;
+		} else {
+			axi_hdmi_tx_set_color_range(priv, 0x101010, 0xf0ebf0);
+			ctrl = 0;
+		}
+	}
+
+	writel(ctrl, priv->base + AXI_HDMI_TX_REG_CTRL);
+
+	return count;
+}
+
+static const struct file_operations axi_hdmi_tx_mode_fops = {
+	.open = simple_open,
+	.read = axi_hdmi_tx_read_mode,
+	.write = axi_hdmi_tx_set_mode,
+};
+
+static int axi_hdmi_tx_debugfs_init(struct drm_encoder *encoder)
+{
+	struct axi_hdmi_tx_private *priv = drm_device_get_priv(encoder->dev);
+	struct debugfs_regset32 *regset;
+
+	regset = devm_kzalloc(priv->dev, sizeof(*regset), GFP_KERNEL);
+	if (!regset)
+		return -ENOMEM;
+
+	regset->base = priv->base;
+	regset->regs = axi_hdmi_tx_encoder_debugfs_regs;
+	regset->nregs = ARRAY_SIZE(axi_hdmi_tx_encoder_debugfs_regs);
+
+	debugfs_create_regset32("axi_hdmi_tx", 0444, NULL, regset);
+	debugfs_create_file("color_pattern", 0600, NULL, priv, &axi_hdmi_tx_cp_fops);
+	debugfs_create_file("mode", 0600, NULL, priv, &axi_hdmi_tx_mode_fops);
+
+	return 0;
+}
+
+#else
+
+static inline int axi_hdmi_tx_debugfs_init(struct drm_encoder *enc)
+{
+}
+
+#endif
+
+static void axi_hdmi_tx_encoder_enable(struct drm_encoder *encoder)
+{
+	struct axi_hdmi_tx_private *priv = drm_device_get_priv(encoder->dev);
+
+	if (!priv->clk_enabled) {
+		clk_prepare_enable(priv->hdmi_clock);
+		priv->clk_enabled = true;
+	}
+
+	writel(AXI_HDMI_TX_RESET_ENABLE, priv->base + AXI_HDMI_TX_REG_RESET);
+}
+
+static void axi_hdmi_tx_encoder_disable(struct drm_encoder *encoder)
+{
+	struct axi_hdmi_tx_private *priv = drm_device_get_priv(encoder->dev);
+
+	writel(0, priv->base + AXI_HDMI_TX_REG_RESET);
+	if (priv->clk_enabled) {
+		clk_disable_unprepare(priv->hdmi_clock);
+		priv->clk_enabled = false;
+	}
+}
+
+static void axi_hdmi_tx_encoder_mode_set(struct drm_encoder *encoder,
+	struct drm_crtc_state *crtc_state,
+	struct drm_connector_state *conn_state)
+{
+	struct axi_hdmi_tx_private *priv = drm_device_get_priv(encoder->dev);
+	struct drm_display_mode *mode = &crtc_state->mode;
+	unsigned int h_de_min, h_de_max;
+	unsigned int v_de_min, v_de_max;
+	unsigned int val;
+
+	h_de_min = mode->htotal - mode->hsync_start;
+	h_de_max = h_de_min + mode->hdisplay;
+	v_de_min = mode->vtotal - mode->vsync_start;
+	v_de_max = v_de_min + mode->vdisplay;
+
+	val = (mode->hdisplay << 16) | mode->htotal;
+	writel(val,  priv->base + AXI_HDMI_TX_REG_HTIMING1);
+	val = mode->hsync_end - mode->hsync_start;
+	writel(val,  priv->base + AXI_HDMI_TX_REG_HTIMING2);
+	val = (h_de_max << 16) | h_de_min;
+	writel(val,  priv->base + AXI_HDMI_TX_REG_HTIMING3);
+
+	val = (mode->vdisplay << 16) | mode->vtotal;
+	writel(val,  priv->base + AXI_HDMI_TX_REG_VTIMING1);
+	val = mode->vsync_end - mode->vsync_start;
+	writel(val,  priv->base + AXI_HDMI_TX_REG_VTIMING2);
+	val = (v_de_max << 16) | v_de_min;
+	writel(val,  priv->base + AXI_HDMI_TX_REG_VTIMING3);
+
+	clk_set_rate(priv->hdmi_clock, mode->clock * 1000);
+}
+
+static const struct drm_encoder_helper_funcs axi_hdmi_tx_encoder_helper_funcs = {
+	.enable = axi_hdmi_tx_encoder_enable,
+	.disable = axi_hdmi_tx_encoder_disable,
+	.atomic_mode_set = axi_hdmi_tx_encoder_mode_set,
+};
+
+int axi_hdmi_tx_encoder_create(struct drm_device *ddev)
+{
+	struct axi_hdmi_tx_private *priv = drm_device_get_priv(ddev);
+	int ret;
+
+	priv->encoder.possible_crtcs = 1;
+
+	drm_encoder_helper_add(&priv->encoder, &axi_hdmi_tx_encoder_helper_funcs);
+	ret = drm_simple_encoder_init(ddev, &priv->encoder, DRM_MODE_ENCODER_TMDS);
+	if (ret)
+		return ret;
+
+	ret = drm_bridge_attach(&priv->encoder, priv->bridge, NULL,
+						    DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
+
+	priv->connector = drm_bridge_connector_init(ddev, &priv->encoder);
+	if (IS_ERR(priv->connector)) {
+		DRM_ERROR("Unable to create bridge connector\n");
+		ret = PTR_ERR(priv->connector);
+		goto err_cleanup_encoder;
+	}
+
+	ret = drm_connector_attach_encoder(priv->connector, &priv->encoder);
+	if (ret)
+		goto err_cleanup_encoder;
+
+	ret = axi_hdmi_tx_debugfs_init(&priv->encoder);
+	if (ret)
+		goto err_cleanup_encoder;
+
+	writel(AXI_HDMI_TX_SOURCE_SEL_NORMAL, priv->base + AXI_HDMI_TX_REG_SOURCE_SEL);
+	if (priv->is_rgb) {
+		writel(AXI_HDMI_TX_CTRL_CSC_BYPASS, priv->base + AXI_HDMI_TX_REG_CTRL);
+		axi_hdmi_tx_set_color_range(priv, 0, 0xffffff);
+	} else {
+		axi_hdmi_tx_set_color_range(priv, 0x101010, 0xf0ebf0);
+	}
+
+	return 0;
+
+err_cleanup_encoder:
+	drm_encoder_cleanup(&priv->encoder);
+	return ret;
+}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
