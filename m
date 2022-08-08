Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27358C569
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 11:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781D394E1B;
	Mon,  8 Aug 2022 09:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1515.securemx.jp [210.130.202.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E305A94F53
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 09:12:33 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 2789CQn6021975;
 Mon, 8 Aug 2022 18:12:27 +0900
X-Iguazu-Qid: 34trYNUMcikmkZrP7d
X-Iguazu-QSIG: v=2; s=0; t=1659949946; q=34trYNUMcikmkZrP7d;
 m=paYWMYP3KmVoJUIcMHDDvBzn7RJH9HveWJAwV+P3Vz0=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
 by relay.securemx.jp (mx-mr1512) id 2789CPYG038699
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 8 Aug 2022 18:12:25 +0900
X-SA-MID: 40250913
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: FYI: misc: visconti: Toshiba Visconti Pyramid accelerator driver
 sample
Date: Mon,  8 Aug 2022 18:07:16 +0900
X-TSB-HOP2: ON
Message-Id: <20220808090716.20507-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Odded

This is a sample (wip) driver for a Pyramid accelerator found on Toshiba Visconti SoC.
This accelerator accepts a image (and table for scaling filter), 
then yields 4 differently scaled output images at a time.
Therefore (image-in, image-out), they say this driver should be classified to media driver category.
Actually, it is not easy to adapt it to v4l2 framework,
because the supported image format is different from ones commonly used in V4L2 drivers.
There're almost no hint for handling planar RGB images nor handling multiple images with different resolution.

I hope this post (as well as DSPIF posted last week) will help your case-study.

Regards
	Yuji Ishikawa

====
misc: visconti: Add Toshiba Visconti Pyramid image processing accelerator

Add support to Pyramid image processing accelerator on Toshiba Visconti ARM SoCs.
The accelerator takes an image and yields up to 4 resized images with different parameter.
Input / Output images can be either color / grayscale images.
The color channel format of the color image is planar-format (a plane for each color),
unlike interleaved format which is often seen in V4L2 RGB pixel format.
The visconti5 SoC has 1 unit of the accelerator.

Scaling (shrink) ratio can be x1 - x1/4.
Userland can provide the coefficients of window functions as well as using equipped linear filter.

The imprementation has two C sources:

* pyramid.c
  The user interface layer. It receives resize task description from userland library,
  manages lifecycle of DMA-BUF instances holding images,
  manages interrupt requests and updates device file status.
  Memory blocks are specified with fds + offsets of DMA-BUF instances.

* hwd_pyramid.c
  The hardware layer. It configures hardware registers following a request from pyramid.c
  This layer writes configuration to hardware registers (with 32bit word access), then kicks the hardware.
  Memory blocks are specified with 32bit-truncated phisical address.

Future plan:

* power management operations will be added, once the visconti clock framework driver supports the Pyramid hardware.
* When the Visconti IOMMU driver (currently under review) is accepted,
  the hardware layer will use 32bit IO virtual address mapped by the dedicated IOMMU.

dt-bindings: soc: visconti: Add Toshiba Visconti PYRAMID image processing accelerator bindings

This commit adds the Device Tree binding documentation that allows to describe
the PYRAMID image processing accelerator found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
 .../visconti/toshiba,visconti-pyramid.yaml    |  52 ++
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/visconti/Kconfig                 |   8 +
 drivers/misc/visconti/Makefile                |   6 +
 drivers/misc/visconti/pyramid/Makefile        |   8 +
 drivers/misc/visconti/pyramid/hwd_pyramid.c   | 334 +++++++++++
 drivers/misc/visconti/pyramid/hwd_pyramid.h   | 129 +++++
 drivers/misc/visconti/pyramid/pyramid.c       | 532 ++++++++++++++++++
 include/uapi/linux/visconti-ipa.h             |  87 +++
 include/uapi/linux/visconti-pyramid.h         | 120 ++++
 11 files changed, 1278 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/visconti/toshiba,visconti-pyramid.yaml
 create mode 100644 drivers/misc/visconti/Kconfig
 create mode 100644 drivers/misc/visconti/Makefile
 create mode 100644 drivers/misc/visconti/pyramid/Makefile
 create mode 100644 drivers/misc/visconti/pyramid/hwd_pyramid.c
 create mode 100644 drivers/misc/visconti/pyramid/hwd_pyramid.h
 create mode 100644 drivers/misc/visconti/pyramid/pyramid.c
 create mode 100644 include/uapi/linux/visconti-ipa.h
 create mode 100644 include/uapi/linux/visconti-pyramid.h

diff --git a/Documentation/devicetree/bindings/misc/visconti/toshiba,visconti-pyramid.yaml b/Documentation/devicetree/bindings/misc/visconti/toshiba,visconti-pyramid.yaml
new file mode 100644
index 000000000..be0168a6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/visconti/toshiba,visconti-pyramid.yaml
@@ -0,0 +1,52 @@
+# SPDX-LIcense-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/visconti/toshiba,visconti-pyramid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti PYRAMID image processing accelerator
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description: |
+  Toshiba Visconti PYRAMID image processing accelerator accepts a picture with up to 3 planes
+  and yields up to 4 pictures with different scaling parameters.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,visconti-pyramid
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  index:
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - index
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        pyramid0: pyramid@14160000 {
+            compatible = "toshiba,visconti-pyramid";
+            reg = <0 0x14160000 0 0x2000>;
+            interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+            index = <0>;
+        };
+    };
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 0f5a49fc7..4da73fd4c 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -487,4 +487,5 @@ source "drivers/misc/cardreader/Kconfig"
 source "drivers/misc/habanalabs/Kconfig"
 source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
+source "drivers/misc/visconti/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index a086197af..946c6f961 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_UACCE)		+= uacce/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
 obj-$(CONFIG_HI6421V600_IRQ)	+= hi6421v600-irq.o
+obj-$(CONFIG_ARCH_VISCONTI)	+= visconti/
diff --git a/drivers/misc/visconti/Kconfig b/drivers/misc/visconti/Kconfig
new file mode 100644
index 000000000..ed5a45552
--- /dev/null
+++ b/drivers/misc/visconti/Kconfig
@@ -0,0 +1,8 @@
+if ARCH_VISCONTI
+
+config VISCONTI_PYRAMID
+    tristate "Visconti Pyramid driver"
+    help
+      This option enable support for the Toshiba Visconti Pyramid accelerator driver.
+
+endif
diff --git a/drivers/misc/visconti/Makefile b/drivers/misc/visconti/Makefile
new file mode 100644
index 000000000..6cdf5a28a
--- /dev/null
+++ b/drivers/misc/visconti/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Visconti specific device drivers.
+#
+
+obj-$(CONFIG_VISCONTI_PYRAMID) += pyramid/
diff --git a/drivers/misc/visconti/pyramid/Makefile b/drivers/misc/visconti/pyramid/Makefile
new file mode 100644
index 000000000..46aac8ce6
--- /dev/null
+++ b/drivers/misc/visconti/pyramid/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Visconti PYRAMID driver
+#
+
+visconti-pyramid-objs = pyramid.o hwd_pyramid.o
+
+obj-$(CONFIG_VISCONTI_PYRAMID) += visconti-pyramid.o
diff --git a/drivers/misc/visconti/pyramid/hwd_pyramid.c b/drivers/misc/visconti/pyramid/hwd_pyramid.c
new file mode 100644
index 000000000..421448975
--- /dev/null
+++ b/drivers/misc/visconti/pyramid/hwd_pyramid.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti Affine Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/types.h>
+
+#include "hwd_pyramid.h"
+
+/* REGISTER DEFINITIONS */
+#define PYM_CFG		  0x001C
+#define PYM_INT_MASK	  0x0020
+#define PYM_R_ENABLE	  0x0030
+#define PYM_W_ENABLE	  0x0034
+#define PYM_T_ENABLE	  0x0038
+#define PYM_T00_CFG	  0x0040
+#define PYM_T00_SRAM_BASE 0x0044
+#define PYM_T00_SRAM_SIZE 0x0048
+/* table transfer: tt 00 - 15 */
+#define PYM_DMAC_TTT_BASE(tt)  (0x0100 + 0x08 * (tt))
+#define PYM_DMAC_TTT_STADR(tt) (PYM_DMAC_TTT_BASE(tt))
+#define PYM_DMAC_TTT_SIZE(tt)  (PYM_DMAC_TTT_BASE(tt) + 0x04)
+/* read image: rr 00 - 02 */
+#define PYM_DMAC_RRR_BASE(rr)	   (0x200 + 0x40 * (rr))
+#define PYM_DMAC_RRR_STADR(rr)	   (PYM_DMAC_RRR_BASE(rr))
+#define PYM_DMAC_RRR_ENDADR(rr)	   (PYM_DMAC_RRR_BASE(rr) + 0x04)
+#define PYM_DMAC_RRR_HEIGHT(rr)	   (PYM_DMAC_RRR_BASE(rr) + 0x08)
+#define PYM_DMAC_RRR_PITCH(rr)	   (PYM_DMAC_RRR_BASE(rr) + 0x0C)
+#define PYM_DMAC_RRR_CFG0(rr)	   (PYM_DMAC_RRR_BASE(rr) + 0x10)
+#define PYM_DMAC_RRR_SRAM_BASE(rr) (PYM_DMAC_RRR_BASE(rr) + 0x18)
+#define PYM_DMAC_RRR_SRAM_SIZE(rr) (PYM_DMAC_RRR_BASE(rr) + 0x1C)
+/* write image: ww 00 - 11 */
+#define PYM_DMAC_WWW_BASE(ww)	   (0x300 + 0x40 * (ww))
+#define PYM_DMAC_WWW_STADR(ww)	   (PYM_DMAC_WWW_BASE(ww))
+#define PYM_DMAC_WWW_ENDADR(ww)	   (PYM_DMAC_WWW_BASE(ww) + 0x04)
+#define PYM_DMAC_WWW_HEIGHT(ww)	   (PYM_DMAC_WWW_BASE(ww) + 0x08)
+#define PYM_DMAC_WWW_PITCH(ww)	   (PYM_DMAC_WWW_BASE(ww) + 0x0C)
+#define PYM_DMAC_WWW_CFG0(ww)	   (PYM_DMAC_WWW_BASE(ww) + 0x10)
+#define PYM_DMAC_WWW_SRAM_BASE(ww) (PYM_DMAC_WWW_BASE(ww) + 0x18)
+#define PYM_DMAC_WWW_SRAM_SIZE(ww) (PYM_DMAC_WWW_BASE(ww) + 0x1C)
+#define PYM_INT_STATUS		   0x0E04
+
+#define PYM_RSCALER_CS_START	   0x1000
+#define PYM_RSCALER_CS_MODE1	   0x1008
+#define PYM_RSCALER_CS_MODE2	   0x100C
+#define PYM_RSCALER_SIZE_IN_Y	   0x1010
+#define PYM_RSCALER_SIZE_IN_C	   0x1014
+#define PYM_RSCALER_SIZE_OUT_Y(id) (0x1018 + 0x08 * (id))
+#define PYM_RSCALER_SIZE_OUT_C(id) (0x101C + 0x08 * (id))
+#define PYM_RSCALER_OAINSET	   0x1040
+#define PYM_RSCALER_OAINSET_M	   0x1044
+#define PYM_RSCALER_OAOUTSET(id)   (0x1050 + 0x04 * (id))
+#define PYM_RSCALER_OAOUTSET_M(id) (0x1060 + 0x04 * (id))
+/* scaler route registers id 0-3, ch YH=0, YV, CH, CV=3 */
+#define PYM_RSCALER_XX_BASE(id, ch)	(0x1080 + 0x80 * (id) + 0x20 * (ch))
+#define PYM_RSCALER_XX_FILMODE(ch)	(PYM_RSCALER_XX_BASE((0), (ch)))
+#define PYM_RSCALER_XX_FILPSMODE(ch)	(PYM_RSCALER_XX_BASE((0), (ch)) + 0x04)
+#define PYM_RSCALER_XX_POS(ch)		(PYM_RSCALER_XX_BASE((0), (ch)) + 0x08)
+#define PYM_RSCALER_XX_FILBASE(id, ch)	(PYM_RSCALER_XX_BASE((id), (ch)) + 0x0C)
+#define PYM_RSCALER_XX_OAOUTSET(id, ch) (PYM_RSCALER_XX_BASE((id), (ch)) + 0x10)
+
+#define HWD_PYRAMID_Y			     (0U)
+#define HWD_PYRAMID_CB			     (1U)
+#define HWD_PYRAMID_DMAC_T00_SRAM_BASE	     (0U)
+#define HWD_PYRAMID_COEF_SIZE		     (0x40U)
+#define HWD_PYRAMID_REGISTER_START	     (1U)
+#define HWD_PYRAMID_REGISTER_IN_C_SIZE_NULL  (0U)
+#define HWD_PYRAMID_REGISTER_OUT_C_SIZE_NULL (0U)
+#define HWD_PYRAMID_MAX_SCALER_NUM	     (4U)
+#define HWD_PYRAMID_REGISTER_DUMMY_PITCH     (2U)
+#define HWD_PYRAMID_REGISTER_INT_DONE	     BIT(0)
+#define HWD_PYRAMID_REG_CLEAR_INT	     BIT(0)
+#define HWD_PYRAMID_FIXED_R_CFG_VALUE	     (0x00070701U)
+#define HWD_PYRAMID_FIXED_T00_CFG_VALUE	     (0x00000210U)
+
+/**
+ * struct hwd_pyramid_resources - HWD driver internal resource structure
+ *
+ * @base: hardware register base address
+ * @clk_id: clock_id
+ */
+struct hwd_pyramid_resources {
+	void __iomem *base;
+};
+
+/* HWD driver internal resource */
+static struct hwd_pyramid_resources hwd_pyramid_resources[HWD_PYRAMID_DEVICE_MAX] = {};
+
+/**
+ * hwd_pyramid_reset() - Reset Pyramid accelerator
+ *
+ * @index: Index of Pyramid accelerator
+ * Reset the specified pyramid module
+ */
+static void hwd_pyramid_reset(u32 index)
+{
+	const struct hwd_pyramid_resources *res = &hwd_pyramid_resources[index];
+	void __iomem *base = res->base;
+
+	/* setting fixed value */
+	writel(HWD_PYRAMID_FIXED_R_CFG_VALUE, base + PYM_CFG);
+	writel(HWD_PYRAMID_FIXED_T00_CFG_VALUE, base + PYM_T00_CFG);
+	writel(HWD_PYRAMID_DMAC_T00_SRAM_BASE, base + PYM_T00_SRAM_BASE);
+}
+
+/**
+ * hwd_pyramid_config_rvdmac() - Configure RVDMAC settings of PYRAMID to the registers
+ *
+ * @base: hardware register base address
+ * @desc: Pointer to descriptor structure
+ */
+static void hwd_pyramid_config_rvdmac(void __iomem *base, const struct hwd_pyramid_descriptor *desc)
+{
+	u32 r_enable, t_enable, w_enable;
+	u32 scaler;
+	u32 color;
+	u32 i;
+
+	/* loading TAP settings */
+	t_enable = FIELD_GET(BIT(16), desc->port_enable);
+	writel(t_enable, base + PYM_T_ENABLE);
+	writel(desc->t00_sram_size, base + PYM_T00_SRAM_SIZE);
+	for (i = 0; i < HWD_PYRAMID_TAP_ELEMENT; i++) {
+		if (desc->tap_addr[i] != 0U)
+			writel(HWD_PYRAMID_COEF_SIZE, base + PYM_DMAC_TTT_SIZE(i));
+		else
+			writel(0U, base + PYM_DMAC_TTT_SIZE(i));
+		writel(desc->tap_addr[i] & GENMASK(31, 0), base + PYM_DMAC_TTT_STADR(i));
+	}
+
+	/* loading read port settings */
+	r_enable = FIELD_GET(GENMASK(15, 13), desc->port_enable);
+	writel(r_enable, base + PYM_R_ENABLE);
+	for (i = 0; i < HWD_PYRAMID_DMA_READ_PORT; i++) {
+		writel((u32)(desc->r_stadr[i] & GENMASK(31, 0)), base + PYM_DMAC_RRR_STADR(i));
+		writel((u32)(desc->r_endadr[i] & GENMASK(31, 0)), base + PYM_DMAC_RRR_ENDADR(i));
+		writel(desc->r_dmac_height[i], base + PYM_DMAC_RRR_HEIGHT(i));
+		if (desc->r_stadr[i] != 0U) {
+			if (i == HWD_PYRAMID_Y)
+				writel(desc->r_y_pitch, base + PYM_DMAC_RRR_PITCH(i));
+			else
+				writel(desc->r_c_pitch, base + PYM_DMAC_RRR_PITCH(i));
+		} else {
+			writel(HWD_PYRAMID_REGISTER_DUMMY_PITCH, base + PYM_DMAC_RRR_PITCH(i));
+		}
+
+		writel(desc->r_sram_base[i], base + PYM_DMAC_RRR_SRAM_BASE(i));
+		writel(desc->r_sram_size[i], base + PYM_DMAC_RRR_SRAM_SIZE(i));
+	}
+	writel(desc->r_cfg0, base + PYM_DMAC_RRR_CFG0(0));
+
+	/* loading write port settings */
+	w_enable = desc->port_enable & GENMASK(11, 0);
+	writel(w_enable, base + PYM_W_ENABLE);
+	for (i = 0; i < HWD_PYRAMID_DMA_WRITE_PORT; i++) {
+		scaler = i % HWD_PYRAMID_MAX_SCALER_NUM;
+		color = i / HWD_PYRAMID_MAX_SCALER_NUM;
+		writel((u32)(desc->w_stadr[i] & GENMASK(31, 0)), base + PYM_DMAC_WWW_STADR(i));
+		writel((u32)(desc->w_endadr[i] & GENMASK(31, 0)), base + PYM_DMAC_WWW_ENDADR(i));
+		writel(desc->w_dmac_height[i], base + PYM_DMAC_WWW_HEIGHT(i));
+		if (desc->w_stadr[i] != 0U) {
+			if (color == HWD_PYRAMID_Y) {
+				writel(desc->w_cfg0[i], base + PYM_DMAC_WWW_CFG0(i));
+				writel(desc->w_y_pitch[scaler], base + PYM_DMAC_WWW_PITCH(i));
+			} else {
+				writel(desc->w_c_pitch[scaler], base + PYM_DMAC_WWW_PITCH(i));
+			}
+		} else {
+			writel(HWD_PYRAMID_REGISTER_DUMMY_PITCH, base + PYM_DMAC_WWW_PITCH(i));
+		}
+		writel(desc->w_sram_base[i], base + PYM_DMAC_WWW_SRAM_BASE(i));
+		writel(desc->w_sram_size[i], base + PYM_DMAC_WWW_SRAM_SIZE(i));
+	}
+}
+
+/**
+ * hwd_pyramid_config_scaler() - Configure SCALER settings of PYRAMID to the registers
+ *
+ * @base: hardware register base address
+ * @desc: Pointer to descriptor structure
+ */
+static void hwd_pyramid_config_scaler(void __iomem *base, const struct hwd_pyramid_descriptor *desc)
+{
+	u32 scaler_sel;
+	u32 i;
+
+	writel(desc->mode1, base + PYM_RSCALER_CS_MODE1);
+	writel(desc->mode2, base + PYM_RSCALER_CS_MODE2);
+
+	/* set r_size */
+	writel(desc->r_size, base + PYM_RSCALER_SIZE_IN_Y);
+	if (desc->r_stadr[HWD_PYRAMID_CB] == 0U)
+		writel(HWD_PYRAMID_REGISTER_IN_C_SIZE_NULL, base + PYM_RSCALER_SIZE_IN_C);
+	else
+		writel(desc->r_size, base + PYM_RSCALER_SIZE_IN_C);
+
+	/* set out_size */
+	for (scaler_sel = 0; scaler_sel < HWD_PYRAMID_SCALER_ROUTE; scaler_sel++) {
+		writel(desc->w_size[scaler_sel], base + PYM_RSCALER_SIZE_OUT_Y(scaler_sel));
+		if (desc->w_stadr[scaler_sel + HWD_PYRAMID_SCALER_ROUTE] == 0U) {
+			writel(HWD_PYRAMID_REGISTER_OUT_C_SIZE_NULL,
+			       base + PYM_RSCALER_SIZE_OUT_C(scaler_sel));
+		} else {
+			writel(desc->w_size[scaler_sel], base + PYM_RSCALER_SIZE_OUT_C(scaler_sel));
+		}
+	}
+
+	/* set boundary processing register */
+	writel(desc->oainset, base + PYM_RSCALER_OAINSET);
+	writel(desc->oainset_m, base + PYM_RSCALER_OAINSET_M);
+
+	/* set filter output fixed value embedded register */
+	for (scaler_sel = 0; scaler_sel < HWD_PYRAMID_SCALER_ROUTE; scaler_sel++) {
+		writel(desc->oaoutset[scaler_sel], base + PYM_RSCALER_OAOUTSET(scaler_sel));
+		writel(desc->oaoutset_m[scaler_sel], base + PYM_RSCALER_OAOUTSET_M(scaler_sel));
+		writel(desc->h_oaoutset[scaler_sel],
+		       base + PYM_RSCALER_XX_OAOUTSET(scaler_sel, HWD_PYRAMID_YH));
+		writel(desc->v_oaoutset[scaler_sel],
+		       base + PYM_RSCALER_XX_OAOUTSET(scaler_sel, HWD_PYRAMID_YV));
+	}
+
+	/* set common register */
+	for (i = HWD_PYRAMID_YH; i <= HWD_PYRAMID_CV; i++) {
+		writel(desc->scl_filmode[i], base + PYM_RSCALER_XX_FILMODE(i));
+		if (i == HWD_PYRAMID_YH || i == HWD_PYRAMID_CH) {
+			/* Y and C Horizontal Components */
+			writel(desc->scl_h_crop_mode, base + PYM_RSCALER_XX_FILPSMODE(i));
+			writel(desc->scl_h_crop_pos, base + PYM_RSCALER_XX_POS(i));
+		} else {
+			/* Y and C Vertical Components */
+			writel(desc->scl_v_crop_mode, base + PYM_RSCALER_XX_FILPSMODE(i));
+			writel(desc->scl_v_crop_pos, base + PYM_RSCALER_XX_POS(i));
+		}
+	}
+
+	for (scaler_sel = 0; scaler_sel < HWD_PYRAMID_SCALER_ROUTE; scaler_sel++) {
+		writel(desc->width_ratio[scaler_sel],
+		       base + PYM_RSCALER_XX_FILBASE(scaler_sel, HWD_PYRAMID_YH));
+		writel(desc->width_ratio[scaler_sel],
+		       base + PYM_RSCALER_XX_FILBASE(scaler_sel, HWD_PYRAMID_CH));
+		writel(desc->height_ratio[scaler_sel],
+		       base + PYM_RSCALER_XX_FILBASE(scaler_sel, HWD_PYRAMID_YV));
+		writel(desc->height_ratio[scaler_sel],
+		       base + PYM_RSCALER_XX_FILBASE(scaler_sel, HWD_PYRAMID_CV));
+	}
+}
+
+/**
+ * hwd_pyramid_initialize() - Initialize PYRAMID device
+ *
+ * @module_id: @ref hwd_pyramid_device "id" of the h/w module
+ * @vaddr: register base virtual address
+ * Return: 0 operation completed successfully
+ */
+void hwd_pyramid_initialize(u32 module_id, void __iomem *vaddr)
+{
+	struct hwd_pyramid_resources *res = &hwd_pyramid_resources[module_id];
+
+	res->base = vaddr;
+}
+
+/**
+ * hwd_pyramid_uninitialize() - Uninitialize PYRAMID device
+ *
+ * @module_id: @ref hwd_pyramid_device "id" of the h/w module
+ */
+void hwd_pyramid_uninitialize(u32 module_id)
+{
+	struct hwd_pyramid_resources *res = &hwd_pyramid_resources[module_id];
+
+	res->base = NULL;
+}
+
+/**
+ * hwd_pyramid_start() - Start PYRAMID device
+ *
+ * @module_id: @ref hwd_pyramid_device "id" of the h/w module
+ * @desc: Pointer to descriptor structure
+ */
+void hwd_pyramid_start(u32 module_id, const struct hwd_pyramid_descriptor *desc)
+{
+	const struct hwd_pyramid_resources *res = &hwd_pyramid_resources[module_id];
+	void __iomem *base = res->base;
+
+	hwd_pyramid_reset(module_id);
+
+	/* Clear Interrupts */
+	writel(HWD_PYRAMID_REG_CLEAR_INT, base + PYM_INT_STATUS);
+
+	hwd_pyramid_config_rvdmac(base, desc);
+	hwd_pyramid_config_scaler(base, desc);
+	dsb(st);
+
+	/* Kick Pyramid */
+	writel(HWD_PYRAMID_REGISTER_START, base + PYM_RSCALER_CS_START);
+}
+
+/**
+ * hwd_pyramid_stop() - Stop PYRAMID device.
+ *
+ * @module_id: @ref hwd_pyramid_device "id" of the h/w module
+ *
+ */
+void hwd_pyramid_stop(u32 module_id)
+{
+}
+
+/**
+ * hwd_pyramid_irq_handler() - HWD PYRAMID interrupt handler
+ *
+ * @@param[in]: module_id @ref hwd_pyramid_device "id" of the h/w module
+ * Return: event @ref hwd_pyramid_events "event" returned by HWD irq handler
+ */
+u32 hwd_pyramid_irq_handler(u32 module_id)
+{
+	const struct hwd_pyramid_resources *res = &hwd_pyramid_resources[module_id];
+	void __iomem *base = res->base;
+	u32 event = 0;
+	u32 cause;
+
+	/* Read and Clear the interrupt causes */
+	cause = readl(base + PYM_INT_STATUS);
+	writel(cause, base + PYM_INT_STATUS);
+
+	if (FIELD_GET(HWD_PYRAMID_REGISTER_INT_DONE, cause))
+		event |= HWD_PYRAMID_EVENT_DONE;
+
+	return event;
+}
diff --git a/drivers/misc/visconti/pyramid/hwd_pyramid.h b/drivers/misc/visconti/pyramid/hwd_pyramid.h
new file mode 100644
index 000000000..d4de67a41
--- /dev/null
+++ b/drivers/misc/visconti/pyramid/hwd_pyramid.h
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/* Toshiba Visconti Affine Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef HWD_PYRAMID_H
+#define HWD_PYRAMID_H
+
+#include <linux/errno.h>
+#include <linux/types.h>
+
+/**
+ * enum hwd_pyramid_module_id - ID for each PYRAMID device
+ */
+enum hwd_pyramid_module_id { HWD_PYRAMID_DEVICE_0 = 0, HWD_PYRAMID_DEVICE_MAX = 1 };
+
+/**
+ * enum hwd_pyramid_component
+ * @HWD_PYRAMID_YH:  Horizontal Y Component
+ * @HWD_PYRAMID_YV:   Vertical Y Component
+ * @HWD_PYRAMID_CH:   Horizontal C Component
+ * @HWD_PYRAMID_CV:   Vertical C Component
+ * @HWD_PYRAMID_YCHV: Total [YC][HV] Combinations
+ */
+enum hwd_pyramid_component {
+	HWD_PYRAMID_YH = 0,
+	HWD_PYRAMID_YV = 1,
+	HWD_PYRAMID_CH = 2,
+	HWD_PYRAMID_CV = 3,
+	HWD_PYRAMID_YCHV = 4,
+};
+
+/* Process completed successfully */
+#define HWD_PYRAMID_EVENT_DONE (0x01U)
+
+#define HWD_PYRAMID_TAP_ELEMENT	   (16U) /**< YH1, YV1, CH1, CV1, YH2, ... , CV4 */
+#define HWD_PYRAMID_DMA_READ_PORT  (3U) /**< Y, Cb, Cr */
+#define HWD_PYRAMID_DMA_WRITE_PORT (12U) /**< Y1, Y2, Y3, Y4, Cb1, Cb2, ... , Cr4 */
+#define HWD_PYRAMID_SCALER_ROUTE   (4U) /**< Scaler 0-3 */
+
+/**
+ * struct hwd_pyramid_descriptor - HWD PYRAMID Descriptor
+ * @port_enable: Read, Write and TAP Port enable/disable
+ * @t00_sram_size: Table Port 00 SRAM FIFO size
+ * @config_done: Status of the config APIs called
+ * @tap_addr: Table ID00 to 15 Transfer Start Address Register
+ * @r_stadr: Y, Cb, Cr data start address of input data
+ * @r_endadr: Y, Cb, Cr data end address of input data
+ * @r_size: Input width and height
+ * @mode2: Scaler mode setting register 2
+ * @r_y_pitch: The lines pitch of y on input image
+ * @r_c_pitch: The lines pitch of y on input image
+ * @r_dmac_height: Number of line rectangle data
+ * @r_cfg0: Read port configuration register 0
+ * @r_sram_base: Internal read port sram base address
+ * @r_sram_size: Internal read port sram size
+ * @w_stadr: Y, Cb, and Cr data address of Scaler0-3
+ * @w_endadr: Y, Cb, and Cr data address of Scaler0-3
+ * @w_size: Output width and height of Scaler0-3
+ * @w_cfg0: Write port configuration register 0
+ * @w_y_pitch: The lines pitch of y output image from Scaler0-3
+ * @w_c_pitch: The lines pitch of c output image from Scaler0-3
+ * @w_dmac_height: Number of line rectangle data
+ * @w_sram_base: Internal write port sram base address
+ * @w_sram_size: Internal write port sram size
+ * @mode1: Scaler mode setting register 1
+ * @scl_filmode: Filter mode setting of Scaler (common to Scaler0-3)
+ * @oainset: Filter input effective pixel outside boundary processing
+ * @oainset_m: Filter input effective pixel outside boundary processing
+ * @oaoutset: Fixed data setting of filter output
+ * @oaoutset_m: Fixed data setting of filter output
+ * @scl_h_crop_mode: Cropping setting of horizontal (common to Scaler0-3)
+ * @scl_v_crop_mode: Cropping setting of vertical (common to Scaler0-3)
+ * @scl_h_crop_pos: Starting position of horizontal cropping(common to Scaler0-3)
+ * @scl_v_crop_pos: Starting position of vertical cropping(common to Scaler0-3)
+ * @width_ratio: Width reduction/expansion rate of Scaler0 to 3
+ * @height_ratio: Height reduction/expansion rate of Scaler0 to 3
+ * @h_oaoutset: Left and right position for fixed data setting of filter output
+ * @v_oaoutset: Upper and lower position for fixed data setting of filter output
+ */
+struct hwd_pyramid_descriptor {
+	u32 port_enable;
+	u16 t00_sram_size;
+	u16 config_done;
+	u32 tap_addr[HWD_PYRAMID_TAP_ELEMENT];
+	u32 r_stadr[HWD_PYRAMID_DMA_READ_PORT];
+	u32 r_endadr[HWD_PYRAMID_DMA_READ_PORT];
+	u32 r_size;
+	u32 mode2;
+	u32 r_y_pitch;
+	u32 r_c_pitch;
+	u16 r_dmac_height[HWD_PYRAMID_DMA_READ_PORT];
+	u16 r_cfg0;
+	u16 r_sram_base[HWD_PYRAMID_DMA_READ_PORT];
+	u16 r_sram_size[HWD_PYRAMID_DMA_READ_PORT];
+	u32 w_stadr[HWD_PYRAMID_DMA_WRITE_PORT];
+	u32 w_endadr[HWD_PYRAMID_DMA_WRITE_PORT];
+	u32 w_size[HWD_PYRAMID_SCALER_ROUTE];
+	u16 w_cfg0[HWD_PYRAMID_DMA_WRITE_PORT];
+	u32 w_y_pitch[HWD_PYRAMID_SCALER_ROUTE];
+	u32 w_c_pitch[HWD_PYRAMID_SCALER_ROUTE];
+	u16 w_dmac_height[HWD_PYRAMID_DMA_WRITE_PORT];
+	u16 w_sram_base[HWD_PYRAMID_DMA_WRITE_PORT];
+	u16 w_sram_size[HWD_PYRAMID_DMA_WRITE_PORT];
+	u32 mode1;
+	u8 scl_filmode[HWD_PYRAMID_YCHV];
+	u32 oainset;
+	u32 oainset_m;
+	u32 oaoutset[HWD_PYRAMID_SCALER_ROUTE];
+	u32 oaoutset_m[HWD_PYRAMID_SCALER_ROUTE];
+	u32 scl_h_crop_mode;
+	u32 scl_v_crop_mode;
+	u32 scl_h_crop_pos;
+	u32 scl_v_crop_pos;
+	u32 width_ratio[HWD_PYRAMID_SCALER_ROUTE];
+	u32 height_ratio[HWD_PYRAMID_SCALER_ROUTE];
+	u32 h_oaoutset[HWD_PYRAMID_SCALER_ROUTE];
+	u32 v_oaoutset[HWD_PYRAMID_SCALER_ROUTE];
+};
+
+void hwd_pyramid_initialize(u32 module_id, void __iomem *vaddr);
+void hwd_pyramid_uninitialize(u32 module_id);
+void hwd_pyramid_start(u32 module_id, const struct hwd_pyramid_descriptor *desc);
+void hwd_pyramid_stop(u32 module_id);
+u32 hwd_pyramid_irq_handler(u32 module_id);
+
+#endif /* HWD_PYRAMID_H */
diff --git a/drivers/misc/visconti/pyramid/pyramid.c b/drivers/misc/visconti/pyramid/pyramid.c
new file mode 100644
index 000000000..11feb33e8
--- /dev/null
+++ b/drivers/misc/visconti/pyramid/pyramid.c
@@ -0,0 +1,532 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti Affine Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-buf.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/visconti-pyramid.h>
+#include <linux/wait.h>
+
+#include "hwd_pyramid.h"
+
+#define DRV_PYRAMID_DUMMY_END_ADDR (0xFFFFFFFFU)
+
+#define IPA_POLL_EVENT_NONE    (0)
+#define IPA_POLL_EVENT_DONE    (1)
+#define IPA_POLL_EVENT_ERROR   (2)
+#define IPA_WAKEUP_RETRY_DELAY (300 * 1000) /*usec*/
+
+int ipa_attach_dmabuf(struct device *dev, int fd, struct dma_buf_attachment **a,
+		      struct sg_table **s, dma_addr_t *addr, enum dma_data_direction dma_dir)
+{
+	struct dma_buf_attachment *attachment;
+	struct dma_buf *dmabuf;
+	struct sg_table *sgt;
+	int ret;
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf)) {
+		dev_err(dev, "Invalid dmabuf FD\n");
+		return PTR_ERR(dmabuf);
+	}
+	attachment = dma_buf_attach(dmabuf, dev);
+
+	if (IS_ERR(attachment)) {
+		dev_err(dev, "Failed to attach dmabuf\n");
+		ret = PTR_ERR(attachment);
+		goto err_put;
+	}
+	sgt = dma_buf_map_attachment(attachment, dma_dir);
+	if (IS_ERR(sgt)) {
+		dev_err(dev, "Failed to get dmabufs sg_table\n");
+		ret = PTR_ERR(sgt);
+		goto err_detach;
+	}
+	if (sgt->nents != 1) {
+		dev_err(dev, "Sparse DMA region is unsupported\n");
+		ret = -EINVAL;
+		goto err_unmap;
+	}
+
+	*addr = sg_dma_address(sgt->sgl);
+	*a = attachment;
+	*s = sgt;
+
+	return 0;
+
+err_unmap:
+	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
+err_detach:
+	dma_buf_detach(dmabuf, attachment);
+err_put:
+	dma_buf_put(dmabuf);
+	return ret;
+}
+
+struct pyramid_priv {
+	struct device *dev;
+	struct miscdevice miscdev;
+	struct mutex lock; /* only 1 user context execute an API at a time */
+	void __iomem *regs;
+	int irq;
+	wait_queue_head_t waitq;
+	enum drv_ipa_state status;
+	unsigned int hwd_event;
+	unsigned int poll_event;
+	int id;
+	char name[16];
+
+	struct dma_buf_attachment *dba[IPA_BUFFER_INDEX_MAX];
+	struct sg_table *sgt[IPA_BUFFER_INDEX_MAX];
+	enum dma_data_direction dma_dir[IPA_BUFFER_INDEX_MAX];
+	unsigned int dma_count;
+
+	dma_addr_t buffer_iova[IPA_BUFFER_INDEX_MAX];
+};
+
+static u32 pyramid_ipa_addr_to_iova(struct pyramid_priv *priv, struct drv_ipa_addr addr)
+{
+	u32 iova = 0;
+
+	if (addr.buffer_index < priv->dma_count &&
+	    addr.offset < priv->dba[addr.buffer_index]->dmabuf->size)
+		iova = priv->buffer_iova[addr.buffer_index] + addr.offset;
+	return iova;
+}
+
+static int pyramid_attach_dma_buf(struct pyramid_priv *priv, unsigned int buffer_index,
+				  struct drv_ipa_buffer_info *buffer_info)
+{
+	dma_addr_t addr;
+	int ret = 0;
+
+	if (buffer_index >= IPA_BUFFER_INDEX_MAX) {
+		dev_err(priv->dev, "Buffer index invalid: index=%d\n", buffer_index);
+		return -EINVAL;
+	}
+
+	switch (buffer_info[buffer_index].direction) {
+	case DRV_IPA_DIR_NONE:
+		priv->dma_dir[priv->dma_count] = DMA_NONE;
+		break;
+	case DRV_IPA_DIR_TO_DEVICE:
+		priv->dma_dir[priv->dma_count] = DMA_TO_DEVICE;
+		break;
+	case DRV_IPA_DIR_FROM_DEVICE:
+		priv->dma_dir[priv->dma_count] = DMA_FROM_DEVICE;
+		break;
+	case DRV_IPA_DIR_BIDIRECTION:
+		priv->dma_dir[priv->dma_count] = DMA_BIDIRECTIONAL;
+		break;
+	default:
+		dev_err(priv->dev, "DMA direction invalid: index=%d dir=%d\n", buffer_index,
+			buffer_info[buffer_index].direction);
+		return -EINVAL;
+	}
+
+	ret = ipa_attach_dmabuf(priv->dev, buffer_info[buffer_index].fd,
+				&priv->dba[priv->dma_count], &priv->sgt[priv->dma_count], &addr,
+				priv->dma_dir[priv->dma_count]);
+	if (ret == 0) {
+		priv->dma_count++;
+		priv->buffer_iova[buffer_index] = addr;
+	}
+
+	return ret;
+}
+
+static void pyramid_detach_dma_buf(struct pyramid_priv *priv)
+{
+	struct dma_buf *dmabuf;
+	int i;
+
+	for (i = 0; i < priv->dma_count; i++) {
+		dmabuf = priv->dba[i]->dmabuf;
+		dma_buf_unmap_attachment(priv->dba[i], priv->sgt[i], priv->dma_dir[i]);
+		dma_buf_detach(dmabuf, priv->dba[i]);
+		dma_buf_put(dmabuf);
+	}
+}
+
+static irqreturn_t pyramid_irq(int irq, void *dev_id)
+{
+	struct pyramid_priv *priv = dev_id;
+
+	priv->hwd_event = hwd_pyramid_irq_handler(priv->id);
+
+	disable_irq_nosync(priv->irq);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t pyramid_irq_thread(int irq, void *dev_id)
+{
+	struct pyramid_priv *priv = dev_id;
+	unsigned long delay = 1;
+
+	mutex_lock(&priv->lock);
+	pyramid_detach_dma_buf(priv);
+
+	priv->status = DRV_IPA_STATE_IDLE;
+
+	/* status should be updated before poll_event so that
+	 * when poll() returns, user context must observe state as idle
+	 */
+	smp_wmb();
+
+	WARN_ON(priv->hwd_event != HWD_PYRAMID_EVENT_DONE);
+	priv->poll_event = IPA_POLL_EVENT_DONE;
+
+	/* General barrier to avoid re-ordering of priv->poll_event=N and
+	 * waitqueue_active()
+	 */
+	smp_mb();
+
+	/* Threads going to sleep in poll() can miss wakeup, when wakeup is done
+	 * between event check in ipa_poll() and sleeping. Wakeup repeatedly.
+	 */
+	while (waitqueue_active(&priv->waitq)) {
+		wake_up_interruptible(&priv->waitq);
+
+		WARN_ON(delay > IPA_WAKEUP_RETRY_DELAY);
+		usleep_range(delay, delay + 1);
+		delay += delay;
+	}
+
+	mutex_unlock(&priv->lock);
+
+	return IRQ_HANDLED;
+}
+
+static void pyramid_start(struct pyramid_priv *priv, struct hwd_pyramid_descriptor *desc)
+{
+	hwd_pyramid_start(priv->id, desc);
+}
+
+static int pyramid_ioctl_start(struct pyramid_priv *priv, unsigned long arg)
+{
+	struct hwd_pyramid_descriptor hwd_desc;
+	struct drv_pyramid_descriptor desc;
+	int ret = 0;
+	int i;
+
+	ret = mutex_lock_interruptible(&priv->lock);
+	if (ret)
+		return ret;
+
+	if (priv->status == DRV_IPA_STATE_BUSY) {
+		dev_dbg(priv->dev, "busy: %d\n", priv->status);
+		mutex_unlock(&priv->lock);
+		return -EBUSY;
+	}
+
+	if (copy_from_user(&desc, (void __user *)arg, sizeof(struct drv_pyramid_descriptor))) {
+		dev_err(priv->dev, "Descriptor memory access error\n");
+		ret = -EFAULT;
+		goto err1;
+	}
+
+	if (!FIELD_GET(DRV_PYRAMID_BIT_CONFIG_DESC_FINAL, desc.config_done)) {
+		dev_err(priv->dev, "Descriptor configuration not complete\n");
+		ret = -EINVAL;
+		goto err1;
+	}
+
+	priv->dma_count = 0;
+
+	/* setup buffer */
+	for (i = 0; i < desc.buffer_info_num; i++) {
+		ret = pyramid_attach_dma_buf(priv, i, desc.buffer_info);
+		if (ret) {
+			dev_err(priv->dev, "dma buf attach error: index=%d\n", i);
+			goto err2;
+		}
+	}
+
+	hwd_desc.port_enable = desc.port_enable;
+	hwd_desc.t00_sram_size = desc.t00_sram_size;
+	hwd_desc.config_done = desc.config_done;
+	hwd_desc.r_size = desc.r_size;
+	hwd_desc.mode2 = desc.mode2;
+	hwd_desc.r_y_pitch = desc.r_y_pitch;
+	hwd_desc.r_c_pitch = desc.r_c_pitch;
+	memcpy(hwd_desc.r_dmac_height, desc.r_dmac_height, sizeof(hwd_desc.r_dmac_height));
+	hwd_desc.r_cfg0 = desc.r_cfg0;
+	memcpy(hwd_desc.r_sram_base, desc.r_sram_base, sizeof(hwd_desc.r_sram_base));
+	memcpy(hwd_desc.r_sram_size, desc.r_sram_size, sizeof(hwd_desc.r_sram_size));
+	memcpy(hwd_desc.w_size, desc.w_size, sizeof(hwd_desc.w_size));
+	memcpy(hwd_desc.w_cfg0, desc.w_cfg0, sizeof(hwd_desc.w_cfg0));
+	memcpy(hwd_desc.w_y_pitch, desc.w_y_pitch, sizeof(hwd_desc.w_y_pitch));
+	memcpy(hwd_desc.w_c_pitch, desc.w_c_pitch, sizeof(hwd_desc.w_c_pitch));
+	memcpy(hwd_desc.w_dmac_height, desc.w_dmac_height, sizeof(hwd_desc.w_dmac_height));
+	memcpy(hwd_desc.w_sram_base, desc.w_sram_base, sizeof(hwd_desc.w_sram_base));
+	memcpy(hwd_desc.w_sram_size, desc.w_sram_size, sizeof(hwd_desc.w_sram_size));
+	hwd_desc.mode1 = desc.mode1;
+	memcpy(hwd_desc.scl_filmode, desc.scl_filmode, sizeof(hwd_desc.scl_filmode));
+	hwd_desc.oainset = desc.oainset;
+	hwd_desc.oainset_m = desc.oainset_m;
+	memcpy(hwd_desc.oaoutset, desc.oaoutset, sizeof(hwd_desc.oaoutset));
+	memcpy(hwd_desc.oaoutset_m, desc.oaoutset_m, sizeof(hwd_desc.oaoutset));
+	hwd_desc.scl_h_crop_mode = desc.scl_h_crop_mode;
+	hwd_desc.scl_v_crop_mode = desc.scl_v_crop_mode;
+	hwd_desc.scl_h_crop_pos = desc.scl_h_crop_pos;
+	hwd_desc.scl_v_crop_pos = desc.scl_v_crop_pos;
+	memcpy(hwd_desc.width_ratio, desc.width_ratio, sizeof(hwd_desc.width_ratio));
+	memcpy(hwd_desc.height_ratio, desc.height_ratio, sizeof(hwd_desc.height_ratio));
+	memcpy(hwd_desc.h_oaoutset, desc.h_oaoutset, sizeof(hwd_desc.h_oaoutset));
+	memcpy(hwd_desc.v_oaoutset, desc.v_oaoutset, sizeof(hwd_desc.v_oaoutset));
+
+	for (i = 0; i < HWD_PYRAMID_TAP_ELEMENT; i++) {
+		hwd_desc.tap_addr[i] = 0;
+		if (!drv_ipa_is_invalid_addr(desc.tap_addr[i])) {
+			hwd_desc.tap_addr[i] = pyramid_ipa_addr_to_iova(priv, desc.tap_addr[i]);
+			if (hwd_desc.tap_addr[i] == 0) {
+				dev_err(priv->dev,
+					"IPA address to iova conversion error: tap_addr %s: %d\n",
+					__func__, __LINE__);
+				ret = -EINVAL;
+				goto err2;
+			}
+		}
+	}
+
+	for (i = 0; i < HWD_PYRAMID_DMA_READ_PORT; i++) {
+		hwd_desc.r_stadr[i] = 0;
+		if (!drv_ipa_is_invalid_addr(desc.r_stadr[i])) {
+			hwd_desc.r_stadr[i] = pyramid_ipa_addr_to_iova(priv, desc.r_stadr[i]);
+			if (hwd_desc.r_stadr[i] == 0) {
+				dev_err(priv->dev,
+					"IPA address to iova conversion error: r_stadr %s: %d\n",
+					__func__, __LINE__);
+				ret = -EINVAL;
+				goto err2;
+			}
+		}
+	}
+
+	for (i = 0; i < HWD_PYRAMID_DMA_READ_PORT; i++) {
+		hwd_desc.r_endadr[i] = DRV_PYRAMID_DUMMY_END_ADDR;
+		if (!drv_ipa_is_invalid_addr(desc.r_endadr[i])) {
+			hwd_desc.r_endadr[i] = pyramid_ipa_addr_to_iova(priv, desc.r_endadr[i]);
+			if (hwd_desc.r_endadr[i] == 0) {
+				dev_err(priv->dev,
+					"IPA address to iova conversion error: r_endadr %s: %d\n",
+					__func__, __LINE__);
+				ret = -EINVAL;
+				goto err2;
+			}
+		}
+	}
+
+	for (i = 0; i < HWD_PYRAMID_DMA_WRITE_PORT; i++) {
+		hwd_desc.w_stadr[i] = 0;
+		if (!drv_ipa_is_invalid_addr(desc.w_stadr[i])) {
+			hwd_desc.w_stadr[i] = pyramid_ipa_addr_to_iova(priv, desc.w_stadr[i]);
+			if (hwd_desc.w_stadr[i] == 0) {
+				dev_err(priv->dev,
+					"IPA address to iova conversion error: w_stadr %s: %d\n",
+					__func__, __LINE__);
+				ret = -EINVAL;
+				goto err2;
+			}
+		}
+	}
+
+	for (i = 0; i < HWD_PYRAMID_DMA_WRITE_PORT; i++) {
+		hwd_desc.w_endadr[i] = DRV_PYRAMID_DUMMY_END_ADDR;
+		if (!drv_ipa_is_invalid_addr(desc.w_endadr[i])) {
+			hwd_desc.w_endadr[i] = pyramid_ipa_addr_to_iova(priv, desc.w_endadr[i]);
+			if (hwd_desc.w_endadr[i] == 0) {
+				dev_err(priv->dev,
+					"IPA address to iova conversion error: w_endadr %s: %d\n",
+					__func__, __LINE__);
+				ret = -EINVAL;
+				goto err2;
+			}
+		}
+	}
+
+	pyramid_start(priv, &hwd_desc);
+
+	priv->poll_event = IPA_POLL_EVENT_NONE;
+	priv->hwd_event = 0;
+	priv->status = DRV_IPA_STATE_BUSY;
+	/* Barrier to prevent pyramid_irq() from setting priv->hwd_event
+	 * before it is reset above
+	 */
+	smp_wmb();
+	enable_irq(priv->irq);
+
+	mutex_unlock(&priv->lock);
+
+	return ret;
+
+err2:
+	pyramid_detach_dma_buf(priv);
+err1:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int pyramid_ioctl_get_status(struct pyramid_priv *priv, unsigned long arg)
+{
+	struct drv_pyramid_status status;
+	int ret = 0;
+
+	status.state = priv->status;
+	if (copy_to_user((void __user *)arg, &status, sizeof(struct drv_pyramid_status))) {
+		dev_err(priv->dev, "status memory access error\n");
+		ret = -EFAULT;
+	}
+
+	return ret;
+}
+
+static long pyramid_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct pyramid_priv *priv = container_of(fp->private_data, struct pyramid_priv, miscdev);
+	int ret = 0;
+
+	switch (cmd) {
+	case IOC_IPA_START:
+		ret = pyramid_ioctl_start(priv, arg);
+		break;
+	case IOC_IPA_GET_STATUS:
+		ret = pyramid_ioctl_get_status(priv, arg);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+
+	return ret;
+}
+
+static __poll_t pyramid_poll(struct file *fp, poll_table *wait)
+{
+	struct pyramid_priv *priv = container_of(fp->private_data, struct pyramid_priv, miscdev);
+	__poll_t mask = 0;
+
+	poll_wait(fp, &priv->waitq, wait);
+
+	/* Barrier to avoid re-ordering of poll_wait() and event load
+	 * Read barrier here and release barrier in poll_wait() together will
+	 * prevent re-ordering
+	 */
+	smp_rmb();
+	if (priv->poll_event != IPA_POLL_EVENT_NONE)
+		mask = EPOLLIN | EPOLLRDNORM;
+	return mask;
+}
+
+static const struct file_operations pyramid_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = pyramid_ioctl,
+	.poll = pyramid_poll,
+};
+
+static int pyramid_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pyramid_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->lock);
+
+	/* update DMA mask */
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
+	if (ret)
+		return ret;
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return priv->irq;
+
+	ret = devm_request_threaded_irq(dev, priv->irq, pyramid_irq, pyramid_irq_thread, 0,
+					"pyramid", priv);
+	if (ret) {
+		dev_err(dev, "irq request failed\n");
+		return ret;
+	}
+	disable_irq(priv->irq);
+
+	ret = of_property_read_u32(dev->of_node, "index", &priv->id);
+	if (ret) {
+		dev_err(dev, "failed to acquire irq resource\n");
+		return ret;
+	}
+
+	hwd_pyramid_initialize(priv->id, priv->regs);
+
+	snprintf(priv->name, sizeof(priv->name), "pyramid%d", priv->id);
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = priv->name;
+	priv->miscdev.fops = &pyramid_fops;
+	ret = misc_register(&priv->miscdev);
+	if (ret) {
+		dev_err(dev, "misc registration failed\n");
+		hwd_pyramid_uninitialize(priv->id);
+		return ret;
+	}
+
+	priv->dev = dev;
+	platform_set_drvdata(pdev, priv);
+
+	init_waitqueue_head(&priv->waitq);
+
+	priv->status = DRV_IPA_STATE_IDLE;
+	return 0;
+}
+
+static int pyramid_remove(struct platform_device *pdev)
+{
+	struct pyramid_priv *priv = platform_get_drvdata(pdev);
+
+	misc_deregister(&priv->miscdev);
+	hwd_pyramid_uninitialize(priv->id);
+	return 0;
+}
+
+static const struct of_device_id pyramid_of_match[] = {
+	{
+		.compatible = "toshiba,visconti-pyramid",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, pyramid_of_match);
+
+static struct platform_driver pyramid_driver = {
+	.probe = pyramid_probe,
+	.remove = pyramid_remove,
+	.driver = {
+		.name = "visconti_pyramid",
+		.of_match_table = of_match_ptr(pyramid_of_match),
+	},
+};
+module_platform_driver(pyramid_driver);
+
+MODULE_AUTHOR("Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>");
+MODULE_DESCRIPTION("Toshiba Visconti pyramid driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/include/uapi/linux/visconti-ipa.h b/include/uapi/linux/visconti-ipa.h
new file mode 100644
index 000000000..6a90ea5f9
--- /dev/null
+++ b/include/uapi/linux/visconti-ipa.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Toshiba Visconti Image Processing Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef _UAPI_LINUX_IPA_H
+#define _UAPI_LINUX_IPA_H
+
+#include <linux/types.h>
+
+/**
+ * enum drv_ipa_state - state of Visconti IPA driver
+ *
+ * @DRV_IPA_STATE_IDLE:     driver is idle
+ * @DRV_IPA_STATE_BUSY:     device is busy
+ */
+enum drv_ipa_state { DRV_IPA_STATE_IDLE = 0, DRV_IPA_STATE_BUSY };
+
+/**
+ * enum drv_ipa_buffer_direction - usage of buffer
+ *
+ * @DRV_IPA_DIR_BIDIRECTION: cpu writes/reads data
+ * @DRV_IPA_DIR_TO_DEVICE:   cpu writes data
+ * @DRV_IPA_DIR_FROM_DEVICE: cpu reads data
+ * @DRV_IPA_DIR_NONE:        cpu not access or non-coherent
+ */
+enum drv_ipa_buffer_direction {
+	DRV_IPA_DIR_BIDIRECTION = 0,
+	DRV_IPA_DIR_TO_DEVICE,
+	DRV_IPA_DIR_FROM_DEVICE,
+	DRV_IPA_DIR_NONE
+};
+
+/**
+ * struct drv_ipa_buffer_info - buffer information for Visconti IPA drivers
+ *
+ * @fd:        file descriptor of a dma-buf heap instance
+ * @flags:     optional flags for attributes of the buffer
+ * @direction: A &enum drv_ipa_buffer_direction value
+ *             for buffer direction (to/from device)
+ */
+struct drv_ipa_buffer_info {
+	__u32 fd;
+	__u32 flags;
+	__u32 direction;
+};
+
+/**
+ * struct drv_ipa_addr - address structure for Visconti IPA drivers
+ *
+ * @buffer_index: array index of &struct drv_ipa_buffer_info
+ * @offset:       offset from the top of the heap instance
+ */
+struct drv_ipa_addr {
+	__u32 buffer_index;
+	__u32 offset;
+};
+
+#define IPA_BUFFER_INDEX_MAX (16)
+#define IPA_INVALID_ADDR                                                                           \
+	{                                                                                          \
+		.buffer_index = 0xffffffffu, .offset = 0xffffffffu                                 \
+	}
+
+static inline struct drv_ipa_addr drv_ipa_invalid_addr(void)
+{
+	struct drv_ipa_addr invalid_addr = IPA_INVALID_ADDR;
+	return invalid_addr;
+}
+
+static inline bool drv_ipa_is_invalid_addr(struct drv_ipa_addr addr)
+{
+	struct drv_ipa_addr invalid_addr = IPA_INVALID_ADDR;
+
+	if (addr.buffer_index == invalid_addr.buffer_index && addr.offset == invalid_addr.offset)
+		return true;
+
+	return false;
+}
+
+#define IOC_IPA_MAGIC	   'I'
+#define IOC_IPA_START	   _IO(IOC_IPA_MAGIC, 0)
+#define IOC_IPA_GET_STATUS _IO(IOC_IPA_MAGIC, 1)
+
+#endif /* _UAPI_LINUX_IPA_H */
diff --git a/include/uapi/linux/visconti-pyramid.h b/include/uapi/linux/visconti-pyramid.h
new file mode 100644
index 000000000..b2987b2d2
--- /dev/null
+++ b/include/uapi/linux/visconti-pyramid.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Toshiba Visconti Affine Accelerator Support
+ *
+ * (C) Copyright 2022 TOSHIBA CORPORATION
+ * (C) Copyright 2022 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef _UAPI_LINUX_PYRAMID_H
+#define _UAPI_LINUX_PYRAMID_H
+
+#include <linux/const.h>
+#include <linux/ioctl.h>
+#include <linux/types.h>
+#include <linux/visconti-ipa.h>
+
+#define DRV_PYRAMID_BIT_CONFIG_DESC_FINAL _BITUL(15)
+
+#define DRV_PYRAMID_YH		   (0U) /* Horizontal Y Component */
+#define DRV_PYRAMID_YV		   (1U) /* Vertical Y Component */
+#define DRV_PYRAMID_CH		   (2U) /* Horizontal C Component */
+#define DRV_PYRAMID_CV		   (3U) /* Vertical C Component */
+#define DRV_PYRAMID_YCHV	   (4U) /* Total [YC][HV] Combinations */
+#define DRV_PYRAMID_TAP_ELEMENT	   (16U) /* YH1, YV1, CH1, CV1, YH2, ... , CV4 */
+#define DRV_PYRAMID_DMA_READ_PORT  (3U) /* Y, Cb, Cr */
+#define DRV_PYRAMID_DMA_WRITE_PORT (12U) /* Y1, Y2, Y3, Y4, Cb1, Cb2, ... , Cr4 */
+#define DRV_PYRAMID_SCALER_ROUTE   (4U) /* Scaler 0-3 */
+
+/**
+ * struct drv_pyramid_status - PYRAMID IPA status for IOC_IPA_GET_STATUS
+ * @state: A &enum drv_ipa_state value for the state of the driver
+ */
+struct drv_pyramid_status {
+	__u32 state;
+};
+
+/**
+ * struct drv_pyramid_descriptor - PYRAMID IPA descriptor for IOC_IPA_START
+ * @port_enable:     Read, Write and TAP Port enable/disable
+ * @t00_sram_size:   Table Port 00 SRAM FIFO size
+ * @config_done:     Status of the config APIs called
+ * @tap_addr:        Table ID00 to 15 Transfer Start Address Register
+ * @r_stadr:         Y, Cb, Cr data start address of input data
+ * @r_endadr:        Y, Cb, Cr data end address of input data
+ * @r_size:          Input width and height
+ * @mode2:           Scaler mode setting register 2
+ * @r_y_pitch:       The lines pitch of y on input image
+ * @r_c_pitch:       The lines pitch of y on input image
+ * @r_dmac_height:   Read port configuration register 0
+ * @r_cfg0:          Line pitch of the table used in the table conversion mode
+ * @r_sram_base:     Internal read port sram base address
+ * @r_sram_size:     Internal read port sram size
+ * @w_stadr:         Y, Cb, and Cr data address of Scaler0-3
+ * @w_endadr:        Y, Cb, and Cr data address of Scaler0-3
+ * @w_size:          Output width and height of Scaler0-3
+ * @w_cfg0:          Write port configuration register 0
+ * @w_y_pitch:       The lines pitch of y output image from Scaler0-3
+ * @w_c_pitch:       The lines pitch of c output image from Scaler0-3
+ * @w_dmac_height:   Number of line rectangle data
+ * @w_sram_base:     Internal write port sram base address
+ * @w_sram_size:     Internal write port sram size
+ * @mode1:           Scaler mode setting register 1
+ * @scl_filmode:     Filter mode setting of Scaler (common to Scaler0-3)
+ * @oainset:         Filter input effective pixel outside boundary processing
+ * @oainset_m:       Filter input effective pixel outside boundary processing
+ * @oaoutset:        Fixed data setting of filter output
+ * @oaoutset_m:      Fixed data setting of filter output
+ * @scl_h_crop_mode: Cropping setting of horizontal (common to Scaler0-3)
+ * @scl_v_crop_mode: Cropping setting of vertical (common to Scaler0-3)
+ * @scl_h_crop_pos:  Starting position of horizontal cropping(common to Scaler0-3)
+ * @scl_v_crop_pos:  Starting position of vertical cropping(common to Scaler0-3)
+ * @width_ratio:     Width reduction/expansion rate of Scaler0 to 3
+ * @height_ratio:    Height reduction/expansion rate of Scaler0 to 3
+ * @h_oaoutset:      Left and right position for fixed data setting of filter output
+ * @v_oaoutset:      Upper and lower position for fixed data setting of filter output
+ * @buffer_info:     Table of buffer information
+ * @buffer_info_num: Number of buffer_info
+ */
+struct drv_pyramid_descriptor {
+	__u32 port_enable;
+	__u16 t00_sram_size;
+	__u16 config_done;
+	struct drv_ipa_addr tap_addr[DRV_PYRAMID_TAP_ELEMENT];
+	struct drv_ipa_addr r_stadr[DRV_PYRAMID_DMA_READ_PORT];
+	struct drv_ipa_addr r_endadr[DRV_PYRAMID_DMA_READ_PORT];
+	__u32 r_size;
+	__u32 mode2;
+	__u32 r_y_pitch;
+	__u32 r_c_pitch;
+	__u16 r_dmac_height[DRV_PYRAMID_DMA_READ_PORT];
+	__u16 r_cfg0;
+	__u16 r_sram_base[DRV_PYRAMID_DMA_READ_PORT];
+	__u16 r_sram_size[DRV_PYRAMID_DMA_READ_PORT];
+	struct drv_ipa_addr w_stadr[DRV_PYRAMID_DMA_WRITE_PORT];
+	struct drv_ipa_addr w_endadr[DRV_PYRAMID_DMA_WRITE_PORT];
+	__u32 w_size[DRV_PYRAMID_SCALER_ROUTE];
+	__u16 w_cfg0[DRV_PYRAMID_DMA_WRITE_PORT];
+	__u32 w_y_pitch[DRV_PYRAMID_SCALER_ROUTE];
+	__u32 w_c_pitch[DRV_PYRAMID_SCALER_ROUTE];
+	__u16 w_dmac_height[DRV_PYRAMID_DMA_WRITE_PORT];
+	__u16 w_sram_base[DRV_PYRAMID_DMA_WRITE_PORT];
+	__u16 w_sram_size[DRV_PYRAMID_DMA_WRITE_PORT];
+	__u32 mode1;
+	__u8 scl_filmode[DRV_PYRAMID_YCHV];
+	__u32 oainset;
+	__u32 oainset_m;
+	__u32 oaoutset[DRV_PYRAMID_SCALER_ROUTE];
+	__u32 oaoutset_m[DRV_PYRAMID_SCALER_ROUTE];
+	__u32 scl_h_crop_mode;
+	__u32 scl_v_crop_mode;
+	__u32 scl_h_crop_pos;
+	__u32 scl_v_crop_pos;
+	__u32 width_ratio[DRV_PYRAMID_SCALER_ROUTE];
+	__u32 height_ratio[DRV_PYRAMID_SCALER_ROUTE];
+	__u32 h_oaoutset[DRV_PYRAMID_SCALER_ROUTE];
+	__u32 v_oaoutset[DRV_PYRAMID_SCALER_ROUTE];
+	struct drv_ipa_buffer_info buffer_info[IPA_BUFFER_INDEX_MAX];
+	__s32 buffer_info_num;
+};
+
+#endif /* _UAPI_LINUX_PYRAMID_H */
-- 
2.17.1


