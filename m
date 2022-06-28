Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B418F55BCAA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9BF10E7EB;
	Tue, 28 Jun 2022 00:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3F610E681;
 Tue, 28 Jun 2022 00:15:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTJaNPkXxJECM1mmbxif8iMSIYaFjIU2sBnej5cKLn7w2gUDBNhs0ha+PXj1SrbSb6tNi39JpsAPUzDS4CnghQMRBkOLJDoIwEGbmZk4QWNXuIoOjtaYBHnWobVU6KIAYUz9ykjaDOpctc2KuUaU4KMwV865gSwUHI/18XseErGIvzPbcEg5W9dTA107ihYBNyru5iWyF4EbB/Acjy+Y62QBOokpwJyv0TolIqJg02JW+0mhghZKBXIFWnZTb3wHgr98nhUGTAKa3BKlz+YzT/285pouLPgZdiWIv25cVQkJbaYlcNGS/Gon9hXlGEhS9t0IrAgiLwqNtFqU864atg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghINYxYAaP35msqhqy+uXLJjlA8u9eNbkgf4YFEOveA=;
 b=IgupSAdNkkFXpuCFifL1ydvkSxkrLrdoyCgFXIRAcnFpTG1bfSMgyYB24wWxed2QzWEIB84m05OjhkO95ti3eCw91yb8gDEGUROv2xZ6WI84+IEb1RLYw+99diz22OU5ZBS91adPVS9EbCTfAMpxjnZe0XoCMoNC13CyVWuFFPZ9AZI+q0+XQ3OHua0m8il/7tkR1Yal17hbiqB/m7DLGuApPG0t7mIZowchyNLnhiehsfnU0O35KRkdaRrxhPz8qt1xT04x7jAQIAp5rF1jLh2apPwW5X3kGhTH6XGoJ6/xuWvR/v4xalQyAPHq+rSr5RJauLHTaHqoExPBXIK6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghINYxYAaP35msqhqy+uXLJjlA8u9eNbkgf4YFEOveA=;
 b=yXISrZtzHgk5rLZehdPClC8Vh1JT6Sm5ePwXzLkBkfDEgQx1u9U9BFeYDQQdSKZB/cOTmdy3GWQbYpXLLOQE8fqGl0pGyrmeh3vKKQKWwSeQX9SLaeJDIKv7Tal+mv0tRWn9r+oOS5iVgLcLFvgAe2P4ePR+MotuNrDrIy3CIe0=
Received: from MWHPR15CA0051.namprd15.prod.outlook.com (2603:10b6:301:4c::13)
 by DM6PR12MB4012.namprd12.prod.outlook.com (2603:10b6:5:1cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 00:15:31 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::2) by MWHPR15CA0051.outlook.office365.com
 (2603:10b6:301:4c::13) with Microsoft SMTP Server (version=TLS1_2,
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
 2022 19:15:29 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 14/14] tools: add selftests to hmm for COW in device memory
Date: Mon, 27 Jun 2022 19:14:54 -0500
Message-ID: <20220628001454.3503-15-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c37df3f6-be3d-440e-6576-08da589b4fd9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4012:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XrjNh2KlBDpqiIpVSINi8xseJUH5NoI9P9/R3Dc6llXKF5EC3t7CRojNU5d24mHAdKi4GoeDGu7dz3R9ZHJ1dS42evo0JTCZsMwaPzsqko+8/eJQv3BtsFrqo9o8YvRbPDYhlbb01NRzRI8ZxVc/rT+DHGGuTf2l6Iq4kuEIHBI46VYTslHeHfjRjOxD10U0dV+QUv8/oDbaOm5dMdwhJowjud7DD2mcRTTzY4d5Pzenbvjpl3ptjbg6E1ou63btxrZ5RFXTfSxHP/NLQPS1+7NAwWnCyq6UrQpibwMSuprl0QoJ2MWsR65igcpAGwR47gaz8c8W7Un1tCo26GhgsrelNcl4baf7ebBaR7/XAyhXDGCESgH0QRylihEK+fyE955lTE0R6FWbT/dAuJg/VX+Xvzb353LXwQ68leb/Jv7x+RfqwVmtmibNIUN6WRWcZ3ss9G13L73IAOEDnAXmirq3K9ypO7KtLz3d3PoFK7t6QxrgP40gbju32zioZ7QtE+vWhpV5o75grl3N/WzHOWqH8lF2GWupv1eg0rWiWR3k7gREXYMQsP+aWP9vBiY+d1bNh3GYL9n78Boet0Wfv/SKzlvWNaaFrA0WUgSgnw7bWfF6By2Gmzj65+KnbfAJTsDziM5hfunUYbYwhmhH9TZrWn8y6REAtf4CEnO43cz0EhtO2m4TQt8AcZxGp9p5sDmHjdaaG0/M9aKFnzgqLGiLuivByhVC8C26tW2R1/TGRKTtnlbv3lFkZBsVcgN5zO3g2X60Ogblpx0/TPdA9pjeJe/m57la8ncWEzizATCsIrtR1+CDFonjFX5UNBMdiYzWOXEuz6PD36+U29dXHg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(36840700001)(40470700004)(478600001)(2906002)(44832011)(26005)(8936002)(8676002)(70586007)(36860700001)(4326008)(7416002)(86362001)(54906003)(316002)(41300700001)(2616005)(6916009)(70206006)(40480700001)(16526019)(336012)(5660300002)(186003)(81166007)(82310400005)(82740400003)(6666004)(47076005)(7696005)(426003)(1076003)(83380400001)(356005)(40460700003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:30.7294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c37df3f6-be3d-440e-6576-08da589b4fd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4012
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

