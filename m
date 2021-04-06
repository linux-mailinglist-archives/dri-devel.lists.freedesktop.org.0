Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C2354A90
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95846E52A;
	Tue,  6 Apr 2021 01:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0B26E250;
 Tue,  6 Apr 2021 01:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUiqsnbIekzzMerfwrJ50SfVH8vBSSlb8ONFHqkBm6LThwVkaIh821hSzQm6oIMv7LmwVQMKK6oUpo3wusIWD9wOXAEeqV1h6JZChqdRvR2tkr2wFy5p2tWriMkAKT4js/uTX234Ht3mPzplOquqtdUv3RTXSBWbC+nLaRlBjbsV3vg4TYoFeW+qRXFwYYKnqo6TxSgm/4x7kD4Vbv9WoE3E95iUGEyhmI3l0B1Q59oq4CjHpfa+iXMNfpxuK7AaB/LFif48YL5T7O+yuIdhkYpOqgiDRJWyo9yTK6vUIgqADQgrLWADFY4WaVizRHNrnsxVy6lwGkgOh3bib4KRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahA1go8VcWGLB+N5AxhP6d9JGfnmfBDglxOHMYKXUJ4=;
 b=SHDScdAVNH+nvuPAjF7nKroEORnf8F3OTxNWKS5nutu7c7RHo/hQgx5RUMn7oL1tBBcaK3JsJ8PFKzBHPAvjhi1oQyeB1x0wZfCBQUNUE1mSR3Szs2Rn4sv3JeaQI1c5Q9uU+soMxCeNSqJQNgbK+r6eeOhzrs8Q+xuN9LwHIDektQa1WBBe1uoCsFQ7BVcDEl9vMwpejczRoAfAj5tyi7mPW/E4cSEuMVPyuwuHxjHb26ZrOTZhMmrXTZHm0ACaiZCFD0M5hbcXbsLy4nzYK5kkVK65hQ+uKk5rJhy0VhNA2HURFYLoXyHUQbTQZAVVEtvI8SM3hZ48qYdZ9Mm0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahA1go8VcWGLB+N5AxhP6d9JGfnmfBDglxOHMYKXUJ4=;
 b=sKt1lRehqTDpvkuISK0GWhcLaUiuVpdIK0TSc2FR/W9oETcNBlejPNnc3LLDxbpspsgnudDwh/NFQTnCm3IiRO20MzZfee9NubQQMrYmFII5VDt1NeGqL1EZA1Fj50cTSLblPv5aEL7CPCR2u4IIZrwWTEw9S5SGY8cHfPkTh60=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 01:47:41 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:41 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 30/34] drm/amdkfd: refine migration policy with xnack on
Date: Mon,  5 Apr 2021 21:46:25 -0400
Message-Id: <20210406014629.25141-31-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6094f0e4-7d05-40fc-2bfa-08d8f89de4a7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41593789709F8E2E36DC0DE492769@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xbhmSZfrhGMDMlVBvqvdIwwn2HVVHLA8kbtW4Ly09S3yrrAMOgVU0lMIp5DNf3kr4DzL6avNseO42RBSRSv//FgJIfcJKfBAJUVvmWUoMZgPgKtxFdLyrtDQgetkah+WI7Xn9JVJHSb6nY8ud0ibhcq7JgCUDGGNmN5iNU8kilPjI7uBrwLue6sryibK21AteULE6z7Rj10/BXggRjpZFmNwkKPOL8WmIAzfDxvSv2DLQaJbOuLXo8lZIDks7Jo9UgCXdT9pgfEm1oLItxP7KBMcg4EJx5mCeWRBUy7rdwtHQdz26t/q/NWleOVQNSLphF28hZrJHXao8DtiTgcG8LjNrszZgOSLApqSt7GWpxWLjUwCuJGpqUtfYY1oS+CTlINUFNat3FN6Hvl9aLbSySRj08ozb993ryrpe5MroGfD5iXkEN8sxsn1fLC4KHkH7AQQh3uAKBW/eJYjveuBIPMnKlWEV+8MXywBn17OeSbjK/KjPPJYpM+qUlhJRz++FexVnjZ3u75/5aZzNt+jwsX4hC9qqAVwNccG2sID0/xczd7vVbCTCzJQws9jHtNkcDt+vYOE+vBIef8tMFjma3jgl8VzAyjt5+3AF4m6WnOiobNQN3BV+/xc6NJpdvbeVInQllhEeLQiG/vML2LJjcy1gllzCUdb5Jjqg1w/NjsXMUV/XPfN4h0fWkUPsDOl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(2906002)(66946007)(66476007)(5660300002)(8676002)(26005)(6666004)(186003)(8936002)(30864003)(316002)(4326008)(83380400001)(478600001)(450100002)(52116002)(7696005)(54906003)(38100700001)(36756003)(2616005)(956004)(6486002)(16526019)(38350700001)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0mmBhMhbtHhAsj8tPkyalP94DFsBP0uKwZnFpvD5vw/RotEcH3c7CaVqLR7Z?=
 =?us-ascii?Q?/AbFlub+BNN7ok+N/DpyQg6j87XOdXj4kQEVxWXIOCY24TQr/q10mMyInG4t?=
 =?us-ascii?Q?5QNqGVP/mZeRV9/JQwPF9B4I3r5qsyyydWnirJ7cuRT2N7X2E34A/cHIpv3K?=
 =?us-ascii?Q?oiHh2hP1gGsFPPpFObwlp05ZpjPbft2nbxW2soEuJQPr1hchSBqB4BCxC5l7?=
 =?us-ascii?Q?QIiFn71Tw9R8NUokvZlKZJDZO4Pc3mzO6+xDdhn8mntYwJCbpyueOEDQE1rZ?=
 =?us-ascii?Q?FPGbfRcEKETI8nr0DmPHhkD8+pQoa+GL4GeVsNGb6mNehq2wZg6D53ZCBcho?=
 =?us-ascii?Q?udsidGO92b5cd8ps8onzRrA0Ptfp2IqOLppnjSOM6mIlpYPiw7/IPS64PlZ6?=
 =?us-ascii?Q?WGuLyQpAbOpTt8LgsuVbDfPR5TkdBDPUJx0gyU9twRwGKAFcO82gqycFGT3+?=
 =?us-ascii?Q?Pw+Myx3q1HFf07uFaCOfh3jYzcu6XnRlOzFCpaQf+phwWu01KtoWVlfWEizo?=
 =?us-ascii?Q?nhpxk3yEmp5xMkYSkdVHeZYZBhduWcDPfn9hgrjrOmLkX7yt0wSfsZNa7ty2?=
 =?us-ascii?Q?JUR59B4WJnopIdzL7QaDq69rbtyfSz4Ivq4wuPE8czn9r48TrRBl/VpOrB7C?=
 =?us-ascii?Q?+lQuCT6ZeyR+rl1C8PCuEeHO47WJz9qLDxAPg1mqZI/ZTTauGsaqfpFR7Z/x?=
 =?us-ascii?Q?/Eqt24IySwS4Mfhl3UUCyJkV9LYur/Xh1PTatJzwXm++oT1ZTmZQC7rD4yYh?=
 =?us-ascii?Q?9chckaT2HJROB2YEJj5Mpu8NTI7lmjMWpBH4njrCajviSvhPxuCOa2JYxDJ/?=
 =?us-ascii?Q?xRAUwJkncTc4zS5L3poCnUuznLAzIllBkGpWwxELyl49VHZQP4oSTFeIhXXI?=
 =?us-ascii?Q?UmRnE6R493BxV84KrFTSk5yP4rfnd4mC+SIZExT1+NTLTfnz7bT6VZnK6BRZ?=
 =?us-ascii?Q?JFqMFzqvl5RppseMA7hkEWlBixM3AGCt7swTmtA7pUr+Vb+OEQCaHNNdXbBD?=
 =?us-ascii?Q?VKfCvYS4xiDOMWq1p7vSJcnYTRJShq8qh6dVX1igrY620v++yCPu87/7Gn2H?=
 =?us-ascii?Q?N8MBa5P8r8FREVUCaJ13whJ3zj5TkWIHZHJRuhunHGWZt+cuMjSfE/BvCnOF?=
 =?us-ascii?Q?YMyBRuoFGQiW2gHN+Tn2sKAK9m/lq1RsX312MgrO9YNkPH8D4mKMQPXTbMtI?=
 =?us-ascii?Q?PMTxy8HK+Vr9BUIOi3aaSby3g4qEN6tO4+iI2ZVVnpfxjkmb4B1ywUsFrV0I?=
 =?us-ascii?Q?B4QwcyF50XoP4PA7aztZWWFv4YWky9Hm8hknJ8Zgfk/dGrO1LtfB6UoLu4tp?=
 =?us-ascii?Q?Om1nJPwKAuBrGaEf+Exi0kDf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6094f0e4-7d05-40fc-2bfa-08d8f89de4a7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:10.3954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQW8z6HEvquWv1YvQBhQ4sDb2JHgILJz+rHcnDV/mrepmHg4R2Q/YntfOIRPjjBHtQWPChmfdu6KvcLN7vdDdQ==
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With xnack on, GPU vm fault handler decide the best restore location,
then migrate range to the best restore location and update GPU mapping
to recover the GPU vm fault.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  16 +++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 136 +++++++++++++++++++++--
 5 files changed, 150 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 6d22ca0819ee..a4069e76bf8d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -479,18 +479,19 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
  * svm_migrate_ram_to_vram - migrate svm range from system to device
  * @prange: range structure
  * @best_loc: the device to migrate to
+ * @mm: the process mm structure
  *
  * Context: Process context, caller hold mmap read lock, svms lock, prange lock
  *
  * Return:
  * 0 - OK, otherwise error code
  */
-int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
+int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			    struct mm_struct *mm)
 {
 	unsigned long addr, start, end;
 	struct vm_area_struct *vma;
 	struct amdgpu_device *adev;
-	struct mm_struct *mm;
 	int r = 0;
 
 	if (prange->actual_loc == best_loc) {
@@ -514,8 +515,6 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
 	start = prange->start << PAGE_SHIFT;
 	end = (prange->last + 1) << PAGE_SHIFT;
 
-	mm = current->mm;
-
 	for (addr = start; addr < end;) {
 		unsigned long next;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 95fd7b21791f..9949b55d3b6a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -37,7 +37,8 @@ enum MIGRATION_COPY_DIR {
 	FROM_VRAM_TO_RAM
 };
 
-int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc);
+int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc,
+			    struct mm_struct *mm);
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index ca1b0c518d46..bce44164f1e3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -864,6 +864,9 @@ struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
 struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
 
 int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id);
+int kfd_process_gpuid_from_kgd(struct kfd_process *p,
+			       struct amdgpu_device *adev, uint32_t *gpuid,
+			       uint32_t *gpuidx);
 static inline int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
 				uint32_t gpuidx, uint32_t *gpuid) {
 	return gpuidx < p->n_pdds ? p->pdds[gpuidx]->dev->id : -EINVAL;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index f897c1d0ea66..1d6310f63ae9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1673,6 +1673,22 @@ int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id)
 	return -EINVAL;
 }
 
+int
+kfd_process_gpuid_from_kgd(struct kfd_process *p, struct amdgpu_device *adev,
+			   uint32_t *gpuid, uint32_t *gpuidx)
+{
+	struct kgd_dev *kgd = (struct kgd_dev *)adev;
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i] && p->pdds[i]->dev->kgd == kgd) {
+			*gpuid = p->pdds[i]->dev->id;
+			*gpuidx = i;
+			return 0;
+		}
+	return -EINVAL;
+}
+
 static void evict_process_worker(struct work_struct *work)
 {
 	int ret;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index adb8e69fbd28..da2ca264753c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1321,6 +1321,24 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 	if (gpuidx < MAX_GPU_INSTANCE) {
 		bitmap_zero(ctx.bitmap, MAX_GPU_INSTANCE);
 		bitmap_set(ctx.bitmap, gpuidx, 1);
+	} else if (ctx.process->xnack_enabled) {
+		bitmap_copy(ctx.bitmap, prange->bitmap_aip, MAX_GPU_INSTANCE);
+
+		/* If prefetch range to GPU, or GPU retry fault migrate range to
+		 * GPU, which has ACCESS attribute to the range, create mapping
+		 * on that GPU.
+		 */
+		if (prange->actual_loc) {
+			gpuidx = kfd_process_gpuidx_from_gpuid(ctx.process,
+							prange->actual_loc);
+			if (gpuidx < 0) {
+				WARN_ONCE(1, "failed get device by id 0x%x\n",
+					 prange->actual_loc);
+				return -EINVAL;
+			}
+			if (test_bit(gpuidx, prange->bitmap_access))
+				bitmap_set(ctx.bitmap, gpuidx, 1);
+		}
 	} else {
 		bitmap_or(ctx.bitmap, prange->bitmap_access,
 			  prange->bitmap_aip, MAX_GPU_INSTANCE);
@@ -2050,15 +2068,75 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
 	return NULL;
 }
 
+/* svm_range_best_restore_location - decide the best fault restore location
+ * @prange: svm range structure
+ * @adev: the GPU on which vm fault happened
+ *
+ * This is only called when xnack is on, to decide the best location to restore
+ * the range mapping after GPU vm fault. Caller uses the best location to do
+ * migration if actual loc is not best location, then update GPU page table
+ * mapping to the best location.
+ *
+ * If vm fault gpu is range preferred loc, the best_loc is preferred loc.
+ * If vm fault gpu idx is on range ACCESSIBLE bitmap, best_loc is vm fault gpu
+ * If vm fault gpu idx is on range ACCESSIBLE_IN_PLACE bitmap, then
+ *    if range actual loc is cpu, best_loc is cpu
+ *    if vm fault gpu is on xgmi same hive of range actual loc gpu, best_loc is
+ *    range actual loc.
+ * Otherwise, GPU no access, best_loc is -1.
+ *
+ * Return:
+ * -1 means vm fault GPU no access
+ * 0 for CPU or GPU id
+ */
+static int32_t
+svm_range_best_restore_location(struct svm_range *prange,
+				struct amdgpu_device *adev,
+				int32_t *gpuidx)
+{
+	struct amdgpu_device *bo_adev;
+	struct kfd_process *p;
+	uint32_t gpuid;
+	int r;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	r = kfd_process_gpuid_from_kgd(p, adev, &gpuid, gpuidx);
+	if (r < 0) {
+		pr_debug("failed to get gpuid from kgd\n");
+		return -1;
+	}
+
+	if (prange->preferred_loc == gpuid)
+		return prange->preferred_loc;
+
+	if (test_bit(*gpuidx, prange->bitmap_access))
+		return gpuid;
+
+	if (test_bit(*gpuidx, prange->bitmap_aip)) {
+		if (!prange->actual_loc)
+			return 0;
+
+		bo_adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
+		if (amdgpu_xgmi_same_hive(adev, bo_adev))
+			return prange->actual_loc;
+		else
+			return 0;
+	}
+
+	return -1;
+}
+
 int
 svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 			uint64_t addr)
 {
-	int r = 0;
 	struct mm_struct *mm = NULL;
-	struct svm_range *prange;
 	struct svm_range_list *svms;
+	struct svm_range *prange;
 	struct kfd_process *p;
+	int32_t best_loc, gpuidx;
+	int r = 0;
 
 	p = kfd_lookup_process_by_pasid(pasid);
 	if (!p) {
@@ -2093,11 +2171,48 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 
 	mutex_lock(&prange->migrate_mutex);
 
-	r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE, false, false);
-	if (r)
-		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpu\n", r,
+	best_loc = svm_range_best_restore_location(prange, adev, &gpuidx);
+	if (best_loc == -1) {
+		pr_debug("svms %p failed get best restore loc [0x%lx 0x%lx]\n",
 			 svms, prange->start, prange->last);
+		r = -EACCES;
+		goto out_unlock_range;
+	}
+
+	pr_debug("svms %p [0x%lx 0x%lx] best restore 0x%x, actual loc 0x%x\n",
+		 svms, prange->start, prange->last, best_loc,
+		 prange->actual_loc);
 
+	if (prange->actual_loc != best_loc) {
+		if (best_loc) {
+			r = svm_migrate_ram_to_vram(prange, best_loc, mm);
+			if (r) {
+				pr_debug("svm_migrate_to_vram failed (%d) at %llx, falling back to system memory\n",
+					 r, addr);
+				/* Fallback to system memory if migration to
+				 * VRAM failed
+				 */
+				if (prange->actual_loc)
+					r = svm_migrate_vram_to_ram(prange, mm);
+				else
+					r = 0;
+			}
+		} else {
+			r = svm_migrate_vram_to_ram(prange, mm);
+		}
+		if (r) {
+			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
+				 r, svms, prange->start, prange->last);
+			goto out_unlock_range;
+		}
+	}
+
+	r = svm_range_validate_and_map(mm, prange, gpuidx, false, false);
+	if (r)
+		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpus\n",
+			 r, svms, prange->start, prange->last);
+
+out_unlock_range:
 	mutex_unlock(&prange->migrate_mutex);
 out_unlock_svms:
 	mutex_unlock(&svms->lock);
@@ -2234,7 +2349,7 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 	return 0;
 }
 
-/* svm_range_best_location - decide the best actual location
+/* svm_range_best_prefetch_location - decide the best prefetch location
  * @prange: svm range structure
  *
  * For xnack off:
@@ -2256,7 +2371,8 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
  * Return:
  * 0 for CPU or GPU id
  */
-static uint32_t svm_range_best_location(struct svm_range *prange)
+static uint32_t
+svm_range_best_prefetch_location(struct svm_range *prange)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	uint32_t best_loc = prange->prefetch_loc;
@@ -2358,7 +2474,7 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	int r = 0;
 
 	*migrated = false;
-	best_loc = svm_range_best_location(prange);
+	best_loc = svm_range_best_prefetch_location(prange);
 
 	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
 	    best_loc == prange->actual_loc)
@@ -2370,10 +2486,10 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 
 	if (best_loc) {
 		pr_debug("migrate from ram to vram\n");
-		r = svm_migrate_ram_to_vram(prange, best_loc);
+		r = svm_migrate_ram_to_vram(prange, best_loc, mm);
 	} else {
 		pr_debug("migrate from vram to ram\n");
-		r = svm_migrate_vram_to_ram(prange, current->mm);
+		r = svm_migrate_vram_to_ram(prange, mm);
 	}
 
 	if (!r)
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
