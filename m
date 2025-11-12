Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFFCC50F18
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BC110E6B7;
	Wed, 12 Nov 2025 07:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4bW3trL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA2D10E6B9;
 Wed, 12 Nov 2025 07:30:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEQItz8uGEaatgJ1Aeydr6+kt8/hXTuqzEIvD2YLBSS7pr7qXWMoPcX7RtgMfpbjd3NNFR/aSVd09HSKOBD9O54O0AScB/MscOLB4Y7cf6lllUsF0yXrr+FVzJJBmkJwvTQocUpYE7S2dfYsUIU69s1KEnXUgWLnXisu7TIhCLZGgNkTCWessKTAYyrEVebYs0B9NztXmTy2uiNNV/LjRLWkmOTSstKzcyo5AENeKvzg083v/e0zqh34zLaeqW1drT2D1a6/tfVLboaQfwYagXdqWq7kTBRMy9ARsT20i3Pmisl1QGqT7iREvlqQs9xBl2J6PfUIDKLhb5OvFzTL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdSu7wEPy9mChgu+QLxKAfgk5d6VeqhFPrj7riMlPyM=;
 b=it57y7+NMW2ViNGbgx5DGbVfNnfYk/venFdmWSfr0vWJUwHZKizLj60BXXA9pzyhCUDNx42o8tJHgcS1XaN5XFJ3Tp1HhG5t+ZqlCX8RjwvbkmtRObkjQsktlZDscNN3z/kI226zc0j8hUiuraNMENBlMFb5JSNyWnaBy3HlmwT02P47C7g6Sz6lKG7UURM9rwQNCGBAOsnoGQP2mV3sGFYTSC6nno/US+9OYGYUYD3r/LL+3T3Rrf5AzLLkxcvEH+wjSWWHmJ6S6qfcOk3S1eVwaHC7+HmwM/zleubVVON5Zfsetlh5uQf6hQzzWFBSbm47ZUe1nhx5I+IT7Kj3vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdSu7wEPy9mChgu+QLxKAfgk5d6VeqhFPrj7riMlPyM=;
 b=4bW3trL0POrBvhOcvIngwMThHt+0GNPpPRSkry6J3/4rOlIVmBK8Fm/4S3P8K7EZrNkuj5DmD5I4hxNZzi+BOsaC1QAkvLad4cDs0cMst7wJgw4qa1KfIZyGeg993Ic8FrMV1wHlqW4jSya5QnqZA+5J8zL6Q2AppoT+BAW7Rvs=
Received: from CH0PR03CA0365.namprd03.prod.outlook.com (2603:10b6:610:119::13)
 by BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 07:30:26 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::a) by CH0PR03CA0365.outlook.office365.com
 (2603:10b6:610:119::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 07:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:30:26 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:30:04 -0800
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuang@amd.com>,
 Honglei Huang <Honglei1.Huang@amd.com>
Subject: [PATCH 4/5] drm/amdkfd: Add support for pinned user pages in SVM
 ranges
Date: Wed, 12 Nov 2025 15:29:09 +0800
Message-ID: <20251112072910.3716944-5-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112072910.3716944-1-honglei1.huang@amd.com>
References: <20251112072910.3716944-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|BY5PR12MB4305:EE_
X-MS-Office365-Filtering-Correlation-Id: d4939ed4-4fdf-41ee-4d2a-08de21bd593d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wdb3eAH55k/bbFgW45bkhptHYfUmJgkQUTP/4rDOueVi8U8Pc3yU9fchgXVQ?=
 =?us-ascii?Q?+ijp5CJGrkoVxOT8kNaF15WVSv9AvVbzmbkswptjWD+M/WHPvOjHRhc21GgA?=
 =?us-ascii?Q?ex/rsmIfxSb2Hsbn685OADhcTnCzb2eogbQ0Uop9uRv0GqSt2qhG/joXYdDf?=
 =?us-ascii?Q?eq56lHoQNLxGKUJoLor9nHOaCG0Wb/XCFGMI/h05JcmvUegfws58eE85hIKc?=
 =?us-ascii?Q?zbZf28Xk9H8mswNBk1PDVIamoPvN4W3O8GPjBTb+mYUdOIitcdZpBrHwr9pr?=
 =?us-ascii?Q?cD/oRLGeVB1ctYYIkDDWu5ziyiarRy1Z0oO4tG9yjODsDBBpneM1kixOCfTu?=
 =?us-ascii?Q?v0w7Xzo+hi1jKC92LvW5yHuQUlK/Cv7mopoAQwm5G/1/4jrbky0GzTW/SfCY?=
 =?us-ascii?Q?mrWMqOE2g3e7FF3WVitcAavPFUhN+/jBlFDZaIjSCpcJye7llV/A9jBfx1Ec?=
 =?us-ascii?Q?ZsgWZqKd8NxsjdvIl3b88DACEMHKyPc7VowExeZyLJaY/7C4Vci64ntFB3Yu?=
 =?us-ascii?Q?00tDy76jY/5swNeDxLVQatKFKTEMwhIzgK25g83/gUNGnsXogsc6idRFCBYE?=
 =?us-ascii?Q?WRHWgOFi4kuIuVHseq9z5i//zR7FCO31LXK9yz60wye1E8azCHlQCo1QPNPI?=
 =?us-ascii?Q?NeON+/ZE2IXNL/SFrIAHUwqxSr0UT9hsuIuqfcgEDBR+ccMTTGUl3BkB5qyF?=
 =?us-ascii?Q?Z570Qt8oshwqXknhXaVpv7jTXoHl/6Z59YLJBQyjQCSVaAw773nUWnpC0v+l?=
 =?us-ascii?Q?lhX4KqeoUoWyt4gwTGqSYhbulfL9euINBrYlWmetRFJS4pwbir7DEONggrH1?=
 =?us-ascii?Q?CRM8ZB9Kj9HfSw/0P/tKdXoaExRkI5wWP7k91xm5lBMeZ9nCrIByuXlJrRU/?=
 =?us-ascii?Q?UCTmSgmqSbXx5EBJASMxIU3dJLq7CID4YogM2aMwTMwV09jKHq1Hdgs+ESgo?=
 =?us-ascii?Q?bXJfhvoHY6vmSYAZgCT4NbSJRAEw4ClfBuCkU8Sbv7Uv9wdtlsks0c/Sodja?=
 =?us-ascii?Q?hMlBXg+8i8ScVE1ru0OfGhlVa8U48jIu7SpaX7+0Ts65fbpKYWQXKUEkRv5p?=
 =?us-ascii?Q?2n9L2r9/d3LBjKi3e1oWXABfMfsx+Yi7uyeFL5PMqSsTx+HcLYReRlRmdfKn?=
 =?us-ascii?Q?Gw/cbJTxSH7z49HENgluooYgAb91/JbB0bC2av3n7wZgGJog5Fzalr3pS1hQ?=
 =?us-ascii?Q?QZOEU3Lg3CZSIR0f0Ghp2F4husf+9CkngZ08eh8UIH30sxOB7H//Gjic5tl4?=
 =?us-ascii?Q?euW6tE1vMGEQDUp96IQlb0X5Jz6V5/q5fycERy9Yla6pnpZrfsi+lXudSPIh?=
 =?us-ascii?Q?NnYoto7+7+6B26HMuE/sdrfoDS2iQla2tpbIulLwb3Gzh57FJTeOtk3Jo8w1?=
 =?us-ascii?Q?+j/FQ+J+FzDn2aDYck4FQzILF37/Ay7OHplqaKONr3OypzpSsQDes5uwTvWT?=
 =?us-ascii?Q?BQLuN3ZUIUM+MDCc6f7OqIY+ZEk/7CnGBIT65uKHe5hVcNXwf4CPppFUEGzY?=
 =?us-ascii?Q?66l97ejM2DxWnn1oDu+FOPspDI7xmOf1FjDZLj5b9orHHPBStP6WVyFQSNuy?=
 =?us-ascii?Q?LhhZeG6l6RYFV8Mu1nc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:30:26.2382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4939ed4-4fdf-41ee-4d2a-08de21bd593d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305
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

From: Honglei Huang <Honglei1.Huang@amd.com>

Implement core functionality to pin and manage user pages for
non-contiguous SVM ranges:

1. Add svm_pin_user_ranges() function:
   - Pin multiple non-contiguous user memory ranges
   - Use pin_user_pages_fast() to lock pages in memory
   - Store pinned pages in VMA's vm_private_data
   - Set up custom VMA operations for fault handling

2. Add svm_range_get_mapped_pages() function:
   - Optimized path for pre-mapped VMAs
   - Retrieve pages directly from vm_private_data
   - Bypass HMM for already-pinned pages

3. Implement svm_iovec_ops VMA operations:
   - svm_iovec_fault(): Handle page faults by returning pre-pinned pages
   - svm_iovec_close(): Cleanup and unpin pages on VMA close

4. Add is_map flag to struct svm_range:
   - Track whether a range uses the pinned pages mechanism
   - Enable conditional logic in DMA mapping and validation paths

5. Update DMA mapping logic:
   - Skip special device page handling for pinned user pages
   - Treat pinned pages as regular system memory for DMA

6. Modify validation logic:
   - svm_range_is_valid() accepts mapped VMAs when is_map flag is set
   - svm_range_validate_and_map() uses appropriate page retrieval path

This infrastructure enables efficient handling of scattered user
buffers without requiring memory to be virtually contiguous,
supporting use cases like multiple malloc() allocations being
registered to GPU address space.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 232 ++++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |   3 +
 2 files changed, 229 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 31e500859ab0..fef0d147d938 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -179,7 +179,7 @@ svm_range_dma_map_dev(struct amdgpu_device *adev, struct svm_range *prange,
 			dma_unmap_page(dev, addr[i], PAGE_SIZE, dir);
 
 		page = hmm_pfn_to_page(hmm_pfns[i]);
-		if (is_zone_device_page(page)) {
+		if (is_zone_device_page(page) && prange->svm_bo && !prange->is_map) {
 			struct amdgpu_device *bo_adev = prange->svm_bo->node->adev;
 
 			addr[i] = (hmm_pfns[i] << PAGE_SHIFT) +
@@ -682,6 +682,18 @@ static int svm_range_bo_validate(void *param, struct amdgpu_bo *bo)
 	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 }
 
+static bool
+svm_range_has_mapped_attr(uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
+{
+	uint32_t i;
+
+	for (i = 0; i < nattr; i++) {
+		if (attrs[i].type == KFD_IOCTL_SVM_ATTR_MAPPED)
+			return true;
+	}
+	return false;
+}
+
 static int
 svm_range_check_attr(struct kfd_process *p,
 		     uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
@@ -713,6 +725,8 @@ svm_range_check_attr(struct kfd_process *p,
 			break;
 		case KFD_IOCTL_SVM_ATTR_GRANULARITY:
 			break;
+		case KFD_IOCTL_SVM_ATTR_MAPPED:
+			break;
 		default:
 			pr_debug("unknown attr type 0x%x\n", attrs[i].type);
 			return -EINVAL;
@@ -777,6 +791,9 @@ svm_range_apply_attrs(struct kfd_process *p, struct svm_range *prange,
 		case KFD_IOCTL_SVM_ATTR_GRANULARITY:
 			prange->granularity = min_t(uint32_t, attrs[i].value, 0x3F);
 			break;
+		case KFD_IOCTL_SVM_ATTR_MAPPED:
+			prange->is_map = true;
+			break;
 		default:
 			WARN_ONCE(1, "svm_range_check_attrs wasn't called?");
 		}
@@ -830,6 +847,8 @@ svm_range_is_same_attrs(struct kfd_process *p, struct svm_range *prange,
 			if (prange->granularity != attrs[i].value)
 				return false;
 			break;
+		case KFD_IOCTL_SVM_ATTR_MAPPED:
+			return false;
 		default:
 			WARN_ONCE(1, "svm_range_check_attrs wasn't called?");
 		}
@@ -1547,6 +1566,81 @@ static void *kfd_svm_page_owner(struct kfd_process *p, int32_t gpuidx)
 	return SVM_ADEV_PGMAP_OWNER(pdd->dev->adev);
 }
 
+static int svm_range_is_mapped_vma(struct vm_area_struct *vma)
+{
+	return vma && (vma->vm_flags & (VM_IO | VM_PFNMAP));
+}
+
+static int svm_range_get_mapped_pages(struct mmu_interval_notifier *notifier,
+				      struct mm_struct *mm, struct page **pages,
+				      uint64_t start, uint64_t npages,
+				      struct hmm_range **phmm_range,
+				      bool readonly, bool mmap_locked,
+				      void *owner, struct vm_area_struct *vma)
+{
+	struct hmm_range *hmm_range;
+	unsigned long *pfns;
+
+	unsigned long vma_size;
+	struct page **vma_pages;
+	unsigned long vma_start_offset;
+	unsigned long i;
+	int r = 0;
+
+	hmm_range = kzalloc(sizeof(*hmm_range), GFP_KERNEL);
+	if (unlikely(!hmm_range))
+		return -ENOMEM;
+
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (unlikely(!pfns)) {
+		r = -ENOMEM;
+		goto out_free_range;
+	}
+
+	hmm_range->notifier = notifier;
+	hmm_range->default_flags = HMM_PFN_REQ_FAULT;
+	if (!readonly)
+		hmm_range->default_flags |= HMM_PFN_REQ_WRITE;
+	hmm_range->hmm_pfns = pfns;
+	hmm_range->start = start;
+	hmm_range->end = start + npages * PAGE_SIZE;
+	hmm_range->dev_private_owner = owner;
+
+	hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
+
+	if (likely(!mmap_locked))
+		mmap_read_lock(mm);
+
+	vma_pages = vma->vm_private_data;
+	vma_size = vma->vm_end - vma->vm_start;
+	vma_start_offset = (unsigned long)start - vma->vm_start;
+
+	if ((vma_size >> PAGE_SHIFT) < npages) {
+		pr_err("ERROR: mapped vma npages: %lx < userptr map npages: %llx\n",
+		       vma_size, npages);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < npages; i++)
+		pfns[i] = page_to_pfn(
+			vma_pages[(vma_start_offset >> PAGE_SHIFT) + i]);
+
+	if (likely(!mmap_locked))
+		mmap_read_unlock(mm);
+
+	for (i = 0; pages && i < npages; i++)
+		pages[i] = hmm_pfn_to_page(pfns[i]);
+
+	*phmm_range = hmm_range;
+
+	return 0;
+
+out_free_range:
+	kfree(hmm_range);
+
+	return r;
+}
+
 /*
  * Validation+GPU mapping with concurrent invalidation (MMU notifiers)
  *
@@ -1674,7 +1768,15 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 			next = min(vma->vm_end, end);
 			npages = (next - addr) >> PAGE_SHIFT;
 			WRITE_ONCE(p->svms.faulting_task, current);
-			r = amdgpu_hmm_range_get_pages(&prange->notifier, addr, npages,
+			if (svm_range_is_mapped_vma(vma))
+			{
+				r = svm_range_get_mapped_pages(&prange->notifier, mm, NULL,
+							addr, npages, &hmm_range,
+							readonly, true, owner, vma);
+				prange->is_map = true;
+			}
+			else
+				r = amdgpu_hmm_range_get_pages(&prange->notifier, addr, npages,
 						       readonly, owner, NULL,
 						       &hmm_range);
 			WRITE_ONCE(p->svms.faulting_task, NULL);
@@ -3269,9 +3371,9 @@ svm_range_check_vm(struct kfd_process *p, uint64_t start, uint64_t last,
  *  0 - OK, otherwise error code
  */
 static int
-svm_range_is_valid(struct kfd_process *p, uint64_t start, uint64_t size)
+svm_range_is_valid(struct kfd_process *p, uint64_t start, uint64_t size, bool mapped)
 {
-	const unsigned long device_vma = VM_IO | VM_PFNMAP | VM_MIXEDMAP;
+	const unsigned long device_vma = mapped ? 0 : VM_IO | VM_PFNMAP | VM_MIXEDMAP;
 	struct vm_area_struct *vma;
 	unsigned long end;
 	unsigned long start_unchg = start;
@@ -3510,6 +3612,8 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 	svm_range_bo_unref(svm_bo);
 }
 
+
+
 static int
 svm_range_set_attr(struct kfd_process *p, struct mm_struct *mm,
 		   uint64_t start, uint64_t size, uint32_t nattr,
@@ -3525,6 +3629,7 @@ svm_range_set_attr(struct kfd_process *p, struct mm_struct *mm,
 	struct svm_range *next;
 	bool update_mapping = false;
 	bool flush_tlb;
+	bool if_mapped;
 	int r, ret = 0;
 
 	pr_debug("pasid 0x%x svms 0x%p [0x%llx 0x%llx] pages 0x%llx\n",
@@ -3540,7 +3645,9 @@ svm_range_set_attr(struct kfd_process *p, struct mm_struct *mm,
 
 	svm_range_list_lock_and_flush_work(svms, mm);
 
-	r = svm_range_is_valid(p, start, size);
+	if_mapped = svm_range_has_mapped_attr(nattr, attrs);
+
+	r = svm_range_is_valid(p, start, size, if_mapped);
 	if (r) {
 		pr_debug("invalid range r=%d\n", r);
 		mmap_write_unlock(mm);
@@ -3679,7 +3786,7 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	flush_work(&p->svms.deferred_list_work);
 
 	mmap_read_lock(mm);
-	r = svm_range_is_valid(p, start, size);
+	r = svm_range_is_valid(p, start, size, false);
 	mmap_read_unlock(mm);
 	if (r) {
 		pr_debug("invalid range r=%d\n", r);
@@ -4153,3 +4260,116 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 
 	return r;
 }
+
+static void svm_iovec_close(struct vm_area_struct *vma)
+{
+	struct page **pages = vma->vm_private_data;
+	uint32_t npages;
+
+	if (!pages)
+		return;
+
+	npages = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
+
+	unpin_user_pages_dirty_lock(pages, npages, false);
+	pr_debug("svm_iovec_close, unpin pages, start: 0x%lx, npages: 0x%x\n",
+		 vma->vm_start, npages);
+
+	kvfree(pages);
+	vma->vm_private_data = NULL;
+}
+
+static vm_fault_t svm_iovec_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct page **pages;
+
+	if ((vmf->pgoff << PAGE_SHIFT) >= (vma->vm_end - vma->vm_start)) {
+		return VM_FAULT_SIGBUS;
+	}
+
+	pages = (struct page **)vma->vm_private_data;
+	if (!pages) {
+		return VM_FAULT_SIGBUS;
+	}
+
+	vmf->page = pages[vmf->pgoff];
+
+	return VM_FAULT_NOPAGE;
+}
+
+static const struct vm_operations_struct svm_iovec_ops = {
+	.close = svm_iovec_close,
+	.fault = svm_iovec_fault,
+};
+
+int svm_pin_user_ranges(struct kfd_process *p, uint64_t start, uint64_t size,
+			struct kfd_ioctl_svm_range *ranges, uint64_t nranges)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma;
+	struct page **pages = NULL, **cur_page;
+	uint32_t vma_size, npages = 0, pinned_pages = 0;
+	int i, ret;
+
+	mmap_read_lock(mm);
+	vma = find_vma(mm, start);
+	if (!vma) {
+		pr_err("failed to find vma, start: 0x%llx\n", start);
+		mmap_read_unlock(mm);
+		return -EINVAL;
+	}
+	mmap_read_unlock(mm);
+
+	if (vma->vm_ops == &svm_iovec_ops)
+		return 0;
+
+	vma_size = vma->vm_end - vma->vm_start;
+	if (size > vma_size) {
+		pr_err("vma size: %x < target size: %llx\n", vma_size, size);
+		goto failed_free;
+	}
+
+	for (i = 0; i < nranges; i++) {
+		npages += ranges[i].size >> PAGE_SHIFT;
+	}
+
+	pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
+	if (!pages) {
+		pr_err("failed to allocate pages\n");
+		ret = -ENOMEM;
+		goto failed_free;
+	}
+
+	cur_page = pages;
+
+	for (i = 0; i < nranges; i++) {
+		ret = pin_user_pages_fast(ranges[i].addr,
+					  (ranges[i].size >> PAGE_SHIFT),
+					  FOLL_WRITE | FOLL_FORCE, cur_page);
+		if (ret < 0) {
+			pr_err("failed to pin user pages, addr: 0x%llx, size: 0x%llx\n",
+			       ranges[i].addr, ranges[i].size);
+			if (pinned_pages)
+				unpin_user_pages(pages, pinned_pages);
+			goto failed_free;
+		}
+
+		cur_page += (ranges[i].size >> PAGE_SHIFT);
+		pinned_pages += (ranges[i].size >> PAGE_SHIFT);
+	}
+
+	mmap_write_lock(mm);
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+	vma->vm_private_data = pages;
+	vma->vm_ops = &svm_iovec_ops;
+	mmap_write_unlock(mm);
+	return 0;
+
+failed_free:
+	if (pages) {
+		unpin_user_pages_dirty_lock(pages, pinned_pages, false);
+		kvfree(pages);
+	}
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 70c1776611c4..ebaa10fce8c1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -137,6 +137,7 @@ struct svm_range {
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
 	bool				mapped_to_gpu;
+	bool				is_map;
 };
 
 static inline void svm_range_lock(struct svm_range *prange)
@@ -207,6 +208,8 @@ void svm_range_bo_unref_async(struct svm_range_bo *svm_bo);
 
 void svm_range_set_max_pages(struct amdgpu_device *adev);
 int svm_range_switch_xnack_reserve_mem(struct kfd_process *p, bool xnack_enabled);
+int svm_pin_user_ranges(struct kfd_process *p, uint64_t start, uint64_t size,
+			struct kfd_ioctl_svm_range *ranges, uint64_t nranges);
 
 #else
 
-- 
2.34.1

