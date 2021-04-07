Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB48D35784A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 01:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6F26E9AC;
	Wed,  7 Apr 2021 23:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C466E9AC;
 Wed,  7 Apr 2021 23:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAC4ZVj2qKyCBAy8ahizGCHTZoiPX9yg0rs8+guYURYQ+H0JkSSeXW5v+Su08IopmXvqiD1bGSNJJmIk5aACIjqrvM0A3L/FcAO1svL1o/Fs9rVeFoffhb+Sgt3je2eC9ZUcJNlGVGAAXADlkTrckxEDzhOwiGf21/tAPBpXQ1FgVIsRR3ga0x6Ggul30/mbLwGvSTL09YXQGRbsvHNWQ35DUNYpgtg6Frn/tp6gZmP4W7su70fFqWC8HX9wGkr0hfx+7xcN2xK28X8iEoJieaokb2hKi1iEmLg61WuVf/t+O+andpetrjMsPpffw9Z8qBI/kDS7DUqTz/Sh4SDfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDnilKetB8iHmON2nYxNTpARzZRuEyJTWWQpDwoqHBc=;
 b=Umc2Y5NchQkrV1yGHFlEZqgEEu7V8VtJrOsEfjQGHxGCMIuK/qaifOtT+BS9DNr0jnbjw1lmtJJNIm71h9Rd5uyCqwIegyMIn4U+ZgAFm2Qaxd/ItdXo4wuHsrGo+JOeHT7lcRX7KIUgccEaMCJzcplM7U3Gr2jypydWYSUC+IQVcZHe/sOu3HugAdoWpiv90lpyCy0vm4retG7BC3T34ZmjIBioaGr0y9vCx9YoAWvSb1/Umjl6x71Mw/micd0KYRRwog7tIG13/85BNb69aMcVycWU4lW33qDrcE53wLY6vqbBvMbxCcaDWXHEWNJp21z67HFxOhqt4Tq69rUIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDnilKetB8iHmON2nYxNTpARzZRuEyJTWWQpDwoqHBc=;
 b=VkKJAbwOKCSQayW4bZwo/Cc+EFtE5MmynbvA/iFDZDQ6R0LAA395uR46+3NxLS1j/8awYEEliIFdFHStlIQBPCOA6CHa3qXQFqWaxmsQLfEYbYMBCzxuspfIV51N9FuirwiNd3qJE/0VE35go23RLleWUGE/0ChlGHBYnN5+9RY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 23:13:37 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Wed, 7 Apr 2021
 23:13:37 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/amdkfd: Remove legacy code not acquiring VMs
Date: Wed,  7 Apr 2021 19:12:56 -0400
Message-Id: <20210407231259.1787-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Wed, 7 Apr 2021 23:13:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb1abebb-f9b0-4c4b-75fd-08d8fa1ac5e1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4392:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB439299FDA20E1F8BA156A9DE92759@MN2PR12MB4392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2FDYVg0X1C5FEGn0PVATJFVVSwjBHbCMbwO4ZMQC9ELaJYfnPfZQNUuwnQQcjY1DjPnn21p15g2UPma7vCwzoAqWgv2KLY2tId0M23ZEXCEt4YPoUdpXZvneGTdDbecZ57qAEEAwxJvWxNmWkUPV9JaBFB7yTibagu5yYOggLOEZMOyv3vr4BYpJud3hG+InrAhIzWvOGcnm1m81r52ciXl1mR/uTcD829aPpkl8bHoK2lFhkOfjeaYsZAHpmV2VoZ7Y1PMJmC2jSBo2phUMT7ul+HhiQxb+LT4Nv5Re+g5r80qZktQQ9fXyby/ZZA5QzKbdRtT+u+mTPyHZRPaFRfi/FgTyoZHRBnbpGX7W4Iyd3bQZ+IGnLwSp0JgtddyBZ3Zb7n0mP9LK+WfKQP377Z98TSlwrm5axMDwFRkNQhT0Rf1XO8M3Wdw91xFSBAGy4m/cvBOmbw94Shb7mxdwOrtRGppors1fGow9v60K2/Q2ChBfFKF+91VKq+o3XpIZ6nHCrznWLoyY6rJxA9y9/Ogb1tU7jEQJ/TNcKdY/8kZK4bw/k/um9lMCKtxMMhP+PYN+rLAQ86DRt1euV964KM3hpY/DdP0P5W5MUGbL6CQ5Or+xNL54VXTEswKqQjH6qKzfSZ8uu2FgQ4kdjt7YgJgA4Sf1kbz5sZn2fiWqHGSJh4pI1wDZacO5EsiIBmi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(66556008)(66946007)(316002)(16526019)(86362001)(186003)(52116002)(83380400001)(26005)(66476007)(1076003)(478600001)(7696005)(5660300002)(6666004)(2616005)(38100700001)(2906002)(36756003)(8936002)(8676002)(956004)(38350700001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?toTeszJc1gDZOLfUOwvLX29e9kGv4S0UZeXJKm/IDN4n4M8aty8ZQTiFvFBr?=
 =?us-ascii?Q?z2lxGTyvVpBBmt1obc2ALM8Yy/OkE+RcDnzjWOs71RK3xKtaGBfA8GK29bTI?=
 =?us-ascii?Q?moERpnbHCshcX66uMdRHXuyD3JzbWDM/t0M7wUzd7JtP37sV3fNDWJGvcIM+?=
 =?us-ascii?Q?Lt6AQUop+a61K+HfENDjytS9Wwh6cf9JmC2s3kRhnIyTmM0ubEAO+hLG8qhP?=
 =?us-ascii?Q?aYhpWTmoa8N+hOrBQVbgKQ+Cbl5gR2j3rp5oHznLA74ykc4YTsX6H8yThcUa?=
 =?us-ascii?Q?SqLPbqVnAKBInWQ3AHIzYonXRUqkFUhEJi94rdbHPB3g9s2fU+1lRcSXTRqe?=
 =?us-ascii?Q?19xHUVQxYvm0KVHJEicftbannRv54lX9AN/72kzTD0LpYk760ENNjTl7NqB/?=
 =?us-ascii?Q?K7t8tH/Wy5DVnPwGUusqUuPdN+IRIhjCelzLtmYElZLK4kWjvlGnn/MXOuIh?=
 =?us-ascii?Q?3+D6wyMQGgdnTONxmRn5CD/15n8+x9OLAv4mV0U//xh8V3XuhVD/WRSJucBf?=
 =?us-ascii?Q?n/D4YO2cXhqCF1GcqOkTSPiKi6E7g4rnIGb2FJrzG1xo5z0UY+Z7FdISknHi?=
 =?us-ascii?Q?2XX8NcTBeikShzAWhvx2iiapvIst82V+gKvjqlk3O4dqXLPGy0neRxTBzHph?=
 =?us-ascii?Q?pnI3FVSR3VzQzAQ7e/t5pOWra6TDDBy8yeDPnCyp1715cnZP047IhvdLhir5?=
 =?us-ascii?Q?RaTUgI64/wfTc2Jv3HG3wPNDKTbUSrH7rG6cRY3CBFkCdF/v4jfCNbBEgNyH?=
 =?us-ascii?Q?/WmmDfbBoQmnMbwX6v2NNBwyIW9nKtjLo3UJ/ks1tF9rbb04JIdQlH2bN3fe?=
 =?us-ascii?Q?hXc6ro8YIjpwI0mAf08YQ1o7BydHhV4cSmsh5x4lRlayuJcrH344Rs424X5c?=
 =?us-ascii?Q?Wy2o72lDry1GjAu1eDNNwxzXCkZ1V4w7NTkGwLgq+eCwR2jKnONHG2H8V9MX?=
 =?us-ascii?Q?OveK5ctHG28QC5FlxL+Pyl4g5VcGLKY7fNzPlGcxVRdprwFI8JShZrs4kQMa?=
 =?us-ascii?Q?ROZjT+jNC9vyl76drYMWD79jCwEsiIjNur9G3iUyHYboCJFWQ6d+NoPV2qIp?=
 =?us-ascii?Q?0sCcMhlKOEDlbK/zrvJ9qHYzWvtITKr5NEcBK7HB2VoQ4kEfie/WdmqdDYtn?=
 =?us-ascii?Q?XfCL38eiw2N30Ndf10MEGXN/Bt7LDkG3xyQUHyt8PCHuUArWP/Y0K0I0CLLQ?=
 =?us-ascii?Q?u9ld1ypyIjUMTv/2U7MFJUyyLLtoomy2DPZZn8+4tnHpSWeja1KfSZCioGE3?=
 =?us-ascii?Q?4U77CY8VQvexUS2vpTxSUTX/wM5vczyY5rMdlzYl2k4QGuHPeSyvAhkjvGbh?=
 =?us-ascii?Q?OlfLEvAEznB33ZpTxm3Iploq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1abebb-f9b0-4c4b-75fd-08d8fa1ac5e1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 23:13:36.9891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmKRQHIHqkd31Vjb6SB0mlJ8SGRZddQNH+0vB4Y9v2k+YjlUaTOsOYsXvl16rwRM+9mc/yWxjNU+ks+K4RewNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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
Cc: christian.koenig@amd.com, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ROCm user mode has acquired VMs from DRM file descriptors for as long
as it supported the upstream KFD. Legacy code to support older versions
of ROCm is not needed any more.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  4 --
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 50 -------------------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 27 ++++------
 3 files changed, 10 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 14f68c028126..5ffb07b02810 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -234,14 +234,10 @@ uint8_t amdgpu_amdkfd_get_xgmi_hops_count(struct kgd_dev *dst, struct kgd_dev *s
 	})
 
 /* GPUVM API */
-int amdgpu_amdkfd_gpuvm_create_process_vm(struct kgd_dev *kgd, u32 pasid,
-					void **vm, void **process_info,
-					struct dma_fence **ef);
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					struct file *filp, u32 pasid,
 					void **vm, void **process_info,
 					struct dma_fence **ef);
-void amdgpu_amdkfd_gpuvm_destroy_process_vm(struct kgd_dev *kgd, void *vm);
 void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm);
 uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index e93850f2f3b1..36012229ccc1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1037,41 +1037,6 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 	return ret;
 }
 
-int amdgpu_amdkfd_gpuvm_create_process_vm(struct kgd_dev *kgd, u32 pasid,
-					  void **vm, void **process_info,
-					  struct dma_fence **ef)
-{
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *new_vm;
-	int ret;
-
-	new_vm = kzalloc(sizeof(*new_vm), GFP_KERNEL);
-	if (!new_vm)
-		return -ENOMEM;
-
-	/* Initialize AMDGPU part of the VM */
-	ret = amdgpu_vm_init(adev, new_vm, AMDGPU_VM_CONTEXT_COMPUTE, pasid);
-	if (ret) {
-		pr_err("Failed init vm ret %d\n", ret);
-		goto amdgpu_vm_init_fail;
-	}
-
-	/* Initialize KFD part of the VM and process info */
-	ret = init_kfd_vm(new_vm, process_info, ef);
-	if (ret)
-		goto init_kfd_vm_fail;
-
-	*vm = (void *) new_vm;
-
-	return 0;
-
-init_kfd_vm_fail:
-	amdgpu_vm_fini(adev, new_vm);
-amdgpu_vm_init_fail:
-	kfree(new_vm);
-	return ret;
-}
-
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					   struct file *filp, u32 pasid,
 					   void **vm, void **process_info,
@@ -1138,21 +1103,6 @@ void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
 	}
 }
 
-void amdgpu_amdkfd_gpuvm_destroy_process_vm(struct kgd_dev *kgd, void *vm)
-{
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
-
-	if (WARN_ON(!kgd || !vm))
-		return;
-
-	pr_debug("Destroying process vm %p\n", vm);
-
-	/* Release the VM context */
-	amdgpu_vm_fini(adev, avm);
-	kfree(vm);
-}
-
 void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d4241d29ea94..d97e330a5022 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -935,9 +935,6 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 					pdd->dev->kgd, pdd->vm);
 			fput(pdd->drm_file);
 		}
-		else if (pdd->vm)
-			amdgpu_amdkfd_gpuvm_destroy_process_vm(
-				pdd->dev->kgd, pdd->vm);
 
 		if (pdd->qpd.cwsr_kaddr && !pdd->qpd.cwsr_base)
 			free_pages((unsigned long)pdd->qpd.cwsr_kaddr,
@@ -1375,19 +1372,18 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 	struct kfd_dev *dev;
 	int ret;
 
+	if (!drm_file)
+		return -EINVAL;
+
 	if (pdd->vm)
-		return drm_file ? -EBUSY : 0;
+		return -EBUSY;
 
 	p = pdd->process;
 	dev = pdd->dev;
 
-	if (drm_file)
-		ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(
-			dev->kgd, drm_file, p->pasid,
-			&pdd->vm, &p->kgd_process_info, &p->ef);
-	else
-		ret = amdgpu_amdkfd_gpuvm_create_process_vm(dev->kgd, p->pasid,
-			&pdd->vm, &p->kgd_process_info, &p->ef);
+	ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(
+		dev->kgd, drm_file, p->pasid,
+		&pdd->vm, &p->kgd_process_info, &p->ef);
 	if (ret) {
 		pr_err("Failed to create process VM object\n");
 		return ret;
@@ -1409,8 +1405,6 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 err_init_cwsr:
 err_reserve_ib_mem:
 	kfd_process_device_free_bos(pdd);
-	if (!drm_file)
-		amdgpu_amdkfd_gpuvm_destroy_process_vm(dev->kgd, pdd->vm);
 	pdd->vm = NULL;
 
 	return ret;
@@ -1435,6 +1429,9 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
+	if (!pdd->vm)
+		return ERR_PTR(-ENODEV);
+
 	/*
 	 * signal runtime-pm system to auto resume and prevent
 	 * further runtime suspend once device pdd is created until
@@ -1452,10 +1449,6 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
 	if (err)
 		goto out;
 
-	err = kfd_process_device_init_vm(pdd, NULL);
-	if (err)
-		goto out;
-
 	/*
 	 * make sure that runtime_usage counter is incremented just once
 	 * per pdd
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
