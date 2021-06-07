Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D1A39E899
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 22:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523F46E0BC;
	Mon,  7 Jun 2021 20:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA856EA02;
 Mon,  7 Jun 2021 20:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrJ6bKNUGZ0ztYGuX9hsPImZI3IYCdeddywq5g0gQBqjSMXhedlW92Sw6EBAojn99Ufkwocr/ACNceEqdztKYRUDtTYn1d85uuabTYDlnz0pH1At5QiK/5y1rsITvZuW5j6PB/0+brxMhoKPaRz2Jv9WqUsC0Cs/KkrvlBrCe+6zmQFbb0dq3cF7HoH2blSwyaCyBQ/PCnlFUCEbHSS6AVqG1YcPmVr50vLfRkjCyYAC4pKwoo6KMsmekQFXdXseuZNkLDhznIXiCzeQoLeQ9NYeq5O6pTH3JOR7F+cm/gdsCA1PwaRbzyOZf9NJNUA7rPAofWHMDZgtK61fzLm78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Veu5Gzl/Oa8o54qERYdlCjbYjBjIwq67BZ+ihmUZvdM=;
 b=EBBTrScJaxlzZeYbFeG9DNfnc3F4qMMf5Z8tVJoZvvffhCSN1/i0455qI53cK6P81AlD5iLfrFVm91q4Ql19ADst77DA1ZOnDQ9Hi8wSAmMBKVMlRccnGi4sVACdD6YVkQVSRDN1R02NnIE1fSWk87L3a8hio3c/v5ybBitbBK2S8g3didB2y36F1XqjAM10I4sHgqVD8i17kdNkpiF26eoJ1DUs2g6Q+OXqXob79MnoUqBFXRwHuVC1JGtpWcRy9pmk+H0H2X0VamhOnmXphx/m23NBXYRbHMJ8US4q7Q46t9wkaKfHzNkg32Cff1iL9wZVpYr+w6DQdeeLux8GZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Veu5Gzl/Oa8o54qERYdlCjbYjBjIwq67BZ+ihmUZvdM=;
 b=KjAVu5wRgwrPNuwC03kKZEEryAmZ2IyKWknNkP/ZjLG9z0Hs04Ay1+pIBO2S4o5+KuMBQHL4CZ36eaM5X0Ay+w8kxcUjheR0JGKx4FzUGtlX8/IyCpB5tkpROcyDQx+64Q6ze6ZdEwUJp2SHAUPQAynp87nq4v5IFH/wMf1peF8=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 20:42:39 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::5ce6:fed4:e00f:27e4%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 20:42:39 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com
Subject: [RFC PATCH v2 1/8] ext4/xfs: add page refcount helper
Date: Mon,  7 Jun 2021 15:42:19 -0500
Message-Id: <20210607204226.7743-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607204226.7743-1-alex.sierra@amd.com>
References: <20210607204226.7743-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0601CA0018.namprd06.prod.outlook.com
 (2603:10b6:803:2f::28) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0601CA0018.namprd06.prod.outlook.com (2603:10b6:803:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 20:42:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 308dda2c-3b79-4d61-1905-08d929f4ca8b
X-MS-TrafficTypeDiagnostic: SA0PR12MB4495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44955D09A72B23306675BE14FD389@SA0PR12MB4495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M7nvuR298RIzDcWFqORjdy9cxBg+vfh3A/zMlmIrBmd03Pz0OhpUaXQ0BzzWRIfIqw72w9d64AvCtBWXuoSpWES7sawb8O0da5Ssy5FykuFLhvPWYAEi2cAr1KsI3MB0G33Wtd3ciUkRfsakCYYsH0Ja1LWF+En5au4SznarcgA/xr2zmWAgDtNL8963PR28FUUO8vuHusXoNSDVs2XqKagDvjvWNtb0KhGzhMZdfMG3VTbJDZoBYayjlKYuBYOquc8hiuOAj68rjfJV/7b3iOXms47+9epj0QqZwXc8dMW6qF/KNj5TjBkTBBoN3B9Y4WrDeGoVBjLl1wlnbQuwuo8yG3BKm9S0bmq6Q4hYbwxeNxXkqKyPmm3E8mvklmBuDpX3iJm8DaWxqVca7thBY8962LxZeU2u9zoW0f5AgyPRm5rVG1m6O/Gk8T8pXt9KnlexFNDEkFfBZ5p65SP9Wj50NS+foMihHAiLCLw/wVnrIba95jKhEZ34CNanGcPlemN5n9y7aXdceJbGKDIi3ZsLefnCvpJ69NHdO56o6DElld6gU32ezcmqb6qviiNZHA2sSkXG+rbvkuwvqYfFfeTh6tJZZUx5fHKb7qbcSU7CsChXMe7nFcIgnL86U0RGUQym6bar5OuomSm/a9kLWG9X2A8TvXcl6daJ5mzaLeM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(956004)(2616005)(6666004)(38100700002)(316002)(26005)(5660300002)(1076003)(2906002)(6486002)(66556008)(66476007)(186003)(4326008)(16526019)(66946007)(44832011)(52116002)(7696005)(478600001)(83380400001)(36756003)(8676002)(38350700002)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eUb5xnD0Vi8tB9i846WizgDb37neWXUcAfp0Rvro0yidV2oRa0Yq2L0x3nVx?=
 =?us-ascii?Q?KDOvxcVAU3L/7/HdxKBQTIklO6GZD6X4MDlho0wDNS3gZlaaxoqSFM5Oxwxf?=
 =?us-ascii?Q?GaLCBlN93/fAoqAzXwbnK2gFi9gw7JFBUAOc3EefOZHyn0s+bbAqIEf5zH09?=
 =?us-ascii?Q?CcNxUzJuP35G7e2kNy5hdMhtSiuhh16gYRr8ZsNj33aOBpE6zzm1Vidq9LMI?=
 =?us-ascii?Q?20lS6Hzb2UixSsh8LeaKDxIZ5M14R3DTaEtbJze+Uoj9hVI0955v9tgLPjr0?=
 =?us-ascii?Q?pSJGGKp0zUwknwAzVn3oZchlILUwSKOOUUBMw2T7Saqx/t+EGZJwwh0aLkfB?=
 =?us-ascii?Q?Tqx89j0Q35Y2TBcX3y98LEuk9jHJOhphmLsra6jiMj4HHBUGeM/DP0PNSs1m?=
 =?us-ascii?Q?iPSCagRpWaRnysa0owa9VGqrrDN7FgUOHfh5msY4Yy1b3NhJiDj4wkcrHFLs?=
 =?us-ascii?Q?kq320EUN3myWvjATze/jY22p/4s2afSNVRfTGdOn9y//7hr8fZ2A4Eycy22k?=
 =?us-ascii?Q?1L0Wm2XSZzMWrveJ/gPxJrZe3PqL6z5nExAiE4IIjnFmskH+M9EdPTv09W0p?=
 =?us-ascii?Q?Ak+0TGO8wdMe9jMR0zlDvJmpj+doTU4rn29UcDHOnROiTjGCGd0+4QYLLH+s?=
 =?us-ascii?Q?rKAOWwlvD41deXIZhDPBvhfM26z/vft3NYEYyTVfaQZnfYtZtMEFKJVwqtEG?=
 =?us-ascii?Q?gUFooQ+aFNHCGeFeBOUibLSoL9TwjG0opv3BA94i1C3KHngThcR8tm/sssdR?=
 =?us-ascii?Q?wcgb3gH2j5Wi7+6SiPC3sdvPFy+kt0dNsm9vLOSMHL4RqS9XsEBUlG6sW9yr?=
 =?us-ascii?Q?VPTfweSBhw93HVjFKXbLiN873EJFd8SZDuWKtOE9fp+Do0wZw2bmGblJFyy8?=
 =?us-ascii?Q?SbN+n9gF7B/LyMsvIQ/q+sWbYlJ5YYEC2vwbJcwBE+ZZCOIY69GITXk1UFoa?=
 =?us-ascii?Q?IXJ0iy04YmDkrMSLugXhtxuUCSqqjk4zSJWwOWzXPwNgOGn7IzLsugmM+/bc?=
 =?us-ascii?Q?vYo49fDI47ML/AjVrdUdicf8xmbrTMURIn3vYXDUzJyP4G91HN6GRV2u2hK4?=
 =?us-ascii?Q?zS0wR9uNCv0bP3CXgPG82epFwz/xjjy+7s63JWQMIbHwKEgAvExZ3UGQxtnp?=
 =?us-ascii?Q?phGEBsANDGqGC8bRFBd2QXGup8ScqpqxJUPmIsd1Dq1IECPqZROph2Yl1K1S?=
 =?us-ascii?Q?BIZ9FkKp9kbJcYfCKwXzshEStbiBSHi+3kOeop4SnAzmdzUnttAVrj/vPZw6?=
 =?us-ascii?Q?FIOyqloPIk1UEwYzthYC0bGJHmfyZ/DscHl2eUyzQuBam7lW7TSOwmpb5qn4?=
 =?us-ascii?Q?+ha+PrLUcHoIinRcU5ouNQOB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308dda2c-3b79-4d61-1905-08d929f4ca8b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 20:42:39.8151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rwaOCDKlpltmqOwMBv0HFrpn8B03fAy9MeeL0vUkZuR2cOuXU52tAJ66AwnxlAXZvmu6TmMd3sQ8s9w/N+6uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 fs/dax.c            |  4 ++--
 fs/ext4/inode.c     |  5 +----
 fs/xfs/xfs_file.c   |  4 +---
 include/linux/dax.h | 10 ++++++++++
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 26d5dcd2d69e..321f4ddc6643 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -358,7 +358,7 @@ static void dax_disassociate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
+		WARN_ON_ONCE(trunc && !dax_layout_is_idle_page(page));
 		WARN_ON_ONCE(page->mapping && page->mapping != mapping);
 		page->mapping = NULL;
 		page->index = 0;
@@ -372,7 +372,7 @@ static struct page *dax_busy_page(void *entry)
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (page_ref_count(page) > 1)
+		if (!dax_layout_is_idle_page(page))
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
index b52f084aa643..8909a91cd381 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -243,6 +243,16 @@ static inline bool dax_mapping(struct address_space *mapping)
 	return mapping->host && IS_DAX(mapping->host);
 }
 
+static inline bool dax_layout_is_idle_page(struct page *page)
+{
+	return page_ref_count(page) == 1;
+}
+
+#define dax_wait_page(_inode, _page, _wait_cb)				\
+	___wait_var_event(&(_page)->_refcount,				\
+		dax_layout_is_idle_page(_page),				\
+		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode))
+
 #ifdef CONFIG_DEV_DAX_HMEM_DEVICES
 void hmem_register_device(int target_nid, struct resource *r);
 #else
-- 
2.17.1

