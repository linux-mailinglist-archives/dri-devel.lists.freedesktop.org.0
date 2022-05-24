Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C39533183
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6688610F499;
	Tue, 24 May 2022 19:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE1A10F223;
 Tue, 24 May 2022 19:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/qPVSUT+kqbKGzWHZAQoaYVMOm/C6qAmu6/r0xY8osMGuWNIwI1sG5xMz+4TG4DzdAai9UgFlFqoJG37xbFs+oCB0eC57SSt1CWQnF6MSV9qt8LgKIgCEAqy/lGAw+hmbYWjHwajxJAondTzX+QZq4mNN68Qq1Qs3yqWma/arE1VJj8kXVJFb7MRbH391wJ2/yrR6D3QgR6pYd2ikOadlxtQhiYqVxbU7QFRutFKb+8g/RTDvWCVpVnQESUXVmQeQRKb6L5KX4hnt3GyQv99407B2Cq4hIaPyP1bRrZdksjMageZ618BEV6SJjdQOeSNJ+smleS9w5ETa22hMnYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnJVDDXrT3V3lhnLAI+w6Qq16TsYyO7G/KHCNUvHeHE=;
 b=G1V6WcyWm88/o8kFRRXAgQ/rEkGDNaC2VxPK09mVOrKn4AGBZ/74Q1HPygJ2hGFeUIM2EzHGJKVePeRiaw3NLwJ08+KmEjEIcn0bVhKXIUOuokKwJKhqRGrtaz0O/3125bv73phoS1ITo/m0VAsoLC6svPf5/tW8FzqvsKPkV5XS4AnQVIUVscdIfwSsA+O0h0Pn2hKa0JPyTphnb35IHKwBUiyxVUw00tk2wOUZhACjJS9HMvSSRKP0Q1EvqGMjrNLtvmXaQekhyQGuN3DSwRF3redoUDHM6YN+FgJAYNmaaX8AuUUk/dF2wfxDcI2bm++zQHnnb+uMa9SZoA2bpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnJVDDXrT3V3lhnLAI+w6Qq16TsYyO7G/KHCNUvHeHE=;
 b=KhD9nQMyj3Kwf3alX7fHWoFE7k8wszIRp7vTsBGI8WxDS7CRHz0SWKiVS0tJendO+XLmYk9DaTG55zDTLcw9RTipZdn/P6i198nBe5Fq3KQTWuCFEvSbq0QRLOinlcVDecxg1Ov+kVjziuoJ5m5q0vn6sXY+saMndZ4r/L9woLw=
Received: from DM5PR19CA0027.namprd19.prod.outlook.com (2603:10b6:3:9a::13) by
 BY5PR12MB3842.namprd12.prod.outlook.com (2603:10b6:a03:1ab::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Tue, 24 May
 2022 19:07:29 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::52) by DM5PR19CA0027.outlook.office365.com
 (2603:10b6:3:9a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 24 May 2022 19:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 24 May 2022 19:07:28 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 14:07:27 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v3 13/13] tools: add selftests to hmm for COW in device memory
Date: Tue, 24 May 2022 14:06:32 -0500
Message-ID: <20220524190632.3304-14-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 34c3ce29-7eb6-4505-968b-08da3db8a57f
X-MS-TrafficTypeDiagnostic: BY5PR12MB3842:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3842A1EC5AF3A13EE5B11039FDD79@BY5PR12MB3842.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DxS0EFk4k+7YLZyPStILHEuZChIfaI2TV90mRRtz9HGKkCdc8yK2JIxLgvV/czqhykp0xQrp8VtJRyGKZ1rFK3VxTiTzH2rigFTFJLn37fExMJjUUNapppekVAoEmH44wDI4KH6HQP7kYG/+2JbeQj2k1Hgyl4rPGH9yUZDYOOoEoq3Nzmqv6DSJh1fsBwc/pv/rju8ySFeYJNvn2hXi2Q8jyHqYgFuM+pW2FjTZuFaI1UJJSYchdEa6fwEJes4XuMeN1v8n5bicBFjEz6aP/Rc875xvaLecQ4AJOidsnaym55QmtGW6J7XHclR1/MnvOWDiV/1c5u+ziNmFETT35HIFBSGE2pk3okAt2I4oxgGQGAdCv5JVAs9FFYxoNYF+rODlHw5f4tkrUgsykpQ0X9OXlemDV2+3hMtJGkgce8qyEPRrgFVt9eJEdeT2agKw5hRHe/5EvwbYsbX4nUtBbjk58mWN2KVpHcMjo2CIQs3P+9ztTiE2W3VzVx7Rn67y3bZL0vzFcB52v4n2WmbxAR4IkDtE/kuOoYgVrsbj3iGzIPkQ3IrvUyh68yINnUghc3XEhr7FX81zxd675kDIpO5dBIottYAYZdVWlZO17dnplka6kLeJM1xbJg1rJmptJJuzPQnubtzhlUDJKKwa+chzlX4E7UAm5/rNRlhu7T/MC84ihHyNLY1G19v+2JcD0Wol2TfaCOdK6DNUlWeHhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70206006)(186003)(7416002)(44832011)(16526019)(5660300002)(508600001)(70586007)(4326008)(316002)(6666004)(82310400005)(8676002)(54906003)(36756003)(6916009)(426003)(47076005)(336012)(36860700001)(1076003)(2906002)(40460700003)(86362001)(81166007)(8936002)(2616005)(7696005)(26005)(356005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:07:28.5288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c3ce29-7eb6-4505-968b-08da3db8a57f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3842
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

