Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351C78A09B5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7BF10EEFF;
	Thu, 11 Apr 2024 07:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJ4pG6Ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E71610EF25
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 07:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712820382; x=1744356382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u4Zt6ncn47IgJB14JDZFwjyqGxYcviEbMnt3l0dVYJg=;
 b=LJ4pG6NsPLN3OdoTeugvy6c2UCPCpO8N8iTupm4+NzlU1Wx2ki7+p4i5
 GCnDgqXbJ7v4WrtqpOwLmkQ/rJ/sAJl3CByNVkDazLG/rgfQ91BTLc1Jr
 t124TavcuZfzOZ8VwGMmXZ6JJABECvjjYuw+SjAa1Spi7e0s8cibL6X/B
 XyXuvCf+dxH6AT0iWeozsbKZvCqXcoxJIErpr3kGz+Fogy6oV4Flr1P9B
 dz1wFyzqfAkbw9T9EeVtvRJ31380WJ2L9wdp8Z6ZEmUljeJyzByYhP/Ci
 weJqgilzRfXvY0qjXeKOOCQ2MEqJrAXsfVPQEu832uFbHz0Qe/77xv04g g==;
X-CSE-ConnectionGUID: V+4hYu14RriVEuLces6AqA==
X-CSE-MsgGUID: enx0O+t1SwKl9TwnRCn1dQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8074394"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8074394"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 00:26:04 -0700
X-CSE-ConnectionGUID: lJ3/DrzzRJORhGhCD+Jd/A==
X-CSE-MsgGUID: PvvaWwV2Qnyx++zeZKMVHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="20848555"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 00:26:04 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, linux-kselftest@vger.kernel.org,
 Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH v14 8/8] selftests/udmabuf: Add tests to verify data after
 page migration
Date: Wed, 10 Apr 2024 23:59:44 -0700
Message-ID: <20240411070157.3318425-9-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411070157.3318425-1-vivek.kasireddy@intel.com>
References: <20240411070157.3318425-1-vivek.kasireddy@intel.com>
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

Since the memfd pages associated with a udmabuf may be migrated
as part of udmabuf create, we need to verify the data coherency
after successful migration. The new tests added in this patch try
to do just that using 4k sized pages and also 2 MB sized huge
pages for the memfd.

Successful completion of the tests would mean that there is no
disconnect between the memfd pages and the ones associated with
a udmabuf. And, these tests can also be augmented in the future
to test newer udmabuf features (such as handling memfd hole punch).

The idea for these tests comes from a patch by Mike Kravetz here:
https://lists.freedesktop.org/archives/dri-devel/2023-June/410623.html

v1->v2: (suggestions from Shuah)
- Use ksft_* functions to print and capture results of tests
- Use appropriate KSFT_* status codes for exit()
- Add Mike Kravetz's suggested-by tag

Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Cc: linux-kselftest@vger.kernel.org
Suggested-by: Mike Kravetz <mike.kravetz@oracle.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 .../selftests/drivers/dma-buf/udmabuf.c       | 214 +++++++++++++++---
 1 file changed, 183 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index c812080e304e..6062723a172e 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -9,52 +9,162 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <malloc.h>
+#include <stdbool.h>
 
 #include <sys/ioctl.h>
 #include <sys/syscall.h>
+#include <sys/mman.h>
 #include <linux/memfd.h>
 #include <linux/udmabuf.h>
+#include "../../kselftest.h"
 
 #define TEST_PREFIX	"drivers/dma-buf/udmabuf"
 #define NUM_PAGES       4
+#define NUM_ENTRIES     4
+#define MEMFD_SIZE      1024 /* in pages */
 
-static int memfd_create(const char *name, unsigned int flags)
+static unsigned int page_size;
+
+static int create_memfd_with_seals(off64_t size, bool hpage)
+{
+	int memfd, ret;
+	unsigned int flags = MFD_ALLOW_SEALING;
+
+	if (hpage)
+		flags |= MFD_HUGETLB;
+
+	memfd = memfd_create("udmabuf-test", flags);
+	if (memfd < 0) {
+		ksft_print_msg("%s: [skip,no-memfd]\n", TEST_PREFIX);
+		exit(KSFT_SKIP);
+	}
+
+	ret = fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK);
+	if (ret < 0) {
+		ksft_print_msg("%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);
+		exit(KSFT_SKIP);
+	}
+
+	ret = ftruncate(memfd, size);
+	if (ret == -1) {
+		ksft_print_msg("%s: [FAIL,memfd-truncate]\n", TEST_PREFIX);
+		exit(KSFT_FAIL);
+	}
+
+	return memfd;
+}
+
+static int create_udmabuf_list(int devfd, int memfd, off64_t memfd_size)
+{
+	struct udmabuf_create_list *list;
+	int ubuf_fd, i;
+
+	list = malloc(sizeof(struct udmabuf_create_list) +
+		      sizeof(struct udmabuf_create_item) * NUM_ENTRIES);
+	if (!list) {
+		ksft_print_msg("%s: [FAIL, udmabuf-malloc]\n", TEST_PREFIX);
+		exit(KSFT_FAIL);
+	}
+
+	for (i = 0; i < NUM_ENTRIES; i++) {
+		list->list[i].memfd  = memfd;
+		list->list[i].offset = i * (memfd_size / NUM_ENTRIES);
+		list->list[i].size   = getpagesize() * NUM_PAGES;
+	}
+
+	list->count = NUM_ENTRIES;
+	list->flags = UDMABUF_FLAGS_CLOEXEC;
+	ubuf_fd = ioctl(devfd, UDMABUF_CREATE_LIST, list);
+	free(list);
+	if (ubuf_fd < 0) {
+		ksft_print_msg("%s: [FAIL, udmabuf-create]\n", TEST_PREFIX);
+		exit(KSFT_FAIL);
+	}
+
+	return ubuf_fd;
+}
+
+static void write_to_memfd(void *addr, off64_t size, char chr)
+{
+	int i;
+
+	for (i = 0; i < size / page_size; i++) {
+		*((char *)addr + (i * page_size)) = chr;
+	}
+}
+
+static void *mmap_fd(int fd, off64_t size)
 {
-	return syscall(__NR_memfd_create, name, flags);
+	void *addr;
+
+	addr = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
+	if (addr == MAP_FAILED) {
+		ksft_print_msg("%s: ubuf_fd mmap fail\n", TEST_PREFIX);
+		exit(KSFT_FAIL);
+	}
+
+	return addr;
+}
+
+static int compare_chunks(void *addr1, void *addr2, off64_t memfd_size)
+{
+	off64_t off;
+	int i = 0, j, k = 0, ret = 0;
+	char char1, char2;
+
+	while (i < NUM_ENTRIES) {
+		off = i * (memfd_size / NUM_ENTRIES);
+		for (j = 0; j < NUM_PAGES; j++, k++) {
+			char1 = *((char *)addr1 + off + (j * getpagesize()));
+			char2 = *((char *)addr2 + (k * getpagesize()));
+			if (char1 != char2) {
+				ret = -1;
+				goto err;
+			}
+		}
+		i++;
+	}
+err:
+	munmap(addr1, memfd_size);
+	munmap(addr2, NUM_ENTRIES * NUM_PAGES * getpagesize());
+	return ret;
 }
 
 int main(int argc, char *argv[])
 {
 	struct udmabuf_create create;
 	int devfd, memfd, buf, ret;
-	off_t size;
-	void *mem;
+	off64_t size;
+	void *addr1, *addr2;
+
+	ksft_print_header();
+	ksft_set_plan(6);
 
 	devfd = open("/dev/udmabuf", O_RDWR);
 	if (devfd < 0) {
-		printf("%s: [skip,no-udmabuf: Unable to access DMA buffer device file]\n",
-		       TEST_PREFIX);
-		exit(77);
+		ksft_print_msg(
+			"%s: [skip,no-udmabuf: Unable to access DMA buffer device file]\n",
+			TEST_PREFIX);
+		exit(KSFT_SKIP);
 	}
 
 	memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
 	if (memfd < 0) {
-		printf("%s: [skip,no-memfd]\n", TEST_PREFIX);
-		exit(77);
+		ksft_print_msg("%s: [skip,no-memfd]\n", TEST_PREFIX);
+		exit(KSFT_SKIP);
 	}
 
 	ret = fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK);
 	if (ret < 0) {
-		printf("%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);
-		exit(77);
+		ksft_print_msg("%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);
+		exit(KSFT_SKIP);
 	}
 
-
 	size = getpagesize() * NUM_PAGES;
 	ret = ftruncate(memfd, size);
 	if (ret == -1) {
-		printf("%s: [FAIL,memfd-truncate]\n", TEST_PREFIX);
-		exit(1);
+		ksft_print_msg("%s: [FAIL,memfd-truncate]\n", TEST_PREFIX);
+		exit(KSFT_FAIL);
 	}
 
 	memset(&create, 0, sizeof(create));
@@ -64,44 +174,86 @@ int main(int argc, char *argv[])
 	create.offset = getpagesize()/2;
 	create.size   = getpagesize();
 	buf = ioctl(devfd, UDMABUF_CREATE, &create);
-	if (buf >= 0) {
-		printf("%s: [FAIL,test-1]\n", TEST_PREFIX);
-		exit(1);
-	}
+	if (buf >= 0)
+		ksft_test_result_fail("%s: [FAIL,test-1]\n", TEST_PREFIX);
+	else
+		ksft_test_result_pass("%s: [PASS,test-1]\n", TEST_PREFIX);
 
 	/* should fail (size not multiple of page) */
 	create.memfd  = memfd;
 	create.offset = 0;
 	create.size   = getpagesize()/2;
 	buf = ioctl(devfd, UDMABUF_CREATE, &create);
-	if (buf >= 0) {
-		printf("%s: [FAIL,test-2]\n", TEST_PREFIX);
-		exit(1);
-	}
+	if (buf >= 0)
+		ksft_test_result_fail("%s: [FAIL,test-2]\n", TEST_PREFIX);
+	else
+		ksft_test_result_pass("%s: [PASS,test-2]\n", TEST_PREFIX);
 
 	/* should fail (not memfd) */
 	create.memfd  = 0; /* stdin */
 	create.offset = 0;
 	create.size   = size;
 	buf = ioctl(devfd, UDMABUF_CREATE, &create);
-	if (buf >= 0) {
-		printf("%s: [FAIL,test-3]\n", TEST_PREFIX);
-		exit(1);
-	}
+	if (buf >= 0)
+		ksft_test_result_fail("%s: [FAIL,test-3]\n", TEST_PREFIX);
+	else
+		ksft_test_result_pass("%s: [PASS,test-3]\n", TEST_PREFIX);
 
 	/* should work */
+	page_size = getpagesize();
+	addr1 = mmap_fd(memfd, size);
+	write_to_memfd(addr1, size, 'a');
 	create.memfd  = memfd;
 	create.offset = 0;
 	create.size   = size;
 	buf = ioctl(devfd, UDMABUF_CREATE, &create);
-	if (buf < 0) {
-		printf("%s: [FAIL,test-4]\n", TEST_PREFIX);
-		exit(1);
-	}
+	if (buf < 0)
+		ksft_test_result_fail("%s: [FAIL,test-4]\n", TEST_PREFIX);
+	else
+		ksft_test_result_pass("%s: [PASS,test-4]\n", TEST_PREFIX);
+
+	munmap(addr1, size);
+	close(buf);
+	close(memfd);
+
+	/* should work (migration of 4k size pages)*/
+	size = MEMFD_SIZE * page_size;
+	memfd = create_memfd_with_seals(size, false);
+	addr1 = mmap_fd(memfd, size);
+	write_to_memfd(addr1, size, 'a');
+	buf = create_udmabuf_list(devfd, memfd, size);
+	addr2 = mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
+	write_to_memfd(addr1, size, 'b');
+	ret = compare_chunks(addr1, addr2, size);
+	if (ret < 0)
+		ksft_test_result_fail("%s: [FAIL,test-5]\n", TEST_PREFIX);
+	else
+		ksft_test_result_pass("%s: [PASS,test-5]\n", TEST_PREFIX);
+
+	close(buf);
+	close(memfd);
+
+	/* should work (migration of 2MB size huge pages)*/
+	page_size = getpagesize() * 512; /* 2 MB */
+	size = MEMFD_SIZE * page_size;
+	memfd = create_memfd_with_seals(size, true);
+	addr1 = mmap_fd(memfd, size);
+	write_to_memfd(addr1, size, 'a');
+	buf = create_udmabuf_list(devfd, memfd, size);
+	addr2 = mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
+	write_to_memfd(addr1, size, 'b');
+	ret = compare_chunks(addr1, addr2, size);
+	if (ret < 0)
+		ksft_test_result_fail("%s: [FAIL,test-6]\n", TEST_PREFIX);
+	else
+		ksft_test_result_pass("%s: [PASS,test-6]\n", TEST_PREFIX);
 
-	fprintf(stderr, "%s: ok\n", TEST_PREFIX);
 	close(buf);
 	close(memfd);
 	close(devfd);
+
+	ksft_print_msg("%s: ok\n", TEST_PREFIX);
+	ksft_print_cnts();
+
 	return 0;
 }
-- 
2.43.0

