Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D193CC5BB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39996EAA6;
	Sat, 17 Jul 2021 19:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5726EA9C;
 Sat, 17 Jul 2021 19:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAOkMWIGiUT9+bovwCrFqBKuQdso/xYFu7FdAj7Bd87Tzj1ObVwLdm1Y0uPK5pF6nBMDNBUuwQfWAp7qTah9zlPyv2+ZoSu0lpWqW6HFrP2o/17HhNBTqmxYKnGX2rEAtRImvog+pjwH1KMyJrhVXwC1iJbPxcrdd2bH2O5ZKGSZC3mG3ygRyavpbHeNqrNZA0lyQtpiH2feUlS+BrLUTs7V2hcMhTBEa/1Qq5xEKYVKC4BtCYwmC0wofpeQKVnpBW8BnEHyVx3dk35AIRICF57tMw6jJSEl8eJAZ0LSgihHmkXl2DyOBFuEOY1MCQ53Z9H1GavXv23XFuvaZZxlYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4+r/IEg4rDKbRnDMnysY04/FdE2VvCumV6SQrZ8RLQ=;
 b=Y5Txbu9MIESUJRApkWmBO9Siai0fotCgMUF8AQoMbsOxHM2K6iVQpp1nRFeQlFLVc/5mpvCG84QOqQhPIENapY2+0d4hFHJfg05wAUw5HaHBYwiDTD1N2R6ITmr7DoO/lBKaH5YF74fpqRPYD184yieeGtelse00UUFJPk915QrBnFmS46Jg0mPmWKZHc+jpFTmTmCR2NUjCRQURN3OGxh1NY9A63B1o4VEY6b3fpQSb0gGjFa7uqlcO4LhzB1ii/rXfUEmYwZ9rnhI9O3gGxksDpZNBYowEWrZa1UjMO8DFp5V+qdTLIoHLd3RYhgvEUQxHKV4c4UxK8D/3Kk9pkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4+r/IEg4rDKbRnDMnysY04/FdE2VvCumV6SQrZ8RLQ=;
 b=E4K9dcbicy333R/yJnq7OE4LDM5EeBgHbl90Ev+TMZK1CkbrIOIOtetdhDCMAfBKUvUadH4cL76nusjBIYYIdCQmwuWosKoI0EMHKtJ/B3c78JAvkrfFHBBWqR2YsMQBmcy/++PcIV8IHTO/7vI85kg/pPEC4lKK7PIn1bLxStU=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:56 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:56 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 07/13] mm: add generic type support to migrate_vma helpers
Date: Sat, 17 Jul 2021 14:21:29 -0500
Message-Id: <20210717192135.9030-8-alex.sierra@amd.com>
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
 Transport; Sat, 17 Jul 2021 19:21:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d137e190-98b3-465b-ba1c-08d9495820c4
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB46706BA02A394DB199A59EDAFD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YAn2JIMEjrfipjm4vfO9mBeSy6bG9/qOmvtqPBmAocevSDw+quy+ShOsc1Bj4G/NuEFwCfR5EVrOUINfV4eocv1sFiOAFvOitqGScIqIOxzaFZcqOVhRx19hzh/ANjuEpQn7b63EVPGyrX68LRHuTFukSpKEKTHIkyPKO8PAn22hrei8iC3xBfz8skbzgcj4a1vMQuvFGes9NkLFUz6d1TVKZEofYKgtvjRvQz22hc20LsSct1jpVyAm6EZq2wn/qtF/w/Jtrsld5Z0qVCzTl87O4wEpLUJuGGqb0f0xVscBVq4YEAyd95ciAyfqxTL4TsZNA/7O+HX3s8cdDx3Yvx/Q8Xq/LbndAsYTOZaD6vs8N7VXJqbicRtbgur8gz3Bmhn7JrIpLVUlo1teRHuJ+Ap4aIkVctym6/MyULYZXcSRNMY5ui9n5ciO8OCwtT32rJItqlTuFsMd6KUMsKrXO9bEpjHj5UACmSJmu9t6KXCdjmdL7AbIkNuDBp/Pb4B3qPLl7M0FhzHZZYo6XoPjxZyKSYV6LJO/IYOHZBcArde4Tsifaf1HzoEQZOcw9QDzTu2Hc95BOY3bcM6eNbL7PVcZH4Mnh5F7lONEDpanXYngs4HMpQJYW3/pFeSSec9k08EQK3dZZiAur4R69IeHpVZGyT9te4qQ+cv5lkvL1Mbcs2NkpzVmcmJO8SenhCFZoDB3NWAn8DEgJXZ5YN+vpSU0JDqxXRi69r2Uwgi+8XM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t380QsiiYA/318jCZ6HqbVL6eK3K7K/v2C5S3eCMdXmq4bnJY4S3Akp7UrHm?=
 =?us-ascii?Q?uPbartPtep0EETxHTZwaP/nAn1Za/5/nt6QAHcN/GoZ3TZ7KtV4xvjRIahhY?=
 =?us-ascii?Q?sQpwSw1ksiaDZx5NLcJKEU8Gttl+kQBKXfvt8VAhmwplqNqXbKx/XinYwFix?=
 =?us-ascii?Q?5e0a54OQxahmBh78/G9HggcoADqHekAEojCXQrjaJCQzTHVAj/FZ5rBBePks?=
 =?us-ascii?Q?MIVP6JBBWR0xTyqcAW63fNn7KE3JDAwzGM8ubxnTpT5zlLszJB9jcd5paO+s?=
 =?us-ascii?Q?yzijHcvUxKa81I/+yqoVGpY3uYc6FDOmRL3jpOxkhce2Lah9NznMmczpp1GT?=
 =?us-ascii?Q?enihq9jxPxSeEgg620s3a4CZHkqBDTvHzW/Z9VdVKr9bL5qzZlYrCqd0IioI?=
 =?us-ascii?Q?9SC5hKxPFOy+aihKaJ1KLFutf12LGc+KYTGa0S7/jyp3mwonYt7jONsH+QJP?=
 =?us-ascii?Q?aRNYRXXUVUlTCaJ4d4KoXf0K68DV2AzRX4AliyQA+M8ZMPbO6x3N14/luP1Q?=
 =?us-ascii?Q?qKPw3Sm3+xPlrtv/5mbIOHZMXZMuR3CzyP/4VUAsxNRlMu+tck8affcS+Csx?=
 =?us-ascii?Q?1sx6I4wmAMrH4+8gsWuwbpIIbEXbFHxb0XIPVef8t02o4cHhsqfWAxM6hhUA?=
 =?us-ascii?Q?EARJ24Hwg0Ilqd4JidEGb30ZcUw2Lg4xNnenjyWJpz++ZZ+h8NmYwy45eLAO?=
 =?us-ascii?Q?r0TNYgUF/3/cJZiH/ace96TrJQGr0tlTQiW3jUFEn5jS3nUh5WWAIxDyQA4r?=
 =?us-ascii?Q?XvToGXkMwVcbKtCaqpiheiMykBoxbVlSDNPq7mvMYOtuC649rARqhAT6ZeEq?=
 =?us-ascii?Q?/D//6Annn6WxYFW5QRWeNeqWq3LX7YuSB43CS3xQ9E+cJsxNM9Xsrh77zngk?=
 =?us-ascii?Q?YKU3mmiCAwkyMxDuzvRI8oaTHnySLzKFFxPMkiKtvFwvYDhE3Zfi5yM6keFd?=
 =?us-ascii?Q?ay5+UzdeWqI1B8OMpV+rXS2LrymSsn1qPy3s4Cjw+hjZyM6JEJXToXPGEKM9?=
 =?us-ascii?Q?gxhT2wITLYdXov0M2wRf1W90GZWm1o5EylStfWiKZVP4TsfZbwVSJryjAAQt?=
 =?us-ascii?Q?JpP1HfIVOBCSKNApyEulXgCR5Di/D+GmvsgmYqhRMDzDLr8Dw6IBf5qVtp5U?=
 =?us-ascii?Q?fkeDcHzyAjxS6A4oT2N7Ka46aj9XnbD9lcfhh2RibX1QOrE39mRk/Pp2Dtfx?=
 =?us-ascii?Q?fKMDdpfPFuU9/LkLYeYsu2rFa4r8lZ6iq16SVWR5Nm4fEbkmJS7wdrmZsDrr?=
 =?us-ascii?Q?2OoUxMVqzrWfNioLIocPYa3DkFn/xw5wWU6PFQHicHhCXi7soCUg9dsRGMuq?=
 =?us-ascii?Q?yQQN1JcIK1TvNCxuIHVCD2/2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d137e190-98b3-465b-ba1c-08d9495820c4
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:50.7161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzlQhrrYA0aG+FokRuRQBTuOzlTOjlTKwQ0rQ/A+Mt4CwlRj6ek48ZlcDqbuR9vamHwg6Kr2Kja7kXaXnHbnmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4670
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

Device generic type case added for migrate_vma_pages and
migrate_vma_check_page helpers.
Both, generic and private device types have the same
conditions to decide to migrate pages from/to device
memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/migrate.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 8c2430d3e77b..7bac06ae831e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2602,7 +2602,7 @@ static bool migrate_vma_check_page(struct page *page)
 		 * FIXME proper solution is to rework migration_entry_wait() so
 		 * it does not need to take a reference on page.
 		 */
-		return is_device_private_page(page);
+		return is_device_page(page);
 	}
 
 	/* For file back page */
@@ -2891,7 +2891,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or generic page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -2956,13 +2956,11 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	 */
 	__SetPageUptodate(page);
 
-	if (is_zone_device_page(page)) {
-		if (is_device_private_page(page)) {
-			swp_entry_t swp_entry;
+	if (is_device_private_page(page)) {
+		swp_entry_t swp_entry;
 
-			swp_entry = make_device_private_entry(page, vma->vm_flags & VM_WRITE);
-			entry = swp_entry_to_pte(swp_entry);
-		}
+		swp_entry = make_device_private_entry(page, vma->vm_flags & VM_WRITE);
+		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		entry = mk_pte(page, vma->vm_page_prot);
 		if (vma->vm_flags & VM_WRITE)
@@ -3064,10 +3062,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		mapping = page_mapping(page);
 
 		if (is_zone_device_page(newpage)) {
-			if (is_device_private_page(newpage)) {
+			if (is_device_page(newpage)) {
 				/*
-				 * For now only support private anonymous when
-				 * migrating to un-addressable device memory.
+				 * For now only support private and generic
+				 * anonymous when migrating to device memory.
 				 */
 				if (mapping) {
 					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-- 
2.32.0

