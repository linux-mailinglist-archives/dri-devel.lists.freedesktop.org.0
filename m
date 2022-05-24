Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE968533172
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D880710F2DC;
	Tue, 24 May 2022 19:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B09310F197;
 Tue, 24 May 2022 19:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrSmnYxZA4faeQ1uvIgk4Se4AWVPKamtp2jq37GoseBmvWyUF6HculERXZtVm8MYk33OSCeV355U5Qc/VeKIg+koRLlRmKC/rsMOrHhu9WgKtsYPfJqT319cnRJA551ejxrY+BO+wsAbcvk6GULU3VpbioHplUXZ3lrNItXv0sd8n/evEeLzmlygwiE9lM2dOMDlNWLSFRweQlFDWMnPNde/s95uZvuLtC9fkdbbPsSkElGynJOJx4xJB07X5BazTCMkmXeeTt1HtZNarynPU/rx+23aqTNFVyQZxt0ed/9+cKrTWAPCl5gKKRM6sCctx7R8Qi4D9PwJX373rmm4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDtE0UiWruDuhx3PGoXdolkeW/K0qLVDBaC3nvm9Xp8=;
 b=Axb3vmCtZ0iJTtEDTXWB7rW1o6jcf23LVSdmkZL4vQtVZNvbusQkcRt9ussksK0f4IJv/ANRAIMf8BcGlaDYpMb96nAmU1JKRFYQJI3wh9EeG8oPRre/Bez4Hhgb9O7BjB6y7y1Qv1QDtbhNf5ghtdi6I/s4n928dBd640bzozTPk6N9MylTZhvPPhOo6HgU0QCn0T5bm/n6HPHQYR00ZJQWaj9Qjo7bXZJeYffmPVe0rteCkB+5ROu0ECeMJLnkT/rwG+doVm2mnVtMKVkVgvGTNTP6RynNfRUMbr/t9aWml4CJCBqI2/IaPx3mzwp8FHPkFT+JGm/3Rvd4rtlqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDtE0UiWruDuhx3PGoXdolkeW/K0qLVDBaC3nvm9Xp8=;
 b=fDDMcnp+uvcPBJS4lJbgS1ixMMA3zjQ5WGY5ElGWtFaEcqnVHwT+R8z9Xv88/dyIM3uKbbjjtlY0WJXU/iB+rHccRJUFuwsSIKOC1rbl/ZPdHJik6ypewEp5Uw2awRUzEGYlPTHe8GagpUrhc/zGw/pUepSjv5UWXPjC5wqItTI=
Received: from DM5PR17CA0064.namprd17.prod.outlook.com (2603:10b6:3:13f::26)
 by BYAPR12MB2806.namprd12.prod.outlook.com (2603:10b6:a03:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 19:07:28 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::b0) by DM5PR17CA0064.outlook.office365.com
 (2603:10b6:3:13f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23 via Frontend
 Transport; Tue, 24 May 2022 19:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 19:07:28 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 14:07:26 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v3 12/13] tools: add hmm gup tests for device coherent type
Date: Tue, 24 May 2022 14:06:31 -0500
Message-ID: <20220524190632.3304-13-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524190632.3304-1-alex.sierra@amd.com>
References: <20220524190632.3304-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fbb3b7c-ce5a-4e2a-0cf4-08da3db8a544
X-MS-TrafficTypeDiagnostic: BYAPR12MB2806:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2806A5E345AFE2BF85237B76FDD79@BYAPR12MB2806.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xLLS6WYHToXdJ0+aHNJG0XDOD/yYxcg7qs7YA22gLKXF0+hVemeseYJ+m86Vai+A3UBLZ4quzdCqRvrIhHgzdaNxgtMSG6CLIl4+6gT44Gk1gF/TaiRPCcnHNfx0xnDUtQFs2j2YHod4O/EEIfSgjswEYTMaCUzY+BrzkkbDsmBJIPpC6eYrsb5plNkqCl623w9IabjA7P2zanKwERlaX0hkQJm3nK8GNguQLHQkobXboZdmkvFhUdPV+dxYe5etQ4GfvQw3+CFixd0hwiLQpIN7lBRdj/ocytmnBC1kOVkOCEuVLiar9fBqqy4MWld6B9UJX0oKidthK39GTPFGIfQjsQBiHbb7SsKqUnp9gCVCjJwVt70Sgl5Pqlh6LWpjxHzUaytYxrTsXqCs3PdFS7/cvnLb9503XpfiK59POzt+11zxXlWcYe8Rh687XogXSrHO8nkbefkC/qWAOFqKF1Kww/TodVzJWAvH8gu0BY5vKmV/9E6hmA8OvDX9SCcFyWA1GmKXrAUj53DKR3LZCQsldobhRIzPPiAW/aS+W9Buy9ILHAyO04gK4PaYr1gwhGyJGK8+tWBupHvlzr3PR6iMqEpRJiVi1QMRrMXZRjPvkvs6T9hMwDF3mzfUNlAy7bigERrAwBBm1qKLwoFD+zSpfOXkAQn2vXUVnVN/mXXJFJnZsCBmFNzIiCfp3/jpGQ+9WGUOrWQMlnqmaSYUZg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(356005)(8676002)(4326008)(1076003)(7696005)(316002)(16526019)(6916009)(186003)(82310400005)(70206006)(70586007)(36860700001)(44832011)(40460700003)(8936002)(54906003)(83380400001)(81166007)(6666004)(2906002)(336012)(426003)(47076005)(86362001)(508600001)(26005)(2616005)(7416002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:07:28.1230 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbb3b7c-ce5a-4e2a-0cf4-08da3db8a544
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2806
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
 tools/testing/selftests/vm/hmm-tests.c | 105 +++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 84ec8c4a1dc7..61a02a6a3dea 100644
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
@@ -1766,4 +1769,106 @@ TEST_F(hmm, exclusive_cow)
 	hmm_buffer_free(buffer);
 }
 
+static int gup_test_exec(int gup_fd, unsigned long addr,
+			 int cmd, int npages, int size)
+{
+	struct gup_test gup = {
+		.nr_pages_per_call	= npages,
+		.addr			= addr,
+		.gup_flags		= FOLL_WRITE,
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
+	npages = 3;
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
+				GUP_BASIC_TEST, 1, self->page_size), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 1 * self->page_size,
+				GUP_FAST_BENCHMARK, 1, self->page_size), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 2 * self->page_size,
+				PIN_LONGTERM_BENCHMARK, 1, self->page_size), 0);
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

