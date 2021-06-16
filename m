Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9DD3A987F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89EF6E5A5;
	Wed, 16 Jun 2021 11:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05C06E5AB;
 Wed, 16 Jun 2021 11:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBEQIxbc8NuzkDD5FT/G69qZM1zGKafhj7EXtWRO9fbwhzZP6CD3e4P7EejShlylwOTILjb1PqW6ucfqtb94wRb2/M4jVdCLRgFBE/mP+7wf4KT4zkqVHvWesDKJXpbWvncu/fiKkxH7yv7nJvGp6QlvP4Yi6qNoI3xhT2xLj85zEw0wcJ8T8wby3nwtOmgb5RxYy0rZ7xL65GOGOe8s6skICrEZtrkBQSv6f9lfcF8VSfqoAWXg/l3vU3D/i/cbBOjhwKmcLOE/jCpRIOU2nek/XF7p9NNFg0U8HC/b7nfwv/8gxsKxHCM8wN4mr6TlwkwE/ORZABF4VRVZzWjnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWqS8sVnryX99UXveTXLi6Oc9+c9jC8lwCZmxKQgdFw=;
 b=Uukz/IecgNyyr4jIyIo1Q4140Ho4J63/1QkQpEtXOJjBsL9flkJRoQB3kmG9AaWmV0n84YA8mtWkV+TY2YhdwCAPJgY7IaaCzbLg7l3Xcf92FuliraLlm4ACSipURMUX2t/9klqwvzzjyOc73OrHzCzEOqk+hRCVCvy5qZ4XXdJwz1QTa8+ao4G2L0IALWrS7LiZclyDSwQsdVK3Nzwf9DDYuujBC2fudjE5D7ox+hxMR2o9Ji89pcIrs5POqD6HNr17AhsNcPsWxXeQGmSKCPwdYwULTbS1Pola2zNAn3xthSl9ceywFe1SHicB6QP7ZWTbfaElXJ4W3IuMUAPOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWqS8sVnryX99UXveTXLi6Oc9+c9jC8lwCZmxKQgdFw=;
 b=FPJDOVGgsxfUuYBhJgovRaxNa5zT28AfRV5xKRSNXDBJUdwWr5lb2kAfyBykv/CehQigzmb0voAI5lLEpdxCj6grARHjsQZJ49A7+eoJoUjlxUNwFDOPYbbV2wHokw27H9GPY0osrBqu8g34QakKUoczzVki7WaF1Z0YVC7CNV6lRj283FwS+zXvbCjsyV2k0QB1djdj0Wz29nhNRGwIWPAon21teU37MfHp2Q/TcdAerL6I37xY+M+3qwJ2eljGgq/xXTvosYWXhPNho2UZdOaEOHQgH8rFzq2LcKtbKyv7aShNfTBIDxnT7sSByN1R76mKtWf+IOdW8IiNvRjcOg==
Received: from BN6PR19CA0087.namprd19.prod.outlook.com (2603:10b6:404:133::25)
 by SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Wed, 16 Jun
 2021 11:01:06 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::1) by BN6PR19CA0087.outlook.office365.com
 (2603:10b6:404:133::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Wed, 16 Jun 2021 11:01:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 11:01:05 +0000
Received: from localhost (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:01:03 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH v11 08/10] mm: Selftests for exclusive device memory
Date: Wed, 16 Jun 2021 20:59:35 +1000
Message-ID: <20210616105937.23201-9-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cef6d18-83ef-4063-8379-08d930b60a34
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:
X-Microsoft-Antispam-PRVS: <SA0PR12MB455765243976219760B92E09DF0F9@SA0PR12MB4557.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0UymcNgvsqP7w89es/ZaDLSIEBGwQm82ra0QMCYSAI4NyQRt55xGJheF9hTANFjSCGCLnoJYe0pVeHpjdWl/JOLWWr8lCOcWmzdb1ncN70X0UeejJ+w6EhpT+jeR6zuxRiU/7uJK3grF7VUrkEGTFVwQVAXHSCOAbjhLLsqYEC9smwCK38hnegJwvmlyiAxRonYR2lfOmXKaXOukXsS4puX5S3xATvEKJVjOj7nJT2yOZLBYtEpic2+lPx9dqqKglGkQ6aZvOTp/gk7v4CUeo7fQFR8BArE6qoTDwuF35FbUCHeuIjJOKITKDpeWGCtqb6wSTR9l3ReKje9frBD/L9h9LaZqp4lcWxPoPKM2GvLHCVPIWgxctVxnQWUHWZ9L6My5DMbe3mTilq9Ac9AP8r1fUwCjv5/h9bRhVFzVmJKut9k5eT0GyeJ1HDgwfn8QySJcIxBj29RtclZNqJxYR6uD+Uc65ezoMrmK6n1pIeDd0SPWNcltUeAx8NhIyZk372X6/siGakEXTkgy2D/9mYUQdePZa5uY2vousYi9p3dqe7/rlX9KM4zOQE+nhMPXr/Qf7NziURQgSHiylO/HskV07X5kC1Ep8OhOrI16eHEyAFm3BER3zzz/wX7bR+rj40jaZGHKCbY8tjRKxc+NKw==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(36840700001)(46966006)(5660300002)(82740400003)(83380400001)(70586007)(2906002)(36906005)(70206006)(107886003)(7636003)(7416002)(316002)(6916009)(356005)(47076005)(8936002)(426003)(4326008)(26005)(54906003)(86362001)(36756003)(1076003)(336012)(6666004)(8676002)(16526019)(478600001)(82310400003)(2616005)(186003)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:01:05.9112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cef6d18-83ef-4063-8379-08d930b60a34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4557
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com, shakeelb@google.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, jhubbard@nvidia.com,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds some selftests for exclusive device memory.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

---

v10:

* Squashed a fix from Colin King. Not sure what the right attribution
tag for that would be though?
---
 lib/test_hmm.c                         | 125 +++++++++++++++++++
 lib/test_hmm_uapi.h                    |   2 +
 tools/testing/selftests/vm/hmm-tests.c | 158 +++++++++++++++++++++++++
 3 files changed, 285 insertions(+)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index fc7a20bc9b42..8c55c4723692 100644
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
@@ -661,6 +711,72 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
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
+		unsigned long mapped;
+		int i;
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
@@ -948,6 +1064,15 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
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

