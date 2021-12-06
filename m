Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A811646A52E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BF273640;
	Mon,  6 Dec 2021 18:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEDC732E9;
 Mon,  6 Dec 2021 18:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq8OXMmIP7s9BVDJ5+5uxLNF0SmMtnamJLeAfxAmj3F0XGsxlHkm704EthWGjZxVC7KgI6bGMeRj/0pPSzI8ixEOk72eLYlqzer9fg7QwQgPz2+xm+v7hKjfxx+U8ubmf1M15ksgC980dzaWeomal5ohLPWObS/zfbmJGF2S/BFHNZ0CLojeIllXUpKeOjEnuC5iw274upkr6j+WFurFhWlkQ6YDw3MW9AYW21FPWp+Fa0OyMSuolFyrIScy3KW1MFzR1GjtKUXFMDzXYb9KSHiQJ8toOVNpPt11jfCbwcVUfHCxLNormihwAjhd2zRfXlXIFlbyBJCcGzufa5B3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd1gqU23taV2RuOXaFgROP6Az4Jec/HPM4h/VMMEzbI=;
 b=Qovkb3sd9ftj8VYTlOOORnir+ZorUXNyd/LIWhaHlQRcKOeW2Yo36RvIGTlmdBfzLSP65WMr6nll+FYvwe7BVUaW/gWJ/XOQIIyECOrZVL7TrC8fUDKqw9A4LuPq5GsBQKZRQbHMsqgU5Szffz/Fxbr4MD5Jg+x9uQe6mwwonqu7rlTWoD1ogS8e1i1b5zenTiFNdK4l6HFykUhAQacSiGtlcZUBJPFgnXjyPUBsq9tZSt8uKT5KgfIsIb7oSFDAjNxm7Bu0aXUTLr1QpwPdVfHILVEkS8VtcEg6ajXPodGc65A77UGzTEcqlD+svJ5rACqHnBxbf6/nfP4/qOgZ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd1gqU23taV2RuOXaFgROP6Az4Jec/HPM4h/VMMEzbI=;
 b=S3i+b8hEjvdzsCfc8hU3UNEMppAsmReVtUIHxPHc4SaqvyLAoTcX9y9AT9wVjhOSBRoCvl20KUGGn7PiW9g8nOcRVwx+YCv/97Mhz2q1SMaIaEvoNZtxpgkduUJv9eCbY2LaI7vgbkw+H94u2emfBJkwiRQ7k/+G5U8yoHMV92Q=
Received: from DM5PR15CA0053.namprd15.prod.outlook.com (2603:10b6:3:ae::15) by
 DM6PR12MB2698.namprd12.prod.outlook.com (2603:10b6:5:42::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21; Mon, 6 Dec 2021 18:53:10 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::7) by DM5PR15CA0053.outlook.office365.com
 (2603:10b6:3:ae::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19 via Frontend
 Transport; Mon, 6 Dec 2021 18:53:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:53:10 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 12:53:08 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v2 11/11] tools: add hmm gup test for long term pinned device
 pages
Date: Mon, 6 Dec 2021 12:52:51 -0600
Message-ID: <20211206185251.20646-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206185251.20646-1-alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b48d376e-b3a9-4f37-fdfc-08d9b8e9a656
X-MS-TrafficTypeDiagnostic: DM6PR12MB2698:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB269867CCB4710E20F847F6D7FD6D9@DM6PR12MB2698.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PzzdunYPS3Tiw0GKArGjLJ9poDKemaH+y5xKaSWXkQnZMqZYH0FXt9aJXZ2cJTEVeGvPnXrdgFqThQ9Mn/AWwa16Lbb0QfnVungkqo/22CWycXKXLROOuImluLmGEhxrMFwlXUZRj4x4eDRbyztzgNl5i6yde1XOBrj23lfeQncPmuYGIzZCihyyUQnd7Xy49K+ZsuyE2Q3rjtlH7Vao0hQpbzakO8Fd1VJ1sWtvAt3Al/qlSB5Vuvf4oPkVqqEowpel5SjBNSI17rirjQVvCIgUVqFLLvGXnBZ+rSrHJXiut/y7Tuh5rrWmKRz7BHnM8HHw09aPYMzGpwctKI8W/lcjDxgv7bgZCdwAQIHfJuRegu7zYaIzwX8ieo2EfjmN6ibBzCzs+LX3Xa0nyHtjMuWpVHMlkdW0v9vt3XtZs+foLloJsLOr0/evosLMkQHUsrbGdF5lzI9KclNGStiNe9agne/jVVwhJDgFkOGgebIkxVYMo9ZLp38PyYfaDGbBQfKStS7NeS6vGGIAZj2YUa3Q47+bSYPx0dXIhRYXBtpU7DnPlvAozUqK1k9dsdhx1sxUDN2QtfPM+CqlorpDAl4Lz/v9mqLlskWagDxXfW57hHsufkdwn65yyIXGLKc915WG7YvWG7bpgVi8Wjdlc0RbVxpjBWPuCCvwh4s0jfESKsQKEyhIc6ix81q7sp4cL3XXUTCMUOIVvTMbQJmTrBsq2tqLldpIJRoXp8qaAvDf1H1NG11xDpjgL+aUGPWHClkiYQYPslLBJYHSLyWSno6UYXndn+MzQUhB8sqDepg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(426003)(7696005)(16526019)(186003)(2616005)(26005)(40460700001)(7416002)(336012)(82310400004)(4326008)(5660300002)(36860700001)(6666004)(54906003)(1076003)(36756003)(2906002)(81166007)(44832011)(356005)(83380400001)(508600001)(86362001)(110136005)(70586007)(8676002)(8936002)(70206006)(316002)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:53:10.6620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b48d376e-b3a9-4f37-fdfc-08d9b8e9a656
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2698
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The intention is to test device coherent type pages that have been
called through get user pages with PIN_LONGTERM flag set.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 tools/testing/selftests/vm/Makefile    |  2 +-
 tools/testing/selftests/vm/hmm-tests.c | 81 ++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index d9605bd10f2d..527a7bfd80bd 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -141,7 +141,7 @@ $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
 
 $(OUTPUT)/gup_test: ../../../../mm/gup_test.h
 
-$(OUTPUT)/hmm-tests: local_config.h
+$(OUTPUT)/hmm-tests: local_config.h ../../../../mm/gup_test.h
 
 # HMM_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
 $(OUTPUT)/hmm-tests: LDLIBS += $(HMM_EXTRA_LIBS)
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 8eb81dfba4b3..9a0b7e44a674 100644
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
@@ -1723,4 +1726,82 @@ TEST_F(hmm, exclusive_cow)
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
2.32.0

