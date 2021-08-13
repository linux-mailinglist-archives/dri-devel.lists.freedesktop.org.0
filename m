Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA873EB01C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7984E6E4EA;
	Fri, 13 Aug 2021 06:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBD46E4D0;
 Fri, 13 Aug 2021 06:32:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxH5TX/1eTy8YHPLWWX4XHoJ2TbqqKJflU9BDyjaLBFn1w1NP0wBvEWWOLJGF0E8J7Kdal8LB8lyKfgON1c+/V+wEOsHcdaAj84hJtYX6SYio6j09YaoHqGZqq8uqFxe9FdOBiV+Lbpo3c5EZNOzofdI22o61/nwK4YLRXfYV5jRSMZnU4kgQpFkCU46GMaA8UpyjAB7XnxaL2DM6P19X+cFImAFhhuYzScSZgb3ycEOjRZtRudOZB9TdmkTgIK9drH3schV14ujSPxbEZ7rD/HQmtSFPhrM2+JOWRZ6TiU6LaDtHQVGFbZHh/+ltXmxsJGqz79ttRXeNgu0y/KaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez6ZO5fI8nE9uKbR8Crs9JJJ7TUbD/CWkAtdWfvnJD4=;
 b=jb2UkvMRL4yVBBIk07eBhgEpJKczbOQQN66Vi27Qf+/+FGFswvCmOT4buq+ThNscvM+zKoLW0ZeDgrISiNBHR/LqUqcw30VNMsqR7+YmjEjxt0W82ckWac91OAUru5Ro6GZUXe59uSs2uRpA7GJZFuz/8/xDyD5Uzom1sRffF0EzViogFTNG+Y/vkqbM93vt0XvY9IutHa7o8SPwru8AoFchRxo0nXu/E5ojWf5YKVcni67AaL0uFYQhF4Cxp9KTvBssbvqPKL6gi/sdmcMrRu6bn1C2TWwRv6xgIogu8YiHt5la6OoUpsALQpdj19wl3NosGt20yGJ/aL3YEs945Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez6ZO5fI8nE9uKbR8Crs9JJJ7TUbD/CWkAtdWfvnJD4=;
 b=eCK2x5Tvz+C3R4XxI2f8U/HfZQz70/rFgfT67ZuEFrRwqBcrSbFG9FQNTUQj5OggiORmDkymckNKvmGuTtzFso60BgqgKiihbGRM4V/fy687iwQFQQSDZY7+KQwQK7Y0xmK+57j0BABvlnPA+fz0nDcVK/fawHVCu55rkAKZ8so=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 06:32:03 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:03 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 01/13] ext4/xfs: add page refcount helper
Date: Fri, 13 Aug 2021 01:31:38 -0500
Message-Id: <20210813063150.2938-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813063150.2938-1-alex.sierra@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2440cabb-9e14-4f75-e113-08d95e24103e
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2718999F70026923BFF7125FFDFA9@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3572PTgkn1O6E0AgguTQ9GEZFBTNYEyRI8U2hXHIgxWc9OxYPnVPbY6u5ZfBj/2L2sWZMHkejKsfY0R6oZsCl8aI6wcYC/YwoFGPg0b+Vc9Y7eEgNzQg49gidAIU+qEc/4NNmX7EEmDerBD51CrYBD+LSCewW0BN6YBZVJmirhxuSmdkGr8qKyw1LxMoa4IGV8hfXgdz+uNXt2IuwKhxflSiCPX6KNQr7GGTBtiAaXCpwSVPNbsM7V/5TneOtD602y25lzl9QDIRXAff5A3eAPUBToFNIbhvJ2yogoCcBxxfypQBGZO+46v7yn9VK/lDtF4z6zMrZfGqKM5BA3oIvtfOs8yU1wBjv7pXt3XlzYZGqioiQdP8hEMl88SID4alj04to9/UJQG7jsRV1Lp+Aj846rIa82C5nI8t53uufUXlIxgsTT7t8EwubhUKhwacqkbLZCt+ztuUZgplgRacA8tguUyiBQl8RLbVm6JO0ONN4PVfSxa/IPg3hfoZMAHx4TTjk0F6aoZEOR0RmWsKWqMXbBEhP5xG1XPFlR0Z6EDHSk4YIsZiT/jELIbuwTLYSrmzPgLc06edlwMn2ixwWFg6LYS/E5asbLjQWzbIcYxCdhJJHGNcvqYXugE1oEK/DSTcmHqORyAUvd57EOdjcP4q1kE4Wf6eTo04uWh1gWKIg44XSg97IMeYCiVA6IW8nZo0ivUyTRLKxeZ/AqoQLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(956004)(44832011)(2616005)(6486002)(4326008)(86362001)(1076003)(5660300002)(478600001)(8676002)(38100700002)(8936002)(316002)(38350700002)(7416002)(2906002)(66946007)(6666004)(36756003)(66476007)(186003)(26005)(7696005)(52116002)(66556008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/jo+VEa6DRhQpR347EP8hc7okWd1QKF6CDBJITTZQFWKnkBe83RmWu05NJ4U?=
 =?us-ascii?Q?jFw2aawuo8WS3VbmVtiuABz6PpAbjXaU+KGKluV5UYu4Jnx0OXCNjr0vBY5R?=
 =?us-ascii?Q?ZrVrp+qZ+XwhJBFd/djYjc1aBCt1ZI16Dpq0zZkXRJDXRrKz23A42QIzR5MO?=
 =?us-ascii?Q?vbTe38zOIZpJUEWJI0jGFKAFqoY5MTWEiM28Ljzu/MLwTgX+6SnW3BwVfJ6r?=
 =?us-ascii?Q?FhNyUJNM6hOtWREh8hwXBcUu557o+w+TbzNClJIjTUkh9gAnG0Ooqngr8DFH?=
 =?us-ascii?Q?krmkGfnsvMGd/URIEh3J8+JpeAvUDqBpU73pegBxYUCx5A7oyEyrtKBZL+OT?=
 =?us-ascii?Q?gVkzsajBjkUKPE9X1ELKVV/gZ3LZLZ02ML82bHAqfSe/GEZn49zye/YfZymJ?=
 =?us-ascii?Q?7GPQNeI3FshX6iECrtDPPC+Y7k2WBwHrKy48/1xG4Wm4wY7AY+tnqS5Ug/Dm?=
 =?us-ascii?Q?7nKwEi6yMQBJzlyWKcyvpodoiruoTUkhlLNA87lmtFhjESZ3ARQoQ9gXdh6G?=
 =?us-ascii?Q?Fl3amGOwPRIN0LldynJBcWD7mOtO+H95MNhAX7KwnOnudLN76RYZK9BQPBff?=
 =?us-ascii?Q?MdQqLb0+kND5pwtP5Df98vjVrGMXZAV+7ifxZfK6wU7IKH2uCiBEhHifcRxW?=
 =?us-ascii?Q?fOYb3GgIaKP5g7RETUcYchzDrED12W/WihrGCcFt/fkcuCrsknZDdTfnzvba?=
 =?us-ascii?Q?KArM3BkFiTcLvx9BX5O1+sjUij4oKihTEwngyFc3wiP4KesfUdi9U3j5HWTi?=
 =?us-ascii?Q?6GHuHtxZU65qqFDxaM1bBxfjWLVvflkkB3J690anMxRreND3AcgqV7sN2Tes?=
 =?us-ascii?Q?G+FCJfLZMFNhjgUBCK85jq2VSvJrx0ex5LfeDrLckujqN85piV2i7ZBknDFK?=
 =?us-ascii?Q?PkTmO8N/qjfgXcsgh6ZFpfBKrZC/DKStsbwwFnefq/7zL6ytEsJr/ecHb+xB?=
 =?us-ascii?Q?LMW6LWrWhKuh71s3/IXeantZU5/yzHtmBxhnbKnkj9HIQfxmSrTgmdeIs0Ba?=
 =?us-ascii?Q?F9b8TVe0SV/UoW5mMkdkzACpnYfz5SwAX+tSFjKZumoUTQmJqdZ1e53JQYDr?=
 =?us-ascii?Q?2tbH9YxY7/HvAnHDDzRoRheLCTzVbb0wqcj4hEVVjgrvqM6z9i2TOTnx5eAV?=
 =?us-ascii?Q?J2E0T7LFvsHvIYoolxzZQ17erUAQGobxZTpFf+D5f6lzgmr+5RdoUrJZRmnl?=
 =?us-ascii?Q?530ghVBIBm6LK0IOZFwIz2ZLjutJnunUu33s7oCPN73CK4BZpycBfe2mgONR?=
 =?us-ascii?Q?zAGNjp8SSGgRjlibX1Td+0s4MMy+JeERpaA03fafSOQMeS9gzNoAdjzpXRZ4?=
 =?us-ascii?Q?r2YBSDHI2pu2mGA6SORWrxjX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2440cabb-9e14-4f75-e113-08d95e24103e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:03.5424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4i9tATylxXuHD/6YQ0XzyN0S1HsqNvRZV0KANZSv77KU7nFJeMBKcFCVEoLA7aZHTcwN1DlENW/FoQrCY2ZrJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
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

