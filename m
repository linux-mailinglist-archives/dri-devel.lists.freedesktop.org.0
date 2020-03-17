Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F21891D4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 00:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BC06E02A;
	Tue, 17 Mar 2020 23:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8986E02A;
 Tue, 17 Mar 2020 23:14:34 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7159790000>; Tue, 17 Mar 2020 16:12:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 17 Mar 2020 16:14:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 17 Mar 2020 16:14:33 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 17 Mar 2020 23:14:33 +0000
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
To: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de> <20200317124755.GR20941@ziepe.ca>
 <20200317125955.GA12847@lst.de>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com>
Date: Tue, 17 Mar 2020 16:14:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200317125955.GA12847@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: multipart/mixed; boundary="------------908CA79958BE6989593A4D80"
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584486777; bh=zh+iT+c1CSRB1E3aQmzkpVWUdXlfl33aywkBJRIx6hw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language;
 b=P+4gKQeyvCznSFVdl01pSGWsmfDsK5KY9vNuGfBrMuC3iQui6kN7Nk6GDE3PLh7MI
 Hn8In94N7MJy3iPlg7GjmN6nzb8fWIpmEkeLoyI/Yt5vNIvJG+2IsHX0YLrMZcBMcO
 Cb3DYE6LhApkoRCKB9GUmEFy5ZHqd5P0D8U7BZBCpE8qCh4URAnoyB3KLb6kk0tyzn
 HOv1SktfY5CwUP/61SaYeNDsCj2EV6dyFSoBdyb8ia9CcmVyv7v3xa3dT7nuWN5YIP
 0AZJs6u8jP9h4ZTkd2+WIYE1D0Is9GZRkV4LKru/LrX9HECirec8tj8c7iFfqzdQhf
 82Wg6zyq9+qFw==
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------908CA79958BE6989593A4D80
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/17/20 5:59 AM, Christoph Hellwig wrote:
> On Tue, Mar 17, 2020 at 09:47:55AM -0300, Jason Gunthorpe wrote:
>> I've been using v7 of Ralph's tester and it is working well - it has
>> DEVICE_PRIVATE support so I think it can test this flow too. Ralph are
>> you able?
>>
>> This hunk seems trivial enough to me, can we include it now?
> 
> I can send a separate patch for it once the tester covers it.  I don't
> want to add it to the original patch as it is a significant behavior
> change compared to the existing code.
> 

Attached is an updated version of my HMM tests based on linux-5.6.0-rc6.
I ran this OK with Jason's 8+1 HMM patches, Christoph's 1-5 misc HMM clean ups,
and Christoph's 1-4 device private page changes applied.

I'm working on getting my nouveau tests running again on a different test
machine and will report on that when ready.

--------------908CA79958BE6989593A4D80
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-mm-hmm-test-add-self-tests-for-HMM.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
	filename="0001-mm-hmm-test-add-self-tests-for-HMM.patch"

From d499fb343bfa9764695ecdcd759fb16bc1ca3c93 Mon Sep 17 00:00:00 2001
From: Ralph Campbell <rcampbell@nvidia.com>
Date: Tue, 17 Mar 2020 11:10:38 -0700
Subject: [PATCH] mm/hmm/test: add self tests for HMM
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add some basic stand alone self tests for HMM.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jérôme Glisse <jglisse@redhat.com>
---
 MAINTAINERS                            |    3 +
 include/uapi/linux/test_hmm.h          |   59 ++
 lib/Kconfig.debug                      |   12 +
 lib/Makefile                           |    1 +
 lib/test_hmm.c                         | 1210 +++++++++++++++++++++
 tools/testing/selftests/vm/.gitignore  |    1 +
 tools/testing/selftests/vm/Makefile    |    3 +
 tools/testing/selftests/vm/config      |    2 +
 tools/testing/selftests/vm/hmm-tests.c | 1353 ++++++++++++++++++++++++
 tools/testing/selftests/vm/run_vmtests |   16 +
 tools/testing/selftests/vm/test_hmm.sh |   97 ++
 11 files changed, 2757 insertions(+)
 create mode 100644 include/uapi/linux/test_hmm.h
 create mode 100644 lib/test_hmm.c
 create mode 100644 tools/testing/selftests/vm/hmm-tests.c
 create mode 100755 tools/testing/selftests/vm/test_hmm.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index cc1d18cb5d18..98c80a589a52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7608,7 +7608,10 @@ L:	linux-mm@kvack.org
 S:	Maintained
 F:	mm/hmm*
 F:	include/linux/hmm*
+F:	include/uapi/linux/test_hmm*
 F:	Documentation/vm/hmm.rst
+F:	lib/test_hmm*
+F:	tools/testing/selftests/vm/*hmm*
 
 HOST AP DRIVER
 M:	Jouni Malinen <j@w1.fi>
diff --git a/include/uapi/linux/test_hmm.h b/include/uapi/linux/test_hmm.h
new file mode 100644
index 000000000000..8c5f70c160bf
--- /dev/null
+++ b/include/uapi/linux/test_hmm.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * This is a module to test the HMM (Heterogeneous Memory Management) API
+ * of the kernel. It allows a userspace program to expose its entire address
+ * space through the HMM test module device file.
+ */
+#ifndef _UAPI_LINUX_HMM_DMIRROR_H
+#define _UAPI_LINUX_HMM_DMIRROR_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+/*
+ * Structure to pass to the HMM test driver to mimic a device accessing
+ * system memory and ZONE_DEVICE private memory through device page tables.
+ *
+ * @addr: (in) user address the device will read/write
+ * @ptr: (in) user address where device data is copied to/from
+ * @npages: (in) number of pages to read/write
+ * @cpages: (out) number of pages copied
+ * @faults: (out) number of device page faults seen
+ */
+struct hmm_dmirror_cmd {
+	__u64		addr;
+	__u64		ptr;
+	__u64		npages;
+	__u64		cpages;
+	__u64		faults;
+};
+
+/* Expose the address space of the calling process through hmm device file */
+#define HMM_DMIRROR_READ		_IOWR('H', 0x00, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
+
+/*
+ * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
+ * HMM_DMIRROR_PROT_ERROR: no valid mirror PTE for this page
+ * HMM_DMIRROR_PROT_NONE: unpopulated PTE or PTE with no access
+ * HMM_DMIRROR_PROT_READ: read-only PTE
+ * HMM_DMIRROR_PROT_WRITE: read/write PTE
+ * HMM_DMIRROR_PROT_ZERO: special read-only zero page
+ * HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL: Migrated device private page on the
+ *					device the ioctl() is made
+ * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
+ *					other device
+ */
+enum {
+	HMM_DMIRROR_PROT_ERROR			= 0xFF,
+	HMM_DMIRROR_PROT_NONE			= 0x00,
+	HMM_DMIRROR_PROT_READ			= 0x01,
+	HMM_DMIRROR_PROT_WRITE			= 0x02,
+	HMM_DMIRROR_PROT_ZERO			= 0x10,
+	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
+	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
+};
+
+#endif /* _UAPI_LINUX_HMM_DMIRROR_H */
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 69def4a9df00..4d22ce7879a7 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2162,6 +2162,18 @@ config TEST_MEMINIT
 
 	  If unsure, say N.
 
+config TEST_HMM
+	tristate "Test HMM (Heterogeneous Memory Management)"
+	depends on DEVICE_PRIVATE
+	select HMM_MIRROR
+        select MMU_NOTIFIER
+	help
+	  This is a pseudo device driver solely for testing HMM.
+	  Say M here if you want to build the HMM test module.
+	  Doing so will allow you to run tools/testing/selftest/vm/hmm-tests.
+
+	  If unsure, say N.
+
 endif # RUNTIME_TESTING_MENU
 
 config MEMTEST
diff --git a/lib/Makefile b/lib/Makefile
index 611872c06926..c168bdc803dc 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -89,6 +89,7 @@ obj-$(CONFIG_TEST_OBJAGG) += test_objagg.o
 obj-$(CONFIG_TEST_STACKINIT) += test_stackinit.o
 obj-$(CONFIG_TEST_BLACKHOLE_DEV) += test_blackhole_dev.o
 obj-$(CONFIG_TEST_MEMINIT) += test_meminit.o
+obj-$(CONFIG_TEST_HMM) += test_hmm.o
 
 obj-$(CONFIG_TEST_LIVEPATCH) += livepatch/
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
new file mode 100644
index 000000000000..6ca953926dc1
--- /dev/null
+++ b/lib/test_hmm.c
@@ -0,0 +1,1210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This is a module to test the HMM (Heterogeneous Memory Management)
+ * mirror and zone device private memory migration APIs of the kernel.
+ * Userspace programs can register with the driver to mirror their own address
+ * space and can use the device to read/write any valid virtual address.
+ */
+#include <linux/init.h>
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/rwsem.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/highmem.h>
+#include <linux/delay.h>
+#include <linux/pagemap.h>
+#include <linux/hmm.h>
+#include <linux/vmalloc.h>
+#include <linux/swap.h>
+#include <linux/swapops.h>
+#include <linux/sched/mm.h>
+#include <linux/platform_device.h>
+
+#include <uapi/linux/test_hmm.h>
+
+#define DMIRROR_NDEVICES		2
+#define DMIRROR_RANGE_FAULT_TIMEOUT	1000
+#define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
+#define DEVMEM_CHUNKS_RESERVE		16
+
+static const struct dev_pagemap_ops dmirror_devmem_ops;
+static const struct mmu_interval_notifier_ops dmirror_min_ops;
+static dev_t dmirror_dev;
+static struct page *dmirror_zero_page;
+
+struct dmirror_device;
+
+struct dmirror_bounce {
+	void			*ptr;
+	unsigned long		size;
+	unsigned long		addr;
+	unsigned long		cpages;
+};
+
+#define DPT_SHIFT PAGE_SHIFT
+#define DPT_VALID (1UL << 0)
+#define DPT_WRITE (1UL << 1)
+
+#define DPT_XA_TAG_WRITE 3UL
+
+static const uint64_t dmirror_hmm_flags[HMM_PFN_FLAG_MAX] = {
+	[HMM_PFN_VALID] = DPT_VALID,
+	[HMM_PFN_WRITE] = DPT_WRITE,
+};
+
+static const uint64_t dmirror_hmm_values[HMM_PFN_VALUE_MAX] = {
+	[HMM_PFN_NONE]    = 0,
+	[HMM_PFN_ERROR]   = 0x10,
+	[HMM_PFN_SPECIAL] = 0x10,
+};
+
+/*
+ * Data structure to track address ranges and register for mmu interval
+ * notifier updates.
+ */
+struct dmirror_interval {
+	struct mmu_interval_notifier	notifier;
+	struct dmirror			*dmirror;
+};
+
+/*
+ * Data attached to the open device file.
+ * Note that it might be shared after a fork().
+ */
+struct dmirror {
+	struct mm_struct		*mm;
+	struct dmirror_device		*mdevice;
+	struct xarray			pt;
+	struct mmu_interval_notifier	notifier;
+	struct mutex			mutex;
+};
+
+/*
+ * ZONE_DEVICE pages for migration and simulating device memory.
+ */
+struct dmirror_chunk {
+	struct dev_pagemap	pagemap;
+	struct dmirror_device	*mdevice;
+};
+
+/*
+ * Per device data.
+ */
+struct dmirror_device {
+	struct cdev		cdevice;
+	struct hmm_devmem	*devmem;
+
+	unsigned int		devmem_capacity;
+	unsigned int		devmem_count;
+	struct dmirror_chunk	**devmem_chunks;
+	struct mutex		devmem_lock;	/* protects the above */
+
+	unsigned long		calloc;
+	unsigned long		cfree;
+	struct page		*free_pages;
+	spinlock_t		lock;		/* protects the above */
+};
+
+static struct dmirror_device dmirror_devices[DMIRROR_NDEVICES];
+
+static int dmirror_bounce_init(struct dmirror_bounce *bounce,
+			       unsigned long addr,
+			       unsigned long size)
+{
+	bounce->addr = addr;
+	bounce->size = size;
+	bounce->cpages = 0;
+	bounce->ptr = vmalloc(size);
+	if (!bounce->ptr)
+		return -ENOMEM;
+	return 0;
+}
+
+static void dmirror_bounce_fini(struct dmirror_bounce *bounce)
+{
+	vfree(bounce->ptr);
+}
+
+static int dmirror_fops_open(struct inode *inode, struct file *filp)
+{
+	struct cdev *cdev = inode->i_cdev;
+	struct dmirror *dmirror;
+	int ret;
+
+	/* Mirror this process address space */
+	dmirror = kzalloc(sizeof(*dmirror), GFP_KERNEL);
+	if (dmirror == NULL)
+		return -ENOMEM;
+
+	dmirror->mdevice = container_of(cdev, struct dmirror_device, cdevice);
+	mutex_init(&dmirror->mutex);
+	xa_init(&dmirror->pt);
+
+	ret = mmu_interval_notifier_insert(&dmirror->notifier, current->mm,
+				0, ULONG_MAX & PAGE_MASK, &dmirror_min_ops);
+	if (ret) {
+		kfree(dmirror);
+		return ret;
+	}
+
+	/* Pairs with the mmdrop() in dmirror_fops_release(). */
+	mmgrab(current->mm);
+	dmirror->mm = current->mm;
+
+	/* Only the first open registers the address space. */
+	filp->private_data = dmirror;
+	return 0;
+}
+
+static int dmirror_fops_release(struct inode *inode, struct file *filp)
+{
+	struct dmirror *dmirror = filp->private_data;
+
+	mmu_interval_notifier_remove(&dmirror->notifier);
+	mmdrop(dmirror->mm);
+	xa_destroy(&dmirror->pt);
+	kfree(dmirror);
+	return 0;
+}
+
+static inline struct dmirror_device *dmirror_page_to_device(struct page *page)
+
+{
+	struct dmirror_chunk *devmem;
+
+	devmem = container_of(page->pgmap, struct dmirror_chunk, pagemap);
+	return devmem->mdevice;
+}
+
+static bool dmirror_device_is_mine(struct dmirror_device *mdevice,
+				   struct page *page)
+{
+	if (!is_zone_device_page(page))
+		return false;
+	return page->pgmap->ops == &dmirror_devmem_ops &&
+		dmirror_page_to_device(page) == mdevice;
+}
+
+static int dmirror_do_fault(struct dmirror *dmirror, struct hmm_range *range)
+{
+	uint64_t *pfns = range->pfns;
+	unsigned long pfn;
+
+	for (pfn = (range->start >> PAGE_SHIFT);
+	     pfn < (range->end >> PAGE_SHIFT);
+	     pfn++, pfns++) {
+		struct page *page;
+		void *entry;
+
+		/*
+		 * HMM_PFN_ERROR is returned if it is accessing invalid memory
+		 * either because of memory error (hardware detected memory
+		 * corruption) or more likely because of truncate on mmap
+		 * file.
+		 */
+		if (*pfns == range->values[HMM_PFN_ERROR])
+			return -EFAULT;
+		if (!(*pfns & range->flags[HMM_PFN_VALID]))
+			return -EFAULT;
+		page = hmm_device_entry_to_page(range, *pfns);
+		/* We asked for pages to be populated but check anyway. */
+		if (!page)
+			return -EFAULT;
+		if (is_zone_device_page(page)) {
+			/*
+			 * TODO: need a way to ask HMM to fault foreign zone
+			 * device private pages.
+			 */
+			if (!dmirror_device_is_mine(dmirror->mdevice, page))
+				continue;
+		}
+		entry = page;
+		if (*pfns & range->flags[HMM_PFN_WRITE])
+			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+		else if (range->default_flags & range->flags[HMM_PFN_WRITE])
+			return -EFAULT;
+		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
+		if (xa_is_err(entry))
+			return xa_err(entry);
+	}
+
+	return 0;
+}
+
+static void dmirror_do_update(struct dmirror *dmirror, unsigned long start,
+			      unsigned long end)
+{
+	unsigned long pfn;
+
+	/*
+	 * The XArray doesn't hold references to pages since it relies on
+	 * the mmu notifier to clear page pointers when they become stale.
+	 * Therefore, it is OK to just clear the entry.
+	 */
+	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++)
+		xa_erase(&dmirror->pt, pfn);
+}
+
+static bool dmirror_interval_invalidate(struct mmu_interval_notifier *mni,
+				const struct mmu_notifier_range *range,
+				unsigned long cur_seq)
+{
+	struct dmirror *dmirror = container_of(mni, struct dmirror, notifier);
+	struct mm_struct *mm = dmirror->mm;
+
+	/*
+	 * If the process doesn't exist, we don't need to invalidate the
+	 * device page table since the address space will be torn down.
+	 */
+	if (!mmget_not_zero(mm))
+		return true;
+
+	if (mmu_notifier_range_blockable(range))
+		mutex_lock(&dmirror->mutex);
+	else if (!mutex_trylock(&dmirror->mutex))
+		return false;
+
+	mmu_interval_set_seq(mni, cur_seq);
+	dmirror_do_update(dmirror, range->start, range->end);
+
+	mutex_unlock(&dmirror->mutex);
+	mmput(mm);
+	return true;
+}
+
+static const struct mmu_interval_notifier_ops dmirror_min_ops = {
+	.invalidate = dmirror_interval_invalidate,
+};
+
+static int dmirror_range_fault(struct dmirror *dmirror,
+				struct hmm_range *range)
+{
+	struct mm_struct *mm = dmirror->mm;
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	int ret;
+
+	while (true) {
+		long count;
+
+		if (time_after(jiffies, timeout)) {
+			ret = -EBUSY;
+			goto out;
+		}
+
+		range->notifier_seq = mmu_interval_read_begin(range->notifier);
+		down_read(&mm->mmap_sem);
+		count = hmm_range_fault(range, 0);
+		up_read(&mm->mmap_sem);
+		if (count <= 0) {
+			if (count == 0 || count == -EBUSY)
+				continue;
+			ret = count;
+			goto out;
+		}
+
+		mutex_lock(&dmirror->mutex);
+		if (mmu_interval_read_retry(range->notifier,
+					    range->notifier_seq)) {
+			mutex_unlock(&dmirror->mutex);
+			continue;
+		}
+		break;
+	}
+
+	ret = dmirror_do_fault(dmirror, range);
+
+	mutex_unlock(&dmirror->mutex);
+out:
+	return ret;
+}
+
+static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
+			 unsigned long end, bool write)
+{
+	struct mm_struct *mm = dmirror->mm;
+	unsigned long addr;
+	uint64_t pfns[64];
+	struct hmm_range range = {
+		.notifier = &dmirror->notifier,
+		.pfns = pfns,
+		.flags = dmirror_hmm_flags,
+		.values = dmirror_hmm_values,
+		.pfn_shift = DPT_SHIFT,
+		.pfn_flags_mask = ~(dmirror_hmm_flags[HMM_PFN_VALID] |
+				    dmirror_hmm_flags[HMM_PFN_WRITE]),
+		.default_flags = dmirror_hmm_flags[HMM_PFN_VALID] |
+				(write ? dmirror_hmm_flags[HMM_PFN_WRITE] : 0),
+		.dev_private_owner = dmirror->mdevice,
+	};
+	int ret = 0;
+
+	/* Since the mm is for the mirrored process, get a reference first. */
+	if (!mmget_not_zero(mm))
+		return 0;
+
+	for (addr = start; addr < end; addr = range.end) {
+		range.start = addr;
+		range.end = min(addr + (ARRAY_SIZE(pfns) << PAGE_SHIFT), end);
+
+		ret = dmirror_range_fault(dmirror, &range);
+		if (ret)
+			break;
+	}
+
+	mmput(mm);
+	return ret;
+}
+
+static int dmirror_do_read(struct dmirror *dmirror, unsigned long start,
+			   unsigned long end, struct dmirror_bounce *bounce)
+{
+	unsigned long pfn;
+	void *ptr;
+
+	ptr = bounce->ptr + ((start - bounce->addr) & PAGE_MASK);
+
+	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++) {
+		void *entry;
+		struct page *page;
+		void *tmp;
+
+		entry = xa_load(&dmirror->pt, pfn);
+		page = xa_untag_pointer(entry);
+		if (!page)
+			return -ENOENT;
+
+		tmp = kmap(page);
+		memcpy(ptr, tmp, PAGE_SIZE);
+		kunmap(page);
+
+		ptr += PAGE_SIZE;
+		bounce->cpages++;
+	}
+
+	return 0;
+}
+
+static int dmirror_read(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
+{
+	struct dmirror_bounce bounce;
+	unsigned long start, end;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	int ret;
+
+	start = cmd->addr;
+	end = start + size;
+	if (end < start)
+		return -EINVAL;
+
+	ret = dmirror_bounce_init(&bounce, start, size);
+	if (ret)
+		return ret;
+
+again:
+	mutex_lock(&dmirror->mutex);
+	ret = dmirror_do_read(dmirror, start, end, &bounce);
+	mutex_unlock(&dmirror->mutex);
+	if (ret == 0)
+		ret = copy_to_user((void __user *)cmd->ptr, bounce.ptr,
+					bounce.size);
+	else if (ret == -ENOENT) {
+		start = cmd->addr + (bounce.cpages << PAGE_SHIFT);
+		ret = dmirror_fault(dmirror, start, end, false);
+		if (ret == 0) {
+			cmd->faults++;
+			goto again;
+		}
+	}
+
+	cmd->cpages = bounce.cpages;
+	dmirror_bounce_fini(&bounce);
+	return ret;
+}
+
+static int dmirror_do_write(struct dmirror *dmirror, unsigned long start,
+			    unsigned long end, struct dmirror_bounce *bounce)
+{
+	unsigned long pfn;
+	void *ptr;
+
+	ptr = bounce->ptr + ((start - bounce->addr) & PAGE_MASK);
+
+	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++) {
+		void *entry;
+		struct page *page;
+		void *tmp;
+
+		entry = xa_load(&dmirror->pt, pfn);
+		page = xa_untag_pointer(entry);
+		if (!page || xa_pointer_tag(entry) != DPT_XA_TAG_WRITE)
+			return -ENOENT;
+
+		tmp = kmap(page);
+		memcpy(tmp, ptr, PAGE_SIZE);
+		kunmap(page);
+
+		ptr += PAGE_SIZE;
+		bounce->cpages++;
+	}
+
+	return 0;
+}
+
+static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
+{
+	struct dmirror_bounce bounce;
+	unsigned long start, end;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	int ret;
+
+	start = cmd->addr;
+	end = start + size;
+	if (end < start)
+		return -EINVAL;
+
+	ret = dmirror_bounce_init(&bounce, start, size);
+	if (ret)
+		return ret;
+	ret = copy_from_user(bounce.ptr, (void __user *)cmd->ptr,
+				bounce.size);
+	if (ret)
+		return ret;
+
+again:
+	mutex_lock(&dmirror->mutex);
+	ret = dmirror_do_write(dmirror, start, end, &bounce);
+	mutex_unlock(&dmirror->mutex);
+	if (ret == -ENOENT) {
+		start = cmd->addr + (bounce.cpages << PAGE_SHIFT);
+		ret = dmirror_fault(dmirror, start, end, true);
+		if (ret == 0) {
+			cmd->faults++;
+			goto again;
+		}
+	}
+
+	cmd->cpages = bounce.cpages;
+	dmirror_bounce_fini(&bounce);
+	return ret;
+}
+
+static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
+				   struct page **ppage)
+{
+	struct dmirror_chunk *devmem;
+	struct resource *res;
+	unsigned long pfn;
+	unsigned long pfn_first;
+	unsigned long pfn_last;
+	void *ptr;
+
+	mutex_lock(&mdevice->devmem_lock);
+
+	if (mdevice->devmem_count == mdevice->devmem_capacity) {
+		struct dmirror_chunk **new_chunks;
+		unsigned int new_capacity;
+
+		new_capacity = mdevice->devmem_capacity +
+				DEVMEM_CHUNKS_RESERVE;
+		new_chunks = krealloc(mdevice->devmem_chunks,
+				sizeof(new_chunks[0]) * new_capacity,
+				GFP_KERNEL);
+		if (!new_chunks)
+			goto err;
+		mdevice->devmem_capacity = new_capacity;
+		mdevice->devmem_chunks = new_chunks;
+	}
+
+	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
+					"hmm_dmirror");
+	if (IS_ERR(res))
+		goto err;
+
+	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
+	if (!devmem)
+		goto err;
+
+	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
+	devmem->pagemap.res = *res;
+	devmem->pagemap.ops = &dmirror_devmem_ops;
+	devmem->pagemap.owner = mdevice;
+
+	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
+	if (IS_ERR(ptr))
+		goto err_free;
+
+	devmem->mdevice = mdevice;
+	pfn_first = devmem->pagemap.res.start >> PAGE_SHIFT;
+	pfn_last = pfn_first +
+		(resource_size(&devmem->pagemap.res) >> PAGE_SHIFT);
+	mdevice->devmem_chunks[mdevice->devmem_count++] = devmem;
+
+	mutex_unlock(&mdevice->devmem_lock);
+
+	pr_info("added new %u MB chunk (total %u chunks, %u MB) PFNs [0x%lx 0x%lx)\n",
+		DEVMEM_CHUNK_SIZE / (1024 * 1024),
+		mdevice->devmem_count,
+		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
+		pfn_first, pfn_last);
+
+	spin_lock(&mdevice->lock);
+	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
+		struct page *page = pfn_to_page(pfn);
+
+		page->zone_device_data = mdevice->free_pages;
+		mdevice->free_pages = page;
+	}
+	if (ppage) {
+		*ppage = mdevice->free_pages;
+		mdevice->free_pages = (*ppage)->zone_device_data;
+		mdevice->calloc++;
+	}
+	spin_unlock(&mdevice->lock);
+
+	return true;
+
+err_free:
+	kfree(devmem);
+err:
+	mutex_unlock(&mdevice->devmem_lock);
+	return false;
+}
+
+static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
+{
+	struct page *dpage = NULL;
+	struct page *rpage;
+
+	/*
+	 * This is a fake device so we alloc real system memory to store
+	 * our device memory.
+	 */
+	rpage = alloc_page(GFP_HIGHUSER);
+	if (!rpage)
+		return NULL;
+
+	spin_lock(&mdevice->lock);
+
+	if (mdevice->free_pages) {
+		dpage = mdevice->free_pages;
+		mdevice->free_pages = dpage->zone_device_data;
+		mdevice->calloc++;
+		spin_unlock(&mdevice->lock);
+	} else {
+		spin_unlock(&mdevice->lock);
+		if (!dmirror_allocate_chunk(mdevice, &dpage))
+			goto error;
+	}
+
+	dpage->zone_device_data = rpage;
+	get_page(dpage);
+	lock_page(dpage);
+	return dpage;
+
+error:
+	__free_page(rpage);
+	return NULL;
+}
+
+static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
+					   struct dmirror *dmirror)
+{
+	struct dmirror_device *mdevice = dmirror->mdevice;
+	const unsigned long *src = args->src;
+	unsigned long *dst = args->dst;
+	unsigned long addr;
+
+	for (addr = args->start; addr < args->end; addr += PAGE_SIZE,
+						   src++, dst++) {
+		struct page *spage;
+		struct page *dpage;
+		struct page *rpage;
+
+		if (!(*src & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		/*
+		 * Note that spage might be NULL which is OK since it is an
+		 * unallocated pte_none() or read-only zero page.
+		 */
+		spage = migrate_pfn_to_page(*src);
+
+		/*
+		 * Don't migrate device private pages from our own driver or
+		 * others. For our own we would do a device private memory copy
+		 * not a migration and for others, we would need to fault the
+		 * other device's page into system memory first.
+		 */
+		if (spage && is_zone_device_page(spage))
+			continue;
+
+		dpage = dmirror_devmem_alloc_page(mdevice);
+		if (!dpage)
+			continue;
+
+		rpage = dpage->zone_device_data;
+		if (spage)
+			copy_highpage(rpage, spage);
+		else
+			clear_highpage(rpage);
+
+		/*
+		 * Normally, a device would use the page->zone_device_data to
+		 * point to the mirror but here we use it to hold the page for
+		 * the simulated device memory and that page holds the pointer
+		 * to the mirror.
+		 */
+		rpage->zone_device_data = dmirror;
+
+		*dst = migrate_pfn(page_to_pfn(dpage)) |
+			    MIGRATE_PFN_LOCKED;
+		if ((*src & MIGRATE_PFN_WRITE) ||
+		    (!spage && args->vma->vm_flags & VM_WRITE))
+			*dst |= MIGRATE_PFN_WRITE;
+	}
+}
+
+static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
+					    struct dmirror *dmirror)
+{
+	unsigned long start = args->start;
+	unsigned long end = args->end;
+	const unsigned long *src = args->src;
+	const unsigned long *dst = args->dst;
+	unsigned long pfn;
+
+	/* Map the migrated pages into the device's page tables. */
+	mutex_lock(&dmirror->mutex);
+
+	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++,
+								src++, dst++) {
+		struct page *dpage;
+		void *entry;
+
+		if (!(*src & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		dpage = migrate_pfn_to_page(*dst);
+		if (!dpage)
+			continue;
+
+		/*
+		 * Store the page that holds the data so the page table
+		 * doesn't have to deal with ZONE_DEVICE private pages.
+		 */
+		entry = dpage->zone_device_data;
+		if (*dst & MIGRATE_PFN_WRITE)
+			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
+		if (xa_is_err(entry))
+			return xa_err(entry);
+	}
+
+	mutex_unlock(&dmirror->mutex);
+	return 0;
+}
+
+static int dmirror_migrate(struct dmirror *dmirror,
+			   struct hmm_dmirror_cmd *cmd)
+{
+	unsigned long start, end, addr;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	struct mm_struct *mm = dmirror->mm;
+	struct vm_area_struct *vma;
+	unsigned long src_pfns[64];
+	unsigned long dst_pfns[64];
+	struct dmirror_bounce bounce;
+	struct migrate_vma args;
+	unsigned long next;
+	int ret;
+
+	start = cmd->addr;
+	end = start + size;
+	if (end < start)
+		return -EINVAL;
+
+	/* Since the mm is for the mirrored process, get a reference first. */
+	if (!mmget_not_zero(mm))
+		return -EINVAL;
+
+	down_read(&mm->mmap_sem);
+	for (addr = start; addr < end; addr = next) {
+		vma = find_vma(mm, addr);
+		if (!vma || addr < vma->vm_start) {
+			ret = -EINVAL;
+			goto out;
+		}
+		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		if (next > vma->vm_end)
+			next = vma->vm_end;
+
+		args.vma = vma;
+		args.src = src_pfns;
+		args.dst = dst_pfns;
+		args.start = addr;
+		args.end = next;
+		args.src_owner = NULL;
+		ret = migrate_vma_setup(&args);
+		if (ret)
+			goto out;
+
+		dmirror_migrate_alloc_and_copy(&args, dmirror);
+		migrate_vma_pages(&args);
+		dmirror_migrate_finalize_and_map(&args, dmirror);
+		migrate_vma_finalize(&args);
+	}
+	up_read(&mm->mmap_sem);
+	mmput(mm);
+
+	/* Return the migrated data for verification. */
+	ret = dmirror_bounce_init(&bounce, start, size);
+	if (ret)
+		return ret;
+	mutex_lock(&dmirror->mutex);
+	ret = dmirror_do_read(dmirror, start, end, &bounce);
+	mutex_unlock(&dmirror->mutex);
+	if (ret == 0)
+		ret = copy_to_user((void __user *)cmd->ptr, bounce.ptr,
+					bounce.size);
+	cmd->cpages = bounce.cpages;
+	dmirror_bounce_fini(&bounce);
+	return ret;
+
+out:
+	up_read(&mm->mmap_sem);
+	mmput(mm);
+	return ret;
+}
+
+static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
+			    unsigned char *perm, uint64_t entry)
+{
+	struct page *page;
+
+	if (entry == range->values[HMM_PFN_ERROR]) {
+		*perm = HMM_DMIRROR_PROT_ERROR;
+		return;
+	}
+	page = hmm_device_entry_to_page(range, entry);
+	if (!page) {
+		*perm = HMM_DMIRROR_PROT_NONE;
+		return;
+	}
+	if (is_device_private_page(page)) {
+		/* Is the page migrated to this device or some other? */
+		if (dmirror->mdevice == dmirror_page_to_device(page))
+			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
+		else
+			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
+	} else if (is_zero_pfn(page_to_pfn(page)))
+		*perm = HMM_DMIRROR_PROT_ZERO;
+	else
+		*perm = HMM_DMIRROR_PROT_NONE;
+	if (entry & range->flags[HMM_PFN_WRITE])
+		*perm |= HMM_DMIRROR_PROT_WRITE;
+	else
+		*perm |= HMM_DMIRROR_PROT_READ;
+}
+
+static bool dmirror_snapshot_invalidate(struct mmu_interval_notifier *mni,
+				const struct mmu_notifier_range *range,
+				unsigned long cur_seq)
+{
+	struct dmirror_interval *dmi =
+		container_of(mni, struct dmirror_interval, notifier);
+	struct dmirror *dmirror = dmi->dmirror;
+
+	if (mmu_notifier_range_blockable(range))
+		mutex_lock(&dmirror->mutex);
+	else if (!mutex_trylock(&dmirror->mutex))
+		return false;
+
+	/*
+	 * Snapshots only need to set the sequence number since any
+	 * invalidation in the interval invalidates the whole snapshot.
+	 */
+	mmu_interval_set_seq(mni, cur_seq);
+
+	mutex_unlock(&dmirror->mutex);
+	return true;
+}
+
+static const struct mmu_interval_notifier_ops dmirror_mrn_ops = {
+	.invalidate = dmirror_snapshot_invalidate,
+};
+
+static int dmirror_range_snapshot(struct dmirror *dmirror,
+				  struct hmm_range *range,
+				  unsigned char *perm)
+{
+	struct mm_struct *mm = dmirror->mm;
+	struct dmirror_interval notifier;
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long i;
+	unsigned long n;
+	int ret = 0;
+
+	notifier.dmirror = dmirror;
+	range->notifier = &notifier.notifier;
+
+	ret = mmu_interval_notifier_insert(range->notifier, mm,
+			range->start, range->end - range->start,
+			&dmirror_mrn_ops);
+	if (ret)
+		return ret;
+
+	while (true) {
+		long count;
+
+		if (time_after(jiffies, timeout)) {
+			ret = -EBUSY;
+			goto out;
+		}
+
+		range->notifier_seq = mmu_interval_read_begin(range->notifier);
+
+		down_read(&mm->mmap_sem);
+		count = hmm_range_fault(range, HMM_FAULT_SNAPSHOT);
+		up_read(&mm->mmap_sem);
+		if (count <= 0) {
+			if (count == 0 || count == -EBUSY)
+				continue;
+			ret = count;
+			goto out;
+		}
+
+		mutex_lock(&dmirror->mutex);
+		if (mmu_interval_read_retry(range->notifier,
+					    range->notifier_seq)) {
+			mutex_unlock(&dmirror->mutex);
+			continue;
+		}
+		break;
+	}
+
+	n = (range->end - range->start) >> PAGE_SHIFT;
+	for (i = 0; i < n; i++)
+		dmirror_mkentry(dmirror, range, perm + i, range->pfns[i]);
+
+	mutex_unlock(&dmirror->mutex);
+out:
+	mmu_interval_notifier_remove(range->notifier);
+	return ret;
+}
+
+static int dmirror_snapshot(struct dmirror *dmirror,
+			    struct hmm_dmirror_cmd *cmd)
+{
+	struct mm_struct *mm = dmirror->mm;
+	unsigned long start, end;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	unsigned long addr;
+	unsigned long next;
+	uint64_t pfns[64];
+	unsigned char perm[64];
+	char __user *uptr;
+	struct hmm_range range = {
+		.pfns = pfns,
+		.flags = dmirror_hmm_flags,
+		.values = dmirror_hmm_values,
+		.pfn_shift = DPT_SHIFT,
+		.pfn_flags_mask = ~0ULL,
+		.dev_private_owner = dmirror->mdevice,
+	};
+	int ret = 0;
+
+	start = cmd->addr;
+	end = start + size;
+	if (end < start)
+		return -EINVAL;
+
+	/* Since the mm is for the mirrored process, get a reference first. */
+	if (!mmget_not_zero(mm))
+		return -EINVAL;
+
+	/*
+	 * Register a temporary notifier to detect invalidations even if it
+	 * overlaps with other mmu_interval_notifiers.
+	 */
+	uptr = (void __user *)cmd->ptr;
+	for (addr = start; addr < end; addr = next) {
+		unsigned long n;
+
+		next = min(addr + (ARRAY_SIZE(pfns) << PAGE_SHIFT), end);
+		range.start = addr;
+		range.end = next;
+
+		ret = dmirror_range_snapshot(dmirror, &range, perm);
+		if (ret)
+			break;
+
+		n = (range.end - range.start) >> PAGE_SHIFT;
+		ret = copy_to_user(uptr, perm, n);
+		if (ret)
+			break;
+
+		cmd->cpages += n;
+		uptr += n;
+	}
+	mmput(mm);
+
+	return ret;
+}
+
+static long dmirror_fops_unlocked_ioctl(struct file *filp,
+					unsigned int command,
+					unsigned long arg)
+{
+	void __user *uarg = (void __user *)arg;
+	struct hmm_dmirror_cmd cmd;
+	struct dmirror *dmirror;
+	int ret;
+
+	dmirror = filp->private_data;
+	if (!dmirror)
+		return -EINVAL;
+
+	ret = copy_from_user(&cmd, uarg, sizeof(cmd));
+	if (ret)
+		return ret;
+
+	if (cmd.addr & ~PAGE_MASK)
+		return -EINVAL;
+	if (cmd.addr >= (cmd.addr + (cmd.npages << PAGE_SHIFT)))
+		return -EINVAL;
+
+	cmd.cpages = 0;
+	cmd.faults = 0;
+
+	switch (command) {
+	case HMM_DMIRROR_READ:
+		ret = dmirror_read(dmirror, &cmd);
+		break;
+
+	case HMM_DMIRROR_WRITE:
+		ret = dmirror_write(dmirror, &cmd);
+		break;
+
+	case HMM_DMIRROR_MIGRATE:
+		ret = dmirror_migrate(dmirror, &cmd);
+		break;
+
+	case HMM_DMIRROR_SNAPSHOT:
+		ret = dmirror_snapshot(dmirror, &cmd);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+	if (ret)
+		return ret;
+
+	return copy_to_user(uarg, &cmd, sizeof(cmd));
+}
+
+static const struct file_operations dmirror_fops = {
+	.open		= dmirror_fops_open,
+	.release	= dmirror_fops_release,
+	.unlocked_ioctl = dmirror_fops_unlocked_ioctl,
+	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
+};
+
+static void dmirror_devmem_free(struct page *page)
+{
+	struct page *rpage = page->zone_device_data;
+	struct dmirror_device *mdevice;
+
+	if (rpage)
+		__free_page(rpage);
+
+	mdevice = dmirror_page_to_device(page);
+
+	spin_lock(&mdevice->lock);
+	mdevice->cfree++;
+	page->zone_device_data = mdevice->free_pages;
+	mdevice->free_pages = page;
+	spin_unlock(&mdevice->lock);
+}
+
+static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
+						struct dmirror_device *mdevice)
+{
+	struct vm_area_struct *vma = args->vma;
+	const unsigned long *src = args->src;
+	unsigned long *dst = args->dst;
+	unsigned long start = args->start;
+	unsigned long end = args->end;
+	unsigned long addr;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE,
+				       src++, dst++) {
+		struct page *dpage, *spage;
+
+		spage = migrate_pfn_to_page(*src);
+		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
+			continue;
+		if (!dmirror_device_is_mine(mdevice, spage))
+			continue;
+		spage = spage->zone_device_data;
+
+		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, vma, addr);
+		if (!dpage)
+			continue;
+
+		lock_page(dpage);
+		copy_highpage(dpage, spage);
+		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+	}
+	return 0;
+}
+
+static void dmirror_devmem_fault_finalize_and_map(struct migrate_vma *args,
+						  struct dmirror *dmirror)
+{
+	/* Invalidate the device's page table mapping. */
+	mutex_lock(&dmirror->mutex);
+	dmirror_do_update(dmirror, args->start, args->end);
+	mutex_unlock(&dmirror->mutex);
+}
+
+static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
+{
+	struct migrate_vma args;
+	unsigned long src_pfns;
+	unsigned long dst_pfns;
+	struct page *rpage;
+	struct dmirror *dmirror;
+	vm_fault_t ret;
+
+	/*
+	 * Normally, a device would use the page->zone_device_data to point to
+	 * the mirror but here we use it to hold the page for the simulated
+	 * device memory and that page holds the pointer to the mirror.
+	 */
+	rpage = vmf->page->zone_device_data;
+	dmirror = rpage->zone_device_data;
+
+	/* FIXME demonstrate how we can adjust migrate range */
+	args.vma = vmf->vma;
+	args.start = vmf->address;
+	args.end = args.start + PAGE_SIZE;
+	args.src = &src_pfns;
+	args.dst = &dst_pfns;
+	args.src_owner = dmirror->mdevice;
+
+	if (migrate_vma_setup(&args))
+		return VM_FAULT_SIGBUS;
+
+	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror->mdevice);
+	if (ret)
+		return ret;
+	migrate_vma_pages(&args);
+	dmirror_devmem_fault_finalize_and_map(&args, dmirror);
+	migrate_vma_finalize(&args);
+	return 0;
+}
+
+static const struct dev_pagemap_ops dmirror_devmem_ops = {
+	.page_free	= dmirror_devmem_free,
+	.migrate_to_ram	= dmirror_devmem_fault,
+};
+
+static int dmirror_device_init(struct dmirror_device *mdevice, int id)
+{
+	dev_t dev;
+	int ret;
+
+	dev = MKDEV(MAJOR(dmirror_dev), id);
+	mutex_init(&mdevice->devmem_lock);
+	spin_lock_init(&mdevice->lock);
+
+	cdev_init(&mdevice->cdevice, &dmirror_fops);
+	ret = cdev_add(&mdevice->cdevice, dev, 1);
+	if (ret)
+		return ret;
+
+	/* Build a list of free ZONE_DEVICE private struct pages */
+	dmirror_allocate_chunk(mdevice, NULL);
+
+	return 0;
+}
+
+static void dmirror_device_remove(struct dmirror_device *mdevice)
+{
+	unsigned int i;
+
+	if (mdevice->devmem_chunks) {
+		for (i = 0; i < mdevice->devmem_count; i++) {
+			struct dmirror_chunk *devmem =
+				mdevice->devmem_chunks[i];
+
+			memunmap_pages(&devmem->pagemap);
+			kfree(devmem);
+		}
+		kfree(mdevice->devmem_chunks);
+	}
+
+	cdev_del(&mdevice->cdevice);
+}
+
+static int __init hmm_dmirror_init(void)
+{
+	int ret;
+	int id;
+
+	ret = alloc_chrdev_region(&dmirror_dev, 0, DMIRROR_NDEVICES,
+				  "HMM_DMIRROR");
+	if (ret)
+		goto err_unreg;
+
+	for (id = 0; id < DMIRROR_NDEVICES; id++) {
+		ret = dmirror_device_init(dmirror_devices + id, id);
+		if (ret)
+			goto err_chrdev;
+	}
+
+	/*
+	 * Allocate a zero page to simulate a reserved page of device private
+	 * memory which is always zero. The zero_pfn page isn't used just to
+	 * make the code here simpler (i.e., we need a struct page for it).
+	 */
+	dmirror_zero_page = alloc_page(GFP_HIGHUSER | __GFP_ZERO);
+	if (!dmirror_zero_page)
+		goto err_chrdev;
+
+	pr_info("HMM test module loaded. This is only for testing HMM.\n");
+	return 0;
+
+err_chrdev:
+	while (--id >= 0)
+		dmirror_device_remove(dmirror_devices + id);
+	unregister_chrdev_region(dmirror_dev, DMIRROR_NDEVICES);
+err_unreg:
+	return ret;
+}
+
+static void __exit hmm_dmirror_exit(void)
+{
+	int id;
+
+	if (dmirror_zero_page)
+		__free_page(dmirror_zero_page);
+	for (id = 0; id < DMIRROR_NDEVICES; id++)
+		dmirror_device_remove(dmirror_devices + id);
+	unregister_chrdev_region(dmirror_dev, DMIRROR_NDEVICES);
+}
+
+module_init(hmm_dmirror_init);
+module_exit(hmm_dmirror_exit);
+MODULE_LICENSE("GPL");
diff --git a/tools/testing/selftests/vm/.gitignore b/tools/testing/selftests/vm/.gitignore
index 31b3c98b6d34..3054565b3f07 100644
--- a/tools/testing/selftests/vm/.gitignore
+++ b/tools/testing/selftests/vm/.gitignore
@@ -14,3 +14,4 @@ virtual_address_range
 gup_benchmark
 va_128TBswitch
 map_fixed_noreplace
+hmm-tests
diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 7f9a8a8c31da..3fadab99d991 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -7,6 +7,7 @@ CFLAGS = -Wall -I ../../../../usr/include $(EXTRA_CFLAGS)
 LDLIBS = -lrt
 TEST_GEN_FILES = compaction_test
 TEST_GEN_FILES += gup_benchmark
+TEST_GEN_FILES += hmm-tests
 TEST_GEN_FILES += hugepage-mmap
 TEST_GEN_FILES += hugepage-shm
 TEST_GEN_FILES += map_hugetlb
@@ -31,6 +32,8 @@ TEST_FILES := test_vmalloc.sh
 KSFT_KHDR_INSTALL := 1
 include ../lib.mk
 
+$(OUTPUT)/hmm-tests: LDLIBS += -lhugetlbfs -lpthread
+
 $(OUTPUT)/userfaultfd: LDLIBS += -lpthread
 
 $(OUTPUT)/mlock-random-test: LDLIBS += -lcap
diff --git a/tools/testing/selftests/vm/config b/tools/testing/selftests/vm/config
index 93b90a9b1eeb..f6d0adad739f 100644
--- a/tools/testing/selftests/vm/config
+++ b/tools/testing/selftests/vm/config
@@ -1,3 +1,5 @@
 CONFIG_SYSVIPC=y
 CONFIG_USERFAULTFD=y
 CONFIG_TEST_VMALLOC=m
+CONFIG_HMM_MIRROR=y
+CONFIG_DEVICE_PRIVATE=y
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
new file mode 100644
index 000000000000..033a12c7ab5b
--- /dev/null
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -0,0 +1,1353 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HMM stands for Heterogeneous Memory Management, it is a helper layer inside
+ * the linux kernel to help device drivers mirror a process address space in
+ * the device. This allows the device to use the same address space which
+ * makes communication and data exchange a lot easier.
+ *
+ * This framework's sole purpose is to exercise various code paths inside
+ * the kernel to make sure that HMM performs as expected and to flush out any
+ * bugs.
+ */
+
+#include "../kselftest_harness.h"
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <strings.h>
+#include <time.h>
+#include <pthread.h>
+#include <hugetlbfs.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include <sys/ioctl.h>
+#include <linux/test_hmm.h>
+
+struct hmm_buffer {
+	void		*ptr;
+	void		*mirror;
+	unsigned long	size;
+	int		fd;
+	uint64_t	cpages;
+	uint64_t	faults;
+};
+
+#define TWOMEG		(1 << 21)
+#define HMM_BUFFER_SIZE (1024 << 12)
+#define HMM_PATH_MAX    64
+#define NTIMES		256
+
+#define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
+
+FIXTURE(hmm)
+{
+	int		fd;
+	unsigned int	page_size;
+	unsigned int	page_shift;
+};
+
+FIXTURE(hmm2)
+{
+	int		fd0;
+	int		fd1;
+	unsigned int	page_size;
+	unsigned int	page_shift;
+};
+
+static int hmm_open(int unit)
+{
+	char pathname[HMM_PATH_MAX];
+	int fd;
+
+	snprintf(pathname, sizeof(pathname), "/dev/hmm_dmirror%d", unit);
+	fd = open(pathname, O_RDWR, 0);
+	if (fd < 0)
+		fprintf(stderr, "could not open hmm dmirror driver (%s)\n",
+			pathname);
+	return fd;
+}
+
+FIXTURE_SETUP(hmm)
+{
+	self->page_size = sysconf(_SC_PAGE_SIZE);
+	self->page_shift = ffs(self->page_size) - 1;
+
+	self->fd = hmm_open(0);
+	ASSERT_GE(self->fd, 0);
+}
+
+FIXTURE_SETUP(hmm2)
+{
+	self->page_size = sysconf(_SC_PAGE_SIZE);
+	self->page_shift = ffs(self->page_size) - 1;
+
+	self->fd0 = hmm_open(0);
+	ASSERT_GE(self->fd0, 0);
+	self->fd1 = hmm_open(1);
+	ASSERT_GE(self->fd1, 0);
+}
+
+FIXTURE_TEARDOWN(hmm)
+{
+	int ret = close(self->fd);
+
+	ASSERT_EQ(ret, 0);
+	self->fd = -1;
+}
+
+FIXTURE_TEARDOWN(hmm2)
+{
+	int ret = close(self->fd0);
+
+	ASSERT_EQ(ret, 0);
+	self->fd0 = -1;
+
+	ret = close(self->fd1);
+	ASSERT_EQ(ret, 0);
+	self->fd1 = -1;
+}
+
+static int hmm_dmirror_cmd(int fd,
+			   unsigned long request,
+			   struct hmm_buffer *buffer,
+			   unsigned long npages)
+{
+	struct hmm_dmirror_cmd cmd;
+	int ret;
+
+	/* Simulate a device reading system memory. */
+	cmd.addr = (__u64)buffer->ptr;
+	cmd.ptr = (__u64)buffer->mirror;
+	cmd.npages = npages;
+
+	for (;;) {
+		ret = ioctl(fd, request, &cmd);
+		if (ret == 0)
+			break;
+		if (errno == EINTR)
+			continue;
+		return -errno;
+	}
+	buffer->cpages = cmd.cpages;
+	buffer->faults = cmd.faults;
+
+	return 0;
+}
+
+static void hmm_buffer_free(struct hmm_buffer *buffer)
+{
+	if (buffer == NULL)
+		return;
+
+	if (buffer->ptr)
+		munmap(buffer->ptr, buffer->size);
+	free(buffer->mirror);
+	free(buffer);
+}
+
+/*
+ * Create a temporary file that will be deleted on close.
+ */
+static int hmm_create_file(unsigned long size)
+{
+	char path[HMM_PATH_MAX];
+	int fd;
+
+	strcpy(path, "/tmp");
+	fd = open(path, O_TMPFILE | O_EXCL | O_RDWR, 0600);
+	if (fd >= 0) {
+		int r;
+
+		do {
+			r = ftruncate(fd, size);
+		} while (r == -1 && errno == EINTR);
+		if (!r)
+			return fd;
+		close(fd);
+	}
+	return -1;
+}
+
+/*
+ * Return a random unsigned number.
+ */
+static unsigned int hmm_random(void)
+{
+	static int fd = -1;
+	unsigned int r;
+
+	if (fd < 0) {
+		fd = open("/dev/urandom", O_RDONLY);
+		if (fd < 0) {
+			fprintf(stderr, "%s:%d failed to open /dev/urandom\n",
+					__FILE__, __LINE__);
+			return ~0U;
+		}
+	}
+	read(fd, &r, sizeof(r));
+	return r;
+}
+
+static void hmm_nanosleep(unsigned int n)
+{
+	struct timespec t;
+
+	t.tv_sec = 0;
+	t.tv_nsec = n;
+	nanosleep(&t, NULL);
+}
+
+/*
+ * Simple NULL test of device open/close.
+ */
+TEST_F(hmm, open_close)
+{
+}
+
+/*
+ * Read private anonymous memory.
+ */
+TEST_F(hmm, anon_read)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+	int val;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/*
+	 * Initialize buffer in system memory but leave the first two pages
+	 * zero (pte_none and pfn_zero).
+	 */
+	i = 2 * self->page_size / sizeof(*ptr);
+	for (ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Set buffer permission to read-only. */
+	ret = mprotect(buffer->ptr, size, PROT_READ);
+	ASSERT_EQ(ret, 0);
+
+	/* Populate the CPU page table with a special zero page. */
+	val = *(int *)(buffer->ptr + self->page_size);
+	ASSERT_EQ(val, 0);
+
+	/* Simulate a device reading system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_READ, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device read. */
+	ptr = buffer->mirror;
+	for (i = 0; i < 2 * self->page_size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+	for (; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Read private anonymous memory which has been protected with
+ * mprotect() PROT_NONE.
+ */
+TEST_F(hmm, anon_read_prot)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Initialize mirror buffer so we can verify it isn't written. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ptr[i] = -i;
+
+	/* Protect buffer from reading. */
+	ret = mprotect(buffer->ptr, size, PROT_NONE);
+	ASSERT_EQ(ret, 0);
+
+	/* Simulate a device reading system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_READ, buffer, npages);
+	ASSERT_EQ(ret, -EFAULT);
+
+	/* Allow CPU to read the buffer so we can check it. */
+	ret = mprotect(buffer->ptr, size, PROT_READ);
+	ASSERT_EQ(ret, 0);
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], -i);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Write private anonymous memory.
+ */
+TEST_F(hmm, anon_write)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize data that the device will write to buffer->ptr. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device wrote. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Write private anonymous memory which has been protected with
+ * mprotect() PROT_READ.
+ */
+TEST_F(hmm, anon_write_prot)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Simulate a device reading a zero page of memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_READ, buffer, 1);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, 1);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Initialize data that the device will write to buffer->ptr. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, -EPERM);
+
+	/* Check what the device wrote. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Now allow writing and see that the zero page is replaced. */
+	ret = mprotect(buffer->ptr, size, PROT_WRITE | PROT_READ);
+	ASSERT_EQ(ret, 0);
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device wrote. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Check that a device writing an anonymous private mapping
+ * will copy-on-write if a child process inherits the mapping.
+ */
+TEST_F(hmm, anon_write_child)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	pid_t pid;
+	int child_fd;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer->ptr so we can tell if it is written. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Initialize data that the device will write to buffer->ptr. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ptr[i] = -i;
+
+	pid = fork();
+	if (pid == -1)
+		ASSERT_EQ(pid, 0);
+	if (pid != 0) {
+		waitpid(pid, &ret, 0);
+		ASSERT_EQ(WIFEXITED(ret), 1);
+
+		/* Check that the parent's buffer did not change. */
+		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+			ASSERT_EQ(ptr[i], i);
+		return;
+	}
+
+	/* Check that we see the parent's values. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], -i);
+
+	/* The child process needs its own mirror to its own mm. */
+	child_fd = hmm_open(0);
+	ASSERT_GE(child_fd, 0);
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(child_fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device wrote. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], -i);
+
+	close(child_fd);
+	exit(0);
+}
+
+/*
+ * Check that a device writing an anonymous shared mapping
+ * will not copy-on-write if a child process inherits the mapping.
+ */
+TEST_F(hmm, anon_write_child_shared)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	pid_t pid;
+	int child_fd;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_SHARED | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer->ptr so we can tell if it is written. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Initialize data that the device will write to buffer->ptr. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ptr[i] = -i;
+
+	pid = fork();
+	if (pid == -1)
+		ASSERT_EQ(pid, 0);
+	if (pid != 0) {
+		waitpid(pid, &ret, 0);
+		ASSERT_EQ(WIFEXITED(ret), 1);
+
+		/* Check that the parent's buffer did change. */
+		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+			ASSERT_EQ(ptr[i], -i);
+		return;
+	}
+
+	/* Check that we see the parent's values. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], -i);
+
+	/* The child process needs its own mirror to its own mm. */
+	child_fd = hmm_open(0);
+	ASSERT_GE(child_fd, 0);
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(child_fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device wrote. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], -i);
+
+	close(child_fd);
+	exit(0);
+}
+
+/*
+ * Write private anonymous huge page.
+ */
+TEST_F(hmm, anon_write_huge)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = 2 * TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	size = TWOMEG;
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize data that the device will write to buffer->ptr. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device wrote. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Write huge TLBFS page.
+ */
+TEST_F(hmm, anon_write_hugetlbfs)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+	long pagesizes[4];
+	int n, idx;
+
+	/* Skip test if we can't allocate a hugetlbfs page. */
+
+	n = gethugepagesizes(pagesizes, 4);
+	if (n <= 0)
+		return;
+	for (idx = 0; --n > 0; ) {
+		if (pagesizes[n] < pagesizes[idx])
+			idx = n;
+	}
+	size = ALIGN(TWOMEG, pagesizes[idx]);
+	npages = size >> self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->ptr = get_hugepage_region(size, GHR_STRICT);
+	if (buffer->ptr == NULL) {
+		free(buffer);
+		return;
+	}
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	/* Initialize data that the device will write to buffer->ptr. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device wrote. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	free_hugepage_region(buffer->ptr);
+	buffer->ptr = NULL;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Read mmap'ed file memory.
+ */
+TEST_F(hmm, file_read)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+	int fd;
+	ssize_t len;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	fd = hmm_create_file(size);
+	ASSERT_GE(fd, 0);
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = fd;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	/* Write initial contents of the file. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+	len = pwrite(fd, buffer->mirror, size, 0);
+	ASSERT_EQ(len, size);
+	memset(buffer->mirror, 0, size);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ,
+			   MAP_SHARED,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Simulate a device reading system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_READ, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Write mmap'ed file memory.
+ */
+TEST_F(hmm, file_write)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+	int fd;
+	ssize_t len;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	fd = hmm_create_file(size);
+	ASSERT_GE(fd, 0);
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = fd;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_SHARED,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize data that the device will write to buffer->ptr. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device wrote. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Check that the device also wrote the file. */
+	len = pread(fd, buffer->mirror, size, 0);
+	ASSERT_EQ(len, size);
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate anonymous memory to device private memory.
+ */
+TEST_F(hmm, migrate)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate anonymous memory to device private memory and fault it back to system
+ * memory.
+ */
+TEST_F(hmm, migrate_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Try to migrate various memory types to device private memory.
+ */
+TEST_F(hmm2, migrate_mixed)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	int *ptr;
+	unsigned char *p;
+	int ret;
+	int val;
+
+	npages = 6;
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	/* Reserve a range of addresses. */
+	buffer->ptr = mmap(NULL, size,
+			   PROT_NONE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+	p = buffer->ptr;
+
+	/* Now try to migrate everything to device 1. */
+	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, 6);
+
+	/* Punch a hole after the first page address. */
+	ret = munmap(buffer->ptr + self->page_size, self->page_size);
+	ASSERT_EQ(ret, 0);
+
+	/* We expect an error if the vma doesn't cover the range. */
+	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
+	ASSERT_EQ(ret, -EINVAL);
+
+	/* Page 2 will be a read-only zero page. */
+	ret = mprotect(buffer->ptr + 2 * self->page_size, self->page_size,
+				PROT_READ);
+	ASSERT_EQ(ret, 0);
+	ptr = (int *)(buffer->ptr + 2 * self->page_size);
+	val = *ptr + 3;
+	ASSERT_EQ(val, 3);
+
+	/* Page 3 will be read-only. */
+	ret = mprotect(buffer->ptr + 3 * self->page_size, self->page_size,
+				PROT_READ | PROT_WRITE);
+	ASSERT_EQ(ret, 0);
+	ptr = (int *)(buffer->ptr + 3 * self->page_size);
+	*ptr = val;
+	ret = mprotect(buffer->ptr + 3 * self->page_size, self->page_size,
+				PROT_READ);
+	ASSERT_EQ(ret, 0);
+
+	/* Page 4 will be read-write. */
+	ret = mprotect(buffer->ptr + 4 * self->page_size, self->page_size,
+				PROT_READ | PROT_WRITE);
+	ASSERT_EQ(ret, 0);
+	ptr = (int *)(buffer->ptr + 4 * self->page_size);
+	*ptr = val;
+
+	/* Page 5 won't be migrated to device 0 because it's on device 1. */
+	buffer->ptr = p + 5 * self->page_size;
+	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ASSERT_EQ(ret, -ENOENT);
+	buffer->ptr = p;
+
+	/* Now try to migrate pages 2-3 to device 1. */
+	buffer->ptr = p + 2 * self->page_size;
+	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 2);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, 2);
+	buffer->ptr = p;
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate anonymous memory to device private memory and fault it back to system
+ * memory multiple times.
+ */
+TEST_F(hmm, migrate_multiple)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	unsigned long c;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	for (c = 0; c < NTIMES; c++) {
+		buffer = malloc(sizeof(*buffer));
+		ASSERT_NE(buffer, NULL);
+
+		buffer->fd = -1;
+		buffer->size = size;
+		buffer->mirror = malloc(size);
+		ASSERT_NE(buffer->mirror, NULL);
+
+		buffer->ptr = mmap(NULL, size,
+				   PROT_READ | PROT_WRITE,
+				   MAP_PRIVATE | MAP_ANONYMOUS,
+				   buffer->fd, 0);
+		ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+		/* Initialize buffer in system memory. */
+		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+			ptr[i] = i;
+
+		/* Migrate memory to device. */
+		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
+				      npages);
+		ASSERT_EQ(ret, 0);
+		ASSERT_EQ(buffer->cpages, npages);
+
+		/* Check what the device read. */
+		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+			ASSERT_EQ(ptr[i], i);
+
+		/* Fault pages back to system memory and check them. */
+		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+			ASSERT_EQ(ptr[i], i);
+
+		hmm_buffer_free(buffer);
+	}
+}
+
+/*
+ * Read anonymous memory multiple times.
+ */
+TEST_F(hmm, anon_read_multiple)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	unsigned long c;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	for (c = 0; c < NTIMES; c++) {
+		buffer = malloc(sizeof(*buffer));
+		ASSERT_NE(buffer, NULL);
+
+		buffer->fd = -1;
+		buffer->size = size;
+		buffer->mirror = malloc(size);
+		ASSERT_NE(buffer->mirror, NULL);
+
+		buffer->ptr = mmap(NULL, size,
+				   PROT_READ | PROT_WRITE,
+				   MAP_PRIVATE | MAP_ANONYMOUS,
+				   buffer->fd, 0);
+		ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+		/* Initialize buffer in system memory. */
+		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+			ptr[i] = i + c;
+
+		/* Simulate a device reading system memory. */
+		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_READ, buffer,
+				      npages);
+		ASSERT_EQ(ret, 0);
+		ASSERT_EQ(buffer->cpages, npages);
+		ASSERT_EQ(buffer->faults, 1);
+
+		/* Check what the device read. */
+		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+			ASSERT_EQ(ptr[i], i + c);
+
+		hmm_buffer_free(buffer);
+	}
+}
+
+void *unmap_buffer(void *p)
+{
+	struct hmm_buffer *buffer = p;
+
+	/* Delay for a bit and then unmap buffer while it is being read. */
+	hmm_nanosleep(hmm_random() % 32000);
+	munmap(buffer->ptr + buffer->size / 2, buffer->size / 2);
+	buffer->ptr = NULL;
+
+	return NULL;
+}
+
+/*
+ * Try reading anonymous memory while it is being unmapped.
+ */
+TEST_F(hmm, anon_teardown)
+{
+	unsigned long npages;
+	unsigned long size;
+	unsigned long c;
+	void *ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	for (c = 0; c < NTIMES; ++c) {
+		pthread_t thread;
+		struct hmm_buffer *buffer;
+		unsigned long i;
+		int *ptr;
+		int rc;
+
+		buffer = malloc(sizeof(*buffer));
+		ASSERT_NE(buffer, NULL);
+
+		buffer->fd = -1;
+		buffer->size = size;
+		buffer->mirror = malloc(size);
+		ASSERT_NE(buffer->mirror, NULL);
+
+		buffer->ptr = mmap(NULL, size,
+				   PROT_READ | PROT_WRITE,
+				   MAP_PRIVATE | MAP_ANONYMOUS,
+				   buffer->fd, 0);
+		ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+		/* Initialize buffer in system memory. */
+		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+			ptr[i] = i + c;
+
+		rc = pthread_create(&thread, NULL, unmap_buffer, buffer);
+		ASSERT_EQ(rc, 0);
+
+		/* Simulate a device reading system memory. */
+		rc = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_READ, buffer,
+				     npages);
+		if (rc == 0) {
+			ASSERT_EQ(buffer->cpages, npages);
+			ASSERT_EQ(buffer->faults, 1);
+
+			/* Check what the device read. */
+			for (i = 0, ptr = buffer->mirror;
+			     i < size / sizeof(*ptr);
+			     ++i)
+				ASSERT_EQ(ptr[i], i + c);
+		}
+
+		pthread_join(thread, &ret);
+		hmm_buffer_free(buffer);
+	}
+}
+
+/*
+ * Test memory snapshot without faulting in pages accessed by the device.
+ */
+TEST_F(hmm2, snapshot)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	int *ptr;
+	unsigned char *p;
+	unsigned char *m;
+	int ret;
+	int val;
+
+	npages = 7;
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(npages);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	/* Reserve a range of addresses. */
+	buffer->ptr = mmap(NULL, size,
+			   PROT_NONE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+	p = buffer->ptr;
+
+	/* Punch a hole after the first page address. */
+	ret = munmap(buffer->ptr + self->page_size, self->page_size);
+	ASSERT_EQ(ret, 0);
+
+	/* Page 2 will be read-only zero page. */
+	ret = mprotect(buffer->ptr + 2 * self->page_size, self->page_size,
+				PROT_READ);
+	ASSERT_EQ(ret, 0);
+	ptr = (int *)(buffer->ptr + 2 * self->page_size);
+	val = *ptr + 3;
+	ASSERT_EQ(val, 3);
+
+	/* Page 3 will be read-only. */
+	ret = mprotect(buffer->ptr + 3 * self->page_size, self->page_size,
+				PROT_READ | PROT_WRITE);
+	ASSERT_EQ(ret, 0);
+	ptr = (int *)(buffer->ptr + 3 * self->page_size);
+	*ptr = val;
+	ret = mprotect(buffer->ptr + 3 * self->page_size, self->page_size,
+				PROT_READ);
+	ASSERT_EQ(ret, 0);
+
+	/* Page 4-6 will be read-write. */
+	ret = mprotect(buffer->ptr + 4 * self->page_size, 3 * self->page_size,
+				PROT_READ | PROT_WRITE);
+	ASSERT_EQ(ret, 0);
+	ptr = (int *)(buffer->ptr + 4 * self->page_size);
+	*ptr = val;
+
+	/* Page 5 will be migrated to device 0. */
+	buffer->ptr = p + 5 * self->page_size;
+	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, 1);
+
+	/* Page 6 will be migrated to device 1. */
+	buffer->ptr = p + 6 * self->page_size;
+	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, 1);
+
+	/* Simulate a device snapshotting CPU pagetables. */
+	buffer->ptr = p;
+	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device saw. */
+	m = buffer->mirror;
+	ASSERT_EQ(m[0], HMM_DMIRROR_PROT_ERROR);
+	ASSERT_EQ(m[1], HMM_DMIRROR_PROT_NONE);
+	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
+	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
+	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
+	ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
+			HMM_DMIRROR_PROT_WRITE);
+	ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Test two devices reading the same memory (double mapped).
+ */
+TEST_F(hmm2, double_map)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = 6;
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(npages);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	/* Reserve a range of addresses. */
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Make region read-only. */
+	ret = mprotect(buffer->ptr, size, PROT_READ);
+	ASSERT_EQ(ret, 0);
+
+	/* Simulate device 0 reading system memory. */
+	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_READ, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Simulate device 1 reading system memory. */
+	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_READ, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	ASSERT_EQ(buffer->faults, 1);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Punch a hole after the first page address. */
+	ret = munmap(buffer->ptr + self->page_size, self->page_size);
+	ASSERT_EQ(ret, 0);
+
+	hmm_buffer_free(buffer);
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests
index f33714843198..5e82b2574d54 100755
--- a/tools/testing/selftests/vm/run_vmtests
+++ b/tools/testing/selftests/vm/run_vmtests
@@ -270,4 +270,20 @@ else
 	exitcode=1
 fi
 
+echo "------------------------------------"
+echo "running HMM smoke test"
+echo "------------------------------------"
+./test_hmm.sh smoke
+ret_val=$?
+
+if [ $ret_val -eq 0 ]; then
+	echo "[PASS]"
+elif [ $ret_val -eq $ksft_skip ]; then
+	echo "[SKIP]"
+	exitcode=$ksft_skip
+else
+	echo "[FAIL]"
+	exitcode=1
+fi
+
 exit $exitcode
diff --git a/tools/testing/selftests/vm/test_hmm.sh b/tools/testing/selftests/vm/test_hmm.sh
new file mode 100755
index 000000000000..461e4a99a362
--- /dev/null
+++ b/tools/testing/selftests/vm/test_hmm.sh
@@ -0,0 +1,97 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) 2018 Uladzislau Rezki (Sony) <urezki@gmail.com>
+#
+# This is a test script for the kernel test driver to analyse vmalloc
+# allocator. Therefore it is just a kernel module loader. You can specify
+# and pass different parameters in order to:
+#     a) analyse performance of vmalloc allocations;
+#     b) stressing and stability check of vmalloc subsystem.
+
+TEST_NAME="test_hmm"
+DRIVER="test_hmm"
+
+# 1 if fails
+exitcode=1
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+check_test_requirements()
+{
+	uid=$(id -u)
+	if [ $uid -ne 0 ]; then
+		echo "$0: Must be run as root"
+		exit $ksft_skip
+	fi
+
+	if ! which modprobe > /dev/null 2>&1; then
+		echo "$0: You need modprobe installed"
+		exit $ksft_skip
+	fi
+
+	if ! modinfo $DRIVER > /dev/null 2>&1; then
+		echo "$0: You must have the following enabled in your kernel:"
+		echo "CONFIG_TEST_HMM=m"
+		exit $ksft_skip
+	fi
+}
+
+load_driver()
+{
+	modprobe $DRIVER > /dev/null 2>&1
+	if [ $? == 0 ]; then
+		major=$(awk "\$2==\"HMM_DMIRROR\" {print \$1}" /proc/devices)
+		mknod /dev/hmm_dmirror0 c $major 0
+		mknod /dev/hmm_dmirror1 c $major 1
+	fi
+}
+
+unload_driver()
+{
+	modprobe -r $DRIVER > /dev/null 2>&1
+	rm -f /dev/hmm_dmirror?
+}
+
+run_smoke()
+{
+	echo "Running smoke test. Note, this test provides basic coverage."
+
+	load_driver
+	./hmm-tests
+	unload_driver
+}
+
+usage()
+{
+	echo -n "Usage: $0"
+	echo
+	echo "Example usage:"
+	echo
+	echo "# Shows help message"
+	echo "./${TEST_NAME}.sh"
+	echo
+	echo "# Smoke testing"
+	echo "./${TEST_NAME}.sh smoke"
+	echo
+	exit 0
+}
+
+function run_test()
+{
+	if [ $# -eq 0 ]; then
+		usage
+	else
+		if [ "$1" = "smoke" ]; then
+			run_smoke
+		else
+			usage
+		fi
+	fi
+}
+
+check_test_requirements
+run_test $@
+
+exit 0
-- 
2.23.0


--------------908CA79958BE6989593A4D80
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------908CA79958BE6989593A4D80--
