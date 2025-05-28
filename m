Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3166FAC6B3C
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F10510E611;
	Wed, 28 May 2025 14:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdzhH9HS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB69510E611;
 Wed, 28 May 2025 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748441121; x=1779977121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xuOsmuG5r7vSiKxfwOymLvRfT9zBWtOZCDj+znIt+wE=;
 b=GdzhH9HSj0F7uodEAQLAx1A8tWmD4eUdnP5vD29gboTN0SwVi4Jtiwma
 HWzVUcU69Wd/CcLFVUt37eLXMenH8zjOIz9G6zW5SCiuIc9alNE3C46zC
 eo41qrooU/KM5wyb/1MouUymBWChrcRLruO9TzrRM3uA3NJE+vbobspJr
 SnypQPLFsUbG2KlWvNMp1gGQMN6lN61pZ2CLoYT2dYua0vYtoHgspuXqw
 jnDCR7gP9TGeBIgUJ3baCx8231tHaHwJ3SiQV0HgmUUb0QaiHtVmrwyhl
 m5q3J+W37b9HF8VFN6cl7tM95NLNC3y7tVDKY2CSXzqJ0Yqttx6OT51DK Q==;
X-CSE-ConnectionGUID: q5uuSJqMRfe71AUOChnqnw==
X-CSE-MsgGUID: jH4OIF9BSMW/asmW0iV3IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61524908"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61524908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:05:20 -0700
X-CSE-ConnectionGUID: XS25QKXrSRS+RPwKIQ46LA==
X-CSE-MsgGUID: 41Gy93DqTXS9GgI93xC79A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143238888"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:05:14 -0700
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
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Tomas Winkler <tomasw@gmail.com>
Subject: [PATCH v11 02/10] mtd: intel-dg: implement region enumeration
Date: Wed, 28 May 2025 16:51:07 +0300
Message-ID: <20250528135115.2512429-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528135115.2512429-1-alexander.usyskin@intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
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

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 206 +++++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index c2d0dbfb0378..478dd2b158e3 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -3,6 +3,8 @@
  * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/io.h>
@@ -22,9 +24,207 @@ struct intel_dg_nvm {
 		u8 id;
 		u64 offset;
 		u64 size;
+		unsigned int is_readable:1;
+		unsigned int is_writable:1;
 	} regions[] __counted_by(nregions);
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
+	u32 fmstr4_addr;
+	u32 fmstr4;
+	u32 flmap1;
+	u32 fmba;
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
+/*
+ * Region read/write access encoded in the access map
+ * in the following order from the lower bit:
+ * [3:0] regions 12-15 read state
+ * [7:4] regions 12-15 write state
+ * [19:8] regions 0-11 read state
+ * [31:20] regions 0-11 write state
+ */
+static bool idg_nvm_region_readable(u32 access_map, u8 region)
+{
+	if (region < 12)
+		return access_map & BIT(region + 8); /* [19:8] */
+	else
+		return access_map & BIT(region - 12); /* [3:0] */
+}
+
+static bool idg_nvm_region_writable(u32 access_map, u8 region)
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
+	u32 access_map = 0;
+	unsigned int i, n;
+	int ret;
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
+		nvm->regions[i].is_writable = idg_nvm_region_writable(access_map, id);
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
@@ -85,6 +285,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 		goto err;
 	}
 
+	ret = intel_dg_nvm_init(nvm, device);
+	if (ret < 0) {
+		dev_err(device, "cannot initialize nvm %d\n", ret);
+		goto err;
+	}
+
 	dev_set_drvdata(&aux_dev->dev, nvm);
 
 	return 0;
-- 
2.43.0

