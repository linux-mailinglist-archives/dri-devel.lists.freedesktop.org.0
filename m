Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001DC350DDC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8596EC66;
	Thu,  1 Apr 2021 04:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90C96EC59;
 Thu,  1 Apr 2021 04:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEBZmJatPckBsdGxrFFWVdRF4wLYTU54zsey0YmHbxQubFT5NWZ8+TgefF3OVMwbnZe4DfEqBF7ewab10cgeePNzArsXYrANQaR1P9eLUCeeJGczIkUpGxAY0AOSNciQG1yJ66MNL98G3Pv2tyeEZca1mLVxuuxQvo3uPIjRG+baDxgX+JukRTTYQJ/6HNjuRv8dPlZswDlX6jd1zrZbLRaSz4RegA9KaWVavmFsZqzoVR7hx+XQxAc4nvkYKgbaNhndlJE5Nn7WOya5T75F6jYoSNB9m1ylKDAQvEkT6tLK66wtYACAG0EBGZl4MYzzP9GS28/JjCTbFsJXRvkY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs9WCR/ZJZfqsXX8rBZYVIlyge8o61zdlgWTPZDfeaQ=;
 b=I1ZNP80DvjMpSQzO8hL20DB5grLvg1z+aIZY3ZoReXTq2AdBycXwzVomOPT8rwBW8xs4jA3uSeTbjgaDw5IhYESv6dqC+BadRK8xu0z65r9v7crJ0c6Ds4L1ESrpJeZ71ajLJNHhn/lNUpwCtjkDJlRx9EGL61FDG+jFJSlUhOfOjn0b3SQ4MloU6uWLQ/2UQMmvJ1HoEStKpFFVkzNEZzEcrX8nUaC63mtsskWUjD2QneRoXbzXurShfATNbGskyGul/toQ/Tj/ask4xpYF621za4O1rTXYBFbgpWN5jYp7mPm1T8JT3scKwBLZ0HLWyHJ5tk4XbeFEPRLTjehlfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs9WCR/ZJZfqsXX8rBZYVIlyge8o61zdlgWTPZDfeaQ=;
 b=ioMgzogWEi4ebtJFl5cocDxdUWbXVMN4FhDa1AySZeIUqgbx7Ipc2wOd8y74x+o7bSrGlZqkUJS6uZnhXSTpV48g/e3gbNNML2fLJAS968qDLTTQrHtuH5Z5Kqp0cFDCLynWDy3WHvj0uIP+bjIbrFw2P0rfzIvskfcMl74NBWs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 32/34] drm/amdkfd: multiple gpu migrate vram to vram
Date: Thu,  1 Apr 2021 00:22:26 -0400
Message-Id: <20210401042228.1423-33-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88e6dcac-119c-44d5-b232-08d8f4c5dd25
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42224F3B054A1991855E6089927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGEUTFzN5iQlBOud7vB4ZHY74iED9ikK7O1mYcF7FJwdPKy+agcA6vCnWQGc4LGNVG3zOAlI6h/qRDclmyEWv7CBHm6X3k1lCQoCeKCAQCnJpyU4JCY/QIcQy+qgONjQHfGiHa1JQ0NX3hnL5awX3XQFnIlE5ksDUQQ0+LkQMHZBQkcSI8yh8ERKiK4lJvBtWH2xqTsjAdbBIaFD7huItKY32ego9mif17X2eaRnxj4zx/VK2Afwonu3kkrr/iJmclhwJSpLOx6e4L9EzFdXsBmGkr6H6KCi0UqVWZqYgG9dIn/aI8zALsOjNKVQQSX/QqOmSum+xnSO026K1OT83xIdQbJxrNPxc8zSM1GNRL1f5JY0en/1ovZ5A4TCYgs5wUrQsOien3DiX+pLF/Su3lzSGVHTVoLdufCeXGslzC5j1Ny/iI2c9oc9YuxbGi5jvMn8a4/AV2dABD1p/9eCd7AGSbdQQpu9VxcZ1nkCsr/jdU9QFCxkLNz3I+tiSNgSYhouNRCrQ3NDu/wcU1OvbY4XTvj3mf5HGwLReaJDz9qfNFUNBhR2aHoDZ7rLvVYT+NsimVezKJnpEeZK9sD9uN6klTWxNG9jV3JSoKtODVLvfgo9WOEV8g0ZCPQgXGJ1HGqgTiet/lwG2j4GBUTBVIGjdl2uy4oiwvVgeY/htvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IevIVLFJh3w1LWKfIvJdl+YKcKgaj6UOaKuj9bhjLD4HxFH4+30FQSyq84fk?=
 =?us-ascii?Q?Rrg/iRuNH6jMy/NWuj2yQZyq1wLVNse5n9MkPnZ6Bx9wFhCRF4lGlz+F76GT?=
 =?us-ascii?Q?i03qNnzeb0FjJO9O9dZT52KBTyb61YiSBPAOnKX4+cZkD4ntel1Z5Jd1Q5BA?=
 =?us-ascii?Q?keOYqx4Jw1/hsnCYu7DN4rXi441FaFYm9YihQhADhLwZP1WYg8RLeNwt9wbN?=
 =?us-ascii?Q?lhjJVxnsj6+xV84M0uhV9CVIyePD7uAEjqzYvRFAC6YcR0L8AbUPI80wg5wh?=
 =?us-ascii?Q?/OCngFEwTgVq/mKsSf2U0PsKRrSJUkiB6uoWQ1s4i1fWCpyONJ4LA2K4bEcY?=
 =?us-ascii?Q?dSlkQ42BptEKb5bWR+EfdcBYMjFaJPfpl06eLH9JozusAJBzYVmi+t3HQAf1?=
 =?us-ascii?Q?Q6MEUJDxD3V7xLFwDIKof2Jj+c4se2Ae0W3Fs+vpstEXU89Bn8MzW0BeOZRa?=
 =?us-ascii?Q?nf/N8kRjiWSbA612NowdtmJyecBLalB1R/bKxo6U692y9IipA6ivQVN+sOCy?=
 =?us-ascii?Q?7g9e0OlOtx//7FTXyVJmdiBzrvyYEy4k4O92PL7ucteZARql8jJADy/g8FIO?=
 =?us-ascii?Q?2pCa26XEEpdfwDTRsVLjfwsaeB7CdAcW7f/Oyq4bUj4ZGSDPlHZ7GMbZiBJ4?=
 =?us-ascii?Q?PS4w1FfwsdLG+jlgovR77xGttct9ilA79paWaFU2In8ll/0rXxpFWK18ZkQ/?=
 =?us-ascii?Q?sGoLmA0T7yJCejaxY6adHQrsfqGmIijoIj7aMfsq+5xf/cV4YEQq8PrK2iWv?=
 =?us-ascii?Q?R8BNMKEpEVpUf0VrEoneEU+GVCQHc45sZ/k8WflzAnjOzsmAQmLn02+aNRjc?=
 =?us-ascii?Q?IJStfEyxPPG6VW+PT+lubaJBeltkUg7lJTcElmdZ/2brzLHvkvu2XsO2fx+R?=
 =?us-ascii?Q?R8zHcaSEECLnngOwIWGN+/THjYd13BeOfajwOHdshs/XxohJoaKg6wzOsivg?=
 =?us-ascii?Q?eMG1lEqguga+3mbJxCIQjkakbtPa6ogBINiUD4fPCf/HsLeJ0P1WT9COTdpb?=
 =?us-ascii?Q?G3pn3Sf+OQItH8iBfEmg/F4cmN7PYgBU5bq2FiTuk4lcoJDndsQ4wU0as2HJ?=
 =?us-ascii?Q?8vJcX75T9YKMLrBoU0sOSJAAOXYQC687UDfS0qsCiua4tg4gFNMR6vDvzJRp?=
 =?us-ascii?Q?P1PaHMur4WewJjJ816V396J6ReOMl/5V/6bmfFgb5FYuQmkSVP4A8fZn2Z38?=
 =?us-ascii?Q?Ge+9JbBN2+bz5xd+kyw8zfjTHEVx/IYaNYMpGBB6rfnDbg2CiWlMnURbe+ea?=
 =?us-ascii?Q?pjfiBalZfkb+Uyngkqs50JjG865w37V64gtNAkShY+zkzdU7UosTdjB9Apig?=
 =?us-ascii?Q?wLXpa78dMjEyzgmfUKT8HqIx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e6dcac-119c-44d5-b232-08d8f4c5dd25
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:13.6362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0GUxEOnNUHXEyY1JmF5wyYRHp4PzAwGZ/+779TfOM4u8P8P/Q0Yf/8dJVzxpT6BgLpr7gKe+XDP6vecR8OVdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If prefetch range to gpu with acutal location is another gpu, or GPU
retry fault restore pages to migrate the range with acutal location is
gpu, then migrate from one gpu to another gpu.

Use system memory as bridge because sdma engine may not able to access
another gpu vram, use sdma of source gpu to migrate to system memory,
then use sdma of destination gpu to migrate from system memory to gpu.

Print out gpuid or gpuidx in debug messages.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 47 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 51 +++++++++++++++++++-----
 3 files changed, 87 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 73701406acb3..d111f88897db 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -486,8 +486,9 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
  * Return:
  * 0 - OK, otherwise error code
  */
-int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
-			    struct mm_struct *mm)
+static int
+svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			struct mm_struct *mm)
 {
 	unsigned long addr, start, end;
 	struct vm_area_struct *vma;
@@ -741,6 +742,48 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm)
 	return r;
 }
 
+/**
+ * svm_migrate_vram_to_vram - migrate svm range from device to device
+ * @prange: range structure
+ * @best_loc: the device to migrate to
+ * @mm: process mm, use current->mm if NULL
+ *
+ * Context: Process context, caller hold mmap read lock, svms lock, prange lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+static int
+svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			 struct mm_struct *mm)
+{
+	int r;
+
+	/*
+	 * TODO: for both devices with PCIe large bar or on same xgmi hive, skip
+	 * system memory as migration bridge
+	 */
+
+	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc);
+
+	r = svm_migrate_vram_to_ram(prange, mm);
+	if (r)
+		return r;
+
+	return svm_migrate_ram_to_vram(prange, best_loc, mm);
+}
+
+int
+svm_migrate_to_vram(struct svm_range *prange, uint32_t best_loc,
+		    struct mm_struct *mm)
+{
+	if  (!prange->actual_loc)
+		return svm_migrate_ram_to_vram(prange, best_loc, mm);
+	else
+		return svm_migrate_vram_to_vram(prange, best_loc, mm);
+
+}
+
 /**
  * svm_migrate_to_ram - CPU page fault handler
  * @vmf: CPU vm fault vma, address
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 9949b55d3b6a..bc680619d135 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -37,8 +37,8 @@ enum MIGRATION_COPY_DIR {
 	FROM_VRAM_TO_RAM
 };
 
-int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc,
-			    struct mm_struct *mm);
+int svm_migrate_to_vram(struct svm_range *prange,  uint32_t best_loc,
+			struct mm_struct *mm);
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index adb79b10f874..dc0f523ce321 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -347,8 +347,11 @@ static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
 	kref_put(&svm_bo->kref, svm_range_bo_release);
 }
 
-static bool svm_range_validate_svm_bo(struct svm_range *prange)
+static bool
+svm_range_validate_svm_bo(struct amdgpu_device *adev, struct svm_range *prange)
 {
+	struct amdgpu_device *bo_adev;
+
 	mutex_lock(&prange->lock);
 	if (!prange->svm_bo) {
 		mutex_unlock(&prange->lock);
@@ -360,6 +363,22 @@ static bool svm_range_validate_svm_bo(struct svm_range *prange)
 		return true;
 	}
 	if (svm_bo_ref_unless_zero(prange->svm_bo)) {
+		/*
+		 * Migrate from GPU to GPU, remove range from source bo_adev
+		 * svm_bo range list, and return false to allocate svm_bo from
+		 * destination adev.
+		 */
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+		if (bo_adev != adev) {
+			mutex_unlock(&prange->lock);
+
+			spin_lock(&prange->svm_bo->list_lock);
+			list_del_init(&prange->svm_bo_list);
+			spin_unlock(&prange->svm_bo->list_lock);
+
+			svm_range_bo_unref(prange->svm_bo);
+			return false;
+		}
 		if (READ_ONCE(prange->svm_bo->evicting)) {
 			struct dma_fence *f;
 			struct svm_range_bo *svm_bo;
@@ -433,7 +452,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 	pr_debug("pasid: %x svms 0x%p [0x%lx 0x%lx]\n", p->pasid, prange->svms,
 		 prange->start, prange->last);
 
-	if (svm_range_validate_svm_bo(prange))
+	if (svm_range_validate_svm_bo(adev, prange))
 		return 0;
 
 	svm_bo = svm_range_bo_new();
@@ -1139,6 +1158,7 @@ static int svm_range_map_to_gpus(struct svm_range *prange,
 
 	p = container_of(prange->svms, struct kfd_process, svms);
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pr_debug("mapping to gpu idx 0x%x\n", gpuidx);
 		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
 		if (!pdd) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
@@ -2165,7 +2185,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 
 	if (prange->actual_loc != best_loc) {
 		if (best_loc) {
-			r = svm_migrate_ram_to_vram(prange, best_loc, mm);
+			r = svm_migrate_to_vram(prange, best_loc, mm);
 			if (r) {
 				pr_debug("svm_migrate_to_vram failed (%d) at %llx, falling back to system memory\n",
 					 r, addr);
@@ -2370,6 +2390,11 @@ svm_range_best_prefetch_location(struct svm_range *prange)
 		goto out;
 
 	bo_adev = svm_range_get_adev_by_id(prange, best_loc);
+	if (!bo_adev) {
+		WARN_ONCE(1, "failed to get device by id 0x%x\n", best_loc);
+		best_loc = 0;
+		goto out;
+	}
 	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
 		  MAX_GPU_INSTANCE);
 
@@ -2457,20 +2482,24 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	    best_loc == prange->actual_loc)
 		return 0;
 
+	/*
+	 * Prefetch to GPU without host access flag, set actual_loc to gpu, then
+	 * validate on gpu and map to gpus will be handled afterwards.
+	 */
 	if (best_loc && !prange->actual_loc &&
-	    !(prange->flags & KFD_IOCTL_SVM_FLAG_HOST_ACCESS))
+	    !(prange->flags & KFD_IOCTL_SVM_FLAG_HOST_ACCESS)) {
+		prange->actual_loc = best_loc;
 		return 0;
+	}
 
-	if (best_loc) {
-		pr_debug("migrate from ram to vram\n");
-		r = svm_migrate_ram_to_vram(prange, best_loc, mm);
-	} else {
-		pr_debug("migrate from vram to ram\n");
+	if (!best_loc) {
 		r = svm_migrate_vram_to_ram(prange, mm);
+		*migrated = !r;
+		return r;
 	}
 
-	if (!r)
-		*migrated = true;
+	r = svm_migrate_to_vram(prange, best_loc, mm);
+	*migrated = !r;
 
 	return r;
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
