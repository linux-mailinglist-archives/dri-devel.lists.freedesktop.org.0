Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FCC576EB0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA5610F007;
	Sat, 16 Jul 2022 14:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D3110E06A;
 Fri, 15 Jul 2022 15:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcmG4GNmbrB2tfag4fHOEduFQO34ba7GDMbT4EHr5kS0+GjSEV5T/hWV/b2BFSTwk+MhXIwyqDYfXO3g/JUoHygVEZU5wL9CwjfpmX9nZbV4/L3A320Frl/S8d/D2jYiiuuP514jR3dye1k4smeJPu2CzqClgSWhdfuw96i9eel+sYkME7u9SccnOigF1hGqcWGj3SmVLOejNL9t9bYB9HCVOyeG7AsoZTS5wDE2rc1r+XvG2MFACl3wR+kiwYqVLNzGvN8iLw0dWu+Rce12PeGdozVMink8SlWqhw3mHxuXhNgX7ySyhuTd+xMz8pTwvgNVNQuqxZSB0G0eKhntow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghINYxYAaP35msqhqy+uXLJjlA8u9eNbkgf4YFEOveA=;
 b=LVq2X6qCcI7LLAEroBx3pZbOaV8vi0h35tneNYEGs7L6nhDQ/VISrytyDTuVvW68fw3pN/H3ntJkxV7AT8exCVqEsoIjGKQFkOS+DdS0KjxtlDn7DhBLpjMKy+JLDSx7shqdi6fVXcKtf4I1KVUcMc7lPzMjhhOWCrXkkcbmQBN7pPZdn3h78JDXgq8uAsoVRD1/WU+ZinUVD+OIJV4hcuN4fD4lDft7IuG1a09pX4lNHQ/3CBOJoYgtaJqfLLU4RvAyu1d3cEoeGAIBWEreng7zT7xTF49L20Z7W2oVhJeiUC4MvJrNPXdwCw8n2tDhPFA8xQOt+QJn0SRgbalg4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghINYxYAaP35msqhqy+uXLJjlA8u9eNbkgf4YFEOveA=;
 b=c++1AQwSq+Ph+FBOcYUKzUqAREwGjmebjvjilZTYsf4Axq8ZzoVpU80NiIG6Dsg6ba+/f7IBJuXvFj94MJkTE8wR7RwpQoawTtOFxgDQbXSSXS1EeYbE+AXjhFjRn9++aDYwBnO/pXyLv8YdQHTlX2oiuVzElm3ZHOwojbDpfDQ=
Received: from DS7P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::27) by
 SA1PR12MB6972.namprd12.prod.outlook.com (2603:10b6:806:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 15:05:52 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::2c) by DS7P222CA0015.outlook.office365.com
 (2603:10b6:8:2e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:52 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:50 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 14/14] tools: add selftests to hmm for COW in device memory
Date: Fri, 15 Jul 2022 10:05:21 -0500
Message-ID: <20220715150521.18165-15-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715150521.18165-1-alex.sierra@amd.com>
References: <20220715150521.18165-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35a4cc4e-ab65-4cc9-3a3c-08da667382b8
X-MS-TrafficTypeDiagnostic: SA1PR12MB6972:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /bY27H8ENSJl9dTI5r557agMFt9ob9FbjXMrmBV92gmMpMV9txC1Cum05rYW3SeTQ7c7BM5o3oMJUyjRNCX5uTcMEW+5rmxBmbOc4z9fcm9p0Sfny6mqpWt7/g5GmSJNRtcMk8iKnvkcwp3hg5xiIH6a3lfdHP29giztQ1YjL1TjTLOwZU3zpkEdghe2Qo1PDniG2u+xo06wBPfvCo+pWxYFQkJk86ntrrd0Acc3iG6cChpLP2e/RY8nEoZJaS75K58yHxoODCcmp9rLEmekzdRFJtOpVOlwatJ0afJ/8FgBBtcpicfhkSgg14w7P/Kb20XvTXqq3IVFgrLakKcZGcZcA/SSpFMueTp45vBu8DbfPSX319fDgMEIMHOlaWe3jhNwzblMHDe3ipbEoAtJJ/3AtC9ix2gtpYrmGWtMgHvlSC/UQRTNK3x/OJD/yaoEh40ADz273fcByS2aWQn5nsHY2kcUJJhxmPTPKTKwv6hxRHqMVU+8UcOhBiF8fpQNQMCjEMg5sPkgL0d4TMkjw/ParA1Lg8iGYpcKG4FNLKvfd+BZjePIvO5D+u7nx031A8W/EidMallOwdrt5owM4LhcN3HjG9PVRMOIPGz1wRwHqaZNPyCaaCV1erQ+JaGBdRWBldZjS+qL+SmKMvjSm/I+n48HOMfvo3v4bX9uGZ4mqA/Mn4PRkYYz8wDLGsbPxNSX/3gnmGc2bkvVDIGlaB0KIjEkqM4JZt9qVZwqLBCAc/KHZACItxXzlfLK/yhJmKgHJHXZSFFYNeJhwPOcNPa2UGfnJv0DZpAWVIo3Jp7VWCNrbH/cVcJjnughdi77vPZbGKY+AM3qzTHh6mvcL0gThhrmFf1RTn73B2pVAhA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(46966006)(40470700004)(82740400003)(2906002)(36860700001)(47076005)(7696005)(82310400005)(6916009)(83380400001)(2616005)(54906003)(36756003)(336012)(6666004)(356005)(426003)(41300700001)(26005)(478600001)(8936002)(1076003)(5660300002)(7416002)(16526019)(44832011)(316002)(186003)(4326008)(81166007)(70206006)(40460700003)(70586007)(40480700001)(8676002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:52.5792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a4cc4e-ab65-4cc9-3a3c-08da667382b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6972
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

