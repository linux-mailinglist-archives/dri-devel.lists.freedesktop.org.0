Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA819AA06B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 12:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEDF10E657;
	Tue, 22 Oct 2024 10:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJP8It2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CC710E659;
 Tue, 22 Oct 2024 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729594434; x=1761130434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9rCuQRTk4a6xzmX49UTKbs+xn5wHkxCiCCeZOd6g1ak=;
 b=BJP8It2AP6VjFBNlv1+gFyAH1JQyxELAhcyTVHi4d2Od35l5nYZGe9mW
 bi0MSnBa+z1ZNEj50VXCsPVIF3z1U++KGCKJ9F0arTSFFjgRRlzYO2fRj
 wGHpp/jQ9xpfJWAiFQTfUPu/ljNpLE8ERWyUnR8xI8+9H2PH+zbLWvbvP
 GC3C3vY1kT81mFDQWXC6F9+jHSjrn1dChcct7hoZHIWju3D1/8ABNgMyr
 dCBNl90x2OH3ajIYUAf150zvp+o3lNAugwp56nEuDLOVlXNdHO0TYHrtq
 F+lorrbYjos8xunsr6DM5pPu3McFjO5/VHMIOZCitHAKPWcNreRkxAmbb w==;
X-CSE-ConnectionGUID: G8sHiN9xT7y/HprKRw2hfw==
X-CSE-MsgGUID: iyqzYeY9SRuKxXGIBq6r4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39705024"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="39705024"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP; 22 Oct 2024 03:53:46 -0700
X-CSE-ConnectionGUID: cKRitV/xQC+Sx46Knaz+GQ==
X-CSE-MsgGUID: dxeUVgoETHGvRwlV71KVFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79847639"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:53:25 -0700
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
 Tomas Winkler <tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: [PATCH 04/10] mtd: intel-dg: register with mtd
Date: Tue, 22 Oct 2024 13:41:13 +0300
Message-ID: <20241022104119.3149051-5-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022104119.3149051-1-alexander.usyskin@intel.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
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

Register the on-die nvm device with the mtd subsystem.
Refcount nvm object on _get and _put mtd callbacks.
For erase operation address and size should be 4K aligned.
For write operation address and size has to be 4bytes aligned.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Co-developed-by: Vitaly Lubart <lubvital@gmail.com>
Signed-off-by: Vitaly Lubart <lubvital@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd-intel-dg.c | 230 ++++++++++++++++++++++++++++-
 1 file changed, 226 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
index 8d21947bcc23..2efcb4d64ebf 100644
--- a/drivers/mtd/devices/mtd-intel-dg.c
+++ b/drivers/mtd/devices/mtd-intel-dg.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/intel_dg_nvm_aux.h>
@@ -12,6 +13,8 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/sizes.h>
@@ -19,6 +22,8 @@
 
 struct intel_dg_nvm {
 	struct kref refcnt;
+	struct mtd_info mtd;
+	struct mutex lock; /* region access lock */
 	void __iomem *base;
 	size_t size;
 	unsigned int nregions;
@@ -177,7 +182,6 @@ static int idg_nvm_is_valid(struct intel_dg_nvm *nvm)
 	return 0;
 }
 
-__maybe_unused
 static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm, loff_t from)
 {
 	unsigned int i;
@@ -209,7 +213,6 @@ static ssize_t idg_nvm_rewrite_partial(struct intel_dg_nvm *nvm, loff_t to,
 	return len;
 }
 
-__maybe_unused
 static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
 			 loff_t to, size_t len, const unsigned char *buf)
 {
@@ -268,7 +271,6 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
 			loff_t from, size_t len, unsigned char *buf)
 {
@@ -327,7 +329,6 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t
 idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_addr)
 {
@@ -416,6 +417,147 @@ static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
 	return n;
 }
 
+static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
+{
+	struct intel_dg_nvm *nvm = mtd->priv;
+	unsigned int idx;
+	u8 region;
+	u64 addr;
+	ssize_t bytes;
+	loff_t from;
+	size_t len;
+	size_t total_len;
+
+	if (WARN_ON(!nvm))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(info->addr, SZ_4K) || !IS_ALIGNED(info->len, SZ_4K)) {
+		dev_err(&mtd->dev, "unaligned erase %llx %llx\n",
+			info->addr, info->len);
+		info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+		return -EINVAL;
+	}
+
+	total_len = info->len;
+	addr = info->addr;
+
+	guard(mutex)(&nvm->lock);
+
+	while (total_len > 0) {
+		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
+			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
+			info->fail_addr = addr;
+			return -ERANGE;
+		}
+
+		idx = idg_nvm_get_region(nvm, addr);
+		if (idx >= nvm->nregions) {
+			dev_err(&mtd->dev, "out of range");
+			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+			return -ERANGE;
+		}
+
+		from = addr - nvm->regions[idx].offset;
+		region = nvm->regions[idx].id;
+		len = total_len;
+		if (len > nvm->regions[idx].size - from)
+			len = nvm->regions[idx].size - from;
+
+		dev_dbg(&mtd->dev, "erasing region[%d] %s from %llx len %zx\n",
+			region, nvm->regions[idx].name, from, len);
+
+		bytes = idg_erase(nvm, region, from, len, &info->fail_addr);
+		if (bytes < 0) {
+			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
+			info->fail_addr += nvm->regions[idx].offset;
+			return bytes;
+		}
+
+		addr += len;
+		total_len -= len;
+	}
+
+	return 0;
+}
+
+static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
+			     size_t *retlen, u_char *buf)
+{
+	struct intel_dg_nvm *nvm = mtd->priv;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (WARN_ON(!nvm))
+		return -EINVAL;
+
+	idx = idg_nvm_get_region(nvm, from);
+
+	dev_dbg(&mtd->dev, "reading region[%d] %s from %lld len %zd\n",
+		nvm->regions[idx].id, nvm->regions[idx].name, from, len);
+
+	if (idx >= nvm->nregions) {
+		dev_err(&mtd->dev, "out of ragnge");
+		return -ERANGE;
+	}
+
+	from -= nvm->regions[idx].offset;
+	region = nvm->regions[idx].id;
+	if (len > nvm->regions[idx].size - from)
+		len = nvm->regions[idx].size - from;
+
+	guard(mutex)(&nvm->lock);
+
+	ret = idg_read(nvm, region, from, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
+		return ret;
+	}
+
+	*retlen = ret;
+
+	return 0;
+}
+
+static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
+			      size_t *retlen, const u_char *buf)
+{
+	struct intel_dg_nvm *nvm = mtd->priv;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (WARN_ON(!nvm))
+		return -EINVAL;
+
+	idx = idg_nvm_get_region(nvm, to);
+
+	dev_dbg(&mtd->dev, "writing region[%d] %s to %lld len %zd\n",
+		nvm->regions[idx].id, nvm->regions[idx].name, to, len);
+
+	if (idx >= nvm->nregions) {
+		dev_err(&mtd->dev, "out of range");
+		return -ERANGE;
+	}
+
+	to -= nvm->regions[idx].offset;
+	region = nvm->regions[idx].id;
+	if (len > nvm->regions[idx].size - to)
+		len = nvm->regions[idx].size - to;
+
+	guard(mutex)(&nvm->lock);
+
+	ret = idg_write(nvm, region, to, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
+		return ret;
+	}
+
+	*retlen = ret;
+
+	return 0;
+}
+
 static void intel_dg_nvm_release(struct kref *kref)
 {
 	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm, refcnt);
@@ -424,9 +566,80 @@ static void intel_dg_nvm_release(struct kref *kref)
 	pr_debug("freeing intel_dg nvm\n");
 	for (i = 0; i < nvm->nregions; i++)
 		kfree(nvm->regions[i].name);
+	mutex_destroy(&nvm->lock);
 	kfree(nvm);
 }
 
+static int intel_dg_mtd_get_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct intel_dg_nvm *nvm = master->priv;
+
+	if (WARN_ON(!nvm))
+		return -EINVAL;
+	pr_debug("get mtd %s %d\n", mtd->name, kref_read(&nvm->refcnt));
+	kref_get(&nvm->refcnt);
+
+	return 0;
+}
+
+static void intel_dg_mtd_put_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct intel_dg_nvm *nvm = master->priv;
+
+	if (WARN_ON(!nvm))
+		return;
+	pr_debug("put mtd %s %d\n", mtd->name, kref_read(&nvm->refcnt));
+	kref_put(&nvm->refcnt, intel_dg_nvm_release);
+}
+
+static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device *device,
+				 unsigned int nparts, bool writeable_override)
+{
+	unsigned int i;
+	unsigned int n;
+	struct mtd_partition *parts = NULL;
+	int ret;
+
+	dev_dbg(device, "registering with mtd\n");
+
+	nvm->mtd.owner = THIS_MODULE;
+	nvm->mtd.dev.parent = device;
+	nvm->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;
+	nvm->mtd.type = MTD_DATAFLASH;
+	nvm->mtd.priv = nvm;
+	nvm->mtd._write = intel_dg_mtd_write;
+	nvm->mtd._read = intel_dg_mtd_read;
+	nvm->mtd._erase = intel_dg_mtd_erase;
+	nvm->mtd._get_device = intel_dg_mtd_get_device;
+	nvm->mtd._put_device = intel_dg_mtd_put_device;
+	nvm->mtd.writesize = SZ_1; /* 1 byte granularity */
+	nvm->mtd.erasesize = SZ_4K; /* 4K bytes granularity */
+	nvm->mtd.size = nvm->size;
+
+	parts = kcalloc(nvm->nregions, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+
+	for (i = 0, n = 0; i < nvm->nregions && n < nparts; i++) {
+		if (!nvm->regions[i].is_readable)
+			continue;
+		parts[n].name = nvm->regions[i].name;
+		parts[n].offset  = nvm->regions[i].offset;
+		parts[n].size = nvm->regions[i].size;
+		if (!nvm->regions[i].is_writable && !writeable_override)
+			parts[n].mask_flags = MTD_WRITEABLE;
+		n++;
+	}
+
+	ret = mtd_device_register(&nvm->mtd, parts, n);
+
+	kfree(parts);
+
+	return ret;
+}
+
 static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 			      const struct auxiliary_device_id *aux_dev_id)
 {
@@ -458,6 +671,7 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 		return -ENOMEM;
 
 	kref_init(&nvm->refcnt);
+	mutex_init(&nvm->lock);
 
 	nvm->nregions = nregions;
 	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
@@ -487,6 +701,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 		goto err;
 	}
 
+	ret = intel_dg_nvm_init_mtd(nvm, device, ret, invm->writeable_override);
+	if (ret) {
+		dev_err(device, "failed init mtd %d\n", ret);
+		goto err;
+	}
+
 	dev_set_drvdata(&aux_dev->dev, nvm);
 
 	return 0;
@@ -503,6 +723,8 @@ static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
 	if (!nvm)
 		return;
 
+	mtd_device_unregister(&nvm->mtd);
+
 	dev_set_drvdata(&aux_dev->dev, NULL);
 
 	kref_put(&nvm->refcnt, intel_dg_nvm_release);
-- 
2.43.0

