Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87B455BCAD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C216D10E611;
	Tue, 28 Jun 2022 00:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AF010E6CA;
 Tue, 28 Jun 2022 00:15:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBz57H87qwXpBAHo1mHMH8Wh/J3slfRMbxA9lv9WlgSw7Dd9C5u9VoHRFOkENOOGJGLIWN5QSEdu3yqqgxxqhkDnIQJY+XOq57gKNDcnXkKTxGjQbz8Tj6QHgperCJu8dJVELrVkv/fU20vhoSEJVudLY4NNOUIpLGlWAk1ZLNZQrXMYfj8MnKABOb16WjVIA67Mj4E82XSx6InthBw1xcWhq7oFBqR6g24XUfp1AEyQ+xQjO1jyTPB6Y2t/oHz5g9sY1OS2cqtcEE9QRjflvTt+VQCymNAJ07Upw6oJ22ZN6sYJV1jCxKb35G+EDAx8K4O+emGZ31jOy0nNpWgquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP3ikngykfp62hqgKGCY9CKncoZ/5EVzq4BZbbmWmCY=;
 b=agOrR8A8jDq259B5RWFo5Opwinjn+PnAvuJkC3kutsr0C4SlU3F6Tkycg9u1V9Zwm3Yxu0Bu2oQiAC8WK8j5o1GYrYXXQwVi+jK8hxUTkqKljKdVU3ARM4CDcdo44a9sPLyuLJGM29F4A/kIEtTtKmY3cwb2ZsceKMSg+6ssVT7kFKh7QOu8S/wBrKc8YlHq2CO6JjZ9H92tUIUGvRr8M0pMe1tgc/EAl1wL9bO4DVWGl+8IShKLCmU670naHqFsUt1QjGPLlWIxUGYH8v2OL06Ib7zzwwvkm90sLbdBcM77QOjAx2ZKymiRpWt0C+gTvx5jfDzipk3ECVLU04JrUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP3ikngykfp62hqgKGCY9CKncoZ/5EVzq4BZbbmWmCY=;
 b=G6lxvVYdPMJ2rH4uUqKCdGDP6pH3Zmpl09KZNXiRx3On6SlqW/ivy3B9OJ/eZyDVF358oj4H12FH3oahPMZjMhmbE+9g918Lx7MUble3iE1xBpYJpMueO188ip5GEHvP2/IDvTQcAT8ecM3XvosI1ST4E2Vi1C35u54UQT0W5T8=
Received: from MWHPR15CA0057.namprd15.prod.outlook.com (2603:10b6:301:4c::19)
 by MWHPR12MB1600.namprd12.prod.outlook.com (2603:10b6:301:f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 00:15:30 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::d2) by MWHPR15CA0057.outlook.office365.com
 (2603:10b6:301:4c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:30 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:28 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 13/14] tools: add hmm gup tests for device coherent type
Date: Mon, 27 Jun 2022 19:14:53 -0500
Message-ID: <20220628001454.3503-14-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628001454.3503-1-alex.sierra@amd.com>
References: <20220628001454.3503-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d70d9523-0b21-4b89-9269-08da589b4f83
X-MS-TrafficTypeDiagnostic: MWHPR12MB1600:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0rE9rkuu3OrNG5ucWEcmA/fXh3OexsxLG82bEsJSFXOyYON45H8UtvUCc+EngKqomAXltN5ACBkQFWOxY6dMuhfsHTKURDocFReMn1Uf82285bqu4k3Oby7hTWAbbzOxn/tQOJQB8zLfTuPgQNdEg2xt8dHfJa4PRjQaaBTvf3ZufDFLZpnqtEgqN4ClCINY0az2QoE4MW/XTMYK4vm/3jcB/4J/RrTuDnDZJF27rnJhwM411zqV9cv5ZE9zSy+Hvcibsmrh77TWm4vTRu7M+edzPl4FU7MJyWw1swq50Sl0i+mEGhgIQpo2bXrvSEdTPCGA1UZoERiiry3XcDofk19MfnuaxCdAkH/mfed/5Qy1tGQa9XZNn1vWmYP7Jrd4UOjuE2mIvZMDdu8oHG7b9PIgTp6Bj9rT3PlNymcB0jDWckglGc3yGHD45AxUvGjhnan2lQeNmaED5oK0Lh898p9pYWBssIF3/zENmfKfhkzkPUpB73s1smsZxd07E5JLbB8M6XZ0kfsf6xJW5ABjqb9/3PJ1wOuZhFok/5qo1Y/3OPRKQ8UcL469a5UucJE+NCyGqx3QH5NdbFxHgr7SlJyK77H+sXtLwI0tWdpKQ0+bDNfppeYc5s+zLEP0Xxpyu3YjeyXg3UufAGY+Xr0WpFOyOJtymgFv77fbpfm3V4z1P8PZYE8Vixd1aubV94DDjmdC1PL/ZaZLrX3WK3HaLxZDsP6ymPV3WVoDP7ArFYNq5hvcO/IqN25l0m9I5+Jcv5Yxdi1z67qJmbMbe13ocUAPek72/f5GV0KwcWCRPqFj5uKt7pp7UHHoBzqOSMCIDIRYY7tZoa/QS/IH6njfw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966006)(40470700004)(36840700001)(316002)(336012)(16526019)(41300700001)(36756003)(2616005)(44832011)(6916009)(54906003)(47076005)(70206006)(40480700001)(8676002)(478600001)(4326008)(70586007)(7416002)(186003)(1076003)(7696005)(8936002)(26005)(86362001)(40460700003)(81166007)(6666004)(82310400005)(356005)(83380400001)(82740400003)(426003)(5660300002)(36860700001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:30.1669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d70d9523-0b21-4b89-9269-08da589b4f83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1600
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

