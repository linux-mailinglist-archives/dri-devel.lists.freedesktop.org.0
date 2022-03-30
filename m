Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CBF4ECEBA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 23:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F14B10EB0B;
	Wed, 30 Mar 2022 21:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2069.outbound.protection.outlook.com [40.107.212.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C02C10EB01;
 Wed, 30 Mar 2022 21:26:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nleiq0hFoTL6oDsmQlNHyQh7QRlGyumnqYbsWJ91mLmUaCTPFogf4uLCqqwqp6tRzchTQbeu++mZ4fA/II/QTP2pqG8UuP9onfZjWnrhNBWOj1KullCVSNiGnw4Q6TK/ZSCcNsMkTXS2r6xwsceSeYlyEGz21Du6cyJjHSspS+GQA1IE6UFmQWQ0bm31UVZHEkTPFD9d5/v8ksPI7afoBkBVNwceaBGY7pDJCUQpVJjnV2UCB+Z5LHwo+aAjZiYOP5M5kKayj6d/dvSSungaQPaxesMowjtLaupL+kq+nP5c1P61HAb/D0PAnEb1piBumWBcBucvztcCq2GuPTx1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHU7YhU+SJ2J7kH8Bg29HQQ9+RIQsN1DFo8UaEiYdGg=;
 b=OOkjBLeqpLq/RHdn3v6eazROwgZ3ddV6Wh+rnDTA1iMrPfOodW8iDbU/ic2JHBuuKkt4Rz1BZdwqq3eHEDt8o9YlOeN5pnWYkInanW5Qa70fbhtG8ckjNSmVeIDpa5/+qTf3ppFHbYwAMrOLdFOCBLvq2wR1KZ7q2rQxhZNWM2J1h97Stvew8vl0M2+uw1fZpKbu/MvSOus2qjtOEg8x6cvZoVm2beRT3oaAZSaAI492+x35izpz3Tj2g4yYqWy7esQV3HG0uQUbc++qMe7t4Uakbsx4H8dnhgspIQYYS44sPDzivHnmTwKn3BjX0sZm2owMcZ5khgy+lOLLoxS8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHU7YhU+SJ2J7kH8Bg29HQQ9+RIQsN1DFo8UaEiYdGg=;
 b=A039HXhWHmaoi/TTTVTUdMfV+8HNTy7Kqjhrl1n0G/jdrOwlyfkZi3+8k5/5rmvhbNelMX3xzg/IMMgebx59JQFqbC5k6xH35str1ounHvhAWhvipKevVJnrvOlG+XPXAhjcmL4PCfK41Ty9j8U4WkcMckCfpoTfZXSf4C4qGA0=
Received: from MW4PR03CA0204.namprd03.prod.outlook.com (2603:10b6:303:b8::29)
 by DM4PR12MB5295.namprd12.prod.outlook.com (2603:10b6:5:39f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Wed, 30 Mar
 2022 21:25:58 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::a5) by MW4PR03CA0204.outlook.office365.com
 (2603:10b6:303:b8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 21:25:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Wed, 30 Mar 2022 21:25:57 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 30 Mar
 2022 16:25:55 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 2/3] tools: add more gup configs to hmm_gup selftests
Date: Wed, 30 Mar 2022 16:25:36 -0500
Message-ID: <20220330212537.12186-3-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 65a65f8c-e713-4a78-7792-08da1293e199
X-MS-TrafficTypeDiagnostic: DM4PR12MB5295:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB52954C0F47BA139FC1369EFEFD1F9@DM4PR12MB5295.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOk0zAEYYug6Ul8uFcWTY3STyoWulkRaO4J/fPDKy/nInJ+v7Ag/8iArI3L6ac+YqvW+cUgGV/rEKxg838GTPDYu1K/XN6sptXVb0ALXya0JErEgxYu9/hFjNWgSRfQ1rRuKz8ggmF/7zaZ/M626iKZTWArLgbGGcAAd+6AUYMvvdHZ5Nr8Li2p8JmjT5Kl6ycKnjQrdUI1Ul4Xho+ItO3Kt1SVfDzDLofHXDP/tuZKLcYkQQ3fLNJiT3HWOXPp5aAoqteDBktCbmK+5pc+4PZYj0MhqVDOX77Kt56vXnSuNHA4wtWgFJgSxcYIIztf9WBUq45INwM755yN7pPUsNY6ZfuytpX8OPgsmtGKdtO7Ts9VtrvP6aNqd5P01HcMA7WM2gWec4mYfMih4jvJh5ZNY23akQ2yi2vepISgWiuD4hGunmkMqaz0mv+EEBVwhjMb+3WqBHBMNvVxxvCIvGqnU+fE0vizDBfdNK2NGyvUjmhLO0D1AbH3mATuYchP6Fc4L47C6ms+eKru2d+Bcceo2yq2AJF+A29t/L9BRcpLvplR0b8+5z6nIU/MiMb4nQAjisk+sfdgX1Oz57qJn5OiZUu1w9bVhruWhOYyOH/Cb9uCeAQZcDNk+/lcQg1jyHTHHveRSrKuuFpC0bTI23a8Fn6NfHOOxaU2I7touGaaM9J09XmKufODTR0Xzn4kW3Ef25tc568qG0+3GLxY2OA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82310400004)(81166007)(70206006)(70586007)(356005)(4326008)(8676002)(316002)(8936002)(40460700003)(44832011)(7416002)(5660300002)(6916009)(54906003)(2906002)(36860700001)(47076005)(86362001)(508600001)(26005)(186003)(16526019)(1076003)(36756003)(83380400001)(7696005)(426003)(336012)(6666004)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 21:25:57.8895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a65f8c-e713-4a78-7792-08da1293e199
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5295
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

Test device pages with get_user_pages and get_user_pages_fast.
The motivation is to test device coherent type pages in the gup and
gup fast paths, after vm_normal_pages was split into LRU and non-LRU
handled.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 65 +++++++++++++++++---------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 11b83a8084fe..65e30ab6494c 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1769,6 +1769,24 @@ TEST_F(hmm, exclusive_cow)
 	hmm_buffer_free(buffer);
 }
 
+static int gup_test_exec(int gup_fd, unsigned long addr,
+			 int cmd, int npages, int size)
+{
+	struct gup_test gup = {
+		.nr_pages_per_call	= npages,
+		.addr			= addr,
+		.gup_flags		= FOLL_WRITE,
+		.size			= size,
+	};
+
+	if (ioctl(gup_fd, cmd, &gup)) {
+		perror("ioctl on error\n");
+		return errno;
+	}
+
+	return 0;
+}
+
 /*
  * Test get user device pages through gup_test. Setting PIN_LONGTERM flag.
  * This should trigger a migration back to system memory for both, private
@@ -1779,7 +1797,6 @@ TEST_F(hmm, exclusive_cow)
 TEST_F(hmm, hmm_gup_test)
 {
 	struct hmm_buffer *buffer;
-	struct gup_test gup;
 	int gup_fd;
 	unsigned long npages;
 	unsigned long size;
@@ -1792,8 +1809,7 @@ TEST_F(hmm, hmm_gup_test)
 	if (gup_fd == -1)
 		SKIP(return, "Skipping test, could not find gup_test driver");
 
-	npages = 4;
-	ASSERT_NE(npages, 0);
+	npages = 3;
 	size = npages << self->page_shift;
 
 	buffer = malloc(sizeof(*buffer));
@@ -1822,28 +1838,35 @@ TEST_F(hmm, hmm_gup_test)
 	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 		ASSERT_EQ(ptr[i], i);
 
-	gup.nr_pages_per_call = npages;
-	gup.addr = (unsigned long)buffer->ptr;
-	gup.gup_flags = FOLL_WRITE;
-	gup.size = size;
-	/*
-	 * Calling gup_test ioctl. It will try to PIN_LONGTERM these device pages
-	 * causing a migration back to system memory for both, private and coherent
-	 * type pages.
-	 */
-	if (ioctl(gup_fd, PIN_LONGTERM_BENCHMARK, &gup)) {
-		perror("ioctl on PIN_LONGTERM_BENCHMARK\n");
-		goto out_test;
-	}
-
-	/* Take snapshot to make sure pages have been migrated to sys memory */
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr,
+				GUP_BASIC_TEST, 1, self->page_size), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 1 * self->page_size,
+				GUP_FAST_BENCHMARK, 1, self->page_size), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 2 * self->page_size,
+				PIN_LONGTERM_BENCHMARK, 1, self->page_size), 0);
+
+	/* Take snapshot to CPU pagetables */
 	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 	m = buffer->mirror;
-	for (i = 0; i < npages; i++)
-		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_WRITE);
-out_test:
+	if (hmm_is_coherent_type(variant->device_number)) {
+		ASSERT_EQ(HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL | HMM_DMIRROR_PROT_WRITE, m[0]);
+		ASSERT_EQ(HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL | HMM_DMIRROR_PROT_WRITE, m[1]);
+	} else {
+		ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[0]);
+		ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[1]);
+	}
+	ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[2]);
+	/* Check again the content on the pages. Make sure there's no
+	 * corrupted data.
+	 */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
 	close(gup_fd);
 	hmm_buffer_free(buffer);
 }
-- 
2.32.0

