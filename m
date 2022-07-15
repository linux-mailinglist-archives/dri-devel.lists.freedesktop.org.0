Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA743576EEF
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6705E10FA21;
	Sat, 16 Jul 2022 14:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F0310E06A;
 Fri, 15 Jul 2022 15:05:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnN5Xdgc9ZCNHDOOYHVq3zMkcmhbNrGHEF5RiRIDXi03V1fgPU8RDJ8HFmQ2TF+7CSZUYKEVARvzVmUBH/p0iEioR/7gT3kVhyl+sARKnlQ73L6VQoEqVuf+cu/4nVAgb9qRD1e8I1lVx4OX13BHjSFeDWDq937QSToDZKNmIOrW7ZxQ0YxEiWURNLn6gA+UgPaCmyJb5lcW51wfYWF5nELpy1EsjWCqHiPTf9128zHBCL2xbwHV1IhU02qiyECIGc9MkL2tJMu9z106FYp4VLySV/qiG41nJL/nIOcLJd0nfQ5dQejzcIFiWNJElJE+De7/q3w7+pJmHj1skXTQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBYoUu7uH3DDQme91+PAxWkWEbnIBTP5UUW8lp9tsk8=;
 b=nUDK49xDNBg2yDXr8cz5O272U+dgcVmRHJwufi4zSW9WMGsVSKogEBx/ZAqf52zwgciZn7JbQrxkzg/pKEriWkw6WgPGg1J0gu4tO1+cAZECXkLbi1f2ZDHBTBZE/YdNeF7pn4HgWjU3SoLY+A21PKnAfjsRqn57od82spVR8OfrIKb3pdJsXASs18517b1p4Q+Wx/L0uj0eeCVpm+wYUh58iuw/x+CcoAvHurYg9MZoI6gyjlXs+ml+Z8aXxHzQ3N3j/+MAlUyNvrNq97gqD687klHM8mCtsJA9Dvy5mCqbOr7RaxD0jbdQi3SIRUgKvqSdIwQJSHGjy5qP+sLF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBYoUu7uH3DDQme91+PAxWkWEbnIBTP5UUW8lp9tsk8=;
 b=xwp0Whuyu621ottdglPoiwm3tJhPuFqkLa2f82H44Ta0MO8Fn9504YmeQn7bywXNrriCBAR+EYXtGn5c/pv1gtSecbSUImwLORCJlNJAxAreBBB6JouHwsNCCKtkfrbcZpUeZDQIK1L3id45CmjhO9YFc0MvswaWp2nlol0p+mc=
Received: from DS7P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::26) by
 BN7PR12MB2660.namprd12.prod.outlook.com (2603:10b6:408:29::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.19; Fri, 15 Jul 2022 15:05:50 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::13) by DS7P222CA0017.outlook.office365.com
 (2603:10b6:8:2e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:49 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:46 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 11/14] tools: update hmm-test to support device coherent
 type
Date: Fri, 15 Jul 2022 10:05:18 -0500
Message-ID: <20220715150521.18165-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715150521.18165-1-alex.sierra@amd.com>
References: <20220715150521.18165-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6146424-3dc7-4ed5-52fe-08da66738125
X-MS-TrafficTypeDiagnostic: BN7PR12MB2660:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CD5iilQbPHY7Z05cwIO2+jYU1j/rXmueLFzi9mjfRfp+PF+M9KcntgHMbl6T5a1aUnrszSQnog/pjx7syuhxp+mRr+gZnzb3FPMxuWgsgcKXZoYE1SexjlIuNdory62U2I5Nu0K2lO+VOVdqRtIcBgfnLcvO068SkOzGsnQ1RV+llsFkTbVZULDDz4kEtrfmnJ6PRworG2n3eWhfBxF3cqrkdUTWViZycp1jTgJioocvIsWsE+XBfEFM4jgN9Tv7o6RLi5/hJXJUwev79rQyLmp+Q8XQPEgirRdqLh4ISJeXQr4ZiaBfbZf9QHFoUJN79/Xxzh72bTY4RebcUXLDnWK++rfnKgEOIxA4SM00WpUsFNk+3WrRCXBE4tZ2hoUSgrHSFHBIuTxJ+pFm14HFArqReYVozb6015cRBYc8a2pQiQgU/xjW+Qae/lr3+1gxsCvEtHaGrGN42nC94tcOq2zZxcKD5KYgtJQtYGbpqiR6l27SWT5zNSzSqmtTga+aAb4Q2oNzwMpmL+bToiv/hj4TpTjcyIDIAZDTM4RUJnnl1ZNrekuYoR0WZfqf3fkBMxFr0lpZBiuwiv2Ir91TWJmJEwu9VaF18cXXReq6lTM2NjreH1N3lEIxcdch6E6a+ZN89KOJ34HFZ99ciF2jh77GAmJbVVhEz/t5U82GfHbcKXW0+MXLeaJyY4rkddYWoxJ3MLDmsQ1VJpWUwp/QrG1K3Cszol0tMnoWNMOGZLKVXYzmbSjeSlduxnyuSKDoPYCX5Ecf20/0KZsxSx8mI35vqzFz/FX2Oy5y33e5sFW/d2hJv4oLTtF9SKPY/m4vnvCsTf9YnS5rI9t/JEQLhJ3kAVMRHN1Y6ubnyZuw/s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(136003)(36840700001)(40470700004)(46966006)(44832011)(7416002)(2616005)(478600001)(47076005)(426003)(336012)(356005)(2906002)(6666004)(7696005)(54906003)(6916009)(316002)(40480700001)(15650500001)(82740400003)(186003)(16526019)(40460700003)(1076003)(41300700001)(4326008)(83380400001)(8676002)(8936002)(70586007)(70206006)(82310400005)(36756003)(26005)(5660300002)(86362001)(81166007)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:49.9231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6146424-3dc7-4ed5-52fe-08da66738125
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2660
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
 tools/testing/selftests/vm/hmm-tests.c | 121 ++++++++++++++++++++-----
 1 file changed, 100 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 203323967b50..4b547188ec40 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -46,6 +46,13 @@ struct hmm_buffer {
 	uint64_t	faults;
 };
 
+enum {
+	HMM_PRIVATE_DEVICE_ONE,
+	HMM_PRIVATE_DEVICE_TWO,
+	HMM_COHERENCE_DEVICE_ONE,
+	HMM_COHERENCE_DEVICE_TWO,
+};
+
 #define TWOMEG		(1 << 21)
 #define HMM_BUFFER_SIZE (1024 << 12)
 #define HMM_PATH_MAX    64
@@ -60,6 +67,21 @@ FIXTURE(hmm)
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
@@ -68,6 +90,24 @@ FIXTURE(hmm2)
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
@@ -81,12 +121,19 @@ static int hmm_open(int unit)
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
 
@@ -95,9 +142,11 @@ FIXTURE_SETUP(hmm2)
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
 
@@ -211,6 +260,20 @@ static void hmm_nanosleep(unsigned int n)
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
@@ -875,7 +938,7 @@ TEST_F(hmm, migrate)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -923,7 +986,7 @@ TEST_F(hmm, migrate_fault)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -936,7 +999,7 @@ TEST_F(hmm, migrate_fault)
 		ASSERT_EQ(ptr[i], i);
 
 	/* Migrate memory to the device again. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -976,7 +1039,7 @@ TEST_F(hmm, migrate_shared)
 	ASSERT_NE(buffer->ptr, MAP_FAILED);
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, -ENOENT);
 
 	hmm_buffer_free(buffer);
@@ -1015,7 +1078,7 @@ TEST_F(hmm2, migrate_mixed)
 	p = buffer->ptr;
 
 	/* Migrating a protected area should be an error. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, npages);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Punch a hole after the first page address. */
@@ -1023,7 +1086,7 @@ TEST_F(hmm2, migrate_mixed)
 	ASSERT_EQ(ret, 0);
 
 	/* We expect an error if the vma doesn't cover the range. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 3);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Page 2 will be a read-only zero page. */
@@ -1055,13 +1118,13 @@ TEST_F(hmm2, migrate_mixed)
 
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
 
@@ -1070,8 +1133,12 @@ TEST_F(hmm2, migrate_mixed)
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
@@ -1107,8 +1174,7 @@ TEST_F(hmm, migrate_multiple)
 			ptr[i] = i;
 
 		/* Migrate memory to device. */
-		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
-				      npages);
+		ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 		ASSERT_EQ(ret, 0);
 		ASSERT_EQ(buffer->cpages, npages);
 
@@ -1116,7 +1182,13 @@ TEST_F(hmm, migrate_multiple)
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
 
@@ -1354,13 +1426,13 @@ TEST_F(hmm2, snapshot)
 
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
 
@@ -1377,9 +1449,16 @@ TEST_F(hmm2, snapshot)
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

