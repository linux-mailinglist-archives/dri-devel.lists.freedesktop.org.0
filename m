Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF63D51CB39
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC5110F96F;
	Thu,  5 May 2022 21:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D8910F970;
 Thu,  5 May 2022 21:35:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcZkF5d5Swf5dspJvhDvxsDLpUyXOu9siD4m9TqBWZmezETDicCaXM/g/6feh/pP93h6cfOBcdbsaWwbYpB3+7t8rwrIup5ksidtQ4UE/FAspN5DhfrsEJjYTSmpcGUoEKUGCNM4l9ohiPPnxh4mIe+lZaBR9S5kbOkqmO6cIoMSI3VVB6qSoIW3DWknPZ1PQRg22ZweLLhYGVqZJoXdWPgADklBjaVv+2O0Ej2kElKa4dP/QqsQFGxzoKIbzjEFtqVdKcg7zxfW76mvOphawoVm29aoEQwampMBsQ0QgiiErJ7JyHjq3fbUIPBPBGw+kSHzDM1c2suOic103RroLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+v+1UPaPthHsygapXxuY4sqVDC3cvlVfCyGWQ0h08FA=;
 b=FDOWVixT+7Ge2xV+HYgOb4F8Asbsm/gWf4Tf6R0U+VUBwEpU0177waVnP6WOt5dYi+eDqMvSOIrBzLRXvfIEXPB9lBXynazCtqtZrnf3MxIkMUEDiFvMP97j7f5pJUWSZc/2Q4Lv+ostg3LM45kArISqCNZqwGiO/dBcFjpmRqw9HjrhdPiFsySReWvli7N0ANaWiT/LFgJD2Fu1rhpgRvFvctnfZAqqEHEbL0yoxtQVKE7RR9YQ6EDPLrCuePjiJrsOkTY2iUfIMgXuiUHl0ocOHMQrJ/zqe/aYqCGU8earYZSlvSfJ+MNFdF1BFg8UnDIYf97jahZW0iR6w9sg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v+1UPaPthHsygapXxuY4sqVDC3cvlVfCyGWQ0h08FA=;
 b=BU+ZP2k4XFl6VahBRO8AjeeXqVgDaXOQvnYWvLTvFrBjhFNM05vr+8zf1hAY/4gAI5Sn1NI+ZsuIwAb9HLA4I5qkbWwyfyvHFfo765lqFPCZ/CPGyY2phhbSuW+CIJB3Z5sllKto7mAVCWRUc+VK/pCNuOhVz84MCN/858Ik240=
Received: from MW4PR03CA0027.namprd03.prod.outlook.com (2603:10b6:303:8f::32)
 by MWHPR12MB1376.namprd12.prod.outlook.com (2603:10b6:300:13::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Thu, 5 May
 2022 21:35:10 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::48) by MW4PR03CA0027.outlook.office365.com
 (2603:10b6:303:8f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Thu, 5 May 2022 21:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 21:35:10 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 16:35:05 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 15/15] tools: add selftests to hmm for COW in device memory
Date: Thu, 5 May 2022 16:34:38 -0500
Message-ID: <20220505213438.25064-16-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505213438.25064-1-alex.sierra@amd.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18397a44-07b2-427b-c428-08da2edf219d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1376:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1376B4EE555D03DEB42FC22CFDC29@MWHPR12MB1376.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o+FpmzbRPhi6/A1DyxrxbPiO2wzcHSkkhDZxbnT9+cU3YjUR1KfzC3hCKc8f3Dtfwgp9QSN+fNqRgVRNhTNw0PAWz/lSlHtPGfuAoJpSRrrYqIrwwARRNlVR0zw9K5DfXYWJO7wZ4WkUNr/D1rmPj2ucz5/m9tpCpaaABn/ERujJwJIWvGKVtTsw6JihF+GSFfxwKpPoxOHzkOKNFRGSFC4DL39Oq/Jgn/8rmpusGp5G30pB2jSYkF4dHMq0yxNBdyUbALHBaWskSSuHw5bkfgiNu7WhXKX/bIrysWmaFcg7NtxPOmdHRw3fEQlQt9P3SQP1W7Nx4FLhl8yMD/Vgm+cMH0qH25SbcjfpF03U4QQxp9RdQB3uiixaFByieDBCgN83alNrouoSPSSE2VKyOSWUlse1dBGlhqo2rO01RtPgpFtpn0qB8zqG70HA3bsc5Cz+Isu2Btm+Wicd5HM5S7wipAmNcdWQemrytsVb6hESI8D7PRmj6G+QpUldlQJYoHRdpuLt0ISmIsxLz+aT+IhJ1RsIM8hBskTdMCvLrlQg49elduCBaRHoigUOa1gRTPIRSGrX5wB+EOGFJDZLjy/EbuqOoQdN10NQGGOXaEWK8Gol2lYjsaBapXp0gAnrPBYjCnDPmytRXh9dwG1AhrwuqRM46ATFT4MvmV8WpebzC3xx+ZNRyyhj3La93JJ9mVgJtDejW8Mi+nd2ZyoPYQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(1076003)(426003)(83380400001)(186003)(336012)(47076005)(36756003)(16526019)(40460700003)(2616005)(44832011)(82310400005)(36860700001)(2906002)(70206006)(8936002)(5660300002)(26005)(6916009)(7416002)(508600001)(316002)(70586007)(81166007)(86362001)(4326008)(7696005)(8676002)(54906003)(356005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 21:35:10.1043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18397a44-07b2-427b-c428-08da2edf219d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1376
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

