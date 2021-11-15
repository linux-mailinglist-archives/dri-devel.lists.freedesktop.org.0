Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC745124A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162306EA93;
	Mon, 15 Nov 2021 19:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6696E5D1;
 Mon, 15 Nov 2021 19:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDPHhEl9WA3zaN3STRLLvFSI7AmDYnVK0IWb23hH/qRV0S2kMAzawGd7qgyP/6MtMO7NlCmx859lLWOzJocbgg9wVDv4RBVabhdS+xwhJLrapo7pqhDKefHZ8GFqFwjK0SNKL1siqYapPrUCv4Lc98Y9DCDtf8QmonPyxW3c4u0AQJaUvSHoT5khlKxq6RvrTG5gvu/OEYgW+HeBqs7ihkdsy6LgQmLoI2xQ6EHSOwbzDYE1DHsMkkBJ2eKNbZoEfBPAPj/hazeMv+7oLCo+eXFLfa9IQrUtz/BnEzrpjEJ2KbHK2dsfogB46aY2rO5lhwk/+GyiJnpODmMAP4FCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFE6hdbCetcen9KK7oP0V4CZUKjOggR58YrLI61Ul1k=;
 b=BtGsOut9TgnXhpNGm9Qa+8JWvg3XCsJv6ORTbYtE0MRZD6P/azW+eENoRv9SoQQ42FzegNgSTT8Z6fsnycFtPHk/xuCHIgtHixm8IC0zFgRBg0Rrykw6Yr2/dzmGgx3uNPLxLXGgdm5uk1WfraRUC9VrphUF7Bw1hktcHSvaJNcOWgeGxmrYxOcTI7MoF1gnmZPKaREcdRr/rmB7pgDSWiliDuVNFprdYZ1os4dLcMKj7zSOWXnFr5QJsTzO+iuwZypW5lRR+Nz5PreG1AhLPZIYOw4IiZAKOTIFFjGhLbdJQa+obe5DX9C8S92YPCq9ZVTVZyIzZM5jLb/XH54jrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFE6hdbCetcen9KK7oP0V4CZUKjOggR58YrLI61Ul1k=;
 b=JjuRV3bHattHP5G5WT8aWTBr6IaUvcHHDPyQxgyEhTeNQXZX5xfz3jpyCWjF3i4YFh0XPuDE3vYVInek/d1HCls93v1myqBR4lnsqpf31TOyrbQh5DYD0/i4Z6Zq9jR9e5nzCtwfwDQhYVU1a9a5iLVDfAd0m15vqt0tUDgnSNs=
Received: from MW4PR03CA0266.namprd03.prod.outlook.com (2603:10b6:303:b4::31)
 by BL0PR12MB2371.namprd12.prod.outlook.com (2603:10b6:207:3e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Mon, 15 Nov
 2021 19:33:26 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::86) by MW4PR03CA0266.outlook.office365.com
 (2603:10b6:303:b4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 19:33:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:33:26 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:33:21 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 1/2] ext4/xfs: add page refcount helper
Date: Mon, 15 Nov 2021 13:33:05 -0600
Message-ID: <20211115193306.27734-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115193306.27734-1-alex.sierra@amd.com>
References: <20211115193306.27734-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1365992-c5e9-4ff8-b403-08d9a86ecb79
X-MS-TrafficTypeDiagnostic: BL0PR12MB2371:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2371C697218C8D899D6EDC1EFD989@BL0PR12MB2371.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kMfIr6AMt21TBj8gsAeY+dINTNFx90Qurl8cPg3aRYE2Vn7UxRoVfxOHuvxib6/tTcdgVN3Md1fMbxmcjDdOt0NsuHZgQ1pNcDWw3s3XvssaatTgp8STY3qeJgjufxZlc5/V+6Ux4DvbplI+WQtPRhNdGJEkbvxqkAOkLofAAdnMfp7W0kObiBnCBjaHa1CJQLxIBrxuqUYQJRwabGnXYBeYC5ZHd2V0A90h+RWe+gaMjJ89peOama+YB6ZGXeE4GF3+EZ33zfuJairp5ZS5Q7WAtwNUz0Xyg7eMYaNgdcR+rUribMarxL+CaoAhXlxq+DkuFCBkdRDty8zhZ9s1SaVgdiCF08sE0zwY+wNpKxC+cUifyTJGpvJ5msnbfDIbT6fPmA8GreE5J2ZcvslxyhGIsvdnj07240sEk6vh0SKcrbMPPZROugrxua0hLCcP1LLoGf3tuFqIrDsPkxJ4wwHQyAonbNehI1l0OsqoW4JBzye0Cu7EJwHzzWBjK2/bhm/aaUimUED3JKI7/zJwVuFpNSKbjgzJRKiy1elYzKZd0xG4Tc4TMpA0IX4CQ2LP77gCWeZfTKhnRjukqQtx1Z2VyA/U1vwHtbTF8YsaKiPoVFgDpT8irTyG0cQolJTeVV0g9+c7CpCAfGI2FmgFdPhxclwPKCLv92J2r6ZmhKRA4CGqwyJm6PIVURBYlIjcbQRHnZXObnMPfJGE7J3zxE4G2Wcvcv7dVqYe0mw3pcU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7696005)(7416002)(316002)(6666004)(26005)(36756003)(2906002)(5660300002)(110136005)(16526019)(54906003)(186003)(86362001)(1076003)(36860700001)(4326008)(83380400001)(81166007)(2616005)(70206006)(82310400003)(70586007)(44832011)(336012)(8936002)(426003)(508600001)(47076005)(356005)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:33:26.1696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1365992-c5e9-4ff8-b403-08d9a86ecb79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2371
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

From: Ralph Campbell <rcampbell@nvidia.com>

There are several places where ZONE_DEVICE struct pages assume a reference
count == 1 means the page is idle and free. Instead of open coding this,
add a helper function to hide this detail.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Theodore Ts'o <tytso@mit.edu>
Acked-by: Darrick J. Wong <djwong@kernel.org>
---
v3:
[AS]: rename dax_layout_is_idle_page func to dax_page_unused

v4:
[AS]: This ref count functionality was missing on fuse/dax.c.
---
 fs/dax.c            |  4 ++--
 fs/ext4/inode.c     |  5 +----
 fs/fuse/dax.c       |  4 +---
 fs/xfs/xfs_file.c   |  4 +---
 include/linux/dax.h | 10 ++++++++++
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 4e3e5a283a91..84803c835650 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -369,7 +369,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
+		WARN_ON_ONCE(trunc && !dax_page_unused(page));
 		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
 		page->mapping = NULL;
 		page->index = 0;
@@ -383,7 +383,7 @@ static struct page *dax_busy_page(void *entry)
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (page_ref_count(page) > 1)
+		if (!dax_page_unused(page))
 			return page;
 	}
 	return NULL;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 0f06305167d5..068e8f78ec02 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3913,10 +3913,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(inode));
+		error = dax_wait_page(inode, page, ext4_wait_dax_page);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 281d79f8b3d3..f6d2a36e56e2 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -676,9 +676,7 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, fuse_wait_dax_page(inode));
+	return dax_wait_page(inode, page, fuse_wait_dax_page);
 }
 
 /* dmap_end == 0 leads to unmapping of whole file */
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 7aa943edfc02..fb13b12fd032 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -860,9 +860,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page(inode, page, xfs_wait_dax_page);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 2619d94c308d..c9c27fbf0b98 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -216,6 +216,16 @@ static inline bool dax_mapping(struct address_space *mapping)
 	return mapping->host && IS_DAX(mapping->host);
 }
 
+static inline bool dax_page_unused(struct page *page)
+{
+	return page_ref_count(page) == 1;
+}
+
+#define dax_wait_page(_inode, _page, _wait_cb)				\
+	___wait_var_event(&(_page)->_refcount,				\
+		dax_page_unused(_page),				\
+		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode))
+
 #ifdef CONFIG_DEV_DAX_HMEM_DEVICES
 void hmem_register_device(int target_nid, struct resource *r);
 #else
-- 
2.32.0

