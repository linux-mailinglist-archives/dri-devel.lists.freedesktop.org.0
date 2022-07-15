Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277D0576F0F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358C610FBC8;
	Sat, 16 Jul 2022 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E3510E06A;
 Fri, 15 Jul 2022 15:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7QtJcwHyfmu1gRRtFFPjNgjP5Z8OhCnNZ6juvkGgSJxC8zFYOGmt3thxqn+DkURlbAqiSNIwNvVb+EQv251FKE6pBe5L6dbDrIw2mWh97lBtqL3HyWcV1rY6bI/Upup+w7biFJ0QhLA370xixVQnw0Dpo4o+0eJ0OyLa5EP8pZAN4ysO0Lp56npXpXyRN1VIbhhcBPhDyDMpl3UBgqz5E4lrzE3020c1A96uDZUfKmMeDWlluJ5OjmZZ4lxHRGEcW+gzGrVJk5a6EUPlp4WzqlsnEPIEepsu2MLwBLrx0i58ayjlGb8xvRuFuWnBDgyP3QqgZZPX27P5oboz9ezTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP3ikngykfp62hqgKGCY9CKncoZ/5EVzq4BZbbmWmCY=;
 b=eFVRQ3FqlBnVxBUhzFMrWao6vZkAqBNtY0LO+/eYE2j47AC+NVOe7qaFj0jzJBFjs8kftBOjSC0m/DDlPdJPJLYd/L4319x02QldaAWf/zil7xcy7HJwDm4fbP8AfmnSwy/plWqWblJQ5yBzYjSOPNkmE0yXfphhtbTj4MR9oBKLA7E6pFy9c2MAcUCflupy2cgmRgEK7xczG7FyZhqb8mp3Aebzjcl2/OGbc53atqpLt2F9RrHa+71tklvyGE2dSZlx2Ecy5U9sq8hHV60aOSaGkzvi6eHBow2Ch9ctOY2u4oUmBCUcDej2x4WLZfKBQBm4kJUDPoX7rmOT0jVw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP3ikngykfp62hqgKGCY9CKncoZ/5EVzq4BZbbmWmCY=;
 b=gl9t2K1Y/rtyNNjxh5mvYTs82rggHqmyNxhAW4OwsZ14Egn9DM8HSUfA3nzocaL58IdM7zXQ+34GyVIE5BF4nD9m2eI5z23euv+LRLOJTaITJpKuICpMrjY1pOrXFZt/b8Nkp2qMuFkduELbXxg3eJdzDBVRQ26vTeh4+vaUjJU=
Received: from DM6PR17CA0021.namprd17.prod.outlook.com (2603:10b6:5:1b3::34)
 by DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Fri, 15 Jul
 2022 15:05:52 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::c5) by DM6PR17CA0021.outlook.office365.com
 (2603:10b6:5:1b3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:52 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:48 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 13/14] tools: add hmm gup tests for device coherent type
Date: Fri, 15 Jul 2022 10:05:20 -0500
Message-ID: <20220715150521.18165-14-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 395ea720-d326-47e7-07ac-08da667382d1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBdeFIjFRmVmSjrW6UaitFF0tc1tq0YlIC0wocoAHKevLRVgxx1WXTWwIkA2cvYAVvc83/kd+Tce/ZQcjDCSI5QID+QkdCII++ZNGlP3zOpzOd4Ok+pgZDSI6g8Mq9cvqA2AD7QSqQG9LWc36e1U8sasOc3pkh+Ie7Hc/dRFnHxS6OMkBHziQNU2CDjMfEDWkvkXkrJpKAaTIoJ2Fzu0xeBddgTxgTcsvzXw43b/ScgOWOiQv08RhYejxIJE5c3dk0q0uZnmdrSkY6sSiBxwondDhufi7hMM60c6lxHO4fE5/FWyJu8RhaYfumiFQ5vpm2IrGX6yo35wasyzS+j842Pn3yTNFh78/UgRIrRarSnCN9YyYoJ3Xn9JgqNCHgpidDAVKueMDyJu8PACkqKoq0ifuKMSh7hv93ndLE8Fdlc4Ng1Pf8sMi1VlS3XSPaZRHg3FE2A/IdO2QFgsNnIrrZ1z+cC48OB3dL6fwxZCaT1sH7/GasOcivV63HyDQxvi9cUynHkcpyqx4GLUUiJSPk+vNCGPXN1hybOQoJxlRqjIPyXSw5QymnEyeRiyBliYw4jZuDEjtvOIYGoZg/wHg5flebSw3SinDQfA4fqNTp1Xw3RC7SVovbHpfrs9REBmQJIOoHNQDioi0vydqq73tI/kFuTBktLiK6jhCozNi58dNAQMyrCOgYh/b3/InbmbhH+mdbAzfHZXkekjnfOvtz1Zt83bAUmIdb3TMkYcNaIPZmwTQ//Y/CCqUTHZzvKCLwAIF2CSKhhtIZzORLT7wjJ6XhWbEwVX2u4uKZ9MJZLUjN9TsvIDu3ze30mmsK8nwtSUDtqwVo5cPMNBVgveTWM2AgTVBdXPWWOuwIJD5lw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966006)(36840700001)(40470700004)(4326008)(44832011)(54906003)(6916009)(70586007)(26005)(41300700001)(316002)(2906002)(478600001)(70206006)(6666004)(8676002)(47076005)(16526019)(36756003)(426003)(186003)(86362001)(336012)(40460700003)(7696005)(1076003)(82740400003)(40480700001)(83380400001)(81166007)(5660300002)(8936002)(36860700001)(82310400005)(7416002)(2616005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:52.7418 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 395ea720-d326-47e7-07ac-08da667382d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3849
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

The intention is to test hmm device coherent type under different get
user pages paths. Also, test gup with FOLL_LONGTERM flag set in
device coherent pages. These pages should get migrated back to system
memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 110 +++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 4b547188ec40..bb38b9777610 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -36,6 +36,7 @@
  * in the usual include/uapi/... directory.
  */
 #include "../../../../lib/test_hmm_uapi.h"
+#include "../../../../mm/gup_test.h"
 
 struct hmm_buffer {
 	void		*ptr;
@@ -59,6 +60,9 @@ enum {
 #define NTIMES		10
 
 #define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
+/* Just the flags we need, copied from mm.h: */
+#define FOLL_WRITE	0x01	/* check pte is writable */
+#define FOLL_LONGTERM   0x10000 /* mapping lifetime is indefinite */
 
 FIXTURE(hmm)
 {
@@ -1764,4 +1768,110 @@ TEST_F(hmm, exclusive_cow)
 	hmm_buffer_free(buffer);
 }
 
+static int gup_test_exec(int gup_fd, unsigned long addr, int cmd,
+			 int npages, int size, int flags)
+{
+	struct gup_test gup = {
+		.nr_pages_per_call	= npages,
+		.addr			= addr,
+		.gup_flags		= FOLL_WRITE | flags,
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
+/*
+ * Test get user device pages through gup_test. Setting PIN_LONGTERM flag.
+ * This should trigger a migration back to system memory for both, private
+ * and coherent type pages.
+ * This test makes use of gup_test module. Make sure GUP_TEST_CONFIG is added
+ * to your configuration before you run it.
+ */
+TEST_F(hmm, hmm_gup_test)
+{
+	struct hmm_buffer *buffer;
+	int gup_fd;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+	unsigned char *m;
+
+	gup_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
+	if (gup_fd == -1)
+		SKIP(return, "Skipping test, could not find gup_test driver");
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
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr,
+				GUP_BASIC_TEST, 1, self->page_size, 0), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 1 * self->page_size,
+				GUP_FAST_BENCHMARK, 1, self->page_size, 0), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 2 * self->page_size,
+				PIN_FAST_BENCHMARK, 1, self->page_size, FOLL_LONGTERM), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 3 * self->page_size,
+				PIN_LONGTERM_BENCHMARK, 1, self->page_size, 0), 0);
+
+	/* Take snapshot to CPU pagetables */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	m = buffer->mirror;
+	if (hmm_is_coherent_type(variant->device_number)) {
+		ASSERT_EQ(HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL | HMM_DMIRROR_PROT_WRITE, m[0]);
+		ASSERT_EQ(HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL | HMM_DMIRROR_PROT_WRITE, m[1]);
+	} else {
+		ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[0]);
+		ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[1]);
+	}
+	ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[2]);
+	ASSERT_EQ(HMM_DMIRROR_PROT_WRITE, m[3]);
+	/*
+	 * Check again the content on the pages. Make sure there's no
+	 * corrupted data.
+	 */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	close(gup_fd);
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
2.32.0

