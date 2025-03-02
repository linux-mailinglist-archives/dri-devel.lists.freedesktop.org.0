Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E69A4B21B
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 15:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA2E10E22E;
	Sun,  2 Mar 2025 14:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPhUEuoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D2510E2C5;
 Sun,  2 Mar 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740925259; x=1772461259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lVtZQbsxfX/iqDLELTpbrgDvP7eZNLkxpNu2nwCF3LE=;
 b=mPhUEuoeMIOWgX8PF9t2XudSTRzxS1rSSTT9FXPDr7d8C7eFMncE2AtZ
 OZ9neIsqXyGAQhw9FXWnL7w7vkgyeTGk8eK8h3J2NFvnqdnOfpCjUIsKs
 jPzD+1rsEx67c6876bZtM6ShNJ9s+ck8fIfB/v3mnXhQFwbI4tBJxgTpb
 ef6QKnUl1QhA6pfr9w0RnzZU98OHO0iFa7iOV2WeLXK0V5d8H23nAoeIW
 A4ZbB29SAJLOxTLz2iCZisnaUzoajAWlmC8/cDPp1oe74yTZqUbx7sZde
 VVxPwObmGlEoLUX9kcas+oa7r/fD/X7SKahE+VuV7fGeqi3xFmxP+4rfa w==;
X-CSE-ConnectionGUID: 1NXReUvETre9LiRiVKIVuQ==
X-CSE-MsgGUID: rHXFL2OZRm2/e4tDx0iXZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="67176410"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; d="scan'208";a="67176410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 06:20:59 -0800
X-CSE-ConnectionGUID: RShP9ZzfSV6ZlBGczJQ8ow==
X-CSE-MsgGUID: 0B16smd+Qd+5m4HKfdT5jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; d="scan'208";a="122737322"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 06:20:52 -0800
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
 Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Tomas Winkler <tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: [PATCH v6 04/11] mtd: intel-dg: implement access functions
Date: Sun,  2 Mar 2025 16:09:14 +0200
Message-ID: <20250302140921.504304-5-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302140921.504304-1-alexander.usyskin@intel.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
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

Implement read(), erase() and write() functions.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Co-developed-by: Vitaly Lubart <lubvital@gmail.com>
Signed-off-by: Vitaly Lubart <lubvital@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 197 +++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index ba1c720e717b..6f67cf966d05 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -5,13 +5,16 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/io.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 struct intel_dg_nvm {
@@ -91,6 +94,33 @@ static inline u32 idg_nvm_read32(struct intel_dg_nvm *nvm, u32 address)
 	return ioread32(base + NVM_TRIGGER_REG);
 }
 
+static inline u64 idg_nvm_read64(struct intel_dg_nvm *nvm, u32 address)
+{
+	void __iomem *base = nvm->base;
+
+	iowrite32(address, base + NVM_ADDRESS_REG);
+
+	return readq(base + NVM_TRIGGER_REG);
+}
+
+static void idg_nvm_write32(struct intel_dg_nvm *nvm, u32 address, u32 data)
+{
+	void __iomem *base = nvm->base;
+
+	iowrite32(address, base + NVM_ADDRESS_REG);
+
+	iowrite32(data, base + NVM_TRIGGER_REG);
+}
+
+static void idg_nvm_write64(struct intel_dg_nvm *nvm, u32 address, u64 data)
+{
+	void __iomem *base = nvm->base;
+
+	iowrite32(address, base + NVM_ADDRESS_REG);
+
+	writeq(data, base + NVM_TRIGGER_REG);
+}
+
 static int idg_nvm_get_access_map(struct intel_dg_nvm *nvm, u32 *access_map)
 {
 	u32 flmap1;
@@ -147,6 +177,173 @@ static int idg_nvm_is_valid(struct intel_dg_nvm *nvm)
 	return 0;
 }
 
+__maybe_unused
+static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm, loff_t from)
+{
+	unsigned int i;
+
+	for (i = 0; i < nvm->nregions; i++) {
+		if ((nvm->regions[i].offset + nvm->regions[i].size - 1) > from &&
+		    nvm->regions[i].offset <= from &&
+		    nvm->regions[i].size != 0)
+			break;
+	}
+
+	return i;
+}
+
+static ssize_t idg_nvm_rewrite_partial(struct intel_dg_nvm *nvm, loff_t to,
+				       loff_t offset, size_t len, const u32 *newdata)
+{
+	u32 data = idg_nvm_read32(nvm, to);
+
+	if (idg_nvm_error(nvm))
+		return -EIO;
+
+	memcpy((u8 *)&data + offset, newdata, len);
+
+	idg_nvm_write32(nvm, to, data);
+	if (idg_nvm_error(nvm))
+		return -EIO;
+
+	return len;
+}
+
+__maybe_unused
+static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
+			 loff_t to, size_t len, const unsigned char *buf)
+{
+	size_t i;
+	size_t len8;
+	size_t len4;
+	size_t to4;
+	size_t to_shift;
+	size_t len_s = len;
+	ssize_t ret;
+
+	idg_nvm_set_region_id(nvm, region);
+
+	to4 = ALIGN_DOWN(to, sizeof(u32));
+	to_shift = min(sizeof(u32) - ((size_t)to - to4), len);
+	if (to - to4) {
+		ret = idg_nvm_rewrite_partial(nvm, to4, to - to4, to_shift, (uint32_t *)&buf[0]);
+		if (ret < 0)
+			return ret;
+
+		buf += to_shift;
+		to += to_shift;
+		len_s -= to_shift;
+	}
+
+	len8 = ALIGN_DOWN(len_s, sizeof(u64));
+	for (i = 0; i < len8; i += sizeof(u64)) {
+		u64 data;
+
+		memcpy(&data, &buf[i], sizeof(u64));
+		idg_nvm_write64(nvm, to + i, data);
+		if (idg_nvm_error(nvm))
+			return -EIO;
+	}
+
+	len4 = len_s - len8;
+	if (len4 >= sizeof(u32)) {
+		u32 data;
+
+		memcpy(&data, &buf[i], sizeof(u32));
+		idg_nvm_write32(nvm, to + i, data);
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		i += sizeof(u32);
+		len4 -= sizeof(u32);
+	}
+
+	if (len4 > 0) {
+		ret = idg_nvm_rewrite_partial(nvm, to + i, 0, len4, (uint32_t *)&buf[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return len;
+}
+
+__maybe_unused
+static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
+			loff_t from, size_t len, unsigned char *buf)
+{
+	size_t i;
+	size_t len8;
+	size_t len4;
+	size_t from4;
+	size_t from_shift;
+	size_t len_s = len;
+
+	idg_nvm_set_region_id(nvm, region);
+
+	from4 = ALIGN_DOWN(from, sizeof(u32));
+	from_shift = min(sizeof(u32) - ((size_t)from - from4), len);
+
+	if (from - from4) {
+		u32 data = idg_nvm_read32(nvm, from4);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		memcpy(&buf[0], (u8 *)&data + (from - from4), from_shift);
+		len_s -= from_shift;
+		buf += from_shift;
+		from += from_shift;
+	}
+
+	len8 = ALIGN_DOWN(len_s, sizeof(u64));
+	for (i = 0; i < len8; i += sizeof(u64)) {
+		u64 data = idg_nvm_read64(nvm, from + i);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+
+		memcpy(&buf[i], &data, sizeof(data));
+	}
+
+	len4 = len_s - len8;
+	if (len4 >= sizeof(u32)) {
+		u32 data = idg_nvm_read32(nvm, from + i);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		memcpy(&buf[i], &data, sizeof(data));
+		i += sizeof(u32);
+		len4 -= sizeof(u32);
+	}
+
+	if (len4 > 0) {
+		u32 data = idg_nvm_read32(nvm, from + i);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		memcpy(&buf[i], &data, len4);
+	}
+
+	return len;
+}
+
+__maybe_unused
+static ssize_t
+idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_addr)
+{
+	u64 i;
+	const u32 block = 0x10;
+	void __iomem *base = nvm->base;
+
+	for (i = 0; i < len; i += SZ_4K) {
+		iowrite32(from + i, base + NVM_ADDRESS_REG);
+		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
+		/* Since the writes are via sguint
+		 * we cannot do back to back erases.
+		 */
+		msleep(50);
+	}
+	return len;
+}
+
 static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
 {
 	int ret;
-- 
2.43.0

