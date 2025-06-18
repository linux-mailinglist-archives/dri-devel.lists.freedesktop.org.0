Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07EEADE313
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 07:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADEE10E799;
	Wed, 18 Jun 2025 05:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUWQC9+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A9810E382
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 05:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750224990; x=1781760990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8bi9IBuLb0gjn1SusDZ649Ki1OW61GbUsQWKfAsTNNQ=;
 b=TUWQC9+hdk9iJRy2Za5cjTLjDucUW/4SAKZnZMqC+u0OcYcZSMCsxJX8
 EPJIv3oUwNaKGFHtyth6lsnAtkNd1UMWVs8IfI+K58BT4+nRMAryk/rWS
 D27Ga0/oCWdn8iCaHek4db5j+z1wuObT8W/PGRIeafZDupX/xpjthzQ64
 WwhbKy9bND2ZYG22iFwTt2aUgd+8+G++h3SAAUV2Mg9ac9Jb96hZlSw3M
 11D6xZr+hQ03/WWGD7hTFAvFYesRRCk99bM3Yf+shBPJVwPZsHLPwW7FB
 w/KrpVkDR6Ylf5HO5kv64nsavIJ98vyUPQdyPOXoPp4r1LIcOB6dnlKHB w==;
X-CSE-ConnectionGUID: MQWOzsvARIyus0vcsFKYWA==
X-CSE-MsgGUID: 4m8Ig2/KSq61cn/qnB5kgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="74960324"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="74960324"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 22:36:29 -0700
X-CSE-ConnectionGUID: RjYNsE1iRpWAlTEDa7TjfA==
X-CSE-MsgGUID: bgA0OQTRSw+APtfm+h1TJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149052941"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 22:36:28 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 3/3] selftests/udmabuf: Add a test to pin first before
 writing to memfd
Date: Tue, 17 Jun 2025 22:30:55 -0700
Message-ID: <20250618053415.1036185-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618053415.1036185-1-vivek.kasireddy@intel.com>
References: <20250618053415.1036185-1-vivek.kasireddy@intel.com>
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
2.49.0

