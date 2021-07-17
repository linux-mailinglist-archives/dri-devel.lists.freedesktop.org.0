Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C2B3CC5C7
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274256EA9D;
	Sat, 17 Jul 2021 19:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2238D6EA9C;
 Sat, 17 Jul 2021 19:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jehlSSi5HRgBZMwqP/SPDwGlgwQzOGEkaR1RSbBf5X6Rr2Ff7NjS1E9yuCLdCAbU98DiCikU1r7pxtj8nNVY7j+QYejm9bcUljXSdQ0yciWW/doh7rOLmBVJcMfI+xvdPrq4ArPMMrDRuw1jm/+tSnaPxjZzZ3rovtyYrAoCpBjpUIw9hKjy8qAJOKNhPxo4/P3RkC8klcHBsVZ8zbDVT53gO7MOhZGMREppG4x0MEpUxz7OJNWr1wsJllKZlWCP++aDGGqw0H+xdpp3nS6UgJI6CkqyGpFdQTme0MT3Zp/ixsQKHUKe7a86mMgMNqUUrlzUSbzcp46XvAMq7HJa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jjxGrDzxeB0/vA7uRRDTZT4RBZZrOgQsqJSF7ty8p0=;
 b=BNgxBl16w3sjcc3IX9psWNN66Po27yOgxYEPjtsqpbQ4XTzgYhRThaRoL8Fs/1aApLxACPPs8KfuAiH//UJN5RRrYwUKg7wufz+2p2naoQ6gpHHOp3sXp2IgC34EcMEGObSIvIyjkXRL2JEbbuTM+aO6TOtsiszAKj/Lv7SoKea29r2wRFNGpoU5Xt9v9Ej5Gt3yxw0eXrmY1IPnfyDOw+DnijKc2naeo7dAwGHvlO9x48S1hQSwxxV6e7ChNa9cZGxNiQNHkv1GC1yoRT+WvbSrJ1fpNWs39VnvF6o9VjBjtfnYluUIxpOp+Xhb9ROVQ2wnumE7zvXwIgo+OUs+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jjxGrDzxeB0/vA7uRRDTZT4RBZZrOgQsqJSF7ty8p0=;
 b=YbSLqbZNCgCBkA/iBI8JCTbKZv/JbvuU5cXL+WyfocMy1dm/ObOiWFgULc1Ray5qRdGV60ArImL9aBsIPKsMgiITGSKdjvIC2lNQdPKxHiAIhikXvRHF10prWdD1peTbNWEgaxPOi1H+kp9xI5zbsYJxwfhcqtjKbtVtLqIbm4s=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2830.namprd12.prod.outlook.com (2603:10b6:805:e0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Sat, 17 Jul
 2021 19:21:54 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:53 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 01/13] ext4/xfs: add page refcount helper
Date: Sat, 17 Jul 2021 14:21:23 -0500
Message-Id: <20210717192135.9030-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717192135.9030-1-alex.sierra@amd.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0067.namprd02.prod.outlook.com
 (2603:10b6:803:20::29) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0201CA0067.namprd02.prod.outlook.com (2603:10b6:803:20::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Sat, 17 Jul 2021 19:21:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 178b7352-c9fd-4237-9d12-08d949581e62
X-MS-TrafficTypeDiagnostic: SN6PR12MB2830:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB28302BE7E1FE59AE1C62765AFD109@SN6PR12MB2830.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o4r2aZRHz7/9C5iiP7ece3I1c1njBDG7FmN+bCGd5E1wYTfj+9f4rdH1bbV+ulB+bzwGiW7yupymS6TZCbGotJ1Ss8DqUX/FfwmHosJXAHwWNWgpUJn8++gZ1F+5ltLTfWoyESKxJbg1+WDAlZobQpoh9oMSQFxbxrQMS2fSN4N01YP2wI4cl9042E5LtMIhvWTvyaXCShfC3f4TG0/DRra1KZ+9z13UodugVGMuYHsmFUABUbmcXZAa7WiqXa7wWUWD9DqaeoNqQbjCxcLcetLDFbJEz/zjhGeO3c2g0IDH7YLdLcrETWlSRX80vOQ/wI8cRETW0f4rCj8P4Ud845wkSNZvYR/9PnZdCZe67Q7fsvCT9znEcR8ev3Qyx+zbjKzFfmybuEGj2awBJpAzGEN2v4T9XvJ7DsNLtruPg43wM7Hs72Ak0YEqBKu390Dpc7ajgcO5oaVQGRwv3RTeRFF8lLgyZMO87XbiTOkUG6v3Kz4ZG8bEgJIqWmTskWho9CWUiT0Jse5vt8zJT77CRoUkc8uAbhYqZuTOsgaghPe3bk02UrDRreeIN2zWhFc8Fsp2PmhK1MO3Q1SUqE2myXL+GIEAXvX8DMU0TLSWbDHZPIxU3N2s9aDfM+pJkiGvJqiXWsz9NC8Rpi9CJmf/15EMnj+gAKDsGjUcJKHap0aed2iasyanUSzqfD8KCIQFrUfaGLJYeLFsFF6ETDehaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(83380400001)(186003)(2906002)(5660300002)(2616005)(66476007)(7696005)(38350700002)(52116002)(26005)(36756003)(66946007)(66556008)(8676002)(38100700002)(44832011)(86362001)(478600001)(4326008)(956004)(7416002)(6486002)(8936002)(6666004)(316002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lxI2UClI+kJiUqf6clIqeWixqIj697zgoy9o0TLM5o1c7o16OEJCxw3JnwCl?=
 =?us-ascii?Q?nB2uvmP9TrZAemQEVGPVZil/Vatf/sL6Z98pld8l25JRPNmG/Lp/UdpdBc92?=
 =?us-ascii?Q?f5/hR/gBHvY0XlaDHN+uP8DjuSflmZ9OUj0JXg1fOqQdqdxQkBXjsCEcqDnI?=
 =?us-ascii?Q?XCIUyxXvlXOyXg+fsEi9CqUp8yhnGvQL7buDTO9xe/W+NljmeDNSsycx0tKL?=
 =?us-ascii?Q?yqTCK5MqovXSVIfeZCPKjX4Bv1mpYM8HXQnntkjVS04QwkxaoXcEZbi/unTV?=
 =?us-ascii?Q?TMxRY+z73LL66RVjQdzYZbAOVkQa6DX3ByPO73e6/RH+5sQk5HSAZBkuHl3A?=
 =?us-ascii?Q?lLpHiaozHN1e8yMOyex2Ggs2Y6kbZmcinAEIBlTH7mzemzxa4sgsuch/S9LJ?=
 =?us-ascii?Q?96o0JFwjbHD26yD77RUfpv0AWkHjkQkKFqDQxs3OmwjLZgHmmPNtKm7BmHrq?=
 =?us-ascii?Q?WEXTymyuXTHnwbPyWCPhPVc+YPlOUxiCpOjkWHbwsPm3QkpagWqGQtoeYrn4?=
 =?us-ascii?Q?vGcAM62QQ2QGGsKW+U3IVbaUuNr5BCViqqTErNr/KqtpT2TKuuCISXAUVnYF?=
 =?us-ascii?Q?fjGjBbBj2DENnprrYOh7oPAQmGgHBbdd3FQcwaWVz1Z3UHAb60hXdR20z7K0?=
 =?us-ascii?Q?WJGzm3n0QkZw8HInQj0Jrow6ATsB/6z9eumchyWRJ6HuGpftH4qCKtjtyiNy?=
 =?us-ascii?Q?a0SPSkJSPK655pXBZyHNn8fYGQisr5vDlkPBwI6moDHcVeuy6EBadL64c41W?=
 =?us-ascii?Q?pLkQ179ASK/w0weAC0f6EF49mjUXDVhR4X/Ur9xTlUBCb/G5fsMXmoxtluBK?=
 =?us-ascii?Q?D1X//rMhhtUqDzP2j/NZ5IZNMVe3P09TLSTKxp5nbR/jDUS3+jKTyjOlsp4f?=
 =?us-ascii?Q?n2Zr5W+h0keHMPbPDmc/Jwfw21FleE8UD9VEyLpanQCXlBnaCvCfbtQyDx5E?=
 =?us-ascii?Q?KMZeMX5hMqOBvb/QhS8XOYxLu3EOOFNM7BlSKMtgCT3Svox9J6XES2dDxWfI?=
 =?us-ascii?Q?V0euW6MEiIUBtnS1RuYyozGMVJqG18gPY1dCaw11X0xvLTs1hLKUprzz++y5?=
 =?us-ascii?Q?gnwhm5PrmF4G33satx1b3vEj43IY/vRGMxOBQLRAQ11MVpy5AK7/QFPXdIR6?=
 =?us-ascii?Q?FySSOrxZLghLacyiPTgIlhVeE+PSSP/c20ptYbJ2C/xtwgF/LwFQ4I/gvwfz?=
 =?us-ascii?Q?RjscNveoX/v893U9x1BXzAz4cEm+7KLidh6Lb3fkBqLraispVOXGDLWvoB1O?=
 =?us-ascii?Q?GEMAREnoQoGLuVpyy0Yt1Kd3HiigoWerpgrqkqL08zRj8mtRa56Ae4RhrGme?=
 =?us-ascii?Q?WafKQ/16IC4wogykurPtXTR1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178b7352-c9fd-4237-9d12-08d949581e62
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:46.6927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEtHjG2MyUKgBIZYoqafqOcLDnBQ4HwWIPlJlTgi20Ecz1xjx9v15YT2WMvrAYGUH307vC12VSnjz0q2y9QAjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2830
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
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

