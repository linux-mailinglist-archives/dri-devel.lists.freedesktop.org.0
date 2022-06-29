Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A294B55F477
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 05:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E75F12A7BB;
	Wed, 29 Jun 2022 03:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495AA12A79F;
 Wed, 29 Jun 2022 03:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyvlGl3XuwEPA3DAbviLZj0t6ezx6eS2LvWbFhQ6qwoqfhKuI8n4Vm5A3I8nSj/csCRMg0Sm4TOWXbOcpw++MjxMEJpgAewgMBD2FLBJRLb+y8g59FK71wIIbB3ak/0FY/k77FM3lGj7v/8GOfj/teEY6oM96PH6noQqrpAEKWDWZ/z0xH9TDRfS+zPnqtecLNIzkgN1a4y/188moHUVWiS7qaeLOTp3KJW3D4MpidwwVg1Mpq88itW80NFCE25bUQp80/TIF22hnzVFNaSHrT0JU4f9WxvNqkTD6EyJmOw5ehDPyMaOa/3sE1PrVUIAU89uRoAdF9JOB+Pm0fl5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghINYxYAaP35msqhqy+uXLJjlA8u9eNbkgf4YFEOveA=;
 b=dnSkhpXB6X3ZTpWF7MdLfFP/XAVsh/p905IioKjFd6jUafM3wO2ZsXpoVFYYpMUetu/+hLrUt9m5ZGPa+p/mmXhvPFz6n91wo77g38howRVINhXRig5YmVHYF851iMPFSFDTP2DPBGYQ2MZJ/RwRpAgD6AGUzP/sSarMNS+cvLAwDvRjullIBDEe6jGPqI7zGyQu/YJzE8RMqTGwlMwrp14xI9glaB4G7w3HjiYm+oJscnKE4L60YcjmggBlyeS3vcr7SX0uoZC3LsQr6jF9ufhGEVCXDquw75hXgqRZ0Rxu0ferxAIRLNpYhO1TgQvC6I3ieh/IeL0WZemc2iGwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghINYxYAaP35msqhqy+uXLJjlA8u9eNbkgf4YFEOveA=;
 b=K81oENj98EF1QcQLUJ4pMag6GMJN/mH+DFF7PUGa3mcDfaljWtmeEBMDLK8dKQYLvOOM4tUf5IpMSldGBo9zomJ8BdEQ56HHztvyWgC46uZ3SjMcrMgKmYutDpQjHl1234tIx6KyCZl3S36Zgd9SfnLYZ/y4QozRqeBDSsK1xoc=
Received: from DM6PR11CA0039.namprd11.prod.outlook.com (2603:10b6:5:14c::16)
 by MN2PR12MB3360.namprd12.prod.outlook.com (2603:10b6:208:c7::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 03:55:37 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::90) by DM6PR11CA0039.outlook.office365.com
 (2603:10b6:5:14c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 29 Jun 2022 03:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:55:37 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 22:55:15 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v7 14/14] tools: add selftests to hmm for COW in device memory
Date: Tue, 28 Jun 2022 22:54:26 -0500
Message-ID: <20220629035426.20013-15-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629035426.20013-1-alex.sierra@amd.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35ccc442-4936-46ef-d565-08da598339ca
X-MS-TrafficTypeDiagnostic: MN2PR12MB3360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sohPt/tLKahvcUc+fgO7WJRI0HUuXtEEmYQJUojtfwUI5p8JfST88odGxz9+58Q+eV3hQJSesDctosNpnmf5pSA9IWhi/MHqHKIJmJmckFCICqAnKaH/vU7uIG6h2MtY/jLAisfs8aCS7lrptnuYaWE8p/XhWzmnT3/VXjTYfM4gGT5YafvxLjkFpHoxQi0V9ZN8pq4crpnt5Vh7Ksff3p0bn0OxBTYfqJoHZfbrJQatk5nvLOFp84yHDDFNYeoFncjzDkCrMFxcorJ48AyhdviWHgmMEf3svLvbYSf+6KAA9YBB6347YaKGx8A65aJHLYYrc3cmp+39zkv+xIj8ARunLcwd1FFZI/H4QF5poF9drQFKsXYKHY30io28jTuxU4Ri2I5AvHJB6Mt0tEi63EneVg8omJF3qtRvmWgdsJtPtJ7vwDh6u98w9ULeqvKIBBAR1dL3j8so4thL2uNj5qP88W+kr/uBQbbBWKRuN4faE3TzIDPlvXvjk1jakJtsyDWKjc1t0JWoSLVJYveyC293pa7j2uBlY9zZpuwOjHjyatn+Rxa7oRbcyuu16GbslBST0c43dbi80WrOiIti5d5XcaRECoPG12j4gtFdVZWbdET8ZYIX2WOdoxxrNtfHnd5zA8z1+RXjoTgU4460P1p0MxxuIJX4EWzX+6f7+wTQTARVNKxSLPIu08GjUp36ozOnWXuYIPOA19/72Fhrs9UfqTj00vD3S94jWZd3ctNya434Sk+bMLWJLALkddDjxRI5Pl5wqCPBNsiR7xl6vtUsloazcDtlgzDCTZ9Chzblvbo421+qh9hIjhCZECMAOY6obTKnQoZO4aENFhQsuQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966006)(40470700004)(36840700001)(2616005)(1076003)(16526019)(47076005)(83380400001)(8936002)(336012)(186003)(86362001)(82740400003)(36860700001)(356005)(7416002)(36756003)(81166007)(5660300002)(426003)(44832011)(82310400005)(40480700001)(2906002)(41300700001)(8676002)(26005)(7696005)(70206006)(40460700003)(316002)(70586007)(6666004)(6916009)(54906003)(4326008)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:55:37.0122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ccc442-4936-46ef-d565-08da598339ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3360
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

