Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828CF5EDFCD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 17:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497C810E9DA;
	Wed, 28 Sep 2022 15:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547A610E9FA;
 Wed, 28 Sep 2022 15:10:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0924B81FA2;
 Wed, 28 Sep 2022 15:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C69C433D6;
 Wed, 28 Sep 2022 15:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1664377826;
 bh=+HOKwcbw1B0WEYgcZtf8z/9nr2ZbysRiKOhYfv9YVTE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IS5sTNnyxfit75fuP9+CKivhPVfr5MuCYX5xkSMvaIHcwj3YlHPHGiuReVZRtFCkO
 k/7JXAzqhj8lkEcOv3/FuRDU4yiHUhnPML+lIIGP/0mxsk6qSXMxUXyYBHHEAPpFJk
 OVh6CdYsxMDrs090m2k5tYCYUY4q6QAKNz+LjBGQ=
Date: Wed, 28 Sep 2022 08:10:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 8/8] hmm-tests: Add test for migrate_device_range()
Message-Id: <20220928081017.3bf0b67d34a674b0a6df6b0d@linux-foundation.org>
In-Reply-To: <a73cf109de0224cfd118d22be58ddebac3ae2897.1664366292.git-series.apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
 <a73cf109de0224cfd118d22be58ddebac3ae2897.1664366292.git-series.apopple@nvidia.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Sep 2022 22:01:22 +1000 Alistair Popple <apopple@nvidia.com> wrote:

> @@ -1401,22 +1494,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
>  
>  static void dmirror_device_remove(struct dmirror_device *mdevice)
>  {
> -	unsigned int i;
> -
> -	if (mdevice->devmem_chunks) {
> -		for (i = 0; i < mdevice->devmem_count; i++) {
> -			struct dmirror_chunk *devmem =
> -				mdevice->devmem_chunks[i];
> -
> -			memunmap_pages(&devmem->pagemap);
> -			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
> -				release_mem_region(devmem->pagemap.range.start,
> -						   range_len(&devmem->pagemap.range));
> -			kfree(devmem);
> -		}
> -		kfree(mdevice->devmem_chunks);
> -	}
> -
> +	dmirror_device_remove_chunks(mdevice);
>  	cdev_del(&mdevice->cdevice);
>  }

Needed a bit or rework due to
https://lkml.kernel.org/r/20220826050631.25771-1-mpenttil@redhat.com. 
Please check my resolution.


--- a/lib/test_hmm.c~hmm-tests-add-test-for-migrate_device_range
+++ a/lib/test_hmm.c
@@ -100,6 +100,7 @@ struct dmirror {
 struct dmirror_chunk {
 	struct dev_pagemap	pagemap;
 	struct dmirror_device	*mdevice;
+	bool remove;
 };
 
 /*
@@ -192,11 +193,15 @@ static int dmirror_fops_release(struct i
 	return 0;
 }
 
+static struct dmirror_chunk *dmirror_page_to_chunk(struct page *page)
+{
+	return container_of(page->pgmap, struct dmirror_chunk, pagemap);
+}
+
 static struct dmirror_device *dmirror_page_to_device(struct page *page)
 
 {
-	return container_of(page->pgmap, struct dmirror_chunk,
-			    pagemap)->mdevice;
+	return dmirror_page_to_chunk(page)->mdevice;
 }
 
 static int dmirror_do_fault(struct dmirror *dmirror, struct hmm_range *range)
@@ -1218,6 +1223,85 @@ static int dmirror_snapshot(struct dmirr
 	return ret;
 }
 
+static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
+{
+	unsigned long start_pfn = chunk->pagemap.range.start >> PAGE_SHIFT;
+	unsigned long end_pfn = chunk->pagemap.range.end >> PAGE_SHIFT;
+	unsigned long npages = end_pfn - start_pfn + 1;
+	unsigned long i;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
+
+	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
+	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
+
+	migrate_device_range(src_pfns, start_pfn, npages);
+	for (i = 0; i < npages; i++) {
+		struct page *dpage, *spage;
+
+		spage = migrate_pfn_to_page(src_pfns[i]);
+		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		if (WARN_ON(!is_device_private_page(spage) &&
+			    !is_device_coherent_page(spage)))
+			continue;
+		spage = BACKING_PAGE(spage);
+		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		lock_page(dpage);
+		copy_highpage(dpage, spage);
+		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+		if (src_pfns[i] & MIGRATE_PFN_WRITE)
+			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+	}
+	migrate_device_pages(src_pfns, dst_pfns, npages);
+	migrate_device_finalize(src_pfns, dst_pfns, npages);
+	kfree(src_pfns);
+	kfree(dst_pfns);
+}
+
+/* Removes free pages from the free list so they can't be re-allocated */
+static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
+{
+	struct dmirror_device *mdevice = devmem->mdevice;
+	struct page *page;
+
+	for (page = mdevice->free_pages; page; page = page->zone_device_data)
+		if (dmirror_page_to_chunk(page) == devmem)
+			mdevice->free_pages = page->zone_device_data;
+}
+
+static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
+{
+	unsigned int i;
+
+	mutex_lock(&mdevice->devmem_lock);
+	if (mdevice->devmem_chunks) {
+		for (i = 0; i < mdevice->devmem_count; i++) {
+			struct dmirror_chunk *devmem =
+				mdevice->devmem_chunks[i];
+
+			spin_lock(&mdevice->lock);
+			devmem->remove = true;
+			dmirror_remove_free_pages(devmem);
+			spin_unlock(&mdevice->lock);
+
+			dmirror_device_evict_chunk(devmem);
+			memunmap_pages(&devmem->pagemap);
+			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
+				release_mem_region(devmem->pagemap.range.start,
+						   range_len(&devmem->pagemap.range));
+			kfree(devmem);
+		}
+		mdevice->devmem_count = 0;
+		mdevice->devmem_capacity = 0;
+		mdevice->free_pages = NULL;
+		kfree(mdevice->devmem_chunks);
+		mdevice->devmem_chunks = NULL;
+	}
+	mutex_unlock(&mdevice->devmem_lock);
+}
+
 static long dmirror_fops_unlocked_ioctl(struct file *filp,
 					unsigned int command,
 					unsigned long arg)
@@ -1272,6 +1356,11 @@ static long dmirror_fops_unlocked_ioctl(
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_RELEASE:
+		dmirror_device_remove_chunks(dmirror->mdevice);
+		ret = 0;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1326,9 +1415,13 @@ static void dmirror_devmem_free(struct p
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
-	mdevice->cfree++;
-	page->zone_device_data = mdevice->free_pages;
-	mdevice->free_pages = page;
+
+	/* Return page to our allocator if not freeing the chunk */
+	if (!dmirror_page_to_chunk(page)->remove) {
+		mdevice->cfree++;
+		page->zone_device_data = mdevice->free_pages;
+		mdevice->free_pages = page;
+	}
 	spin_unlock(&mdevice->lock);
 }
 
@@ -1408,22 +1501,7 @@ static int dmirror_device_init(struct dm
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
 {
-	unsigned int i;
-
-	if (mdevice->devmem_chunks) {
-		for (i = 0; i < mdevice->devmem_count; i++) {
-			struct dmirror_chunk *devmem =
-				mdevice->devmem_chunks[i];
-
-			memunmap_pages(&devmem->pagemap);
-			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-				release_mem_region(devmem->pagemap.range.start,
-						   range_len(&devmem->pagemap.range));
-			kfree(devmem);
-		}
-		kfree(mdevice->devmem_chunks);
-	}
-
+	dmirror_device_remove_chunks(mdevice);
 	cdev_device_del(&mdevice->cdevice, &mdevice->device);
 }
 
--- a/lib/test_hmm_uapi.h~hmm-tests-add-test-for-migrate_device_range
+++ a/lib/test_hmm_uapi.h
@@ -36,6 +36,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
--- a/tools/testing/selftests/vm/hmm-tests.c~hmm-tests-add-test-for-migrate_device_range
+++ a/tools/testing/selftests/vm/hmm-tests.c
@@ -1054,6 +1054,55 @@ TEST_F(hmm, migrate_fault)
 	hmm_buffer_free(buffer);
 }
 
+TEST_F(hmm, migrate_release)
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
+	buffer->ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Release device memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_RELEASE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / (2 * sizeof(*ptr)); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
 /*
  * Migrate anonymous shared memory to device private memory.
  */
_

