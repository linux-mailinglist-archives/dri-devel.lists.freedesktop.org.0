Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67733E9E9B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9EB6E2C7;
	Thu, 12 Aug 2021 06:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7763E6E1FB;
 Thu, 12 Aug 2021 06:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pwv2VDf1UgMXCw0ZS6SBjNJOiYON91wwgJ47lYldZ65Zb7LbQhehCguhbNwseNNeZAX1xt2KyE9hrHUFS7rOJqamSpj+NamOYywclha42xPRgak1s7drTGUBnDpgaG5PFcZIddlGHcMpWwpop9AHCcC9b9D1tI2mcHjRJ400fmK/eZOEUb3rt+zRif2jg39e0UO0kovP0BRkTt7AzAADVkGEjW7Ar7FpZWLIrkuD+Wu9g5Ae38Qn64huDobRLRin8BzRzI04GnX9w13zE7U2fASAjfH5w5qfUz6DZjmuq00QMarVDsoZng5VPjZzft7UttyN8UcEVCOc9bre/Ld4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8+FHqCxZMWE2MGo8d+i3OWYO1BTKn18xW++LCna8UU=;
 b=g3vK7ewIkj/OgxtdD+cofM4EJDzsO8nUDX96B1oYGMhC73M/f9i5iacqP6NgnjYuEda3psKuvEWP6hpxToX1i+vqmarP1Cfex8UxmpNJxubz914VDODbpEglsmvwt9AjLALmrrp55LT5i4KjrWgMq1p8JwbRTwJ5B6O3BKFsXzVhi/uysFZr/BFVJRG40FZnFu+YTVNfenAJ0ic+PJtQGoW5gpcKBWsRzovYGNrzwZ8klx6KMZU9Cc6DDtaQgvoNdUKurD1IAfXrg8V7qmyRmIVzpS3FfgJbxMWI+eCMLARfq/9wC0FeUIGO25H+fttolqEeJnEPwrdoLCDziZdJHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8+FHqCxZMWE2MGo8d+i3OWYO1BTKn18xW++LCna8UU=;
 b=Ddvsg3hHYLCINiXIlAI/revn+Si8jmYBtm8DGUaAb/5/MsjIQ0EOhiezuATgp9RckCrK78D17wkid7vqB06r2mAyeGYDPm3sKy1uysPOwoG7TWjS5sLX/fD5BJcN2s7JbimO4cVjYeAG5whl4suxqg0HU129GTpW+f+WPB/zKUo=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:22 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:22 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 04/13] drm/amdkfd: add SPM support for SVM
Date: Thu, 12 Aug 2021 01:30:51 -0500
Message-Id: <20210812063100.31997-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812063100.31997-1-alex.sierra@amd.com>
References: <20210812063100.31997-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16de818f-c95c-41db-e02a-08d95d5acd2b
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24480057891D8D7F63870920FDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kl1CcyDJN6HU509hRQWCX1VA4KuvmMOeoMfUyOTxXGkonQ+zsDYRri78/CaBByleEMOCwZxpv7AXIEPTRPoqnzy1BbsuqqEDr2vBHtj4641eD29oW5gu19oLGq0audt8SEJ8VVqszVk5FSvybVYOJbZhkv+t7RZnONcaNepWWR0ZWSkHK1IK16+zFwN9GFnj6ELI/3lUl5wjlLwJLY9Fa3lCorbyPS2dfZe30thv/BbIx3B3QCDHxwpjctGBNUBSp4FF8wEimcmshJoGux7FSoTlxjPjU3keFW+2DH0GVW12tdz3AWqOkvXEdfO3soULxPL5H+21emq3RI61F/y8SOiCpklb0Y6xNDxU+FwWKafd5nNuf27Y6Tk+VVwBgWVDpFp8b1iD3kw0kBxrETfYbf5y3Oo3yTB3o7cupCNQNdODx4ykucXfs3QJ8sWgF62oDfW/RGFIVK2rd3vZvrqKovV9y7/U6KPljnHunBIONriKXtI6gVhd6uacWttkEgjPa6x3ThA6j8WVHOx1rCknF97zSzk98Tka1PhLuh8HaHR6NBXK6TTh0bMAgZhVRtQLwOKsDqEHYnxdeuZtkQXuoGOshbROqC7G1BKDk8SlULU1EI09QK092QCjS34no3iWmKkwtJ0Lpe2eHjM+AvnZ1DMXasQSvwMekfmMP6KxJnPor6V5TXf2hyTjwb3jIPtHGYCyyRNM6x9hwR9wFN4D6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Z24/f/WiQxnYwuOcbwFpxok5ulbKkXXQzAmRmUJDED8mFjhvVanX30VABu9?=
 =?us-ascii?Q?nDVyYmE6haCKIqAAG3AGwDt/H4ONk50YW0r9k4bPvYRjKl9woE07TkhIENrV?=
 =?us-ascii?Q?jgp9zi369wgfsj9fDefFEXrL55QfwCdBYgVxN/jmRkrgI1KVbOI8iQ6M+xh0?=
 =?us-ascii?Q?fDV1gZBN+MKVu0j7luTQiTBkDljGYsMe0mg3p0kcYJUmo0nHQWLe4eNXC57p?=
 =?us-ascii?Q?lnIdtWb9YIZ74V55JBdhYAglHk+kXLSZPCg3lZmf23ItvwpHYapLqBlgdWV0?=
 =?us-ascii?Q?Z5tAAwMVkoXdCzaVsR8TaoVt3+3Mf486KQq9LDN2g9pctVgv30u50PbhtrVm?=
 =?us-ascii?Q?z88CHZFiwEirVgeVk/ijdGpql7N3hqMbII7UnvYVQizmA7Ik1m6Ss5I1tj3x?=
 =?us-ascii?Q?WeioulIya29fr6czfqIR2sRc/tBHAr2LI5MKG5KIeY4us8k8UMWlcXueG+Kh?=
 =?us-ascii?Q?nOW9SfO1zmnhN4l6GQpmS+ICiy0JYoGaKvOAFOdm3wchimtOMho1jqYlTjUr?=
 =?us-ascii?Q?bzoLij6j4a3UXK5OoXbOXaswOMv0gy3wx2TpYGJ8yI9Grb0Hpr4/GNYdF+FY?=
 =?us-ascii?Q?X11jK51kYC7GssezogRfaQO5bewYp2/PmJtQF2PwQPKDzFJu9E02NrMJRykn?=
 =?us-ascii?Q?O66WzK7rq+j1DvjEgycyP8YCgPRBFB5g3FaUDpxMYbio3S9FDMtUUyaC6jN6?=
 =?us-ascii?Q?2PPXfCBbt6QrOe3MWwqa336Z9dsG0QWlldxc7sltRqqSHZPQkxdoA1UAmKMx?=
 =?us-ascii?Q?etZ53jYQrFB374QBdoW0qKG0xhVBx1QrUrB1DlU6HqUU7ERGIAODearGtv/Y?=
 =?us-ascii?Q?b8nhlQJUmW5aqrL0kpqphRLwo8mJeS3KcNVJdSEMZt63+uV3SWWnnpIllRcn?=
 =?us-ascii?Q?ufEvCdcvClqJcIQd29yKn2K+HrEbMWUESB7USjdpDVCU6TuikiXEcASd1JpM?=
 =?us-ascii?Q?YSpALF3l9ZNYEjHBxiZyxlsPcelGv4ivKITFED7SJVZ48pSP0/b8KBZ89/JA?=
 =?us-ascii?Q?2XNrPm3dOV6Sd7LpvNwpdC6O++c4xjHLX9R74a6hHJbNgynb55YjkJKV3L88?=
 =?us-ascii?Q?vdfG/U3a0ZCgWYieCCY+CKJmLuMYLN3gDEfquFgx77BQ+XtFZcUZd8xIg63L?=
 =?us-ascii?Q?Ncv4/Go4fTNtKc0lSHYHKpUDsZy90p5L5zCIjQzyGkBaDIzhtw3vczIrqASz?=
 =?us-ascii?Q?yEshmEYsT2u/DPMXKST80FGYGbXS5J/TEEnNd4LB6EVZA3bwlTe84Zj3MM9g?=
 =?us-ascii?Q?Z21UDsAi7kAif+GoJiDUoO9WewM7a/HhumOJdyMMoKRuGqDannS5Wl/TNuSB?=
 =?us-ascii?Q?CVoNxj6WSH0tvyPAZEbx8Q71?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16de818f-c95c-41db-e02a-08d95d5acd2b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:22.1699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7oselxoMfhhxgFLO45R1/e4YmicJ7ifVwDo0F7o+g10Butiy2oiT6S8EAHr3dYeQFiCYRZ5UkkFT5lTirf4PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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

When CPU is connected throug XGMI, it has coherent
access to VRAM resource. In this case that resource
is taken from a table in the device gmc aperture base.
This resource is used along with the device type, which could
be DEVICE_PRIVATE or DEVICE_GENERIC to create the device
page map region.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 21b86c35a4f2..3e9315354ce4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -916,6 +916,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	struct resource *res;
 	unsigned long size;
 	void *r;
+	bool xgmi_connected_to_cpu = adev->gmc.xgmi.connected_to_cpu;
 
 	/* Page migration works on Vega10 or newer */
 	if (kfddev->device_info->asic_family < CHIP_VEGA10)
@@ -928,17 +929,22 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	 * should remove reserved size
 	 */
 	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
-	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+	if (xgmi_connected_to_cpu)
+		res = lookup_resource(&iomem_resource, adev->gmc.aper_base);
+	else
+		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+
 	if (IS_ERR(res))
 		return -ENOMEM;
 
-	pgmap->type = MEMORY_DEVICE_PRIVATE;
 	pgmap->nr_range = 1;
 	pgmap->range.start = res->start;
 	pgmap->range.end = res->end;
+	pgmap->type = xgmi_connected_to_cpu ?
+				MEMORY_DEVICE_GENERIC : MEMORY_DEVICE_PRIVATE;
 	pgmap->ops = &svm_migrate_pgmap_ops;
 	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
-	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	pgmap->flags = 0;
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
@@ -962,6 +968,7 @@ void svm_migrate_fini(struct amdgpu_device *adev)
 	struct dev_pagemap *pgmap = &adev->kfd.dev->pgmap;
 
 	devm_memunmap_pages(adev->dev, pgmap);
-	devm_release_mem_region(adev->dev, pgmap->range.start,
-				pgmap->range.end - pgmap->range.start + 1);
+	if (pgmap->type == MEMORY_DEVICE_PRIVATE)
+		devm_release_mem_region(adev->dev, pgmap->range.start,
+					pgmap->range.end - pgmap->range.start + 1);
 }
-- 
2.32.0

