Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D59655BC99
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F01510E623;
	Tue, 28 Jun 2022 00:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8286A10E5BC;
 Tue, 28 Jun 2022 00:15:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEnkM0xOgeY/hbvaeJIVgqd4Ue9w/yL6irrrs3gAUNM9fMMsZGGkl0i7ovX6eNt0riYbs7BcS8/Zj+fhn5p3wCFWSbF9eg45MPIKB4yknakPsEXppUqEg71kLwgx4aXD73ZkQmHIyQkN4xxOaHC+B0D2pcF5rwcxgAP+tg/VOc+4SVL4W/lDMlt5KrMsUQtvPCC7xiU1QVJSk7gOXX8HKTPkdcOp6oQvO0nf0YV1BCdJ2IsunfKdks1r2c07iQGIF0Bp216+ExkNK+eC70ZeLISswWR2XkH2IsIzCs1CNFSz/PDN7DJjFSOO3v03IHjj3KFxSID7jeC189GPLUfdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F48ZVvqhlm2XwBwJbDJOT+M2fGXCuMlUauIgbpjkrV8=;
 b=kLCdtOSEFkSNh/SA3MQfXva/bLip/ZFr/K8lDJCXjVeWsfbu/ZFGYLhhLPf+KB82uFeXVyne+rEjUxLKO23cpdsucdDBAl4b0CfY4rW8y0NaLJwmw2T1uIfI0+RPm417QnG2dA9KgEDOtFi+pQO2zYLWAwfi0r2QwGLTTPa2VtdntBiwu60HF3/Ik+bMro04+F2t8anaj1LBdNOOpeSWNuwcgoL0X2Nsdj0D8Hxkca0cmjIa2jeg8y6vD6HfUEJYMpiAG34G22mgyOxbXkxSE983dhfjfIeuSP1ZTO1hS4QxZZtYnBrN42rmrslnzZY2N+aEnvVGvX8wnyMCMx9Qag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F48ZVvqhlm2XwBwJbDJOT+M2fGXCuMlUauIgbpjkrV8=;
 b=G6mnHIZ5AFBbwSrwZY/yNaQ0ZX1tqvrOgNRadgIinq+ke/C2HhNDdO+JmJrXx5SFFd8eWckGGUdwh+y/+FlC6uN1yRnAd5uN2+iD0KK+lHqI2/ql2z1HiflN9U3kt4jilJQhs8E/digutG1lDyT8J0yyN+/Kug/p/tnNvNt7ROc=
Received: from MWHPR15CA0069.namprd15.prod.outlook.com (2603:10b6:301:4c::31)
 by CY4PR12MB1910.namprd12.prod.outlook.com (2603:10b6:903:128::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 00:15:25 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::f7) by MWHPR15CA0069.outlook.office365.com
 (2603:10b6:301:4c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:24 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:22 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 05/14] mm/gup: migrate device coherent pages when pinning
 instead of failing
Date: Mon, 27 Jun 2022 19:14:45 -0500
Message-ID: <20220628001454.3503-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628001454.3503-1-alex.sierra@amd.com>
References: <20220628001454.3503-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7db7243b-81fb-4562-8d62-08da589b4c43
X-MS-TrafficTypeDiagnostic: CY4PR12MB1910:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KXiGQqA7dgePJzUTlFQwOal3TnAs0em1NwORCcXFM8jqwoKDx40ZsdbYshYFax1ZhhQ0qY59E19+6QXc1w82RYJuHbpxqw8Hu7lJCmgG7AzXDZLZOJUnPqOUK3rQ7pmJ/OJKstbe1kySh8R/3jz5s+vF0MBI1v3CzQfBc5v4T51yac3SEIVkN4HR858vuK3to7cWYPRnS9wjVZza4AJBDPO8TRswRmzt/PNhq19+C0p3Q63/eDZqPhD767vzK1UDL5lGOZhixnVe1YqV7IZ+HdcpTXXGk+d3ysYlZtXNEr/BHbmuxjFv2EcMQUnhuGOKXZLAFB8vyuhlo41kxVIFNCwbD5ahRL5QRb6MypWpxvsHjpbJWoO4I49ng4M0ibLnilXc+un8KzaF5pUnmZ+pRhQTJEqYrH6FLYReckhboaxivTYV/VeilxpdJUz1Fe/QRoo1Po+MAcQTOr2nqbkG+Tq+0nS/VMvTonhl8KR2tVV28+ap5Rjy2uGLzk1LGY+z8Qu6XRNX83CysvJ6dA1zLuWkM0ELgYUieAHYliUkQEA68kD6LoX9JVE2+p5IDyv3ViRh/z9jAUQu1XVT4Oi1pl1U/4cL06Z/crA2iC6FDUQrMAKz+/EcfBMeArWDir/AJmhKls6oswrYtiop3fUgLyhLtnUsahAXh98nj2CYk9RbcLnkgu4sJ+cVkH8Yx8jv5cV4pXUkGIkCVNqT0md4uUKiXAEVy9IsNLjo6G3a6y8NgJsQ8fpgWxCADCm33IFqC3zoPqQNE2fQ1lkFm8NxXGCILYsQ7IVKBb9ejqzhBlOuz1rVZYYggRUMRz/ua1PrxCZObYY54nVuR/uZfGswA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(40470700004)(46966006)(6916009)(70206006)(82740400003)(86362001)(8676002)(40480700001)(5660300002)(4326008)(7416002)(356005)(70586007)(8936002)(54906003)(81166007)(36756003)(36860700001)(26005)(478600001)(82310400005)(336012)(6666004)(41300700001)(83380400001)(2906002)(7696005)(1076003)(2616005)(16526019)(186003)(44832011)(40460700003)(47076005)(316002)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:24.7142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db7243b-81fb-4562-8d62-08da589b4c43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1910
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alistair Popple <apopple@nvidia.com>

Currently any attempts to pin a device coherent page will fail. This is
because device coherent pages need to be managed by a device driver, and
pinning them would prevent a driver from migrating them off the device.

However this is no reason to fail pinning of these pages. These are
coherent and accessible from the CPU so can be migrated just like
pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
them first try migrating them out of ZONE_DEVICE.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
[hch: rebased to the split device memory checks,
      moved migrate_device_page to migrate_device.c]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c            | 50 +++++++++++++++++++++++++++++++++++++-----
 mm/internal.h       |  1 +
 mm/migrate_device.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 6 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 48b45bcc8501..c29a7b5fbbfd 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -133,7 +133,8 @@ struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
 		 * path.
 		 */
 		if (unlikely((flags & FOLL_LONGTERM) &&
-			     !is_pinnable_page(page)))
+			     (!is_pinnable_page(page) ||
+			     is_device_coherent_page(page))))
 			return NULL;
 
 		/*
@@ -1895,9 +1896,43 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_folio = folio;
 
-		if (folio_is_pinnable(folio))
+		/*
+		 * Device private pages will get faulted in during gup so it
+		 * shouldn't be possible to see one here.
+		 */
+		if (WARN_ON_ONCE(folio_is_device_private(folio))) {
+			ret = -EFAULT;
+			goto unpin_pages;
+		}
+
+		/*
+		 * Device coherent pages are managed by a driver and should not
+		 * be pinned indefinitely as it prevents the driver moving the
+		 * page. So when trying to pin with FOLL_LONGTERM instead try
+		 * to migrate the page out of device memory.
+		 */
+		if (folio_is_device_coherent(folio)) {
+			WARN_ON_ONCE(PageCompound(&folio->page));
+
+			/*
+			 * Migration will fail if the page is pinned, so convert
+			 * the pin on the source page to a normal reference.
+			 */
+			if (gup_flags & FOLL_PIN) {
+				get_page(&folio->page);
+				unpin_user_page(&folio->page);
+			}
+
+			pages[i] = migrate_device_page(&folio->page, gup_flags);
+			if (!pages[i]) {
+				ret = -EBUSY;
+				goto unpin_pages;
+			}
 			continue;
+		}
 
+		if (folio_is_pinnable(folio))
+			continue;
 		/*
 		 * Try to move out any movable page before pinning the range.
 		 */
@@ -1933,10 +1968,13 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	return nr_pages;
 
 unpin_pages:
-	if (gup_flags & FOLL_PIN) {
-		unpin_user_pages(pages, nr_pages);
-	} else {
-		for (i = 0; i < nr_pages; i++)
+	for (i = 0; i < nr_pages; i++) {
+		if (!pages[i])
+			continue;
+
+		if (gup_flags & FOLL_PIN)
+			unpin_user_page(pages[i]);
+		else
 			put_page(pages[i]);
 	}
 
diff --git a/mm/internal.h b/mm/internal.h
index c0f8fbe0445b..eeab4ee7a4a3 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -853,6 +853,7 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
 
 void free_zone_device_page(struct page *page);
+struct page *migrate_device_page(struct page *page, unsigned int gup_flags);
 
 /*
  * mm/gup.c
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index cf9668376c5a..5decd26dd551 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -794,3 +794,56 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 	}
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
+
+/*
+ * Migrate a device coherent page back to normal memory.  The caller should have
+ * a reference on page which will be copied to the new page if migration is
+ * successful or dropped on failure.
+ */
+struct page *migrate_device_page(struct page *page, unsigned int gup_flags)
+{
+	unsigned long src_pfn, dst_pfn = 0;
+	struct migrate_vma args;
+	struct page *dpage;
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
+	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
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
-- 
2.32.0

