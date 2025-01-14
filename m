Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AAA10230
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8B610E885;
	Tue, 14 Jan 2025 08:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkfCiZn6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA0E10E449
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736843891; x=1768379891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SkjdjBC9EFZ/ZMbL21szG1Ln9nKeFx8PXdK5k9949F8=;
 b=YkfCiZn6KPxQQdzqgWX1IXPct09kyXsaSr7+eXBByWGyJVYE3kM8nIwY
 6dYttgO6r7nvN/IRPP3cC39+b95ehs9dlK+DQEkepQwqYXhD4VckYs2ny
 lD3E+Xhav5Rw11h++XJTeRT/FtiNxkeXnq4Y1AnEEkz9ht7FCVei+icSE
 F3i3rvtudfR4HszSIVw3/avra7XPrlF8y943xV433bJLZMgx8eZrHk2sD
 UU4QiZKS0VlkTs/P1meH/IlwF1vSF+LPD9iGleg64HHtu5YlJSOBI8EZy
 E6SgJ8U/HoQS3t7qbUgh8x+ESuDepHeATttiqHegXRI7eYIiG718Sj+q1 w==;
X-CSE-ConnectionGUID: hbeJg73UTIqvuv3yatUkJw==
X-CSE-MsgGUID: C6kUtxvTScGyDXYqxR4QUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36418235"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="36418235"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:38:10 -0800
X-CSE-ConnectionGUID: MIBaAp+kQJWMZHMHfvrFGA==
X-CSE-MsgGUID: NJYwNdkURa+kz9q+3dgLXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="105251580"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:38:10 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 2/2] selftests/udmabuf: add a test to pin first before
 writing to memfd
Date: Tue, 14 Jan 2025 00:08:01 -0800
Message-ID: <20250114080927.2616684-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114080927.2616684-1-vivek.kasireddy@intel.com>
References: <20250114080927.2616684-1-vivek.kasireddy@intel.com>
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

Unlike the existing tests, this new test will create a memfd (backed
by hugetlb) and pin the folios in it (a small subset) before writing/
populating it with data. This is a valid use-case that invokes the
memfd_alloc_folio() kernel API and is expected to work unless there
aren't enough hugetlb folios to satisfy the allocation needs.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Steve Sistare <steven.sistare@oracle.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 .../selftests/drivers/dma-buf/udmabuf.c       | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index 6062723a172e..77aa2897e79f 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -138,7 +138,7 @@ int main(int argc, char *argv[])
 	void *addr1, *addr2;
 
 	ksft_print_header();
-	ksft_set_plan(6);
+	ksft_set_plan(7);
 
 	devfd = open("/dev/udmabuf", O_RDWR);
 	if (devfd < 0) {
@@ -248,6 +248,24 @@ int main(int argc, char *argv[])
 	else
 		ksft_test_result_pass("%s: [PASS,test-6]\n", TEST_PREFIX);
 
+	close(buf);
+	close(memfd);
+
+	/* same test as above but we pin first before writing to memfd */
+	page_size = getpagesize() * 512; /* 2 MB */
+	size = MEMFD_SIZE * page_size;
+	memfd = create_memfd_with_seals(size, true);
+	buf = create_udmabuf_list(devfd, memfd, size);
+	addr2 = mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
+	addr1 = mmap_fd(memfd, size);
+	write_to_memfd(addr1, size, 'a');
+	write_to_memfd(addr1, size, 'b');
+	ret = compare_chunks(addr1, addr2, size);
+	if (ret < 0)
+		ksft_test_result_fail("%s: [FAIL,test-7]\n", TEST_PREFIX);
+	else
+		ksft_test_result_pass("%s: [PASS,test-7]\n", TEST_PREFIX);
+
 	close(buf);
 	close(memfd);
 	close(devfd);
-- 
2.47.1

