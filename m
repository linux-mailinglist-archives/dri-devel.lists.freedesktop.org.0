Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD59F314A1A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5146EB46;
	Tue,  9 Feb 2021 07:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BF56E43C;
 Tue,  9 Feb 2021 01:14:38 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6021e0d10000>; Mon, 08 Feb 2021 17:09:37 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 01:09:36 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 01:09:36 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH 5/9] hmm-tests: Add test for unmap and pin
Date: Tue, 9 Feb 2021 12:07:18 +1100
Message-ID: <20210209010722.13839-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612832977; bh=eX6MwlujUfKQJ41uDmpXkpSxuNOWqBqcyMk+9htUm4I=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=ZUvc6YKwpnF7J4Z7k4xQ9aVuBZ46oSRqSppWJIki35wS/IAu4LBbCO/dUkdeEVXL/
 wBHqQ1XO0ZV2IHKJrqnyhrPM7QerfJ4Uwpa20mtIZGPiIj4AC4phTspMsvzcFN8y6/
 /PVwslkyzXJmcdYHReSOHdlp6tsXxixwP9zm0B43laeT9TI1YRV0fMyTo0As6ItNAJ
 WHIqhCbx3m6af9VX9unRQtMEXsKIlAHyjZlfohaE2wGbbCstX/KnIGflWQ4W5vj6e+
 M42Oh6R/N2rRhBjQs6mRLp7bbxWRmJqYH8njZ8H89vtZsRoRL+xvCXYfM97St2ClLq
 WMd2ksOkhewKw==
X-Mailman-Approved-At: Tue, 09 Feb 2021 07:56:28 +0000
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds a basic test of the HMM unmap and pin operation.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 lib/test_hmm.c                         | 107 +++++++++++++++++++++----
 lib/test_hmm_uapi.h                    |   1 +
 tools/testing/selftests/vm/hmm-tests.c |  49 +++++++++++
 3 files changed, 140 insertions(+), 17 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 98848b96ff09..c78a473250a3 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -46,6 +46,7 @@ struct dmirror_bounce {
 	unsigned long		cpages;
 };
 
+#define DPT_XA_TAG_ATOMIC 1UL
 #define DPT_XA_TAG_WRITE 3UL
 
 /*
@@ -83,6 +84,7 @@ struct dmirror_device {
 	struct cdev		cdevice;
 	struct hmm_devmem	*devmem;
 
+	unsigned int		devmem_faults;
 	unsigned int		devmem_capacity;
 	unsigned int		devmem_count;
 	struct dmirror_chunk	**devmem_chunks;
@@ -203,8 +205,18 @@ static void dmirror_do_update(struct dmirror *dmirror, unsigned long start,
 	 * Therefore, it is OK to just clear the entry.
 	 */
 	xa_for_each_range(&dmirror->pt, pfn, entry, start >> PAGE_SHIFT,
-			  end >> PAGE_SHIFT)
+			  end >> PAGE_SHIFT) {
+		/*
+		 * Typically this would be done in devmap free page, but as
+		 * we're using the XArray to store the reference to the original
+		 * page do it here as it doesn't matter if clean up of the
+		 * pinned page is delayed.
+		 */
+		if (xa_pointer_tag(entry) == DPT_XA_TAG_ATOMIC)
+			unpin_user_page(xa_untag_pointer(entry));
+
 		xa_erase(&dmirror->pt, pfn);
+	}
 }
 
 static bool dmirror_interval_invalidate(struct mmu_interval_notifier *mni,
@@ -571,7 +583,8 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 }
 
 static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
-					   struct dmirror *dmirror)
+					   struct dmirror *dmirror,
+					   int allow_ref)
 {
 	struct dmirror_device *mdevice = dmirror->mdevice;
 	const unsigned long *src = args->src;
@@ -598,9 +611,17 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 			continue;
 
 		rpage = dpage->zone_device_data;
-		if (spage)
+		if (spage && !(*src & MIGRATE_PFN_PIN))
 			copy_highpage(rpage, spage);
 		else
+			/*
+			 * In the MIGRATE_PFN_PIN case we don't really
+			 * need rpage at all because the existing page is
+			 * staying in place and will be mapped. However we need
+			 * somewhere to store dmirror and that place is
+			 * rpage->zone_device_data so we keep it for
+			 * simplicity.
+			 */
 			clear_highpage(rpage);
 
 		/*
@@ -620,7 +641,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 }
 
 static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
-					    struct dmirror *dmirror)
+					    struct dmirror *dmirror,
+					    int allow_ref)
 {
 	unsigned long start = args->start;
 	unsigned long end = args->end;
@@ -647,8 +669,14 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		 * Store the page that holds the data so the page table
 		 * doesn't have to deal with ZONE_DEVICE private pages.
 		 */
-		entry = dpage->zone_device_data;
-		if (*dst & MIGRATE_PFN_WRITE)
+		if (*src & MIGRATE_PFN_PIN)
+			entry = migrate_pfn_to_page(*src);
+		else
+			entry = dpage->zone_device_data;
+
+		if (*src & MIGRATE_PFN_PIN)
+			entry = xa_tag_pointer(entry, DPT_XA_TAG_ATOMIC);
+		else if (*dst & MIGRATE_PFN_WRITE)
 			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
 		if (xa_is_err(entry)) {
@@ -662,7 +690,8 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 }
 
 static int dmirror_migrate(struct dmirror *dmirror,
-			   struct hmm_dmirror_cmd *cmd)
+			   struct hmm_dmirror_cmd *cmd,
+			   int allow_ref)
 {
 	unsigned long start, end, addr;
 	unsigned long size = cmd->npages << PAGE_SHIFT;
@@ -673,7 +702,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 	struct dmirror_bounce bounce;
 	struct migrate_vma args;
 	unsigned long next;
-	int ret;
+	int i, ret;
 
 	start = cmd->addr;
 	end = start + size;
@@ -696,8 +725,13 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
-		memset(src_pfns, 0, ARRAY_SIZE(src_pfns));
-		memset(dst_pfns, 0, ARRAY_SIZE(dst_pfns));
+		if (allow_ref)
+			for (i = 0; i < 64; ++i)
+				src_pfns[i] = MIGRATE_PFN_PIN;
+		else
+			memset(src_pfns, 0, sizeof(src_pfns));
+		memset(dst_pfns, 0, sizeof(dst_pfns));
+
 		args.vma = vma;
 		args.src = src_pfns;
 		args.dst = dst_pfns;
@@ -709,9 +743,9 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		if (ret)
 			goto out;
 
-		dmirror_migrate_alloc_and_copy(&args, dmirror);
+		dmirror_migrate_alloc_and_copy(&args, dmirror, allow_ref);
 		migrate_vma_pages(&args);
-		dmirror_migrate_finalize_and_map(&args, dmirror);
+		dmirror_migrate_finalize_and_map(&args, dmirror, allow_ref);
 		migrate_vma_finalize(&args);
 	}
 	mmap_read_unlock(mm);
@@ -739,6 +773,28 @@ static int dmirror_migrate(struct dmirror *dmirror,
 	return ret;
 }
 
+static int dmirror_migrate_pin(struct dmirror *dmirror,
+			       struct hmm_dmirror_cmd *cmd)
+{
+	void *tmp;
+	int nr_pages = cmd->npages;
+	int ret;
+
+	ret = dmirror_migrate(dmirror, cmd, true);
+
+	tmp = kmalloc(nr_pages << PAGE_SHIFT, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	/* Make sure user access faults */
+	dmirror->mdevice->devmem_faults = 0;
+	if (copy_from_user(tmp, u64_to_user_ptr(cmd->addr), nr_pages << PAGE_SHIFT))
+		ret = -EFAULT;
+	cmd->faults = dmirror->mdevice->devmem_faults;
+
+	return ret;
+}
+
 static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 			    unsigned char *perm, unsigned long entry)
 {
@@ -948,7 +1004,11 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		break;
 
 	case HMM_DMIRROR_MIGRATE:
-		ret = dmirror_migrate(dmirror, &cmd);
+		ret = dmirror_migrate(dmirror, &cmd, false);
+		break;
+
+	case HMM_DMIRROR_MIGRATE_PIN:
+		ret = dmirror_migrate_pin(dmirror, &cmd);
 		break;
 
 	case HMM_DMIRROR_SNAPSHOT:
@@ -1004,20 +1064,31 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 	for (addr = start; addr < end; addr += PAGE_SIZE,
 				       src++, dst++) {
 		struct page *dpage, *spage;
+		void *entry;
 
 		spage = migrate_pfn_to_page(*src);
 		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
 			continue;
-		spage = spage->zone_device_data;
 
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+		entry = xa_load(&dmirror->pt, addr >> PAGE_SHIFT);
+		if (entry && xa_pointer_tag(entry) == DPT_XA_TAG_ATOMIC) {
+			spage = NULL;
+			dpage = xa_untag_pointer(entry);
+			*dst = migrate_pfn(page_to_pfn(dpage)) |
+				MIGRATE_PFN_LOCKED | MIGRATE_PFN_UNPIN;
+		} else {
+			spage = spage->zone_device_data;
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+			*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+		}
+
 		if (!dpage)
 			continue;
 
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+		if (spage)
+			copy_highpage(dpage, spage);
 		if (*src & MIGRATE_PFN_WRITE)
 			*dst |= MIGRATE_PFN_WRITE;
 	}
@@ -1041,6 +1112,8 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	rpage = vmf->page->zone_device_data;
 	dmirror = rpage->zone_device_data;
 
+	dmirror->mdevice->devmem_faults++;
+
 	/* FIXME demonstrate how we can adjust migrate range */
 	args.vma = vmf->vma;
 	args.start = vmf->address;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 670b4ef2a5b6..b40f4e6affe0 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -33,6 +33,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_MIGRATE_PIN		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 5d1ac691b9f4..7111ebab93c7 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -947,6 +947,55 @@ TEST_F(hmm, migrate_fault)
 	hmm_buffer_free(buffer);
 }
 
+TEST_F(hmm, migrate_fault_pin)
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
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE_PIN, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	ASSERT_EQ(buffer->faults, npages);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
 /*
  * Migrate anonymous shared memory to device private memory.
  */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
