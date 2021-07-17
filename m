Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED70F3CC5CB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159396EAB3;
	Sat, 17 Jul 2021 19:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3706EA9D;
 Sat, 17 Jul 2021 19:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuU1WKz0pcQ2KNyn0dUBjYPKgqHsnIdz2HMYV1+lfJjM4af5z2ahNV/r/8L+1RAtx/ScWRp/SL+53u98w4BoqAOX+BGQmcWNjwLHQwjiG9JP1ox012pv9yU1bzJpCu19m/XxmbBdu6apj83uyhZbglhkt+6SYZoqpRWQA2Y40pfKFmVomicC691w73nkseZI0G5MYf+s/nY02Igcr4qxhqVLPCcLNzmeVmy1U5yY+OtLw3sQbrdiZDkzcOPpz275ubUfju93iCL9TO7UirdRkCTKraJKJ6rj+O5hdxMNAtJ6CTvTZx9MmIFAFW/XzGov+8NWn4yBhRNOiZ6Iev2bcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8+FHqCxZMWE2MGo8d+i3OWYO1BTKn18xW++LCna8UU=;
 b=aW1Eo1BsCLLTAJLcArQd4nyhXVZ6BW9uIksAUX/68kri5agE8tKBgjEa7OlWYbufovBK6jY4xtm1PKSdp/YkmvkLt19RbesRfFxMw0CB6kx3ZmWUQM2C8qd+H4Vsp9bJhehS0kcd9VH3wDQdBE11BLYntFziHpKcQYX5PCAjVKZkDDJhNwbC9IQmbgYDmsuqu3AP5L76vCQ0QcW0urI0OBwf/uPhM8sGf01NxJWmdYqSvzzy+2gRyaS0Tq5IuaqU1CuFDqVVJIghu8UNld9U6pT4oQI/0l/bEUuU64drARBE8MF88t8m0hxj0rkqAnPeMskV18DMrTWSEHrddTKxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8+FHqCxZMWE2MGo8d+i3OWYO1BTKn18xW++LCna8UU=;
 b=TQhGgDTPYsdEOJtDf0elx2P99zppZ1SC244Dtcz4Ljr+p805Au3Kz0ItrhP70XiJjSp2HbBwTe3D1LC3tt7pRu+ygUfqz9HYvehVCvtUSfmkabwunLossInme7/DmHELt1rNubBAPGIEOncdCXfGPOr5xbGlyKQlpIVlohCiTzM=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:55 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:55 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 04/13] drm/amdkfd: add SPM support for SVM
Date: Sat, 17 Jul 2021 14:21:26 -0500
Message-Id: <20210717192135.9030-5-alex.sierra@amd.com>
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
 Transport; Sat, 17 Jul 2021 19:21:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e61aad0a-3be3-480a-ef97-08d949581f90
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4670847D8184FF0173995E18FD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1RQ93P4vX9N3CaGp9x7gxyHCrctCYYnpZ9wT5Hnq6mNW0gulF9xY427hgFXxBnLoWzED3KeHiwdMRmcQenFXVavrqLfZzxdFbWiG0vLZZk1RAzDRTElkuWzbvyNRN7BM0fUbvlOZiVHyGEs8dqUVbxteTW8Fb2L1MjYpW0bpI/DCy+lGxkSRntPtVD/NhREoTpOse6+HXxGqWVGYaGppOTiXcxjWSsGQnzqs+3OywHhbwHMeDCX4gcZmCNhEeqaVisH4eiFkmY6G1SmXGWIS1op25MRyE7/cXPuZcdEYp/tVBB/OxNoaOgEnCPRbaXaK+hDfVATDZQSlYvrOm4avZtZVpXP1p6XHWkhqIVCBVqh39dfGqb+/4wKYqlI3F7DUv5m64COnsyGB0/aJlqNkOMhAC49i8XeDpqbZQXLyYzUfQw3HyKt9Nssq0AMm03fXMjrY+hDLo/+4BOUCmzchEDkkAM4Ah+qRVFxcO8wIJZPI4u9wvyadC/SwR/3pdP2DcX6MBBY3gs0R+tnYuH8/C0S6wfGF8ydxFNHwiI2egNSG9+HqA0MAOBYsw9w2FWGGIC5P0pXlk+JHZ0Hl7fsaEOBQZjEKb+0fjNG+e18MxuSRN3gmQbRME4kC5DAZVp+2zrvx++gJ35ApyvIHBJBrVp6JLauljzdqfNne4DSzplrJPr2a2B6i4hOfPs8kNoKGA73JDfhb6Y0vYPorRGE8zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IV56DqPM12YVxLqGBz/9Y7JuuN4ilJDgzNezzLhl1xw+wYDtpDq4l70CoyTb?=
 =?us-ascii?Q?Mug4U2bS05pXgBL/kWHqQy3HCs9ODIb2WHIxpVjvb2CM4Kr8aER6CFcxFLqM?=
 =?us-ascii?Q?xLZeyyG9Sw+5BVItPfgkHgc/dtYegOSvP88ZEf6tWWy6ilLXk3kJEQkxlHdE?=
 =?us-ascii?Q?Vj89lE9g3G5bkbQ2LS19/a0a1KAgbpHHE2ot9t/rfD9wc+1R6SPeh9b9VxlE?=
 =?us-ascii?Q?uKHFC10fchJjKN2OVkdKcCKNRx47OsjOmrvKXDga7KlYc9eu2crof33fiFe7?=
 =?us-ascii?Q?FP8M+XLRzlC3De8o7u7Pl2AnTCsNN/w41QPOs6CGTVE44yC4BYGq07Vx/Vgq?=
 =?us-ascii?Q?os61VncGkIVokZld3T7l02gGr2rU1FD8IERougln+6zKh/M/k6bVo9JUA0yt?=
 =?us-ascii?Q?ok/27+Z6BbfrHqJqwmd0T2yHZxGdZfoZhrY7zvu22Svdzvw8aLzgGGHXEwTn?=
 =?us-ascii?Q?bLD9+xmMo5E3NeGy/mVtisXbL3MLuhaNPGVXH/1rUXWgj7LUe81HJ11oJcbB?=
 =?us-ascii?Q?DDcjEl6/wfCngJ1yAIruW4y8Lgh2WSLvOt7ae2yYeRKF6yHPlwDlMZzm/l3K?=
 =?us-ascii?Q?+Vv4pl6KOfwKKb2Q429UjuI3bvVJOH/RrH6qOcycPxM/PbQ9WR1Muue8SSzb?=
 =?us-ascii?Q?kWdptS6nX17+FhwCT/zwkYEC91FdOHsQaa7xNbeLKv1s5RwcFZr7HTASdRm4?=
 =?us-ascii?Q?W0XxacQgXaBkbpSbQUFW++oNhUE4rThB2wbO9Y3L9scR2upyBQtN4cXPE7kK?=
 =?us-ascii?Q?scExN1nq27p2mCkoQldX+HOJSMVFVie6/z6FLftXg+shLXROktNMccdd3JNs?=
 =?us-ascii?Q?Lu1GXgf7wAWEkHcAyL9C/Suj47lsapziAZLqFwDhkMzSsuF4tbCe1z1cEucT?=
 =?us-ascii?Q?86n2k1raRy3ikzcuqpAZ1UWPUy5pftH0NsnhAuExLfkKDKF1z/qS1xhYbKQg?=
 =?us-ascii?Q?vL5IAM9xht7VaszbkECy2ZI5qR+7zQFtarZSN0Pyg6xQ/1j/6rSE47VfYoN7?=
 =?us-ascii?Q?Cz0Gh5p/JOdIaPzrbEtJHW+v1Y6bXa3aMksy9/0jbbj4Xg7QZrbrHf4lITQB?=
 =?us-ascii?Q?hqWZpo7K8+sCWsNiIZ5ShjfxFvSg/2ckVjfnwbdRJxdm4541G6iB+QKlfx12?=
 =?us-ascii?Q?TqgB0hQDM3mPwOgTxIhezWsjDvLcc6vC4j8BgksR5Zyi4G4rRxLVwcZLqbb3?=
 =?us-ascii?Q?Cfy4yCtqknss2Su9lZ1C4qQRZxhTJSwgL9XSBzPD10J50rTJaY1bDot5F2Qy?=
 =?us-ascii?Q?LvVsNsrVsX6WRmEVUs5MjuapdxMnlyHtQ8RMwbmBAIjl3QYvsxn83ZfVFKrM?=
 =?us-ascii?Q?8vQVi8s0i+7vvDaWMRHqUgIa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61aad0a-3be3-480a-ef97-08d949581f90
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:48.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ca621ONh9LNu0mPFrw27Eyk/tmLHeGpGe3BmnapLP8/0LzLMlZWCzDPUedimdY1kTiCeyYSNPKelt4UVksOMMw==
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

