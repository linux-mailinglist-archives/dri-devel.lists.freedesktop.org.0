Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74C350DDA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360006EC5C;
	Thu,  1 Apr 2021 04:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9206EC39;
 Thu,  1 Apr 2021 04:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRmrZTYVC3sPNVe1B25pMEtE2YGzmcABvLOZRHT469oeYjWWoIu3TBmhxqH7kzrOogG8IGHC3fnutV4N42W/Bx1dWfZwFQUGowkKuMuVQGoXC5dAJRHyiLLBUHpR/lDaOfBIxaKcnF/uuYar9DC2oEaXWKpoR4mYUdPvKt4gaSALFidsOBqrOJrcXYCzBiM6zviClhFCj14lvevB2Q+57b94/tCAW3mTRiISB5XGGrf2SZ+eAdqakV3nIPfnSgMngJRKK17pS/vvyO66yD5GvB8QvCOCBKLOC7/J9euIhcxZhpHO0sCwVPHNVl2actbhhr1HOOnkWi44sP+YN7QAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQyCte1XJPxIatafDK3mxHPOyLc2/swOU7npLfZzpus=;
 b=blBEPWYBAi0yvN3DuqI6Bxg2uGmseIPu9Dj8kFs7//Ks8GDtVC/jbTVKn76TWocX1uURsZ4nPNlsiyUgYceDqf3mcNSCxW5RiEclzEN+qZch8+TDiG8We4Hvkwh8J+0c7BS8qunb7xxbitVRrKQ7JXHPJpfy2Z7p273qMZSsMHQFP3H/a/ajIp21yzV4+SVeUNNanesGL8/N+dwV6gRRbOobTLqEM2USEFgbE+9v+DcZLIGXQcZQQt/X1xIvuFGBaVzwyAXgGpy4Bj3bvJVoqotgAUIj5TopSGEDxigrCCimHjTrjiSGQA6wwISMDfAcGg3oGGeTsdlNujCjCKfKug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQyCte1XJPxIatafDK3mxHPOyLc2/swOU7npLfZzpus=;
 b=qhASt8j/rz5OCPAvvoV0eaXYY06Z2/Xvz6lJRHRyFGU+J7ngLGM1StPaCNksl34DzuyRY/tD1UIKRunmAuOP/55jG62TzRD45dIf3abeVefqC9/WmYXYubzsef6t9GSaWke5KFMXF/QI7x+ST3qxXh8RzF0WY227gOQC/ZvvbgA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:41 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:41 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 30/34] drm/amdkfd: refine migration policy with xnack on
Date: Thu,  1 Apr 2021 00:22:24 -0400
Message-Id: <20210401042228.1423-31-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e472129-48dc-4f5e-14b4-08d8f4c5dbf0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42228710D8D51C20689F0F10927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vRQsD1yCpDNAn+PUOs72v/g8o5uWywqgTIeQ4kIGbD1sixrbOhfPrCaf9SxPdyCTA8nwvowffwnDwGTrfuE/dEHs+4Vu907bv9eHHHMbFd9qvUz4XCN0HknQlBS8L/Qp7JnwaR5q6Z3Zj9Ei/1xDEWxMLJvdfD6n6WpWxnq9aYBTck6wWmKZC9kGSf65keoEKPaPdsqQ0eK8i5ueGO07Srv2QAVnprBvvNSUhNSBGPt13WwLILV7+3YxWiyEz2oflwm5AS9nq65qsBW1mJeSR1zA6ndAmyJKIfm9zmzJ9+tmFVqIvVNMmRfWu8fQQuUL6L/i5C/glT7U5tbhBjrzC9mZ8nlxO0ywMzx0GnrOvRns+ji/mqDbDA3Ed6xdVzlnnI0eazkgzwtSYLHFn0XdkysLsbzkKWrMVLAnVMDEEH1YBG8OJbLyry4rN9XibaczjkbPDFLtsXfMevwwY97nb1s3BFiBk6k3KgtGbagBtgGduzH7k6bwRxZwa6GtiJw51dmoZKvm3oQiMbb32hEoh0SZt/vnRPYIMJYll8bhsvEMy+64piiV2K0UnIzOtubCTSSt4Me39SSoJrbsHskiw9d4jFM5EqDJbRVaRU3FNLR/wa69V8ntCt0eUNdxYfC5kx7/pO4ofSoemKmTgyPConWNvsimMEyytz19YtAfmH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(54906003)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(30864003)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iCICk9KJyUYtEbSod2lom0qqdtgf+FQmVNQACWLm83x0PAC/CUynk/Alc3Xt?=
 =?us-ascii?Q?H7ckDPdPnf3LOByzuZcoS7rvhoqhO37aPDklLbwUjnuGvnFM4pCz342Z4LrT?=
 =?us-ascii?Q?1IWPSHxR1B+g3Mmo5eSjpW+tPz5+qu9b3v2nPRuyxKqqEcfDHx9fBa/w5dtP?=
 =?us-ascii?Q?UoBktoSeMCaU5DaZ2InVUVZJYPX/Dl1cmOCop2lW50lse2LEwqa9iUjN5686?=
 =?us-ascii?Q?C8m34yAAR8VrzJ4KQ1xxL51mNcqf0E4mXbqxKKjuWowVQTa6SY6owdBBk3T9?=
 =?us-ascii?Q?ASPqC9Lb6/S+AW1yr50ica6VBsat/Efl6JFm62sQL0nyXaWlBwweZcbkRunW?=
 =?us-ascii?Q?2m7CaImAdeacM+65bLrt7AnB35Ud4sxM6gl0QhKGTcigmQdE8j1uML1oCZK9?=
 =?us-ascii?Q?a8oYub8FP5EvtjAXMVHF992pn+nX3nQGvfKetrQADLPEBgvmE9RmGlURQYOU?=
 =?us-ascii?Q?oaqSiFuoJwCW/C+kmyQ5deWCzN007uR22wC5v/3Rk4jiYnBs9svThxhgDcTm?=
 =?us-ascii?Q?PwL6DOwMA8/I1r3XamY3khG6/U7yUl2rQOKB/YAq76qDxxpo+C3s1xlP1j+p?=
 =?us-ascii?Q?3mrT+d0rCM+cvDP8lRc42xaWbKhz9KGIf6nRt1K/fl8pPjYur2BJm6mrt70x?=
 =?us-ascii?Q?U46fcibjfddVvUZ14rA/Kx8SJ+vULi3AGdpdaJMDm59OcHEg9hD2S1nNa+Jp?=
 =?us-ascii?Q?JoaUG8Fr5UvPW6Kz8fHil+fUX4kyLdwLTlbGgd6dtsR9PhGi96XogJJJmOCg?=
 =?us-ascii?Q?gwtUs3uzUrwMYH1km3dovNR8DIvoRmy00fHHnXdARhqHUfZHSrxxvwCF2z9n?=
 =?us-ascii?Q?09p/kJN2ajkcf/MNluCpHr+pPAIGprlwoXkZOv0tM0pv3H09R9gzVqUYh7eU?=
 =?us-ascii?Q?YTT+00CWuxqAEzpJQwLbI7qdCMV/nNZvGWd6h6/OZAjUjAacsL+vYKiZC4/R?=
 =?us-ascii?Q?Aucm6zBsEw+sQ4ShRLSuw5a5pQpxirxIApoQYJN4Uz6Y2urfT9cubv3ZWzkF?=
 =?us-ascii?Q?ox/AV0iDq+IJaa2Lxv91XGaqrmGktsGqMHOwQYrLZbjC7VAHklacoPH1UxAq?=
 =?us-ascii?Q?gOWUXC7030NAn+DmPCVr7S2alsS+LT2Ti7F6oinghBgtLXixCuQb9DNQCJWI?=
 =?us-ascii?Q?gzdUGQV+hXB1wg9h+blPqOLp8ecQ0wVaUP4HDyFDGrOnPgfPwDtKMrCu7qcT?=
 =?us-ascii?Q?MeYnjVEtKeOF5twW0WRl0LZYcTkSHOV59184PRy3NRERwD+m0D5NS7AyKFU5?=
 =?us-ascii?Q?AgN1bW6s7vszwkJQmJrLAiRkd0q7ZOxR2g6F0LvNMf/pt3/QeHXhH0SosTpr?=
 =?us-ascii?Q?tVbLHjSfO91Urw92DaA8+oIp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e472129-48dc-4f5e-14b4-08d8f4c5dbf0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:11.2716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZhIJJ1M0wBDAD6iA1xoNSSuruaT4hge5bgfUvY/rR/jSaL2OTmdOxhhVtuhUnMsLrG7Lp4GYnvO+odD3acjXw==
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
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  16 +++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 136 +++++++++++++++++++++--
 5 files changed, 150 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 552c4f656e2d..73701406acb3 100644
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
index 77da6c68fab2..61bf2df38e72 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1283,6 +1283,24 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -2013,15 +2031,75 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
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
@@ -2056,11 +2134,48 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 
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
@@ -2194,7 +2309,7 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 	return 0;
 }
 
-/* svm_range_best_location - decide the best actual location
+/* svm_range_best_prefetch_location - decide the best prefetch location
  * @prange: svm range structure
  *
  * For xnack off:
@@ -2216,7 +2331,8 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
  * Return:
  * 0 for CPU or GPU id
  */
-static uint32_t svm_range_best_location(struct svm_range *prange)
+static uint32_t
+svm_range_best_prefetch_location(struct svm_range *prange)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	uint32_t best_loc = prange->prefetch_loc;
@@ -2318,7 +2434,7 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	int r = 0;
 
 	*migrated = false;
-	best_loc = svm_range_best_location(prange);
+	best_loc = svm_range_best_prefetch_location(prange);
 
 	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
 	    best_loc == prange->actual_loc)
@@ -2330,10 +2446,10 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 
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
