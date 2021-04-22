Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A03676CA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFC46EA15;
	Thu, 22 Apr 2021 01:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCDF6E9B2;
 Thu, 22 Apr 2021 01:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5BgQYpQL3td/7Y9g5qloOunnf9P+xrXA3CZL2cfLGuH8LhXpnrjOuc0/uRljcO5euUvHMMQ1FFo1c4OtMzCHlcNRGkXUBHlOLBXflIZpc9Lz/Eppvw5Y6XPwbNVVWg9YIsTDheIsEAGnt1V1gUF5rtWbH74R+brbH0yJMqMXGfeseZ11r8gAEPq9rLvMSMbV2twdmFEzbREVA8kyjtIcA/TffaryOPncyWG6O8ZN9Lnwqb+nWKvV0htSI67aahkNR46F/fe7OpboH+IHt9k9md0+UJ6KPC/Ca0QTULtLp05wG+gNYO7Y+EmbhOPKRHNTiCqH/elVgzj7rmvplGFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYIDgGFiL2SILe5/JJc6WjFNa2ip7Eqnut8kecUOJNs=;
 b=XddOd5mpUe1sxRwrDAfvPNB3umwAXN4pjxZBsCLX3NeYVGti08Cy9PIOJLEcDhcJE3tVisDbmf6kCL8m3xUn75Hyd0T/1oKOTSug/a1kAms10PELLaTgZ2rT+RcKT7puK3XiQdixCapWRgGJC7vfCOlH77vyh9W8E84ADMma3JE0cX4L6MkGE2AQWB3IIlsPWfb+bgaObOycOK16Ll9wfv7Xeb53gpj4WunFQLM0JZ/BvWmeB73JTsP3mjP7ui9owuP0lbCVxmOcVPfFDsZB041B8L6QMxthkmrvbw1SvEx+kgJ1huJ9MXFwqkWQhmWN8QsK4hp3UFXu2BC9Ww2Zsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYIDgGFiL2SILe5/JJc6WjFNa2ip7Eqnut8kecUOJNs=;
 b=xsRje/gS/lYHRjsnQKZEKpdChWdbNHDBwnhRyjHAMlckjhIyEEqJO/nVhHoernR0WczJpRqaX/6WHvd4/0/LGxoaLylOl5a6sg4nZ76M0YJwCrrRQHZS/MUdeXo6bHPJAXeEA+W7TmB+17/kcts8IE1Bu9j8+uEMbHF1mUSu+/g=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:16 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:16 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/10] drm/amdgpu: Keep a bo-reference per-attachment
Date: Wed, 21 Apr 2021 21:30:51 -0400
Message-Id: <20210422013058.6305-4-Felix.Kuehling@amd.com>
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
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63eab476-0c5a-4d08-c394-08d9052e527a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB443812EAB7C5233473993F2692469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1xq3HZLxUyIe27ToZeajY465Cnom/eYdrOyhf2HFmDb5uSyBTYDJHIWpiX7JzJ6bu63kKoN7j2YGmmAU9tB2v/63T8M8GRpaL9ND+RnGThDz63c9jEU0xlcBf++VKaKc9sjA6l4X0Zig0fxBMwGeSBHHtlmAAOq2iO3+G+mApbq/WvqEVKqogGYIimZgmNs0F3X3REcTO9Pgk94nG+6I+k0nD41sCvTxjp1NIDTJolCtfxe1NlD15S+PwNNbtT1j/cof6R7lzyf5LDdRseHSBh/UFWubPeyw0J5YqPTMs45Dkl7XlduY6Ro8MLJJwVmlEi8CtxLcCi4gD6JD1cnAdPjqtT7k8NdI27FZfVkeLF8zVWg4zFa3Evxh27+fXGHcPnHDZXwtogaIJ17UvVX+XWyfUi7SfaiDEyJHa//7wsO07BJhnbMLA307aFRFv4OuWVQijwhGmVSwXTT1tocgf/PIYntf9/E4iaZWcMWkRBegky7vg9rX0TdgskytWL26lxEPVAarrOkywa5fuv1ZDt76Zf/TswSlzV9uZUvfu7GUBMzn7PT8HofYv7pfj2mvkEfVRzOoRO07FucCbQXX+gPhTOwvgM2ZmqrRMW+O2V9E9agDTErAObo3MA3vjcJGZ1Bz1IL4jRI1rnrsRUksykmvfrgYzWWovgDqaep/7Ok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?llQLzvbISg47H8ME/U4cKTcb6FYon3FavuleKQn1CZtNCdfJ7aWZxfI3hynE?=
 =?us-ascii?Q?2ybnKZMUY64Ce3T/N0B5OAJ+jdtD4mF258PemFNvbySV03H99VwKOtjkmZMG?=
 =?us-ascii?Q?UXljRpah8F+AkzfCnTBSDoXTSlHOH89v+0DnWJCCj1ad+3xkJkU3Vyvg1K0Y?=
 =?us-ascii?Q?sXxInsdXxKiM2YQmEpgW9JOiaU3h/Fhh7ke1pU2ASKG7iOh6RrGOCd+xS0oV?=
 =?us-ascii?Q?Gs9hI8fDjLj5fevf8MsqvPgd0R94pfkXAd21+NiUxd/yqldPHoel9wWrc7lu?=
 =?us-ascii?Q?+oWGyQOGzvOQRLyPC3yvHnFzO7L1/WbHswZBeo1baPVraVPXBj8QKxn5o2/O?=
 =?us-ascii?Q?i02qxS+xwiwAz/ej662bKKB7Vm0ivawLtYfEGBi1UHedOgm5cXT9wlTGBJ0P?=
 =?us-ascii?Q?EtUl6bDOT6G6HjFL2uRbWpHs6Tz1DfnrXUnXF+WwjXz3Zfs/mDnWGHXgZOU+?=
 =?us-ascii?Q?wXiXsjV4YkxoyQrXQNgRipL7Q8iu/X+/O0DHflzlNZK6vXa85dW6KCIaNlRz?=
 =?us-ascii?Q?FVcThE0Fs4y55nm35AtjjjANpqNc/6pv+q4sEdiG0q12KUEHmyJxKFNK+oMd?=
 =?us-ascii?Q?0QvB71pt7J/VpEzF+RcdPhrJn3+nHZltiuonKnfRKIUxPLcBroa/ohH3qUnf?=
 =?us-ascii?Q?ESrGzDA2GCh95Zl4GZTdjGo0VEm0m5osSs33r8adffU4tUKoY/Z0ZlJkx6cC?=
 =?us-ascii?Q?/f2ItNUVxpp9wLHX8+cDZNk3riIcD9NJvNc5Si0Ph9aW548+fVnVIJ6xXk3h?=
 =?us-ascii?Q?OE6cJhQDa5f/hTbat847Zejf+ANCkhkott3Sb+lj4zcxgXe0bNXgDBJX+3Zb?=
 =?us-ascii?Q?f+9QydFk4j/xoJnRUNM+1G8anh8Gp8IzhXcy03in4r6/UU2tXL68KjqKhceK?=
 =?us-ascii?Q?VVKQEw8wLSLOkXRDxdQk08udZ9HXwnlpzZcL6dqKh18gKRHP+UluU63zhpLC?=
 =?us-ascii?Q?7kFfnYTwJTszO8Qp6Y+eHwgF2LmH+ZhkvU8zbwAEQdl8k68TksT2fZcyQYco?=
 =?us-ascii?Q?gKe0UowyFWE9kQe7l6/BzzUDRU40YRltMQoGafqrl7H3ISj9pe3bjS1h/lTE?=
 =?us-ascii?Q?9/2Y/c44ULBG+Vbj0x9l7haOh3hh5+eWL3RHkuzpHokav7N30VyY43MZ+OQL?=
 =?us-ascii?Q?7LIuP1aKyPFa1vxVKI9aoe6Yvnkkx8xtow2wjKj8iCcxX9DEpkJ66reb74kC?=
 =?us-ascii?Q?Z0euxIjgS4uyJoERjDXZpx9VFi0GmtWKPWYq5PIcS4e0mhtPUJ3lJj4q7NcO?=
 =?us-ascii?Q?mOHpIF58OGAUm9CCaMixiqF3SBCHhk9C5+u5+vJuc1lwBP10k68xgkFSt7YJ?=
 =?us-ascii?Q?uCGAUxMo1W/VtlGeoUZCYSWy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eab476-0c5a-4d08-c394-08d9052e527a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:16.1740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKdR6Aby+OxP0HvBXpEULjXNcYfPUaLu60HaeFMRrI8BeKHtgm1xnsUs0K//ohg6oKfU1kX0cUZo1f3wDNjQRg==
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

For now they all reference the same BO. For correct DMA mappings they will
refer to different BOs per-GPU.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index fee4c64dd051..34c9a2d0028e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -489,11 +489,11 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
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
@@ -510,6 +510,14 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
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
@@ -529,7 +537,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 
 	/* Allocate validate page tables if needed */
 	ret = vm_validate_pt_pd_bos(vm);
-	if (ret) {
+	if (unlikely(ret)) {
 		pr_err("validate_pt_pd_bos() failed\n");
 		goto err_alloc_pts;
 	}
@@ -540,15 +548,19 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
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
