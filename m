Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C287535784E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 01:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F706E9AF;
	Wed,  7 Apr 2021 23:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7116E9AC;
 Wed,  7 Apr 2021 23:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/dyiWZ+i1xPS6KOqcIkPQlOKOKPIHVle34/p+30F4fxtvZd00IClU9bOMSPppgMJ8v1BxzagBSl+XFUEMML3YuuRln5mj/sWZ8L2+c3n9GuTSK5n6iQQABbUBZjas7ewLo5Fk1Fni8iS2ru/GO9R3LChacdZUiJE3jzi6QE9/pLb+qFbiFiGeqwLBIupWLhVQYMivcYqgRpUUpLQk892fA7VqqYe+O9Yq2TxOoSfjyZkVu4ROlh6lYuXVGBouqDihnLmXY+EtGR/ibbrcDHIlOMs1KkP7Gw3SNwPRwqHW3VYpfSvYWwwx0OZnl2bInDf8u0aYC56Hl0fIl2JryTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWrL/PHa0ceCg3zmOPN5MvKhY1P8bu7AthqKE1jSQd0=;
 b=cTitv0NixzBGH6dL3Jkl5L01GP/rwr/UX4PZABg3gQBocJuCNzVtwR8ODRwi+HLlqYZdTsL+5Oq/9hIoieedtuigJB7ENPIwk0DjRTO+7EpG53AcESt9lm/sTOySDz35kmWKhSF5BZE9RV5TXqNZ/QiE8XEyksU7xEz1AD132KNHIYJq4QL65jqIJuSHywqQcAYoIcz/lxoQJljV9Z1LLIhZiT85BoIv4OuudAwt5EF+vBv1nITGfnM7K91MfUNnTCMaX2HCLbx58MH2IpACwMWoZO1802AvgNqmJNs5eTPEY/0ZgKLPWJNUqaHA+1Ld99aLNj/XwAm1KYnIXDlfgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWrL/PHa0ceCg3zmOPN5MvKhY1P8bu7AthqKE1jSQd0=;
 b=5HnjmshsPCrRPcYMOLYHb618PuMR4Aptkw+UNCmZhLC6tkQHtfsfUkm1cdspzYP/QhfvSywJDbRxtL19j09fkGRUWb3CMwdDIDXfdimYT27jPr4fDfkqIzvPRzf4AliMv13gsNCQieZnCpCPgURK8Xx2lpPnLWG8y+gXy+2Dvas=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 23:13:38 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Wed, 7 Apr 2021
 23:13:38 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/amdkfd: Allow access for mmapping KFD BOs
Date: Wed,  7 Apr 2021 19:12:58 -0400
Message-Id: <20210407231259.1787-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407231259.1787-1-Felix.Kuehling@amd.com>
References: <20210407231259.1787-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Wed, 7 Apr 2021 23:13:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd8555a8-783d-441d-0f48-08d8fa1ac6ab
X-MS-TrafficTypeDiagnostic: MN2PR12MB4392:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4392A534C4BCE64609D97DC192759@MN2PR12MB4392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZBOHsLkxVlN8kSWF8rEk1Owrv1/IWlzdPVJHqw0BkMh5PgZa3oq011zD8cXHxWwZNDCVGSQJkw1Z/yNvFg3K7RCOvKOi0SYRcG2Uc50oJBQ45Emfg9aVg+FMFzKp34G8N4OhQV/ukMDN0PzPLO4koOAInTLUP73617iS4TULxgdx4sEEIiGc33sPUmrenpBqloG2FKPkcYWPn6MoBjYjjXNMBP+xJq6ETZ2IDXPGKbfH5ALN+3aR/v8R0eshxdYzIXHcSw+fLCJ8Cws8wMmCTY3t8Jp82buCceY6XFqirJXoEYtEwagt4CdxzwoxMScGGfU2arXcJ+ft4TYTk7DIdnbrdqHMOuucEmsu5Dwy7JiuqnuS0oBSrEQuMJ3ICAu7mdBlFGFR4SwqLZaR+cwmDXc8dPvXPR4MD8SzrHXTwUE7I8HcU1Dzpse88uBfAdqCQwCwRLSXbdJA8ab7aLESdivIN8LmPq6DS6hWGmI3/UoujmCjhgKavAm2k0HKYXkaCNNjLlksJrBr6YGr34ZiKlhzww9pAdY208bymirViW1G1iAwA0tyAcRRC5Yspfp6yh4QWrOn9BtDpduygeTtR9Gd+VsnDe1LgjEngKMk4LZ1ZWTH/Y7pNf0dCJ7M9XEHpJ0QJ/IyWaY/9n4opc+QseLNBrVmAA6ijkM0Fij6Lnij8r96P+idM4pmjekITpK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(66556008)(66946007)(316002)(16526019)(86362001)(186003)(52116002)(83380400001)(26005)(66476007)(1076003)(478600001)(7696005)(5660300002)(6666004)(2616005)(38100700001)(2906002)(36756003)(8936002)(8676002)(956004)(38350700001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hwwFZD83SF1S2CjROpITar8MfilnEf0G1j4WYCMYsRXJj62H7DHJ60BXifmi?=
 =?us-ascii?Q?+cX/xkGCFpJcut89LFi34w2vxtoAxkln2cHWGbXKFUBxAjIVmMpgVIuVfuNY?=
 =?us-ascii?Q?LfMzkwB6M5RuARP6ovmWxtquBd9c/TcvVmDtgmoMBngqe7gWOpTuFk8/oIzH?=
 =?us-ascii?Q?IlBIR89qBTyIjES/wZ46HgDYEIQkmzH+wEfK2QTDJNewpljuDtiCgwBdXnBT?=
 =?us-ascii?Q?MyO/zkUfIx2gn3PLauaHD8c1/yLF3u8nHqzzZ3DNssm6dk4QHJGJOjbjtUNA?=
 =?us-ascii?Q?Dxe5sjypaIS87yBNvCzqG9yEHUUAIgrQlWJFJSHqwYayuY7oN2TVbLQ0AprC?=
 =?us-ascii?Q?JaAkJjhllMOQA7tR6GQ3vczjCWD1HrQJcJwI67CHo13DtAKWnViM5DhxaItQ?=
 =?us-ascii?Q?JT/FyceeJd6XDz9CxdyvOoUyEH9TDooT3PzE6tb5m08hrp8ScjwdXzJqR4Ej?=
 =?us-ascii?Q?zCm33Ll/FsUK68qCujIsUOYvm9DM9TfLAlOQ2pQN4UhQV43CvEiTxBr6PNV/?=
 =?us-ascii?Q?wXUUmnLoPqOM1R2sOP5cxw8ZktWrgrRLsic8sswV7hDNruXXIW3ZxkdG0y//?=
 =?us-ascii?Q?84kPFeevPtj8xkulYL1u6z+JFATEpkjB85L0fB4U8xi4OvyV648sMIhK04rM?=
 =?us-ascii?Q?ZK9vEHs/9PN1/faicy/jw+/hJiW5YVFqi3Sgj5W1EVMQVRfl1PdtizePVv9l?=
 =?us-ascii?Q?d5BaaZ4pfBdyy/1ajbJqIIJrlRtzhH7NAhOwK/tKDF8YA8Gorh6Z3oHChRHu?=
 =?us-ascii?Q?1dUClEK1HC4Cq/bnwobdJKanZC/uahVgcFU8nVe4g2vVXFgQlRgpfRaw1aam?=
 =?us-ascii?Q?ybHqiZi6Y2nbGXf6xIeE2wd9GfKZYFU626Fh3v26Ldrlh23x9EBpmY7OuWeX?=
 =?us-ascii?Q?wk28zHBP0h+kSp3vh24LbPweVp8UHEeMQ/2FZHOC7oH8PE2dF+EtnpvgHQoj?=
 =?us-ascii?Q?M+1OYGKj+syVv+ma1f3zGzFMBpY5uRUGq3a2Tp9YZK9x1qT04xnb1mW3fpQI?=
 =?us-ascii?Q?CtFdIQ0bdFueuqHAcdJdSRJAQQ0TPlKJwaSI4zebMr9x4UFk/RhmFz+NOfpV?=
 =?us-ascii?Q?tQOe7dmw9F48XxtwkhZYrTO5K0jtODCKWjbnyYb+ua+aPFYQRRi8yeOJ7sZG?=
 =?us-ascii?Q?G3ff1Sc7LHXva3PwA1uKgoU2oZCaY4FKBDakTlUNmr17rFuF4F65fdEk77J2?=
 =?us-ascii?Q?HAAFqCiAigeT6/PnQrm0iFhPNbMs9qRE/w8deuLK3JEbhwZrDY7RF8uLrYik?=
 =?us-ascii?Q?PGIGWCUf3NuXHTMgtN0gEfibDGDaQT83PHI7YSilvwE1FDVZENDdjeglKA5L?=
 =?us-ascii?Q?IuB3iAw4b4clRjbI0k9w+38X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8555a8-783d-441d-0f48-08d8fa1ac6ab
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 23:13:38.3900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQ4BGxZZSorZb3EqdK+sJEgG+6SOQF26fDLwZ3R9aOjUTXbqPNLRdUoSHCM3Fht1dDbnNVKQq4yP4u69K0xtjQ==
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

DRM allows access automatically when it creates a GEM handle for a BO.
KFD BOs don't have GEM handles, so KFD needs to manage access manually.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  3 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 19 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  8 +++++---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  7 ++++---
 4 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 0d59bebd92af..7c8c5e469707 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -245,7 +245,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, uint64_t *size);
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv,
+		uint64_t *size);
 int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv);
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 95442bcd60fb..e7d61ec966b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1232,6 +1232,12 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 			 domain_string(alloc_domain), ret);
 		goto err_bo_create;
 	}
+	ret = drm_vma_node_allow(&gobj->vma_node, drm_priv);
+	if (ret) {
+		pr_debug("Failed to allow vma node access. ret %d\n",
+			 ret);
+		goto err_node_allow;
+	}
 	bo = gem_to_amdgpu_bo(gobj);
 	if (bo_type == ttm_bo_type_sg) {
 		bo->tbo.sg = sg;
@@ -1261,6 +1267,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 
 allocate_init_user_pages_failed:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
+err_node_allow:
 	amdgpu_bo_unref(&bo);
 	/* Don't unreserve system mem limit twice */
 	goto err_reserve_limit;
@@ -1278,7 +1286,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 }
 
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, uint64_t *size)
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv,
+		uint64_t *size)
 {
 	struct amdkfd_process_info *process_info = mem->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
@@ -1355,6 +1364,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	}
 
 	/* Free the BO*/
+	drm_vma_node_revoke(&mem->bo->tbo.base.vma_node, drm_priv);
 	drm_gem_object_put(&mem->bo->tbo.base);
 	mutex_destroy(&mem->lock);
 	kfree(mem);
@@ -1666,6 +1676,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct drm_gem_object *obj;
 	struct amdgpu_bo *bo;
+	int ret;
 
 	if (dma_buf->ops != &amdgpu_dmabuf_ops)
 		/* Can't handle non-graphics buffers */
@@ -1686,6 +1697,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 	if (!*mem)
 		return -ENOMEM;
 
+	ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
+	if (ret) {
+		kfree(mem);
+		return ret;
+	}
+
 	if (size)
 		*size = amdgpu_bo_size(bo);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 43de260b2230..8fc18de7cff4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1328,7 +1328,8 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	return 0;
 
 err_free:
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, (struct kgd_mem *)mem, NULL);
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, (struct kgd_mem *)mem,
+					       pdd->vm, NULL);
 err_unlock:
 	mutex_unlock(&p->mutex);
 	return err;
@@ -1365,7 +1366,7 @@ static int kfd_ioctl_free_memory_of_gpu(struct file *filep,
 	}
 
 	ret = amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd,
-						(struct kgd_mem *)mem, &size);
+					(struct kgd_mem *)mem, pdd->vm, &size);
 
 	/* If freeing the buffer failed, leave the handle in place for
 	 * clean-up during process tear-down.
@@ -1721,7 +1722,8 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	return 0;
 
 err_free:
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, (struct kgd_mem *)mem, NULL);
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, (struct kgd_mem *)mem,
+					       pdd->vm, NULL);
 err_unlock:
 	mutex_unlock(&p->mutex);
 	dma_buf_put(dmabuf);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index bad0ecd6ef87..da452407c4e5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -648,7 +648,7 @@ static void kfd_process_free_gpuvm(struct kgd_mem *mem,
 	struct kfd_dev *dev = pdd->dev;
 
 	amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(dev->kgd, mem, pdd->vm);
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, mem, NULL);
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->kgd, mem, pdd->vm, NULL);
 }
 
 /* kfd_process_alloc_gpuvm - Allocate GPU VM for the KFD process
@@ -712,7 +712,7 @@ static int kfd_process_alloc_gpuvm(struct kfd_process_device *pdd,
 	return err;
 
 err_map_mem:
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(kdev->kgd, mem, NULL);
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(kdev->kgd, mem, pdd->vm, NULL);
 err_alloc_mem:
 	*kptr = NULL;
 	return err;
@@ -907,7 +907,8 @@ static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 				peer_pdd->dev->kgd, mem, peer_pdd->vm);
 		}
 
-		amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd->dev->kgd, mem, NULL);
+		amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd->dev->kgd, mem,
+						       pdd->vm, NULL);
 		kfd_process_device_remove_obj_handle(pdd, id);
 	}
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
