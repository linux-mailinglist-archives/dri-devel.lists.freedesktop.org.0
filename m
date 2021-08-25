Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 922153F6E05
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7B76E12A;
	Wed, 25 Aug 2021 04:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEFC6E125;
 Wed, 25 Aug 2021 04:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZMpd4rgl0KXCAAyYmzjCI+n6EAS39WmezbyQ1AZaaTN4uITXoAcTvoSwu/DJWVNy+29cKJvbjyAbA2FkE3iJ7sWRIWiCglNpXCznxOC220xl4jKDkMth1PJ/kF0lG17YARtM2e7eOuc2St/fczoDah1j7RKiy1wYKZjc0KAIpq3hKZoamtwJYffaT0+hf8JG0zsXVIv9E9L7Wa/0+AqnvTawSq+5s4uEAfGAjRVTREBOA70wAvuPYMmMqfRi5UMw+RMSrxBpPwSj9S8yk/nFC04vZxjZuE0LtQHQ6DjuPmoDiGg4QWDz4gv9TF6qabOmxuiWaj/jblOR1wzYgTNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPRUxG7tsWqwxFr1dU65ZHijp00minGf5doPgxOlbi0=;
 b=AK/lbu4rEGWSae1mX5FHY/vg26+lu+/4uU5IyycDh4r+7h6d7d5sz2VV63ETHs9pSNitQ1UMNoMOJH/J9eYZOKrxPYhh7hcl+VFDvfDTf8dTOIhggAaDb9+a0AmzIXsobxdWyA/x9XAbcqqWPYJC6va6KSlJpyXUvMAP7VPzSd25Onz+hL3mz80ac6QFLylewMZxHDsjGr/otXyJHSxfwAykNgo3tQoqUzi2EcJww6CCK97LvzGb/dOVpR9gZsY6YslwOAjQEcuG4dQ3pOklx5KeE78OiYFGbPMncOKWWQPsZgQry2wadDxoQyLJbuckb1EbQ/7zmE0ulniCBhjNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPRUxG7tsWqwxFr1dU65ZHijp00minGf5doPgxOlbi0=;
 b=AVY2QlNs8hW9u2ijZjqlfyoMtCKB0zmB6vvd0XlqX1PbOrXFPEC0qweOLxc+wOan199ALqdF/JYpFSKR4sDYUi6oWzei1Xjf/JQMd3svi3mlvRktZ/aKoNOV2RGvikzWAoUMLy1V98kfMp9IvGLiRpNFODG96jurIocSuBJBxqA=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 03:48:45 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:45 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 06/14] drm/amdkfd: add SPM support for SVM
Date: Tue, 24 Aug 2021 22:48:20 -0500
Message-Id: <20210825034828.12927-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78952a3f-647f-46ef-5800-08d9677b3cf9
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47501E161102E3E0E7DDDC86FDC69@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uv0opxK7utGT4jsfZ/aFThVWwEtHI6OKBCtVymX002hYq6bkTM4KzJqeXLSWBPfzykA6zQ16wX9jOnCLz2AGhodGlSLotESfhjJfVN2mF4LPRjygl6rCIT9NJ6i/ipPAtfgCledRaY7YMi/QPxmCsDLU/Il1j01cBhda5IF6yx04zjii08a7xTzoIq+vQLk3vcgMZ7XsxPLDj1hozXNtecdjYuKiD9BP0PYh1ke0Nju7OW1mkKbayMbvjIBvEFANijSfbFzZofB7CRh47v1XkY5kT5J9u4TXexXdUe1tdQQNxdMngCUBXOMFc9AM7pxcTFFt2/r84SL4Us0JaQqmCXpKjozgQEIfvr/1iRh9XkU2XticNIrrehlQ9f+7As6wWGCIJCD7SxhtF0btGc3Z+ZTWdll5rNmFVVC2hp2wABm0Ru70/P6SS6WctvewGX4KLEKPgzo6EnGrU1UbUh8+XechxA7oUb933yRW9wpAH5e67jZhYqx5PLhw5ezzqAMz+UaBeLQp6UbnonrFki1h0jWziyX/u9UoInAndTT7KmOa9epFKSihNFa/2+mf81ePNfLXNxZXi44BswxZBpcevHIpw8fAwuOlJMlsRmZRU1dGuee4yevL/TlNUwuqIjwOPDKAhHFy2WAvtNLIDxvWoL/uB2pPo2rymwL4YlrEzf5WIoYGyxt2AWwbRHE1/KVRUPNdsTRbMCR4sRIAvqJoyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7416002)(6486002)(1076003)(4326008)(86362001)(7696005)(44832011)(52116002)(186003)(2616005)(956004)(38350700002)(38100700002)(478600001)(66476007)(66556008)(6666004)(316002)(26005)(36756003)(8936002)(5660300002)(8676002)(66946007)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sY01+sCG6RGFaXDkx/uH5UoNYH8CLyi4tyt5/ZBHOIUMM5sKEOUTM4uQDmBQ?=
 =?us-ascii?Q?r0tapLevWnXChZeXMXL1xjh6g0i8mthF+qgDKGE8QD7h7e5V9z0ZwKUNmnMI?=
 =?us-ascii?Q?FfzMj8LBgJDvDVhyGiVImpBm2M6+JhzsiFYm3RdlLzi/siAuVaqy3YA+urCz?=
 =?us-ascii?Q?1E8GsyGbdd6L+aknRCV3H+p+zM5DpysiUBu5b06VHzyXJXMdp1EROBucgApV?=
 =?us-ascii?Q?pUZEbMYTDKS0GFTKrOyUhQRKP+lhXjh9UzuJ0hPV4tnFRhv+SY4H9EvNospm?=
 =?us-ascii?Q?RgFgOMWSaYqyRRS/xYJ0eh4eO23MQSpsUdB8sp3O3KVzvzrk5LxMs/jJlSl9?=
 =?us-ascii?Q?lgenDa9A3bccJlgqBHr8OzqSdl5ZKwIWa8RSrldTjwd5tq7DyHEUxQ6b+Rfs?=
 =?us-ascii?Q?IMsnXmbFPsq9IHyVKJatSeQstAmruEuVkZRdMIyMSqCTMLnrR+9LjYEdwnpp?=
 =?us-ascii?Q?ZKfhq+AQ9l2xX+NhDf/7pqh7KcGgpBxdwRvo61dwBogVtDaXomOMfyy7SPih?=
 =?us-ascii?Q?24bFxyoOsWxDMJsf2cwnGdMQp8Gzk9WMEt61Z4llHJYjSq9PRl7A0h3/3RcN?=
 =?us-ascii?Q?u/X7kYpT44P61hMLcxPolNlchCIEu+pKWOmYiG5YEbmaKrF+PhHV9DyGJ4U+?=
 =?us-ascii?Q?toTxPP3DK4fLXfgBZtElyRyzU4ZhXqX2bMPFt71Uka7NbHVrFTsCmTEec6Sw?=
 =?us-ascii?Q?9cec9WoI1pDbohm8jEjWKYPTSqEtq8l97Jg/6suSNthuMGBtZnfv5FjjYjpv?=
 =?us-ascii?Q?k2ViAynnF9mKrrq4OlIZIcWuVichmqaL18zSgINFDsVKfdV5xZO3Bfv7OtTh?=
 =?us-ascii?Q?SuSJziWfHb87HdbdHBEOh5PZ2vqOFRjCdW0+I2kkY+0PNLQvxz50UlqrGMZR?=
 =?us-ascii?Q?zYv7wdL+WpNw7pUNvmeqmqA7kzrVYzvwIKLqFcBOUx0c2BXg9JT8hJ9Mscsw?=
 =?us-ascii?Q?T55raBYrITM3p637d00z065i8qO+AyiZswDGU+pKPDVbirHjQzxCKgsULiDd?=
 =?us-ascii?Q?VI2X6CxWPqxCk5NoOBEee3sKoYtNEdzXDQNpn5Hk2vWRK2JtJKBVuT9ITCT4?=
 =?us-ascii?Q?p1nk1dWkmVSH7u46v37MhIRpHA76wUHSa3p3CzlcAf2i84oRp9oN6Ns/zKg6?=
 =?us-ascii?Q?7KmEgFS5gorURQc872oaRoMuZ0vDa5V4Q1TZP3J6tgC347DB4RM0d6vBIw8i?=
 =?us-ascii?Q?ehsMpK9WnIPrEzZkY1KOYzdAqFRKpnIqzhhj/qAXA9Gd1P6bxvl8jfqQiQeo?=
 =?us-ascii?Q?N1+7s4uEOAVgVKrclAwHEi0mxoLBq+OEcnm8rlUzcC0Z8sH7yZeNPjvXWXpu?=
 =?us-ascii?Q?6ZE/mPQthS2ZkhFC9neCmg5T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78952a3f-647f-46ef-5800-08d9677b3cf9
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:45.3647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsxScR9YWkhESqAW23pCsBnmqSYYD5J7RqeTU+k2Zz7JfhCFtuEC9pu4NiXWg2A7F5AOWqDG0wVk7PdZwG089A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4750
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
be DEVICE_PRIVATE or DEVICE_PUBLIC to create the device
page map region.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
v7:
Remove lookup_resource call, so export symbol for this function
is not longer required. Patch dropped "kernel: resource:
lookup_resource as exported symbol"
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 29 +++++++++++++++---------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 47ee9a895cd2..dd245699479f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -865,7 +865,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 {
 	struct kfd_dev *kfddev = adev->kfd.dev;
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
 
@@ -880,19 +880,25 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	 * should remove reserved size
 	 */
 	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
-	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
-	if (IS_ERR(res))
-		return -ENOMEM;
+	if (adev->gmc.xgmi.connected_to_cpu) {
+		pgmap->range.start = adev->gmc.aper_base;
+		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
+		pgmap->type = MEMORY_DEVICE_PUBLIC;
+	} else {
+		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+		if (IS_ERR(res))
+			return -ENOMEM;
+		pgmap->range.start = res->start;
+		pgmap->range.end = res->end;
+		pgmap->type = MEMORY_DEVICE_PRIVATE;
+	}
 
-	pgmap->type = MEMORY_DEVICE_PRIVATE;
 	pgmap->nr_range = 1;
-	pgmap->range.start = res->start;
-	pgmap->range.end = res->end;
 	pgmap->ops = &svm_migrate_pgmap_ops;
 	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
-	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	pgmap->flags = 0;
 	r = devm_memremap_pages(adev->dev, pgmap);
-	if (IS_ERR(r)) {
+	if (res && IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
 		devm_release_mem_region(adev->dev, res->start,
 					res->end - res->start + 1);
@@ -914,6 +920,7 @@ void svm_migrate_fini(struct amdgpu_device *adev)
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

