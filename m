Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644C49D8FE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67C410EE28;
	Thu, 27 Jan 2022 03:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EBD10ED06;
 Thu, 27 Jan 2022 03:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxh18DeCpA97r0OaOoY1mXifCRHIihcVweAAltOxm6L7Y/0tVZkqUennmK47S1Cd/KPu/PokHWfQo/7j/u4H4Mx6gZ/vK6MUjgLE6FhqwdQ8NGS6kA0qv9r+0pWjAEdMQtQnNC1n1xD2zTegKryFkyBRviTSyGgiswKcOjKT67U8B28Nz5Me0iXdaHnQ1hi6fLL8hBTYK8zKfw30mcOjJ7xF+BkoUcIwOA3ZPJ/oD1Coxmszebtmr0BWnVY6npJidHsVRg8am0ENE2XuC02nrvfpP8W/j7aUsF6x7oFNOopk+1SyMrXythPzp9U3jFvvcRHCIJkfhpIH048ZX5b1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkhY73lijcfTMBsuT4SElFuMaAcJe3pUQ8P6LKwXObw=;
 b=G88fO+hgpYu1jTmW4nvtQr55X7Vhq80u1Dw1Gnd6vPNPFEACX59/BXE90O/uA7nHOnlJCAhYtMSnQBrlnnPqCYHUjIReaofRpSq4QODfZB+69Xe4hId2sI9QqnA4N+hir06lKKOwjcOK17VSaRm3gbsO6ytLd2vRZa2NwW+zQsXRG/bP4QcblVYynShljuCpPeEJcc0QxW+KsvqFRWVzV1wg2jNT9wz+KRcFML7OBaASivDyoCMI85gxg3fXWO56ySs6gDT5PIHY+zcLvIn0Ng8dIQ0VsuLfDnCy3Z6duSSLOOlIeCaCL1pjEEbQTXrARsNmeL6xqfuAHcrgSXSJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkhY73lijcfTMBsuT4SElFuMaAcJe3pUQ8P6LKwXObw=;
 b=qBJqEX7158baSoCTNKzrNCS2EAq3ayJitm7JppKzL/C3OzSdZp84wYpTIT+zLtY+VwHO3oGndMP7+f7S1f5n2pD75DoMPuesxjx4Wj2hF4TMmDrgWUwyyiHaaFTg1o5+jKxhR1gdY+XpVJnnaZi/vtkSnLVetldJkzMYTNwTNJI=
Received: from CO2PR05CA0094.namprd05.prod.outlook.com (2603:10b6:104:1::20)
 by BL0PR12MB5507.namprd12.prod.outlook.com (2603:10b6:208:1c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 03:10:08 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::26) by CO2PR05CA0094.outlook.office365.com
 (2603:10b6:104:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.5 via Frontend
 Transport; Thu, 27 Jan 2022 03:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 03:10:08 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 21:10:05 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v4 09/10] tools: update hmm-test to support device coherent
 type
Date: Wed, 26 Jan 2022 21:09:48 -0600
Message-ID: <20220127030949.19396-10-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127030949.19396-1-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dab7330e-3347-4a62-d49e-08d9e1428600
X-MS-TrafficTypeDiagnostic: BL0PR12MB5507:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB5507D909D4C8A47287477E1EFD219@BL0PR12MB5507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+ti4rhnJQ5V7AyRrEtGW8BCgqWV/yGMJNJ2wIYbo3sQWCQznY34RK0/fz3G/1vZcIno4d7t8BDkEztyvjlFZAIUsOMzT75EADO29Mas+riWbarm96iOlXNwLFuuLorwsyIGFYsFB9N96SrwIURGBup1FmKnhEocD5qWRnkxhvFrO3QxtRKFEe8QGymKbVHF/s5KPHrOncoGe35Fi4bUeh+3GaJEwrOoVmGlD9+iery51e0q+ozvQ8HgZHdwaErxjCQiJulAkddHK+GZ88163ctIouruKDzfsIXLiLA9jD9NTlrNJtJN4oV9th/1TXxga+HgQifq0x31mzz060t8KJ11mfxDNowCGkgUxqkBUH/Ot1y0RAmewKpkSl2lltbJxMoWG4oohyRR5pilFY01ELstS9be/RHEw0qwc2GarklsgMtJHOSV8G4NSyrgyKH+vKbJkocLqj4Ol7MR+6WPWCdTpDuqJ9H4PenEiukpseNqyEH+m8pnRp/MehSYD1etu/NnsyRbixHylKWWtULyFYYSs1eHEg/k1c6YxBGKjgeqsSuY1nprPHRLrXVVZHfOY54rVvSmm+fIITthONcy9ut7Z6RrjOvI8Y5btYNEZKRoqlpt92yusv5O7rFityaxHga3fwjz2Vqw/iduY6z8aQ1VNM7ILugGUV7XIInnpbTkF+V6Cqap8fQAlE1BRj8q1U0gk4Dwy/prjw7pz3Kw2A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(1076003)(16526019)(336012)(426003)(186003)(26005)(2616005)(356005)(36756003)(70586007)(4326008)(15650500001)(44832011)(2906002)(70206006)(5660300002)(7416002)(8676002)(8936002)(54906003)(316002)(47076005)(110136005)(86362001)(7696005)(6666004)(82310400004)(40460700003)(81166007)(508600001)(83380400001)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:10:08.0053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab7330e-3347-4a62-d49e-08d9e1428600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5507
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
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
---
v2:
Set FIXTURE_VARIANT to add multiple device types to the FIXTURE. This
will run all the tests for each device type (private and coherent) in
case both existed during hmm-test driver probed.
v4:
Check for the number of pages successfully migrated from coherent
device to system at migrate_multiple test.
---
 tools/testing/selftests/vm/hmm-tests.c | 123 ++++++++++++++++++++-----
 1 file changed, 102 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 864f126ffd78..99de5e38dbbc 100644
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
 
@@ -1312,13 +1386,13 @@ TEST_F(hmm2, snapshot)
 
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
 
@@ -1335,9 +1409,16 @@ TEST_F(hmm2, snapshot)
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

