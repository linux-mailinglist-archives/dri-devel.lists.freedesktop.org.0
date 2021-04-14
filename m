Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED67535ED87
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E256E8D3;
	Wed, 14 Apr 2021 06:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAB86E8CD;
 Wed, 14 Apr 2021 06:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRzLj/0fDX6IWbd3TlZp3Y701jVBl2vdbmOhnYDX+0PvHzHG7ZqKyPkWUNyh6oyx9ksQvPBmkQPm14UPx90rNbfQg/ifjZGV2VEoAzhn2hDlP1X8MiPwChA3oV5BYkAYar8oxzah/vxPXEw+R+sJPBblitTS9cVsFBAckWErbjZzGqHFMmYisyViBem7L4mhxSKCSBUSEAVfpM4m60Mudk5RjLJzbVGN4z/9JW25MBBww3/4lHWe13HHGMipqvUnS0MHOlh0d9H/jcfxg7R77Fnt8BUn9n2qMrk3al930xxKxWy8/X3c2PKBfAhdo+j6zpXrL6CIGXmMOCtozXdngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUcSThGOmgW2TkEvH03AiiupJoZbHEnbE0vI9a2WclU=;
 b=RfP9xMNiC8ab92iF4Ri14pzs3utzICLdD69FHGqZeJdF3ktIEfgORUJDBfiK9nhmDyTUEeJUZj+WLS+Gxr7IGyrMmxFxXroFKss+eeG4hfgpTSmuxEOqAAalhQmSuGmbkIjYLt/mbhs1K4FhdfzFx4xjUiB3LrI+Smq4So6U7eM7aW1gzIwt6FZxAwUoHUyYSh8P2m8swaltH1/xFiMvap+/GRKXmGaH/HONfzO0YSjg6mQSotwlsM3rGB8khnTWBfR8vcuEn/xHI9maGUX7sTT8A9AENZqGKWxgMeenWD6v7IAUVZMXCvN8nxk+4ULwEVa4GhsF3Wpo2ooQD5kiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUcSThGOmgW2TkEvH03AiiupJoZbHEnbE0vI9a2WclU=;
 b=RlR9cNODKLp2n9UOVLoySHyavTvDepJxs3Ahn7ebfaf+xrFm6aZ9wd10EK/xghPIffa8bV/+25tGjur3TK9bFFEFcjX3580EzQ00FzxwZC20UkRkeZ9jiZZ3G/0HI/6S3zd/7lE82xah2TjGZ0V3nQAKcPROZVHy0GYZCFHr23k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:48:20 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:48:19 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/amdgpu: Keep a bo-reference per-attachment
Date: Wed, 14 Apr 2021 02:47:57 -0400
Message-Id: <20210414064804.29356-3-Felix.Kuehling@amd.com>
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
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 06:48:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff9beb1f-7af3-4d1f-ca58-08d8ff1149ba
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125CAE633E64E088908E0B9924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1XtAJtyIKELNbyPgjgmh9Y4NfSG0sJvenM9ODBqelGVCvoGM6vO6JpdKPA5j4jql0Yz8YJxRQw/1hE20Np0l8CT2suu6frEs4PjRVG96alW31r7uN4QFZ3HmGtu4ks6prDF/PBXcX/9ydgHGGjEyfZI987fYtkb+hFuU/V83iZUnFb2GFZV6Qe/dzc8anfLgaP6sDrnNFCt55O9m9rYxA2X5g+c9/RJO3ZvY80AAyS58WNHX/LK/p3ByMmZJUSH4JfkkG531bcqJ7xdlOu1PARQS8rv3x8c4n7k6DFPmPsa6nZxzcMZPdEkjWpytDfGSWCmOzvw1JDnal5o9LQQ/MTwOUtWmXFcrqYV8/UhBz21wxupX7l1RkRQe8rj+C7uACNh6EMboS9q9W5YTd79PAId36jM6ZWcPAkiNBmKcUViyhoc/S4U6adC2xiNrbaoIbkfjyTI3UNSTVaMjDticUVVpv0baPu/jag4oT47k5LiYH6/KyDoBunmOcJcnuByTts03ZH5nuITf2dXJn6zqP0kC+fBJ2oFfhF6FbOsjTwc3yNXKbukg7rnsC9InviCRZXa9yjMCOoKvyjY9CiVSJwA1+252bSY/8I2O2LL+jcYM6uuI7xlUcRm9N4sCMWPuPJLOmgp0fbjG4H4WvBdF+zfiDnCMNue9PchG94SGNeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SgMi5TUUxXNb7XcKdQvVgY15NeRDYRVgdY6ZjOIg8jI34AzAWewnnjgkQrdY?=
 =?us-ascii?Q?9Aq4APQT9mfj+RsmGGLa9jKioI02siXbfmsw4kFdd/VJtq/ggpAhTFZvAl1O?=
 =?us-ascii?Q?P5UwsuFiE4PAHgt8tEbFU92oQ5kms+ZA0sBSfDAGQ/HaWy6CKLHOgSwn7JRe?=
 =?us-ascii?Q?2MNvSRdRG3Fq9OakSdF6IcGkWPDkgcLGxaLqB0Mgh+wRZ/9z3ubJhC4qsa5S?=
 =?us-ascii?Q?rS5eLuFI9UVT0lknBoR5jXtvMrsuc3ZimWpMGJsrUOnoeL9fX96siaGdrZpY?=
 =?us-ascii?Q?LSZ7GmaJbVatXuCnMDUe9XP2CdLJHxz/x73wG7rtDh5r++TPPINmII8qMA1A?=
 =?us-ascii?Q?io8uydKkJ+SDUKjRhZTzA1F7r36wt8hTFygvS2Wbwv3v74UBPxY+jIfm+547?=
 =?us-ascii?Q?5f+KXAJVVoqoR4WmhFQ021lYdRiklPG5i2BALNbLBQG2xWrnpq/2QvdK22T7?=
 =?us-ascii?Q?lDAKJ23yLSNe/Ljbhc2b9pjwbqcGO4TgaSo/m6GmnqvguwHJ/3Yetb5FIjQU?=
 =?us-ascii?Q?6Rst+cHX49MSrp76SX62fvoA1AXK/u7EX3snZDk6VOhe+O0V//1MfKR2t41l?=
 =?us-ascii?Q?ZjMazxvBxFSqgQYuBdFTD5llwKVtYwvJosnUcj2+O/Ly8PZEIDTXh7gcop/j?=
 =?us-ascii?Q?yiOjnARAk4XBvGF4HPYv+oe6OKB7fTxVUePkGpyiqD07Zp5LweAPHwa662np?=
 =?us-ascii?Q?+aPU0gY5GDRndDJhHYl/StCPTd660xTRXMvbGdbjB+ttnSsb6WuN5UTT+b/o?=
 =?us-ascii?Q?bdLNhyNX8CPkE68adNpT2XTDuStDGwnPmt5jh1rG42d2HUl8xIXFQqzg+Pxq?=
 =?us-ascii?Q?V6DMaDJ3/gtuTUHzJ0VUGrvqtOU/0N/aDGYzAuCpvGZQGZFXKU5qsOQhH8iG?=
 =?us-ascii?Q?fq86Xy2ohcG+7nOLSoe5ZN8TM1r3z5iCZSkIIMjps4YFgVM6BlQjY3i43hpQ?=
 =?us-ascii?Q?gyVmHZcXLDx2enn/AE4mQHluGSFvhZAJJLHhEhCJjgqs2oIRUsjL/2gOt7Zz?=
 =?us-ascii?Q?7w9OqXlpGkE6sj6eAABpLuK9D2VIYcGwXDQrEtwoMXcpV9Ho58Ns1MlJM9CT?=
 =?us-ascii?Q?LeIdAf4WflQhc8hWio71Nyi89bkdO09N8ALd0KqqOjgKTk9XG+xjc9xV0TcX?=
 =?us-ascii?Q?81IZTjkBPMI4vLrTPebIKUnzkQnL5O7Z7Rs6wT4zpkMON/CYEonCvQj26J3+?=
 =?us-ascii?Q?h/KRmpCG2cFVUkF5cYxKFmPaMYKTvjJ9CT2GEtkhzH3POrMbU5UIczCsGPK9?=
 =?us-ascii?Q?QC8wawZOp2loUve/xnFHRmFOMCAh3RYeenNByAlqLnoibkl5iKebT96IfFjT?=
 =?us-ascii?Q?4QaOSTTg1tlHcAbzNQ1dAp62?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9beb1f-7af3-4d1f-ca58-08d8ff1149ba
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:19.1401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJRSruS/awX2YWuxnAKewM3WQfOtqzChRWo3EftBc2DeXURn5l2qZLriHQXXfzvUI5rKhEWh0a8daC5J/whTgw==
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

For now they all reference the same BO. For correct DMA mappings they will
refer to different BOs per-GPU.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index d021152314ad..40a296ca37b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -487,11 +487,11 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		struct amdgpu_vm *vm, bool is_aql,
 		struct kfd_mem_attachment **p_attachment)
 {
-	int ret;
-	struct kfd_mem_attachment *attachment;
-	struct amdgpu_bo *bo = mem->bo;
+	unsigned long bo_size = mem->bo->tbo.base.size;
 	uint64_t va = mem->va;
-	unsigned long bo_size = bo->tbo.base.size;
+	struct kfd_mem_attachment *attachment;
+	struct amdgpu_bo *bo;
+	int ret;
 
 	if (!va) {
 		pr_err("Invalid VA when adding BO to VM\n");
@@ -508,6 +508,14 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	pr_debug("\t add VA 0x%llx - 0x%llx to vm %p\n", va,
 			va + bo_size, vm);
 
+	/* FIXME: For now all attachments use the same BO. This is incorrect
+	 * because one BO can only have one DMA mapping for one GPU. We need
+	 * one BO per GPU, e.g. a DMABuf import with dynamic attachment. This
+	 * will be addressed one BO-type at a time in subsequent patches.
+	 */
+	bo = mem->bo;
+	drm_gem_object_get(&bo->tbo.base);
+
 	/* Add BO to VM internal data structures*/
 	attachment->bo_va = amdgpu_vm_bo_add(adev, vm, bo);
 	if (!attachment->bo_va) {
@@ -527,7 +535,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 
 	/* Allocate validate page tables if needed */
 	ret = vm_validate_pt_pd_bos(vm);
-	if (ret) {
+	if (unlikely(ret)) {
 		pr_err("validate_pt_pd_bos() failed\n");
 		goto err_alloc_pts;
 	}
@@ -538,15 +546,19 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	amdgpu_vm_bo_rmv(adev, attachment->bo_va);
 	list_del(&attachment->list);
 err_vmadd:
+	drm_gem_object_put(&bo->tbo.base);
 	kfree(attachment);
 	return ret;
 }
 
 static void kfd_mem_detach(struct kfd_mem_attachment *attachment)
 {
+	struct amdgpu_bo *bo = attachment->bo_va->base.bo;
+
 	pr_debug("\t remove VA 0x%llx in entry %p\n",
 			attachment->va, attachment);
 	amdgpu_vm_bo_rmv(attachment->adev, attachment->bo_va);
+	drm_gem_object_put(&bo->tbo.base);
 	list_del(&attachment->list);
 	kfree(attachment);
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
