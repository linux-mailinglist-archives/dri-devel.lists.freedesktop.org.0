Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B3A9AF4B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B50A10E806;
	Thu, 24 Apr 2025 13:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgJrkoNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B57110E805;
 Thu, 24 Apr 2025 13:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745501861; x=1777037861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ciby7S4K5tiBfPSBg+I9XMeCsqEGDlgG5DdkPfZhqGY=;
 b=bgJrkoNP+zxX3kNCjTwPApft5eXZX9/9oYp1AEP5g204eqcZ2noJCxcP
 lRItcpIYD7dKeAEtubbdWpakbsrlqJS1ci/5jXMV0UbAIldqrIfWyPfVk
 k0LCGz65Q4PyFQanKwBntaMkXaGpipR1Jg5di9VgP8V20pL10XZnlPk79
 uGh1JhFri/yDCdCFq66K/FIKJLPebvRdqgASPSI5zmcoN/PamV2+p2hR7
 /2CA8iQ/+lkONQ+AAGB27M7MT9PqRwMKSvWHN8L5imbaXt6fEvTICXVIb
 3k6jSnDNiosA+LINdBblldAJxvfZv5FTDctI6aSXPKCVbLfNTPDIQBf++ A==;
X-CSE-ConnectionGUID: /cuD2zVzTRWaV01X4RauTw==
X-CSE-MsgGUID: 6PAjv6rJRSGqGz8XGf7hug==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46368021"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="46368021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 06:37:40 -0700
X-CSE-ConnectionGUID: bW/1fIbFRvq6t3ov9g5ZWQ==
X-CSE-MsgGUID: WEox205XTVypaBEKfDqXRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="136701348"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 06:37:34 -0700
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
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v9 01/12] mtd: core: always create master device
Date: Thu, 24 Apr 2025 16:25:25 +0300
Message-ID: <20250424132536.3043825-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424132536.3043825-1-alexander.usyskin@intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
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
 drivers/mtd/mtdchar.c          |   2 +-
 drivers/mtd/mtdcore.c          | 152 ++++++++++++++++++++++++---------
 drivers/mtd/mtdcore.h          |   2 +-
 drivers/mtd/mtdpart.c          |  16 ++--
 include/linux/mtd/partitions.h |   2 +-
 5 files changed, 123 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8dc4f5c493fc..391d81ad960c 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -559,7 +559,7 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 		/* Sanitize user input */
 		p.devname[BLKPG_DEVNAMELTH - 1] = '\0';
 
-		return mtd_add_partition(mtd, p.devname, p.start, p.length);
+		return mtd_add_partition(mtd, p.devname, p.start, p.length, NULL);
 
 	case BLKPG_DEL_PARTITION:
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ba9a741f5ac..429d8c16baf0 100644
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
@@ -634,13 +657,13 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
+ *	@partitioned: create partitioned device
  *
  *	Add a device to the list of MTD devices present in the system, and
  *	notify each currently active MTD 'user' of its arrival. Returns
  *	zero on success or non-zero on failure.
  */
-
-int add_mtd_device(struct mtd_info *mtd)
+int add_mtd_device(struct mtd_info *mtd, bool partitioned)
 {
 	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
@@ -687,10 +710,17 @@ int add_mtd_device(struct mtd_info *mtd)
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
@@ -738,10 +768,18 @@ int add_mtd_device(struct mtd_info *mtd)
 	/* Caller should have set dev.parent to match the
 	 * physical device, if appropriate.
 	 */
-	mtd->dev.type = &mtd_devtype;
-	mtd->dev.class = &mtd_class;
-	mtd->dev.devt = MTD_DEVT(i);
-	error = dev_set_name(&mtd->dev, "mtd%d", i);
+	if (partitioned) {
+		mtd->dev.type = &mtd_devtype;
+		mtd->dev.class = &mtd_class;
+		mtd->dev.devt = MTD_DEVT(i);
+		dev_set_name(&mtd->dev, "mtd%d", i);
+		error = dev_set_name(&mtd->dev, "mtd%d", i);
+	} else {
+		mtd->dev.type = &mtd_master_devtype;
+		mtd->dev.class = &mtd_master_class;
+		mtd->dev.devt = MKDEV(MAJOR(mtd_master_devt), i);
+		error = dev_set_name(&mtd->dev, "mtd_master%d", i);
+	}
 	if (error)
 		goto fail_devname;
 	dev_set_drvdata(&mtd->dev, mtd);
@@ -749,6 +787,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	of_node_get(mtd_get_of_node(mtd));
 	error = device_register(&mtd->dev);
 	if (error) {
+		pr_err("mtd: %s device_register fail %d\n", mtd->name, error);
 		put_device(&mtd->dev);
 		goto fail_added;
 	}
@@ -760,10 +799,13 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mtd_debugfs_populate(mtd);
 
-	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
-		      "mtd%dro", i);
+	if (partitioned) {
+		device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
+			      "mtd%dro", i);
+	}
 
-	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
+	pr_debug("mtd: Giving out %spartitioned device %d to %s\n",
+		 partitioned ? "" : "un-", i, mtd->name);
 	/* No need to get a refcount on the module containing
 	   the notifier, since we hold the mtd_table_mutex */
 	list_for_each_entry(not, &mtd_notifiers, list)
@@ -771,13 +813,16 @@ int add_mtd_device(struct mtd_info *mtd)
 
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
 
@@ -793,7 +838,10 @@ int add_mtd_device(struct mtd_info *mtd)
 fail_added:
 	of_node_put(mtd_get_of_node(mtd));
 fail_devname:
-	idr_remove(&mtd_idr, i);
+	if (partitioned)
+		idr_remove(&mtd_idr, i);
+	else
+		idr_remove(&mtd_master_idr, i);
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);
 	return error;
@@ -811,12 +859,14 @@ int add_mtd_device(struct mtd_info *mtd)
 
 int del_mtd_device(struct mtd_info *mtd)
 {
-	int ret;
 	struct mtd_notifier *not;
+	struct idr *idr;
+	int ret;
 
 	mutex_lock(&mtd_table_mutex);
 
-	if (idr_find(&mtd_idr, mtd->index) != mtd) {
+	idr = mtd->dev.class == &mtd_class ? &mtd_idr : &mtd_master_idr;
+	if (idr_find(idr, mtd->index) != mtd) {
 		ret = -ENODEV;
 		goto out_error;
 	}
@@ -1056,6 +1106,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
 {
+	struct mtd_info *parent;
 	int ret, err;
 
 	mtd_set_dev_defaults(mtd);
@@ -1064,25 +1115,30 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	if (ret)
 		goto out;
 
+	ret = add_mtd_device(mtd, false);
+	if (ret)
+		goto out;
+
 	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
-		ret = add_mtd_device(mtd);
+		ret = mtd_add_partition(mtd, mtd->name, 0, MTDPART_SIZ_FULL, &parent);
 		if (ret)
 			goto out;
+
+	} else {
+		parent = mtd;
 	}
 
 	/* Prefer parsed partitions over driver-provided fallback */
-	ret = parse_mtd_partitions(mtd, types, parser_data);
+	ret = parse_mtd_partitions(parent, types, parser_data);
 	if (ret == -EPROBE_DEFER)
 		goto out;
 
 	if (ret > 0)
 		ret = 0;
 	else if (nr_parts)
-		ret = add_mtd_partitions(mtd, parts, nr_parts);
-	else if (!device_is_registered(&mtd->dev))
-		ret = add_mtd_device(mtd);
-	else
-		ret = 0;
+		ret = add_mtd_partitions(parent, parts, nr_parts);
+	else if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+		ret = mtd_add_partition(parent, mtd->name, 0, MTDPART_SIZ_FULL, NULL);
 
 	if (ret)
 		goto out;
@@ -1102,13 +1158,14 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
 
+	return 0;
 out:
-	if (ret) {
-		nvmem_unregister(mtd->otp_user_nvmem);
-		nvmem_unregister(mtd->otp_factory_nvmem);
-	}
+	nvmem_unregister(mtd->otp_user_nvmem);
+	nvmem_unregister(mtd->otp_factory_nvmem);
 
-	if (ret && device_is_registered(&mtd->dev)) {
+	del_mtd_partitions(mtd);
+
+	if (device_is_registered(&mtd->dev)) {
 		err = del_mtd_device(mtd);
 		if (err)
 			pr_err("Error when deleting MTD device (%d)\n", err);
@@ -1267,8 +1324,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
-		kref_get(&master->refcnt);
+	kref_get(&master->refcnt);
 
 	return 0;
 }
@@ -1362,8 +1418,7 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
-		kref_put(&master->refcnt, mtd_device_release);
+	kref_put(&master->refcnt, mtd_device_release);
 
 	module_put(master->owner);
 
@@ -2530,6 +2585,16 @@ static int __init init_mtd(void)
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
@@ -2554,6 +2619,10 @@ static int __init init_mtd(void)
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
@@ -2567,9 +2636,12 @@ static void __exit cleanup_mtd(void)
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
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index b014861a06a6..2258d31c5aa6 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -8,7 +8,7 @@ extern struct mutex mtd_table_mutex;
 extern struct backing_dev_info *mtd_bdi;
 
 struct mtd_info *__mtd_next_device(int i);
-int __must_check add_mtd_device(struct mtd_info *mtd);
+int __must_check add_mtd_device(struct mtd_info *mtd, bool partitioned);
 int del_mtd_device(struct mtd_info *mtd);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 994e8c51e674..5a3db36d734e 100644
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
@@ -243,7 +242,7 @@ static int mtd_add_partition_attrs(struct mtd_info *new)
 }
 
 int mtd_add_partition(struct mtd_info *parent, const char *name,
-		      long long offset, long long length)
+		      long long offset, long long length, struct mtd_info **out)
 {
 	struct mtd_info *master = mtd_get_master(parent);
 	u64 parent_size = mtd_is_partition(parent) ?
@@ -276,12 +275,15 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	list_add_tail(&child->part.node, &parent->partitions);
 	mutex_unlock(&master->master.partitions_lock);
 
-	ret = add_mtd_device(child);
+	ret = add_mtd_device(child, true);
 	if (ret)
 		goto err_remove_part;
 
 	mtd_add_partition_attrs(child);
 
+	if (out)
+		*out = child;
+
 	return 0;
 
 err_remove_part:
@@ -413,7 +415,7 @@ int add_mtd_partitions(struct mtd_info *parent,
 		list_add_tail(&child->part.node, &parent->partitions);
 		mutex_unlock(&master->master.partitions_lock);
 
-		ret = add_mtd_device(child);
+		ret = add_mtd_device(child, true);
 		if (ret) {
 			mutex_lock(&master->master.partitions_lock);
 			list_del(&child->part.node);
@@ -590,9 +592,6 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	int ret, err = 0;
 
 	dev = &master->dev;
-	/* Use parent device (controller) if the top level MTD is not registered */
-	if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) && !mtd_is_partition(master))
-		dev = master->dev.parent;
 
 	np = mtd_get_of_node(master);
 	if (mtd_is_partition(master))
@@ -711,6 +710,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		if (ret < 0 && !err)
 			err = ret;
 	}
+
 	return err;
 }
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index b74a539ec581..5daf80df9e89 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -108,7 +108,7 @@ extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 		      deregister_mtd_parser)
 
 int mtd_add_partition(struct mtd_info *master, const char *name,
-		      long long offset, long long length);
+		      long long offset, long long length, struct mtd_info **part);
 int mtd_del_partition(struct mtd_info *master, int partno);
 uint64_t mtd_get_device_size(const struct mtd_info *mtd);
 
-- 
2.43.0

