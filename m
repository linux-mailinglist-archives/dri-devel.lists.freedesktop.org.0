Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25C325E24
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 08:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571F26ED9C;
	Fri, 26 Feb 2021 07:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4AB6ED95;
 Fri, 26 Feb 2021 07:19:12 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6038a0f00000>; Thu, 25 Feb 2021 23:19:12 -0800
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Feb
 2021 07:19:11 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v3 6/8] mm: Selftests for exclusive device memory
Date: Fri, 26 Feb 2021 18:18:30 +1100
Message-ID: <20210226071832.31547-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210226071832.31547-1-apopple@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614323952; bh=PBErBc+I4oubHkw1K9eBMsW5GiUp0BmtDK7fpDkoUjk=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=kX2zCWm+/GZ2vbV6p/pm+xL04NiBwOgRyqvtCfnUHkxq/yihOH16tB0biKaBdZ7tT
 wwmN6xGlQGDQ6dbniKV9iWpgZa9+uVqTiXwa6LgwHxGsSTcH6Cf/5Zm7WeQW1ZTsVg
 9phofbpAinlJaBYlN/yH+0Fk+MYFSoBmcDZwuUNgqqs8S3R1myMDrBLfararHlE7we
 pwRDWlKBmtrp05jxP0+LW8ei5ElmVMNcj1a5Xs9DD4/7El0hnT7fymyIK4yz8b1axr
 GbnCKlU7HkdgRhGU31GxVOlPsxaXXdoDjiD1nvH9gIptlzTIyNEevhNoipjlXSYgmk
 puICPVPKDOsBA==
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
 dri-devel@lists.freedesktop.org, hch@infradead.org, jglisse@redhat.com,
 jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds some selftests for exclusive device memory.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 lib/test_hmm.c                         | 124 ++++++++++++++
 lib/test_hmm_uapi.h                    |   2 +
 tools/testing/selftests/vm/hmm-tests.c | 219 +++++++++++++++++++++++++
 3 files changed, 345 insertions(+)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 80a78877bd93..699b35e248f7 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -25,6 +25,7 @@
 #include <linux/swapops.h>
 #include <linux/sched/mm.h>
 #include <linux/platform_device.h>
+#include <linux/rmap.h>
 
 #include "test_hmm_uapi.h"
 
@@ -46,6 +47,7 @@ struct dmirror_bounce {
 	unsigned long		cpages;
 };
 
+#define DPT_XA_TAG_ATOMIC 1UL
 #define DPT_XA_TAG_WRITE 3UL
 
 /*
@@ -619,6 +621,54 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 	}
 }
 
+static int dmirror_check_atomic(struct dmirror *dmirror, unsigned long start,
+			     unsigned long end)
+{
+	unsigned long pfn;
+
+	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++) {
+		void *entry;
+		struct page *page;
+
+		entry = xa_load(&dmirror->pt, pfn);
+		page = xa_untag_pointer(entry);
+		if (xa_pointer_tag(entry) == DPT_XA_TAG_ATOMIC)
+			return -EPERM;
+	}
+
+	return 0;
+}
+
+static int dmirror_atomic_map(unsigned long start, unsigned long end,
+			      struct page **pages, struct dmirror *dmirror)
+{
+	unsigned long pfn, mapped = 0;
+	int i;
+
+	/* Map the migrated pages into the device's page tables. */
+	mutex_lock(&dmirror->mutex);
+
+	for (i = 0, pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++, i++) {
+		void *entry;
+
+		if (!pages[i])
+			continue;
+
+		entry = pages[i];
+		entry = xa_tag_pointer(entry, DPT_XA_TAG_ATOMIC);
+		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
+		if (xa_is_err(entry)) {
+			mutex_unlock(&dmirror->mutex);
+			return xa_err(entry);
+		}
+
+		mapped++;
+	}
+
+	mutex_unlock(&dmirror->mutex);
+	return mapped;
+}
+
 static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 					    struct dmirror *dmirror)
 {
@@ -661,6 +711,71 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	return 0;
 }
 
+static int dmirror_exclusive(struct dmirror *dmirror,
+			     struct hmm_dmirror_cmd *cmd)
+{
+	unsigned long start, end, addr;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	struct mm_struct *mm = dmirror->notifier.mm;
+	struct page *pages[64];
+	struct dmirror_bounce bounce;
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
+	mmap_read_lock(mm);
+	for (addr = start; addr < end; addr = next) {
+		int i, mapped;
+
+		if (end < addr + (64 << PAGE_SHIFT))
+			next = end;
+		else
+			next = addr + (64 << PAGE_SHIFT);
+
+		ret = make_device_exclusive_range(mm, addr, next, pages);
+		mapped = dmirror_atomic_map(addr, next, pages, dmirror);
+		for (i = 0; i < ret; i++) {
+			if (pages[i]) {
+				unlock_page(pages[i]);
+				put_page(pages[i]);
+			}
+		}
+
+		if (addr + (mapped << PAGE_SHIFT) < next) {
+			mmap_read_unlock(mm);
+			mmput(mm);
+			return -EBUSY;
+		}
+	}
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	/* Return the migrated data for verification. */
+	ret = dmirror_bounce_init(&bounce, start, size);
+	if (ret)
+		return ret;
+	mutex_lock(&dmirror->mutex);
+	ret = dmirror_do_read(dmirror, start, end, &bounce);
+	mutex_unlock(&dmirror->mutex);
+	if (ret == 0) {
+		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
+				 bounce.size))
+			ret = -EFAULT;
+	}
+
+	cmd->cpages = bounce.cpages;
+	dmirror_bounce_fini(&bounce);
+	return ret;
+}
+
 static int dmirror_migrate(struct dmirror *dmirror,
 			   struct hmm_dmirror_cmd *cmd)
 {
@@ -949,6 +1064,15 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_migrate(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_EXCLUSIVE:
+		ret = dmirror_exclusive(dmirror, &cmd);
+		break;
+
+	case HMM_DMIRROR_CHECK_EXCLUSIVE:
+		ret = dmirror_check_atomic(dmirror, cmd.addr,
+					cmd.addr + (cmd.npages << PAGE_SHIFT));
+		break;
+
 	case HMM_DMIRROR_SNAPSHOT:
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 670b4ef2a5b6..f14dea5dcd06 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -33,6 +33,8 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 5d1ac691b9f4..5d3c5db9ed3a 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1485,4 +1485,223 @@ TEST_F(hmm2, double_map)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Basic check of exclusive faulting.
+ */
+TEST_F(hmm, exclusive)
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
+	/* Map memory exclusively for device access. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i]++, i);
+
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i+1);
+
+	/* Check atomic access revoked */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_CHECK_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+
+	hmm_buffer_free(buffer);
+}
+
+TEST_F(hmm, exclusive_shared)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	int *ptr;
+	int ret, i;
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
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Map memory exclusively for device access. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i]++, i);
+
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i+1);
+
+	/* Check atomic access revoked */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_CHECK_EXCLUSIVE, buffer, npages);
+	ASSERT_FALSE(ret);
+
+	/* Map memory exclusively for device access again to check process tear down */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Same as above but for shared anonymous memory.
+ */
+TEST_F(hmm, exclusive_mprotect)
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
+	/* Map memory exclusively for device access. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	ret = mprotect(buffer->ptr, size, PROT_READ);
+	ASSERT_EQ(ret, 0);
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, -EPERM);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Check copy-on-write works.
+ */
+TEST_F(hmm, exclusive_cow)
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
+	/* Map memory exclusively for device access. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	fork();
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i]++, i);
+
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i+1);
+
+	hmm_buffer_free(buffer);
+}
+
 TEST_HARNESS_MAIN
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
