Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631487CCEFD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4ED10E33D;
	Tue, 17 Oct 2023 21:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7BE10E356;
 Tue, 17 Oct 2023 21:14:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmYgYR6O/eAuAI97dddKpe+WESrHXNrJbzA40ZirWY0VKY4vGHQNcAQe31flP9pVNp6Ez+KF/uMjWGxdzYDrF1MmntaE+BEAkA+i3877QiMkTv+nWRdHqD/UFMW7UzGy/cc9SCiUg04gsf6bahCW4OUeUiacEwOh0awEedzw1QPDdb0guqfag0Hf4c2fsqbC54Tvlp/BzTcDqoWBxKSu/jfEbGiGqZ5nHc4pFUIcc0VLF2TxfQL4SFGu53h4xKztsq2P5BfilzznURMQ2pi/1LNNTGQ76qfunfKxzmRICF6CAD3Z1BtITNyp/vdNZ0W2GeperWku4PdIUerhso1t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYHATuho7LcB17bwU2rZ0BhICtqsy2qiH73WbiWrZDY=;
 b=N0NDDA+b/+gwWB45HNJBR6x/pFpbXatxrHkfm1Q551sqsvivF9iAQhmy6oJ9M/pBruUMEGa1Rzp6rd107RTZMn/DfPdqi5tOwFI4qCyBdwyM7iMNJERfhd/T000S8aj06Qrt2yT9xu3SqwZTQXaaxy+tvlrU921SpQZMbLnj4YQhrqYINKkXhff8rmtnOVdlXFQSPxb64G+1JlqK72x/F4+i/0xm1pmSuzxPHnqiWra/4Ni+/jy2CQto9R5f26CseoDFSxA/Feuu0QJ9cXygSTOun3Jo6OTNPymRMzmX5Ab0vv37szdorMvwwHbLqg4l6ZDfEyuptwIVeoyBQXpxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYHATuho7LcB17bwU2rZ0BhICtqsy2qiH73WbiWrZDY=;
 b=vq2N4VyZ7R0WlWRXkM8QNB9ZBkiFukBiYCVXGJFOSxSdQ9VVRdzBv/6IuE5Dn6kSSM9gzIG3XU6TR+BjW7eOb5emSW7FQOeUAo/80DLxQdHJZy28W0WCSG+hQzNBUYZTmk628LWOX3uJ/WUtk8iT/NSaOEgqQL7FDU+d6hcGxws=
Received: from BL0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:207:3c::39)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 21:14:25 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::46) by BL0PR02CA0026.outlook.office365.com
 (2603:10b6:207:3c::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:25 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:23 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/11] drm/amdkfd: Move TLB flushing logic into amdgpu
Date: Tue, 17 Oct 2023 17:13:32 -0400
Message-ID: <20231017211337.1593869-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MN0PR12MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c696bf0-c21c-4414-0d2c-08dbcf560a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9PeK7AuwLT7rr+DmA7UD1eW782axb+rtDToNpzegFgWMG/LuYGwDMeM0gZuHBr7OUWGBuSA6RBFjLVCsEjDPa8uPmLYcLG5laZhgAU4f6aR7qvYW82/hfeetDp8mjH8zNrvps3nxOHvuhYFxa2Jh7K7iqrl/WHJN36Jfk7CfPbynud8GeeHuhSYwhx90y7449DqSzxjOpTCBqTi4/M4hzrL+NndITCnQ42d5QpXxrLlRQdi28j0ezthTx0l77feYgbUikGbemkJKhgK2icOTq1psICVjwQQYsKVeY7HC39sciIO7g2WgIWUSqojcbZGj2makhn4IRVBhnwCcI7H4S6gKRjkaY+WE0u885bUtSVntP6Z2+Z/sn7JjR4Bf/D68ainCM6cwC+zggQS4/32iIElynu98TISIIO22k3LYBDeaZ7sTIO8kGdVeycvW971VRSi1kkv/pJOsDrNNzEgY0/4kt2lVi35iqVoQMjy3lkGm8Pd/PeCR/llRUvRIoxf21fu0ksc2SSXGq8cqDjsPO8XeYj3stgK/mwjsDGc6in6+fL3ZDKrMoh/MZkbQKYHqWbz8feqeiGGx9X11iivDw4BUfmDPTRxXY2VLzE/36fWBJ1ovxCO69gs21j2+c0wEVlLhmGWvNV/urgNwm4yaDz+Akpv7/f3oR18I0dK9SKhOemWj16w9JwROvasrwForn0Tb+6aV/rKGDKTCnpfNztBWmJdqt8WLGlkkdtZR/Iauv6rtSt26Pe9+lYh9El9dkXYW5GxUSWhR67mgM6yipw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(40470700004)(46966006)(36840700001)(40460700003)(26005)(2616005)(1076003)(66574015)(7696005)(6666004)(16526019)(426003)(8936002)(316002)(36860700001)(336012)(83380400001)(5660300002)(4326008)(41300700001)(8676002)(2906002)(47076005)(478600001)(70586007)(70206006)(450100002)(54906003)(110136005)(82740400003)(356005)(81166007)(86362001)(40480700001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:25.2824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c696bf0-c21c-4414-0d2c-08dbcf560a7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will make it possible for amdgpu GEM ioctls to flush TLBs on compute
VMs.

This removes VMID-based TLB flushing and always uses PASID-based
flushing. This still works because it scans the VMID-PASID mapping
registers to find the right VMID. It's only slightly less efficient. This
is not a production use case.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 29 --------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h |  5 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     | 44 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h     |  5 +++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h      | 10 ++++-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c   | 31 ---------------
 6 files changed, 57 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index b8412202a1b0..6ab17330a6ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -710,35 +710,6 @@ bool amdgpu_amdkfd_is_kfd_vmid(struct amdgpu_device *adev, u32 vmid)
 	return false;
 }
 
-int amdgpu_amdkfd_flush_gpu_tlb_vmid(struct amdgpu_device *adev,
-				     uint16_t vmid)
-{
-	if (adev->family == AMDGPU_FAMILY_AI) {
-		int i;
-
-		for_each_set_bit(i, adev->vmhubs_mask, AMDGPU_MAX_VMHUBS)
-			amdgpu_gmc_flush_gpu_tlb(adev, vmid, i, 0);
-	} else {
-		amdgpu_gmc_flush_gpu_tlb(adev, vmid, AMDGPU_GFXHUB(0), 0);
-	}
-
-	return 0;
-}
-
-int amdgpu_amdkfd_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
-				      uint16_t pasid,
-				      enum TLB_FLUSH_TYPE flush_type,
-				      uint32_t inst)
-{
-	bool all_hub = false;
-
-	if (adev->family == AMDGPU_FAMILY_AI ||
-	    adev->family == AMDGPU_FAMILY_RV)
-		all_hub = true;
-
-	return amdgpu_gmc_flush_gpu_tlb_pasid(adev, pasid, flush_type, all_hub, inst);
-}
-
 bool amdgpu_amdkfd_have_atomics_support(struct amdgpu_device *adev)
 {
 	return adev->have_atomics_support;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 3ad8dc523b42..fcf8a98ad15e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -163,11 +163,6 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device *adev,
 				uint32_t *ib_cmd, uint32_t ib_len);
 void amdgpu_amdkfd_set_compute_idle(struct amdgpu_device *adev, bool idle);
 bool amdgpu_amdkfd_have_atomics_support(struct amdgpu_device *adev);
-int amdgpu_amdkfd_flush_gpu_tlb_vmid(struct amdgpu_device *adev,
-				uint16_t vmid);
-int amdgpu_amdkfd_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
-				uint16_t pasid, enum TLB_FLUSH_TYPE flush_type,
-				uint32_t inst);
 
 bool amdgpu_amdkfd_is_kfd_vmid(struct amdgpu_device *adev, u32 vmid);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index c586d0e93d75..3307c5765787 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1349,6 +1349,50 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 	return 0;
 }
 
+/**
+ * amdgpu_vm_flush_compute_tlb - Flush TLB on compute VM
+ *
+ * @adev: amdgpu_device pointer
+ * @vm: requested vm
+ * @flush_type: flush type
+ *
+ * Flush TLB if needed for a compute VM.
+ *
+ * Returns:
+ * 0 for success.
+ */
+int amdgpu_vm_flush_compute_tlb(struct amdgpu_device *adev,
+				struct amdgpu_vm *vm,
+				uint32_t flush_type,
+				uint32_t xcc_mask)
+{
+	uint64_t tlb_seq = amdgpu_vm_tlb_seq(vm);
+	bool all_hub = false;
+	int xcc = 0, r = 0;
+
+	WARN_ON_ONCE(!vm->is_compute_context);
+
+	/*
+	 * It can be that we race and lose here, but that is extremely unlikely
+	 * and the worst thing which could happen is that we flush the changes
+	 * into the TLB once more which is harmless.
+	 */
+	if (atomic64_xchg(&vm->kfd_last_flushed_seq, tlb_seq) == tlb_seq)
+		return 0;
+
+	if (adev->family == AMDGPU_FAMILY_AI ||
+	    adev->family == AMDGPU_FAMILY_RV)
+		all_hub = true;
+
+	for_each_inst(xcc, xcc_mask) {
+		r = amdgpu_gmc_flush_gpu_tlb_pasid(adev, vm->pasid, flush_type,
+						   all_hub, xcc);
+		if (r)
+			break;
+	}
+	return r;
+}
+
 /**
  * amdgpu_vm_bo_add - add a bo to a specific vm
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index ebcc75132b74..577cdb6d1649 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -316,6 +316,7 @@ struct amdgpu_vm {
 	/* Last finished delayed update */
 	atomic64_t		tlb_seq;
 	struct dma_fence	*last_tlb_flush;
+	atomic64_t		kfd_last_flushed_seq;
 
 	/* Last unlocked submission to the scheduler entities */
 	struct dma_fence	*last_unlocked;
@@ -434,6 +435,10 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 			   struct amdgpu_vm *vm,
 			   struct ww_acquire_ctx *ticket);
+int amdgpu_vm_flush_compute_tlb(struct amdgpu_device *adev,
+				struct amdgpu_vm *vm,
+				uint32_t flush_type,
+				uint32_t xcc_mask);
 void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
 int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 9cc32f577e38..a40f8cfc6aa5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -748,7 +748,6 @@ struct kfd_process_device {
 	/* VM context for GPUVM allocations */
 	struct file *drm_file;
 	void *drm_priv;
-	atomic64_t tlb_seq;
 
 	/* GPUVM allocations storage */
 	struct idr alloc_idr;
@@ -1462,7 +1461,14 @@ void kfd_signal_reset_event(struct kfd_node *dev);
 
 void kfd_signal_poison_consumed_event(struct kfd_node *dev, u32 pasid);
 
-void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type);
+static inline void kfd_flush_tlb(struct kfd_process_device *pdd,
+				 enum TLB_FLUSH_TYPE type)
+{
+	struct amdgpu_device *adev = pdd->dev->adev;
+	struct amdgpu_vm *vm = drm_priv_to_vm(pdd->drm_priv);
+
+	amdgpu_vm_flush_compute_tlb(adev, vm, type, pdd->dev->xcc_mask);
+}
 
 static inline bool kfd_flush_tlb_after_unmap(struct kfd_dev *dev)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index fbf053001af9..cc3c2d024618 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1662,7 +1662,6 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 		return ret;
 	}
 	pdd->drm_priv = drm_file->private_data;
-	atomic64_set(&pdd->tlb_seq, 0);
 
 	ret = kfd_process_device_reserve_ib_mem(pdd);
 	if (ret)
@@ -2054,36 +2053,6 @@ int kfd_reserved_mem_mmap(struct kfd_node *dev, struct kfd_process *process,
 			       KFD_CWSR_TBA_TMA_SIZE, vma->vm_page_prot);
 }
 
-void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type)
-{
-	struct amdgpu_vm *vm = drm_priv_to_vm(pdd->drm_priv);
-	uint64_t tlb_seq = amdgpu_vm_tlb_seq(vm);
-	struct kfd_node *dev = pdd->dev;
-	uint32_t xcc_mask = dev->xcc_mask;
-	int xcc = 0;
-
-	/*
-	 * It can be that we race and lose here, but that is extremely unlikely
-	 * and the worst thing which could happen is that we flush the changes
-	 * into the TLB once more which is harmless.
-	 */
-	if (atomic64_xchg(&pdd->tlb_seq, tlb_seq) == tlb_seq)
-		return;
-
-	if (dev->dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
-		/* Nothing to flush until a VMID is assigned, which
-		 * only happens when the first queue is created.
-		 */
-		if (pdd->qpd.vmid)
-			amdgpu_amdkfd_flush_gpu_tlb_vmid(dev->adev,
-							pdd->qpd.vmid);
-	} else {
-		for_each_inst(xcc, xcc_mask)
-			amdgpu_amdkfd_flush_gpu_tlb_pasid(
-				dev->adev, pdd->process->pasid, type, xcc);
-	}
-}
-
 /* assumes caller holds process lock. */
 int kfd_process_drain_interrupts(struct kfd_process_device *pdd)
 {
-- 
2.34.1

