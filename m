Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F198B6061D5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 15:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AC310E49D;
	Thu, 20 Oct 2022 13:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E1210E4A1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 13:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666273116; x=1697809116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pKOSnalfsTL2RMvanaTuFFWEpdqV62SisK/zZzIZU+E=;
 b=mGKRU2sMOjmUNi6abZwWWMgTBXU+Dc7U/wPPyIq2b87KjbXYhCw+pnGj
 L3WAPA04jQS50N5jt2G5RLOckhHcaud4aLNKU3Qg13v/KAWUmRfYR7Vq3
 GeHgEYIVMl3BlrwLx+4v+PftVMO7kpioVfcqECkwUVPMLMzAtjqpZ4cT9
 qauNcn6nWER7dCQys81mUrwkSx+5sPixW0mf4HbjsdYUQtDm1QMnMPt9v
 eIJKVr1htyaDQZ6JTeQJ5VKWLefhWkhykCh97YS/aCD6rbq5huchzH4hY
 fUjtd8IQyGsDDkiEjQmQcy2smnJRw4DSPG2MeZHTOaqGN1RUI2wX2nYUl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307805975"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="307805975"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 06:38:36 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719064528"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="719064528"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 06:38:32 -0700
From: "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v4 04/10] gna: initialize MMU
Date: Thu, 20 Oct 2022 15:35:19 +0200
Message-Id: <20221020133525.1810728-5-maciej.kwapulinski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomasz Jankowski <tomasz1.jankowski@intel.com>

Setup MMU in the driver with a new memory component.

Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
---
 drivers/gpu/drm/gna/Kbuild       |  2 +-
 drivers/gpu/drm/gna/gna_device.c |  7 +++
 drivers/gpu/drm/gna/gna_device.h |  8 ++++
 drivers/gpu/drm/gna/gna_hw.h     | 53 ++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_mem.c    | 78 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_mem.h    | 50 ++++++++++++++++++++
 drivers/gpu/drm/gna/gna_pci.c    | 70 ++++++++++++++++++++++++++++
 7 files changed, 267 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/gna/gna_mem.c
 create mode 100644 drivers/gpu/drm/gna/gna_mem.h

diff --git a/drivers/gpu/drm/gna/Kbuild b/drivers/gpu/drm/gna/Kbuild
index 00e8d6a2c49c..2bda61c61f45 100644
--- a/drivers/gpu/drm/gna/Kbuild
+++ b/drivers/gpu/drm/gna/Kbuild
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-gna-y := gna_device.o gna_pci.o
+gna-y := gna_device.o gna_mem.o gna_pci.o
 
 obj-$(CONFIG_DRM_GNA) += gna.o
diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index 1f357221a603..f1724cbe3963 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -63,6 +63,13 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 	bld_reg = gna_reg_read(gna_priv, GNA_MMIO_IBUFFS);
 	gna_priv->hw_info.in_buf_s = bld_reg & GENMASK(7, 0);
 
+	err = gna_mmu_init(gna_priv);
+	if (err)
+		return err;
+
+	dev_dbg(parent, "maximum memory size %llu num pd %d\n",
+		gna_priv->info.max_hw_mem, gna_priv->info.num_pagetables);
+
 	dev_set_drvdata(parent, drm_dev);
 
 	err = gna_drm_dev_init(drm_dev);
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index e42f167b62a0..d2357954b245 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 
 #include "gna_hw.h"
+#include "gna_mem.h"
 
 #define DRIVER_NAME		"gna"
 #define DRIVER_DESC		"Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
@@ -28,6 +29,8 @@ struct gna_device {
 	void __iomem *iobase;
 	struct gna_dev_info info;
 	struct gna_hw_info hw_info;
+
+	struct gna_mmu_object mmu;
 };
 
 int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase);
@@ -36,4 +39,9 @@ static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
 	return readl(gna_priv->iobase + reg);
 }
 
+static inline struct device *gna_dev(struct gna_device *gna_priv)
+{
+	return gna_priv->drm.dev;
+}
+
 #endif /* __GNA_DEVICE_H__ */
diff --git a/drivers/gpu/drm/gna/gna_hw.h b/drivers/gpu/drm/gna/gna_hw.h
index e858b76606fc..514166a87c4d 100644
--- a/drivers/gpu/drm/gna/gna_hw.h
+++ b/drivers/gpu/drm/gna/gna_hw.h
@@ -6,9 +6,60 @@
 
 #include <linux/mm_types.h>
 
+#define GNA_FEATURES						\
+	.max_hw_mem = 256 * 1024 * 1024,			\
+		.num_pagetables = 64,				\
+		.num_page_entries = PAGE_SIZE / sizeof(u32),	\
+		/* desc_info all in bytes */			\
+		.desc_info = {					\
+		.rsvd_size = 256,				\
+		.cfg_size = 256,				\
+		.desc_size = 784,				\
+		.mmu_info = {					\
+			.vamax_size = 4,			\
+			.rsvd_size = 12,			\
+			.pd_size = 4 * 64,			\
+		},						\
+	}
+
+#define GNA_GEN1_FEATURES			\
+	GNA_FEATURES,				\
+		.max_layer_count = 1024
+
+#define GNA_GEN2_FEATURES			\
+	GNA_FEATURES,				\
+		.max_layer_count = 4096
+
+#define GNA_DEV_HWID_CNL	0x5A11
+#define GNA_DEV_HWID_EHL	0x4511
+#define GNA_DEV_HWID_GLK	0x3190
+#define GNA_DEV_HWID_ICL	0x8A11
+#define GNA_DEV_HWID_JSL	0x4E11
+#define GNA_DEV_HWID_TGL	0x9A11
+#define GNA_DEV_HWID_RKL	0x4C11
+#define GNA_DEV_HWID_ADL	0x464F
+#define GNA_DEV_HWID_RPL	0xA74F
+#define GNA_DEV_HWID_MTL	0x7E4C
+
 /* GNA MMIO registers */
 #define GNA_MMIO_IBUFFS		0xB4
 
+#define GNA_PGDIRN_LEN			64
+#define GNA_PGDIR_INVALID		1
+
+struct gna_mmu_info {
+	u32 vamax_size;
+	u32 rsvd_size;
+	u32 pd_size;
+};
+
+struct gna_desc_info {
+	u32 rsvd_size;
+	u32 cfg_size;
+	u32 desc_size;
+	struct gna_mmu_info mmu_info;
+};
+
 struct gna_hw_info {
 	u8 in_buf_s;
 };
@@ -19,6 +70,8 @@ struct gna_dev_info {
 	u32 num_page_entries;
 	u32 max_layer_count;
 	u64 max_hw_mem;
+
+	struct gna_desc_info desc_info;
 };
 
 #endif // __GNA_HW_H__
diff --git a/drivers/gpu/drm/gna/gna_mem.c b/drivers/gpu/drm/gna/gna_mem.c
new file mode 100644
index 000000000000..21e266583e27
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_mem.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2017-2022 Intel Corporation
+
+#include <drm/drm_managed.h>
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/math.h>
+#include <linux/mm.h>
+
+#include "gna_device.h"
+#include "gna_mem.h"
+
+static void gna_mmu_set(struct gna_device *gna_priv)
+{
+	struct gna_mmu_object *mmu;
+	dma_addr_t pagetable_dma;
+	u32 *pgdirn;
+	int i;
+
+	mmu = &gna_priv->mmu;
+
+	pgdirn = mmu->hwdesc->mmu.pagedir_n;
+
+	for (i = 0; i < mmu->num_pagetables; i++) {
+		pagetable_dma = mmu->pagetables_dma[i];
+		pgdirn[i] = pagetable_dma >> PAGE_SHIFT;
+	}
+
+	for (; i < GNA_PGDIRN_LEN; i++)
+		pgdirn[i] = GNA_PGDIR_INVALID;
+}
+
+/* descriptor and page tables allocation */
+int gna_mmu_init(struct gna_device *gna_priv)
+{
+	struct device *parent = gna_dev(gna_priv);
+	struct gna_mmu_object *mmu;
+	int desc_size;
+	int i;
+
+	if (gna_priv->info.num_pagetables > GNA_PGDIRN_LEN) {
+		dev_dbg(gna_dev(gna_priv), "number of pagetables requested too large: %u\n", gna_priv->info.num_pagetables);
+		return -EINVAL;
+	}
+
+	mmu = &gna_priv->mmu;
+
+	desc_size = round_up(gna_priv->info.desc_info.desc_size, PAGE_SIZE);
+
+	mmu->hwdesc = dmam_alloc_coherent(parent, desc_size, &mmu->hwdesc_dma,
+					GFP_KERNEL);
+	if (!mmu->hwdesc)
+		return -ENOMEM;
+
+	mmu->num_pagetables = gna_priv->info.num_pagetables;
+
+	mmu->pagetables_dma = drmm_kmalloc_array(&gna_priv->drm, mmu->num_pagetables, sizeof(*mmu->pagetables_dma),
+						GFP_KERNEL);
+	if (!mmu->pagetables_dma)
+		return -ENOMEM;
+
+	mmu->pagetables = drmm_kmalloc_array(&gna_priv->drm, mmu->num_pagetables, sizeof(*mmu->pagetables), GFP_KERNEL);
+
+	if (!mmu->pagetables)
+		return -ENOMEM;
+
+	for (i = 0; i < mmu->num_pagetables; i++) {
+		mmu->pagetables[i] = dmam_alloc_coherent(parent, PAGE_SIZE,
+							&mmu->pagetables_dma[i], GFP_KERNEL);
+		if (!mmu->pagetables[i])
+			return -ENOMEM;
+	}
+
+	gna_mmu_set(gna_priv);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/gna/gna_mem.h b/drivers/gpu/drm/gna/gna_mem.h
new file mode 100644
index 000000000000..f9b8dcb1399f
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_mem.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright(c) 2017-2022 Intel Corporation */
+
+#ifndef __GNA_MEM_H__
+#define __GNA_MEM_H__
+
+#include <linux/types.h>
+
+#include "gna_hw.h"
+
+struct gna_gem_object;
+struct work_struct;
+struct gna_device;
+
+struct gna_xnn_descriptor {
+	u32 labase;
+	u16 lacount;
+	u16 _rsvd;
+};
+
+struct gna_mmu {
+	u32 vamaxaddr;
+	u8 __res_204[12];
+	u32 pagedir_n[GNA_PGDIRN_LEN];
+};
+
+struct gna_hw_descriptor {
+	u8 __res_0000[256];
+	struct gna_xnn_descriptor xnn_config;
+	u8 __unused[248];
+	struct gna_mmu mmu;
+};
+
+struct gna_mmu_object {
+	struct gna_hw_descriptor *hwdesc;
+
+	dma_addr_t hwdesc_dma;
+
+	u32 **pagetables;
+	dma_addr_t *pagetables_dma;
+
+	u32 num_pagetables;
+
+	u32 filled_pts;
+	u32 filled_pages;
+};
+
+int gna_mmu_init(struct gna_device *gna_priv);
+
+#endif // __GNA_MEM_H__
diff --git a/drivers/gpu/drm/gna/gna_pci.c b/drivers/gpu/drm/gna/gna_pci.c
index 14f8b34e5f5c..9a6c82362e32 100644
--- a/drivers/gpu/drm/gna/gna_pci.c
+++ b/drivers/gpu/drm/gna/gna_pci.c
@@ -8,6 +8,73 @@
 #include "gna_hw.h"
 #include "gna_pci.h"
 
+static const struct gna_dev_info cnl_dev_info = {
+	.hwid = GNA_DEV_HWID_CNL,
+	GNA_GEN1_FEATURES
+};
+
+static const struct gna_dev_info glk_dev_info = {
+	.hwid = GNA_DEV_HWID_GLK,
+	GNA_GEN1_FEATURES
+};
+
+static const struct gna_dev_info ehl_dev_info = {
+	.hwid = GNA_DEV_HWID_EHL,
+	GNA_GEN1_FEATURES
+};
+
+static const struct gna_dev_info icl_dev_info = {
+	.hwid = GNA_DEV_HWID_ICL,
+	GNA_GEN1_FEATURES
+};
+
+static const struct gna_dev_info jsl_dev_info = {
+	.hwid = GNA_DEV_HWID_JSL,
+	GNA_GEN2_FEATURES
+};
+
+static const struct gna_dev_info tgl_dev_info = {
+	.hwid = GNA_DEV_HWID_TGL,
+	GNA_GEN2_FEATURES
+};
+
+static const struct gna_dev_info rkl_dev_info = {
+	.hwid = GNA_DEV_HWID_RKL,
+	GNA_GEN2_FEATURES
+};
+
+static const struct gna_dev_info adl_dev_info = {
+	.hwid = GNA_DEV_HWID_ADL,
+	GNA_GEN2_FEATURES
+};
+
+static const struct gna_dev_info rpl_dev_info = {
+	.hwid = GNA_DEV_HWID_RPL,
+	GNA_GEN2_FEATURES
+};
+
+static const struct gna_dev_info mtl_dev_info = {
+	.hwid = GNA_DEV_HWID_MTL,
+	GNA_GEN2_FEATURES
+};
+
+#define INTEL_GNA_DEVICE(hwid, info)				\
+	{ PCI_VDEVICE(INTEL, hwid), (kernel_ulong_t)(info) }
+
+static const struct pci_device_id gna_pci_ids[] = {
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_CNL, &cnl_dev_info),
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_EHL, &ehl_dev_info),
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_GLK, &glk_dev_info),
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_ICL, &icl_dev_info),
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_JSL, &jsl_dev_info),
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_TGL, &tgl_dev_info),
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_RKL, &rkl_dev_info),
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_ADL, &adl_dev_info),
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_RPL, &rpl_dev_info),
+	INTEL_GNA_DEVICE(GNA_DEV_HWID_MTL, &mtl_dev_info),
+	{ }
+};
+
 int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
 {
 	struct gna_dev_info *dev_info;
@@ -37,7 +104,10 @@ int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
 
 static struct pci_driver gna_pci_driver = {
 	.name = DRIVER_NAME,
+	.id_table = gna_pci_ids,
 	.probe = gna_pci_probe,
 };
 
 module_pci_driver(gna_pci_driver);
+
+MODULE_DEVICE_TABLE(pci, gna_pci_ids);
-- 
2.25.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

