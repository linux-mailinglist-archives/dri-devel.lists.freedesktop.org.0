Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB8235006
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 05:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343706E196;
	Sat,  1 Aug 2020 03:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454DD6E196
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 03:43:15 +0000 (UTC)
IronPort-SDR: duN0BZNLIGpqds3F375UpIoSeBOPL8CgadegJ7wnGSDlkSZG4uYr7SSSpv56E8m/YKPhw72Ece
 jAHWFAULsaQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9699"; a="149353959"
X-IronPort-AV: E=Sophos;i="5.75,420,1589266800"; d="scan'208";a="149353959"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 20:43:14 -0700
IronPort-SDR: Wu4/goeeob0gX4X8fBdtAUM2j8WaXrOl+H/VkkWKFacZqrY56uGWFVt19dhVdcM+CdGsh9D7da
 oZ5fZUU8jizw==
X-IronPort-AV: E=Sophos;i="5.75,420,1589266800"; d="scan'208";a="321647484"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 20:43:14 -0700
Subject: [PATCH v3 21/23] device-dax: Add an 'align' attribute
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Fri, 31 Jul 2020 20:26:56 -0700
Message-ID: <159625241660.3040297.3801913809845542130.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <159625229779.3040297.11363509688097221416.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <159625229779.3040297.11363509688097221416.stgit@dwillia2-desk3.amr.corp.intel.com>
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
 drivers/dax/bus.c |  102 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 92 insertions(+), 10 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index feca1413481c..7a9439132573 100644
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
@@ -1041,6 +1040,87 @@ static ssize_t size_store(struct device *dev, struct device_attribute *attr,
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
+	ssize_t rc, i;
+
+	if (dev->driver)
+		return -EBUSY;
+
+	rc = -EINVAL;
+	if (dev_size > 0 && !alloc_is_aligned(dev_dax, dev_size)) {
+		dev_dbg(dev, "%s: align %u invalid for size %llu\n",
+			__func__, dev_dax->align, dev_size);
+		return rc;
+	}
+
+	for (i = 0; i < dev_dax->nr_range; i++) {
+		size_t len = range_len(&dev_dax->ranges[i].range);
+
+		if (!alloc_is_aligned(dev_dax, len)) {
+			dev_dbg(dev, "%s: align %u invalid for range %ld\n",
+				__func__, dev_dax->align, i);
+			return rc;
+		}
+	}
+
+	switch (dev_dax->align) {
+	case PUD_SIZE:
+		if (!IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD))
+			break;
+		fallthrough;
+	case PMD_SIZE:
+		if (!has_transparent_hugepage())
+			break;
+		fallthrough;
+	case PAGE_SIZE:
+		rc = 0;
+		break;
+	}
+
+	return rc;
+}
+
+static ssize_t align_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t len)
+{
+	struct dev_dax *dev_dax = to_dev_dax(dev);
+	struct dax_region *dax_region = dev_dax->region;
+	unsigned long long val, align_save;
+	ssize_t rc;
+
+	rc = kstrtoull(buf, 0, &val);
+	if (rc)
+		return -ENXIO;
+
+	device_lock(dax_region->dev);
+	if (!dax_region->dev->driver) {
+		device_unlock(dax_region->dev);
+		return -ENXIO;
+	}
+
+	device_lock(dev);
+	align_save = dev_dax->align;
+	dev_dax->align = val;
+	rc = dev_dax_validate_align(dev_dax);
+	if (rc)
+		dev_dax->align = align_save;
+	device_unlock(dev);
+	device_unlock(dax_region->dev);
+	return rc == 0 ? len : rc;
+}
+static DEVICE_ATTR_RW(align);
+
 static int dev_dax_target_node(struct dev_dax *dev_dax)
 {
 	struct dax_region *dax_region = dev_dax->region;
@@ -1101,7 +1181,8 @@ static umode_t dev_dax_visible(struct kobject *kobj, struct attribute *a, int n)
 		return 0;
 	if (a == &dev_attr_numa_node.attr && !IS_ENABLED(CONFIG_NUMA))
 		return 0;
-	if (a == &dev_attr_size.attr && is_static(dax_region))
+	if ((a == &dev_attr_align.attr ||
+	     a == &dev_attr_size.attr) && is_static(dax_region))
 		return 0444;
 	return a->mode;
 }
@@ -1110,6 +1191,7 @@ static struct attribute *dev_dax_attributes[] = {
 	&dev_attr_modalias.attr,
 	&dev_attr_size.attr,
 	&dev_attr_target_node.attr,
+	&dev_attr_align.attr,
 	&dev_attr_resource.attr,
 	&dev_attr_numa_node.attr,
 	NULL,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
