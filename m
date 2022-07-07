Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F0556AB63
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863D112BA5E;
	Thu,  7 Jul 2022 19:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CB289CB5;
 Thu,  7 Jul 2022 19:04:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ilv2JHrp5i2Nt+j5eoc97nQfb6H3kjY6IVu4TJ6QI61e2AOfj4ngdykLySzDRUQBKZYh3ghrgTiPY6yCRLW029x5u6a+LVVLXw0rg6uIuX7sRcCSFtxSISmjjEocQ00nv0LQDUy6zn+pOkfkn05p5DEHmMV0tRVLrL2DhdrzAEgic8VKwvPOKFVdnn4LyoeoCPe8NobFQ5PtZs/FuBqLPgfXeF/hsYEtQQIoaSRzHgOxJosXoFKaJlgsRVzC1qqvB3vXAOW7GGt2/0mvjpflQmqD2HMQnsdrybsdtg7aFI4bBPhr8nzTUYxD/hboMih7u+LHk48nCZxhEO9nZP2DzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghINYxYAaP35msqhqy+uXLJjlA8u9eNbkgf4YFEOveA=;
 b=oSsTapTutKx+ODYOZhK7endBHIi5r/qhW9IJ0p7U6fRMu7PVlouMky8ZdqNoe1OMRmJTLoleVaImw61ipmJE3+vPPbxPns5pgs0Wt4cKTtfHz1QVyt6cFeTMZ22fU4/t1bSLhABUs26jD7J1pPKJSrBvwVtnUIX4UiWgIfwCmHlGrLt7pn0vD2DbX2Y13xVZNUFfx96g/DJ4P6Y3qLYmF7qYOnraUjT2bBCSav5N1ZsCYJWbS7UT/gaAgfjiEFITcEynPr7Ps/QI+GCCbJFlBB1eNkxBzaufeEPCKW0Iu9gG2+3211qXKqN0YYTgTQ7vcPnh5nBmJmwCVlooUXx1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghINYxYAaP35msqhqy+uXLJjlA8u9eNbkgf4YFEOveA=;
 b=EH8OeYdzBLBORq76eKvyZgmcvsiLIkF9nn6985yrYCmWG2wO8FVIXRzZMy8ujRJre2x9AwwUC7HFrMvdKhQplshiN28nU0lQZ9Wrd4JbvDE4VdVER2xBzfVgFJGNgDktGpjrw7ub/vMTGi+1TtjIx92efGlOn9K1Kf1J3YD5A4Y=
Received: from BN0PR04CA0099.namprd04.prod.outlook.com (2603:10b6:408:ec::14)
 by DS7PR12MB6263.namprd12.prod.outlook.com (2603:10b6:8:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Thu, 7 Jul
 2022 19:04:25 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::29) by BN0PR04CA0099.outlook.office365.com
 (2603:10b6:408:ec::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:24 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:23 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 15/15] tools: add selftests to hmm for COW in device memory
Date: Thu, 7 Jul 2022 14:03:49 -0500
Message-ID: <20220707190349.9778-16-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c21ccae-76b9-40f2-b892-08da604b8216
X-MS-TrafficTypeDiagnostic: DS7PR12MB6263:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lQPaEf7T6+HjGUNaQiYpaMmyW+BvNUZaLDQbqw7bM+uQQcMm/ttqHa6hCJaMaY3krwYP6hAwwoBQOskArPF/XriSWgQWEO7o1rRd7TwZrzG+5dlNQRb3bnv6CX8KeuL4mLS3vUVdzQ+b4mhZy7VHVFJ8TbYF/DnoPOWRaW42uWSO5jV1ZLAm+qIizZPzBD6BY7GbI+BZyMoaATVMdMc8iNXYsnTMTOJUOm1gLHEtdM84VucoX54oDwiulH8AnFreHPZjcZK6cnynR77gN/rotOdeVbJ2FbtQ8XyWrlo/aNM8b6VMCsMRrVaA0wOyfXae5aBnEkgXVrrQ7d9jDt2nw8/AdgRHM1uXlh0kgpYtg8HYZdiVWxTrJnTKveeFLE3gCUEf6xNXGJ2thATrPXMGaE6bRA7kX1ajzLa0aK4dq+vLeCK6zqTTLJv1xKc2PIpEgMLo+woHT6WtrmExQcbxcB0FC6fdvijc1XMT/Hw3GfJXcrz0+lE+gOgSYgzh1SAKoGiTVr1r3qjlt0P/8qJIH6vVAOGQZ74Xz0o/7r0qD+e2/LlLWzD8TtKADrTxF0a3D/00BQNF+RahEGLaJH+jgwG2yc243hBvSRHvjxLAyPNu8vWtu+2eNMifp5Ey5r9PaypXLCVXkWEHxG/8qgLEbts5+v1tRU7q7m4pUkCdv5/Lc1s+vC5PtC1uDC8DcU9a/YV3zygHtCvZhgh35obHMbiJYZ/MljNxKvgj0F2smY3mmacAt+j2fi3zkC4nGLiURbUEqcwkfgGvhu9ztjBpLYDtOIH/jkMzAIYPvbhLinnr6R4zggt5bsc8PA7YnmLdvMV57fhTRW8vOL6JdJyms521M4HWm/489gavaAfDm8kuRtIOT1ZoePmU+biSKQl6
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(40470700004)(36840700001)(46966006)(82740400003)(47076005)(356005)(26005)(7696005)(82310400005)(8676002)(36860700001)(41300700001)(6666004)(81166007)(70586007)(70206006)(2906002)(4326008)(426003)(40460700003)(34020700004)(44832011)(336012)(8936002)(83380400001)(1076003)(54906003)(2616005)(316002)(40480700001)(6916009)(16526019)(86362001)(478600001)(5660300002)(7416002)(36756003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:24.7062 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c21ccae-76b9-40f2-b892-08da604b8216
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6263
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

The objective is to test device migration mechanism in pages marked
as COW, for private and coherent device type. In case of writing to
COW private page(s), a page fault will migrate pages back to system
memory first. Then, these pages will be duplicated. In case of COW
device coherent type, pages are duplicated directly from device
memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 80 ++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index bb38b9777610..716b62c05e3d 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1874,4 +1874,84 @@ TEST_F(hmm, hmm_gup_test)
 	close(gup_fd);
 	hmm_buffer_free(buffer);
 }
+
+/*
+ * Test copy-on-write in device pages.
+ * In case of writing to COW private page(s), a page fault will migrate pages
+ * back to system memory first. Then, these pages will be duplicated. In case
+ * of COW device coherent type, pages are duplicated directly from device
+ * memory.
+ */
+TEST_F(hmm, hmm_cow_in_device)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+	unsigned char *m;
+	pid_t pid;
+	int status;
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
+
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	pid = fork();
+	if (pid == -1)
+		ASSERT_EQ(pid, 0);
+	if (!pid) {
+		/* Child process waitd for SIGTERM from the parent. */
+		while (1) {
+		}
+		perror("Should not reach this\n");
+		exit(0);
+	}
+	/* Parent process writes to COW pages(s) and gets a
+	 * new copy in system. In case of device private pages,
+	 * this write causes a migration to system mem first.
+	 */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Terminate child and wait */
+	EXPECT_EQ(0, kill(pid, SIGTERM));
+	EXPECT_EQ(pid, waitpid(pid, &status, 0));
+	EXPECT_NE(0, WIFSIGNALED(status));
+	EXPECT_EQ(SIGTERM, WTERMSIG(status));
+
+	/* Take snapshot to CPU pagetables */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	m = buffer->mirror;
+	for (i = 0; i < npages; i++)
+		ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[i]);
+
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
2.32.0

