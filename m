Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A139D27B8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 15:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC5B10E652;
	Tue, 19 Nov 2024 14:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpMjqTgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2B910E652;
 Tue, 19 Nov 2024 14:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732025574; x=1763561574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wj5qmSpM8l2ReipvikaBwACdOQ+9/2e+2DQCP2RTPik=;
 b=JpMjqTgOSiDDmiMej1HyGZg0b0QYaHHNZ01VHRN7sXBwVMG2alny+5ly
 FquCWA0sakG6fD0H5YXcwnSz3wtU0wG0OAIWfQN24SuWffpkCPsHc1sXT
 74e6bTyJZFuntFjC3jOE5VPtX8U0H9M/nRZS65+zPWS6zjfUzaMuWh8e+
 R7Md4660gHGhFvEXYn6MgfVmedGIBssRjNkER4thoyuWuMsqo/TcT4coy
 ywSmZEKiuMZ6j8tXFcvefT5NZTe2mYlVKltk/6G7arsk3ruxCVdHR6hfS
 BumTQvnooiyy2/ijGQ7P8/Al23XNGGLbbfqZ7e0QzidBJNJO6hXMPd5Qm w==;
X-CSE-ConnectionGUID: yWNc0gjFT3GMRzHCKHHCEA==
X-CSE-MsgGUID: nuQQ3LhZQKqGU0hA/GD19A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="54526718"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="54526718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 06:12:53 -0800
X-CSE-ConnectionGUID: RpAXFFlYSJuON14PuazWhA==
X-CSE-MsgGUID: S3ODbSe9RU64qjmGJ0iOrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94398564"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 06:12:47 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Tomas Winkler <tomasw@gmail.com>
Subject: [PATCH v3 02/10] mtd: intel-dg: implement region enumeration
Date: Tue, 19 Nov 2024 16:01:04 +0200
Message-ID: <20241119140112.790720-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119140112.790720-1-alexander.usyskin@intel.com>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In intel-dg, there is no access to the spi controller,
the information is extracted from the descriptor region.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd-intel-dg.c | 199 +++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
index 746c963ea540..05e333771be0 100644
--- a/drivers/mtd/devices/mtd-intel-dg.c
+++ b/drivers/mtd/devices/mtd-intel-dg.c
@@ -3,6 +3,8 @@
  * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/io.h>
@@ -22,9 +24,199 @@ struct intel_dg_nvm {
 		u8 id;
 		u64 offset;
 		u64 size;
+		unsigned int is_readable:1;
+		unsigned int is_writable:1;
 	} regions[];
 };
 
+#define NVM_TRIGGER_REG       0x00000000
+#define NVM_VALSIG_REG        0x00000010
+#define NVM_ADDRESS_REG       0x00000040
+#define NVM_REGION_ID_REG     0x00000044
+/*
+ * [15:0]-Erase size = 0x0010 4K 0x0080 32K 0x0100 64K
+ * [23:16]-Reserved
+ * [31:24]-Erase MEM RegionID
+ */
+#define NVM_ERASE_REG         0x00000048
+#define NVM_ACCESS_ERROR_REG  0x00000070
+#define NVM_ADDRESS_ERROR_REG 0x00000074
+
+/* Flash Valid Signature */
+#define NVM_FLVALSIG          0x0FF0A55A
+
+#define NVM_MAP_ADDR_MASK     GENMASK(7, 0)
+#define NVM_MAP_ADDR_SHIFT    0x00000004
+
+#define NVM_REGION_ID_DESCRIPTOR  0
+/* Flash Region Base Address */
+#define NVM_FRBA      0x40
+/* Flash Region __n - Flash Descriptor Record */
+#define NVM_FLREG(__n) (NVM_FRBA + ((__n) * 4))
+/*  Flash Map 1 Register */
+#define NVM_FLMAP1_REG  0x18
+#define NVM_FLMSTR4_OFFSET 0x00C
+
+#define NVM_ACCESS_ERROR_PCIE_MASK 0x7
+
+#define NVM_FREG_BASE_MASK GENMASK(15, 0)
+#define NVM_FREG_ADDR_MASK GENMASK(31, 16)
+#define NVM_FREG_ADDR_SHIFT 12
+#define NVM_FREG_MIN_REGION_SIZE 0xFFF
+
+static inline void idg_nvm_set_region_id(struct intel_dg_nvm *nvm, u8 region)
+{
+	iowrite32((u32)region, nvm->base + NVM_REGION_ID_REG);
+}
+
+static inline u32 idg_nvm_error(struct intel_dg_nvm *nvm)
+{
+	void __iomem *base = nvm->base;
+
+	u32 reg = ioread32(base + NVM_ACCESS_ERROR_REG) & NVM_ACCESS_ERROR_PCIE_MASK;
+
+	/* reset error bits */
+	if (reg)
+		iowrite32(reg, base + NVM_ACCESS_ERROR_REG);
+
+	return reg;
+}
+
+static inline u32 idg_nvm_read32(struct intel_dg_nvm *nvm, u32 address)
+{
+	void __iomem *base = nvm->base;
+
+	iowrite32(address, base + NVM_ADDRESS_REG);
+
+	return ioread32(base + NVM_TRIGGER_REG);
+}
+
+static int idg_nvm_get_access_map(struct intel_dg_nvm *nvm, u32 *access_map)
+{
+	u32 flmap1;
+	u32 fmba;
+	u32 fmstr4;
+	u32 fmstr4_addr;
+
+	idg_nvm_set_region_id(nvm, NVM_REGION_ID_DESCRIPTOR);
+
+	flmap1 = idg_nvm_read32(nvm, NVM_FLMAP1_REG);
+	if (idg_nvm_error(nvm))
+		return -EIO;
+	/* Get Flash Master Baser Address (FMBA) */
+	fmba = (FIELD_GET(NVM_MAP_ADDR_MASK, flmap1) << NVM_MAP_ADDR_SHIFT);
+	fmstr4_addr = fmba + NVM_FLMSTR4_OFFSET;
+
+	fmstr4 = idg_nvm_read32(nvm, fmstr4_addr);
+	if (idg_nvm_error(nvm))
+		return -EIO;
+
+	*access_map = fmstr4;
+	return 0;
+}
+
+static bool idg_nvm_region_readable(u32 access_map, u8 region)
+{
+	if (region < 12)
+		return access_map & BIT(region + 8); /* [19:8] */
+	else
+		return access_map & BIT(region - 12); /* [3:0] */
+}
+
+static bool idg_nvm_region_writeable(u32 access_map, u8 region)
+{
+	if (region < 12)
+		return access_map & BIT(region + 20); /* [31:20] */
+	else
+		return access_map & BIT(region - 8); /* [7:4] */
+}
+
+static int idg_nvm_is_valid(struct intel_dg_nvm *nvm)
+{
+	u32 is_valid;
+
+	idg_nvm_set_region_id(nvm, NVM_REGION_ID_DESCRIPTOR);
+
+	is_valid = idg_nvm_read32(nvm, NVM_VALSIG_REG);
+	if (idg_nvm_error(nvm))
+		return -EIO;
+
+	if (is_valid != NVM_FLVALSIG)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
+{
+	int ret;
+	unsigned int i, n;
+	u32 access_map = 0;
+
+	/* clean error register, previous errors are ignored */
+	idg_nvm_error(nvm);
+
+	ret = idg_nvm_is_valid(nvm);
+	if (ret) {
+		dev_err(device, "The MEM is not valid %d\n", ret);
+		return ret;
+	}
+
+	if (idg_nvm_get_access_map(nvm, &access_map))
+		return -EIO;
+
+	for (i = 0, n = 0; i < nvm->nregions; i++) {
+		u32 address, base, limit, region;
+		u8 id = nvm->regions[i].id;
+
+		address = NVM_FLREG(id);
+		region = idg_nvm_read32(nvm, address);
+
+		base = FIELD_GET(NVM_FREG_BASE_MASK, region) << NVM_FREG_ADDR_SHIFT;
+		limit = (FIELD_GET(NVM_FREG_ADDR_MASK, region) << NVM_FREG_ADDR_SHIFT) |
+			NVM_FREG_MIN_REGION_SIZE;
+
+		dev_dbg(device, "[%d] %s: region: 0x%08X base: 0x%08x limit: 0x%08x\n",
+			id, nvm->regions[i].name, region, base, limit);
+
+		if (base >= limit || (i > 0 && limit == 0)) {
+			dev_dbg(device, "[%d] %s: disabled\n",
+				id, nvm->regions[i].name);
+			nvm->regions[i].is_readable = 0;
+			continue;
+		}
+
+		if (nvm->size < limit)
+			nvm->size = limit;
+
+		nvm->regions[i].offset = base;
+		nvm->regions[i].size = limit - base + 1;
+		/* No write access to descriptor; mask it out*/
+		nvm->regions[i].is_writable = idg_nvm_region_writeable(access_map, id);
+
+		nvm->regions[i].is_readable = idg_nvm_region_readable(access_map, id);
+		dev_dbg(device, "Registered, %s id=%d offset=%lld size=%lld rd=%d wr=%d\n",
+			nvm->regions[i].name,
+			nvm->regions[i].id,
+			nvm->regions[i].offset,
+			nvm->regions[i].size,
+			nvm->regions[i].is_readable,
+			nvm->regions[i].is_writable);
+
+		if (nvm->regions[i].is_readable)
+			n++;
+	}
+
+	dev_dbg(device, "Registered %d regions\n", n);
+
+	/* Need to add 1 to the amount of memory
+	 * so it is reported as an even block
+	 */
+	nvm->size += 1;
+
+	return n;
+}
+
 static void intel_dg_nvm_release(struct kref *kref)
 {
 	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm, refcnt);
@@ -89,6 +281,13 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 		goto err;
 	}
 
+	ret = intel_dg_nvm_init(nvm, device);
+	if (ret < 0) {
+		dev_err(device, "cannot initialize nvm\n");
+		ret = -ENODEV;
+		goto err;
+	}
+
 	dev_set_drvdata(&aux_dev->dev, nvm);
 
 	return 0;
-- 
2.43.0

