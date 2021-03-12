Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB93387A3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 09:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B90E6F4AD;
	Fri, 12 Mar 2021 08:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719CC6F4A9;
 Fri, 12 Mar 2021 08:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMk4m0lbGpir5uy3oy8JHl2sUn4v7vlqDqN2i50tKAR+9TyNtuKIVgBoUsEyC+/0x8vRfBKYAMZ5dotobrg8Hz2zwQgGwuVhKKn++fHkJhcK1v2bhu8gt6GA3ZecWmojIZXT8TcksTioit0/DQyqProP5XHP9Sbga4UEHrcnoYTCyF6kyXEdn64b8eWXvdhP28aXffUIllTDyl3Rs5PXz/ppxbQXq7qEbX26C+Vh3Og6c5iAO63Wqrq0aEdlcFJO1SU7gc0FRAz07GZZpoHF+59opTypqKLsxbJkS6EV06A6KacEZZp+L7S2sriu1slOUK37JLtT4NOzwqJ3yi7kmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHg7+L8laAfAZIffcai4Z1Bzj8ixMXAYd33zbn3eV4o=;
 b=E9bQsbmxDXn/3RezQX5QrYy8DNxAj7luWOrzQsmOeax4UCRwVAlhQfe+3ZImU+134AR/+Kq1Mkbh6pLILu7+l1Ce976B2//n9DFjZ2M9QDc+MkRrp67/2UUe4xYq6Df9l2/qI+EBQ/+S+gXQiqe/lsssYeyjiyvTMgiAgaem7mEzPhzFqt43EP0PicpLCWwt7zyOikBoTaajIUCTrIlWpAGW+DGy1DhrbvAn42ZYw1AnDWkgdvr3AakX65sGzgZygCJkwhIEXOKnJTksbjwyy4BkTrjPI5d6tgT3sbtXBPzM6dCe3nK8OJnVkzPncVlsPgR9svGtXd9v6W14pQq12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHg7+L8laAfAZIffcai4Z1Bzj8ixMXAYd33zbn3eV4o=;
 b=cO8KXCN0QVAAd7k9TLdnnfUq4pVkQ8cjUCwsBxYH8bg2MK9r3k+nwHqKldUPhOuo0FSVNUB5WlDyZW6oeTIan0qxppz3PgrUaRMqXO8V8jW5/pXezxK3lZ8eiW1JtXOdsAVNQODULvVYgqQXfUzNlVxbiBaEanXEkrzW8pIteZhaz4xq+k6Qr0ElbfGXidI5jy3t7LD3auF2UPhon5CRcTjYxDJt5sBmIZYvYYhPxmHIs07YggPYHUTQDK5x6ryjndtEWfJRplpZk51fa99/2sjR0HWdi0uvxQP6pbNYDD5HYxugGAn20mXIFEwT8N2bi6sEV1OngNUXMDG8SwNhTA==
Received: from DM3PR12CA0055.namprd12.prod.outlook.com (2603:10b6:0:56::23) by
 DM5PR12MB2422.namprd12.prod.outlook.com (2603:10b6:4:b9::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Fri, 12 Mar 2021 08:39:36 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::a1) by DM3PR12CA0055.outlook.office365.com
 (2603:10b6:0:56::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 08:39:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 08:39:35 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar
 2021 08:39:34 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v6 6/8] mm: Selftests for exclusive device memory
Date: Fri, 12 Mar 2021 19:38:49 +1100
Message-ID: <20210312083851.15981-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312083851.15981-1-apopple@nvidia.com>
References: <20210312083851.15981-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c53020b-4be2-49ec-efe7-08d8e5325df0
X-MS-TrafficTypeDiagnostic: DM5PR12MB2422:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2422931B5B308F505F918030DF6F9@DM5PR12MB2422.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bnmbdknQTIR0xea5Fxa/Q+oNTWXmIHhzn+BRyrFz2LSwUjmd7QfBwBsrzZfmNYdgnS0MgiCInFDyqW4GYml2N1EASgQVVFBYV2X5rmrR2mi0ZSewslHCESwgqxo4nOMYqXDyVsjyQcGv5PngPv/yD9T8fCzc4k9dA940jYV/LUm5AZ+ttGo5OS08W7d2Brg1e5v/bTvsapFH9/ApXApL1xdjhkQ9+tZyIgQWaguPVaBD0+MPWDnd1UIk6lWOEhbno+XDSgmPn2/E+0YTUf5XxgqqRI0vVdAKf1Woius+3+7PJ3pL+XubmJyINZJdQndUwXrZiIuT5LbNKwhylU6GnRkP+PtAdDTP773KITINVbyQP4hFEb9WmNoryH8/uiGPzEqQcMu1vyNHS77kPDd8ElmCDvGu/yEwWDM8hcD43zPOXQSn40xxYN+fqCvCCLpx3ojkrMPsIsg1UBp5gOTLOBQnOQVXbvmcukXM+JJNJvWLiAOcH9hlS7bMygiJ5wSE9EhDTpP7YRTDKVh6O3JYFNCpT7+SBLgPvLw2rVug4r9lhL2uDV274FeHoozjxEDAqkur3Bz8s04ue1kKC6PIhYlOBsGwXlqQ9UxXnHHKfCpbxXEFd2z9DGB1VJPju5uDZWHkSQND1dFUw0JP8xa0IVZeOAye7ibVnfM3lHzKcbTd3qgApjn0LmR5cQtDlyD2
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966006)(36840700001)(336012)(36756003)(70206006)(4326008)(8936002)(70586007)(2616005)(2906002)(83380400001)(186003)(82740400003)(478600001)(26005)(82310400003)(356005)(54906003)(426003)(34020700004)(7416002)(16526019)(316002)(47076005)(36906005)(36860700001)(6666004)(107886003)(30864003)(86362001)(110136005)(8676002)(5660300002)(1076003)(7636003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 08:39:35.9102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c53020b-4be2-49ec-efe7-08d8e5325df0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2422
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
 lib/test_hmm.c                         | 124 ++++++++++++++
 lib/test_hmm_uapi.h                    |   2 +
 tools/testing/selftests/vm/hmm-tests.c | 219 +++++++++++++++++++++++++
 3 files changed, 345 insertions(+)

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
index 5d1ac691b9f4..5d3c5db9ed3a 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1485,4 +1485,223 @@ TEST_F(hmm2, double_map)
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
+TEST_F(hmm, exclusive_shared)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	int *ptr;
+	int ret, i;
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
+			   MAP_SHARED | MAP_ANONYMOUS,
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
+	ASSERT_FALSE(ret);
+
+	/* Map memory exclusively for device access again to check process tear down */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_EXCLUSIVE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Same as above but for shared anonymous memory.
+ */
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
