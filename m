Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A742DE6D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293AA6E193;
	Thu, 14 Oct 2021 15:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE6E6E182;
 Thu, 14 Oct 2021 15:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gel4gWG9D6b5qmwCdzKccv2oGLIwfpVljMjnd0rW1pUvQq96UhSrdNiw5JSwTYTBA2qlaeNFLsDpnO3kuljQa8AR2wcPd4bvubJK5+HnyTp5gyd428CL6CUvJwCeEtKo5ScBI/TFwVGbdArVHOE0fhmpJVPYpF4u8Ioap8J7aj5dmvZQQEWDyBfboG7V22w67zPFMKo3+Z8Bon23BZYrFPuBiL4hiI095rxdzNkFjrEvvA9w+E0SR1PIvHdbvqD5lQaKocLu2EQY+uhgOktRW+Z6c8TrGDh9X4QaiNiNnCN7ROSN+mSBnWKXpu00DsO4gplKP5uSFjl1CAWvv3tnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prqqgRWlNmUY+FCzPMwMlLKkTVbC2ZOWpWdIq8n/6hw=;
 b=BUgxhNKwONLvTINwPDgk3VUJFKUogrrnsjf37OlkozQdhRzhM7IVLtCd+5Xn1hZun5fOwA9m+RHZKdaNmIj/AerGy6glMotzJcSn5JIj9m1cChEoLcVTwDHyCtHQvvGPbDXMEg4Qn/ko8h+Vt2oqOyGS6l5vl/jXuOgkXEJK/VSQoeqWbPMw8dLcFi4utAvtowXdejEhX2FZ6rTImdbQIei8p7/TgIV/0eZZWd1w78MhGTTEc45poNZpRcrXtUnTmTQ3bagC2OLT7uIMij+EcxVWLnhP9PW99d58tFaxPXbzOaowlpdT4jSVXqvsahPJ/Y4qASwrSgq3YNsbKq59Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prqqgRWlNmUY+FCzPMwMlLKkTVbC2ZOWpWdIq8n/6hw=;
 b=wbIAmdpSUioMQxaX3O8nrWOeU/whLhxRGMk7Tiqt3PKCwRpH6RDsueobt3grw5uS0yg0P4qntV+KwpV8lTwtI869ZWBgXvPwtJYrtTcrVO7do8K5Me6g2HArHxafnIVpnPEgWvoAOr9CKmhq7+d1tS7vIiDFWqALpuzDWMne13Q=
Received: from CO2PR04CA0090.namprd04.prod.outlook.com (2603:10b6:104:6::16)
 by DM5PR12MB1420.namprd12.prod.outlook.com (2603:10b6:3:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Thu, 14 Oct
 2021 15:39:41 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::ed) by CO2PR04CA0090.outlook.office365.com
 (2603:10b6:104:6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 15:39:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 15:39:41 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 14 Oct
 2021 10:39:39 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>,
 <willy@infradead.org>
Subject: [PATCH v1 1/2] ext4/xfs: add page refcount helper
Date: Thu, 14 Oct 2021 10:39:27 -0500
Message-ID: <20211014153928.16805-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014153928.16805-1-alex.sierra@amd.com>
References: <20211014153928.16805-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a75f7739-a1aa-49a7-68d0-08d98f28d6e9
X-MS-TrafficTypeDiagnostic: DM5PR12MB1420:
X-Microsoft-Antispam-PRVS: <DM5PR12MB142058475F17D5232B75DB66FDB89@DM5PR12MB1420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OMY9qBYuTUMbWPDtRB3m20VNerWmm9jew5Cyw/ubnMrbQIKxWWyg2qruVgnAY8yDec8JP27nLPyMmTvVlTK+aJFzcnSSGN5caAlR4BnXBXCJs4Gp97uI+9wc4P8aZ6PTu6bDv+i1AWq9KNtTg05zES/cOlIDbJfc9AHSEnRpExsqrPSo2JKJp4vAGThRef1ELxAH+ApIyegNtppK5dwXtdP6e1S9u2wzj1i86nB0nDIE8emUDpaq2E5h7GOB+QzsREtKIGr2MaJuxL5cOOqiZd5IMBzmF8M+ScitaqwvSIcnz/XkBqI1hYK1uvqcfZWAm2xMQFMthGDMZpi31llJx8oMEafRcAtlEFhv9vgtuNSg4vnSowoLXg4vG2r8f7axLiqE7C3vxlZ0VadQa938JPFXZddljSgZz9deln7vgfzY1v/2t1IwcGrsIK+bXt0GFffAGv8eC0unNMN5PbtgTiuGozQxqiPvYkbbRQf8oN0BZqCTc+Ot31UbGV+CEb2becp4IvDlDCqL4dl8ypMBjMxeH6c6Oe6tSeO6lLSQ3hXW/XuptgCBzE24rkVigj+tBwoyMlmT327vy+ACMrKzeGY+8aeaBo0GjGNSNllTekjEFYP2EKDkQxSwL+c9ZGBXKLDvPxlu0kXL7Wc8bmpNFP+0X9HmCY+GradpSmsQ8y+qybiqup1aWRGMFDNLTP+qCq7OA9r4Ij0RK4+K2QLm5ikn8wdk0+eavUj3end3Hrc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(110136005)(36860700001)(508600001)(8936002)(70206006)(70586007)(8676002)(6666004)(54906003)(81166007)(356005)(1076003)(86362001)(316002)(83380400001)(36756003)(5660300002)(26005)(16526019)(186003)(4326008)(82310400003)(2906002)(336012)(7416002)(426003)(2616005)(47076005)(7696005)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 15:39:41.5111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75f7739-a1aa-49a7-68d0-08d98f28d6e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1420
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
index 62352cbcf0f4..c387d09e3e5a 100644
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
index fe6045a46599..05ffe6875cb1 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3971,10 +3971,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(ei));
+		error = dax_wait_page(ei, page, ext4_wait_dax_page);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index ff99ab2a3c43..2b1f190ba78a 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -677,9 +677,7 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, fuse_wait_dax_page(inode));
+	return dax_wait_page(inode, page, fuse_wait_dax_page);
 }
 
 /* dmap_end == 0 leads to unmapping of whole file */
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 396ef36dcd0a..182057281086 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -840,9 +840,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page(inode, page, xfs_wait_dax_page);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index b52f084aa643..8b5da1d60dbc 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *mapping)
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

