Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61CE5397A3
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C4210E631;
	Tue, 31 May 2022 20:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3605810E56D;
 Tue, 31 May 2022 20:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgIB5djTKIlB5viGEZT1P184unhtYgpcfM/04WRZ1wcMVGhWNw0hKZ+niUuVJ5pIvW4GS6AO732IclRvZGD6hIvaew/UdnJinWFNd38AcRqn4MqB/O0CI/KyGPnkAJL+wU7bGbGndBjiu1GNZNZiWr4WRkTmLUqJJlVFjpXKI+ksMM2+ngrne8VSiFgCdMd50nVa8Q+EzWk7invRU0g5VFWv9NMWY1OSqonuNsIW7BXKjvzgtZiOhTdeO9tAcTxHvdxyOKszGbmyeXp1yacHIT16rsfO19uL10C2btGywr5SpC9xDcEJIaDovRy0wlUVYUX7gZVliGBLpqxxcqXKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLUulsB1/0J8kd+6o4LsjQcQXGXA09wcrMO4NoTeXEg=;
 b=gz2ugwH+YNpYUNL0jcDM+Td/WAMp4tzsRUAmS+DjzrvmWf6g3RHglu1Z+o/gUWenuuRIk7chg6Ave//PngUepTaL/m9sha11BKVtGHYbIxkGm0dzO5zMg18F9f2/UDyByxp9XFut1i0fi3o/QscBlUjbGWXeiJCF9FE36z5s7JRsnOhcEAdRKCMZrri0oUO3bqFpQraaB1eR0+YcftGw5N9g9gZYkARZoeGdSeqUIZIUkfhBlIuVgvNsQk9DkbRooeQZZHpdz5wFnigXnbCWoeDseoOeU4e+ZflKmeFpSd9ZaK9RFxTJ+uDtB5a9lwe3m4DDp4hEDJ6o4IuudUInrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLUulsB1/0J8kd+6o4LsjQcQXGXA09wcrMO4NoTeXEg=;
 b=iZswqH1iD+EGezgvYxytWqBTk8Q1sIqtNACkXZkeuqu2iGNZCyuG62F3WC9yvXRwmmxjj8W3fxMzySS0pq4SsmwboabegaG35y0kBWsll5lkByTOc3EI86TlbkrQnXst4FvT1iIAz60jVs35E5aY/3sJY4EE+/IjndssVAuuC6E=
Received: from BN9PR03CA0372.namprd03.prod.outlook.com (2603:10b6:408:f7::17)
 by CO6PR12MB5395.namprd12.prod.outlook.com (2603:10b6:303:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 20:01:05 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::6c) by BN9PR03CA0372.outlook.office365.com
 (2603:10b6:408:f7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Tue, 31 May 2022 20:01:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:01:04 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:01:03 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 12/13] tools: add hmm gup tests for device coherent type
Date: Tue, 31 May 2022 15:00:40 -0500
Message-ID: <20220531200041.24904-13-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0d4d8667-d83c-43d6-2834-08da43404b88
X-MS-TrafficTypeDiagnostic: CO6PR12MB5395:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5395A40C49EC19C665CCEF54FDDC9@CO6PR12MB5395.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x5GpdY1kzeSr1N9t77hOAngoshBjgrWq5RgZLHqtFcKy7PPqiyG4zgxQOcPRpdWsRYbHpR8Zp6OhQubO6Lgct5v8nLjilHXPMQCp3zaVz16VvPgg0frd1wYU3JD1Z3W8E1A3doBxpW8glAWWB0pb0Uk2n3BzddXfwJ37x87FmJMlI+nw97tACyddTUEp/f6xeZhxcXRDuCSc2cP964pY1gxpBkxwxmw09ahd+CMusfbQAXwVq6fFXD5dMQ4/8qEFntp8tnQznyr4FA0uKsv5mPOQ86FumWuXCkDokGu0F2eE1I3F+pUazpkQrdXH/T2eEUOk2iKihxPRxYJVP/b8/5qvxmhOuOSMf4pOO84+Vn6ZudEpF+AyHDp2aS5Rb/2KG5FAQLQ9R1AgM0JMAAz8xPSucSLf+V+fb8t4EhG2LryeU5ZNu6dbPKS5mM4Qcc8BtwpqZx5Xf5XIpIHq81FpPTUU0Hz5hnvIDByn2Wjt3g73yTlN1RB6qheTKLz/ca9SgyJexX8oShNhjS1rX8x/3aYRSO5KIdKeDfozi1040hjTZbSJkkqHARHQQGcggKWtYi6qtvGtX6YyqbwJJm4ztd9p57mKZeZLhAbcdb4EBDOWQGSbGpSXjSCEvkB8fDkzGK7sZQbP9usJpuLoQfy3IIXDW6odazQOYpUmdldCkhJRktRA8is3zGdAcLpFqG/4ZrNOvZWNl+gq5yLKUN/sEA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8676002)(83380400001)(4326008)(6666004)(70586007)(70206006)(1076003)(508600001)(7696005)(5660300002)(8936002)(86362001)(7416002)(44832011)(40460700003)(36860700001)(2616005)(6916009)(54906003)(26005)(81166007)(36756003)(426003)(336012)(47076005)(82310400005)(16526019)(186003)(356005)(316002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:01:04.9903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4d8667-d83c-43d6-2834-08da43404b88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5395
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
 tools/testing/selftests/vm/hmm-tests.c | 105 +++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 4b547188ec40..3295c8bf6c63 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -36,6 +36,7 @@
  * in the usual include/uapi/... directory.
  */
 #include "../../../../lib/test_hmm_uapi.h"
+#include "../../../../mm/gup_test.h"
 
 struct hmm_buffer {
 	void		*ptr;
@@ -59,6 +60,8 @@ enum {
 #define NTIMES		10
 
 #define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
+/* Just the flags we need, copied from mm.h: */
+#define FOLL_WRITE	0x01	/* check pte is writable */
 
 FIXTURE(hmm)
 {
@@ -1764,4 +1767,106 @@ TEST_F(hmm, exclusive_cow)
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
+	npages = 3;
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
+				GUP_BASIC_TEST, 1, self->page_size), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 1 * self->page_size,
+				GUP_FAST_BENCHMARK, 1, self->page_size), 0);
+	ASSERT_EQ(gup_test_exec(gup_fd,
+				(unsigned long)buffer->ptr + 2 * self->page_size,
+				PIN_LONGTERM_BENCHMARK, 1, self->page_size), 0);
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

