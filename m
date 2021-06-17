Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61FE3AB742
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922616E923;
	Thu, 17 Jun 2021 15:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329616E921;
 Thu, 17 Jun 2021 15:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PW3xktzr3m3ME7MrEJasHHaBlVSyI0j6TdkPvJhkssdDa6KYs547nCd77loAMblD+h/iQhmBb6jOp8jupv0eOXmS0wglrD2cq6QawBkUgKLd5w+s0E07fHZ21RVvmNHN7FuFxINLcXunFDWJJRkKtodv46SvRQPoWMSq26Guy65JEUG3X4Q2npfu/d3uQJ1ZfJGXcl8FP7wrp+WFf56aASGZyqzcCH8DodiJtTk0UqVTQ0JwcO+hC74EDhvaHhwXhFriTfHG+JiB/7k/876EXUJ36+gVWlgYTPPdm91ts4lbky95ntvOilPHweJp9Ehkk2cO3jZGSvNnOOJ2sXDXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZgqia54AVI+Kdm1/0jPmLtYO7Hb28fRehM2Aoj8kH4=;
 b=ALXcm/f9jPIFGmFUwCeEAvy5qsCHqEZjR8MxRwaA6/RgSlWa3keMLmyCeW4TMnvlqnEKmQKGDlA78gS7Ccru+M/WryaysUhQkgtaNrV74RA0Tvrd9d4xkaLuk8O9Ca6qINzAuJ2Bf1aUvZD+5In9YBuYl1bJXS4aKK7DgAYT9cqasOOtwIEq2KKP2WePeyj9wV7/tD6IJJu5EFvlfPo5zJL5UN/2leAr+LnXRSn17zA4KwkP0YL9WFUhzC1uD9234rTKTb+rs8s1KrBQZ34LdDf3o/WBlN9Wi2EVoJ7gTB2BF1HLpgFbUbdB7YRB02H6IDkz/h8Mu5iPQRR1e1iVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZgqia54AVI+Kdm1/0jPmLtYO7Hb28fRehM2Aoj8kH4=;
 b=zBFFmU2RXGZGKOX99mPEH0uxQft5nMj1fo0avFdHYuu1iPQ2gT6CxmqfI8U0JSC74F8haq+BfBqys7NyWdO5urdT5hJm8cnjWF5FEF/0bAT1kJrzrryuM573KicpiOXj+UjuY1B927ayHnPqjYzmv3JTST3F9j0IdyKjcKMwD1w=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 15:18:35 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:18:34 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 7/8] mm: add generic type support to migrate_vma helpers
Date: Thu, 17 Jun 2021 10:17:04 -0500
Message-Id: <20210617151705.15367-8-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617151705.15367-1-alex.sierra@amd.com>
References: <20210617151705.15367-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0501CA0088.namprd05.prod.outlook.com
 (2603:10b6:803:22::26) To DM6PR12MB4419.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0501CA0088.namprd05.prod.outlook.com (2603:10b6:803:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend
 Transport; Thu, 17 Jun 2021 15:18:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d921e58-5cca-4e99-ef86-08d931a32c7a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4419CDDFD4531EC79C347D53FD0E9@DM6PR12MB4419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qls6dt6MzRhLYoFLmuL6fbvAgvDLEDIDvU0d46CtoDGbreN+JWNOWhhc45yXwF3io12KVm37pojKNxKGd1wvrnrS7jfjc7S8WxBZcXvWqmzveurDfvu8xq2nBd3HOC8UZvkgxz7HD2sbvP3bTFix6nu4PsBtXErH0ta8BxreXHMhDTnb8deKNZi5o1tMjq+7IYQszn2LAUJ/8s66aIgSiIA783dlrd1vaybZf31C6UZQa+PMFRjGfjVpYyQKwIhmyHwLE9b7oKkHAkyKx3RYeFjyZ8ykjMFOGV1LKkswMl+pqaNxprcziPqG5dr8G+IhgEM7AYkp+udKyY8mzc3y7o9bcst+bMC7Q1PIg/S96xbU2kBA0MP9oltz4R24DaGBuHi4U3V6MxFHkYOIvH71+O1ZrebrXrcsk8bbKPelufOe5713QlG13bnXquCpqDsnBZUrXqdVr72zFOKJ0A7YE0fXrF2ENEKeglZTCujZbO2zorALn+tlI1wzAvhROdiemGIvHzg+yywpeO3BrG+z5P/D2ZY06C3LmNxt1cwyuM4VYd/6sP7mFOfihxZXa4Yk5+/c3JD/1ylB+WBJaChJRVTHv+6JulwQcz4tMrpm+RRfbV3pgCGg2xD2RkfNfCVdAMGb8yvk4j9FPVhy/IHimS1DSKVMTwe6Cp3bWQmUIImiCNdEBdgUDwwgKN9nKj5x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(8936002)(6486002)(36756003)(478600001)(66476007)(1076003)(7416002)(4326008)(2616005)(956004)(2906002)(6666004)(44832011)(38350700002)(83380400001)(316002)(38100700002)(26005)(8676002)(5660300002)(16526019)(186003)(86362001)(66946007)(66556008)(52116002)(7696005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1OFGwJObpRttQ8uvgBnXwRJSF7WjwNMhdVjeA14yoyBt0EzsUx7Vs2up+GQV?=
 =?us-ascii?Q?4xU5Svv2gIIEPcpxG/5WvYhegFF/l5wM6rGjMmw4494V4QA/EMEQQiOl5Tq1?=
 =?us-ascii?Q?xk9iJc1p7o9e/kt85bAWmpLgdXjQuxXq1BwI+YFod6I+fSdXSU4Iz6k64E/Y?=
 =?us-ascii?Q?F24t9TGioDhPSCd9dp6BB24NpU+37WAII1MZAdtQNXb9yVCKuAhdIO0bYo1g?=
 =?us-ascii?Q?ahzfrys1Y5R73vmnP+EOXIWhmsPSr/UTXHk7EnbxACCxu/X9uyOkzVLy7euM?=
 =?us-ascii?Q?uMOgqVQL4cLiJQ0EG51CctGQwK3+/nT1mrq8YutS6MgEytGzCF8Uh87Nskor?=
 =?us-ascii?Q?x8yw1yqr1NRfeXVC1+9wC2Qs6aijycMY4KgRnbPN6lI8lMiGZfm/y4R5F/14?=
 =?us-ascii?Q?Cn9/inLICuP/Lo0NdHGBzDVkcZcX4NYYOULhvHXrOVpjJRf2GiHiPYG4QDyU?=
 =?us-ascii?Q?Aceh2AzED/JjTrrFKDeoP4X7Le32ABpkVoMHVnvzCxMi2A6erYt2xFdYyORc?=
 =?us-ascii?Q?vg1Ciaxbm9J6f1LcZeEGKPoGPJ0Es9tSLwbHsAjRF7MGZSt1i5np6kftMv29?=
 =?us-ascii?Q?FmWkIjpPR3KDt0JO7sVXGswuxRfL/KPitHz2sKQ5/NhTwT43i05UJrGK7zn7?=
 =?us-ascii?Q?+knKAIlMJbJTNsPKaNc+ZKOrFjk+eGMFyy4TUWaTD5tvHy5Bv1CcMInomQQK?=
 =?us-ascii?Q?g9heey5Y2n32kFMyOyYuyqQnERM0N9kz6Vgq5cZRPa9IUyvs2ECc1MpRx54O?=
 =?us-ascii?Q?iUcH8UJP6AhMxUXG9hU5vGCt9yjU32IH3L2uqhMFXiE8kVEM05aAwxSN5EQD?=
 =?us-ascii?Q?oK6MF4icSo0Fg2hdQrjQ/WryTes7x4+3J9RvlCoc4BSP45J/ayJXZJNYuHms?=
 =?us-ascii?Q?RAtrS9BhQu2xGQ/yiQEs5nwrbEkOmrc7MGBD7TIM1KUbusADFFP3/TbgxyJs?=
 =?us-ascii?Q?j7Acj6YCoyDboRC2Miz1U3pfILxyvDVuS8pYiDj9V3wEfdaB+9qRwFZRJcHP?=
 =?us-ascii?Q?4imrrDP4Go78aoo1N/XrhBK02+VixrzapByDjC8md3ue2/gk63oMRvx8PVfx?=
 =?us-ascii?Q?5c/V58iujPrn47YxbzLJPNqG5saYe3zcboER3SM5vLZmHoLz2fYFHMds79SN?=
 =?us-ascii?Q?xyG9iXUHiag5l7kDhWnya/CvICvz0k6DaNqN6JW5/npnFN1l+uVD+1zbsODT?=
 =?us-ascii?Q?yyMFm9DiIaX4UDYCyW/FeO+hsHYVrYFtST1ijOoQM7cOg/I1I/rVwtEg0o9Q?=
 =?us-ascii?Q?5+ZsNed7FBthuUBFlewDCboo1SGizsQFXaktQq+gCOlBiuGyh79baVY2ZLVi?=
 =?us-ascii?Q?c5quuaW+i0IhzZ2lfFG+M6UD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d921e58-5cca-4e99-ef86-08d931a32c7a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:18:34.7948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9mCuAFTJBTl9eO8i+COz5SL0nuwpk4G2mybXmDDvams8kQL46c+rhSjya4NyU7O3UMWZ/fJGiwfa8zk7cDKlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4419
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device generic type case added for migrate_vma_pages and
migrate_vma_check_page helpers.
Both, generic and private device types have the same
conditions to decide to migrate pages from/to device
memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/migrate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 8c2430d3e77b..3b6aaba96fe6 100644
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
@@ -3064,10 +3064,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
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
2.17.1

