Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D5A349D4E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8426EE77;
	Fri, 26 Mar 2021 00:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B4D6EE77;
 Fri, 26 Mar 2021 00:08:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVo/kWQbRD5SOCOXXuLiGLdsj/6iIh7lHo9MZDsjsd5Qrt8Khmd5Ujy6o7vsr/CfFx+plnNtIeuS3iFRfTWbH5j0wG9X4l3Y45R8cNPpO3qmweMQxzlEvztpjEqRkYGw+OIrhuqGxdDI5WPwdKQwh7g1f4Us2uJo8M0g5+S/UiNkgnI/CagvPlvXK0dNA8rFbXufy5DIliwRES60849V8bTl/z3mD1ZJRiRScgAmJ+WE+FN1ce7eDwTVj7Vaiob9mKUmpEj3WreWH+zNPTNN+l4YQh+iHblkQz0rnpqze+hhMcdEXfasKi71XEE0J1izErsDB2yHvc/AtHk8YQPODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1PlBuDFv+fkoDCHxutPb13euniKAWFWXRYTXtMR9iI=;
 b=CRlGB2I+GbqvqT3kVDiofmG0GXAVT9UtWT9jNkgU9kvPkSXUoU1KoWLSbHoBNPLDCL1A5tsrg/ObmdHAiostKgUXi3k4J+TMixjBqGqfZOQS5M/cUaoe3/xJIy7+VPc+MP1EGRkANlWXedS/YiEtaiuCeoGUBvJBqp8tHmrnR/35ZojnuDjto/yZFjSnJlQ9YqUdR9qn0s95tNSPNfS8zUUHO9Oyde2g1q+JOf+rr6oH+rMqBLXV9gbI1xx0Gu2WudzBwJ5iuNWdeihE10e/hwdDY1qZH8Hcm3MfKfoUDRIoky//NYwUMpuoqqbcQtzKzuflopwu2t9anrzdSi9MYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1PlBuDFv+fkoDCHxutPb13euniKAWFWXRYTXtMR9iI=;
 b=cLxKaKwZFgc+HIgxT9FoWXrHd8HZqI7i3vSP0o7pk4kDRITmW+gBqsshkW2xAzQaIIA/yY6DoPn1wDkf7TqsVC9zToIzDfTwvYVp6jINVhlzHZvi4iTDLh+jbstKIz9t2F0AQwxsNn3RqMNdtbK/+OoFD16PLqZ9w+jCif2O0wQUEDnW5VhW3l4OVahBN4lvd5eaeJAZqrvHD1vQHU0N6mQXpRE8wJRWUpT4MlkpO3ZeUikp70ZVjXXO2uR7s7rISfAfK+nSpMvTTJxK55c+4N0LJ7+oDQvNif6pZT7a8/YNMTOTNLrOjZIp7r+seOfgXvDRWj//frT7Bwuysa0v0g==
Received: from CO1PR15CA0050.namprd15.prod.outlook.com (2603:10b6:101:1f::18)
 by BN7PR12MB2803.namprd12.prod.outlook.com (2603:10b6:408:32::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Fri, 26 Mar
 2021 00:08:39 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:1f:cafe::f0) by CO1PR15CA0050.outlook.office365.com
 (2603:10b6:101:1f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Fri, 26 Mar 2021 00:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 26 Mar 2021 00:08:39 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar
 2021 00:08:38 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v7 6/8] mm: Selftests for exclusive device memory
Date: Fri, 26 Mar 2021 11:08:03 +1100
Message-ID: <20210326000805.2518-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326000805.2518-1-apopple@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62fb039b-49e3-4068-f8f3-08d8efeb4ef7
X-MS-TrafficTypeDiagnostic: BN7PR12MB2803:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2803A762989D24AF8B86A0FBDF619@BN7PR12MB2803.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: feLfgiQtv6Inb9zf2//7+n8J/AYv+MsfMrRo/Q18WUSs0CPTQE4Apppj6Ee+EtMkPDvR6Go5NSSvoSeeOn1Ws5Ahkv26g8i8GC/Krf3HS7pzhQLJU9L9tTz9JVlHf7AzWCJpy7mooX9Q9+CBci//kKJ9BkcY6IpkBsD98u242U8dVYQPQa0XCf84LCefjNKLjyQZ0m1Bq/LJRtGyS3wHsmXoQU1eztiGbbGXqtHS03eb7X+pNGHzRa8TmKLzbOGh7lzY/uoxsUAQC4H6SXVu7eZ/IytyvLBkaFMc4d2VPo5hw26Ucc0jtQ1CizNy+BitTLh4NN9hNGi8ScJoiLIgs0b37lUPrV+YRhGxj4Jad0Lk2sS+B2nCCXP8go+qh9R9+z1F6ShMjA9BOq/ioUqAWtIfQp9ZWrk7Kzzds/l0jkbvTTm3nkRWOGGPMaf3JpkbiyZzQo3Gw9sEU209ouPs9/eqroKzxEyXsfqV7sEPGH81NNHbEZnIUHyYUV8x9NNv7NJx+YNhj+v8P5PEmt1uAykU7SjCed+IthCRRmMFN8xB4e7cysWNmfJIltEDhZRHX2KzL8UDr0n2ubNk4U0AsM8zaa6JCgaaRJrRNfMrOWKYAfzqwlMpaUmmydwf5j7axja6edkS6XzGTD/dlgOZJA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(36840700001)(46966006)(70586007)(2616005)(86362001)(47076005)(7416002)(6666004)(4326008)(70206006)(2906002)(36860700001)(83380400001)(478600001)(110136005)(5660300002)(54906003)(7636003)(82740400003)(186003)(26005)(8936002)(107886003)(316002)(36756003)(82310400003)(8676002)(356005)(426003)(336012)(36906005)(1076003)(16526019);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 00:08:39.2822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fb039b-49e3-4068-f8f3-08d8efeb4ef7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2803
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 jhubbard@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds some selftests for exclusive device memory.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
---
 lib/test_hmm.c                         | 124 +++++++++++++++++++
 lib/test_hmm_uapi.h                    |   2 +
 tools/testing/selftests/vm/hmm-tests.c | 158 +++++++++++++++++++++++++
 3 files changed, 284 insertions(+)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 5c9f5a020c1d..305a9d9e2b4c 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -25,6 +25,7 @@
 #include <linux/swapops.h>
 #include <linux/sched/mm.h>
 #include <linux/platform_device.h>
+#include <linux/rmap.h>
 
 #include "test_hmm_uapi.h"
 
@@ -46,6 +47,7 @@ struct dmirror_bounce {
 	unsigned long		cpages;
 };
 
+#define DPT_XA_TAG_ATOMIC 1UL
 #define DPT_XA_TAG_WRITE 3UL
 
 /*
@@ -619,6 +621,54 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 	}
 }
 
+static int dmirror_check_atomic(struct dmirror *dmirror, unsigned long start,
+			     unsigned long end)
+{
+	unsigned long pfn;
+
+	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++) {
+		void *entry;
+		struct page *page;
+
+		entry = xa_load(&dmirror->pt, pfn);
+		page = xa_untag_pointer(entry);
+		if (xa_pointer_tag(entry) == DPT_XA_TAG_ATOMIC)
+			return -EPERM;
+	}
+
+	return 0;
+}
+
+static int dmirror_atomic_map(unsigned long start, unsigned long end,
+			      struct page **pages, struct dmirror *dmirror)
+{
+	unsigned long pfn, mapped = 0;
+	int i;
+
+	/* Map the migrated pages into the device's page tables. */
+	mutex_lock(&dmirror->mutex);
+
+	for (i = 0, pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++, i++) {
+		void *entry;
+
+		if (!pages[i])
+			continue;
+
+		entry = pages[i];
+		entry = xa_tag_pointer(entry, DPT_XA_TAG_ATOMIC);
+		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
+		if (xa_is_err(entry)) {
+			mutex_unlock(&dmirror->mutex);
+			return xa_err(entry);
+		}
+
+		mapped++;
+	}
+
+	mutex_unlock(&dmirror->mutex);
+	return mapped;
+}
+
 static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 					    struct dmirror *dmirror)
 {
@@ -661,6 +711,71 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	return 0;
 }
 
+static int dmirror_exclusive(struct dmirror *dmirror,
+			     struct hmm_dmirror_cmd *cmd)
+{
+	unsigned long start, end, addr;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	struct mm_struct *mm = dmirror->notifier.mm;
+	struct page *pages[64];
+	struct dmirror_bounce bounce;
+	unsigned long next;
+	int ret;
+
+	start = cmd->addr;
+	end = start + size;
+	if (end < start)
+		return -EINVAL;
+
+	/* Since the mm is for the mirrored process, get a reference first. */
+	if (!mmget_not_zero(mm))
+		return -EINVAL;
+
+	mmap_read_lock(mm);
+	for (addr = start; addr < end; addr = next) {
+		int i, mapped;
+
+		if (end < addr + (ARRAY_SIZE(pages) << PAGE_SHIFT))
+			next = end;
+		else
+			next = addr + (ARRAY_SIZE(pages) << PAGE_SHIFT);
+
+		ret = make_device_exclusive_range(mm, addr, next, pages, NULL);
+		mapped = dmirror_atomic_map(addr, next, pages, dmirror);
+		for (i = 0; i < ret; i++) {
+			if (pages[i]) {
+				unlock_page(pages[i]);
+				put_page(pages[i]);
+			}
+		}
+
+		if (addr + (mapped << PAGE_SHIFT) < next) {
+			mmap_read_unlock(mm);
+			mmput(mm);
+			return -EBUSY;
+		}
+	}
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	/* Return the migrated data for verification. */
+	ret = dmirror_bounce_init(&bounce, start, size);
+	if (ret)
+		return ret;
+	mutex_lock(&dmirror->mutex);
+	ret = dmirror_do_read(dmirror, start, end, &bounce);
+	mutex_unlock(&dmirror->mutex);
+	if (ret == 0) {
+		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
+				 bounce.size))
+			ret = -EFAULT;
+	}
+
+	cmd->cpages = bounce.cpages;
+	dmirror_bounce_fini(&bounce);
+	return ret;
+}
+
 static int dmirror_migrate(struct dmirror *dmirror,
 			   struct hmm_dmirror_cmd *cmd)
 {
@@ -949,6 +1064,15 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_migrate(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_EXCLUSIVE:
+		ret = dmirror_exclusive(dmirror, &cmd);
+		break;
+
+	case HMM_DMIRROR_CHECK_EXCLUSIVE:
+		ret = dmirror_check_atomic(dmirror, cmd.addr,
+					cmd.addr + (cmd.npages << PAGE_SHIFT));
+		break;
+
 	case HMM_DMIRROR_SNAPSHOT:
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 670b4ef2a5b6..f14dea5dcd06 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -33,6 +33,8 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 5d1ac691b9f4..864f126ffd78 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1485,4 +1485,162 @@ TEST_F(hmm2, double_map)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Basic check of exclusive faulting.
+ */
+TEST_F(hmm, exclusive)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
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
+	/* Map memory exclusively for device access. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i]++, i);
+
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i+1);
+
+	/* Check atomic access revoked */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_CHECK_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+
+	hmm_buffer_free(buffer);
+}
+
+TEST_F(hmm, exclusive_mprotect)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
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
+	/* Map memory exclusively for device access. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	ret = mprotect(buffer->ptr, size, PROT_READ);
+	ASSERT_EQ(ret, 0);
+
+	/* Simulate a device writing system memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_WRITE, buffer, npages);
+	ASSERT_EQ(ret, -EPERM);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Check copy-on-write works.
+ */
+TEST_F(hmm, exclusive_cow)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
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
+	/* Map memory exclusively for device access. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	fork();
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i]++, i);
+
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i+1);
+
+	hmm_buffer_free(buffer);
+}
+
 TEST_HARNESS_MAIN
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
