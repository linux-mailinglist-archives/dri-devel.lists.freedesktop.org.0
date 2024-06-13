Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD30907EAB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C7210EBD1;
	Thu, 13 Jun 2024 22:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtzJxzBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F8F10EBC7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 22:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718316818; x=1749852818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mwX/Ut3liG+2eL4EiqMYYCOWpRlKdeioXbS3wyxFBs0=;
 b=LtzJxzBlb+2m/iMFMwITTqsyr+d++7cLGMnV4qG5z4P7Av/Qy0L1935+
 1boBcIobgxZSvHQ7qF81ShbYtOdrH9/GE2EGwu+SUZDUNXk88VoCMeQ0R
 FUr3vN20Y/UqfXm9I1DfiFzvygS0iPCAJloLbVqOAh5Yp052kYKnh2w97
 CxPgpOZ19zVPSB8iiESux3EEyvvDmc3X4VpckGrPsTsMTflyX0XYM0iSb
 nU2sm1SfQJ6JYepeiSS74VpdVAPaswd43f1GkaWcx3UcEvLOQQ6K+KVtD
 GI1Ne56+0lERcideQaIdT+yRfPs+UnpCfW4LYz2vC6D+tJbZAk61guxLx g==;
X-CSE-ConnectionGUID: bMaSCKjbQFK9qxpdpE2kAQ==
X-CSE-MsgGUID: FxKd1DizTs21t+mnQqysag==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="32720582"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="32720582"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:13:38 -0700
X-CSE-ConnectionGUID: Tc0wLCpTSm23vyp5b7zatw==
X-CSE-MsgGUID: rE40TlMOSMimxsMr6bf50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="45214117"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:13:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, linux-kselftest@vger.kernel.org,
 Mike Kravetz <mike.kravetz@oracle.com>, Dave Airlie <airlied@redhat.com>
Subject: [PATCH v15 9/9] selftests/udmabuf: Add tests to verify data after
 page migration
Date: Thu, 13 Jun 2024 14:42:11 -0700
Message-ID: <20240613214741.1029446-10-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
References: <20240613214741.1029446-1-vivek.kasireddy@intel.com>
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
Acked-by: Dave Airlie <airlied@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.45.1

