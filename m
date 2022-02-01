Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1CA4A5781
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722CB10ECA2;
	Tue,  1 Feb 2022 07:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5759C10ECA0;
 Tue,  1 Feb 2022 07:06:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVqnM6q4UGMyG3mVm2JVV+uKvfDsW+vfItdZq1dkjrNB0OUOfLFNM3n79QtsQooxPXMHbd3P6+Vl2MpISWHQ1mYqaqSKhlLhIyr4cpTySbWaTyl07+JVpNtbFCi1AsFJgMSNotBK710Y9N4kZxkeQWPvofDSJ1MGAbv8otXHHNLGj1wpD0nXgzgrLiEmH0Xq3bR30Hig+QGmaVyAT4SnymzDjxmOsqTZ5+2coM3rmsCGd1aBmc+2sLcSyvxco3PRwGWw2ZMuoTB+3lc8mLBg/9KK0hq72s8zYMPn7yRvfT43WaRFrx1Ab+yuJfHOMfPe05TMEaG5CN4JbPCmGWtmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd81HyG71D8pTfKOZda6N8+bA8ij9IGX6lSZqZkGGWE=;
 b=U4L4OPtRoiD3DYILyM6ilJGFzYcBBX2+DXA6KwMBaSE8Z31X+phJWroZp2jW/7+cCBtxzhgXbcDq84CVZ13lSS5jIpXkRcFt8bVhFzJdKKJrjN8B3xiehu9mAucwgY6J6ORSTjawoHPeM/IJkq8r6MZhn3GgVCptAzOo65KxFnkUehwhRzqEwHpiWFhncf2ggivqNQXZuvXqn7aGhx5kYIpNb8msxOnGv63xYFSxMbA47KNqgp84UxOrr6yw++X4XvHoX65UhjgEXyETM8kaF4rbGTqa9SdGMsMgvKdMUy8UERBkmpQ+DCXajcpqYD46/rBgn3+kPIJDf5oLL/GmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd81HyG71D8pTfKOZda6N8+bA8ij9IGX6lSZqZkGGWE=;
 b=EaEn71y7itik3sADmPHrxXRcXBVI2U0kM0YneFfYqI9CQ2MyIguUPCZtEZkfu7+3VR/38Jrzd8W6hAjh4xIZy00p8gvWrMUKmElEVy9wt9jCaIhl2VAViM4YfHaRbFgNAgmY6mk4Zn8X4s7FAniWQfHU0+Lp4WQoMqf0EdYLPvYcjXTDvU8C+qlRWpIWLIyH1hCAIeyumaCEX1yT//WWzsPN/zkQOjLKgViYcY8BkfzZ7FrCb9sDsg2cH44JRqDsK4UCXij6KMjEDo3VvfvhgsXu2n2bBpjdoQn4QK6gjBAjISvQ0i5RkmzsbPgTWPZ6HMkPaur1LSet19Xknz8lkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CY4PR1201MB0214.namprd12.prod.outlook.com (2603:10b6:910:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Tue, 1 Feb
 2022 07:06:54 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::48bc:2cb6:45e3:41fd]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::48bc:2cb6:45e3:41fd%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 07:06:54 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [PATCH 3/3] tools: add hmm gup test for long term pinned device pages
Date: Tue,  1 Feb 2022 18:05:57 +1100
Message-Id: <d400bc4c874ff211b8520c51930b5ab78711454a.1643698773.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
References: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d5b6f9a-73d4-40f4-1dea-08d9e5516d65
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0214:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB021431C8734A8DF0EBA8BB2ADF269@CY4PR1201MB0214.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/QGslVbU7mnyw/nbcWMaIf/h4SxF9AGNdH+dGhwA/nsOtn+ksQTlX0IVAsEJSs0F5bQb9TxEqAq4CRL2+DjWZa47LdG4aELRi31oXVPsa5+X7qaubIDUFydAGthsTi9BCqbqaPFwvxYu2Yt1u2lnUVh5AV+LMPQuQhWWHUGQVGBYq3pGKALcpVn4Ttota8Z93MdMcySMJsKaywNPqSLpGesWlahne3d2NNMH4F0vV+YreGzlxJyEoJeafRWNL4MGEbiR7LngbWkoHVRI5bam8kQ1tCnzx464oEBtHxXPghfbQZP7WYFsau9UmQtiG2ISLuPL7XalSgBemrqbmjQE/GOtCoofmUeDwWtay2AjrMG+/486g2Mm1u2iXQwoZWcZcFJA9+MmH+sWBk3BggOM6nEB2eLfPLqm3Uj7VVhOz5j2+OnuM0m6hryap5mu0HYIkeL9rKMyDnhnzYSnnhX1nG5yC+LuoGa5X3DOWn1ejXyHCtxrgZDCbXlu+MNpnuI+0BQxeS9v3yzJC1LtRMc8T7Z6rJGihAcUjzgfd94jg41nHR1n4JsipuZhDlszrBT+s5ZOOrSeYHrL0rYA4or1il09Xb+SXK+RyzuQXpD0AEoHvPT01nLSeExknhpZTovlJgLrrSTE2khHaCaK22u1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(38100700002)(5660300002)(4326008)(7416002)(316002)(186003)(508600001)(83380400001)(8676002)(2616005)(66946007)(36756003)(2906002)(66476007)(66556008)(86362001)(6486002)(6512007)(6506007)(26005)(8936002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fUfoR9CFruCVMAD/8Z27S6d6haot7/ItGPYj4CKRVx1/qtqalbbNA73FuvDe?=
 =?us-ascii?Q?8YOqtrQjfcrvDrh1OgSKAFNZD/afvuPfST/R04vraKIUVApGdGuZ/Ffhpc+S?=
 =?us-ascii?Q?qJJ+mn6ND/WvdoOE11b2NpdrHim7Fc3j49Am3Y+ypSgMT7/2uMHwZuMFwFZ5?=
 =?us-ascii?Q?88QUOUMntXrFWyW/0HV2sggtOY/7wCpoh6c2g1BklViDS6iE3w7JWJjZb3bi?=
 =?us-ascii?Q?BkpBvDpRXytEldBU3OoKRGxq8Bk3UmD+rhiN/5ZpD8B4oeHbZfBTNDSLw8ei?=
 =?us-ascii?Q?WzjBiqN3AmLCrNUex9KfquR4mR2BkQkc7Q34WFHzS+NB/ltq3X/zlCzb48Ns?=
 =?us-ascii?Q?QfrInPUwpiRXyS9mG0rt9IOEVZIF47KiqeTL67RGZpBa5dSuvbG20FmWg2go?=
 =?us-ascii?Q?5N9J5Y3SE34plXM31gUJVGqM0rtIjo0NxhVIbXSMfEYoFTyPQh077agVtIog?=
 =?us-ascii?Q?6Mc4tQigQgHWfFSBBcd0wVsrZlj530C78qIoEC1NOq4JsFlBfjQMd82EWylp?=
 =?us-ascii?Q?XN7nCHcfvYZ8l+RdIcZNfPYBF+a4iazaKX34NVans2AggfIyPQPTuQ9D7uNm?=
 =?us-ascii?Q?XUJ8A2LKAajAgIkcLHsPI3nB1j2OeJw7dCPkw/++rH+ZTt1OvyW+DFRRV55u?=
 =?us-ascii?Q?pD++bMAej8CDn3OoVGvDV55+5iUSWcqZsCgdt0o3y5JmelwQDtIUxT1/dueJ?=
 =?us-ascii?Q?8BQ/n7oHLRUj6y3SYW0O6B0LvF/qYRodiVHG3qnKAYN70FD/Tq3as4Q7bURF?=
 =?us-ascii?Q?ka6cTze8LQEhmUCjwznweM5u4oh1jdt3BRmudN6Y/0H5gtKIjvqJz8ZXVQlS?=
 =?us-ascii?Q?dOROAnUbSGz+61ahwo2nx7wDF1EroVHSOX9kSJ/B7qF+k1v+6etk6KR8XBO2?=
 =?us-ascii?Q?Ff/0UHlRBe59aAjMQc0ZgyEonzIApOTIeqCOOlMgjB8ceexpzaWAGAkAosle?=
 =?us-ascii?Q?cQrYgo8gBC+Vf9jlzJSm11SwNxJQQjAq9SLZ44dyhffUBah59eQ2IACFhVrz?=
 =?us-ascii?Q?/VqC11Ag5bCyLwLY9b1aYxHzmGlmFSmyTtC4y+7jQCPisNbjC0y9GPBdn6x7?=
 =?us-ascii?Q?ZjsSB1LY4rJvH2A7VdSfF4XdOsIz/duEzhYEGLYubxj+utr6/Z2j263rVQRS?=
 =?us-ascii?Q?gU46to+u60jtk3aGZgdlJpiAbdBrsZAKDoyPyPOqYK8dD5sGB6lYMgj6iQke?=
 =?us-ascii?Q?kBRRrEGdK/dCfLwYtEFQKy3+FFBBbQ2o8vmor8JnCLW4EljELAAvGwISk2zm?=
 =?us-ascii?Q?GeIvex4wMiJjM8IRqmHUYvxS+X0pRZb245TK2lipofZJdtSdEbWnlwLRjvu3?=
 =?us-ascii?Q?UE2DkK0+G32ZhQ9tSbCrnigsoc1a/bbxwkGMrj+r5K3yjs/AbwaxHO5fP+/6?=
 =?us-ascii?Q?nkCXHHpAI/KEe9a9/zMHe7HNWRMpQiHn+ASMOjmwjC4Ejl6fpSYW0jfANpI2?=
 =?us-ascii?Q?l96BdNjbnCSoTyFmCvEK60mw9iO0HSmNW2mRgwL5EZFWX3NR4G1w+SPN0eeW?=
 =?us-ascii?Q?d0FqAb1uh/6D+0Y5FFOpwstDYkDbBrwr8KQZ9iKgTp4uGWPRUJqr8534zVvs?=
 =?us-ascii?Q?RZuwCR9E66CxW5v4FGgkpswJX/N21aIMFutxdtnrUJ1F/kSkED4ZceipLoEg?=
 =?us-ascii?Q?KxCqfUPGBEuOrl8YrRUEgkM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5b6f9a-73d4-40f4-1dea-08d9e5516d65
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 07:06:54.1653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CUfUNUf2GXl32hjY+aoYxSxNYL6wq6WtUSlhYMTkt3EJMtjMgT1CPLZEpNkE8mru7QNzyq9AjcT1hX1UVPByA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0214
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

The intention is to test device coherent type pages that have been
called through get user pages with PIN_LONGTERM flag set. These pages
should get migrated back to normal system memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 tools/testing/selftests/vm/Makefile    |  2 +-
 tools/testing/selftests/vm/hmm-tests.c | 81 +++++++++++++++++++++++++++-
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 1607322..58c8427 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -142,7 +142,7 @@ $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
 
 $(OUTPUT)/gup_test: ../../../../mm/gup_test.h
 
-$(OUTPUT)/hmm-tests: local_config.h
+$(OUTPUT)/hmm-tests: local_config.h ../../../../mm/gup_test.h
 
 # HMM_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
 $(OUTPUT)/hmm-tests: LDLIBS += $(HMM_EXTRA_LIBS)
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 84ec8c4..11b83a8 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -36,6 +36,7 @@
  * in the usual include/uapi/... directory.
  */
 #include "../../../../lib/test_hmm_uapi.h"
+#include "../../../../mm/gup_test.h"
 
 struct hmm_buffer {
 	void		*ptr;
@@ -60,6 +61,8 @@ enum {
 #define NTIMES		10
 
 #define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
+/* Just the flags we need, copied from mm.h: */
+#define FOLL_WRITE	0x01	/* check pte is writable */
 
 FIXTURE(hmm)
 {
@@ -1766,4 +1769,82 @@ TEST_F(hmm, exclusive_cow)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Test get user device pages through gup_test. Setting PIN_LONGTERM flag.
+ * This should trigger a migration back to system memory for both, private
+ * and coherent type pages.
+ * This test makes use of gup_test module. Make sure GUP_TEST_CONFIG is added
+ * to your configuration before you run it.
+ */
+TEST_F(hmm, hmm_gup_test)
+{
+	struct hmm_buffer *buffer;
+	struct gup_test gup;
+	int gup_fd;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+	unsigned char *m;
+
+	gup_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
+	if (gup_fd == -1)
+		SKIP(return, "Skipping test, could not find gup_test driver");
+
+	npages = 4;
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
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	gup.nr_pages_per_call = npages;
+	gup.addr = (unsigned long)buffer->ptr;
+	gup.gup_flags = FOLL_WRITE;
+	gup.size = size;
+	/*
+	 * Calling gup_test ioctl. It will try to PIN_LONGTERM these device pages
+	 * causing a migration back to system memory for both, private and coherent
+	 * type pages.
+	 */
+	if (ioctl(gup_fd, PIN_LONGTERM_BENCHMARK, &gup)) {
+		perror("ioctl on PIN_LONGTERM_BENCHMARK\n");
+		goto out_test;
+	}
+
+	/* Take snapshot to make sure pages have been migrated to sys memory */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	m = buffer->mirror;
+	for (i = 0; i < npages; i++)
+		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_WRITE);
+out_test:
+	close(gup_fd);
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
git-series 0.9.1
