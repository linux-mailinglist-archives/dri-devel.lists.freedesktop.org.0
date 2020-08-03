Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E6239EE0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 07:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0570889D9A;
	Mon,  3 Aug 2020 05:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9BC894D7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 05:20:38 +0000 (UTC)
IronPort-SDR: Jn2cMPWyQdikbKdJ0W4Kje+b9MfBnVTDNwcSoMcsgs6zc3Ky8y+n+jijbF5pa89EFMTblKqCjC
 yTHxUaoA1IjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="139623548"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="139623548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:20:37 -0700
IronPort-SDR: G2veJs/iBAmISV7wJ+PFNDAKCadTwf8F6X08x1viboWKeHK+W9F9WtvrmlUkVIolbxWXIbzU6t
 BtqM3uy3JICQ==
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="331770063"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:20:37 -0700
Subject: [PATCH v4 21/23] device-dax: Add an 'align' attribute
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Sun, 02 Aug 2020 22:04:19 -0700
Message-ID: <159643105944.4062302.3131761052969132784.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
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
Cc: linux-acpi@vger.kernel.org, ard.biesheuvel@linaro.org, peterz@infradead.org,
 vishal.l.verma@intel.com, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, joao.m.martins@oracle.com, linux-nvdimm@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joao Martins <joao.m.martins@oracle.com>

Introduce a device align attribute. While doing so,
rename the region align attribute to be more explicitly
named as so, but keep it named as @align to retain the API
for tools like daxctl.

Changes on align may not always be valid, when say certain
mappings were created with 2M and then we switch to 1G. So, we
validate all ranges against the new value being attempted,
post resizing.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Link: https://lore.kernel.org/r/20200716172913.19658-3-joao.m.martins@oracle.com
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/dax/bus.c         |   93 ++++++++++++++++++++++++++++++++++++++++-----
 drivers/dax/dax-private.h |   18 +++++++++
 2 files changed, 101 insertions(+), 10 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 9edfdf83408e..b984213c315f 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -230,14 +230,15 @@ static ssize_t region_size_show(struct device *dev,
 static struct device_attribute dev_attr_region_size = __ATTR(size, 0444,
 		region_size_show, NULL);
 
-static ssize_t align_show(struct device *dev,
+static ssize_t region_align_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct dax_region *dax_region = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%u\n", dax_region->align);
 }
-static DEVICE_ATTR_RO(align);
+static struct device_attribute dev_attr_region_align =
+		__ATTR(align, 0400, region_align_show, NULL);
 
 #define for_each_dax_region_resource(dax_region, res) \
 	for (res = (dax_region)->res.child; res; res = res->sibling)
@@ -488,7 +489,7 @@ static umode_t dax_region_visible(struct kobject *kobj, struct attribute *a,
 static struct attribute *dax_region_attributes[] = {
 	&dev_attr_available_size.attr,
 	&dev_attr_region_size.attr,
-	&dev_attr_align.attr,
+	&dev_attr_region_align.attr,
 	&dev_attr_create.attr,
 	&dev_attr_seed.attr,
 	&dev_attr_delete.attr,
@@ -855,15 +856,13 @@ static ssize_t size_show(struct device *dev,
 	return sprintf(buf, "%llu\n", size);
 }
 
-static bool alloc_is_aligned(struct dax_region *dax_region,
-		resource_size_t size)
+static bool alloc_is_aligned(struct dev_dax *dev_dax, resource_size_t size)
 {
 	/*
 	 * The minimum mapping granularity for a device instance is a
 	 * single subsection, unless the arch says otherwise.
 	 */
-	return IS_ALIGNED(size, max_t(unsigned long, dax_region->align,
-				memremap_compat_align()));
+	return IS_ALIGNED(size, max_t(unsigned long, dev_dax->align, memremap_compat_align()));
 }
 
 static int dev_dax_shrink(struct dev_dax *dev_dax, resource_size_t size)
@@ -958,7 +957,7 @@ static ssize_t dev_dax_resize(struct dax_region *dax_region,
 		return dev_dax_shrink(dev_dax, size);
 
 	to_alloc = size - dev_size;
-	if (dev_WARN_ONCE(dev, !alloc_is_aligned(dax_region, to_alloc),
+	if (dev_WARN_ONCE(dev, !alloc_is_aligned(dev_dax, to_alloc),
 			"resize of %pa misaligned\n", &to_alloc))
 		return -ENXIO;
 
@@ -1022,7 +1021,7 @@ static ssize_t size_store(struct device *dev, struct device_attribute *attr,
 	if (rc)
 		return rc;
 
-	if (!alloc_is_aligned(dax_region, val)) {
+	if (!alloc_is_aligned(dev_dax, val)) {
 		dev_dbg(dev, "%s: size: %lld misaligned\n", __func__, val);
 		return -EINVAL;
 	}
@@ -1041,6 +1040,78 @@ static ssize_t size_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(size);
 
+static ssize_t align_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct dev_dax *dev_dax = to_dev_dax(dev);
+
+	return sprintf(buf, "%d\n", dev_dax->align);
+}
+
+static ssize_t dev_dax_validate_align(struct dev_dax *dev_dax)
+{
+	resource_size_t dev_size = dev_dax_size(dev_dax);
+	struct device *dev = &dev_dax->dev;
+	int i;
+
+	if (dev_size > 0 && !alloc_is_aligned(dev_dax, dev_size)) {
+		dev_dbg(dev, "%s: align %u invalid for size %pa\n",
+			__func__, dev_dax->align, &dev_size);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < dev_dax->nr_range; i++) {
+		size_t len = range_len(&dev_dax->ranges[i].range);
+
+		if (!alloc_is_aligned(dev_dax, len)) {
+			dev_dbg(dev, "%s: align %u invalid for range %d\n",
+				__func__, dev_dax->align, i);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static ssize_t align_store(struct device *dev, struct device_attribute *attr,
+		const char *buf, size_t len)
+{
+	struct dev_dax *dev_dax = to_dev_dax(dev);
+	struct dax_region *dax_region = dev_dax->region;
+	unsigned long val, align_save;
+	ssize_t rc;
+
+	rc = kstrtoul(buf, 0, &val);
+	if (rc)
+		return -ENXIO;
+
+	if (!dax_align_valid(val))
+		return -EINVAL;
+
+	device_lock(dax_region->dev);
+	if (!dax_region->dev->driver) {
+		device_unlock(dax_region->dev);
+		return -ENXIO;
+	}
+
+	device_lock(dev);
+	if (dev->driver) {
+		rc = -EBUSY;
+		goto out_unlock;
+	}
+
+	align_save = dev_dax->align;
+	dev_dax->align = val;
+	rc = dev_dax_validate_align(dev_dax);
+	if (rc)
+		dev_dax->align = align_save;
+out_unlock:
+	device_unlock(dev);
+	device_unlock(dax_region->dev);
+	return rc == 0 ? len : rc;
+}
+static DEVICE_ATTR_RW(align);
+
 static int dev_dax_target_node(struct dev_dax *dev_dax)
 {
 	struct dax_region *dax_region = dev_dax->region;
@@ -1101,7 +1172,8 @@ static umode_t dev_dax_visible(struct kobject *kobj, struct attribute *a, int n)
 		return 0;
 	if (a == &dev_attr_numa_node.attr && !IS_ENABLED(CONFIG_NUMA))
 		return 0;
-	if (a == &dev_attr_size.attr && is_static(dax_region))
+	if ((a == &dev_attr_align.attr ||
+	     a == &dev_attr_size.attr) && is_static(dax_region))
 		return 0444;
 	return a->mode;
 }
@@ -1110,6 +1182,7 @@ static struct attribute *dev_dax_attributes[] = {
 	&dev_attr_modalias.attr,
 	&dev_attr_size.attr,
 	&dev_attr_target_node.attr,
+	&dev_attr_align.attr,
 	&dev_attr_resource.attr,
 	&dev_attr_numa_node.attr,
 	NULL,
diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
index 5fd3a26cfcea..fe337436d7f5 100644
--- a/drivers/dax/dax-private.h
+++ b/drivers/dax/dax-private.h
@@ -87,4 +87,22 @@ static inline struct dax_mapping *to_dax_mapping(struct device *dev)
 }
 
 phys_addr_t dax_pgoff_to_phys(struct dev_dax *dev_dax, pgoff_t pgoff, unsigned long size);
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static inline bool dax_align_valid(unsigned int align)
+{
+	if (align == PUD_SIZE && IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD))
+		return true;
+	if (align == PMD_SIZE && has_transparent_hugepage())
+		return true;
+	if (align == PAGE_SIZE)
+		return true;
+	return false;
+}
+#else
+static inline bool dax_align_valid(unsigned int align)
+{
+	return align == PAGE_SIZE;
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
