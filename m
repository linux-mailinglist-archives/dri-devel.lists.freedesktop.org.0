Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C05533163
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D55810F200;
	Tue, 24 May 2022 19:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61B910F21F;
 Tue, 24 May 2022 19:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4mQo9rhe3nZay10rHSjEUUpgDGxfQIMVSsN/CBy6x9vTkwBCvfzup+eY4n9yFwjElyHh6TeAjM/c4h/bwyTtNWZ6nExmzr+1bI/jQH5SeoWjQoEZS2eSEjws1Y5Tb8yDQ/27JZDNLYJOp0foqcDC1SpA0jBRAgtdR5UaPDkEDMwAUF2vN1XnIQHyGGZvXHPNof0iaMCPdjZztf0hB6osADR6o24VxKuUBofNAvaA4unq8oyKu6+XClJnCkhnkSnUddKSnbdeNH3FPa0Q7PUd1Y3Hx3BGB7wNrDCWfqZQXUQSwfwx82Afre0RJKVpJ48ql7ii+w3ZjzasqeBVGUT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hya6PBw44o+VaA6dTWX8yYj49pKVc5eTiFshDTXM37Y=;
 b=nggwqAd6nYw4ZAb4YOUZhUiRt8YOK51kwIpzbZywap5XaI3u2xLlXQOZDH9tYK+aqQ4v+3d+0d2HC7VlEXz655OdgwAEablMRdRICEsMLXl1LXw52tdC30DZkRfMTuD76RmM3sfy9GWg7Fw+MTV5bOyOTM5IhVZ6ceGHyMVpkJYrrsis+5OYl3I0KZ4E9q/FKukNX0WFTRaM4/DVrmtVbWW5dLp4nk5tGdeslfOQvmKvDGVUjKorVHyhle5Q0mYYey3wU2FQK3U1TdyN6ue9R9u4q8cIeyq3tqsmLaB4ggG77CQhXJYSfj1nLtd1HOxvLwKxGXdGpMDe+G9QBafAIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hya6PBw44o+VaA6dTWX8yYj49pKVc5eTiFshDTXM37Y=;
 b=DQ4hv0CU1tAy2X6c6vPxC8dBg2waFWuM6WyEoHw2gFVrVOow7+stE2DseGmtrTM+bBEM7hyp37CJWbNw8l2CRqhP6VNyk/zN18xGZAw6nG+9vnVuMlOAcHp68dgH+KhCqYytAehswtYOMJ3s+60poN8X7dTjJJGR7vC+1vXqJP0=
Received: from DM5PR17CA0052.namprd17.prod.outlook.com (2603:10b6:3:13f::14)
 by DM5PR12MB1772.namprd12.prod.outlook.com (2603:10b6:3:107::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Tue, 24 May
 2022 19:07:25 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::63) by DM5PR17CA0052.outlook.office365.com
 (2603:10b6:3:13f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23 via Frontend
 Transport; Tue, 24 May 2022 19:07:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 19:07:25 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 14:07:20 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v3 05/13] mm/gup: migrate device coherent pages when pinning
 instead of failing
Date: Tue, 24 May 2022 14:06:24 -0500
Message-ID: <20220524190632.3304-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524190632.3304-1-alex.sierra@amd.com>
References: <20220524190632.3304-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0649b131-1f54-4e0f-29d6-08da3db8a373
X-MS-TrafficTypeDiagnostic: DM5PR12MB1772:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB17728E5A65BA39089D024B08FDD79@DM5PR12MB1772.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HtwBWRThPZbKs4ztfnb7MqKM0MWxb4M4H8A6eB9zo7RI+R6W1yuMCGkbU6QeWFV7DdtC8Tu4zSAvilPa958DpaxOVTGQXFenH8HN5nbME5kJsOUxe/9OJJhrteOWxxRhuBWNvdi54IzJu9lpTgo+Tvld+VCFEcVaBeAij3K2eIWiYsllIKb3kzbgGsS+tc4v5nwEVFwDmiQsLYtcv3Bb0Yc6cHT+NPmOVM03B9ORHRUBUDsKt+dWCojWXaC7YBuVJbZm/yBM2NXbKBpXLuMIN80qIXBwl273vJFaDbleT8xIoJJRZNas5Fnuj+mkeVxvJDPsfBXXGV3wOoxfnjVWGS5lkMq12oOVEIizSPzgcFoyfX2FsXoEHiwDBG+rQRLQ+kyQqmIu8bspPGfCsqkiYM47YgaYp5D7SfFyH53mXB7n/D6H5W/gOVdeGjhR6hpW1dlpcs7/DSgrn1pny2xN3+ADUnAlcJGgm2mMsbpAQWuOHKpXhAhw3BhwyRXAWkWjBEDvo07Y8OCNQ6QR5LHraZZzzbiyODcH+G1zvESX7FjxKAaQ+2QlU53Yd7C5FzSCuq6Q5X2HYGfArEZhMLuttw6DHqZLxXcRWbhne8kE0c2pBZp/ULKgEeOKhvS0dnI0lQpHHXW/esfPu4jHGwZff0QvqJN9nxJnN/whNTCx1ki1zqCYY607cFZSI1eMLGMZEMP1V6WUTWRxHr4VSmJLQA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70586007)(316002)(83380400001)(356005)(81166007)(1076003)(47076005)(70206006)(4326008)(36756003)(54906003)(8676002)(6916009)(2906002)(36860700001)(82310400005)(40460700003)(508600001)(426003)(86362001)(5660300002)(7696005)(8936002)(336012)(7416002)(44832011)(26005)(186003)(2616005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:07:25.0763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0649b131-1f54-4e0f-29d6-08da3db8a373
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1772
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
 mm/gup.c            | 47 +++++++++++++++++++++++++++++++++++-----
 mm/internal.h       |  1 +
 mm/migrate_device.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index c9cbac06bcc5..0f3cac7604d3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1817,9 +1817,43 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
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
@@ -1855,10 +1889,13 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
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
index cf16280ce132..32c621416966 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -750,6 +750,7 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
 
 void free_zone_device_page(struct page *page);
+struct page *migrate_device_page(struct page *page, unsigned int gup_flags);
 
 /*
  * mm/gup.c
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index b399c498f0aa..1e74aa7ab580 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -775,3 +775,56 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
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

