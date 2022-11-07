Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FED61F8D3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C3D10E459;
	Mon,  7 Nov 2022 16:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE9B10E452
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZEPCEPXSD9xJR6EXVTkMdJM0IVrTuU8M/8HWR2B6ts=;
 b=dU6KCwqD0xDMwlwQTQ1Qi2sjUdBFDjzIJ90spNs5+ZDdfXfo9mRNHi6eBaA+aup8ZqyqTG
 8NxSQo3EhLOQLs7dk70QEFuZg00A1dj2d3ylh72/WwbufYbuiOMSw3VkgiyyUCTXEl/41w
 dyHTcnBvFHMsJe4poCU7ikH6VYXV8mA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-TPu3i8qRPRm2rCmYJIBLOA-1; Mon, 07 Nov 2022 11:17:55 -0500
X-MC-Unique: TPu3i8qRPRm2rCmYJIBLOA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DE67886064;
 Mon,  7 Nov 2022 16:17:54 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BAC74B3FC8;
 Mon,  7 Nov 2022 16:17:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 01/19] selftests/vm: anon_cow: prepare for non-anonymous
 COW tests
Date: Mon,  7 Nov 2022 17:17:22 +0100
Message-Id: <20221107161740.144456-2-david@redhat.com>
In-Reply-To: <20221107161740.144456-1-david@redhat.com>
References: <20221107161740.144456-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 linux-kselftest@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, etnaviv@lists.freedesktop.org,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally, the plan was to have a separate tests for testing COW of
non-anonymous (e.g., shared zeropage) pages.

Turns out, that we'd need a lot of similar functionality and that there
isn't a really good reason to separate it. So let's prepare for non-anon
tests by renaming to "cow".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/vm/.gitignore         |  2 +-
 tools/testing/selftests/vm/Makefile           | 10 ++++----
 tools/testing/selftests/vm/check_config.sh    |  4 +--
 .../selftests/vm/{anon_cow.c => cow.c}        | 25 +++++++++++--------
 tools/testing/selftests/vm/run_vmtests.sh     |  8 +++---
 5 files changed, 27 insertions(+), 22 deletions(-)
 rename tools/testing/selftests/vm/{anon_cow.c => cow.c} (97%)

diff --git a/tools/testing/selftests/vm/.gitignore b/tools/testing/selftests/vm/.gitignore
index 8a536c731e3c..ee8c41c998e6 100644
--- a/tools/testing/selftests/vm/.gitignore
+++ b/tools/testing/selftests/vm/.gitignore
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-anon_cow
+cow
 hugepage-mmap
 hugepage-mremap
 hugepage-shm
diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 0986bd60c19f..89c14e41bd43 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -27,7 +27,7 @@ MAKEFLAGS += --no-builtin-rules
 
 CFLAGS = -Wall -I $(top_srcdir) -I $(top_srcdir)/usr/include $(EXTRA_CFLAGS) $(KHDR_INCLUDES)
 LDLIBS = -lrt -lpthread
-TEST_GEN_FILES = anon_cow
+TEST_GEN_FILES = cow
 TEST_GEN_FILES += compaction_test
 TEST_GEN_FILES += gup_test
 TEST_GEN_FILES += hmm-tests
@@ -99,7 +99,7 @@ TEST_FILES += va_128TBswitch.sh
 
 include ../lib.mk
 
-$(OUTPUT)/anon_cow: vm_util.c
+$(OUTPUT)/cow: vm_util.c
 $(OUTPUT)/khugepaged: vm_util.c
 $(OUTPUT)/ksm_functional_tests: vm_util.c
 $(OUTPUT)/madv_populate: vm_util.c
@@ -156,8 +156,8 @@ warn_32bit_failure:
 endif
 endif
 
-# ANON_COW_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
-$(OUTPUT)/anon_cow: LDLIBS += $(ANON_COW_EXTRA_LIBS)
+# cow_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
+$(OUTPUT)/cow: LDLIBS += $(COW_EXTRA_LIBS)
 
 $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
 
@@ -170,7 +170,7 @@ local_config.mk local_config.h: check_config.sh
 
 EXTRA_CLEAN += local_config.mk local_config.h
 
-ifeq ($(ANON_COW_EXTRA_LIBS),)
+ifeq ($(COW_EXTRA_LIBS),)
 all: warn_missing_liburing
 
 warn_missing_liburing:
diff --git a/tools/testing/selftests/vm/check_config.sh b/tools/testing/selftests/vm/check_config.sh
index 9a44c6520925..bcba3af0acea 100644
--- a/tools/testing/selftests/vm/check_config.sh
+++ b/tools/testing/selftests/vm/check_config.sh
@@ -21,11 +21,11 @@ $CC -c $tmpfile_c -o $tmpfile_o >/dev/null 2>&1
 
 if [ -f $tmpfile_o ]; then
     echo "#define LOCAL_CONFIG_HAVE_LIBURING 1"  > $OUTPUT_H_FILE
-    echo "ANON_COW_EXTRA_LIBS = -luring"         > $OUTPUT_MKFILE
+    echo "COW_EXTRA_LIBS = -luring"              > $OUTPUT_MKFILE
 else
     echo "// No liburing support found"          > $OUTPUT_H_FILE
     echo "# No liburing support found, so:"      > $OUTPUT_MKFILE
-    echo "ANON_COW_EXTRA_LIBS = "               >> $OUTPUT_MKFILE
+    echo "COW_EXTRA_LIBS = "                    >> $OUTPUT_MKFILE
 fi
 
 rm ${tmpname}.*
diff --git a/tools/testing/selftests/vm/anon_cow.c b/tools/testing/selftests/vm/cow.c
similarity index 97%
rename from tools/testing/selftests/vm/anon_cow.c
rename to tools/testing/selftests/vm/cow.c
index 705bd0b3db11..b28143389f60 100644
--- a/tools/testing/selftests/vm/anon_cow.c
+++ b/tools/testing/selftests/vm/cow.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * COW (Copy On Write) tests for anonymous memory.
+ * COW (Copy On Write) tests.
  *
  * Copyright 2022, Red Hat, Inc.
  *
@@ -959,7 +959,11 @@ struct test_case {
 	test_fn fn;
 };
 
-static const struct test_case test_cases[] = {
+/*
+ * Test cases that are specific to anonymous pages: pages in private mappings
+ * that may get shared via COW during fork().
+ */
+static const struct test_case anon_test_cases[] = {
 	/*
 	 * Basic COW tests for fork() without any GUP. If we miss to break COW,
 	 * either the child can observe modifications by the parent or the
@@ -1061,7 +1065,7 @@ static const struct test_case test_cases[] = {
 	},
 };
 
-static void run_test_case(struct test_case const *test_case)
+static void run_anon_test_case(struct test_case const *test_case)
 {
 	int i;
 
@@ -1082,15 +1086,17 @@ static void run_test_case(struct test_case const *test_case)
 				 hugetlbsizes[i]);
 }
 
-static void run_test_cases(void)
+static void run_anon_test_cases(void)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(test_cases); i++)
-		run_test_case(&test_cases[i]);
+	ksft_print_msg("[INFO] Anonymous memory tests in private mappings\n");
+
+	for (i = 0; i < ARRAY_SIZE(anon_test_cases); i++)
+		run_anon_test_case(&anon_test_cases[i]);
 }
 
-static int tests_per_test_case(void)
+static int tests_per_anon_test_case(void)
 {
 	int tests = 2 + nr_hugetlbsizes;
 
@@ -1101,7 +1107,6 @@ static int tests_per_test_case(void)
 
 int main(int argc, char **argv)
 {
-	int nr_test_cases = ARRAY_SIZE(test_cases);
 	int err;
 
 	pagesize = getpagesize();
@@ -1109,14 +1114,14 @@ int main(int argc, char **argv)
 	detect_hugetlbsizes();
 
 	ksft_print_header();
-	ksft_set_plan(nr_test_cases * tests_per_test_case());
+	ksft_set_plan(ARRAY_SIZE(anon_test_cases) * tests_per_anon_test_case());
 
 	gup_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	if (pagemap_fd < 0)
 		ksft_exit_fail_msg("opening pagemap failed\n");
 
-	run_test_cases();
+	run_anon_test_cases();
 
 	err = ksft_get_fail_cnt();
 	if (err)
diff --git a/tools/testing/selftests/vm/run_vmtests.sh b/tools/testing/selftests/vm/run_vmtests.sh
index ce52e4f5ff21..71744b9002d0 100755
--- a/tools/testing/selftests/vm/run_vmtests.sh
+++ b/tools/testing/selftests/vm/run_vmtests.sh
@@ -50,8 +50,8 @@ separated by spaces:
 	memory protection key tests
 - soft_dirty
 	test soft dirty page bit semantics
-- anon_cow
-	test anonymous copy-on-write semantics
+- cow
+	test copy-on-write semantics
 example: ./run_vmtests.sh -t "hmm mmap ksm"
 EOF
 	exit 0
@@ -267,7 +267,7 @@ fi
 
 CATEGORY="soft_dirty" run_test ./soft-dirty
 
-# COW tests for anonymous memory
-CATEGORY="anon_cow" run_test ./anon_cow
+# COW tests
+CATEGORY="cow" run_test ./cow
 
 exit $exitcode
-- 
2.38.1

