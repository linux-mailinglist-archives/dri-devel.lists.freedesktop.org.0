Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5800D3E9E78
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C516E283;
	Thu, 12 Aug 2021 06:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BD26E25A;
 Thu, 12 Aug 2021 06:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ct9i5nPt2HO7yJ2P5oKc0p8d8JTky2VDCRNJ6LLfnPzqmrgvnJemVQELSGqHc4Hv4pA31Dn4qLQefJfqKETcrLPybNPoPtPV0OgDrBA4aeFyyCMvWaDZXcv+agk5zpA/ERHIwcRJDvcs6hKN0RaIRvzIjj3q0tD39RLEVFqZ2tTr8w9FkvinwHlkcelN/yUnl4m4LoLUNAh0eM+VjQ+9+NvRHKi+0hnv/ZyvDPaReNFA6u6/waG43BD4TVdTqZvhXN+ijSfxFAcciM77IOmD94KXjryQZ8KtOko23HDUJRSsFgL3own39gG4aEOCxWk7PT8sMt3piBT1DXYUcUHYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jjxGrDzxeB0/vA7uRRDTZT4RBZZrOgQsqJSF7ty8p0=;
 b=W44iPe3aExlV1x2D/MQxC1wwDfGBpWYDccYI56Uf8vXHSZEqv9cpb5IKa3PHlpDhhS6w4uyhhvjFRMjUgV8rG+Qv+n0g927ISOsv9ewHlCoysB8kaGQejy67k9pwnjvZDynLBOsADTR78i1B88JXEkEEjxhVqz49QglnPpxD6lZJJqPIvR/GqB6PEKNRZPtWf/T/QKuPNxOCtdVEInSlTzfc512mD/uYj62+tr3h4BpowsDpufTgNmeJcASBy2ZLgy1aOYnF9ZzlqzqWlVyVRZp/al6G1Klo0lPDE4S1Chc+iayODgx6tGP9zbI291GJFCqgi5eMsKlTOIY3ZSLc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jjxGrDzxeB0/vA7uRRDTZT4RBZZrOgQsqJSF7ty8p0=;
 b=q+QkyQirsJTupcTo6lCZlvfLQgiiZ+F9V5+F0qZCAhKVDJ8LawbR+tpO6hWK1XKzyrzv18Is4zg301jLXEckj+niYN47nOpApvY4dgg6PR38Kk+W8fJA3zhf7Pky3evrQBvQU5ujWGcOg/OfKKIoY6COLFGKVJr4nfsVVEUPAP8=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Thu, 12 Aug
 2021 06:31:20 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:20 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 01/13] ext4/xfs: add page refcount helper
Date: Thu, 12 Aug 2021 01:30:48 -0500
Message-Id: <20210812063100.31997-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812063100.31997-1-alex.sierra@amd.com>
References: <20210812063100.31997-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0447ac68-8e62-4a7a-9ca5-08d95d5acbd4
X-MS-TrafficTypeDiagnostic: SA0PR12MB4574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB457454B252E5DD89E5DBF859FDF99@SA0PR12MB4574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HwamghBW56T79Hop0ga5I2v17J/iT3PP5SxbiyrA2DxlYLT8e1RSR5wjFazJ5pq7iouHulQtkFMHaPfikfm5MptFXyfj7NrMvIAFP9YZR00RZOQqaP04LYzCYVBE82UvNi2ia0KtySulU0vHjAxXdv1rzXY/5JuuTkRsG6F6HvIZp+zAfEQBkamfLH2COXLhkofvnoWLeOqs0XW5TkmFCUG0jEhLW/00TYRM1KS8VaHysuVO9pFcgTmlLLhDqUib8+eY/mQqDcCh4SmSC34FK0ZzDjruLKjh/bhGf777ImkTGrPct61O4ufqjxY1dVHsi6c5sLQwuj2VglhV8c5DZFwxw5BN/8IvAC4kMRGMASi8lr0Ssy8nuHqXW7jEPQh/6y054PBW+c7OFdLkmuNgKx8uCzsBUyedMNF+jnsEK6sFiEwrWaWEAaSChscI90NeLPwrG6tegQZXluzydptYWZctilSnoGbZ41Xrs1OLC9Lxnox2sxuAhkEiL1h/M78rau9naL+7yQW7+SCC4+8ZSqmiJzdFbjr6uoAdRxWOgi+uWcz8VPEJR/RTAdUqihjQ7vTDdJP/WgNSDbCVgaz7FxkaOFTLJFGBgBbuFoE9g7gkzKFqOSkE+QOQdUKmpSSLg5TgapPminxwiD0+Xzr6nFPWjcuTgxUk8XXr/8VrbIx5uBL5uZu3QdpvbcwhfLu1+gABICdUkGyA/l6pS1Lzpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(956004)(2616005)(6486002)(44832011)(8676002)(4326008)(52116002)(7416002)(38100700002)(316002)(38350700002)(26005)(1076003)(7696005)(36756003)(6666004)(8936002)(478600001)(66476007)(186003)(5660300002)(83380400001)(86362001)(2906002)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e8WV4AUKJS3YpyLy6So2/6PHJUkHX3+SbsYnmu2SiLqkVPrFYVV0yABRh5pi?=
 =?us-ascii?Q?6WxRJYS+qey4/qXi2t+rduK22tis23A9IvJ3M9YVhktKlgFWNphJAJOGhaya?=
 =?us-ascii?Q?l8HsSvZHYvZdPNVPlCWUTH6bhsqvwXDwUPcOxOQvGCK/umpjgS7tfuEc/t85?=
 =?us-ascii?Q?sTGaJO9iLVnU0TEvFSVNCmuYXQiOIuvc152zSFxYx0safCEU/eBkWU7b33+t?=
 =?us-ascii?Q?OeGgH3Kwbj6diqYBcoQbquUEvwjuw20qB1N4ILQWzVs8EI5ZMBiFPMD/ASro?=
 =?us-ascii?Q?+9zmsD65VIZUe0cmL6JvkkRh9v40VeskiHi71e1nYhLkYHJdX7eGtlqrMen1?=
 =?us-ascii?Q?cEduPiDAfFyDzNajM+PL2V90iVXGpA2YhqcsaiRUMcPzoH5c+GUJzjNae9Xh?=
 =?us-ascii?Q?hzBnWOShgsf7dGS8+mHzg29QjVd1MfwOdTOvKXQrgwSxUQIcutKOMHd+hE72?=
 =?us-ascii?Q?s1UynSObxmq2db7ESYQ6KSxwh7/GBsUBmW78nnBLq/ZG28Qzm7Oq8qTX6KCt?=
 =?us-ascii?Q?lZlgEuY1PidbvqZOQHy3iie+Io6pxwX9erHCdaWiNfeWpVLo1/+36kcZ/bP7?=
 =?us-ascii?Q?6lFPv0jXmJ80mVjdz81KpLJ+08Kvp06IgMFiGABxn9/o8lx3WKtPm1EuVaPY?=
 =?us-ascii?Q?WQMxP14eL1ydlRbI4ecGe/wsuXUFt5JLEe2tcqWvVRKIm4GlILTolHQcKjer?=
 =?us-ascii?Q?WL0GWJvpqaiyx8pnKTY+OQY6P80a6ROE7ZPdGKMUJH+TuPTdAiSPJZjGKEAP?=
 =?us-ascii?Q?/nTdgulpn+9aaHlGSjvJ0+8+9SVtHz1wP1XQ9eQDpP5/9cvVefODpC+JNeAl?=
 =?us-ascii?Q?f9g7mSXEvAh2coPeBD/zdS+iESPPMMjlTeN8h0HbFiHJ3ElcZJ5REnvADVcB?=
 =?us-ascii?Q?TNm0nCMbdemEuPu23OAB5UJ0GO2J0u1JFqixHZcJIwrCsYcXKyAzgxswicz0?=
 =?us-ascii?Q?wBwflMMyWlWe+S/yLr3PktbWHtcW8BvRjNl0EC7Gz4Nnkfkq7adUFdcIE4z2?=
 =?us-ascii?Q?aw46FKdUpiTeSbcuCTji+phNOMF+p2VqsQiF76HzHifTZeEKGiUcxa9bTI3e?=
 =?us-ascii?Q?6olnMIzQdipuMQenZvtYjR8WfxL7bBvlT47Z6anO7cXOi+/8DGIcpXsG+KZp?=
 =?us-ascii?Q?GRIkH0TF3eoKlBkPFRvEpzKkmzT3hnhC5dn8T6WQe36x9MpINA9uCFmoc8nI?=
 =?us-ascii?Q?Qqzsq+Z4CK4T/5UyWT/FWEtNdZeIL8Yy7IocQv5/S7xs8JgefxR6h+l6uvlS?=
 =?us-ascii?Q?JhMbiMi1daYsrIPNYBZaI0R18bi5V1YH8bDBWunqthoX2FvBS3O14CIQSao9?=
 =?us-ascii?Q?xuB3mz8Oi7Fkn38spD2JXhug?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0447ac68-8e62-4a7a-9ca5-08d95d5acbd4
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:20.0198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF4tRxURM5ZEN00+Ua/Zon6YiI1NiTXPArlMGkpTsnZvMUew3d6A+0DcURbeoQF+mA/upcnSDZJzS3D4MXPbaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
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

v3:
[AS]: rename dax_layout_is_idle_page func to dax_page_unused

v4:
[AS]: This ref count functionality was missing on fuse/dax.c.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 fs/dax.c            |  4 ++--
 fs/ext4/inode.c     |  5 +----
 fs/fuse/dax.c       |  4 +---
 fs/xfs/xfs_file.c   |  4 +---
 include/linux/dax.h | 10 ++++++++++
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 26d5dcd2d69e..4820bb511d68 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
+		WARN_ON_ONCE(trunc && !dax_page_unused(page));
 		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
 		page->mapping = NULL;
 		page->index = 0;
@@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (page_ref_count(page) > 1)
+		if (!dax_page_unused(page))
 			return page;
 	}
 	return NULL;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index c173c8405856..9ee00186412f 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3972,10 +3972,7 @@ int ext4_break_layouts(struct inode *inode)
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
index 5b0f93f73837..39565fe5f817 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -782,9 +782,7 @@ xfs_break_dax_layouts(
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

