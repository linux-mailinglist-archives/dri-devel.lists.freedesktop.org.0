Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598F8354A91
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267886E581;
	Tue,  6 Apr 2021 01:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01556E250;
 Tue,  6 Apr 2021 01:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H92Q8TX83R+4ou4Mt8q52xSPGg0RLK0PXbh2yyGsO50xb0nU2AxsWeRKmxie3VFAAl2PlWL5VWf/MBBWTGW4EjMw7iPmB2A6qOGvJWJdi/rQw2bw49lipLCUFiAuna3fWqQNlzCYRRWimc4dx4bfJRnSJ4ikMsIfA8t4AbYv9XS6N/ken+PsfiX5ONpRSqXyjX9W7djah/7TOmPNYJs0QlKTHpMyk6YdnDgpCahGzEH7gye82bss6tA5aSlKLsZlrctZ5IasiGMfqR6Npx+nZz4pc3wpAbn/8mAhRt1Pqm+RvxATYtIGJZc7lkO9znVt6enxP5hJySxJrFvYUU80uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hZdcq2I4V4pL8vTdVDb3dt+qFK0rGPkjRGtXOzFqmM=;
 b=DZqeAzknb07kLn8NYLjBxFpmV8AEau1Qh7KIzy+aW768tzb8fuy6T7sSqkZGHXS/zx12cXNUEe2q/pmez95StLbK7hdkp1pj0ybeoxbw3IisnNEEr+k5ulnOcXx1XWFhnoEQKLf/JI9VVPfw5nZGQAsIboeYiVL419UO38BptzxE0cSNM3lL2Hww/pI8RHYaDNhPS4xu7dXStmSPJfXgVFRpvPIeahLdpWYzYloGXYmWGeuTqWbwubtdKXP0xyT8d0TXFfhg6nHa5FpNsNaFUC55z54lGJGGNrXOrqFkaIJLHUyNj9gUfRKQD/BvxKGkj/U5ppH4JLRdpGZANjUjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hZdcq2I4V4pL8vTdVDb3dt+qFK0rGPkjRGtXOzFqmM=;
 b=XW8x/2DxDkS9GkQB+TUSfc618GY6BXMT67qBmg0EHKKDq7jC3R95G8FMn23t+PCoLsAtCUTtdN93dOMl3NAE+rwCjOtCPQnfTD/NVAgGxoN+gYc6Ift/5Tutkck1/vIxR6Pp7AVMrD9wE0KxJ1z85Pv7JTh/LjV5nvje4A34QRM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 01:47:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 32/34] drm/amdkfd: multiple gpu migrate vram to vram
Date: Mon,  5 Apr 2021 21:46:27 -0400
Message-Id: <20210406014629.25141-33-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f215377f-adb0-47b7-f054-08d8f89de532
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4159CB71638996E7A194960892769@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pdIkNZHujEa8a5gBZ2REDd8PEOgzqRzuf8ZYT87zrOsgwprdLLAqq+AdLb+SIFmYwei0Mt3205SM9qSD6ZktmMo+ysAohJWydkmp/oroUfTS6pnN+cc3LZrk1qJ520Kaw4samd9za5VHSJ2bg+zXzTVHuwtB8FoSqeRXn+cAD0Cjp4XeJ+IhHieVKAtO6KnOfCLmrCDIh97KMbvm3AU3wFbUGzYIDVa3fktXJ+eB6eQCMUwZC5oPc6mOPGbJCG1m2e5yWGqAV3inkXNWf8rrW78C8KsQxEk3UsVgLeUaJM/PXAmKOCLyqPtd9PuaaLDfTib/ymgNFz3PAhxK+xeDz6DEp0Dh8dwRbAyCMvEo6I0IFZMU8saGtR87GHzTpLw+AZCXfEzKjvN5p+bhPfJrxoDfBjHNFQFFNp29ZzryUEcISpnGXCWYu1MSSk9TlPHCnPxmSrpgMj4K1lXSAJQB/4cp7r4lnrhNVsZUUcIbN4447L46uK2x8LGI/p+zcLcW/Syu5BtXX09f++1nm32P67Nw2XcFq8MxLt3k7d493GAkRPNh//0N6Tj7XVRYtmEUKDiyZRJEcaSmIIYM+zBAER/I9dxn7h3g29hOjjVYkRzVC4oy9ECwgdtE7YIKPgrZ3eA/dvM0ToS07fGBXja87Fy4BPvjHGUn94VFBGIO38mFP/tgX53iwbEydWdGbynx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(2906002)(66946007)(66476007)(5660300002)(8676002)(26005)(6666004)(186003)(8936002)(316002)(4326008)(83380400001)(478600001)(450100002)(52116002)(7696005)(38100700001)(36756003)(2616005)(956004)(6486002)(16526019)(38350700001)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W+0ge/wlTB4EgHnwhGjN9RhaAusfSgcvta6mtvhXdDqECUhkmY9oHmr3FuuI?=
 =?us-ascii?Q?AZN+cjN0TidC2WjZ6aYS5XXyeMyDkbNSsn1Y0CY7ojw9HiVfw2j2y7CUXAK8?=
 =?us-ascii?Q?++1CwzD7LT+J6EKxhox9ECHYjT05QllVDSL5uYz4UIn8F/jTUF2grVr3RnPg?=
 =?us-ascii?Q?NSPAiok+jFjuR1vSwcgR2sBTHTkCkmSa+KNLh+J2VC5B3kByEa6OqNgA5sRB?=
 =?us-ascii?Q?Bnk2Dzemwnbi6BGQLbe6XYQYY9/h4AwsFXQOzoCGmyGzUgmIndAWuDmy5Zk5?=
 =?us-ascii?Q?bmE/zVecGYtDZKKqB/5H0JJbJkekdf7nrbPTHM+auUPYoMyTwguB8WWcDoIs?=
 =?us-ascii?Q?e3+dxKUlRL4N8rvoDb2+sn7ppfQAS9j2kOpeOIKklWO07SupVkHPkDiLFrHa?=
 =?us-ascii?Q?MmBHuWHzdlo9BlG6ZlCgToi6Fp+SCHFoRe5npu2/ylgd4UdtGjkHDusxcXOJ?=
 =?us-ascii?Q?12mYINTEQu0YnSrnNE6LUCCtR2OE/oxNQKWeWXX556lKeJYZHETyWxaaAh81?=
 =?us-ascii?Q?VstL7CXXXEjDWE6vg/UFANZnhH2D/uqvFpztrAUw+VYWzTxKD6sKPVAge5GY?=
 =?us-ascii?Q?LccjuspjQdJ0M31yFYWJGvVdwAir4+BrYMiXfTylOivXcMiRgUrxgbngZIGh?=
 =?us-ascii?Q?JzZnVvYax1a35FVvqkFs5aX5G9eBq/uBSZvep+0YTcz56Vuu8Ct/PfHX0/iQ?=
 =?us-ascii?Q?3em2q7afiYQS0I1C2XdAvUTJUysDcZYYVog6tAs54T12hPgy9AlnrLVxhuLR?=
 =?us-ascii?Q?D84slrYrIup/91sEt/imP4Wk+Nt2XoehhqRegt0C93OLByNdnTnMro7Q5y5d?=
 =?us-ascii?Q?ABC4t+ibqN5i65N+vJdUabAwXTDqy7eVLVCreq4jhplckrcZIv3J9vCbRXMC?=
 =?us-ascii?Q?7nE6uBqpwk4J9HKUFBKdFMmpQMoF+GGpi4NXIfr8NPHgD/Q8Gnej+6fugZMV?=
 =?us-ascii?Q?bH3gAS/g29AYc6kEKmR9jHT6IGsZTPCE5iorf+CnEMju+MIM634Zm/wfLtcM?=
 =?us-ascii?Q?uw3JopYaP0xraGiPTHsneR3cwRhTG/eIBQD8zRY2epiC6+Swn8HOi8Y+oCDG?=
 =?us-ascii?Q?FsYOgcuPYiJ1YBa+4PaVDvSyB+AWEHp0GWyXLDdgf+d0Qs6EjaV8sxIT/JXQ?=
 =?us-ascii?Q?WUNu3GujOlXsL0KVaWj/URznYWON4xkcldj9U7XjMlFoC9EZygfkK3L8ijYG?=
 =?us-ascii?Q?3Mag7NQmaPTM/mYO43GzckJ3XJQ1ZFvGadW5x0TdVDxO46cy2p/Y15O4JZAb?=
 =?us-ascii?Q?ddhBOiEvGauxke83vPig04/h7ASV+LVmASq0ztbO9YiEz5UlvVosdSMORrJx?=
 =?us-ascii?Q?mX/GCic+jYBAyNlFyVgNBPv3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f215377f-adb0-47b7-f054-08d8f89de532
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:11.4209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33FyYTBino66vbTGjuQB871Y0tI1+nxFqouzkPoblnj+AcaQUM3vxWcmCeX/xOOyn9rA8L1PhFWtu9utM+9E+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 47 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 51 +++++++++++++++++++-----
 3 files changed, 87 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index a4069e76bf8d..02ff8b564206 100644
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
index 06238194a06c..24c7dbaf9cde 100644
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
@@ -1177,6 +1196,7 @@ static int svm_range_map_to_gpus(struct svm_range *prange,
 
 	p = container_of(prange->svms, struct kfd_process, svms);
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pr_debug("mapping to gpu idx 0x%x\n", gpuidx);
 		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
 		if (!pdd) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
@@ -2202,7 +2222,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 
 	if (prange->actual_loc != best_loc) {
 		if (best_loc) {
-			r = svm_migrate_ram_to_vram(prange, best_loc, mm);
+			r = svm_migrate_to_vram(prange, best_loc, mm);
 			if (r) {
 				pr_debug("svm_migrate_to_vram failed (%d) at %llx, falling back to system memory\n",
 					 r, addr);
@@ -2410,6 +2430,11 @@ svm_range_best_prefetch_location(struct svm_range *prange)
 		goto out;
 
 	bo_adev = svm_range_get_adev_by_id(prange, best_loc);
+	if (!bo_adev) {
+		WARN_ONCE(1, "failed to get device by id 0x%x\n", best_loc);
+		best_loc = 0;
+		goto out;
+	}
 	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
 		  MAX_GPU_INSTANCE);
 
@@ -2497,20 +2522,24 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
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
