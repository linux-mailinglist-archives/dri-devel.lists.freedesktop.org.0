Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F9BAC6B42
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E878810E60F;
	Wed, 28 May 2025 14:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQp8+eqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60C110E61A;
 Wed, 28 May 2025 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748441127; x=1779977127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WvLWJRAv8idelb+wbiysTqm+mBTnrzkj5Bl282lOSrk=;
 b=bQp8+eqjJ2tqU30CUoSQSPj6dBieLM23n4FAazuJsdQSbcs0VSDEJhxg
 YdpStP17REWemnR+WI2xAeV95t8/wgmqMCTESg9dakwyBg1PH4Oc2snZ/
 01ePSNWbjui0Kavb9RG58SgKKIlBhtqReqnnTtJV2jQ08kB+FFUUMqI3t
 EWFe39EFmbITIuyTdlTgIbdXSsrj8y5dz1SpUsWkSJZ6+BecGU6pATvml
 zVdc5jbYS8XFriv33AvYLx7BrQUK83DwLK4X3KqW0cktanuxBQ3XWv6NJ
 gzsmD+c2O1nUOZmNh4EB3KUKyQeDbfy5XR4kaQZUJVHfe3AsCM1849EAO Q==;
X-CSE-ConnectionGUID: a2NrXJkzTNuP/iDxGaOBNA==
X-CSE-MsgGUID: si4rYkJ/Sgqys0SPPmgl5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61524987"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61524987"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:05:26 -0700
X-CSE-ConnectionGUID: mqiy/PgSQOuSrS6yxPJxXA==
X-CSE-MsgGUID: GMTYIw/dS46Yu4F4VHCfVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143238927"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:05:20 -0700
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
 Tomas Winkler <tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: [PATCH v11 03/10] mtd: intel-dg: implement access functions
Date: Wed, 28 May 2025 16:51:08 +0300
Message-ID: <20250528135115.2512429-4-alexander.usyskin@intel.com>
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

Implement read(), erase() and write() functions.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
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
index 478dd2b158e3..4d6e2c009b45 100644
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
 	u32 fmstr4_addr;
@@ -155,6 +185,173 @@ static int idg_nvm_is_valid(struct intel_dg_nvm *nvm)
 	return 0;
 }
 
+__maybe_unused
+static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm, loff_t from)
+{
+	unsigned int i;
+
+	for (i = 0; i < nvm->nregions; i++) {
+		if ((nvm->regions[i].offset + nvm->regions[i].size - 1) >= from &&
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
+	size_t len_s = len;
+	size_t to_shift;
+	size_t len8;
+	size_t len4;
+	ssize_t ret;
+	size_t to4;
+	size_t i;
+
+	idg_nvm_set_region_id(nvm, region);
+
+	to4 = ALIGN_DOWN(to, sizeof(u32));
+	to_shift = min(sizeof(u32) - ((size_t)to - to4), len);
+	if (to - to4) {
+		ret = idg_nvm_rewrite_partial(nvm, to4, to - to4, to_shift, (u32 *)&buf[0]);
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
+		ret = idg_nvm_rewrite_partial(nvm, to + i, 0, len4, (u32 *)&buf[i]);
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
+	size_t len_s = len;
+	size_t from_shift;
+	size_t from4;
+	size_t len8;
+	size_t len4;
+	size_t i;
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
+	void __iomem *base = nvm->base;
+	const u32 block = 0x10;
+	u64 i;
+
+	for (i = 0; i < len; i += SZ_4K) {
+		iowrite32(from + i, base + NVM_ADDRESS_REG);
+		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
+		/* Since the writes are via sgunit
+		 * we cannot do back to back erases.
+		 */
+		msleep(50);
+	}
+	return len;
+}
+
 static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
 {
 	u32 access_map = 0;
-- 
2.43.0

