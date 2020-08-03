Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8205B239EDE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 07:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969B36E1F5;
	Mon,  3 Aug 2020 05:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928286E1F5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 05:20:33 +0000 (UTC)
IronPort-SDR: cwYZo9qjv1ewG4zJ4hoKesJRpaokHvJu86j0Kfk5oNuFYIpUQnCpl417OVewfVu3CJmRwzzFXT
 h9GvyMHUljVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="153250898"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="153250898"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:20:33 -0700
IronPort-SDR: Q4wqFp6NHlXuXQJz/1u4ACuBKdO7iqNqFIYE446SgNcM7iR/d/jzaKrY5zPk3IbBbdo7/GpsCn
 qDO+PvICOLHg==
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="329890662"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:20:32 -0700
Subject: [PATCH v4 20/23] device-dax: Make align a per-device property
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Sun, 02 Aug 2020 22:04:13 -0700
Message-ID: <159643105377.4062302.4159447829955683131.stgit@dwillia2-desk3.amr.corp.intel.com>
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

Introduce @align to struct dev_dax.

When creating a new device, we still initialize to the default
dax_region @align. Child devices belonging to a region may wish
to keep a different alignment property instead of a global
region-defined one.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Link: https://lore.kernel.org/r/20200716172913.19658-2-joao.m.martins@oracle.com
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/dax/bus.c         |    1 +
 drivers/dax/dax-private.h |    3 +++
 drivers/dax/device.c      |   37 +++++++++++++++----------------------
 3 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 2779c65dc7c0..9edfdf83408e 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1215,6 +1215,7 @@ struct dev_dax *devm_create_dev_dax(struct dev_dax_data *data)
 
 	dev_dax->dax_dev = dax_dev;
 	dev_dax->target_node = dax_region->target_node;
+	dev_dax->align = dax_region->align;
 	ida_init(&dev_dax->ida);
 	kref_get(&dax_region->kref);
 
diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
index 13780f62b95e..5fd3a26cfcea 100644
--- a/drivers/dax/dax-private.h
+++ b/drivers/dax/dax-private.h
@@ -62,6 +62,7 @@ struct dax_mapping {
 struct dev_dax {
 	struct dax_region *region;
 	struct dax_device *dax_dev;
+	unsigned int align;
 	int target_node;
 	int id;
 	struct ida ida;
@@ -84,4 +85,6 @@ static inline struct dax_mapping *to_dax_mapping(struct device *dev)
 {
 	return container_of(dev, struct dax_mapping, dev);
 }
+
+phys_addr_t dax_pgoff_to_phys(struct dev_dax *dev_dax, pgoff_t pgoff, unsigned long size);
 #endif
diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 2bfc5c83e3b0..d2b1892cb1b2 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -17,7 +17,6 @@
 static int check_vma(struct dev_dax *dev_dax, struct vm_area_struct *vma,
 		const char *func)
 {
-	struct dax_region *dax_region = dev_dax->region;
 	struct device *dev = &dev_dax->dev;
 	unsigned long mask;
 
@@ -32,7 +31,7 @@ static int check_vma(struct dev_dax *dev_dax, struct vm_area_struct *vma,
 		return -EINVAL;
 	}
 
-	mask = dax_region->align - 1;
+	mask = dev_dax->align - 1;
 	if (vma->vm_start & mask || vma->vm_end & mask) {
 		dev_info_ratelimited(dev,
 				"%s: %s: fail, unaligned vma (%#lx - %#lx, %#lx)\n",
@@ -78,21 +77,19 @@ static vm_fault_t __dev_dax_pte_fault(struct dev_dax *dev_dax,
 				struct vm_fault *vmf, pfn_t *pfn)
 {
 	struct device *dev = &dev_dax->dev;
-	struct dax_region *dax_region;
 	phys_addr_t phys;
 	unsigned int fault_size = PAGE_SIZE;
 
 	if (check_vma(dev_dax, vmf->vma, __func__))
 		return VM_FAULT_SIGBUS;
 
-	dax_region = dev_dax->region;
-	if (dax_region->align > PAGE_SIZE) {
+	if (dev_dax->align > PAGE_SIZE) {
 		dev_dbg(dev, "alignment (%#x) > fault size (%#x)\n",
-			dax_region->align, fault_size);
+			dev_dax->align, fault_size);
 		return VM_FAULT_SIGBUS;
 	}
 
-	if (fault_size != dax_region->align)
+	if (fault_size != dev_dax->align)
 		return VM_FAULT_SIGBUS;
 
 	phys = dax_pgoff_to_phys(dev_dax, vmf->pgoff, PAGE_SIZE);
@@ -120,15 +117,15 @@ static vm_fault_t __dev_dax_pmd_fault(struct dev_dax *dev_dax,
 		return VM_FAULT_SIGBUS;
 
 	dax_region = dev_dax->region;
-	if (dax_region->align > PMD_SIZE) {
+	if (dev_dax->align > PMD_SIZE) {
 		dev_dbg(dev, "alignment (%#x) > fault size (%#x)\n",
-			dax_region->align, fault_size);
+			dev_dax->align, fault_size);
 		return VM_FAULT_SIGBUS;
 	}
 
-	if (fault_size < dax_region->align)
+	if (fault_size < dev_dax->align)
 		return VM_FAULT_SIGBUS;
-	else if (fault_size > dax_region->align)
+	else if (fault_size > dev_dax->align)
 		return VM_FAULT_FALLBACK;
 
 	/* if we are outside of the VMA */
@@ -164,15 +161,15 @@ static vm_fault_t __dev_dax_pud_fault(struct dev_dax *dev_dax,
 		return VM_FAULT_SIGBUS;
 
 	dax_region = dev_dax->region;
-	if (dax_region->align > PUD_SIZE) {
+	if (dev_dax->align > PUD_SIZE) {
 		dev_dbg(dev, "alignment (%#x) > fault size (%#x)\n",
-			dax_region->align, fault_size);
+			dev_dax->align, fault_size);
 		return VM_FAULT_SIGBUS;
 	}
 
-	if (fault_size < dax_region->align)
+	if (fault_size < dev_dax->align)
 		return VM_FAULT_SIGBUS;
-	else if (fault_size > dax_region->align)
+	else if (fault_size > dev_dax->align)
 		return VM_FAULT_FALLBACK;
 
 	/* if we are outside of the VMA */
@@ -267,9 +264,8 @@ static int dev_dax_split(struct vm_area_struct *vma, unsigned long addr)
 {
 	struct file *filp = vma->vm_file;
 	struct dev_dax *dev_dax = filp->private_data;
-	struct dax_region *dax_region = dev_dax->region;
 
-	if (!IS_ALIGNED(addr, dax_region->align))
+	if (!IS_ALIGNED(addr, dev_dax->align))
 		return -EINVAL;
 	return 0;
 }
@@ -278,9 +274,8 @@ static unsigned long dev_dax_pagesize(struct vm_area_struct *vma)
 {
 	struct file *filp = vma->vm_file;
 	struct dev_dax *dev_dax = filp->private_data;
-	struct dax_region *dax_region = dev_dax->region;
 
-	return dax_region->align;
+	return dev_dax->align;
 }
 
 static const struct vm_operations_struct dax_vm_ops = {
@@ -319,13 +314,11 @@ static unsigned long dax_get_unmapped_area(struct file *filp,
 {
 	unsigned long off, off_end, off_align, len_align, addr_align, align;
 	struct dev_dax *dev_dax = filp ? filp->private_data : NULL;
-	struct dax_region *dax_region;
 
 	if (!dev_dax || addr)
 		goto out;
 
-	dax_region = dev_dax->region;
-	align = dax_region->align;
+	align = dev_dax->align;
 	off = pgoff << PAGE_SHIFT;
 	off_end = off + len;
 	off_align = round_up(off, align);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
