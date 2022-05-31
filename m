Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09E53948C
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417A10F676;
	Tue, 31 May 2022 15:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B47C10F4DE;
 Tue, 31 May 2022 15:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIEAXMtvk05EoL6YbBkfBmAVF9pnyujpHojCEwx9kKFmhGMzDOj6Hg+OKahhVbrHBp/XgrsNrq1W/JjaNiptdq31blr+EqRN1gKiG6RygTmeFN6Q/B0jlY8zb7Dmw5NljUInDAxBx6LJfQtZjxHTVh/mT6OpNJPmKufUrc7p8hy5UXTmVapQTEsBxON2vUdwtmqTLwafuVkcbEtj/UOSwBK6FNAr85fyR90a3lTlqh/hZPx2N3KVEy7wx7wESPhJlJdgzpvh1vdVBQcVEL2lMOefiIaf7tmcQQxafc9CJVUi71v71NzXLfNiNfFq7orum+tIoLuTZaWLN5BdMeqsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnJVDDXrT3V3lhnLAI+w6Qq16TsYyO7G/KHCNUvHeHE=;
 b=iP02pSPjmRWwHGBrQIikU8ehdNd4qZyNE4vr2/7bQ493Q6Vr5kfIAVG4BWuy7ynHRcrCJ9FQ8X8PahpMZS/VBAXZ46ICQtLyEW53EOULCitxhlo1FCNGTuQtcLZhpcDzrNY8AS678Clte+RkVdGGBExXwMotQMG4gfMAUllO6k3hfQer9Zcjqpj5YJMtKL15WkBm5DlFuqhVKZGaVcIK4TYvTN+jyU3WTGTFVoow+Yz69oUkkMHmWdHv/NjBlnNT6naIDADGNQF28n/4yDVqem1foWNz+g67O4SWGtDQC+Dkxy45+PKFFxhqqwt+QqR8O4JDQKNc1A8H1eZxFjdeLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnJVDDXrT3V3lhnLAI+w6Qq16TsYyO7G/KHCNUvHeHE=;
 b=1YVjM79yuZOhjo+B0bl70ccMG4dV/XzGkl7kDZLGW7Xvic/JVKYcF1AHSPivexRoTY1IeUy1G9QxBpN/lKG2CHGWntbZiE6LNI9ww3qvQERuhOeKH0W7xKEJM4v7iAYIPj/qE871CAflh43/le32w+vF4KHyqnfE/gYGXtpmGRc=
Received: from BN6PR16CA0027.namprd16.prod.outlook.com (2603:10b6:405:14::13)
 by CH0PR12MB5137.namprd12.prod.outlook.com (2603:10b6:610:bc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 15:56:51 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::35) by BN6PR16CA0027.outlook.office365.com
 (2603:10b6:405:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18 via Frontend
 Transport; Tue, 31 May 2022 15:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 15:56:51 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 10:56:50 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v4 13/13] tools: add selftests to hmm for COW in device memory
Date: Tue, 31 May 2022 10:56:29 -0500
Message-ID: <20220531155629.20057-14-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531155629.20057-1-alex.sierra@amd.com>
References: <20220531155629.20057-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73f4f803-82ec-4d52-e6eb-08da431e2d4b
X-MS-TrafficTypeDiagnostic: CH0PR12MB5137:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5137F2C2C0DD1FBC46216E19FDDC9@CH0PR12MB5137.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: riTnT8lZvDS7axhvwnn3ZAWrBf2t8UUU1jkz8AWZrurZDU9l04POFpE8E9kcleRyut7h0lXKiu+aKShqos3u0FlTdv/eOgWK5roA5zWCLFdLziqlR+M/HcXLk20ukE73a/fPQcVBjsSi6wXVeGHw/xxUX62gsXrYtyKKVSzWoLBoiLhZ2WLjy8gtLsmTo5gPfZgT3P6OFbhutmAskBOaOyEGXrimdb4vSEbI5T8L0iUj+5GlqKSxbSu1TjVgZn02Yh8gls055H5NyD9qgV5FAHqh3u38z3Qzevzn+3lpAplgYd9zMrCVbvNK5xhx2fA9EEo+A89EwgQa1F8McojAAqmzZK4hdVM6e2gbCrIhJJTgFAUXaaJe+yy79LQly3tvoQqZksr7S4ajJwuh3x1ZblcqOFPNHYwWgIxUqKuT65RY1j9THJac7xNrbnPcaolyEVAjFaL7qtYbDNnWkzwSBZMUAXkMoYiFB049wbc6OLGmLUvTkf+a+9SMniA2no8TMO0iSa/806t2JwKNRm7Q8w93EXtaysrLgoe04z00yFw/AbB399Q60zM1vHFlcWsVKqj/srhsDzUVzRlYBh/1vKf4ZYB2C2jdEtpGr+Cxl97qV9xsan0Vvh8/YbUkBpCHAtXOxqLFtNM4DbCvWqfJvCcWf0X1arFDxvW9mgMtVoKtETCl5Z6erW3HInLF3UfYIpZbxHG+d4B07Qc5oO2JFw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(44832011)(2616005)(82310400005)(36860700001)(356005)(81166007)(36756003)(47076005)(336012)(316002)(83380400001)(426003)(7696005)(6916009)(54906003)(6666004)(2906002)(16526019)(186003)(40460700003)(7416002)(8936002)(86362001)(4326008)(8676002)(5660300002)(508600001)(70586007)(70206006)(1076003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:56:51.3750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f4f803-82ec-4d52-e6eb-08da431e2d4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5137
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
index 61a02a6a3dea..76570030ba5b 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1871,4 +1871,84 @@ TEST_F(hmm, hmm_gup_test)
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

