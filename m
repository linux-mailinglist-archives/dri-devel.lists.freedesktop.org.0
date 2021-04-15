Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9121635FF81
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B69C6E9D7;
	Thu, 15 Apr 2021 01:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4436E9B9;
 Thu, 15 Apr 2021 01:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0Uypnff8D2fgOswk8f2fe7BOUnBnrpeWL6Jyva14bH8Se9XIic6J0XA0lyB5Gyg6k8UZsfBTQyQVBgmtxultj82p+XdmMH2GhbWGU8afserPMXhRZx4pkW0nI4x1IIe2WH5ZXBcCreEWTkDPN6jqOukhwD9K2bFJTco6e71e/GO/w/20W1W82G3cLWAENlcBGDBXvXjlJIfzLCkNzBGUhgMkzGSElTyN/4TkZwzf+Jqwqt3dfHGKZI439b/LbAwuZWiV1lqvlyhWJqEO8fER7tpEj7A3IH5BlF1FaqqbsE/uUCZP/7bsugYa46KRDHztQ2C/bcHzkAvAnhJZb1gUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T51bZ6Qco4nHbYlLVfW7+Ky2tbdXQ4w3O9egSXXsWUk=;
 b=dtyawdmQwsHLwvCK5caaQa23gNA9zLElKF2jB/C3OFXRMWvLtpR6c87cxU2wi6swSaUR/TOk7gjZQ69i3Yy6nrLWvWhVeRUld8pZk1TmAFUqULnL2n8XkDTinfNY2wgN5A4MHJPKw6tvQkIy+6IH4r4268VBnS0/DBI9MXoWy/tdnsdoqXkw73YBM0Mwp77PuW2c5N5oijP6NYe+JGm7lcs73FScYPCRrIQTR1U60/+MfZ4rcm3bfjHPERG14BK96D3L3NZo3CFQldtCGN2HhlFHuwKFkasH87FnU+c/sd6QsBjn7nGCBkpO0qlU33gd3AGAqgsP3/SqobXer4ydaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T51bZ6Qco4nHbYlLVfW7+Ky2tbdXQ4w3O9egSXXsWUk=;
 b=di/dai4lcBXkqhM3KF0TPAIZ4uC+Rz/+h5M25yg9WpvwjXZn+tA/wREYO7CBIPxVu6+FWHos3ADUGkcp1fYFH01PjvsgCE7pw6s1gWjwLb4ijfqE/6n2yTzZ9DouD00eDVPIlF5Bs+q3vXRZuXUgZYxGLwHOjK5THrzPaSrGsYw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:39 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:39 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 30/34] drm/amdkfd: refine migration policy with xnack on
Date: Wed, 14 Apr 2021 21:23:33 -0400
Message-Id: <20210415012337.1755-31-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13f495e4-ded5-41d8-35a9-08d8ffad2b16
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB420871FEEBF65EC026C0658E924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZuJp/EjnesvdTalYkwFKY1TX5DmTx4MkI9Lo6pccRPbu4NZ5uG7GS2HSB0Ep/GbqSlFUH+awfiohwHAVLBKLJcLEM/BRGZ5C5UnqVzQm/NbY4cA4c315qTbfv4KS/e9vcsJxCCxVYJZJfV2pKT//80ZxJbkWB0IOpCQpILA3fQNTyBEQRBIA3beN6ubNz/2ya62CzPf/x8isrEL9Ci/bVEIeTs3HKulPkkPlCtHB0x16GGoKV8qsejL27GjobiVmKH2pDbqMXSMe4AMH4OQFJr5IePYl183o7ZnbgDv1+0qaJBRDQEcfE+Xh7dIAnHxZEKFZ1vXVZf3mH2yc/QaNuni0XHnzwcMYCHX39I8mOXGYCmatdELrrbWq+7aakuyvKpZ952n/1ccJMHlGWcPh7p5lnKPZveyl2FFvuohAurvQhgnNSc3h3rghQH27sVQGEdwV3Hjg2OqLK9XR5f9Dz2pOIyAfL/uWMhecYP+Rj8MOEe2AlmwSd0gL/YX9dBR5IDjZzoeoQcIoMHz0E/6HYdi/xjYBhxDbdKcPZpS+KmGbzYLkEQDK9fJV/vDg3lYqAjmI0sUYKFRyI+ziCoS9DfqafmoEA91x+9CdqQnXwtEfGiZtJo/AZkYFurT5CAB0+UtBHbRTj4hVcvBPh/ZiHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(30864003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(54906003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ExC1DqK1YIpbvW6HXsdIti0n1RSSJ5VQ0oeUsfzLVnrN08YAAFium1ZdY/yz?=
 =?us-ascii?Q?io5APMHT0UKB4YWKAexNN/WA9RCxxpBcIErSdBziLd2fWjV6EIDbqeqUI7xd?=
 =?us-ascii?Q?rlKyrGKWCW6/Nt6IiCYgOwIImG6i7a8qcCRGlQDMge0/H+4mG5eElV2CxXJl?=
 =?us-ascii?Q?62PNOZT4kBkFThqIOZwTOP3siDBorMWDzcuNK+kOqqZ1uNxbrc1y4qVureXH?=
 =?us-ascii?Q?AekpzBAxbLD4weiBtV8hsaWdJVUBexWrGlZaASSLx/yhADJ3QNmI8uHnKCmK?=
 =?us-ascii?Q?hgCpiduv7mJJubsNa5VZV0PpRT2IJzL39L51Q3Xk2SWLSNGiiyBDUjZWZNbT?=
 =?us-ascii?Q?sGcVR3rTopqLy5rp1EiDWPU3Nq2Cr5HzGSE8sAOFTRif2aj6flD/3NSrhozx?=
 =?us-ascii?Q?bOx1KK0iX2+OxS1PLAcAc/Zh4ZooPyVlcirV3qm2ejkC1sjB3jwRzdCVTy3R?=
 =?us-ascii?Q?3oaYMXDKxO7muPNcOz2BpMLPFpF1dEnuCsY74QMd8zHCVu7flkepYhMlIZKE?=
 =?us-ascii?Q?D2Q0A+vjpPmmhsWrhQjz3WHTU+iYnrqFNORHd1Jl7bTYpWGM9NgE9oW3UpJu?=
 =?us-ascii?Q?MGpMqxF63DU1CU34P3hXi0Kcb7bxgGhv4YkwGSVVCAFQ/79HBjdIfrR6OT6j?=
 =?us-ascii?Q?DgFDF1XQI/mPWw0U6trGCySs3nTTN25d9oaa5/Kf+7lIurqg+wPSbqyI2nUQ?=
 =?us-ascii?Q?KiTGjDaHL0TU54J89NdgiQoCps6ui8LZSq5eOVRq78UuQOrZJH39oY6UrAEt?=
 =?us-ascii?Q?BOnpWNQlee/V7ZDORXD4oBqndn+m3hN4/3vBLKrtHEOvRWAM8RyuAb8O6rB0?=
 =?us-ascii?Q?+ntuFC82UoAnhbFJdOLfNFc2f02zd6Wxgd28qWRwhEwzbibasOokOmF4L5Tb?=
 =?us-ascii?Q?K65FmA+1UfljTK9T1+1ALLi1+eVNHQBn+A071y1ATKG0OojAdJWrswVO4fgJ?=
 =?us-ascii?Q?2apmdE4/4a9LWczg/2ltdKtoKO1+mZWEczey4Ve3faWo+hbkV2t6F96pyZ3q?=
 =?us-ascii?Q?OX4nxT3+1NYzYtWSDES2PIk0UNEF0UNWokcTB2DxGHIhplJxdFct0wjzjast?=
 =?us-ascii?Q?D8lzHpb9f0xCCCGdWVTqgjPLUuHqrGrThQbFn02/Sk1D8TxfWvLHhggLcksS?=
 =?us-ascii?Q?23ELX4g+T9VXvoxM1LeBxRERySNa1RCvrAdrRYP0VVYO3T/gs72YW5qZHywn?=
 =?us-ascii?Q?AjerkjT26cu1Z+GFvUd3HokGsVLWQUTJceRCQZyuhgmPPeXCjLzAPxznSANV?=
 =?us-ascii?Q?ubCu2ApJR5fnK1CAWmMCHGMIl6AR5h7HqTcAez3V9fDxU5rKhaCplNx55qDy?=
 =?us-ascii?Q?LfMWazValbVXONmB3ZElhgcW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f495e4-ded5-41d8-35a9-08d8ffad2b16
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:09.2068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhnaTApvO7KwThALkKDiBwpn3rlsK9epWX6w46ELsv69R0pRBLVtFlQfX0r/FLdsZVQj+Sn05IAZh+kd/A1cDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
index 5e0fec5dbcd6..9c1199d1b61b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -480,18 +480,19 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
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
@@ -515,8 +516,6 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
 	start = prange->start << PAGE_SHIFT;
 	end = (prange->last + 1) << PAGE_SHIFT;
 
-	mm = current->mm;
-
 	for (addr = start; addr < end;) {
 		unsigned long next;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 082b9bb22270..53c899b80b85 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -38,7 +38,8 @@ enum MIGRATION_COPY_DIR {
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
index b6ba2b91bdc3..dfc9e4bf7c72 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1681,6 +1681,22 @@ int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id)
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
index 6d3add17fcac..40e1dc42a981 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1317,6 +1317,24 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -2046,15 +2064,75 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
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
@@ -2089,11 +2167,48 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 
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
@@ -2230,7 +2345,7 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 	return 0;
 }
 
-/* svm_range_best_location - decide the best actual location
+/* svm_range_best_prefetch_location - decide the best prefetch location
  * @prange: svm range structure
  *
  * For xnack off:
@@ -2252,7 +2367,8 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
  * Return:
  * 0 for CPU or GPU id
  */
-static uint32_t svm_range_best_location(struct svm_range *prange)
+static uint32_t
+svm_range_best_prefetch_location(struct svm_range *prange)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	uint32_t best_loc = prange->prefetch_loc;
@@ -2354,7 +2470,7 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	int r = 0;
 
 	*migrated = false;
-	best_loc = svm_range_best_location(prange);
+	best_loc = svm_range_best_prefetch_location(prange);
 
 	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
 	    best_loc == prange->actual_loc)
@@ -2366,10 +2482,10 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 
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
