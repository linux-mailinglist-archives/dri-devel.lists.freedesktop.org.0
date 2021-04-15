Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52078360013
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 04:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175966E0E9;
	Thu, 15 Apr 2021 02:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63A96E0E9;
 Thu, 15 Apr 2021 02:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVErOyx77n8YSaaizzrQPywrUSKSuxPNK0gL9OPS70nqpIjeZ2fiOa9F1FQQaH0yZyvhzU/R6Q2S+wkOkHPWRCkDcL0lhptEN542KMe5v/OjplzvT5tyupePjb4ix1sN4CtV4/JA9k7saQDcVX2o/KZe/02hLQvi1ZCQo89ynxC3NME9JYL2SfEcDQMNScjsF7MvlkyzeMYTXltKOpmX0UeEuJF3zM0KAL8IGZvh/oUf44kKHi6jdL0JJfLLSZWETGgGNWfAKtrobPWP1c4FACzpJxqrwCA/nyEF9O2XsbY9ZWjEtmT9gXc/fPbLMMFBudOT/GjWip1/ppkdexxAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vnWDD0VGV91MjnzA6LVbFV0yPVbMn9GQPQ8+RavDdQ=;
 b=Rpd3W1mNzHo2lm1GH+wzINDzd+Qd2EfXG7sNHhJR1BoLwRRcYuSUo8K9JWt5kxket460Fyfw/sPhja6v1bbSgSvQwK9xuaqNKQvZaZB1q8qbgSFgRaVZn8ZyebGCjUtWsYY/3vpPKFlUCfBl1lrkgkKPQ8EX5//EjOYHZ1ZdKSUCKSBmqIdNq3QmGgZ6MDwgYVzfUbkVaeVpVYJt2sOog4NiXbaV5g3/7TshZOMK7pH+dynV1fpIQVRrUBl9QlAvScpLAiPOa3dLiTpNJ7JZwat+estw/mTChYtTpqhTtDGujiGpZgHb/ssCJ5l9uPSlWiNjBczhOQWu6jKZDhfQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vnWDD0VGV91MjnzA6LVbFV0yPVbMn9GQPQ8+RavDdQ=;
 b=T/a/Y5yTXapxPQhsZ/2iMkPc3dnNF78BsyAsB4FtCqhWo6eW4I5Xhr+yR+wEDafk24ELgEtxhFEJWGorm4rg99Iomi4T5qXk9eNA6OOb0SQAvn/VC81mMVhj9HSjWoSeokf11hkxjOu7ehcPVT/ad4gX3v9OaJk8rOoHnpjC4GQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Thu, 15 Apr
 2021 02:40:27 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 02:40:27 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/amdkfd: Use drm_priv to pass VM from KFD to amdgpu
Date: Wed, 14 Apr 2021 22:40:11 -0400
Message-Id: <20210415024013.15522-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::22) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 02:40:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61e37a56-7c4f-4414-6430-08d8ffb7d3e5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-Microsoft-Antispam-PRVS: <MN2PR12MB420649204F12BC81DDBE146C924D9@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5GOopQrcR4TSBq6pE+ELx5gdo/dnzMo2VpuVrCPAFN1zvaZw8Jwxb4DQqcYMXqg/a4sV81rAB/C+9vL4N/k50Uhi9n01Izl1bn+rydKkh9ows1uoyiBbE5mfjovmSRfT6wRGHhmdZfNw5k26lPTX11HOwjxeN7DwaEYFQXzw3YzD3P9llhoa3Ya7T6AI+B2AXrkXPQTGVii/LE/xgW8T21eX9ZqevjVeiu7OiUMiuts/g41yusCkz9TAqegt32OQt0ZtbcuD2MrRIZIccM4LVTo31ZgujW1dDohALN5A74XCjjLS43qM8dfI4WkBtYtE+WqP4X3zPVkPjGG8W0ZVC3d2JPOxIFdAQ5uki1DK3GILSnmy2oxKTg5bwSoS5ut3RpCIvgc+OEkixJOfwwghkxNrgor8+MPNzf5yBPaDMbSDNuT04Z4Xl6Ojsgus/Z7aCmGFjlzDVYX/mkIc0r7aVs+76Er/bs/NVtu74S0aPxxPxKqR0N/z1dPTy4PEErvP+vxakPcpPepq1pdrXe5is+Xo8akV8J9qdTG1gBGDQLiz9zB5bRD9UWJzN2vi+Ag0bY4h2sEDvpL1yKsbzH1jXnNEanQ5sJKWsun+eOtie4Z28FWpx2aHotuRxLIn72lcKtNpUBXz5TlpvyvOVNBtnYCfBZoTXF+dWuxFRInPLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(26005)(8676002)(7696005)(2616005)(956004)(16526019)(186003)(66946007)(6486002)(5660300002)(1076003)(316002)(52116002)(38100700002)(6666004)(8936002)(2906002)(38350700002)(30864003)(66556008)(450100002)(83380400001)(478600001)(86362001)(66476007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/JStIF+Ct0OFBDoVPTtMiIeJT8BFMSD8LWy8bTGX5pnbldbefvLQ18zvpCZI?=
 =?us-ascii?Q?lxW2oCMecHlsfRDyJuax/xqgti7DYAmb+z4mvh8mH5KBCGhoz4cLJmzME/Rg?=
 =?us-ascii?Q?6vDog75dew/x0ehcXLwOSMp8MDQLVaoPpnqpMFdJZY8jfGB3uB6OVV/NnkIv?=
 =?us-ascii?Q?u0RhCN1J1OrAUKuUX8zVXx5/8hnfSSmBuvAUIDJFTJzISFgjwuccd/bXFdjT?=
 =?us-ascii?Q?Bg4vd0sGhW+SPwH+f46vQauTSpqYYsTseQFENBR83j9DwCvmPMSVz5ffMUdl?=
 =?us-ascii?Q?g2Mzp98Jaz3ilPKtIAaDCl2LaBOEvLVGDTxe2TYwomRv4gUqFsfr9HKv3S5n?=
 =?us-ascii?Q?7NKD/300RsVtli3Fgw7Z8/zaVyDrKKyiE0e4n20m2cEYeJmV7Du3P/CXJKj5?=
 =?us-ascii?Q?5hNkYZb/XqnX6Sa98yayh8WsRYZeCaTFlY0P3FL9U/tygu+MWh+sa+jwnWmi?=
 =?us-ascii?Q?fPwVAI5QbWfUBNvVF3DOmu7heUDO540maYzaUwrCD4dXMB5suz+XV6aX1EUS?=
 =?us-ascii?Q?frsPQI2YhjyDRu/7YH51NCnWdZrYt84SfOrS+x9U1MVgH5LdLvzVPgheHeXJ?=
 =?us-ascii?Q?ZJ4DQ51iv7tcwZPM/rzgG++b5JeRM7gH1lL0Bwegm//Bwat+u/hRuw2qi1CE?=
 =?us-ascii?Q?wC2kBFmE2BXmMDziM5+C5T/yb17mDj97ItKDWKrGv+aPvyoLUCG0+SF467K4?=
 =?us-ascii?Q?KkBO0izmd5fdApoZXhWLOXZamxoC4xYPUFVNfePgYPoRg0Qx+CeNuPZgyck7?=
 =?us-ascii?Q?ufS+v/mspdRo8Do/p00kmE++sT5yobVmK/qBGORauGh2tTNOv1C8aKK2NcTs?=
 =?us-ascii?Q?6xvtj+DDiA/BsvcZe00Eu28BuR7Mk0qh04755TuPQnBbE/h6Rv8/7mfgxpPm?=
 =?us-ascii?Q?TajS2hwQxytXFFB8f43+npVjUs8sw++Z27DN4iyq81kzMjCF8dhW/iu1x9vS?=
 =?us-ascii?Q?Ka/ahqyClq1UKL3lTHqX/HvPz68yG/oaBbOLsEGIUjOSLM/OjIg/piLhozPy?=
 =?us-ascii?Q?IfkPB/DZS2M6uE/lJRqibXaVtp35b+LLeOITBzMm5lXq5YV2xBRWM4Vd7Exl?=
 =?us-ascii?Q?bu8kBoFw0kJsLTX4kXfKZqTv+OgSkAlzMyWFTupHmJweP0yrPcuReS/xfHFT?=
 =?us-ascii?Q?B27cFLQVbUktOpCZLJU22FUvDm09pmjnQW7OHd35l1BWEgX38M/iIsBpcEdw?=
 =?us-ascii?Q?jQX/gozeVi7lWXhGwkeQw8ZaH8fxYVuj3mw2oa9WlBkXFT1aMQ8T/LW9RzEc?=
 =?us-ascii?Q?SBvvt4fZPyS4s3Vk5YXiD5jVYbnQvHtaX/Gi2s4xttxnQH+YASZLU2vPkLnX?=
 =?us-ascii?Q?1HY83a7kQLIeAulUafns8NKW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e37a56-7c4f-4414-6430-08d8ffb7d3e5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 02:40:27.3333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HxKpteEpCmNtQ1tShZW2HhenFGcseHvmy/BfGZZt9XGG5KdbDzae+/dQthj2yppOSKGhMWXGvucnEpZds5TOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu needs the drm_priv to allow mmap
to access the BO through the corresponding file descriptor. The VM can
also be extracted from drm_priv, so drm_priv can replace the vm parameter
in the kfd2kgd interface.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    | 14 ++--
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 69 +++++++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  8 +--
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 23 +++----
 6 files changed, 67 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 5ffb07b02810..0d59bebd92af 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -236,20 +236,20 @@ uint8_t amdgpu_amdkfd_get_xgmi_hops_count(struct kgd_dev *dst, struct kgd_dev *s
 /* GPUVM API */
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					struct file *filp, u32 pasid,
-					void **vm, void **process_info,
+					void **process_info,
 					struct dma_fence **ef);
-void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm);
-uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm);
+void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *drm_priv);
+uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct kgd_dev *kgd, uint64_t va, uint64_t size,
-		void *vm, struct kgd_mem **mem,
+		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct kgd_dev *kgd, struct kgd_mem *mem, uint64_t *size);
 int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm);
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv);
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm);
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv);
 int amdgpu_amdkfd_gpuvm_sync_memory(
 		struct kgd_dev *kgd, struct kgd_mem *mem, bool intr);
 int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct kgd_dev *kgd,
@@ -260,7 +260,7 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct kgd_dev *kgd,
 					      struct kfd_vm_fault_info *info);
 int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 				      struct dma_buf *dmabuf,
-				      uint64_t va, void *vm,
+				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset);
 int amdgpu_amdkfd_get_tile_config(struct kgd_dev *kgd,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 7d4118c8128a..dc86faa03b88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -948,6 +948,13 @@ static int process_update_pds(struct amdkfd_process_info *process_info,
 	return 0;
 }
 
+static struct amdgpu_vm *drm_priv_to_vm(struct drm_file *drm_priv)
+{
+	struct amdgpu_fpriv *fpriv = drm_priv->driver_priv;
+
+	return &fpriv->vm;
+}
+
 static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 		       struct dma_fence **ef)
 {
@@ -1036,15 +1043,19 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					   struct file *filp, u32 pasid,
-					   void **vm, void **process_info,
+					   void **process_info,
 					   struct dma_fence **ef)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct drm_file *drm_priv = filp->private_data;
-	struct amdgpu_fpriv *drv_priv = drm_priv->driver_priv;
-	struct amdgpu_vm *avm = &drv_priv->vm;
+	struct amdgpu_fpriv *drv_priv;
+	struct amdgpu_vm *avm;
 	int ret;
 
+	ret = amdgpu_file_to_fpriv(filp, &drv_priv);
+	if (ret)
+		return ret;
+	avm = &drv_priv->vm;
+
 	/* Already a compute VM? */
 	if (avm->process_info)
 		return -EINVAL;
@@ -1059,7 +1070,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 	if (ret)
 		return ret;
 
-	*vm = (void *)avm;
+	amdgpu_vm_set_task_info(avm);
 
 	return 0;
 }
@@ -1100,15 +1111,17 @@ void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
 	}
 }
 
-void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
+void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *drm_priv)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm;
 
-	if (WARN_ON(!kgd || !vm))
+	if (WARN_ON(!kgd || !drm_priv))
 		return;
 
-	pr_debug("Releasing process vm %p\n", vm);
+	avm = drm_priv_to_vm(drm_priv);
+
+	pr_debug("Releasing process vm %p\n", avm);
 
 	/* The original pasid of amdgpu vm has already been
 	 * released during making a amdgpu vm to a compute vm
@@ -1119,9 +1132,9 @@ void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
 	amdgpu_vm_release_compute(adev, avm);
 }
 
-uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm)
+uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv)
 {
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct amdgpu_bo *pd = avm->root.base.bo;
 	struct amdgpu_device *adev = amdgpu_ttm_adev(pd->tbo.bdev);
 
@@ -1132,11 +1145,11 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm)
 
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct kgd_dev *kgd, uint64_t va, uint64_t size,
-		void *vm, struct kgd_mem **mem,
+		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	enum ttm_bo_type bo_type = ttm_bo_type_device;
 	struct sg_table *sg = NULL;
 	uint64_t user_addr = 0;
@@ -1347,10 +1360,10 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 }
 
 int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm)
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	int ret;
 	struct amdgpu_bo *bo;
 	uint32_t domain;
@@ -1391,9 +1404,9 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	pr_debug("Map VA 0x%llx - 0x%llx to vm %p domain %s\n",
 			mem->va,
 			mem->va + bo_size * (1 + mem->aql_queue),
-			vm, domain_string(domain));
+			avm, domain_string(domain));
 
-	ret = reserve_bo_and_vm(mem, vm, &ctx);
+	ret = reserve_bo_and_vm(mem, avm, &ctx);
 	if (unlikely(ret))
 		goto out;
 
@@ -1437,7 +1450,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	}
 
 	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
-		if (entry->bo_va->base.vm == vm && !entry->is_mapped) {
+		if (entry->bo_va->base.vm == avm && !entry->is_mapped) {
 			pr_debug("\t map VA 0x%llx - 0x%llx in entry %p\n",
 					entry->va, entry->va + bo_size,
 					entry);
@@ -1449,7 +1462,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 				goto map_bo_to_gpuvm_failed;
 			}
 
-			ret = vm_update_pds(vm, ctx.sync);
+			ret = vm_update_pds(avm, ctx.sync);
 			if (ret) {
 				pr_err("Failed to update page directories\n");
 				goto map_bo_to_gpuvm_failed;
@@ -1485,11 +1498,11 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 }
 
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm)
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdkfd_process_info *process_info =
-		((struct amdgpu_vm *)vm)->process_info;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
+	struct amdkfd_process_info *process_info = avm->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
 	struct kfd_bo_va_list *entry;
 	struct bo_vm_reservation_context ctx;
@@ -1497,7 +1510,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 
 	mutex_lock(&mem->lock);
 
-	ret = reserve_bo_and_cond_vms(mem, vm, BO_VM_MAPPED, &ctx);
+	ret = reserve_bo_and_cond_vms(mem, avm, BO_VM_MAPPED, &ctx);
 	if (unlikely(ret))
 		goto out;
 	/* If no VMs were reserved, it means the BO wasn't actually mapped */
@@ -1506,17 +1519,17 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		goto unreserve_out;
 	}
 
-	ret = vm_validate_pt_pd_bos((struct amdgpu_vm *)vm);
+	ret = vm_validate_pt_pd_bos(avm);
 	if (unlikely(ret))
 		goto unreserve_out;
 
 	pr_debug("Unmap VA 0x%llx - 0x%llx from vm %p\n",
 		mem->va,
 		mem->va + bo_size * (1 + mem->aql_queue),
-		vm);
+		avm);
 
 	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
-		if (entry->bo_va->base.vm == vm && entry->is_mapped) {
+		if (entry->bo_va->base.vm == avm && entry->is_mapped) {
 			pr_debug("\t unmap VA 0x%llx - 0x%llx from entry %p\n",
 					entry->va,
 					entry->va + bo_size,
@@ -1642,14 +1655,14 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct kgd_dev *kgd,
 
 int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 				      struct dma_buf *dma_buf,
-				      uint64_t va, void *vm,
+				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct drm_gem_object *obj;
 	struct amdgpu_bo *bo;
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
 
 	if (dma_buf->ops != &amdgpu_dmabuf_ops)
 		/* Can't handle non-graphics buffers */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 43de260b2230..97da1632f504 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1297,7 +1297,7 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		dev->kgd, args->va_addr, args->size,
-		pdd->vm, (struct kgd_mem **) &mem, &offset,
+		pdd->drm_priv, (struct kgd_mem **) &mem, &offset,
 		flags);
 
 	if (err)
@@ -1448,7 +1448,7 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 			goto get_mem_obj_from_handle_failed;
 		}
 		err = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-			peer->kgd, (struct kgd_mem *)mem, peer_pdd->vm);
+			peer->kgd, (struct kgd_mem *)mem, peer_pdd->drm_priv);
 		if (err) {
 			pr_err("Failed to map to gpu %d/%d\n",
 			       i, args->n_devices);
@@ -1555,7 +1555,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 			goto get_mem_obj_from_handle_failed;
 		}
 		err = amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-			peer->kgd, (struct kgd_mem *)mem, peer_pdd->vm);
+			peer->kgd, (struct kgd_mem *)mem, peer_pdd->drm_priv);
 		if (err) {
 			pr_err("Failed to unmap from gpu %d/%d\n",
 			       i, args->n_devices);
@@ -1701,7 +1701,7 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	}
 
 	r = amdgpu_amdkfd_gpuvm_import_dmabuf(dev->kgd, dmabuf,
-					      args->va_addr, pdd->vm,
+					      args->va_addr, pdd->drm_priv,
 					      (struct kgd_mem **)&mem, &size,
 					      NULL);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index d3eaa1549bd7..98c2046c7331 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -738,7 +738,7 @@ static int restore_process_queues_nocpsch(struct device_queue_manager *dqm,
 
 	pdd = qpd_to_pdd(qpd);
 	/* Retrieve PD base */
-	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->vm);
+	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->drm_priv);
 
 	dqm_lock(dqm);
 	if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do nothing */
@@ -821,7 +821,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 
 	pdd = qpd_to_pdd(qpd);
 	/* Retrieve PD base */
-	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->vm);
+	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->drm_priv);
 
 	dqm_lock(dqm);
 	if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do nothing */
@@ -873,7 +873,7 @@ static int register_process(struct device_queue_manager *dqm,
 
 	pdd = qpd_to_pdd(qpd);
 	/* Retrieve PD base */
-	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->vm);
+	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->drm_priv);
 
 	dqm_lock(dqm);
 	list_add(&n->list, &dqm->queues);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 0b6595f7acda..c6357ceb247d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -669,7 +669,7 @@ struct kfd_process_device {
 
 	/* VM context for GPUVM allocations */
 	struct file *drm_file;
-	void *vm;
+	void *drm_priv;
 
 	/* GPUVM allocations storage */
 	struct idr alloc_idr;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d97e330a5022..209e9edd6ddd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -647,7 +647,7 @@ static void kfd_process_free_gpuvm(struct kgd_mem *mem,
 {
 	struct kfd_dev *dev = pdd->dev;
 
-	amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(dev->kgd, mem, pdd->vm);
+	amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(dev->kgd, mem, pdd->drm_priv);
 	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, mem, NULL);
 }
 
@@ -667,11 +667,11 @@ static int kfd_process_alloc_gpuvm(struct kfd_process_device *pdd,
 	int err;
 
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(kdev->kgd, gpu_va, size,
-						 pdd->vm, &mem, NULL, flags);
+						 pdd->drm_priv, &mem, NULL, flags);
 	if (err)
 		goto err_alloc_mem;
 
-	err = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(kdev->kgd, mem, pdd->vm);
+	err = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(kdev->kgd, mem, pdd->drm_priv);
 	if (err)
 		goto err_map_mem;
 
@@ -901,10 +901,10 @@ static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 		for (i = 0; i < p->n_pdds; i++) {
 			struct kfd_process_device *peer_pdd = p->pdds[i];
 
-			if (!peer_pdd->vm)
+			if (!peer_pdd->drm_priv)
 				continue;
 			amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-				peer_pdd->dev->kgd, mem, peer_pdd->vm);
+				peer_pdd->dev->kgd, mem, peer_pdd->drm_priv);
 		}
 
 		amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd->dev->kgd, mem, NULL);
@@ -932,7 +932,7 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 
 		if (pdd->drm_file) {
 			amdgpu_amdkfd_gpuvm_release_process_vm(
-					pdd->dev->kgd, pdd->vm);
+					pdd->dev->kgd, pdd->drm_priv);
 			fput(pdd->drm_file);
 		}
 
@@ -1375,7 +1375,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 	if (!drm_file)
 		return -EINVAL;
 
-	if (pdd->vm)
+	if (pdd->drm_priv)
 		return -EBUSY;
 
 	p = pdd->process;
@@ -1383,13 +1383,12 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 
 	ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(
 		dev->kgd, drm_file, p->pasid,
-		&pdd->vm, &p->kgd_process_info, &p->ef);
+		&p->kgd_process_info, &p->ef);
 	if (ret) {
 		pr_err("Failed to create process VM object\n");
 		return ret;
 	}
-
-	amdgpu_vm_set_task_info(pdd->vm);
+	pdd->drm_priv = drm_file->private_data;
 
 	ret = kfd_process_device_reserve_ib_mem(pdd);
 	if (ret)
@@ -1405,7 +1404,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 err_init_cwsr:
 err_reserve_ib_mem:
 	kfd_process_device_free_bos(pdd);
-	pdd->vm = NULL;
+	pdd->drm_priv = NULL;
 
 	return ret;
 }
@@ -1429,7 +1428,7 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	if (!pdd->vm)
+	if (!pdd->drm_priv)
 		return ERR_PTR(-ENODEV);
 
 	/*
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
