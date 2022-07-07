Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DAE56AB53
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FBA11340C;
	Thu,  7 Jul 2022 19:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7BA1133CE;
 Thu,  7 Jul 2022 19:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8ulfenlJbMFZEvTDzle5XmsC6gyXhFzEyM3c/U4dy862ha5HXUEgBVNMzw7IwshnFZGzXF9He80O985XEO6e4gjl6xn7FNQNtaf/Or0ix/4z4MLb3f7UJJ8fZxgcodGyUmwbVukM3npOY9H++MWWfJbv6FTaTMAvrrEXx8Yf2tkzjwEFOysiHB0+bVEYBHbVz6cacJ/yTFs59HoRhJgYNlbnH91CbnV9RfS1B3tIGh+J+ay2NfA6AZGcFNgXOfX3JPmKTLVnykq0vUz1Mf3DEE2v9AbRMZL4dyf+kin7JqYFUyZGkPjopAUlHTc7OtlEAbBxH8mya/VwEpXcrLx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Nl8W8/hNIUVU9uA2Slz/69DCRgdCr/w6q/fROE0rxU=;
 b=kMUj7iqV1dT+lVURTG0iMra3HnAVamTpyNHsTBoQMO560OCi1/mPIxH60QCqhVn+Cxej2hFWimhfWSRRyPpSfVLjUr8G7l44iitdRMegv2dMzvA5fGBnS+3wG72qDLPkbhgKJ18a6iPzVaZ7mMPYTrZTx70vxFpX5UOUvJo9IJVh0lRCCM1tT9mw1T+Eg3wTLmuClkjCzaQm/yZbSnTXRNNXQEtd569FIuBYvM/TttRJ/96IPJQzO1FbOczhoK9mCbsdZaSVwqvyi3Yq4ca3Vo+LT2uyzNDpM9sutzO1Asysi9XzYi0tP9VxDJ6dUQaAnPRbWyCDgthXAFnp7aj3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Nl8W8/hNIUVU9uA2Slz/69DCRgdCr/w6q/fROE0rxU=;
 b=bFMy5D9aF5Kg4BJTErj6huZJv6cTxCr3gvuu9bg2rc0tb9bNLDxFiQxfSTFTa0i5N6UXKJZA/Tvv1T4lXhMRp6ilOj4DJh5zytwit3mPgiV40kf+6ZTeu2PEosLhHf3eJCxGg7BpoHOtfPxUqx3rw1VccJfk5Em4TcA6J7D0p8Y=
Received: from BN9P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::12)
 by SN6PR12MB5696.namprd12.prod.outlook.com (2603:10b6:805:e9::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Thu, 7 Jul
 2022 19:04:08 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::f5) by BN9P222CA0007.outlook.office365.com
 (2603:10b6:408:10c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:07 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:04 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 01/15] mm: rename is_pinnable_pages to
 is_longterm_pinnable_pages
Date: Thu, 7 Jul 2022 14:03:35 -0500
Message-ID: <20220707190349.9778-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6dd8ba8-9e27-4646-e795-08da604b7811
X-MS-TrafficTypeDiagnostic: SN6PR12MB5696:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: joZcpAhDtFO0qOId6GBVWFIWfxbhrxHfpn0nA6mNJxsCrX1ajF809ZjmOCnyaYAbq00wo/WoK8R8AN+mjxpYxcD/DAO21K0R+NGi66++rkFNFJXRw7DgLz1dYhe00C6q57Dwf0UNuqlAWEKU1ElH++LPFv97nLU5E08du7bNPwn4Hwukxy84PKNxa5UsiTkqP0UMQeVQAzS7KLr5xuCXq2GhjkgL+usinYGrYq/iZdOhgvNGlCLm/K2EC0GAa1ezKpTeGym/aobUqfvg7qqrbxqv+U0569qZLo8LN/sibfXCRmnanrij46EG0v28J565qWxLTonOk31LD9IyMptbkattAiBopzUV7My2kA5HgKDxy/hSBQnEGfF+c8/imWXotNf1CYTMm0cQCZPGfs08TiAnnrRSsIbFXssZPf2/6bbNiSo3uxfZoSOJ/RYhDb98bNsUVMbhRM/492+1SNIVqwIlfflx9pAeSq8ljicCWkFzHclPs8BaUDTb0A7RiPNTKdddxHfNEbxwPsksve/fVSPtV0Vz056OluRD3biVNz7o8qgrMbdZKhSbLKNadf6IsXbeRZbxLkE+nkJiY9gnlqn0DBnJYp4WHzG0Qj9P4D+iNAQpn4ZMWfdYh4pYGh/QBX6GsVbtmXYBk9BvEhwH7eb1LMpwn+tzstm6EIVAPrUdSky1ERPK/Bqem2RAbg5ZbPUGqbMVb9KYol/uPLcl7itSRGoQCUcHOgGvcHZU3CRv6THTxoV774qOwYamRLHK6fHs557h3eCLLt/VO+hi0j6tMkQiUT0VFITnNQYvBwlsY253A5xIcWluxLweTut/gieaqp4Daq93mTiTzPksq87eNsuMXGOBhCFD6eIm5aM/XHkeMgeMAhCeRXctMl7t
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(396003)(346002)(40470700004)(46966006)(36840700001)(40460700003)(2616005)(7696005)(7416002)(54906003)(4326008)(40480700001)(44832011)(356005)(5660300002)(26005)(86362001)(70206006)(8936002)(82740400003)(70586007)(316002)(81166007)(478600001)(82310400005)(36756003)(6666004)(6916009)(34020700004)(83380400001)(186003)(16526019)(8676002)(1076003)(47076005)(41300700001)(2906002)(36860700001)(336012)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:07.4912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dd8ba8-9e27-4646-e795-08da604b7811
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB5696
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

is_pinnable_page() and folio_is_pinnable() were renamed to
is_longterm_pinnable_page() and folio_is_longterm_pinnable()
respectively. These functions are used in the FOLL_LONGTERM flag
context.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/mm.h | 8 ++++----
 mm/gup.c           | 4 ++--
 mm/gup_test.c      | 2 +-
 mm/hugetlb.c       | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index cf3d0d673f6b..3b31b33bd5be 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1592,7 +1592,7 @@ static inline bool page_needs_cow_for_dma(struct vm_area_struct *vma,
 
 /* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
 #ifdef CONFIG_MIGRATION
-static inline bool is_pinnable_page(struct page *page)
+static inline bool is_longterm_pinnable_page(struct page *page)
 {
 #ifdef CONFIG_CMA
 	int mt = get_pageblock_migratetype(page);
@@ -1603,15 +1603,15 @@ static inline bool is_pinnable_page(struct page *page)
 	return !is_zone_movable_page(page) || is_zero_pfn(page_to_pfn(page));
 }
 #else
-static inline bool is_pinnable_page(struct page *page)
+static inline bool is_longterm_pinnable_page(struct page *page)
 {
 	return true;
 }
 #endif
 
-static inline bool folio_is_pinnable(struct folio *folio)
+static inline bool folio_is_longterm_pinnable(struct folio *folio)
 {
-	return is_pinnable_page(&folio->page);
+	return is_longterm_pinnable_page(&folio->page);
 }
 
 static inline void set_page_zone(struct page *page, enum zone_type zone)
diff --git a/mm/gup.c b/mm/gup.c
index 551264407624..b65fe8bf5af4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -133,7 +133,7 @@ struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
 		 * path.
 		 */
 		if (unlikely((flags & FOLL_LONGTERM) &&
-			     !is_pinnable_page(page)))
+			     !is_longterm_pinnable_page(page)))
 			return NULL;
 
 		/*
@@ -1891,7 +1891,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_folio = folio;
 
-		if (folio_is_pinnable(folio))
+		if (folio_is_longterm_pinnable(folio))
 			continue;
 
 		/*
diff --git a/mm/gup_test.c b/mm/gup_test.c
index d974dec19e1c..12b0a91767d3 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -53,7 +53,7 @@ static void verify_dma_pinned(unsigned int cmd, struct page **pages,
 				dump_page(page, "gup_test failure");
 				break;
 			} else if (cmd == PIN_LONGTERM_BENCHMARK &&
-				WARN(!is_pinnable_page(page),
+				WARN(!is_longterm_pinnable_page(page),
 				     "pages[%lu] is NOT pinnable but pinned\n",
 				     i)) {
 				dump_page(page, "gup_test failure");
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a57e1be41401..368fd33787b0 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1135,7 +1135,7 @@ static struct page *dequeue_huge_page_node_exact(struct hstate *h, int nid)
 
 	lockdep_assert_held(&hugetlb_lock);
 	list_for_each_entry(page, &h->hugepage_freelists[nid], lru) {
-		if (pin && !is_pinnable_page(page))
+		if (pin && !is_longterm_pinnable_page(page))
 			continue;
 
 		if (PageHWPoison(page))
-- 
2.32.0

