Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0393D343F40
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D626E40B;
	Mon, 22 Mar 2021 11:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853716E3F5;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/cRShrkke9tXjc6RjvXlyUfWT/BCqEb00HVzItFXU/jztFlr0Bu62mHz3kINMxPJNlnizYadrBIf+zo3lBXVxfHMq6q/PFkFhDuFSFcmmUyew0pWqrSjU4/8xf9lNXhb+XhsEl/Me2MHZA2UDTmzVYyiUMl0HWnF1JtNzwV12XQ+VLfs+nZEntPQs2wUhJXw4wcfLg+86g7XWZX2bD5ZX1p33C0vWPKJX22j5Tx+w2bDNjH0nbhfTb4yB7KROMW6dJXNFtBr5DQeJupufAafWsmrQ2TYLByITa+QCi21FO0BF7k+kxCwbFrN4E2N9T6Ru4+9l7Sk6al4mXFZFIjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZGaiprQoPgtAliB5UZrAeVNkhMD+rhDpCVNxwt3t1w=;
 b=gCfQS1XQOCBfFJuhCzg+1HM+Og+FW5QfwFtGexsf6OS6tYWgbAcohJ3bsHons0Wz28ezYDnyIbiJBX0iIZYly0B+6uyI42r8jPi9iwEbjObL+KKgipBJGkCs5HNtvvtmhrjEqaYAZv4yq9AJ5H2DjYiEo31itQFsCcQLvx3HdA4U4vOwm2Wr/E/p8luwr00MG2oRylgctbMYXhQIVcMeJ6Bbmx/8/IeZEUC92IUCC6ano8V7M3mjHCtwvlvBVaZWK5b0tgep98yUZWCVHEHvgjXBBUJpXfSZf8b2OzBXMMA7nlMrZoxcK/PICNko8q7ohyoB05OCY6l+YhjQfBJ+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZGaiprQoPgtAliB5UZrAeVNkhMD+rhDpCVNxwt3t1w=;
 b=1DzDBL/44CbDKfIL3Cy/bvDRVnGHtmxkfwplRfVAqM1OKVAqry89kS1OH8EfcrWcJvYv66vG6xKDGBiRW0wtPUFexgmMpK3aYe/hidTKin3JsXtKLyESx7jazXojPBJwh71Wiv+gkMXgv+AQjZaQQzj9CtdhJfAOH1uPbbDcEGw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:16 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:16 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 32/44] drm/amdkfd: multiple gpu migrate vram to vram
Date: Mon, 22 Mar 2021 06:58:48 -0400
Message-Id: <20210322105900.14068-33-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d451ac3-369d-4c24-538b-08d8ed22b960
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42550F8A966C774D3CB695EC92659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IAGyQnuQuic7e/GPdND2lwGL1olPk7eWqmQPbQKuIjQbBYdqo5G1H6p1oClQhKyh1uen6Hp2+sbqGiU8fT1FTsZehWadGjiH4qiXZq8FaSVVaDBMDYwmC86zwH0fBPmbSYiYlduXJFH9vAS5Vy6Z7wTHLIGNYx5s29cw8LBbUhV278IXACHYmQEAB+KFdMzossRtkM8knjZGIPcLtwCpX0ieJ4nGebt5B2BVqeN1EhA+W7DoJJhumOcfkY6y/8fheHhm5rJ23myffERPstaPK50S5hNUZGKGvUEbqpT1liBhcTWn4Zu69KuFuTLo8lkv3Go+buJPUHCU1XBWdg5R6ZKJZygzu5UfzqVVDFZ3M6JPJ8GxbA2Y+XVzEV0SpQwfSpZvoO1fX53kCbKjm3K3ac7cicOR+GDvFIZto4281wAgk+FXfEpM+LdsKNKKy9NSa+3h/anKanpClIjurk0895NjS31jtRDFUfvmY5vKygerIOIhoJxMthrBaiW5570yqYr9dRu8fl7dB0qVv15rUw/Vre94n4xm2e29FRN73tI1jAWDLDCQQ7HDk8TTJLlrFPTR9HSde+V4kGbnDF38HS5vQ/A48WuVGBgJbTz2iqscEZmIwykCj34UPFYRCzY31lZJlLGEMqKyHFD7F0fFuXJ5yPHYMqkwRuWDLYCalVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(4326008)(450100002)(1076003)(36756003)(38100700001)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nGYv+mQQxrgy0RYrBUP1GXfYrrKCqj75cLQ2mrimUwPzpAdp8XRqfawpId/2?=
 =?us-ascii?Q?eXWJ/4fglUxwiUmmWy3ggn0TOiCyv+SVFh4rIuxsgOmiX4tUhNdW4CZHgziW?=
 =?us-ascii?Q?sSvrZXcZuJvrPk6qSMTv7cvCjc1r7SWBvviFRr8zkfOj3KTJcXTEiiPRFVDC?=
 =?us-ascii?Q?URAimcDul4q1EKCtmQzDggNppCjWsAo6WdaOXXJZe0OnuBF2jVAythtJldNl?=
 =?us-ascii?Q?l+bHprAVlRen0D1yWbYZk/q1zRD6/6h6tBgEfQv6dtILsru+8bGgjrYQ6Wsv?=
 =?us-ascii?Q?FIXihKW41Nw8Y9NK1AxnKMAE1g7UTguHqyhwqXsMkH9pgrCfUf4+TLzvIjYE?=
 =?us-ascii?Q?QJHB0ot4zNjPUYgyZ9ixjerNUDMcx8OUyScX06HziVeBwBLJpSpv7uKaYc1c?=
 =?us-ascii?Q?UeWdxud+ltnIphcxd6rusFgh4UjDnkwFRLCTzOC22+ts9W+PdmEl5SCOCFX3?=
 =?us-ascii?Q?h7gdDYgxze/SlQyOoxGUHlzunZwD4YHUaSZPQrgONzKIOoDV02gEvX/tT0zr?=
 =?us-ascii?Q?mSiR+d+/W9e4MrVSyKxHnJWUzgFbSPzVohbQqlzrgltXJ+Wb/oBbizGQj2oE?=
 =?us-ascii?Q?WoAUeAVHhMBaRzq982sYlL5VHv1pPstHD5koWkfqdeWTuh1+M4QrttTaWWrG?=
 =?us-ascii?Q?Ts9DUHPmvQPyI+rktPJ8+Q8lTbtLvCPLdnzDnq3L8B8WjyMdruy+HkIY2Snr?=
 =?us-ascii?Q?XG/KrMm+5eIITQ72pRKMb7z++wBZWTUqCx2O70sQ7P9PJ/NRcPkyGIgzRsU2?=
 =?us-ascii?Q?xajjwtJb0T6bw2rPY/JCwo6F2ulbMumyoiYzpOd1EQky3G7IFy0m3q2iX5Db?=
 =?us-ascii?Q?b61Y1PP3NVRD9J7xVX7TJicC/Sh9853YMYit7Uvi5/01h3laWTXvGMNoZRGE?=
 =?us-ascii?Q?rAQHtgcmbH5VOSjB24syCNtrkTDWn5yGlU7xIJTl1tNs4eCSRJK0XZ1KI2SV?=
 =?us-ascii?Q?AGvoHsXBfP09Z/RzkjZaeXaO7JFEgBWqdRdd4TVQskKCQoXhUdSLiMRNej+x?=
 =?us-ascii?Q?p9ebhTQvsDn17HUgkppawekRMGUl7UkXRK6HxPJFhZY9caK0dSqfW0yhpCYj?=
 =?us-ascii?Q?GER+QZCmimCueBS0k6zDi4i3vEp/4ga+J707rGAZmmN9aQSiNJkDsnFdn9EF?=
 =?us-ascii?Q?hj3C5zrw7dc7pofNNcnMkV6764+irMkU4/UE8+NWCRIydR1qBrwwBNPDYwfw?=
 =?us-ascii?Q?VgBJWdVl1Zp1dD/+8KdcR0uHMXBAQPYdeNs/MUzv3zhJCItMozPCFQqVasln?=
 =?us-ascii?Q?j3hoiOD2As0cjqGd0U7ZtHkegJKN8e3x+kWgs32uJdNRuSlryaJzb70EBfCn?=
 =?us-ascii?Q?fHc0rN4KluyBbGA4XYf3vfsP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d451ac3-369d-4c24-538b-08d8ed22b960
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:46.9107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8G0R1tsIuJcb2zvY8Zw/NPk/zo1hiB0GLVpATVn6zFBLLxrIXLsKmhN57pfoQjopv2D6Q9W1LqK1OPtcM6UeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 47 +++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 69 +++++++++++++++++-------
 3 files changed, 96 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index cd89b38e3d9b..cf71b98303c2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -462,8 +462,9 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
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
@@ -723,6 +724,48 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm)
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
index f4b4fea06ac9..6c46d43bf613 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -363,8 +363,11 @@ static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
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
@@ -376,6 +379,22 @@ static bool svm_range_validate_svm_bo(struct svm_range *prange)
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
@@ -449,7 +468,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 	pr_debug("pasid: %x svms 0x%p [0x%lx 0x%lx]\n", p->pasid, prange->svms,
 		 prange->start, prange->last);
 
-	if (svm_range_validate_svm_bo(prange))
+	if (svm_range_validate_svm_bo(adev, prange))
 		return 0;
 
 	svm_bo = svm_range_bo_new();
@@ -1319,6 +1338,7 @@ int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 	}
 
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pr_debug("mapping to gpu idx 0x%x\n", gpuidx);
 		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
 		if (r) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
@@ -2154,7 +2174,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 
 	if (prange->actual_loc != best_loc) {
 		if (best_loc)
-			r = svm_migrate_ram_to_vram(prange, best_loc, mm);
+			r = svm_migrate_to_vram(prange, best_loc, mm);
 		else
 			r = svm_migrate_vram_to_ram(prange, mm);
 		if (r) {
@@ -2361,6 +2381,11 @@ svm_range_best_prefetch_location(struct svm_range *prange)
 		goto out;
 
 	bo_adev = svm_range_get_adev_by_id(prange, best_loc);
+	if (!bo_adev) {
+		WARN_ONCE(1, "failed to get device by id 0x%x\n", best_loc);
+		best_loc = 0;
+		goto out;
+	}
 	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
 		  MAX_GPU_INSTANCE);
 
@@ -2423,29 +2448,33 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
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
-		if (!prange->actual_loc && !prange->pages_addr) {
-			pr_debug("host access and prefetch to gpu\n");
-			r = svm_range_validate_ram(mm, prange);
-			if (r) {
-				pr_debug("failed %d to validate on ram\n", r);
-				return r;
-			}
-		}
-
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
+	if (!prange->actual_loc && !prange->pages_addr) {
+		pr_debug("host access and prefetch to gpu\n");
+		r = svm_range_validate_ram(mm, prange);
+		if (r) {
+			pr_debug("failed %d to validate on ram\n", r);
+			return r;
+		}
+	}
+
+	r = svm_migrate_to_vram(prange, best_loc, mm);
+	*migrated = !r;
 
 	return r;
 }
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
