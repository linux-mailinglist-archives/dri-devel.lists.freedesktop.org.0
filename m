Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DD85EDC2D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A47810E489;
	Wed, 28 Sep 2022 12:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F366110E46F;
 Wed, 28 Sep 2022 12:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEOS/+LtHw4vjFrWRApv8ly7uDhTlKeJHC3UDVYjXPBY8e8OmFOxk0rXrSOKAq254Lgi/NXNwyY2Z3VgdoYzBRYu0H6bTOriX8K8CZMrMdMVDIOprpDZLafB+h59hY8vLP0fjFNfWXyEvhdnXbTOmVzffNfougIx2Gbm84MSqaxjfxhiyXvs49Gs46cZtbti7nMgov6YZhCkZT7xO766FFNyQfvTnecE6KukRTcmyaq18krUOG5JslOdYw+ypnZ6mjkQXiA6WK+EpoUHamPND3JLNl2xhjlUGTwj2mQQFE21LW0AxZKGxuCSr1WIRzDgUS3sgYr97EIHQ0ZGA9mdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/weI2KkhCvXKV8t2ezOZUyHcQhYCO5tbBFcGHCZcjc8=;
 b=etO8AmNJEBkVHG0B9uyFaagwQZoxnrbm+T/E7uDu9lG83NTRK5AF9cQTKQHLeJIqDG0i1u8ervxFefm+V+J4usH+l35gvwL/Ju+Dh7Np/Oq5PtHHxnt/X9d0rA4ymNCzsh8oCFdP1ps047k+LtRoYMG+mS5XijI3/IjciYlNRfAPzDtb/acmALwTdI5t65FD6U8CkAWHNmVoMe6Jev7cwwSQQc5DmammeAaFEeDWe6tLO2/hwEGxY12qP0esfiMPTEPAQXFowe3iae++4CEdjXkeoB9ALgchF707tVGmxUfklXnlQwT5xBfBWePmk2Avn63ycJd/vZKmMKI25GgHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/weI2KkhCvXKV8t2ezOZUyHcQhYCO5tbBFcGHCZcjc8=;
 b=EUj+MAyvdZC1b8kNcHOZ5fJTexnTdAoul4w9V9tfzh+ewQYwgIs47HAAbVzBYuFAzi69IHCj86EhV0AsGpuMnBjbbybMpTB1UFZkNcuEXNvNNZ9OjnG0eC1RfVmGFCnE35NlxxcOsXLYo/MBeJXs7XWhN1HKOZb5O9UnP5TzWr2qG343/YKT0rc4wlqOno2BYgX3lFbqnzL23kX1q6ZdzN8NuC3JWHv+YRkWkovQIE1zpO1/gFa8azzJXYbxe5H82qpBrpnNSwlMnInhMpi3GgwuCyK0he6zqv0pTpE6AYgcWmwyLRZyEsgO5HXinnjUaDaDk+dzz0sJbeWiiKszsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:01:44 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 12:01:44 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2 1/8] mm/memory.c: Fix race when faulting a device private
 page
Date: Wed, 28 Sep 2022 22:01:15 +1000
Message-Id: <d3e813178a59e565e8d78d9b9a4e2562f6494f90.1664366292.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0126.ausprd01.prod.outlook.com
 (2603:10c6:10:5::18) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: ba17ac09-e699-4850-0501-08daa149361f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbXmhi7bIuhzzsB3TYygKoRsRC68sUqAi9si6G1v+xyaBFEPxBXuzLylE9I4im+vYZYrKlqOSjPALRLp2oBzVB6QgEJOosix235UF3lVv8fhm2WGk10VcXfSbcjMb8cjbm7v/OWXh7F75LShKafp1+gORqjEiP2oCHxZoja+/j+doUSBDgTN8WVMSDWLwMnQXr1i4zmJE/nKbGnISrP5LfiwitM3vhdY3vw8OYNgFARHAP5J6Y6Nqr1Q9wFFHIUE1y0gfLbuefHgK0VHGXKQkPQSFE9ckZW51B68O2t8UPJ67FibjvpoAX4aI/ar2IuBpFHcHS75puXYvIst+FetKjkZ62rhZ+y84S5PKpX9VOpEN6zS7g/9xWR1MmChiBfSzM64zlKQ8AW7dgFzdsWzKunTVDreHd5bt0L4f4UnF46B2Sapqm9amilo9HRKCYAmo7ZmWSTcPTgv0BthufLCBC24GFphp6P7OBrOUl1xu2R74Usf4xE4VjXmHqJfBIZTQcPMCdJsf9VB9wPVpcQgWNr39pvp7NScJo44YvAecWlycqUzI9KQ2cbcitcQxUlEFuo1XFfHEBfg5ZKZFQrCVzlQC2wlr0Qx0FmwnqDCwR77tkqT4q7nxFWVPDoPUWQ1cJ045078pUUTdfd+z+Nvt2Iwg4rf+sLcJMmmXrFOBo4nZt1CAyA2cW5mPksLAVx6cB55YgTko1ETsUVvj1Ha5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(86362001)(36756003)(2906002)(2616005)(6506007)(6666004)(30864003)(6512007)(26005)(38100700002)(83380400001)(54906003)(316002)(186003)(8936002)(5660300002)(4326008)(66556008)(8676002)(66946007)(66476007)(6486002)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qeTJSNF2OGhiFYzu9XUZZijacw3WtcwehvIPS3SNcdhElT6tGZl9J/KJvUdL?=
 =?us-ascii?Q?cFb3DgqR2QUUuKEcuPPjqDbU3na+YSt5A8+z2M97nQ3+PirtEjxFByQcVdbd?=
 =?us-ascii?Q?86AE2/GH/uPzycUI6YGSP3T7Io8fOAlfUwFWFzffCEJLzYGcyLU9iAauHnBJ?=
 =?us-ascii?Q?E/1C9H2H6aPTMV4uXbWKP6L78vi/11wJSClCc0d/gX49O5pv4Joe1jgJS156?=
 =?us-ascii?Q?61I03lJl0fhwJyiSErBz+v1ePCr+6Xi+b5sic8HOu7MGvIyix1ogBgTTyoi8?=
 =?us-ascii?Q?pdVI1VP9zNk5pQdo+977ILTEYy2RgHJACBCmfKLqsk6vPVOUT+1RTb3pmBmw?=
 =?us-ascii?Q?cbCVZPz8YTcyPmDhJ5a86dx8rhV5p+lqrrkSl08f+PtEOyBNoQgEnprS8PJU?=
 =?us-ascii?Q?84mwSEviqaQom1zsvXp2dhRzNb0dad7++ol+SG/38rsxG0MgI45QC51mIW+y?=
 =?us-ascii?Q?9ptaY9Jr9Y4s/aelYV5EocQQwmlbrBqyo19pL3d2jUD8Q/GFuzB5qkS+avrR?=
 =?us-ascii?Q?AvIFwxIoH4Qqzvx1B71fkAe0QITGUqceeWmQz4ex8KL3sCfSyTgQViUZ3DCl?=
 =?us-ascii?Q?OPw656m+0s4y9PIbQlU1KJvjE72BRl0LZHM0hcgDIDEnRXRCJKfDsEUeMkMX?=
 =?us-ascii?Q?6iBJyI8cAM2XWWQbTcyaqsHdRBE0tpiFz1iUknYRo78tm6cyLWIyAGWvVxLS?=
 =?us-ascii?Q?u1rqVKigLlQ0ly6yfHtsgxAhH8Tllhj20Wrrq6Z9Oy4xy+w8gg/7mofjmK4k?=
 =?us-ascii?Q?X9MjKxryS4MOAVUL4wx7BvqNJouR2VQyyjG/qtNotPpB8HTeSTNKE+z9PUHv?=
 =?us-ascii?Q?1HiISz/FUudjx2BqV05IdgGReLEe0JurKF5hJLMsxDY5WmAEp6M/nxruTojE?=
 =?us-ascii?Q?lMZCtKtan/hV93EDVfNVK+9xEm4J1GjjwVzVaxDgbqk5UCLPbCJNNYxeYvYC?=
 =?us-ascii?Q?Awbg/FtBL+AgBapnIBZ70KMu5FmYaUmHfkFpwhHXgnRJ6iE5Byh/IjMN31sY?=
 =?us-ascii?Q?cBfwEYHlBg1IqCV+0Hx7njK4ov4Uf0Fy+L0gD3rQCbqen0R3foxhLdifl5gt?=
 =?us-ascii?Q?4gSEmRWDyii6eXuic1izbrPvr1FbfUfa/unlmB+9f5WLs969LsSktlZzwSNk?=
 =?us-ascii?Q?IGMPGfKi+MdTyoBTTDCKD5QlA0PtUY6hzATXZsw6FblTo0inIfwNr6Q3eTYz?=
 =?us-ascii?Q?1ek0Gn0NTdUfTfKWI+5FXAw1hArXip/0F7/sFIsFYpiqNrhm/HllgAmK1/4t?=
 =?us-ascii?Q?dDx8LyEMH2WyBwJeiVpOCfbIjY4KttT1SIFMUUgzs/pI8Q5RmJ0SpGi/u1+T?=
 =?us-ascii?Q?bmilYzqz98EPgxrvY7juE8CrucVV2Pk8xpYa20vfLeQVAAwNTUw3oB6yWxWW?=
 =?us-ascii?Q?aHScOydrwn0+cA6uEjMG2tLZrenQsaqhlA1Iv8tLvS4RPtDsA0AhU1IqXcyG?=
 =?us-ascii?Q?h1ZSPF3DCztOIR86T5Dd6TZf3c66osjQLGIbbqO1RFMccxYDUsIl4DDoG6tN?=
 =?us-ascii?Q?OaXd8BzPZV6RJ3Q2FO1PFdPhP6tfN2F2zOLNEXuLjxfC4WuaOgS0A8O4tn7M?=
 =?us-ascii?Q?jl4172HqjDXYAPFQwkKZg6AlqX/iLpYTCt3NBIud?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba17ac09-e699-4850-0501-08daa149361f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:01:44.0283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUlwWxRaAYK5U4mHlu6EyUZXypwoZVATxbQD78sWPHDF21YsxDuEf86AJDRJpE3E/2sfrs3DcNGHrtZNLjm+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the CPU tries to access a device private page the migrate_to_ram()
callback associated with the pgmap for the page is called. However no
reference is taken on the faulting page. Therefore a concurrent
migration of the device private page can free the page and possibly the
underlying pgmap. This results in a race which can crash the kernel due
to the migrate_to_ram() function pointer becoming invalid. It also means
drivers can't reliably read the zone_device_data field because the page
may have been freed with memunmap_pages().

Close the race by getting a reference on the page while holding the ptl
to ensure it has not been freed. Unfortunately the elevated reference
count will cause the migration required to handle the fault to fail. To
avoid this failure pass the faulting page into the migrate_vma functions
so that if an elevated reference count is found it can be checked to see
if it's expected or not.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       | 15 ++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 +++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 11 +++++---
 include/linux/migrate.h                  |  8 ++++++-
 lib/test_hmm.c                           |  7 ++---
 mm/memory.c                              | 16 +++++++++++-
 mm/migrate.c                             | 34 ++++++++++++++-----------
 mm/migrate_device.c                      | 18 +++++++++----
 9 files changed, 87 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 5980063..d4eacf4 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -508,10 +508,10 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 		unsigned long start,
 		unsigned long end, unsigned long page_shift,
-		struct kvm *kvm, unsigned long gpa)
+		struct kvm *kvm, unsigned long gpa, struct page *fault_page)
 {
 	unsigned long src_pfn, dst_pfn = 0;
-	struct migrate_vma mig;
+	struct migrate_vma mig = { 0 };
 	struct page *dpage, *spage;
 	struct kvmppc_uvmem_page_pvt *pvt;
 	unsigned long pfn;
@@ -525,6 +525,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 	mig.dst = &dst_pfn;
 	mig.pgmap_owner = &kvmppc_uvmem_pgmap;
 	mig.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	mig.fault_page = fault_page;
 
 	/* The requested page is already paged-out, nothing to do */
 	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
@@ -580,12 +581,14 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
 				      unsigned long start, unsigned long end,
 				      unsigned long page_shift,
-				      struct kvm *kvm, unsigned long gpa)
+				      struct kvm *kvm, unsigned long gpa,
+				      struct page *fault_page)
 {
 	int ret;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
-	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
+	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa,
+				fault_page);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 
 	return ret;
@@ -736,7 +739,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		bool pagein)
 {
 	unsigned long src_pfn, dst_pfn = 0;
-	struct migrate_vma mig;
+	struct migrate_vma mig = { 0 };
 	struct page *spage;
 	unsigned long pfn;
 	struct page *dpage;
@@ -994,7 +997,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
 
 	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
 				vmf->address + PAGE_SIZE, PAGE_SHIFT,
-				pvt->kvm, pvt->gpa))
+				pvt->kvm, pvt->gpa, vmf->page))
 		return VM_FAULT_SIGBUS;
 	else
 		return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index b059a77..776448b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -409,7 +409,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	uint64_t npages = (end - start) >> PAGE_SHIFT;
 	struct kfd_process_device *pdd;
 	struct dma_fence *mfence = NULL;
-	struct migrate_vma migrate;
+	struct migrate_vma migrate = { 0 };
 	unsigned long cpages = 0;
 	dma_addr_t *scratch;
 	void *buf;
@@ -668,7 +668,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 static long
 svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 		       struct vm_area_struct *vma, uint64_t start, uint64_t end,
-		       uint32_t trigger)
+		       uint32_t trigger, struct page *fault_page)
 {
 	struct kfd_process *p = container_of(prange->svms, struct kfd_process, svms);
 	uint64_t npages = (end - start) >> PAGE_SHIFT;
@@ -676,7 +676,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	unsigned long cpages = 0;
 	struct kfd_process_device *pdd;
 	struct dma_fence *mfence = NULL;
-	struct migrate_vma migrate;
+	struct migrate_vma migrate = { 0 };
 	dma_addr_t *scratch;
 	void *buf;
 	int r = -ENOMEM;
@@ -699,6 +699,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 
 	migrate.src = buf;
 	migrate.dst = migrate.src + npages;
+	migrate.fault_page = fault_page;
 	scratch = (dma_addr_t *)(migrate.dst + npages);
 
 	kfd_smi_event_migration_start(adev->kfd.dev, p->lead_thread->pid,
@@ -766,7 +767,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
  * 0 - OK, otherwise error code
  */
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
-			    uint32_t trigger)
+			    uint32_t trigger, struct page *fault_page)
 {
 	struct amdgpu_device *adev;
 	struct vm_area_struct *vma;
@@ -807,7 +808,8 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 		}
 
 		next = min(vma->vm_end, end);
-		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger);
+		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger,
+			fault_page);
 		if (r < 0) {
 			pr_debug("failed %ld to migrate prange %p\n", r, prange);
 			break;
@@ -851,7 +853,7 @@ svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc);
 
 	do {
-		r = svm_migrate_vram_to_ram(prange, mm, trigger);
+		r = svm_migrate_vram_to_ram(prange, mm, trigger, NULL);
 		if (r)
 			return r;
 	} while (prange->actual_loc && --retries);
@@ -938,7 +940,8 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 		goto out_unlock_prange;
 	}
 
-	r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU);
+	r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU,
+				vmf->page);
 	if (r)
 		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
 			 prange, prange->start, prange->last);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index b3f0754..a5d7e6d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -43,7 +43,7 @@ enum MIGRATION_COPY_DIR {
 int svm_migrate_to_vram(struct svm_range *prange,  uint32_t best_loc,
 			struct mm_struct *mm, uint32_t trigger);
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
-			    uint32_t trigger);
+			    uint32_t trigger, struct page *fault_page);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 11074cc..9139e5a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2913,13 +2913,15 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 				 */
 				if (prange->actual_loc)
 					r = svm_migrate_vram_to_ram(prange, mm,
-					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
+					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
+					   NULL);
 				else
 					r = 0;
 			}
 		} else {
 			r = svm_migrate_vram_to_ram(prange, mm,
-					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
+					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
+					NULL);
 		}
 		if (r) {
 			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
@@ -3242,7 +3244,8 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 		return 0;
 
 	if (!best_loc) {
-		r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PREFETCH);
+		r = svm_migrate_vram_to_ram(prange, mm,
+					KFD_MIGRATE_TRIGGER_PREFETCH, NULL);
 		*migrated = !r;
 		return r;
 	}
@@ -3303,7 +3306,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 		mutex_lock(&prange->migrate_mutex);
 		do {
 			r = svm_migrate_vram_to_ram(prange, mm,
-						KFD_MIGRATE_TRIGGER_TTM_EVICTION);
+					KFD_MIGRATE_TRIGGER_TTM_EVICTION, NULL);
 		} while (!r && prange->actual_loc && --retries);
 
 		if (!r && prange->actual_loc)
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 22c0a0c..82ffa47 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -62,6 +62,8 @@ extern const char *migrate_reason_names[MR_TYPES];
 #ifdef CONFIG_MIGRATION
 
 extern void putback_movable_pages(struct list_head *l);
+int migrate_folio_extra(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode, int extra_count);
 int migrate_folio(struct address_space *mapping, struct folio *dst,
 		struct folio *src, enum migrate_mode mode);
 extern int migrate_pages(struct list_head *l, new_page_t new, free_page_t free,
@@ -212,6 +214,12 @@ struct migrate_vma {
 	 */
 	void			*pgmap_owner;
 	unsigned long		flags;
+
+	/*
+	 * Set to vmf->page if this is being called to migrate a page as part of
+	 * a migrate_to_ram() callback.
+	 */
+	struct page		*fault_page;
 };
 
 int migrate_vma_setup(struct migrate_vma *args);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e3965ca..89463ff 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -907,7 +907,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 	struct vm_area_struct *vma;
 	unsigned long src_pfns[64] = { 0 };
 	unsigned long dst_pfns[64] = { 0 };
-	struct migrate_vma args;
+	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
 
@@ -968,7 +968,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long src_pfns[64] = { 0 };
 	unsigned long dst_pfns[64] = { 0 };
 	struct dmirror_bounce bounce;
-	struct migrate_vma args;
+	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
 
@@ -1334,7 +1334,7 @@ static void dmirror_devmem_free(struct page *page)
 
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
-	struct migrate_vma args;
+	struct migrate_vma args = { 0 };
 	unsigned long src_pfns = 0;
 	unsigned long dst_pfns = 0;
 	struct page *rpage;
@@ -1357,6 +1357,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	args.dst = &dst_pfns;
 	args.pgmap_owner = dmirror->mdevice;
 	args.flags = dmirror_select_device(dmirror);
+	args.fault_page = vmf->page;
 
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
diff --git a/mm/memory.c b/mm/memory.c
index b994784..65d3977 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3742,7 +3742,21 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			ret = remove_device_exclusive_entry(vmf);
 		} else if (is_device_private_entry(entry)) {
 			vmf->page = pfn_swap_entry_to_page(entry);
-			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
+			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
+					vmf->address, &vmf->ptl);
+			if (unlikely(!pte_same(*vmf->pte, vmf->orig_pte))) {
+				spin_unlock(vmf->ptl);
+				goto out;
+			}
+
+			/*
+			 * Get a page reference while we know the page can't be
+			 * freed.
+			 */
+			get_page(vmf->page);
+			pte_unmap_unlock(vmf->pte, vmf->ptl);
+			vmf->page->pgmap->ops->migrate_to_ram(vmf);
+			put_page(vmf->page);
 		} else if (is_hwpoison_entry(entry)) {
 			ret = VM_FAULT_HWPOISON;
 		} else if (is_swapin_error_entry(entry)) {
diff --git a/mm/migrate.c b/mm/migrate.c
index ce6a58f..e3f78a7 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -620,6 +620,25 @@ EXPORT_SYMBOL(folio_migrate_copy);
  *                    Migration functions
  ***********************************************************/
 
+int migrate_folio_extra(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode, int extra_count)
+{
+	int rc;
+
+	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
+
+	rc = folio_migrate_mapping(mapping, dst, src, extra_count);
+
+	if (rc != MIGRATEPAGE_SUCCESS)
+		return rc;
+
+	if (mode != MIGRATE_SYNC_NO_COPY)
+		folio_migrate_copy(dst, src);
+	else
+		folio_migrate_flags(dst, src);
+	return MIGRATEPAGE_SUCCESS;
+}
+
 /**
  * migrate_folio() - Simple folio migration.
  * @mapping: The address_space containing the folio.
@@ -635,20 +654,7 @@ EXPORT_SYMBOL(folio_migrate_copy);
 int migrate_folio(struct address_space *mapping, struct folio *dst,
 		struct folio *src, enum migrate_mode mode)
 {
-	int rc;
-
-	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
-
-	rc = folio_migrate_mapping(mapping, dst, src, 0);
-
-	if (rc != MIGRATEPAGE_SUCCESS)
-		return rc;
-
-	if (mode != MIGRATE_SYNC_NO_COPY)
-		folio_migrate_copy(dst, src);
-	else
-		folio_migrate_flags(dst, src);
-	return MIGRATEPAGE_SUCCESS;
+	return migrate_folio_extra(mapping, dst, src, mode, 0);
 }
 EXPORT_SYMBOL(migrate_folio);
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 7235424..f756c00 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -313,14 +313,14 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
  * folio_migrate_mapping(), except that here we allow migration of a
  * ZONE_DEVICE page.
  */
-static bool migrate_vma_check_page(struct page *page)
+static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 {
 	/*
 	 * One extra ref because caller holds an extra reference, either from
 	 * isolate_lru_page() for a regular page, or migrate_vma_collect() for
 	 * a device page.
 	 */
-	int extra = 1;
+	int extra = 1 + (page == fault_page);
 
 	/*
 	 * FIXME support THP (transparent huge page), it is bit more complex to
@@ -393,7 +393,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 		if (folio_mapped(folio))
 			try_to_migrate(folio, 0);
 
-		if (page_mapped(page) || !migrate_vma_check_page(page)) {
+		if (page_mapped(page) ||
+		    !migrate_vma_check_page(page, migrate->fault_page)) {
 			if (!is_zone_device_page(page)) {
 				get_page(page);
 				putback_lru_page(page);
@@ -505,6 +506,8 @@ int migrate_vma_setup(struct migrate_vma *args)
 		return -EINVAL;
 	if (!args->src || !args->dst)
 		return -EINVAL;
+	if (args->fault_page && !is_device_private_page(args->fault_page))
+		return -EINVAL;
 
 	memset(args->src, 0, sizeof(*args->src) * nr_pages);
 	args->cpages = 0;
@@ -735,8 +738,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			continue;
 		}
 
-		r = migrate_folio(mapping, page_folio(newpage),
-				page_folio(page), MIGRATE_SYNC_NO_COPY);
+		if (migrate->fault_page == page)
+			r = migrate_folio_extra(mapping, page_folio(newpage),
+						page_folio(page),
+						MIGRATE_SYNC_NO_COPY, 1);
+		else
+			r = migrate_folio(mapping, page_folio(newpage),
+					page_folio(page), MIGRATE_SYNC_NO_COPY);
 		if (r != MIGRATEPAGE_SUCCESS)
 			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
-- 
git-series 0.9.1
