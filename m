Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A852EC8B4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267E06E439;
	Thu,  7 Jan 2021 03:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEF46E439;
 Thu,  7 Jan 2021 03:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwnn/FP+EygSII1hhIXa1U/+KiptmKIpr0QDyITp70TO/hDVurWE+aXIx5lWyU7/D6GwGT3WZwRlUKOPtIi65rf7D3DHOjtRvSI9vHvZ9xzKpO/Vy42JyntjGjaxXR0Vor/x5w1+IbG70zfI/71I+WX3JzJtUqp/FFdB+kWk2FX600ID08EygpcVYxeFeDL2fQbInjrG+KK4RE14EtoN4MjdSYT0WWWNvS2j4Xlztu+400RWeSUOtrweWt96UwGyJR+cPm23pU1hTdjb/ELkZVbWDoNNIHvmovwjjnO7jd+Jo7Kv6WYlCNgFqplUBajWF9vr0+4A0EkW1obePgWHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StfeM7Pm2edIXqrDcAbBV13hOd2piB7QQvqfklG/gw0=;
 b=Fd3G7BgHTNG9qHDe/CPFGVm2f7EHpXrrxL6WHQGwAaJ2v2qozjKYcNbTJFdK5tUiri1ELJCyYxif5/ql4DFaS084edFteno8oxsELU06NL7ChmVL9Slzyf3Hs5SDPigTBDcuESGQKPx9zhQozHO1GTxGTFDDuBYPkexhzL61u5kIkkNAx6AhRepS88FOnS919DFrnw1/Td73yoBX5v6/bXwKXXiqvw7CUDwa+hNg8O1iG9oTccaenhPnfcQb9yM4sPnUefT+UVvLTUK6z8ALm5SZorlE5sihxKHHLV8QJaOftUbA1TqJ+IhxjfEKoYH1H1LJDDRKEsmJqkgDdWiCJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StfeM7Pm2edIXqrDcAbBV13hOd2piB7QQvqfklG/gw0=;
 b=BnTNHFLRgp/mUkibRQUascTbwvcjtc66chThR2uof9yGwmrzbZAAnNqf6Yj1BZpx49V/g/udGA8MYY4TKfQ2TPXiooythvsz/84du6Dnzr2RHgvftE5llc+Lg9YeLcigXmbDSrQp3r1BQuy6UusP14pkt2fsVgmZ3h3r3PAnGTk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:03 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:03 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 26/35] drm/amdkfd: add svm_bo reference for eviction fence
Date: Wed,  6 Jan 2021 22:01:18 -0500
Message-Id: <20210107030127.20393-27-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae116a1a-7dfe-4f1e-32f9-08d8b2b8bfd4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408A2AF7A094FEEBBF722C992AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OO/GnHJVIbbDuyzp9sqp3dWUbkFyNAGYYR6jlzk8dETbTJTTKTnNT167j/TT98h4+q4AN53pZwweNtFH1d/si1mRwA+mVFjIXhPFvCyI0HRDiBkqd/rb0xvcpb5Wo6COFkwjLKNYAqXuhcrpeLg/60XM403OKuUPRUZGG5DtEB++iu/NBJupAh38dMrVpk2kyVPySsWmIWDaiaIQICkPKerCDaiXC6XhAOL7F3r36YppwPtIWE4iv3GfnPwB7BlGNSnvdynA7Y0mmK0Cysz2fIZaf/7Lxn/qepTND54+x0iLXkb1IFokaWiO/kfgUlREaqKLGzhLXjgQNbJHrOreEwlRKwRDdouw2ygopgOa5+pcBWSwU+aC6kBCUa0JgVJWHmzXrsCsKyOd5bDYQycvgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TOdLyjgO/wwarNNH3GCZPaPgsbrVfZhefGyfUz9Z21YyKTmkv2SSys0hExS5?=
 =?us-ascii?Q?2mfRsn2VauNyVI9OOC/58jq+ENutq4qERo2ZJ5CZC2EcoVWcbDRL+Ee1s/4Y?=
 =?us-ascii?Q?q4H4v7IYSc1+GxnnXO4n/VpStu09vaIHSO5aikFhvDpfavjIfGbBdCHRMxbF?=
 =?us-ascii?Q?Okv4FxeYUuzfy5EvO21X/duJvWXcPPJYlAJuQoiIX54eKM2EdKC41DfNn4h7?=
 =?us-ascii?Q?0k0o38sEWt7r87yUiyLm0uuwgX0C1Qt5eyasFs2BqebSaJiNEWplYKGmdxF/?=
 =?us-ascii?Q?lQIzpckeK/Ar13L15Qmy7bHwGzGVF16T2T8JGVSi5PnD6DZGyo6v/VsDQkNi?=
 =?us-ascii?Q?tZ0eeSwhoa8p3TOqw+L0RAS+d2JQL02ApZ5/cSs6xXLmHfk8kLbDYrPmCp+t?=
 =?us-ascii?Q?vNemtUpqvvmZXmVusI9M9hCbAJ3e0m6tvN8p9pjMHtW88ETwELSfOajeWXSv?=
 =?us-ascii?Q?RpaWnXRu6AhlWdJqtQdVKBrc0KDBZREsPtTdmYKzI0nwvPwHwKzJK2PADoKS?=
 =?us-ascii?Q?a7GH+DnG11+SW2NdB54BbmIy/DjE3WudVz+D/1PxqGTPPF67clUuhJgM5yeF?=
 =?us-ascii?Q?jXbqNUyDKSYYnH5uhdwX3C2+NRcsEDRD9r6oaZvvTOQ7RZj4t2AMHLxctWwa?=
 =?us-ascii?Q?OJ8j0X5+SqZ9eGjEWwTVytafDqzg4OFD27PbyzXhd/GOhK366IZd1wOwSTze?=
 =?us-ascii?Q?E5AMKLEqnpXrskt5VPCKwcWcjFa58A04eK/cJEPFDNwDtOgyEmiaSPFKcpS1?=
 =?us-ascii?Q?Y1v7kyWKVRXQHwyYVgyNTAP9l/8acoM28rmqPkYqr4q/VmjLL6HaifNtT641?=
 =?us-ascii?Q?UXKfbqKtn8A4kJ1vu3Pr9nwM6luCfHceO0lpn/WYfL4yE/AuYVVk2FdumeEl?=
 =?us-ascii?Q?ZHvnppl6ogGnjahf4XmbxAIy4oB/CfnfEzKArCacvqQGao1ZJ+BmsCNHQSge?=
 =?us-ascii?Q?2MKYbDOmBeIt4i/zRvklKy3xSEm6Hz0K+5gd5hi10+Drd1PAfL23NihdfCBz?=
 =?us-ascii?Q?kUrY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:03.3762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ae116a1a-7dfe-4f1e-32f9-08d8b2b8bfd4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUKNQOhvE7h85Pdv5oxQ/64Hr/pum11mddef+zZZhbUnr75OKzKJEVV1VHh1GYWX/uUdHHXbjH1VlH271l4djw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

[why]
As part of the SVM functionality, the eviction mechanism used for
SVM_BOs is different. This mechanism uses one eviction fence per prange,
instead of one fence per kfd_process.

[how]
A svm_bo reference to amdgpu_amdkfd_fence to allow differentiate between
SVM_BO or regular BO evictions. This also include modifications to set the
reference at the fence creation call.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h       | 4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 6 ++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index bc9f0e42e0a2..fb8be788ac1b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -75,6 +75,7 @@ struct amdgpu_amdkfd_fence {
 	struct mm_struct *mm;
 	spinlock_t lock;
 	char timeline_name[TASK_COMM_LEN];
+	struct svm_range_bo *svm_bo;
 };
 
 struct amdgpu_kfd_dev {
@@ -95,7 +96,8 @@ enum kgd_engine_type {
 };
 
 struct amdgpu_amdkfd_fence *amdgpu_amdkfd_fence_create(u64 context,
-						       struct mm_struct *mm);
+					struct mm_struct *mm,
+					struct svm_range_bo *svm_bo);
 bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
 int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 3107b9575929..9cc85efa4ed5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -60,7 +60,8 @@ static atomic_t fence_seq = ATOMIC_INIT(0);
  */
 
 struct amdgpu_amdkfd_fence *amdgpu_amdkfd_fence_create(u64 context,
-						       struct mm_struct *mm)
+				struct mm_struct *mm,
+				struct svm_range_bo *svm_bo)
 {
 	struct amdgpu_amdkfd_fence *fence;
 
@@ -73,7 +74,7 @@ struct amdgpu_amdkfd_fence *amdgpu_amdkfd_fence_create(u64 context,
 	fence->mm = mm;
 	get_task_comm(fence->timeline_name, current);
 	spin_lock_init(&fence->lock);
-
+	fence->svm_bo = svm_bo;
 	dma_fence_init(&fence->base, &amdkfd_fence_ops, &fence->lock,
 		   context, atomic_inc_return(&fence_seq));
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 99ad4e1d0896..8a43f3880022 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -928,7 +928,8 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 
 		info->eviction_fence =
 			amdgpu_amdkfd_fence_create(dma_fence_context_alloc(1),
-						   current->mm);
+						   current->mm,
+						   NULL);
 		if (!info->eviction_fence) {
 			pr_err("Failed to create eviction fence\n");
 			ret = -ENOMEM;
@@ -2150,7 +2151,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	 */
 	new_fence = amdgpu_amdkfd_fence_create(
 				process_info->eviction_fence->base.context,
-				process_info->eviction_fence->mm);
+				process_info->eviction_fence->mm,
+				NULL);
 	if (!new_fence) {
 		pr_err("Failed to create eviction fence\n");
 		ret = -ENOMEM;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
