Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585935ED92
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608626E8CD;
	Wed, 14 Apr 2021 06:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C20D6E8D9;
 Wed, 14 Apr 2021 06:48:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAyJNIVIULons+xytz/Pwfdu1CM78nfCAdeMqZWeGCKH9nEb1i84hZej80XzHIfreVMl6lHzv9HmF3IB7xdbKHHEHkiHNejg5f/6/sKWEWj6BFK1HBIAqXbVyZ8Ct4mPNsNpDv8rJCmFJucaCCFmG8X9/BY7yuDi3Oc0LqSCdRr4+tuNeCBLZ6MYjmGP+ZuO5kV6qm8l6XqtwbRsf/B5H4F+lF8n2nhFv0+rJipWVO6K0u9RBq2IbNpmxih7vhW/S+p1VcG9D5261XgAB/98CkeAMdtiM3nJt34FpmuQU37I1uUYfvYKJ/zFv01tXcMcKtjPQZ7Porf/B4lwqKpKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1Z7N+TokxJateGZpU1pIpnTcEkYQ9R8vQvQEi4r2h4=;
 b=PGhAaa4i4kNXMRfocMnm4RfZGgtNJrXgo6zcdpPfBlMfXJIb9QAaJ4DqhIQqkd+28RtSYbu+BnMf/3p+1gKQaMYbtgzXQZ+jrCZeGFnE+1SQKvIgTd5qGZ5w9zhBUu0+T2MEH+1fIcshk6UryME/fOFYiplkS83uApbWd/f+u65KmIJE19xkoVJrout4kNpnCsgM7vQUaJP5HF5uAAmcJkbsEvTJOz5E635CnNNeZ+e4o1Q0BBfbxLl7T6NkZ5ZlMgaq5W79H/MVHplKoIDU8IXWg8FwNRNYDsqfoC+m8UweuMpV0SXXgTitqQLyrX4utp6lrqFYWBOm6wjrd5uNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1Z7N+TokxJateGZpU1pIpnTcEkYQ9R8vQvQEi4r2h4=;
 b=k/W80tQplDV53AQJh3k4WuId8xz/xM3hj7I3GjHB+ePxTNhhumRCZRPR0R72+Qe8jUavmFVReLQrX8OdFI9s0fO5jbZiOkE14nnbk118PWnCGh6r0pbYdUKgVk0lBSEKp5fHAJ9o25Talih9bWIEKEyDKvQ6q3q5Tim7FCZ06vU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:48:22 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:48:22 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/amdgpu: Add DMA mapping of GTT BOs
Date: Wed, 14 Apr 2021 02:48:02 -0400
Message-Id: <20210414064804.29356-8-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064804.29356-1-Felix.Kuehling@amd.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 06:48:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2042c79-6d37-4b0d-61b8-08d8ff114afe
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125E5557C6D9D69D63A0408924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1GReXIBTOvFuZiEYYg53p1m31l94A50p9y6pGX8+qaFd2iyCO2tyw3W8IzraS8TQzAFMpGgJ/QCkOaiYKUhNhVzJ9Kqv5tRGSM2w25MVANCh0KakpzmBrpJmvXCC7/Gek1hujSb9DMy4t5ZVoJgXfUEApvV3+VljgRw+aOQ9n3QomeOlKEGTKlSSYCvk0LhR9k3LhkycYFIbDeVS6nNAipCDHzjZ5sa85N2u56dtK7G/vc1Iwy4X+OYpGngvcTU7h8EtbosGYdsh1wX/wa5T77sXwS/Hgq/T0wbrs7QLC9ijqAkXLlmatTLn9WlLdkKCuP0tJPyBnhn0yEPYCkN6uR6ET/nobtXDywcL++PN6eI6Z5wEkhPpS0R5AlRVL1gE2FldoS+Yzfy/swcIE8SgpJXyMWffNWuEmIi+0uwidbEhxh5QRQQmbcNVRsXi9jTMJW1UOLrpKCyzgIJI6x2N8fMV9vJcB5ILSruQOgg/2zsVf628HhIRn/q01EQpApSBmJPlwOvl5dZLbTQIif7I5+pdxMgJScfXsnQvpYQcnuDNNH78YpCRsxADUJ39dPTRUd4Zfi9KELtvpgEX5UO5UKh2OV9+FKvHotP8PGf7qKI96nVpDkOwpETd12U6M963U5wS5krx1ALG+Vaj4Q/P+EHggEpJpfGcImCDi3zOxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1Cxwpt/uRrq1jKcnqnGOMm31J5HBzZQRhFUZ2+4rTRI8PwC2ikEMemQRSsYU?=
 =?us-ascii?Q?0MBiGIktJAXSPdZLFMjJmCDGck2tpF6BgGzkDPBMWIDmoos3kmgx5qkXNRjf?=
 =?us-ascii?Q?kzel6WefgCAUUZB4KxJ3+pAaEB0pxO9ldZcnS5F+vOnjR6HugM/ggRYpPYlW?=
 =?us-ascii?Q?LZUd6EAbxHPBy0xfKgziCKQl/qXLLcJF6PHQ+zbT0eXotdJuWG6rI5Zdrcpr?=
 =?us-ascii?Q?EBBHjANZFjNE7MvJxjvGDt7KV7R+kcHFk9Z/QWa20WonN5hXJITq7uT1MVV1?=
 =?us-ascii?Q?JCTL3PhTHViHPO4zrBijSaDjh9oJO8BgZuJRh5Hn5+s65KHJE7imKhovNIA3?=
 =?us-ascii?Q?7YaxpSKA+hKiOT2rP8tkS3Lnqg3cNCeN7LWbvXmvIHFycacWBv7d6DJG9NnA?=
 =?us-ascii?Q?m6qu+AAdbmonf0hlcqHRvTvsck2ngLnl0v1tp+HI5TsX2Q1dAjyS1x7tJJrY?=
 =?us-ascii?Q?fZjtZoyb/gyeIYOYNReDk08Tkp88fcXDeihVHPpYs++Yrg6DXPO6J/H6U1n/?=
 =?us-ascii?Q?yz3CQgTxOFmS8Xa3O/aolchim7eVvdwLrtATB16tWZlld25wi2H81RgJ9S2i?=
 =?us-ascii?Q?ncfQS4VGmPvDB80zRPu8b+Axpdv6cdor3aJN9Fzm5bVNF6SbFfM2Jubo0/t6?=
 =?us-ascii?Q?xzZpVnZYfsa6UV8/YKGYCRyguMUGUC2brLPOWd2MEvieawh6yGXOIWAhgy1f?=
 =?us-ascii?Q?GEgTmZlDWwPl488xhD+vbTnt4LXVvJQr+DOQIgqw4aMwT7LyWEXhgGZ/JMcZ?=
 =?us-ascii?Q?9/T/ZiOdZLtK3TLsnQpooGx5Zdd1hJpbGqCpoDcyHgmO4P8EuV2k+WDrzc2L?=
 =?us-ascii?Q?Sc4ChCDDkMApGDY+B29/WEtcSqy/b4IUyQqKfvNoS6xKqp3YhdQmUOJIkd1i?=
 =?us-ascii?Q?vQzto1GaWK2Wh8CuKBplKjNb106y/lFRfw0hUZgbzGPxBNMCmCR0/e9khHrf?=
 =?us-ascii?Q?LTaBf4BP5uW/UwqhHlRWmau7rZAI4yVRKWRnil8ITnN4snfMmJ7flk7HGU4R?=
 =?us-ascii?Q?IdPimSin8CzhFrcntM2ZAxwytH54oDSqqpWIOz+PZtlOuNVCoxCdOcf4cLWG?=
 =?us-ascii?Q?W4/XIzFf5RBRD0YcypK6BrG1lEsWIsZ0S5GfihcEkPbXn3ps5DHXCYCfafts?=
 =?us-ascii?Q?OE5YNrL8mXaC+NufbjbNg/iHBO+tT7jxn5x0f8cj8P4oOeqh58TODT0SElv8?=
 =?us-ascii?Q?d6OUiUfqYw3lJisr79nI+7BErXxybPCaOKokFICzrZPFaG/LeBQqnwH4TEVQ?=
 =?us-ascii?Q?uYGQm3lJoFz1mDIwZF+9KRI8maDM5gGPxUm4mxRNY4Y/8H9Ss7wOqlr+TWIj?=
 =?us-ascii?Q?LlbE9BdFyId+6jmypmMI3Qaz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2042c79-6d37-4b0d-61b8-08d8ff114afe
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:21.2359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1TyPt0GhRQhVOXdvK31ApXjF23gsLEB/W1FPz6YT7wiHVXOwvNexI1ErrII9VgmgdObexSeRbEiSE+4TV7zHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DMABufs with dynamic attachment to DMA-map GTT BOs on other GPUs.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 74 ++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index fc3514ed1b74..3ea51982b720 100644
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
index 1416f3c03f1d..bb3a96ab8f20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -522,6 +522,16 @@ kfd_mem_dmamap_userptr(struct kgd_mem *mem,
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
@@ -531,6 +541,8 @@ kfd_mem_dmamap_attachment(struct kgd_mem *mem,
 		return 0;
 	case KFD_MEM_ATT_USERPTR:
 		return kfd_mem_dmamap_userptr(mem, attachment);
+	case KFD_MEM_ATT_DMABUF:
+		return kfd_mem_dmamap_dmabuf(attachment);
 	default:
 		WARN_ON_ONCE(1);
 	}
@@ -560,6 +572,19 @@ kfd_mem_dmaunmap_userptr(struct kgd_mem *mem,
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
@@ -570,6 +595,9 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 	case KFD_MEM_ATT_USERPTR:
 		kfd_mem_dmaunmap_userptr(mem, attachment);
 		break;
+	case KFD_MEM_ATT_DMABUF:
+		kfd_mem_dmaunmap_dmabuf(attachment);
+		break;
 	default:
 		WARN_ON_ONCE(1);
 	}
@@ -601,6 +629,36 @@ kfd_mem_attach_userptr(struct amdgpu_device *adev, struct kgd_mem *mem,
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
+	return 0;
+}
+
 /* kfd_mem_attach - Add a BO to a VM
  *
  * Everything that needs to bo done only once when a BO is first added
@@ -658,8 +716,20 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
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
@@ -1558,6 +1628,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	}
 
 	/* Free the BO*/
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
