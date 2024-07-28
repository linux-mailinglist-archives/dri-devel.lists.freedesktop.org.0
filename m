Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F993E567
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 15:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA8E10E1A6;
	Sun, 28 Jul 2024 13:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JG+xaa7U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24D310E19F;
 Sun, 28 Jul 2024 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722172527; x=1753708527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gN5slz9StV0ARNaF+GeyJLWw/kU6KYETQewkwfxR/tM=;
 b=JG+xaa7Uu7voNDS0V5Z09kqs4cf37IYxi1BeXtAMt39OHIwWRf1KIAN4
 yw47T8ktLjIRwqe6xXevuSlx31DUwh/PHMo/rb8dDpvb4nyi8sknSy9I0
 7A8QSHs57x4b4bVMEVynqnNfaYuh2nxCaBLI5mjyrED8rc3Mn6bFAJTOb
 K7j32VWN4z4CQA5y4NeqXFI80h0EGgh2VLqg/TFXQK5Z9iPM5TPBNrAaT
 5Q/Ajca+aZ4vqSj/zfJ3KG17V3tz3+gwD5Fik4q3sLbXWswESS2cgGbG3
 kLHDxT0d/MBjzBL9Nfuu/+8hSY0lq1JyV52PDOffhsDzcyaBrDAtOlUx+ w==;
X-CSE-ConnectionGUID: Sv9kiRenTOay/7vg5CTDxA==
X-CSE-MsgGUID: HydgAi4yQo+BadKB1rlOmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23713423"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; d="scan'208";a="23713423"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2024 06:15:26 -0700
X-CSE-ConnectionGUID: DJ/JpkuSTyyeCBkM+Z/r/A==
X-CSE-MsgGUID: QkFa2oJtS5mzRO3UlzgsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; d="scan'208";a="53389197"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2024 06:15:21 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Mark Brown <broonie@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 04/12] spi: intel-dg: spi register with mtd
Date: Sun, 28 Jul 2024 16:06:30 +0300
Message-Id: <20240728130638.1930463-5-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728130638.1930463-1-alexander.usyskin@intel.com>
References: <20240728130638.1930463-1-alexander.usyskin@intel.com>
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

From: Tomas Winkler <tomas.winkler@intel.com>

Register the on-die spi device with the mtd subsystem.
Refcount spi object on _get and _put mtd callbacks.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/spi/spi-intel-dg.c | 111 +++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/spi/spi-intel-dg.c b/drivers/spi/spi-intel-dg.c
index 863898c8739c..a936014f1a76 100644
--- a/drivers/spi/spi-intel-dg.c
+++ b/drivers/spi/spi-intel-dg.c
@@ -10,6 +10,8 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/sizes.h>
@@ -17,6 +19,8 @@
 
 struct intel_dg_spi {
 	struct kref refcnt;
+	struct mtd_info mtd;
+	struct mutex lock; /* region access lock */
 	void __iomem *base;
 	size_t size;
 	unsigned int nregions;
@@ -407,6 +411,23 @@ static int intel_dg_spi_init(struct intel_dg_spi *spi, struct device *device)
 	return n;
 }
 
+static int intel_dg_spi_erase(struct mtd_info *mtd, struct erase_info *info)
+{
+	return 0;
+}
+
+static int intel_dg_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
+			     size_t *retlen, u_char *buf)
+{
+	return 0;
+}
+
+static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
+			      size_t *retlen, const u_char *buf)
+{
+	return 0;
+}
+
 static void intel_dg_spi_release(struct kref *kref)
 {
 	struct intel_dg_spi *spi = container_of(kref, struct intel_dg_spi, refcnt);
@@ -415,9 +436,90 @@ static void intel_dg_spi_release(struct kref *kref)
 	pr_debug("freeing spi memory\n");
 	for (i = 0; i < spi->nregions; i++)
 		kfree(spi->regions[i].name);
+	mutex_destroy(&spi->lock);
 	kfree(spi);
 }
 
+static int intel_dg_spi_get_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master;
+	struct intel_dg_spi *spi;
+
+	if (!mtd)
+		return -ENODEV;
+
+	master = mtd_get_master(mtd);
+	spi = master->priv;
+	if (WARN_ON(!spi))
+		return -EINVAL;
+	pr_debug("get spi %s %d\n", mtd->name, kref_read(&spi->refcnt));
+	kref_get(&spi->refcnt);
+
+	return 0;
+}
+
+static void intel_dg_spi_put_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master;
+	struct intel_dg_spi *spi;
+
+	if (!mtd)
+		return;
+
+	master = mtd_get_master(mtd);
+	spi = master->priv;
+	if (WARN_ON(!spi))
+		return;
+	pr_debug("put spi %s %d\n", mtd->name, kref_read(&spi->refcnt));
+	kref_put(&spi->refcnt, intel_dg_spi_release);
+}
+
+static int intel_dg_spi_init_mtd(struct intel_dg_spi *spi, struct device *device,
+				 unsigned int nparts, bool writeable_override)
+{
+	unsigned int i;
+	unsigned int n;
+	struct mtd_partition *parts = NULL;
+	int ret;
+
+	dev_dbg(device, "registering with mtd\n");
+
+	spi->mtd.owner = THIS_MODULE;
+	spi->mtd.dev.parent = device;
+	spi->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;
+	spi->mtd.type = MTD_DATAFLASH;
+	spi->mtd.priv = spi;
+	spi->mtd._write = intel_dg_spi_write;
+	spi->mtd._read = intel_dg_spi_read;
+	spi->mtd._erase = intel_dg_spi_erase;
+	spi->mtd._get_device = intel_dg_spi_get_device;
+	spi->mtd._put_device = intel_dg_spi_put_device;
+	spi->mtd.writesize = SZ_1; /* 1 byte granularity */
+	spi->mtd.erasesize = SZ_4K; /* 4K bytes granularity */
+	spi->mtd.size = spi->size;
+
+	parts = kcalloc(spi->nregions, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+
+	for (i = 0, n = 0; i < spi->nregions && n < nparts; i++) {
+		if (!spi->regions[i].is_readable)
+			continue;
+		parts[n].name = spi->regions[i].name;
+		parts[n].offset  = spi->regions[i].offset;
+		parts[n].size = spi->regions[i].size;
+		if (!spi->regions[i].is_writable && !writeable_override)
+			parts[n].mask_flags = MTD_WRITEABLE;
+		n++;
+	}
+
+	ret = mtd_device_register(&spi->mtd, parts, n);
+
+	kfree(parts);
+
+	return ret;
+}
+
 static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
 			      const struct auxiliary_device_id *aux_dev_id)
 {
@@ -449,6 +551,7 @@ static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
 	if (!spi)
 		return -ENOMEM;
 
+	mutex_init(&spi->lock);
 	kref_init(&spi->refcnt);
 
 	spi->nregions = nregions;
@@ -481,6 +584,12 @@ static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
 		goto err;
 	}
 
+	ret = intel_dg_spi_init_mtd(spi, device, ret, ispi->writeable_override);
+	if (ret) {
+		dev_err(device, "failed init mtd %d\n", ret);
+		goto err;
+	}
+
 	dev_set_drvdata(&aux_dev->dev, spi);
 
 	return 0;
@@ -497,6 +606,8 @@ static void intel_dg_spi_remove(struct auxiliary_device *aux_dev)
 	if (!spi)
 		return;
 
+	mtd_device_unregister(&spi->mtd);
+
 	dev_set_drvdata(&aux_dev->dev, NULL);
 
 	kref_put(&spi->refcnt, intel_dg_spi_release);
-- 
2.34.1

