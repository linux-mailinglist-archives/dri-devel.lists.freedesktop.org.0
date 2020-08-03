Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F48239EE3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 07:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FA789DCF;
	Mon,  3 Aug 2020 05:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9589DCF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 05:20:48 +0000 (UTC)
IronPort-SDR: +MtSownI4s909ZprdxoEk5AX/tsTzqR1MDJ3NQRdvIP0ss9ouD2erBJq3W04xL+9S1qfAiVJgU
 rv/tsBxLX4Zw==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="149847264"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="149847264"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:20:48 -0700
IronPort-SDR: RpV/TarlfZtpGTxcGFV/YB86O42UoKDQBjZi2zZhGZ/aMAH3qwe80fGLnen8feyash85FU7j2F
 Dae5w7PzminA==
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="273823070"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:20:48 -0700
Subject: [PATCH v4 23/23] device-dax: Add a range mapping allocation attribute
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Sun, 02 Aug 2020 22:04:29 -0700
Message-ID: <159643106970.4062302.10402616567780784722.stgit@dwillia2-desk3.amr.corp.intel.com>
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

Add a sysfs attribute which denotes a range from the dax region
to be allocated. It's an write only @mapping sysfs attribute in
the format of '<start>-<end>' to allocate a range. @start and
@end use hexadecimal values and the @pgoff is implicitly ordered
wrt to previous writes to @mapping sysfs e.g. a write of a range
of length 1G the pgoff is 0..1G(-4K), a second write will use
@pgoff for 1G+4K..<size>.

This range mapping interface is useful for:

 1) Application which want to implement its own allocation logic,
 and thus pick the desired ranges from dax_region.

 2) For use cases like VMM fast restart[0] where after kexec we
 want to the same gpa<->phys mappings (as originally created
 before kexec).

[0] https://static.sched.com/hosted_files/kvmforum2019/66/VMM-fast-restart_kvmforum2019.pdf

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Link: https://lore.kernel.org/r/20200716172913.19658-5-joao.m.martins@oracle.com
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/dax/bus.c |   64 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index b984213c315f..092112bba6ed 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1040,6 +1040,67 @@ static ssize_t size_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(size);
 
+static ssize_t range_parse(const char *opt, size_t len, struct range *range)
+{
+	unsigned long long addr = 0;
+	char *start, *end, *str;
+	ssize_t rc = EINVAL;
+
+	str = kstrdup(opt, GFP_KERNEL);
+	if (!str)
+		return rc;
+
+	end = str;
+	start = strsep(&end, "-");
+	if (!start || !end)
+		goto err;
+
+	rc = kstrtoull(start, 16, &addr);
+	if (rc)
+		goto err;
+	range->start = addr;
+
+	rc = kstrtoull(end, 16, &addr);
+	if (rc)
+		goto err;
+	range->end = addr;
+
+err:
+	kfree(str);
+	return rc;
+}
+
+static ssize_t mapping_store(struct device *dev, struct device_attribute *attr,
+		const char *buf, size_t len)
+{
+	struct dev_dax *dev_dax = to_dev_dax(dev);
+	struct dax_region *dax_region = dev_dax->region;
+	size_t to_alloc;
+	struct range r;
+	ssize_t rc;
+
+	rc = range_parse(buf, len, &r);
+	if (rc)
+		return rc;
+
+	rc = -ENXIO;
+	device_lock(dax_region->dev);
+	if (!dax_region->dev->driver) {
+		device_unlock(dax_region->dev);
+		return rc;
+	}
+	device_lock(dev);
+
+	to_alloc = range_len(&r);
+	if (alloc_is_aligned(dev_dax, to_alloc))
+		rc = alloc_dev_dax_range(dev_dax, r.start, to_alloc);
+	device_unlock(dev);
+	device_unlock(dax_region->dev);
+
+	return rc == 0 ? len : rc;
+}
+static DEVICE_ATTR_WO(mapping);
+
 static ssize_t align_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -1172,6 +1233,8 @@ static umode_t dev_dax_visible(struct kobject *kobj, struct attribute *a, int n)
 		return 0;
 	if (a == &dev_attr_numa_node.attr && !IS_ENABLED(CONFIG_NUMA))
 		return 0;
+	if (a == &dev_attr_mapping.attr && is_static(dax_region))
+		return 0;
 	if ((a == &dev_attr_align.attr ||
 	     a == &dev_attr_size.attr) && is_static(dax_region))
 		return 0444;
@@ -1181,6 +1244,7 @@ static umode_t dev_dax_visible(struct kobject *kobj, struct attribute *a, int n)
 static struct attribute *dev_dax_attributes[] = {
 	&dev_attr_modalias.attr,
 	&dev_attr_size.attr,
+	&dev_attr_mapping.attr,
 	&dev_attr_target_node.attr,
 	&dev_attr_align.attr,
 	&dev_attr_resource.attr,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
