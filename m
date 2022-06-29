Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FBA55F46C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 05:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B621F12A7A5;
	Wed, 29 Jun 2022 03:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6C12A7A8;
 Wed, 29 Jun 2022 03:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsUSwtol4C6h8b87GvjbMrx7NkWibYLz5Smwy0QUOGdfAVpacezI1KmYDGNJuAKJrbnCXia8CuOw1GLXgemwJrJ7rvjHjmaO0okztOsEVuvL/ibQnfamxa2jsbhTnCQXrMPhZ71Q5bZcuIIFK9mi7glrayXVw5oVScM1691gUfO9ve2EsPC5V7CSyXYYck8OGfZ8dG13qphDr16zI4aYU7b8m0Mc+GxB2B6EfPLkhUfUpEPIBSqiB8uNMPATPgdah+nGKIQTCeyufq+5gzZEcWzUkC7M4bRa2ii1nosslTBTZvZ7QNOm013GbHjrbkOtCmqlA/UaCfjE0Io0khWtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP3ikngykfp62hqgKGCY9CKncoZ/5EVzq4BZbbmWmCY=;
 b=AMErRuYkq0NO0Y1IlLcFHtzGWCoFq4Is92Pme3y5XWODbFBhwx98sNmBzqfxNnwUmhxWOK3/hp9WpXs2q3WhJPtyyCxPtOmuDRicAxWyN4bOL3RHQRBE3AszvJAhL2jNGrio4ovnRtFYUbctc36ZuYga7+Z1yVcMnR5Lbgq2jDtGC8Xz3n5g6DBi0IWyCOhEIBRktil5P32jcDVmiuRQwTLIiLDU6Qjgk9W0wSkM9EMFbwFg0P0f2T2uTtCEtxrCSvl4uWB5wN847zl8uCKot1XO/5zcC3nuAL9RfRAAPJY2RUb/X0w6K9jaJl9kjfD4rJwveXPx/R3IggxGQwpB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP3ikngykfp62hqgKGCY9CKncoZ/5EVzq4BZbbmWmCY=;
 b=HQPMkY49fMqSnNKr/LtxHNxTc4EBC9YwhfE3A3VI1RovS6wzo17ciCajZUV9dMgwFEoFetEIRtBoN8+ugknt5NzG0dAqR4rwHlFXbmRWXi0rNbJkfIiszMHOqlqjWRlDgPyB5U+tkDuzZxDaFQxMyHSPU5JUbxeClozdjlE+peg=
Received: from BN8PR12CA0029.namprd12.prod.outlook.com (2603:10b6:408:60::42)
 by BN9PR12MB5177.namprd12.prod.outlook.com (2603:10b6:408:11a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 03:55:15 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::7f) by BN8PR12CA0029.outlook.office365.com
 (2603:10b6:408:60::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 29 Jun 2022 03:55:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:55:15 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 22:55:14 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v7 13/14] tools: add hmm gup tests for device coherent type
Date: Tue, 28 Jun 2022 22:54:25 -0500
Message-ID: <20220629035426.20013-14-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629035426.20013-1-alex.sierra@amd.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc08675-f2dc-4912-43d3-08da59832d03
X-MS-TrafficTypeDiagnostic: BN9PR12MB5177:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +67CD9ktETj5jDzqsApf/H7mPjL/hGizzgVv2qhcVu8p00s9y2EEaiZiEgTW9XTdLQijFtlWpQP8QtM9cF1muDAVQ0b1O/ozdOeYgCb+cvT//iCtpPN0/V+gaEZ7xpam55UsJdekpBCtcglf2DUqeSeMgVZuc1+eIkNcviedprhoWyqbAEKf+bHy30fClOEHdysUH7rNYgGe79ATkYsxGHjkFpNAXWpFsh+oILxd0/1eovSGg7B55g3BcnZ2IiBxSAzc/0NVQs/9CnOrU3amVjgXEbd8HycjogqVKfngz9vvF9mq8DCwCvmefzimhs+YiNdC7U4q3BQFzLWDn1JsUw44ure/t2+J3TaoBkdnso7GpKrA8yPlU3fHHG//cz/Mc0xUoXsfcvf3J/ZUGFeYtFFtExsVnkir/rlI8dMutgiTIp6sntXIj2Ck3UQYHhdIgUvBFfJ02B0TRfxhvMzynDi/n5BHPQc6fB90O8v20NNznJdw2GJgE/F1P7GS3nofYuFeu0KXT2vLvVhjpMIhfyhC10FmcfghbWdU+9luC8BhWda3hRl9wFxvLEAiK1S64b1XKgCerLIjZBjr7eHJYSpwYCZwWc/Kq335rLst0euE0W5v25QEZdzph1RToB51L2yIFAOZJNeE2Wv9pvwqWgpmoXn+ahAaRdf3h5GyI8HxKXKllOdKRpBRpdHofqpC2/TwsfuWcyUV2rwt10YpDDjgIjO43VeaHxHD+JWwoDZIppm+cXgh+oJYDXPawrqKRtwYu0d1mZJQ1Nr8PmnhxFLfbZncPMz/k2rxmlacVgywLMfucyTq1itw1tJKXQUy0xXRJVTjR06XxXSujv7Dlw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966006)(36840700001)(40470700004)(478600001)(2906002)(82310400005)(70586007)(40480700001)(356005)(40460700003)(36756003)(7696005)(86362001)(26005)(6666004)(6916009)(54906003)(8676002)(82740400003)(70206006)(316002)(47076005)(186003)(41300700001)(44832011)(2616005)(426003)(83380400001)(16526019)(1076003)(5660300002)(8936002)(81166007)(7416002)(36860700001)(4326008)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:55:15.6498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc08675-f2dc-4912-43d3-08da59832d03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5177
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The intention is to test hmm device coherent type under different get
user pages paths. Also, test gup with FOLL_LONGTERM flag set in
device coherent pages. These pages should get migrated back to system
memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 110 +++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 4b547188ec40..bb38b9777610 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -36,6 +36,7 @@
  * in the usual include/uapi/... directory.
  */
 #include "../../../../lib/test_hmm_uapi.h"
+#include "../../../../mm/gup_test.h"
 
 struct hmm_buffer {
 	void		*ptr;
@@ -59,6 +60,9 @@ enum {
 #define NTIMES		10
 
 #define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
+/* Just the flags we need, copied from mm.h: */
+#define FOLL_WRITE	0x01	/* check pte is writable */
+#define FOLL_LONGTERM   0x10000 /* mapping lifetime is indefinite */
 
 FIXTURE(hmm)
 {
@@ -1764,4 +1768,110 @@ TEST_F(hmm, exclusive_cow)
 	hmm_buffer_free(buffer);
 }
 
+static int gup_test_exec(int gup_fd, unsigned long addr, int cmd,
+			 int npages, int size, int flags)
+{
+	struct gup_test gup = {
+		.nr_pages_per_call	= npages,
+		.addr			= addr,
+		.gup_flags		= FOLL_WRITE | flags,
+		.size			= size,
+	};
+
+	if (ioctl(gup_fd, cmd, &gup)) {
+		perror("ioctl on error\n");
+		return errno;
+	}
+
+	return 0;
+}
+
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
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr,
+				GUP_BASIC_TEST, 1, self->page_size, 0), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 1 * self->page_size,
+				GUP_FAST_BENCHMARK, 1, self->page_size, 0), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 2 * self->page_size,
+				PIN_FAST_BENCHMARK, 1, self->page_size, FOLL_LONGTERM), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 3 * self->page_size,
+				PIN_LONGTERM_BENCHMARK, 1, self->page_size, 0), 0);
+
+	/* Take snapshot to CPU pagetables */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	m = buffer->mirror;
+	if (hmm_is_coherent_type(variant->device_number)) {
+		ASSERT_EQ(HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL | HMM_DMIRROR_PROT_WRITE, m[0]);
+		ASSERT_EQ(HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL | HMM_DMIRROR_PROT_WRITE, m[1]);
+	} else {
+		ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[0]);
+		ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[1]);
+	}
+	ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[2]);
+	ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[3]);
+	/*
+	 * Check again the content on the pages. Make sure there's no
+	 * corrupted data.
+	 */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	close(gup_fd);
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
2.32.0

