Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B813676D7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6F66EA18;
	Thu, 22 Apr 2021 01:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258EF6E135;
 Thu, 22 Apr 2021 01:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTAGDNUmnbAkEEJFGSAcDmY607qrWIh37vBc0gTgRuzc0V8u8M54mYYz+leZsWhvBmeU5g4vehUzy3ghE4dnch9tfdWBa5wsyThaCtlUb/Wyq7O5HY7wQd7VVucqu3ZMpzMbk6RkIC7F051ezZ0OU84ZGv7lByQXTM9Ilvt1i9AA9wNzP1MdfwuNZiQaXbQr2OV3j//4zvUpeAn1JYkfbNxOeTLZwvFr9ia0JFlIMu0XDMXV+P/V0k/0OpPuT8J7rKkQyMNExhWEuwm2SAgUAnNmnxbqvMar42atPtXnApyRuNScY4/izeGjFmSSHYqGDT7bMvpSI9HMwLKHX+OA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AH8vwQB/hMPZGMhmIfyXkt08cCoOdvghm8HU4NJz4s=;
 b=CWEh2WkxkREKKyO6DspqUKoPIP0mLAGdWFnGYTJ0+9BtaVJPLo06Lrtn/HZVRHPtj9u0V6VRWBBiThz1eSWb7tyP/Mlb9TcLym7a1teYpAhTlKqg35o/0ahGQI+AQiDrbTTzoFrJsP1zz7ThqSg2OBd1o8fiwvAJkOVGw7CzQ8BD/tj3tx2GiqnvFEcFhQs+0zDKv8kbLyJkv/e6et53Xt42ISECRmvQGWagjv3gkJqmZCKrsmUXEd1MEtJ0uhfAhxY/5JvU1zSgWi4jA3ZOYLhJLe12/pM26GU+N9quBChvQHOSul4BH7jJns0uOIIZPdGO8epHfSliERWj6xd1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AH8vwQB/hMPZGMhmIfyXkt08cCoOdvghm8HU4NJz4s=;
 b=Vsi0AFmRd6CrjNSrNtHpad0IsAk+GNUiFrBeb4U2tB2BUBlvkWTdkJXzyWD4+bMUhWhOKu0/qVPYp2hAmSw8w9EerrzCUzeyL3c/KXtWsi3UsAPfZkEns9jty98VT5oRJjNFn8bpSf7dzdrxEU0SREUyneVuDb+35vFwfnqRYVw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:18 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:18 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/10] drm/amdgpu: Add DMA mapping of GTT BOs
Date: Wed, 21 Apr 2021 21:30:56 -0400
Message-Id: <20210422013058.6305-9-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422013058.6305-1-Felix.Kuehling@amd.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7260c95-6272-43f8-7bd5-08d9052e53cc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4438F30BCF428E9876D09ED692469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oX7kOJNQ5kOo0J29o+uubYnPuoh+q9jvy+vDnTyhNZDvOReRIRSSKKVK6lB8KJvpA38i/OeRU22zU9VDKAhiOf+b0YryHrrcV3cG58S4e3Ir53+5wZaB/4Gub9jRM9HuKZ07GyGTyjLN3eAfp4hjsg4QUlBRvqPgJrzg/vqNVUlxkNxpvzJXP9+idJssoVjdwbN2dwAlXj3cTF4kRqLjiRrl6/FnBgiaCktHfJaCobnv0m5knH5gT6wpCakjn+ACKpmlloMTj+bpgMLa4IxaklJ0HTpJ5RAiZUb3aapTXwkpwDcizUh0HFld+J51I+mjvkHIdm113aPTd1xMYQyJ2WBIhT7EuIS/CowwzukYC2A9rL9p8PnyRBfMAKie/DnNHN2Z2ri440DDgrbjyuBWzWlh8bXltiWYuOZ1VPObdpyYaomLkXVpyVAx/qBA1Qqn+c036XXEAaJlctHbFYXcqBIAix17bvSZfg2+Ao6HUQ6knphzc+oID6FZfhwIjc6kEfn0xR8G++4ZqNYt82bvjtFPgctiY1Pi5v9YLgt2jg35hhkrhPOATRPwFHO0/oU6wEJ5EyCywFWUCPFKuP+OrTDsoYwpaYCOshvOM5wE8sLs9NtZE2IjnsEXtjfQgk3ccYWtZICNxnbMsBv5uh2rhLMoGEaS0+hWMSMf1bhIONw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jA5hJlBMRo6D6dMQ8SFetooubqUUURIoe6uI/SXpU1r+lCT8xK9Yf/t+eo91?=
 =?us-ascii?Q?QOvRvRoeJiG5hvUpswY7uVVTqauxChJQlCtJ51rdhaFQRR6+QKxhOlVW1Zi1?=
 =?us-ascii?Q?k5I1S7kwobMEmIt3cuGudV6ZFaFNp8ne2C8KW7kmEGDLFcn7BEC7CqDmNpNe?=
 =?us-ascii?Q?csS1APs7dvOCg/onjczJj31Az5IXOn0hz9zon9ARIEnLiBhs8R//y7oH2qb9?=
 =?us-ascii?Q?NglBAL/IV7Oy0Mv9Qq1n45A26tqpeJPs1zWaVghzrbkCba4iXAEbpLjhFvU8?=
 =?us-ascii?Q?pABEOwmI2F8jjfQuxIMx4tqWTicABHCXDopX/KoNkleVlURrISu53Jj3mE09?=
 =?us-ascii?Q?1fD8h1MxPD0GQVtkvhcKAwjGJXQ0ITB/kMvBm+eqqNmL8TgTn8685SCVMdmI?=
 =?us-ascii?Q?iT6zJUo3y+o7cwL+Xq2lVLetO42aOYC1degk/4PV7aUMBoMmdOQSuxeCsTZw?=
 =?us-ascii?Q?YV55sfXRLPAdoVTfxB7Xb4XKetdLm9EeLLl/7JY4MAAPSe75oQN1XG9BGzu9?=
 =?us-ascii?Q?uJyloTtTCEp2Za67LdiaOjpOuBRmPEqCcdLi00EM5gkdAX965ZWS/I6y2x03?=
 =?us-ascii?Q?BOHzSQdCtgHv1mQyT/x5+U5/3bXp6Q1CtyNmIy2343Lq0pxQB/qzeNwnI1qT?=
 =?us-ascii?Q?Aw/JzyL4TeXYoLU1aHL9D5+6JoPGqntTCNHxgh18LX25MUcPj+O0dhvUPOi1?=
 =?us-ascii?Q?Nqt34X/eEetiWyANZAWmS+YudRhyWWjr6uTLkXGUT4VHKIMeWzV/AC/kx83r?=
 =?us-ascii?Q?pgK9BF+pe63YKXn+kI5/Xons6rocWIlu9EIJAhhPtu7/ljENrhNC9VUdK3h8?=
 =?us-ascii?Q?P0bjySW/2hqwkrXVgUYri1DVx8b7eMqzdEHYH+0IpPm8vWrxKdUhUVAU4Mwx?=
 =?us-ascii?Q?Qkhg196Afy4dZEIhiFf0TVkQL1Qfv3oOtTxa8UXnMlfAoTLWwXmK8qlCS069?=
 =?us-ascii?Q?/9m8bzp97LUybSMtefaA8TJ2+Ib6baeR/ZjTobGOnRViBB1f6JlLSFY4J4kl?=
 =?us-ascii?Q?8lxK5l+Kqr8R7kRaJKBhfpfbCRg1d+WgMBiwR3RW2K3V7K5FP9GtRYUg8Q6a?=
 =?us-ascii?Q?qy4JfCLPF9NoFjkEHruJYV7x/IijmunS3ka4nlh5FUzONGEiKpUenULfASNT?=
 =?us-ascii?Q?6HxZjfz/KZXsQp1pbAsvKuLqwddnl5r+uZentYuY2C2DBMkV1Te/tBGIv0cf?=
 =?us-ascii?Q?IDRH/I6mn4FV8pD5azHAKKsI/mhxAxXuAnT5/ZzOGqsXtU63ORYFPruSfuuQ?=
 =?us-ascii?Q?QvIlvuWqzelTNNXtnbsopNQxiacfxSL8NbsPg7smzuKRpUowlTq+Fd0Ui6am?=
 =?us-ascii?Q?3778KUw+qoa12iuzQmJJMzcC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7260c95-6272-43f8-7bd5-08d9052e53cc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:18.4271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 809ADPzee2yF/McJUQAWsG9WVB1QF8OoeJ8N93dZOltLfiKJ0kvXtgQkkui5+QEljkiEQE65kX5E2dXddHY2Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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

Use DMABufs with dynamic attachment to DMA-map GTT BOs on other GPUs.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 76 ++++++++++++++++++-
 2 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 63668433f5a6..b706e5a54782 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -41,6 +41,7 @@ struct amdgpu_device;
 enum kfd_mem_attachment_type {
 	KFD_MEM_ATT_SHARED,	/* Share kgd_mem->bo or another attachment's */
 	KFD_MEM_ATT_USERPTR,	/* SG bo to DMA map pages from a userptr bo */
+	KFD_MEM_ATT_DMABUF,	/* DMAbuf to DMA map TTM BOs */
 };
 
 struct kfd_mem_attachment {
@@ -56,6 +57,7 @@ struct kfd_mem_attachment {
 struct kgd_mem {
 	struct mutex lock;
 	struct amdgpu_bo *bo;
+	struct dma_buf *dmabuf;
 	struct list_head attachments;
 	/* protected by amdkfd_process_info.lock */
 	struct ttm_validate_buffer validate_list;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 9eeedd0c7920..18a1f9222a59 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -524,6 +524,16 @@ kfd_mem_dmamap_userptr(struct kgd_mem *mem,
 	return ret;
 }
 
+static int
+kfd_mem_dmamap_dmabuf(struct kfd_mem_attachment *attachment)
+{
+	struct ttm_operation_ctx ctx = {.interruptible = true};
+	struct amdgpu_bo *bo = attachment->bo_va->base.bo;
+
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_GTT);
+	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+}
+
 static int
 kfd_mem_dmamap_attachment(struct kgd_mem *mem,
 			  struct kfd_mem_attachment *attachment)
@@ -533,6 +543,8 @@ kfd_mem_dmamap_attachment(struct kgd_mem *mem,
 		return 0;
 	case KFD_MEM_ATT_USERPTR:
 		return kfd_mem_dmamap_userptr(mem, attachment);
+	case KFD_MEM_ATT_DMABUF:
+		return kfd_mem_dmamap_dmabuf(attachment);
 	default:
 		WARN_ON_ONCE(1);
 	}
@@ -562,6 +574,19 @@ kfd_mem_dmaunmap_userptr(struct kgd_mem *mem,
 	ttm->sg = NULL;
 }
 
+static void
+kfd_mem_dmaunmap_dmabuf(struct kfd_mem_attachment *attachment)
+{
+	struct ttm_operation_ctx ctx = {.interruptible = true};
+	struct amdgpu_bo *bo = attachment->bo_va->base.bo;
+
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
+	ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+	/* FIXME: This does not guarantee that amdgpu_ttm_tt_unpopulate is
+	 * called
+	 */
+}
+
 static void
 kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 			    struct kfd_mem_attachment *attachment)
@@ -572,6 +597,9 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 	case KFD_MEM_ATT_USERPTR:
 		kfd_mem_dmaunmap_userptr(mem, attachment);
 		break;
+	case KFD_MEM_ATT_DMABUF:
+		kfd_mem_dmaunmap_dmabuf(attachment);
+		break;
 	default:
 		WARN_ON_ONCE(1);
 	}
@@ -605,6 +633,38 @@ kfd_mem_attach_userptr(struct amdgpu_device *adev, struct kgd_mem *mem,
 	return 0;
 }
 
+static int
+kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
+		      struct amdgpu_bo **bo)
+{
+	struct drm_gem_object *gobj;
+
+	if (!mem->dmabuf) {
+		mem->dmabuf = amdgpu_gem_prime_export(&mem->bo->tbo.base,
+			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
+				DRM_RDWR : 0);
+		if (IS_ERR(mem->dmabuf)) {
+			mem->dmabuf = NULL;
+			return PTR_ERR(mem->dmabuf);
+		}
+	}
+
+	gobj = amdgpu_gem_prime_import(&adev->ddev, mem->dmabuf);
+	if (IS_ERR(gobj))
+		return PTR_ERR(gobj);
+
+	/* Import takes an extra reference on the dmabuf. Drop it now to
+	 * avoid leaking it. We only need the one reference in
+	 * kgd_mem->dmabuf.
+	 */
+	dma_buf_put(mem->dmabuf);
+
+	*bo = gem_to_amdgpu_bo(gobj);
+	(*bo)->parent = amdgpu_bo_ref(mem->bo);
+
+	return 0;
+}
+
 /* kfd_mem_attach - Add a BO to a VM
  *
  * Everything that needs to bo done only once when a BO is first added
@@ -662,8 +722,20 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 			ret = kfd_mem_attach_userptr(adev, mem, &bo[i]);
 			if (ret)
 				goto unwind;
+		} else if (mem->domain == AMDGPU_GEM_DOMAIN_GTT &&
+			   mem->bo->tbo.type != ttm_bo_type_sg) {
+			/* GTT BOs use DMA-mapping ability of dynamic-attach
+			 * DMA bufs. TODO: The same should work for VRAM on
+			 * large-BAR GPUs.
+			 */
+			attachment[i]->type = KFD_MEM_ATT_DMABUF;
+			ret = kfd_mem_attach_dmabuf(adev, mem, &bo[i]);
+			if (ret)
+				goto unwind;
 		} else {
-			/* FIXME: Need to DMA-map other BO types */
+			/* FIXME: Need to DMA-map other BO types:
+			 * large-BAR VRAM, doorbells, MMIO remap
+			 */
 			attachment[i]->type = KFD_MEM_ATT_SHARED;
 			bo[i] = mem->bo;
 			drm_gem_object_get(&bo[i]->tbo.base);
@@ -1522,6 +1594,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
 	/* Free the BO*/
 	drm_vma_node_revoke(&mem->bo->tbo.base.vma_node, drm_priv);
+	if (mem->dmabuf)
+		dma_buf_put(mem->dmabuf);
 	drm_gem_object_put(&mem->bo->tbo.base);
 	mutex_destroy(&mem->lock);
 	kfree(mem);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
