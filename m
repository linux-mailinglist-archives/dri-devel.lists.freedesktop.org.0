Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49F4ECEBC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 23:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9798110EB4A;
	Wed, 30 Mar 2022 21:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2050.outbound.protection.outlook.com [40.107.102.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B9810EB48;
 Wed, 30 Mar 2022 21:26:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlzB4ro6CDnKgl8WRCrYVT/UggBxTHg6TdXmjHCB1NYoBTKaOY7fpDORvOjbSsIFP/M4+PVIfuhxZ/3HOPbZQ10zFjjUZ51S2Ph8EaAZ9pGLPxHJowat2erxOHv6ylA7zg+gOrlUZ35tBqrCP++nwOuiL6jmiJgKDWks9Y/Cr/QP1B5lfmahn4E0jf/+H+I0NIXMfSsthYtIDpbozKAf6FLLZoRKAW/5OD6xllt0Yh4kBf7Jd4NU5n8YzWjrTOgMwQbltckhJmM3mqREZfkrgi6TwK2Xwd2+pddw6D5cjdAy+GPNI/+XPmeLwlr/g9tr4nXuITHRFXnZO6/EYvq8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+v+1UPaPthHsygapXxuY4sqVDC3cvlVfCyGWQ0h08FA=;
 b=mrycDoYlJ5vTfmkq1NebSxrzadngg9xA//YZVOWAA9t+OvfkskgehlAZ4mTDaCc+Fnn4vEJ0Eyk4a7DS+KxP3aHIyQ4lVipqN7E4Dbhmai1qzwBDLagFILlptETyK4txzbZ/SbcEeXK5wzbNvtKWdcnbNwtbQj376kxTDTa/3tUVPzn0WQcUUmQlRdpXZoqQ+Y0CRdtHuuPOfaw0JkkKhqgk9YVX1+pv1ifUi9oxdsizDJKtVettVNM1mQNqUCSDTnyhGtXatKFAFZi+V3WMBat/dQegxZswrBFdnTOnKeFFsWXZg7J8s+nelsTzTnvGRmVd5d0o3EfjwRHn1eeUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v+1UPaPthHsygapXxuY4sqVDC3cvlVfCyGWQ0h08FA=;
 b=ioVA1qB6v68WAJE4VkHKko1fHfKi1DR8m8dLH3/5H+51r83xo+8AqUUUXgDQJcMQCKMrAuoWjteaNK7PdIdXr1PxN/W/Xk1DJ/m8eGit32XW0zIPjsOPB/VtjJPXtHndU9WzaXX9Lkyj1efXXU+ACiGCCUAlXCb1/U0mCEZ2LqQ=
Received: from MW4PR03CA0184.namprd03.prod.outlook.com (2603:10b6:303:b8::9)
 by MW2PR12MB2523.namprd12.prod.outlook.com (2603:10b6:907:11::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Wed, 30 Mar
 2022 21:25:59 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::7a) by MW4PR03CA0184.outlook.office365.com
 (2603:10b6:303:b8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 21:25:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Wed, 30 Mar 2022 21:25:59 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 30 Mar
 2022 16:25:56 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 3/3] tools: add selftests to hmm for COW in device memory
Date: Wed, 30 Mar 2022 16:25:37 -0500
Message-ID: <20220330212537.12186-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330212537.12186-1-alex.sierra@amd.com>
References: <20220330212537.12186-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e94a3f0a-ce20-4c04-1d41-08da1293e245
X-MS-TrafficTypeDiagnostic: MW2PR12MB2523:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2523A314F99A1FAF4D6CAB80FD1F9@MW2PR12MB2523.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjRBXFseu8ZzXvRAAbnRImd3ZjFcegxxYWae5JBGXgQZg9fO/19cITJ5Ug4cEJxPo3HPMGceCi+PKoBZOCQjt4MYUVSUqD412VPatdIxexptGgDPaEqODAiBe/5j0bgbWKE6tyO7mMf4bErvaFepgfDzOAQO8usVbbqvzwbBemnfAZi4OyeUWggEDlXrfMcDrORB8RFwINFRGQLqDPz+iRj/mn0rLik4vvPRxfNNQoZt+xXcIiLg5oW60pXP4W3GrJjgSGlOjAhvezaBLo9fkIeTdmJX+hBRe3DgvwXYdBi4LuG+U6Vcb27E5dnoOkGNMXDlwdZmGWJQ3TXYLiCUa42Dcxvsotxgaf5i8OmY4Yu+wO0DgjMhrbsz8GlB6VZVr1HvMlTue27Axjcf9Hdf5NshS29U/s7kw0h+Q3STk0KzovvYPTrJdyyvlmX72Oo+Iy2DX/hrbu0GSNV3NmLjgmAplUumlijVvVJE46wdlEqiK5nho+2n9FxLtQTOowRI8yXKkDUuQPn63VjR/qzlN23EcfvlFSU4cW7rDfbciTVJN8x7NPoCbGQUpydLSMFCOZQPpyd5gTc1n5UMfyoZ3xEAQQnY1tVZY06dQ7qkv5JIxUFFkKnjqtZdNOLhLPikxKCQlScEpiMfnMyyiTJceP1GMCpIUFzXLMhEhOg+j3JQ2d3Q2/rsAUwVMg/r7ykF1DqISxecMB1x+VAZg1wxOw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(40460700003)(36756003)(16526019)(47076005)(508600001)(4326008)(83380400001)(86362001)(2616005)(82310400004)(336012)(316002)(26005)(186003)(1076003)(44832011)(426003)(81166007)(7696005)(36860700001)(2906002)(70586007)(70206006)(356005)(6666004)(8936002)(7416002)(54906003)(6916009)(5660300002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 21:25:59.0144 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e94a3f0a-ce20-4c04-1d41-08da1293e245
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2523
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
index 65e30ab6494c..d70b780df877 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1870,4 +1870,84 @@ TEST_F(hmm, hmm_gup_test)
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

