Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E779FF453
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2025 16:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF4C10E20A;
	Wed,  1 Jan 2025 15:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHYnrwwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9750B10E208;
 Wed,  1 Jan 2025 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735746639; x=1767282639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NSkYDIr+t/AV04AKsrvBwo0MXWMMgwJl7QqvpeHpJ0M=;
 b=iHYnrwwn+I3IMEeJTy8XLtRYfLJ+75aQBeMVO/Ftgf/TgTvt+4UBN71T
 jzvAOq1iEgDfJ1akqDSQvHBDGRXufmII4yesWvgNgGM6k1ObZYYIeEqWv
 YA1GK+MKUkMYsTqntMeUCfKf/zNaeR8KowsWrBp6MZjurYwLdhm9BqeAy
 uby+ONHjmMHkq6pYQRnEZngBx07exE0ONEIU0RtPFRR3J6gtEU5m6j+Yy
 IcRAzOufeXHfatsXz6vvySA4ZjBUDn5FrHwGsj2nbtYCzeBq4UX9aBXLL
 0cxwcVPs3Ej1hsfwckYTtPsGndsMEy+RZPe4Evb108SzIteKKt4cjk21a Q==;
X-CSE-ConnectionGUID: CJjXQV8mSZKvbfaEPKe4Zg==
X-CSE-MsgGUID: K7q3cJNkTb2XvUITXBhvFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46485527"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; d="scan'208";a="46485527"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 07:50:39 -0800
X-CSE-ConnectionGUID: l3vGDItzTkGBKPWdsWWv9A==
X-CSE-MsgGUID: gOIFcbg6RrmQOixzKCobhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; d="scan'208";a="132138907"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 07:50:34 -0800
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
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v4 01/11] mtd: core: always create master device
Date: Wed,  1 Jan 2025 17:39:15 +0200
Message-ID: <20250101153925.865703-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250101153925.865703-1-alexander.usyskin@intel.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
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

Create master device without partition when
CONFIG_MTD_PARTITIONED_MASTER flag is unset.

This streamlines device tree and allows to anchor
runtime power management on master device in all cases.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/mtdcore.c | 123 ++++++++++++++++++++++++++++++++----------
 drivers/mtd/mtdpart.c |   6 +--
 2 files changed, 95 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..bbc502ef75de 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -68,7 +68,13 @@ static struct class mtd_class = {
 	.pm = MTD_CLS_PM_OPS,
 };
 
+static struct class mtd_master_class = {
+	.name = "mtd_master",
+	.pm = MTD_CLS_PM_OPS,
+};
+
 static DEFINE_IDR(mtd_idr);
+static DEFINE_IDR(mtd_master_idr);
 
 /* These are exported solely for the purpose of mtd_blkdevs.c. You
    should not use them for _anything_ else */
@@ -83,8 +89,9 @@ EXPORT_SYMBOL_GPL(__mtd_next_device);
 
 static LIST_HEAD(mtd_notifiers);
 
-
+#define MTD_MASTER_DEVS 255
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
+static dev_t mtd_master_devt;
 
 /* REVISIT once MTD uses the driver model better, whoever allocates
  * the mtd_info will probably want to use the release() hook...
@@ -104,6 +111,17 @@ static void mtd_release(struct device *dev)
 	device_destroy(&mtd_class, index + 1);
 }
 
+static void mtd_master_release(struct device *dev)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	idr_remove(&mtd_master_idr, mtd->index);
+	of_node_put(mtd_get_of_node(mtd));
+
+	if (mtd_is_partition(mtd))
+		release_mtd_partition(mtd);
+}
+
 static void mtd_device_release(struct kref *kref)
 {
 	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
@@ -367,6 +385,11 @@ static const struct device_type mtd_devtype = {
 	.release	= mtd_release,
 };
 
+static const struct device_type mtd_master_devtype = {
+	.name		= "mtd_master",
+	.release	= mtd_master_release,
+};
+
 static bool mtd_expert_analysis_mode;
 
 #ifdef CONFIG_DEBUG_FS
@@ -639,12 +662,12 @@ static void mtd_check_of_node(struct mtd_info *mtd)
  *	notify each currently active MTD 'user' of its arrival. Returns
  *	zero on success or non-zero on failure.
  */
-
 int add_mtd_device(struct mtd_info *mtd)
 {
 	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_notifier *not;
+	bool partitioned = true;
 	int i, error, ofidx;
 
 	/*
@@ -655,6 +678,11 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (WARN_ONCE(mtd->dev.type, "MTD already registered\n"))
 		return -EEXIST;
 
+	if ((master == mtd) && !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
+		partitioned = false;
+		pr_debug("mtd: unpartitioned master %s\n", mtd->name);
+	}
+
 	BUG_ON(mtd->writesize == 0);
 
 	/*
@@ -687,10 +715,17 @@ int add_mtd_device(struct mtd_info *mtd)
 	ofidx = -1;
 	if (np)
 		ofidx = of_alias_get_id(np, "mtd");
-	if (ofidx >= 0)
-		i = idr_alloc(&mtd_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
-	else
-		i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
+	if (partitioned) {
+		if (ofidx >= 0)
+			i = idr_alloc(&mtd_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
+		else
+			i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
+	} else {
+		if (ofidx >= 0)
+			i = idr_alloc(&mtd_master_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
+		else
+			i = idr_alloc(&mtd_master_idr, mtd, 0, 0, GFP_KERNEL);
+	}
 	if (i < 0) {
 		error = i;
 		goto fail_locked;
@@ -738,15 +773,23 @@ int add_mtd_device(struct mtd_info *mtd)
 	/* Caller should have set dev.parent to match the
 	 * physical device, if appropriate.
 	 */
-	mtd->dev.type = &mtd_devtype;
-	mtd->dev.class = &mtd_class;
-	mtd->dev.devt = MTD_DEVT(i);
-	dev_set_name(&mtd->dev, "mtd%d", i);
+	if (partitioned) {
+		mtd->dev.type = &mtd_devtype;
+		mtd->dev.class = &mtd_class;
+		mtd->dev.devt = MTD_DEVT(i);
+		dev_set_name(&mtd->dev, "mtd%d", i);
+	} else {
+		mtd->dev.type = &mtd_master_devtype;
+		mtd->dev.class = &mtd_master_class;
+		mtd->dev.devt = MKDEV(MAJOR(mtd_master_devt), i);
+		dev_set_name(&mtd->dev, "mtd_master%d", i);
+	}
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));
 	error = device_register(&mtd->dev);
 	if (error) {
+		pr_err("mtd: %s device_register fail %d\n", mtd->name, error);
 		put_device(&mtd->dev);
 		goto fail_added;
 	}
@@ -758,8 +801,10 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mtd_debugfs_populate(mtd);
 
-	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
-		      "mtd%dro", i);
+	if (partitioned) {
+		device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
+			      "mtd%dro", i);
+	}
 
 	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
 	/* No need to get a refcount on the module containing
@@ -769,13 +814,16 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mutex_unlock(&mtd_table_mutex);
 
-	if (of_property_read_bool(mtd_get_of_node(mtd), "linux,rootfs")) {
-		if (IS_BUILTIN(CONFIG_MTD)) {
-			pr_info("mtd: setting mtd%d (%s) as root device\n", mtd->index, mtd->name);
-			ROOT_DEV = MKDEV(MTD_BLOCK_MAJOR, mtd->index);
-		} else {
-			pr_warn("mtd: can't set mtd%d (%s) as root device - mtd must be builtin\n",
-				mtd->index, mtd->name);
+	if (partitioned) {
+		if (of_property_read_bool(mtd_get_of_node(mtd), "linux,rootfs")) {
+			if (IS_BUILTIN(CONFIG_MTD)) {
+				pr_info("mtd: setting mtd%d (%s) as root device\n",
+					mtd->index, mtd->name);
+				ROOT_DEV = MKDEV(MTD_BLOCK_MAJOR, mtd->index);
+			} else {
+				pr_warn("mtd: can't set mtd%d (%s) as root device - mtd must be builtin\n",
+					mtd->index, mtd->name);
+			}
 		}
 	}
 
@@ -790,7 +838,10 @@ int add_mtd_device(struct mtd_info *mtd)
 	device_unregister(&mtd->dev);
 fail_added:
 	of_node_put(mtd_get_of_node(mtd));
-	idr_remove(&mtd_idr, i);
+	if (partitioned)
+		idr_remove(&mtd_idr, i);
+	else
+		idr_remove(&mtd_master_idr, i);
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);
 	return error;
@@ -1061,11 +1112,10 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	if (ret)
 		goto out;
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
-		ret = add_mtd_device(mtd);
-		if (ret)
-			goto out;
-	}
+	/* Master device */
+	ret = add_mtd_device(mtd);
+	if (ret)
+		goto out;
 
 	/* Prefer parsed partitions over driver-provided fallback */
 	ret = parse_mtd_partitions(mtd, types, parser_data);
@@ -1261,8 +1311,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
-		kref_get(&master->refcnt);
+	kref_get(&master->refcnt);
 
 	return 0;
 }
@@ -1356,8 +1405,7 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
-		kref_put(&master->refcnt, mtd_device_release);
+	kref_put(&master->refcnt, mtd_device_release);
 
 	module_put(master->owner);
 
@@ -2524,6 +2572,16 @@ static int __init init_mtd(void)
 	if (ret)
 		goto err_reg;
 
+	ret = class_register(&mtd_master_class);
+	if (ret)
+		goto err_reg2;
+
+	ret = alloc_chrdev_region(&mtd_master_devt, 0, MTD_MASTER_DEVS, "mtd_master");
+	if (ret < 0) {
+		pr_err("unable to allocate char dev region\n");
+		goto err_chrdev;
+	}
+
 	mtd_bdi = mtd_bdi_init("mtd");
 	if (IS_ERR(mtd_bdi)) {
 		ret = PTR_ERR(mtd_bdi);
@@ -2548,6 +2606,10 @@ static int __init init_mtd(void)
 	bdi_unregister(mtd_bdi);
 	bdi_put(mtd_bdi);
 err_bdi:
+	unregister_chrdev_region(mtd_master_devt, MTD_MASTER_DEVS);
+err_chrdev:
+	class_unregister(&mtd_master_class);
+err_reg2:
 	class_unregister(&mtd_class);
 err_reg:
 	pr_err("Error registering mtd class or bdi: %d\n", ret);
@@ -2561,9 +2623,12 @@ static void __exit cleanup_mtd(void)
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
 	class_unregister(&mtd_class);
+	class_unregister(&mtd_master_class);
+	unregister_chrdev_region(mtd_master_devt, MTD_MASTER_DEVS);
 	bdi_unregister(mtd_bdi);
 	bdi_put(mtd_bdi);
 	idr_destroy(&mtd_idr);
+	idr_destroy(&mtd_master_idr);
 }
 
 module_init(init_mtd);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 6811a714349d..268c3d5ccdea 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -86,8 +86,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	 * parent conditional on that option. Note, this is a way to
 	 * distinguish between the parent and its partitions in sysfs.
 	 */
-	child->dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
-			    &parent->dev : parent->dev.parent;
+	child->dev.parent = &parent->dev;
 	child->dev.of_node = part->of_node;
 	child->parent = parent;
 	child->part.offset = part->offset;
@@ -590,9 +589,6 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	int ret, err = 0;
 
 	dev = &master->dev;
-	/* Use parent device (controller) if the top level MTD is not registered */
-	if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) && !mtd_is_partition(master))
-		dev = master->dev.parent;
 
 	np = mtd_get_of_node(master);
 	if (mtd_is_partition(master))
-- 
2.43.0

