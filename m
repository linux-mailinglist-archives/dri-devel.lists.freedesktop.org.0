Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD75C4A5780
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE9310EC9D;
	Tue,  1 Feb 2022 07:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7F710EC9C;
 Tue,  1 Feb 2022 07:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHX3SMvbPuVMti9xoOgA+Rz43fzQM3s898ViucsmU7GvH/Q1lxUlbSmH/kefqbK/AJfTMo4vsNtT66K3wyjs9sUV2HG1VFBjyVHD8rD6Kv4+BFC13c1D3ZnaoydtuHHBRjfnXvpEBGYmiik3NLaVTuBcSTFEbe+r0cpusIw24wlOrDLNfTorLQfsqCmZ0QFr3y5aIMk3mY8kRqfov0Svm3r5wXnEJ6j/GG3UJYHpo2eLEt3POdZq4o2XthZFJ6HAnm7D6sLuqBW/FUNwjIWOEFaWAgC/NsNM+MgR/UHlQaQJ4LZHrOB4RDfcrqR2QdEZIXslUvbK9SVKJPDOhNX48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ekn26LWSwUBLEq5u14kTznh4j631tJTxixy+Ed+Jnb4=;
 b=CxW+M2qQpzt4Hsp5psC4I4hgpEX0egySPQQ51HXvHcA8xlLYgHRIGM9tY0yP3G4L3tMJsOZCqWRuHIKfLVPBvAuVLdPtFIFXhkO+YCJ6qEYBL6hvR49OX4VB261zp2MmKB8HMWYQt9ADvT/Vd3YGB7i3/eq3U3z5un56YrFV8oiQyWBc7Aese/tN7OL77FdwNbNbh/MZNUfrjn8dms0Hp/ytZqsz1+U7Q0/1R8ZvSfAeZatXzB2dyHjJwcQeLYv/738mHkBk76t3HxrWAXpZl3Dp2ZAmY67KBSt5r8SBr/LUAWYf9LmcsfKgozS3LEqrjds+/W9Na3x+6PcSWe7N8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ekn26LWSwUBLEq5u14kTznh4j631tJTxixy+Ed+Jnb4=;
 b=bmdxcVo3OApJ1hxieNxaZcbZCZ+gLH2Qp/ECRzsUmZgoNiLaaXgpn4uRLO2zmAtuzQakFxcpKbwgycoqtz6/zP+TXZrr4E/zugPffQHFTAn5mYsKV+kWQDhLOIQTrxcBNGPaAvYRiq5lvRIVccMoj6HoN3myeOhPye/iVZLIUnNKOOqr9oGVhUsckibSzUm/td/3BrdlK2WSwWjgW25ktEklrHt721qkHH+Gcm72jGFeYx/HPUEqh/iBxWj8Fu0Jexr3ixGQCYKXizHtl2sv4WBxsjz07xqxa5+ni3cmpiCmlKL1gPeKLm3UsNxlojc59TVVBqePKHl6j+D+n+DjEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CY4PR1201MB0214.namprd12.prod.outlook.com (2603:10b6:910:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Tue, 1 Feb
 2022 07:06:51 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::48bc:2cb6:45e3:41fd]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::48bc:2cb6:45e3:41fd%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 07:06:51 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [PATCH 2/3] mm/gup.c: Migrate device coherent pages when pinning
 instead of failing
Date: Tue,  1 Feb 2022 18:05:56 +1100
Message-Id: <d4d399492b2ba09f4c551fa2261fbd22172886d8.1643698773.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
References: <cover.516a938ce97eb805791da6e2df508eb0dce413b8.1643698773.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 426a86f4-d077-4df3-9f0c-08d9e5516b96
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0214:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0214F11E9020CEB73EEDCE89DF269@CY4PR1201MB0214.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+DLAS/dnni9a1m9PRrZjrA3j/zSJEJ67AKDvqhZRPqJ3zuhU3/nNu9EHVj/l+Y0Ed4wUeKT02RXX/0qywVST4YjUCwKmdBo1FZA9P4OOR5t46PpjTKZe/b5E4y3lIKDZBAV7UrqexBADcSNSMcv8/j90BvEvz6BCB4tpxbFb6W3LQEAUcp7qXr0jA3ebObAihiPdWHPX7fukRpvfpMlasnorqyGLpIO0/gk+zEVsP/R7Hn4KX/kaIqkRUSmVFc9KH4nldOLt4BdK2v7Nh1uSfWeYuvTvoLAmwaSmeqCykRlwWW0VBSwxEQdD5gOpWUNWFmDyT5Kt57IGzO/dQHq6eyDcDCwHPkQ7o/xT+OmUCclmUqq5pQQhYvfhRO1XoCwbt48w0cS52uMQLXtLSLsEhst+yrvmCSUpwPD5rD7TXi9O1/jaVSp/I95MrXtPMTfEqgHs0PCyrRhRH9XlUVLTB4z1yYkbKZIpnbUQvEcXhQE2IGVH9wv/IrwzKqdA7gefN0VkmcWTSjMJ1eyskAHhjdWarZytj5DI+7WSebokrgfkDJwS1qeMoO7vwEd0P0czAtQX27IhybPSYYRE1me8l2eouAzf+llHKyvMR4QvhWTsQlMInrqGSZpjmKN2ybfs1QXO0hnQTvicCq2+EXV+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(38100700002)(5660300002)(4326008)(7416002)(316002)(186003)(508600001)(83380400001)(8676002)(2616005)(66946007)(36756003)(2906002)(66476007)(66556008)(86362001)(6486002)(6512007)(6506007)(26005)(8936002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5bbQWU4v+bp0Y9FGw3+0RVlsjFNdUdKVtl9Sq95J5kaHlImgmUEPl1JjbleU?=
 =?us-ascii?Q?MW0AiuiXhHkRbjB8YtSDv8Xh+MFWLC8Th3SJ9rYqS10zy/YvTWBNMjNSZc44?=
 =?us-ascii?Q?jOLQrnfypXh9xOnxHcAMZmKT9Psld+1mRypXNqH7XCk7qMCaUsDvbpfk85jW?=
 =?us-ascii?Q?/7S/MeYeXRPy5ui6QJW8aUrXN3huGf8PE9GAmT3oErb4XuiYYdhlY3iwfm8t?=
 =?us-ascii?Q?ZClmPbQNJFuqjzO6e4CXPvHUfbQHZ6e8Puszcr3TyHdFh/XvFRVXJ2Xsb2Wd?=
 =?us-ascii?Q?q6j6S+0F+XRoyQ3/bHxPXykHRO84K5Q2J5IYCVUXz39YxQ9GuGmKk43H2azG?=
 =?us-ascii?Q?80gQpjGKV7QQhXTmhCd2rynM0kauJVNL30x2a8aGAeIri2aCtX403mgRpYZS?=
 =?us-ascii?Q?+vucfB89NBU7bz0mrijScBMJmrVKvaA33UFHcsaqbtqUXAJK1jUEF683r2yT?=
 =?us-ascii?Q?nwxlMPvbEQA2Fivqr49kQbRBnWS6DsneloiskAgqWLIjaH65Z2PsOF27FQwq?=
 =?us-ascii?Q?ux1sLJ+TIPj3qyQMFNfCWXWtMnAob2V5trkibvnaR942quWHwduFk0s+8+wl?=
 =?us-ascii?Q?pVHr0xm3rz/oKL6T49PgpgGKHE8LHx/1VLZHJAkOOHpw8kcAto+Bd5yMSp74?=
 =?us-ascii?Q?fkaPYWe5UwNl+EoZATZsjhGuCjIKE90ag+IXHO/YeCMGAEe1zGi2F0+zA8fI?=
 =?us-ascii?Q?tiGRSnVK1O48knGOumLUq2fPQXuaxj3gFeacv6iH1Ce9KjJFq6MQPG5deCv9?=
 =?us-ascii?Q?eON/f40vghYUSdGNIwD1OPAMip+z1f96VDHidu2d5JwrIxjUoj0ROqNp64K3?=
 =?us-ascii?Q?ecEuqZd9eVx8yr5T0EeIO5zZIcmtIMbKC/5WKYoG9mbDUTERVBUWR9w+Kqg6?=
 =?us-ascii?Q?VGxqCGUatC54dL71HAPCRi8IWfYbt2JXBP53MWW4Q3sKpeUnltfgnRZp0v3G?=
 =?us-ascii?Q?+s57iE32+PdO5btaF27u50lp2d9QoEADLAd52DZ+wxw48IuS173h0VV3Pw86?=
 =?us-ascii?Q?h0iDQ69lQZH96oT0ITWonlgJp6UwLOuKTp2mshKpLIL+Ho46Uyvu0Iydoz2y?=
 =?us-ascii?Q?242fJ4FcxCn4D3oiaL6Cq4lnoL4SiljnQ7cDfAw7ZbMMCLclzrHgTallCAx7?=
 =?us-ascii?Q?3Q9530xphDtDPDZpcRwGMf8+zC/ITrRROGPxyCtvzmKhYmf5IYo5a4/u3pks?=
 =?us-ascii?Q?gW2gg7JMl/oN4AoRyAOK96wgfQS4hyFhzUIsVl1Ly9+HZiY0WwrI888PbVUc?=
 =?us-ascii?Q?tNNQ1APc025krFpVA8/z9jJfN1a3ebeu8/0eGzid9mNc9nbzOegoVMn3819R?=
 =?us-ascii?Q?tbwgk6pBfFgm8Cmq2NGiKDTsMA1LwCUOWTaYV/zBRV67rIZZ1DOTWRGb2ocy?=
 =?us-ascii?Q?60gObVkdwRVIn4pklTliDOD4+xsTk4BDlfd09wIsGi6qtQfxHp5jFO1er2Zh?=
 =?us-ascii?Q?44sS+0KxLgNvOLXLa5qCMnPzD1Pvrw2wrRg2ZhPiPo9S3RHXeYKiVlknYTVN?=
 =?us-ascii?Q?1z6lPyVaHjvSZJQiKqh9hDjX2XkmwxOFBitztXqctIv7Ck9DlXpxZ9aFlahk?=
 =?us-ascii?Q?RWArbjTmVNNErYsYpnAYApqR+SthKv7NvFAJ8IBqey7pmOOyeIW9x/Xnm1c0?=
 =?us-ascii?Q?jEY1cNBiHM5hCQmBqXmdiyA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426a86f4-d077-4df3-9f0c-08d9e5516b96
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 07:06:51.1343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwh8FDLklPOkM5ILv884vBjY10zS4MvIAr2QHuwaLZYVsKh006IZiEeNDlhXCYnXZoBvDxb3ipKcGmoF6ZDDfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0214
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently any attempts to pin a device coherent page will fail. This is
because device coherent pages need to be managed by a device driver, and
pinning them would prevent a driver from migrating them off the device.

However this is no reason to fail pinning of these pages. These are
coherent and accessible from the CPU so can be migrated just like
pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
them first try migrating them out of ZONE_DEVICE.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 95 insertions(+), 10 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f596b93..2cbef54 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1834,6 +1834,60 @@ struct page *get_dump_page(unsigned long addr)
 
 #ifdef CONFIG_MIGRATION
 /*
+ * Migrates a device coherent page back to normal memory. Caller should have a
+ * reference on page which will be copied to the new page if migration is
+ * successful or dropped on failure.
+ */
+static struct page *migrate_device_page(struct page *page,
+					unsigned int gup_flags)
+{
+	struct page *dpage;
+	struct migrate_vma args;
+	unsigned long src_pfn, dst_pfn = 0;
+
+	lock_page(page);
+	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
+	args.src = &src_pfn;
+	args.dst = &dst_pfn;
+	args.cpages = 1;
+	args.npages = 1;
+	args.vma = NULL;
+	migrate_vma_setup(&args);
+	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
+		return NULL;
+
+	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
+
+	/*
+	 * get/pin the new page now so we don't have to retry gup after
+	 * migrating. We already have a reference so this should never fail.
+	 */
+	if (WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
+		__free_pages(dpage, 0);
+		dpage = NULL;
+	}
+
+	if (dpage) {
+		lock_page(dpage);
+		dst_pfn = migrate_pfn(page_to_pfn(dpage));
+	}
+
+	migrate_vma_pages(&args);
+	if (src_pfn & MIGRATE_PFN_MIGRATE)
+		copy_highpage(dpage, page);
+	migrate_vma_finalize(&args);
+	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
+		if (gup_flags & FOLL_PIN)
+			unpin_user_page(dpage);
+		else
+			put_page(dpage);
+		dpage = NULL;
+	}
+
+	return dpage;
+}
+
+/*
  * Check whether all pages are pinnable, if so return number of pages.  If some
  * pages are not pinnable, migrate them, and unpin all pages. Return zero if
  * pages were migrated, or if some pages were not successfully isolated.
@@ -1861,15 +1915,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_head = head;
 		/*
-		 * If we get a movable page, since we are going to be pinning
-		 * these entries, try to move them out if possible.
+		 * Device coherent pages are managed by a driver and should not
+		 * be pinned indefinitely as it prevents the driver moving the
+		 * page. So when trying to pin with FOLL_LONGTERM instead try
+		 * migrating page out of device memory.
 		 */
 		if (is_dev_private_or_coherent_page(head)) {
+			/*
+			 * device private pages will get faulted in during gup
+			 * so it shouldn't be possible to see one here.
+			 */
 			WARN_ON_ONCE(is_device_private_page(head));
-			ret = -EFAULT;
-			goto unpin_pages;
+			WARN_ON_ONCE(PageCompound(head));
+
+			/*
+			 * migration will fail if the page is pinned, so convert
+			 * the pin on the source page to a normal reference.
+			 */
+			if (gup_flags & FOLL_PIN) {
+				get_page(head);
+				unpin_user_page(head);
+			}
+
+			pages[i] = migrate_device_page(head, gup_flags);
+			if (!pages[i]) {
+				ret = -EBUSY;
+				break;
+			}
+			continue;
 		}
 
+		/*
+		 * If we get a movable page, since we are going to be pinning
+		 * these entries, try to move them out if possible.
+		 */
 		if (!is_pinnable_page(head)) {
 			if (PageHuge(head)) {
 				if (!isolate_huge_page(head, &movable_page_list))
@@ -1897,16 +1976,22 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	 * If list is empty, and no isolation errors, means that all pages are
 	 * in the correct zone.
 	 */
-	if (list_empty(&movable_page_list) && !isolation_error_count)
+	if (!ret && list_empty(&movable_page_list) && !isolation_error_count)
 		return nr_pages;
 
-unpin_pages:
-	if (gup_flags & FOLL_PIN) {
-		unpin_user_pages(pages, nr_pages);
-	} else {
-		for (i = 0; i < nr_pages; i++)
+	for (i = 0; i < nr_pages; i++)
+		if (!pages[i])
+			continue;
+		else if (gup_flags & FOLL_PIN)
+			unpin_user_page(pages[i]);
+		else
 			put_page(pages[i]);
+
+	if (ret && !list_empty(&movable_page_list)) {
+		putback_movable_pages(&movable_page_list);
+		return ret;
 	}
+
 	if (!list_empty(&movable_page_list)) {
 		ret = migrate_pages(&movable_page_list, alloc_migration_target,
 				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
-- 
git-series 0.9.1
