Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDE63F6E04
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46876E122;
	Wed, 25 Aug 2021 04:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C4D6E113;
 Wed, 25 Aug 2021 04:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXrfV66KJq8DhU3zYbsdN7/FpcMye13axAap6z47/+IgK9G7jjlyLlGo+AQ7RSrH6xgJepdsbdezsv/Z5/CAbMHoQeK8T7U/OQRg7KaYFhwcPyVdaQTdW9MMHUaS0TVB3Fo1NOil4H7AeyldjmwWstAPrLOh4vvVOiBJcVe2QAN+TzxRquUsQLRvSkF4pCEUUljFORA/cBGhItH4JlJiNbFkARY1BQMG/IjG1+/Px7wh6orh24DlxqyW1rICt51ejM3fQfZb7mZG1svKha+Nac5q+RR2QH/bOGKA+Kw99KcVBULLlmZ9bNry+M6lAs3HdlJwAgohrkWA2Ox5Lo1ntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEZda3N0gN3l94uCMFd4GDGKH3IDMGBhCvf/mWWcE6w=;
 b=Ja/ZDYA8QkE2QSJLUYssOeAX1Paog6/r3NiT8o93N1F8mGmBYju9Rs8M9WfZQfJZjrNYSE5UCeM8Np1yp/3kU9MJHw/VpIreekJ2L6kKlN5UHqEBrzqSKuUX7RIaLGF+L8DbpeIkvJqdngESHDdozC2dPQp2l6yEB6pwpT+T5Rxp9gwEXtBaWNORaJuUnS041E9kAJ0Ie90UkQsmfyfYuTEaCZIaH6WjmrgQWMx/PPEu5U1DO0ZKB5O+Jf+S6lyZI1zNNYwQ7RAJVhIuyzK0JWk7hvqAeoHAZvYn9ah+TeVTXIY5+po/VwzBtlHPZCWgFNKVLknFjCP4Aj+tZOTkug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEZda3N0gN3l94uCMFd4GDGKH3IDMGBhCvf/mWWcE6w=;
 b=olhA0fC0Z90j3XpSV3yzP0lVoR0w0ixpyEXdiV6zNTf4E78oQFd8Nt7QDMCFcjA3KYCHwg0cN36kr8/b0TK8fJljNQJq3Lw3YYfJFYJe5M7FgajjU9tG9yaKyX4Wvayv0HSZ8+R9nuJZgRRdQ/mMwrwhMr3XdhWH6jA1g/1pIjQ=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 03:48:40 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:40 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 01/14] ext4/xfs: add page refcount helper
Date: Tue, 24 Aug 2021 22:48:15 -0500
Message-Id: <20210825034828.12927-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 580deff8-bd94-4055-3207-08d9677b3a02
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4511E2E1783D75EA5006AF82FDC69@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6JQ3OkvkN5ttynpL/dLf3nB1tfSJwIJWvBL4vEijhy1WJA1JtIKdyc0El6V7uDQdG1Dbwyari2S9/QURpdU73rkl7BngIE/IsVzHCaB2ba9v9cdjQITSU6oF26ecZA+cQFv6yIcHxED3fb1C+cm6s5yf6Mmh5knKzEPeiLIT6iUTJBaewZC9XyZQ9bkE+APzTcEab7vjrCywGFVTV7KhT2u6hKxgXpWBvY/EsSsLzzKn0Sbs1Ocr22TMvrghDbfMuvsLe898TdDqJOmSLU8Wqt4XLwNF403UYCVjwTh7i2u0o/8XnRyqiFmcV/H8h/ndFJ7L8158MMGEvqmVwsp6jVPogJP5VXy94D7EyCFoCHg/PZWG9MxAs4Y660XP9lgMT8PcCFk0KL15QscMQpiUxhyRdNtmL2MRyWkCoY5r2NSChZOzxCa3LwxzE2EyoA8jlqfDPp4k8E5dKuy2xRgnfZDMvlxRbsRChrmkor46g3DwLOCAMSpNIPcc8y9cJoPHnQJ5v8/rTkKGQN9HjitkAaQMytp+4eqytAaVacuUpms5jAvC6XdR8lhDU9S1uClRw2/ixOCQslKj3F1qZuUbII72EeytpKOBcQmmVPctzXxwIgGuW0IGK4W0IUu9+AMkZfPHi8yZaAWCKlYIOr9sM6q+laZifHUv24WeJ1wXK86Z/Xs2Q21IhFeS51HQEDiBXqRWTdbh9L642BrFUzVf7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(316002)(478600001)(186003)(1076003)(83380400001)(8936002)(38100700002)(7696005)(66556008)(8676002)(66476007)(66946007)(6666004)(956004)(36756003)(52116002)(2616005)(4326008)(44832011)(7416002)(2906002)(6486002)(5660300002)(38350700002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xSB3rLv9V0FjYEooDrWLrCd9eSMnHu+6o7T0g3w34payI9Hv1dz93XcIIopA?=
 =?us-ascii?Q?ncV24rsr5QSjov/fqS6N8AMekXxEhSQOIzOBDppSGkZ3sdDxSr9oVRIQukTL?=
 =?us-ascii?Q?AzTdE0ssl5woejI8vllbBJmYMuAltD+rJISgRNRBpV0hzvg/7HXChGli7cGB?=
 =?us-ascii?Q?LBchXmmozDv9/A0swoTgkSxxINYXTwvGx7OnjhkJXmcvLgWtV5WovdjEYLnl?=
 =?us-ascii?Q?cRype+PCfd/f+oO/T4PM6PFlN5wGNYaBOoX+26cHThMhiVkY9GySFItVMUeI?=
 =?us-ascii?Q?Z8T+kdxzbey7xGer1JmnBVWsWC0oiA1hldCkl3h3IcRpe8ma0BYAt8/y6dr3?=
 =?us-ascii?Q?27ydlvPbGbT5VfXEZ43aHBQTOAPl2OTJeTt9/Dj8vUjTZGXqTc169pCG04K0?=
 =?us-ascii?Q?8cBf07Xxl9Gd62Z7mu18j8HFEnIuGXDb0ov5DXUKEV81QEwYD/leGv963Mfk?=
 =?us-ascii?Q?U6mUPaMPj4bJCWeWJXACK93gWuiCizp55sjyFmLW6NAN3O1D4pQ+ApZaOixc?=
 =?us-ascii?Q?rlQR9ooEcYcFUVKc2XSitN0RMKF8QhPuVUgtRGapCwxXdr3fXMqjMe6qpY/O?=
 =?us-ascii?Q?ijqH6vIVQibKMS6odWxUBrxwo5PBrfSBaGV9+yJY7Nt3Gk2AMHALWB+Lsf3Z?=
 =?us-ascii?Q?e2kAcWjmidyqBcq4UEs789+y6YNW8sROho1O4CnzjhJfUnJA6ZNX8pWMENQd?=
 =?us-ascii?Q?Vs6iEWpZWP2fmPOHwbhh2wnldwJK7Hy1ZVbANK0ow2SaWD0x/LGMTSh/DpBU?=
 =?us-ascii?Q?buHrBvZ78Ce3z9IK/t0kk45qvQNijoaTNSyzYVZWcZRpTc/k9YBcgv74FvkS?=
 =?us-ascii?Q?EmXmo0iKbZxYZ6IXC3mgKIvc34xvCb4QckVhFbcTuqZ2IhpHWRRvYU9t2TRz?=
 =?us-ascii?Q?S/ThlD8u9G/nE2x0bQViIgBpYc7MMTTqHDckoAPYyzZQe0qlKrTQHEVVwHVH?=
 =?us-ascii?Q?VvkhMk0dNxTmiucF063ZYJbjtTt1jx0qsd2v1d9VHNS1Hu0S+orcY7VuAXJv?=
 =?us-ascii?Q?BIcjUgc883csH1OW4GE8FA+YHYWoscZkS1KtoVAWsn8aW6vMyTXgHEdsbQbg?=
 =?us-ascii?Q?j9GrkvatCstD61X3H+nK8g1hamO7VQNYPNjzJSqsciHA9rvICRdDB9lLzqyX?=
 =?us-ascii?Q?KpQSzQTxlUASJ5tXG5PDNkIxav/oCaiCq/w3BGc6+0o5EEA8vFzFHYTLW63W?=
 =?us-ascii?Q?nmAgvKb37/zEr2xFZvJo17RrsGITVoPjXga1VEVk8xw/VHs2xZLoSp3vqXko?=
 =?us-ascii?Q?rpK98pURq0d3Vk8uQUMq46/IBEankmlX85t9/iK5CE+xCIduSAy90d4ky8NT?=
 =?us-ascii?Q?y3zEGfVfaaCrj6s49SKH4xr6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 580deff8-bd94-4055-3207-08d9677b3a02
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:40.3149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6RlHS+Wlx5EiwUMDxCbbiCDHOGud3g+1NOlLASg0UFhhxw0jXym9/GECkmblZkMpk0H8zldczHFRwGAi6nPNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
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

