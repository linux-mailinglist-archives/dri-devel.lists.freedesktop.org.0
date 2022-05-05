Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30DD51CB3E
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4058410F986;
	Thu,  5 May 2022 21:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFAB10F950;
 Thu,  5 May 2022 21:35:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxg691vpQ6xz4zkhMFXtvMnRhDFfsIvuLA3b0oV1UV3nEJdoQgFKmbJta1W1CJxZ6OhFCKjL2tDl3ihbTgGT+5h3/fso4fISV0SRbqiDErrdRB2vAxvZJqohyD6VhJVyJ/ccDvpimsowaIEVC89hzE8mj+WD4oQexWeHKTxlaARAajxesGOEmfn9fq0FhasLPEFUphUUpIqAnJ/yXWEL6EPI7xo+42cgBc9hPoD1fiJavzH+7Yv5lIaacZTBIq7NKhFQonTxVYBoXfj2MEBeRGv5+v0NMXdjteFyxHIS6ScXgQ7h10AFIeur4C4cGb39rEe4+V+2I8ewPHgXo6QZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiZRZSmKoAHg2kQsT+4ka7fOS9kQUakT1QrbMGC56FU=;
 b=MVG5whYFrB9YQknv4/1JhMTbHPqU0dM/HlaEB0tEB8hZrprkeQLwI3kSMv93HrbnR2j5WIMcMVHDH1STvJwWk0HTwGAMtva/ch24SwCGkczTMZaHf9+pjNA0C2n7Oz/dB04Ymz7mxS9dGQxiJLVIdstHTZxEN1RLmQhNw1n4bVgZojKJNhEK+ZzgHurIuGIkeCaEO2QiOS4tXdJo4j3g9G1hBhz+CWSg2n9yRYw4Cye9c5u/t/MGEjATmvKmjGEZgLCL1Ay6MzOoAuTzCOQfhSBB14JxE0EOdYhajwHJioQDJB81yFn2xhvU9JY7CgZLk0uevqoDaTglkVHJIe30HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiZRZSmKoAHg2kQsT+4ka7fOS9kQUakT1QrbMGC56FU=;
 b=kFab1DBQcT3rYh2lRlRB6r//PUYaK7nYZXRXxk7BEMURFpnIMFj1w5YNuXomtCb5yeFhn07QkShzBFHByOzEalKcm7doM6AyFfLYXSmYRJNdbprrkmuy8NP382HHpJaVW04zWvGGxvq7Db/om7wwA31SvQdy/ojkerO/A/y3t0o=
Received: from MW4P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::33)
 by CH2PR12MB4134.namprd12.prod.outlook.com (2603:10b6:610:a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 21:35:05 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::38) by MW4P220CA0028.outlook.office365.com
 (2603:10b6:303:115::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 5 May 2022 21:35:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 21:35:05 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 16:35:02 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 11/15] tools: update hmm-test to support device coherent
 type
Date: Thu, 5 May 2022 16:34:34 -0500
Message-ID: <20220505213438.25064-12-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9078915d-90e8-4396-a529-08da2edf1ece
X-MS-TrafficTypeDiagnostic: CH2PR12MB4134:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB413430C6D3B6993B9C522CF3FDC29@CH2PR12MB4134.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9GXlDLon8MSrY2FmO7mNIfad1kI7To2KrWb12neD3DQWDhshfWOne5eihzoO86rKYe6hAW6rItnzPmpPIwezBzEWvUrffWhVA4DgeXoFyzv/DJnXTtg9pn5ru18xF8+D0qjI04oZ4CaHFpwama3WzsY/5e8DKPcr7WOCCkjOHtAK61RHJOT8DoFfkeYnbe0nS9wCb2AddpS4iKy7XCe34AdBeGLcJT2sqIlg2V0w8ZMMRnzFFc9B1G+TCVqK1jpAEgcdvQM8HTp8CmkUmE/AsMoFDNuIdp9XeZRZ6L+0aKThYq0Vwg1MBlumGo0Vb6a3hmz9jWs8RrPMvVDk3tPbFfq3aYZ4JRRPbAvPl8I/7XyIeojsA+G3VzFbvDWtcoCG7G56LGgSFl5z7hvBFMRvDEf/QqsagCUhJJadlLMrOeS+dd7hqAyGffPadCtKGRz+RHiR3UHnJVmoxyB5169ryOD2IFy+eRUEGxazzaevFfA+IjwwwLiWVsL8n3Cl0x6T2wWGmNjtEfboGDJSB4pJ663hrW0GVi1VswU8ggtVFOyRjPl9pl849C6CAS1u1Jz7/uTXqkY4j3wDAMvYHw9C/6oCgCVaTKygAEPSyM4QEMgCPbcYy2qoGjbnRASUlrQqioIzHbVE5qfzal4BZ+CJ5+a4//yiMmORk4oKJsDMPWpMEYaOQNfJhuFD+VDgiI7nX4o+V/QFI0cC0Yt5u7qAZQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36860700001)(70586007)(26005)(15650500001)(70206006)(8676002)(86362001)(4326008)(8936002)(82310400005)(6666004)(2906002)(44832011)(7696005)(36756003)(316002)(6916009)(54906003)(83380400001)(2616005)(5660300002)(81166007)(1076003)(40460700003)(356005)(47076005)(426003)(336012)(7416002)(16526019)(186003)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 21:35:05.4071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9078915d-90e8-4396-a529-08da2edf1ece
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4134
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

Test cases such as migrate_fault and migrate_multiple, were modified to
explicit migrate from device to sys memory without the need of page
faults, when using device coherent type.

Snapshot test case updated to read memory device type first and based
on that, get the proper returned results migrate_ping_pong test case
added to test explicit migration from device to sys memory for both
private and coherent zone types.

Helpers to migrate from device to sys memory and vicerversa
were also added.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 tools/testing/selftests/vm/hmm-tests.c | 123 ++++++++++++++++++++-----
 1 file changed, 102 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 203323967b50..84ec8c4a1dc7 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -44,6 +44,14 @@ struct hmm_buffer {
 	int		fd;
 	uint64_t	cpages;
 	uint64_t	faults;
+	int		zone_device_type;
+};
+
+enum {
+	HMM_PRIVATE_DEVICE_ONE,
+	HMM_PRIVATE_DEVICE_TWO,
+	HMM_COHERENCE_DEVICE_ONE,
+	HMM_COHERENCE_DEVICE_TWO,
 };
 
 #define TWOMEG		(1 << 21)
@@ -60,6 +68,21 @@ FIXTURE(hmm)
 	unsigned int	page_shift;
 };
 
+FIXTURE_VARIANT(hmm)
+{
+	int     device_number;
+};
+
+FIXTURE_VARIANT_ADD(hmm, hmm_device_private)
+{
+	.device_number = HMM_PRIVATE_DEVICE_ONE,
+};
+
+FIXTURE_VARIANT_ADD(hmm, hmm_device_coherent)
+{
+	.device_number = HMM_COHERENCE_DEVICE_ONE,
+};
+
 FIXTURE(hmm2)
 {
 	int		fd0;
@@ -68,6 +91,24 @@ FIXTURE(hmm2)
 	unsigned int	page_shift;
 };
 
+FIXTURE_VARIANT(hmm2)
+{
+	int     device_number0;
+	int     device_number1;
+};
+
+FIXTURE_VARIANT_ADD(hmm2, hmm2_device_private)
+{
+	.device_number0 = HMM_PRIVATE_DEVICE_ONE,
+	.device_number1 = HMM_PRIVATE_DEVICE_TWO,
+};
+
+FIXTURE_VARIANT_ADD(hmm2, hmm2_device_coherent)
+{
+	.device_number0 = HMM_COHERENCE_DEVICE_ONE,
+	.device_number1 = HMM_COHERENCE_DEVICE_TWO,
+};
+
 static int hmm_open(int unit)
 {
 	char pathname[HMM_PATH_MAX];
@@ -81,12 +122,19 @@ static int hmm_open(int unit)
 	return fd;
 }
 
+static bool hmm_is_coherent_type(int dev_num)
+{
+	return (dev_num >= HMM_COHERENCE_DEVICE_ONE);
+}
+
 FIXTURE_SETUP(hmm)
 {
 	self->page_size = sysconf(_SC_PAGE_SIZE);
 	self->page_shift = ffs(self->page_size) - 1;
 
-	self->fd = hmm_open(0);
+	self->fd = hmm_open(variant->device_number);
+	if (self->fd < 0 && hmm_is_coherent_type(variant->device_number))
+		SKIP(exit(0), "DEVICE_COHERENT not available");
 	ASSERT_GE(self->fd, 0);
 }
 
@@ -95,9 +143,11 @@ FIXTURE_SETUP(hmm2)
 	self->page_size = sysconf(_SC_PAGE_SIZE);
 	self->page_shift = ffs(self->page_size) - 1;
 
-	self->fd0 = hmm_open(0);
+	self->fd0 = hmm_open(variant->device_number0);
+	if (self->fd0 < 0 && hmm_is_coherent_type(variant->device_number0))
+		SKIP(exit(0), "DEVICE_COHERENT not available");
 	ASSERT_GE(self->fd0, 0);
-	self->fd1 = hmm_open(1);
+	self->fd1 = hmm_open(variant->device_number1);
 	ASSERT_GE(self->fd1, 0);
 }
 
@@ -144,6 +194,7 @@ static int hmm_dmirror_cmd(int fd,
 	}
 	buffer->cpages = cmd.cpages;
 	buffer->faults = cmd.faults;
+	buffer->zone_device_type = cmd.zone_device_type;
 
 	return 0;
 }
@@ -211,6 +262,20 @@ static void hmm_nanosleep(unsigned int n)
 	nanosleep(&t, NULL);
 }
 
+static int hmm_migrate_sys_to_dev(int fd,
+				   struct hmm_buffer *buffer,
+				   unsigned long npages)
+{
+	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_DEV, buffer, npages);
+}
+
+static int hmm_migrate_dev_to_sys(int fd,
+				   struct hmm_buffer *buffer,
+				   unsigned long npages)
+{
+	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_SYS, buffer, npages);
+}
+
 /*
  * Simple NULL test of device open/close.
  */
@@ -875,7 +940,7 @@ TEST_F(hmm, migrate)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -923,7 +988,7 @@ TEST_F(hmm, migrate_fault)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -936,7 +1001,7 @@ TEST_F(hmm, migrate_fault)
 		ASSERT_EQ(ptr[i], i);
 
 	/* Migrate memory to the device again. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -976,7 +1041,7 @@ TEST_F(hmm, migrate_shared)
 	ASSERT_NE(buffer->ptr, MAP_FAILED);
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, -ENOENT);
 
 	hmm_buffer_free(buffer);
@@ -1015,7 +1080,7 @@ TEST_F(hmm2, migrate_mixed)
 	p = buffer->ptr;
 
 	/* Migrating a protected area should be an error. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, npages);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Punch a hole after the first page address. */
@@ -1023,7 +1088,7 @@ TEST_F(hmm2, migrate_mixed)
 	ASSERT_EQ(ret, 0);
 
 	/* We expect an error if the vma doesn't cover the range. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 3);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Page 2 will be a read-only zero page. */
@@ -1055,13 +1120,13 @@ TEST_F(hmm2, migrate_mixed)
 
 	/* Now try to migrate pages 2-5 to device 1. */
 	buffer->ptr = p + 2 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 4);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 4);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 4);
 
 	/* Page 5 won't be migrated to device 0 because it's on device 1. */
 	buffer->ptr = p + 5 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
 	ASSERT_EQ(ret, -ENOENT);
 	buffer->ptr = p;
 
@@ -1070,8 +1135,12 @@ TEST_F(hmm2, migrate_mixed)
 }
 
 /*
- * Migrate anonymous memory to device private memory and fault it back to system
- * memory multiple times.
+ * Migrate anonymous memory to device memory and back to system memory
+ * multiple times. In case of private zone configuration, this is done
+ * through fault pages accessed by CPU. In case of coherent zone configuration,
+ * the pages from the device should be explicitly migrated back to system memory.
+ * The reason is Coherent device zone has coherent access by CPU, therefore
+ * it will not generate any page fault.
  */
 TEST_F(hmm, migrate_multiple)
 {
@@ -1107,8 +1176,7 @@ TEST_F(hmm, migrate_multiple)
 			ptr[i] = i;
 
 		/* Migrate memory to device. */
-		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
-				      npages);
+		ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 		ASSERT_EQ(ret, 0);
 		ASSERT_EQ(buffer->cpages, npages);
 
@@ -1116,7 +1184,13 @@ TEST_F(hmm, migrate_multiple)
 		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 			ASSERT_EQ(ptr[i], i);
 
-		/* Fault pages back to system memory and check them. */
+		/* Migrate back to system memory and check them. */
+		if (hmm_is_coherent_type(variant->device_number)) {
+			ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+			ASSERT_EQ(ret, 0);
+			ASSERT_EQ(buffer->cpages, npages);
+		}
+
 		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
 			ASSERT_EQ(ptr[i], i);
 
@@ -1354,13 +1428,13 @@ TEST_F(hmm2, snapshot)
 
 	/* Page 5 will be migrated to device 0. */
 	buffer->ptr = p + 5 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 1);
 
 	/* Page 6 will be migrated to device 1. */
 	buffer->ptr = p + 6 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 1);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 1);
 
@@ -1377,9 +1451,16 @@ TEST_F(hmm2, snapshot)
 	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
-	ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
-			HMM_DMIRROR_PROT_WRITE);
-	ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
+	if (!hmm_is_coherent_type(variant->device_number0)) {
+		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
+				HMM_DMIRROR_PROT_WRITE);
+		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
+	} else {
+		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL |
+				HMM_DMIRROR_PROT_WRITE);
+		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE |
+				HMM_DMIRROR_PROT_WRITE);
+	}
 
 	hmm_buffer_free(buffer);
 }
-- 
2.32.0

