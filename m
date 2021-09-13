Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CC5409898
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6E26E1CF;
	Mon, 13 Sep 2021 16:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338DF6E1C0;
 Mon, 13 Sep 2021 16:16:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFHe7zu4BhD/jKo6qkecbh3vufwvPPv1Yw0Gc90qQQnO/HIJwk+CElO3H9Q/Lhdx0S5P4cpkrVCdBty/SUPKAcfCuN6+7Hj5sMfK0xtDpVOYXdAZjFMcadx/0elh+Gd3qPsWUXS5j1itbDTeSQITmsS05ZzqUj4M1XvRGfIjRCCILhf/bg0Tr1fVa/KmRTmfXnuSi/FmZTEb5y8p4x6uG+GU9UrdkTXUwE289oILO/QYN85uPzO/YOvzDT3PNhS/PGVkWX1BNp6YG3iG0x1z2R+LziOVwJdw5hHeiLeZTx37Lf9krqnpb1xF02CKgGQblOa7AgxW8Fx0jqEQWwMMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=prqqgRWlNmUY+FCzPMwMlLKkTVbC2ZOWpWdIq8n/6hw=;
 b=LdQCcTq3oDTFTCvSTCtAObvQ6LTJgK31U+DPEUD8RTS06aneh61EJsPYGpR/1WAx/AXvbA4U2PFnWz/+CQ++LOXBFdg4oY76aYvlCbxt8v9ilmjAfmrS0tKlP9wngz61pny1IWKuufVOmVQLZzt1Kbrn1qa2u3ObN73MbTbpE7USiUwdBJ0LVBeU9WKQosulTZw3mHigbF/XN3APOZa0j3V8EI/eUjkajdX67N5/ajlaon7xQOJFYTL739Zn6zZDtecaOKdbgIjwBCFLxhnyKgnJT+2MJT6+5f3m+AUMvWR4i1vv/y2u3bBkjGTY26Aa7PtaeffOrRzxrXyTmtzsgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prqqgRWlNmUY+FCzPMwMlLKkTVbC2ZOWpWdIq8n/6hw=;
 b=L0/JjL2qdYNF8let9rNeEhvsCBy92JwiUd9lAWJVllBuooO74VT3GsLTk2zDtT4mcAAJo7GJBIWAZyP2f+hGeI3yeoQQPzb6771FU2VMf7j+QMEXyJEX7D07qKG5McQIGjAXGFgCZLO7EzsyNTemdEhIFaKNpD4ce/IgnoRqcGQ=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 16:16:17 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:17 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 01/12] ext4/xfs: add page refcount helper
Date: Mon, 13 Sep 2021 11:15:53 -0500
Message-Id: <20210913161604.31981-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69264dcb-8374-4f31-4981-08d976d1d082
X-MS-TrafficTypeDiagnostic: SN6PR12MB2767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2767FE7DEEC71FB88EB1D003FDD99@SN6PR12MB2767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jIxnHDwg2MuCUWzYHPHdrApjYVVLGDwgqMB1IfvXS9XDhXOgeOmOyV9Xhf5cZx5iFV8P7Zo6gScfeXPahYjVwNRLI1pNq1uK5UEsp6gvNh8ZgjwLOTBVoPyw3kf+K1hVHWfOje5fYmTeFmCaVuTxOCkGUGwj3FBi0KLOyikvJDcBYV6kIw29cMmeqOjD28MtyL8I7L6FgAEWvgqVQWjCEGKTkPkgrgbaBO813OSzZkVhHVClzrvU1EIyMqAqIqRBBVlCQJI3jMSOGnVJTNfkVFn35RpLACvGYnhkm5IieCYaw9PVz5tH0n7/P+5GB8UJNkrU0giRS18UEDNek/j69GsqTz3C4F6FkpH6HP53/ZFC8tD5XucaDcOXkNA3XvE1YXIQt67zylNVi8EABQyz/hpq+PuxmoBLrF4Qw9hIggo2ObPilJrpld6b8Ve87YUMYp90aPCN14N9sOqF68Yow9+98soeJFt5sZL7FtaUojvxKcSwjqbt3c01al3/LF865npLSDXCajhpMLqvU1pAHVGsLDUcnbE9708RtU5IXZTX6fZmcgErPOzuXgK1iWDBTlVwa5Azu2Gu6IFJI1CyFQzNUSS+Ik6BZEFT7R/j4xovLiF6+RiilI/mj850nblbr+L5WR9QpPjBxkEQ88j9v4LlPpXRbLJScZrejdHVgkxIq85T18fd8rDUCm5MbNi1piOKOhJl6sG/EEj8eRVGZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(1076003)(7416002)(86362001)(66946007)(44832011)(478600001)(2616005)(6666004)(6486002)(52116002)(7696005)(956004)(5660300002)(316002)(83380400001)(4326008)(38350700002)(38100700002)(8676002)(66556008)(66476007)(2906002)(186003)(26005)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fTi+aXQfAkcNxYktuyQ2DrVcCyy2f0vXFUXYE4jlJ2VfAkodrq3cCkUN8B6Q?=
 =?us-ascii?Q?Jxsa32p8xbivmwbDPTlvuCyN8SZmptcJt3K+VzPUNPW7brjVs3yT43lopiY0?=
 =?us-ascii?Q?dUNiSggY77bmtmfTRF0tC9IYFXrrPWrUqvOP8/PVgplEmFdTOcqX1TW8Y6Jx?=
 =?us-ascii?Q?DkHvxLmAhG/INzT391i0/xvDb3Be9mXXHLSuM3Uofn1I47T1VBgA7UL55ktZ?=
 =?us-ascii?Q?ZbDgT0txpsZTly7Jr3Mg15AbhvtpDP+u4Q882TbC0bKDdOa0K8uDBj5j37Sw?=
 =?us-ascii?Q?xfVU2AGb9SXlzhTsRdfRmH8Wp5+mXGwEYVw1iyyejxk+idkn44cRw7kW0WqP?=
 =?us-ascii?Q?DaeFiiTmEg2TeY5oRDO3I+AIr5/Ej/LanAZ8jCSoCyEaXDI6XAyMWXXdwAea?=
 =?us-ascii?Q?OBaM6L1VRdzt9xV/dyxNdBfiPNBms3p6Uqne6SRE39HTqIxEWFBSEko33/4d?=
 =?us-ascii?Q?OjQJsRT/gLsQFHHWuGvfthhzh7jBJ0pztrRVPsOSFEscCkSug/jVl3iutB0K?=
 =?us-ascii?Q?eBssKC1LGbC+VFGfcw+IsEbdxyOSnecwihlTqk5LfsydanyRnxsYNXjSoSr5?=
 =?us-ascii?Q?ViUkt8ky3n3pDqy4kkh0smxAZxW7rs9RFhAkpoRinWTkQyLtpOMPLc5ftqcL?=
 =?us-ascii?Q?0HrLJTjEKQUXbPPy3ddVPn574Z2owJen2zSTZn8blcSTyDuugiZOggH+BvuN?=
 =?us-ascii?Q?zr4L21pvGN7rmFS8d0B7SCWxUfQ7to8gGL735uanOvCxZTS7IyRnHIxgV04k?=
 =?us-ascii?Q?Htx9+hTx5sd9Eo71zASUDSbdzUv6fSvQZWnS2sj7HLgBH8yFZNquyO6JMbkY?=
 =?us-ascii?Q?A452oQFvcu1bQGBctbmz1i7gASNCvOSyYZYU79OHhy2afvTJA0dBAOOh2+4w?=
 =?us-ascii?Q?dN/igVARmgu72b3np/03NdiNj0Q9lNpHoV47GOSqtY85Bcali+xpkAUPrW1u?=
 =?us-ascii?Q?DINVjZkNlTxOyWLI6+1sR+SJlWxww1iRaYkkad9ZH0KawIXgGxCVycKj4BY2?=
 =?us-ascii?Q?6UIukx6xVGVqzYOMpPf7G7UqaLLm/v7csde+Bi/r/QE7X6zlgM8q5pneU3BG?=
 =?us-ascii?Q?jlxrYlxnJffVVMKnhNDRq8R+/YuYmR83oQc6c9AvvKFrCMznwYaYxkn+FKjO?=
 =?us-ascii?Q?1oeLn3n80zoDrnZn5sdIOEdTR9HAA4LCjQv7JSGJK3aHdO3X9rrxuXM3u0GB?=
 =?us-ascii?Q?jJJdNcdyJdHnArzHOjGz0kWXP2YtdqnbNAejlcnccrkriDUKcJ2dSntlBkB1?=
 =?us-ascii?Q?Di/o0ibENDUf4jklWoz0z4fxpNdQQPTCp96tHA/uKa5vwZV9838o1raYm2Pf?=
 =?us-ascii?Q?otADeOs+ioIV5eywOa7meGAf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69264dcb-8374-4f31-4981-08d976d1d082
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:17.0148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IljKvBIXiJKxTsL1jTdiC/8mHQbn+ye/zHTMbD6+BdY4Qez1d1WzHgV5uB2zFlTzhB+/cH/eTP1DtLT+j6/AEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2767
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

