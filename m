Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7D35ED81
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED52C6E8C9;
	Wed, 14 Apr 2021 06:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A926E8C3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGNlsc5+4GRRzyTdLii1E3QwGjutf2DnnBnnUGBZCxbXFUTbZXJhoU15XDKVuCHp+90qB39oBvi89ky5shP4ZzTzj28yYCQXgzcjk+utnBEHK9dQ3kojVhtYMXeuQOu63gxC+AfL+Rj3xfdWBkHqWb355+lLVxu1TuB/MAYPYLPhyJeoQDZ5650r+1AudobELesmHxNa2z88deYr75CzdERxl52uicq1+kT4liq+zBOduhWnSbfLuDfA/Uop0xoe0f5GCkFwz29wQEGJoQfaH6LXvGCJzq7EN1gvrkjANNLrXMyjgbHhxATbD5K/J5w2I8RhJXip3HaYzcfb4f6m9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1Z7N+TokxJateGZpU1pIpnTcEkYQ9R8vQvQEi4r2h4=;
 b=asM7KImf4h9nFpekLOyBayg/S8n11HIPmOuNyY3Ed1Nqt7iJE8jke1lQFAGhw9Z5EDfqKWQVkfojpFPfQgyVXuDuRdiL2xDX2uGe8mO7bXqFXpVAyJ3D93CK+u5TAoDLWqpOTROG37BGgyQdNFIFZMUFZ8UPjPy6NgHGxdg4lAK7kmgWFCWnpjlflfF5D5HZp8oMDKjViIYWlgeUxFJHvc1UyO50/EFHf1rLNNiH+RXTHJCwzhlApJbNjXuxvyMgiDYw30dMYEqGHiDVn0ETD4lLuwxqz+g/iWr808cYpEAWm181kGZAhlaDdeCKFfMMsnWuTyIX3lVfqcx2jf1jIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1Z7N+TokxJateGZpU1pIpnTcEkYQ9R8vQvQEi4r2h4=;
 b=si6OG2x30NmcaoaAKHcFfcQkbMnf7WUwDej/1/f5JK+ZhMwV5j73ETbonzy9WUr6cyxGr5ly+gY6NSWUusfwYHMgelhCwTGRBmvmc7+RtFVbRwZkSRGLbsNtQOcWE3+j+g0omFjgyjNvv/P4+K4fVpcMa9+tOIG4//zDTAKYNOc=
Authentication-Results: lists-freedesktop.org; dkim=none (message not signed)
 header.d=none; lists-freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4689.namprd12.prod.outlook.com (2603:10b6:208:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 06:46:52 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:46:52 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/amdgpu: Add DMA mapping of GTT BOs
Date: Wed, 14 Apr 2021 02:46:19 -0400
Message-Id: <20210414064621.29273-8-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064621.29273-1-Felix.Kuehling@amd.com>
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 06:46:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aadd970-5b5f-463b-092f-08d8ff111578
X-MS-TrafficTypeDiagnostic: BL0PR12MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4689424D51D3903C83ADCF4B924E9@BL0PR12MB4689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y76yqm8YNsAxNprx7qhehBVVcO0V7HwGebQhGjWxRo6IzNepne285eBWwPxwh0ZPoH23xv46xYKPl9nO5KuhW/4GkN/+XRRFW/wSg/4SqSdP/X7JYEldL23OMa1oh1guR+9/d/hpBdEY3C4xa4CH14/Fe6LArGXraKikDFFA9FNlLdWpkZDbNAJ4jYUNNJki6+2RWUod1FbTb+mtaO6L2rL8CphNbt3eUQQCnJL6DRVSsALd0njlX+vok1Dg+EyHDMXw0hPDfiFVoXJaP0niSNu2p7Hf4NQ07zmvDlajVDla+gMKH5uHzAcQWyvhc+6rKAYVOcOw/UV0QeHHYalrAPLyBOU0ClNtEbJ5rNMmS4qVl6ZEL1B2GASED7W36x6obFYXXXgyuq+lY7NWnWJ9zXjpl9l3y0LJOF8qLBxQvo0GSBrTRSJEqw7k9gGrOV6HO3ifWYGTTKdEdI+pP4c201xZJ2U72EEWHnCKWAXzi6jAtY01Dqd1P0K+LjCxuYJWQG6qyPjMRHiU8kUGWjcG15YTQQriFRKKGDiWPknVgEFLhCiQzn6AUeq9AoW9xKWnArNhep4MKOO2cNh2nIV1/mSGjvCy4WKsa7NpleecgKGyX83iA+r4PIzMCn+JD1vrYgAflplUjiekwG8QXjAK8lmsH3CCNxmqMH9cJIDwycE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(6486002)(86362001)(2906002)(2616005)(38100700002)(83380400001)(5660300002)(478600001)(7696005)(1076003)(956004)(316002)(26005)(52116002)(66556008)(6666004)(16526019)(8936002)(66476007)(186003)(66946007)(38350700002)(8676002)(4326008)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lHjs6/Dueo5we1KHlykd8rT95d9EItusWIQl5k9SU6WovByiD//urbigM5hO?=
 =?us-ascii?Q?f4zsz/NABR5VUd0Hop2mswZqBDFWe8WKwX+iZvJ1x97XUrIriWHZvvnMjdxA?=
 =?us-ascii?Q?HmCCsGHx3zcsxtrHRBKcDpz4Vmwp53PLrQ5INQgOz6HrzKwTJFy7nj2WW8EX?=
 =?us-ascii?Q?9Mhb8GNYNsnNnGneR9+/jxdjNzzSY6v23uR5uBLPO3zYJdX4PC0kQ5ptdOxm?=
 =?us-ascii?Q?mI0fRkc4OHL6lVoc0L9kRcmslssFIJjJdggOCwVkQukm+HLmFAeTusIcFl/q?=
 =?us-ascii?Q?tlQ8KbX/eo33TqOIWf87L5SMhGQ0QIa9ikp8BTExdciN6l0SDexQCfFecNcQ?=
 =?us-ascii?Q?/YrINyrwNUOqCq7nz9rZcFy6Vk3u4JphbtW2ZVuepkTHgST5CVdvmusmjRcf?=
 =?us-ascii?Q?/bkToxofEXu7jWkzFqym5sUi8OOaJWt2X1jhU9vwmEwA8aND7PpGmLEu0naN?=
 =?us-ascii?Q?PinMqziKWzDWxVfg4ackXAdhsvCFU8KQ0WpRB1c30ExFFTEiGhvHAbu7bOlB?=
 =?us-ascii?Q?GfXVf6P49FNL6ZEVOp+6eCdFr/3BoNV0sGoDi1sJVT1hKED2/7so4hbLIGXO?=
 =?us-ascii?Q?9hewwqo1fGx5OHBLcVkBb8Eh14iipF4Z7I5aMdirmvafDDhfftQFdwuG6SXK?=
 =?us-ascii?Q?Ik6rtFKpb+cuh8U5hhoUk6GN34tyDV/xUZH15pGY/Vwlh940vNbBAtO9cKej?=
 =?us-ascii?Q?u3TeSArBDQFSqRsUACGuwbiMp/Z/k7AtB10vUULYxuQ3fJi79LxNx5AxcUME?=
 =?us-ascii?Q?CFARzkdRNBD4Oqr5yl6hbmpDpFnuGd+hownMV6+VTxABFW7ah5SN1nIORtEz?=
 =?us-ascii?Q?uRnI5Pl57g84R6C7Zgi3y42vfO15SD3Otjf8ipAG/eHK2LcVAGY5vX9UmAs4?=
 =?us-ascii?Q?sWeJVOWVcesNnJmwvB/PFL4iagsW4m9t5iay1TxWCmwsaiv2RErDh4qQAhIo?=
 =?us-ascii?Q?gARwepH3r+4jL+5Sb+5hOfifXc/4LvsSefiL82Tp/0bNWJXuEwQcAN++21cG?=
 =?us-ascii?Q?1fUsNNxqp3iL/ot6aHKTdeJaVZjfJSRY8188GDyFx1Gc0ke4aaUzKMZDRutO?=
 =?us-ascii?Q?JhxlZzxCdPeTMJIcy9etlohL/CcdAD2etr9MdbKEfw+7z8ArLmFvx4ND3MsE?=
 =?us-ascii?Q?BDgtRmNLZKCy/i3qOZKmObDElTZJl8IUv7PSIzF+1c5WI6Ez/xz1UnIe7XQh?=
 =?us-ascii?Q?uALpzpcmcuLhEq5fUfBCU4G+QSbVSbxIw1WoiQsarsRxz7pn0lv9ds/KU7MU?=
 =?us-ascii?Q?yDEOB+yWMhxS7vF1CYg90iWE6tCsre/Aw248x8po4JS60aPgbbm3ZTTlV2IQ?=
 =?us-ascii?Q?7qNWfygYJEMgI20H5KpUFYdk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aadd970-5b5f-463b-092f-08d8ff111578
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:51.4541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgirISMgHegd7+2SHOGw5DoFPgxRIEnFtiMMo+LXfGR78rIyH2xuJtpj5fU2DJn4mYwXJ7DrQoIWImISMFFWcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4689
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
