Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A00539799
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE2710E512;
	Tue, 31 May 2022 20:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2083.outbound.protection.outlook.com [40.107.100.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B402E10E512;
 Tue, 31 May 2022 20:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKa5ezAysuEbZar9iOYpt4YLcjUcNWpseiLHqdzJgreXe8Hnzn5yD3HgREyXF6rYsv7WJ6is05h/wOaH1EqIjhKFwsYzyajfMYtzwGBYhROQDACLCRWTv/9Lpjyhi+zuilQPdaFFShkW4J09Q0emq4cVz7TM6cVhGNfFLith8770VZ/b3D1cdi0hYb/AULPMfmTNP/L0u7r9vlUVNag6QooGj/QAncWqeXUthznpd4NqNe1rBRk3TEGZ1M+ko9X9ekqWp0xpACNg13hTmnsKeAMDzyHKkCzyPjitf8QU23/rALSxeMWS3SRCaZAG/DkJnvN5ARsQLjcWAxHTMZ1Ayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGFoeMuycSLm0T3Ola5avl2Wy7hr3oRWaQlczxEFybc=;
 b=I8KWR9oOMsxXFeY2W2lw1Fx2bl4WJOIfzAa1hIsXw5/twDV5szF1f08sqMs9cAFsAyyJa3DaHXM1xfG1z/3E0kGJi2erFXOvQLVDaRZNLY4lcgNuT9uS+So064R4YmFXA8RVXkuIIyMwOK+BsatNa+eNoxJA1LLMixgXQSmly64PpiL9NRSBHyoNAvSyddD5oDfjJvJqCcmL3VIQpglRsLX6DJx5yNIumlpO045EA6aB4OV7NVo/QcAjnu/5qrpSpSL8wytc744rmHOomoB0R4Z5M5QblOu85aV3zJY2lufBbPf9FdMzHEi5CxJTp2Q61U/9mi1P8lGw4y34EevpxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGFoeMuycSLm0T3Ola5avl2Wy7hr3oRWaQlczxEFybc=;
 b=IZMOOOpxwDYm1Wzbfjbkbe5XtbUUGJ+tdu2AyNDuwbLBwO3F5w+kTBNsbqKqpiekWbJFHO3ePZQv9Q1Xg4k7oM93PiLP6d5AgN0Y1zTaHyzyuv094/0fCnI0X5uW7SPMuWbkZG3QaWb1VSdkOfuh/QapJLywio3oWz51fRqNXZQ=
Received: from BN9PR03CA0392.namprd03.prod.outlook.com (2603:10b6:408:111::7)
 by CH2PR12MB3654.namprd12.prod.outlook.com (2603:10b6:610:22::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Tue, 31 May
 2022 20:01:05 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::bf) by BN9PR03CA0392.outlook.office365.com
 (2603:10b6:408:111::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 20:01:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:01:05 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:01:03 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 13/13] tools: add selftests to hmm for COW in device memory
Date: Tue, 31 May 2022 15:00:41 -0500
Message-ID: <20220531200041.24904-14-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531200041.24904-1-alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2c9df9a-bc52-4466-e8e1-08da43404b8d
X-MS-TrafficTypeDiagnostic: CH2PR12MB3654:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3654A197BD41BC433CF237AFFDDC9@CH2PR12MB3654.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EzoQ7MLxyDuO69NzGWKIK8gAuHeSzqrQrO6Wq4xw0Ssw+DbNLSj8IH63ScxQrg59p3yAA3u+lhqgi0Xpu/4RpC7ijNKtSZNaN0VGj37EiHXERm13/oLp1RGbc4VzJnndPSkWdZ3yneJ5eKTMYKYtplS56Kmq69e034xqUmB2OcSNS+Frbrn7nEtFH+AWlOr3Dyiv1zwSPRgAQeAnRWINcSUfwTzWG4QSv5z1iKX6WEvSZTh3p3BFaH1qD3CkxVNgAdtpTzSsHCbh39wF8QWVQT6+sX9Ehs4E6brTGz8A1eLQOFIfOL4vf9t+QwwlB2+Z9R8HAxiRMWvaNyWFsexrhe5ZOW3IckAiKfPenaksxHV+4F5GsugKIWsrDXvyZminGgo8t8cHWPS4P6MzSyfZB+mjKgUIAK5W7aw7pnTa2+NSVMURgVuxFnrR01/kUGfX5fyqptuU7nAiEWyIjD3PpK3utkmzWOjrgdgDWiUPqZ56w/lJ1bxSzomwC6G+n4daX+zabkd78bqJV7EjUJL8xOJcDEMWlpYKy5a/6NVjaToIdm66423FOmU3XYf1iuue4Q95yY2zM+8pVgsCkJyvBhl0/OgTN4zYMqhTCSoqOj6cFnDyo9DVXSpDeuMXTxr7pOsvAEqiJJvtuk30QjBASZyg0QkY40DU8zsElf8nF3yb2EOlOOvCFcHdXSdPk+BFFAST15Ck9VDxB+763fywPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(316002)(86362001)(7416002)(356005)(6916009)(81166007)(54906003)(5660300002)(36860700001)(2906002)(83380400001)(44832011)(47076005)(4326008)(8676002)(82310400005)(2616005)(70586007)(1076003)(70206006)(186003)(426003)(16526019)(336012)(8936002)(6666004)(40460700003)(508600001)(36756003)(7696005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:01:05.0280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c9df9a-bc52-4466-e8e1-08da43404b8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3654
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
index 3295c8bf6c63..2da9d5baf339 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1869,4 +1869,84 @@ TEST_F(hmm, hmm_gup_test)
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

