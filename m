Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DD55294DA
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 01:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B9310E885;
	Mon, 16 May 2022 23:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0E110E2BC;
 Mon, 16 May 2022 23:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXNX9ABoUKXJP+ufKtBqXLtVengdFOtnRTOI4c7XwNJB4gYkWnl5+Uhj/UktW3N0rK7VdBVGYlPwCRGyGq5j55YlAC9tpn3P6lQHl+wn5o+GWP9MZbXfZtcdz8bHiMR3hLMZ9R5Fea0AgnqVD3/cUcaE9Dy2qerGqXalE0SgaoO/i3Ia88zsCVdK1NgPimMCTbuEjZtw7NGh8pYccK4Rwcbgql4q5C7Z5aQZ9bc/FHzpFy3lgMx8DRczyaUvCa/FndqmKum0q11b6EFt4LHTEhBIeXHOhv6pGcSw7SwyP+wlRUTcmOz5dpZ+Y+3H31fYHKw2GJXwJdqpDseSq7Qe2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLboctgqtU8q+2w0PX43DNmgl62uyxYt9SRLY3lWywg=;
 b=Gmd9kTkJWDHwE2tKOYwZCsb34Yc4vw1YfQNMoYCOKB/7RZXA3wRFMB1Gz1SEi3QzgpWbhzrRB8ChvQ7w7l2YU3C67StgXJxUQaNKv23xmkzZp6hmwu/0vIrk/7e5XphwLRiI4X46Zz4xEPzZXDRrD5sbFbYSzVzZYibQKvJmsMzH6XEF/THpKd7IzHrHlPj4wc/Gpj7Cx5zmcr0f+axDZTa0f6hng9l5RVPp/0EFgQTXWI/t+GIBtkrCAoWuWk/0DQUr1D7IkvwVVdEwCjU4HAdiG248IEzn6W7DH4BAZUb3Xcf7uNrzamhSu2Nf8DyuWLlQNvI5Wei61oafd8eg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLboctgqtU8q+2w0PX43DNmgl62uyxYt9SRLY3lWywg=;
 b=SzzOTTFGPx8dCcszRd8MgEO+fLdb6ZFOaRWV4GPiW/u7yKI0dywcGY0sdD6tLC2VlX2uaQIgdc+rX3muCU59uEGImmzTO4mverDNxqEdFMVYJXcYKz7v8ffVO9OH5+5dTWgZE9amvqC8D+q5z+spcBS0p1QHba0JN+dZVzkQd5E=
Received: from BN9PR03CA0367.namprd03.prod.outlook.com (2603:10b6:408:f7::12)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 23:15:00 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::62) by BN9PR03CA0367.outlook.office365.com
 (2603:10b6:408:f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15 via Frontend
 Transport; Mon, 16 May 2022 23:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 23:14:59 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 18:14:58 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 04/13] mm/gup: migrate device coherent pages when pinning
 instead of failing
Date: Mon, 16 May 2022 18:14:23 -0500
Message-ID: <20220516231432.20200-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516231432.20200-1-alex.sierra@amd.com>
References: <20220516231432.20200-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35c167ff-ce42-45cc-9562-08da3791e5de
X-MS-TrafficTypeDiagnostic: BY5PR12MB4321:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB43214BBD645BF7BE1BBF6A34FDCF9@BY5PR12MB4321.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QAGUl2dtF1RPfEgOUhor2NALYcSdtfabqwg2ey5pmJ79Ow61tfFu7teWjJBa1nbMXJazkk1PzD/JTxYJxShMfk29YIq/q+lgjXm0UOnqUFtONlnPgY+ePoKW5gRJWA63LQpFBPAR4hVVmBDlefukSWacnWhisp3wv+ESDVlxIhpAoEQ3+DSoV6zx4YOH3EcwyS+NjH44DWTpqB1Fdx7wh5QV4hyGogOGAeDn7nNxxm6fhD2ecZUX6Paf84YfIpCnWKPuxAlbxLsCiiIAVdQv6YlaZNoFSeItivLwk9fUmuB4d6qcVxBOau1UmQlTTaBrzohfl/gNPUCMlJJki1Kg6DwPXeIdBmNyNQYH47ewjfnL7qdPOPmipD8mI6F2OzTEx4UZVzSOAKj8V3apWw9rhYRPExd3PcBi7VTG99zN/kbxwaWTuG472hN9qDtc6E+DNulVB53FOAip+FKvbESgWNMTvDgdwl42aHJNe0L6JhEW5NQJtMhYIg+8FRxAJglRd7vmQVxk+eSNioLhRztDzDT701oN1HPxQC5nirdAShEzdVbwpeE+0VMzTQ9LWrWLNIQmLPufp/6YmZm0DRdnztwE4vz9tC+HZujWbdfhLU7X2IdHPiJlGbj6J/JBphVIFtVVe42wuE8qcHKdLxSfibuKVVWvv0TE2Q8Xn5csopqmrnzqEaqyhEncAOvKu1fAlO8RiQlUEMvP/Rtp6vWK2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(86362001)(81166007)(26005)(4326008)(8676002)(70206006)(70586007)(16526019)(8936002)(508600001)(7696005)(356005)(186003)(336012)(1076003)(44832011)(6916009)(5660300002)(7416002)(36860700001)(2906002)(54906003)(2616005)(6666004)(316002)(36756003)(83380400001)(47076005)(82310400005)(426003)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 23:14:59.2076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c167ff-ce42-45cc-9562-08da3791e5de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321
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
index f598a037eb04..a214c8df7140 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1786,9 +1786,43 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
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
@@ -1824,10 +1858,13 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
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

