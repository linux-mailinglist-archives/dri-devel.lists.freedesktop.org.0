Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776315294F8
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 01:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6D410EB8B;
	Mon, 16 May 2022 23:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA2210E6CE;
 Mon, 16 May 2022 23:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF+tGikl06V0I0QaK/oSKgeRtXkXyVS9uA8VxevGsxOdfEx6Sh4FXxjMzqvcaYMRtBpQ2z/J2LxApWWM8oK+cmp/g9wNwXY3pnzhqOxnhjOZSwHnaqccFUx3dlWFNTHaoowpp4KznCtfLz6R4gct6R+nnfKUC9xJfOuVnraMpD5gS/sOCsG0X8++QW3ZQDwUmI6MamHFQOetNWl7pCnhay6d+WvlraUkcWhQqExIS7tW2U8tAIu4Qu08WD2uoZRebLTo5DvID7uXcPN3wzwl5ScQwb5YZmkuVEIOH7Hhqgbp6i+gvkTqtNPUnq+XJnklqsPrzCt0h/4KmoYKQkYL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnJVDDXrT3V3lhnLAI+w6Qq16TsYyO7G/KHCNUvHeHE=;
 b=USNY6Wn1LljVQ6ya6IZdqtaAH7OWsvYYwEQju1icnaQlAHyHawn2Hi6geNCPI5w0im1ircCmP66ho8nnYb6mmI6OlEHL/cSTWJl35wcmCoWla5hxSEsZjbIlsoRUdVP+dsZ4KLUvs1EbCv6odCnay8IWnZFBWNpJ+qAq3DupUxHaNUHGQyz6n/V5P1qvTU7rtrfhYSXWeFhxOEiNs0dH8Qh4mZB2jm54h7oFB0JUtkd3bn+zQfZkMkIqhxhPufcwX/I9T9AKrNlZFhvXp7hHp9+ch/kqAmm4I0IKAmyo+VeCfkGs8zFhR6gr2ME8ubGSy6tS3TCEsUiIjQJRONuZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnJVDDXrT3V3lhnLAI+w6Qq16TsYyO7G/KHCNUvHeHE=;
 b=mGLOIWz7F5zgeuyMqxvt1NGQwdUuOFXEEY15lARMDhvc617C4h5wcrFIj1wOOFbYgwml5ycXMLaOmSVDb8X1fWv7+oToPO6T4B05o8/KWNtQmJSN9xItz4ShlAHV/syg63IlAxSiudYzWScyUsCMOVIW08xGMfNgBulE43EhvE8=
Received: from BN9PR03CA0716.namprd03.prod.outlook.com (2603:10b6:408:ef::31)
 by CY4PR1201MB2468.namprd12.prod.outlook.com (2603:10b6:903:d7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Mon, 16 May
 2022 23:15:06 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::b1) by BN9PR03CA0716.outlook.office365.com
 (2603:10b6:408:ef::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Mon, 16 May 2022 23:15:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 23:15:06 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 18:15:05 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 13/13] tools: add selftests to hmm for COW in device memory
Date: Mon, 16 May 2022 18:14:32 -0500
Message-ID: <20220516231432.20200-14-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516231432.20200-1-alex.sierra@amd.com>
References: <20220516231432.20200-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e8b0fbc-c602-4b4a-c374-08da3791ea4f
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2468:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB24689BE25B40CAB973BC3CA0FDCF9@CY4PR1201MB2468.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+qqDEfRCL2742eNa1TyJMrDw6OwsY+zG+rYU4q3zfFa8qtgaXQlgEpFM9MC/JU/IIhu6ejBfgI8PefDMHewPCNG8S9uQw+b7yOtMTtm+vsf0Qebb3Bw1/4F+gizKkj0CW3o1g4qHS4zVwmsjCf4O21hLQW6z9cPvSHDp6WgaEhiXmp1Nmg8/poE4b/yB6RvewQ2iVsdTFEzYYXtOiXenL7T7U0R80+rQOUx1PFl/k+17OpMA0wBsCu0N0nfWMimgy3SlBxwobv3a9WKsHS26MeeeFTgwPtirfkEF+oMxZ8r5cTT+zVGQfIuTYlwEqMXBg5mWWhcMdh4fqk22iQ3kfFgMhKWILpa4bLIF93dP6DvlKzaz0yjwBj4Lzy2Gfi10q/BQ5nhD5urGqXGDILnkAdsbK4vb5esUbdMb8WkZwEKpHMe+8VZl9stmrG35+lWLKNC5Eg+vter89RoNkf0OWxvGdSL2KOpdlx9c/jA+d6poMhYRLLY6PgZTDF7w01Vz3bEcSLTKxGNHnd7wCU2ML5o2EO2GEZLwf2/iukmHuV42CXCc2qXbmVivVmpIiH9AAeQ5Als4DABHNnzO/RpoOcogCrmugQldywpA3E/DxmbDRLJPhIRGQcSK9CtcoQ0rzsj315CYs+1hNXWfZz5tRZhDzr2fTRnDNS7JyrL+uUlBwhmrzA64VLhqN5qqAKfqWcOwCGyWBCnF3T4R/u7Rg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(316002)(36860700001)(36756003)(44832011)(70586007)(82310400005)(81166007)(7416002)(4326008)(8676002)(7696005)(6666004)(86362001)(70206006)(2616005)(356005)(5660300002)(2906002)(1076003)(54906003)(6916009)(186003)(16526019)(40460700003)(508600001)(8936002)(83380400001)(26005)(426003)(47076005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 23:15:06.6446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8b0fbc-c602-4b4a-c374-08da3791ea4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2468
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

