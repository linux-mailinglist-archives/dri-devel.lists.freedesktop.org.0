Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E45354A82
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640146E550;
	Tue,  6 Apr 2021 01:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668716E52A;
 Tue,  6 Apr 2021 01:47:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTM8WDtNHq/pSM7fzK2LzlkrYnQ+GHKQ/n9g3kePgDvP9H9Cmg2Vnqrp+/xy4cIvO+jtMei4cow3XKASL5srmdAqR7mDW3Re0jXnktbwVmKLq9V4bxZRbh9QRmVC5Sjx3xgJJ51fSowncZWuo2ny98JSU5/5y6vV1UugvH+Lw8G3BgBvNBqTd4ktJF1BaIOcIMdur2w+s/R8QiWiOq/DZy3Z2C6sx4pSp+tUJ//HycoEjCj9koIUHU5bXAWIO1JGXLzZlkcPOc2q5jMFSApouROgQ2yTRR7+5Laxr4qrpMfUmAlt/EHiTgbD6jnvMI1vnFLxX7RHdlMlfxScOMC16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejaZRdpd584ANRcjUvWzqakvQItoSmn5MzLnE02HnLw=;
 b=W2fJBhIWBF4wynhu9kW40iq+woPYV98yrafFGPQdcvy+g534/ua1nPd7G3/Zb1hDj+aPENVotKdSJ5RN+XaAFPZ7x2DVLAgGayP6TVvhlcU4UNpnRluN5vgxaQaf5mDS7w59W5jebgVTAWN99G0iFVPv8qc7qhCf12b8SA/AsBxoDtqZWRnU8AqMWZgQ1f625Gs8kD4VXyiaz3+atbgEF2uDtkSYhKg6WPp896p0bGKv33bmrPCsAO6kKer2SWzV9keOz4r3ySttX682rCYONQ2IDTAzN4akC47gPAOWuXiFKWyE3rdX3n75LjKxqF4IuVPryAhzdPlfXnJnzYfrNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejaZRdpd584ANRcjUvWzqakvQItoSmn5MzLnE02HnLw=;
 b=XW4PffelPVFDC5VHi1yHeovjqF/fHTYxcDs5GdiPWQspq/plElAgQt4OVzF/d38vyruLmreCM/vtEungRrL6Is129pGlL9CDE2UZ3efL7LJHJ453ARydIgBmGdnTsFpMzWlvjUTeQnutSKoFHLBXIQ4oXg2Y+vXFibCLS7+PCzY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Tue, 6 Apr
 2021 01:47:07 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:07 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 25/34] drm/amdkfd: add svm_bo reference for eviction fence
Date: Mon,  5 Apr 2021 21:46:20 -0400
Message-Id: <20210406014629.25141-26-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bdd87b9-fb50-44b4-546a-08d8f89de31c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB420605644C65D868C691D84292769@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3moTZECSHAZ7triM4fpBP0IRuRGwtrprb3tfQY/KBvpsMjm40qFGEHQHH7OGtbBqch3XKNyohur2EzQScgoYVW0d+PyQZztbmhq2o/dax1ft8cYTnH1+TmBRX23cwSS72IdnFWGzmqNa46TJ1uVIQSRqBwRz9SHnZ/EOlhiv0+gnVWhVab+XhrLSpGK4jSVwxemEyDa7VYbtRX4nlfj3Np9HKeJAM+jOv6dbnCuHgl7Y3ZoKMLpNAHbgNAsRhqM5r2A2s2VEhCNmUt/HGWNGoenPMNI5LyQzDpAKTWsvjG1ZmHGyUCgvGGVx/48Tx6JVqxA1q7dxxHLMjBJKKXcqaYIhEWuoGuQmVlEqNDUq8o9gZVv9ZbawXz5WFH10rnTrVU3zTjte+VGKHWox59jqBU4tE8dGLnDwcGIycRLS00fUz+OyKFlN00teYJG0cqKDPpZqeBTsM7taTyVFTriYWvjIilctSkA1YBr0HczrDoFsl6jt1XsrzH+nWFDqOE9kISo8stGi0FmwRGQwhZsAW2Low9m6C6A6cHUiEyuQ6OQwtR1qStf5GZSvhREoqde/60QCykmNrTf9ug+4ZxmmNc1wJqoePn7D2L/Li9OJLBs5uiX0q8j5gzOkuFfycusSQCVdVKIh357rvX3Yamheh0herOcoJlIg1HT/kDHd+YG7chOV/wftK3AU3yN6MZ0n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(186003)(8936002)(6666004)(38100700001)(7696005)(52116002)(956004)(36756003)(2906002)(478600001)(316002)(6486002)(16526019)(26005)(1076003)(8676002)(66556008)(66476007)(86362001)(4326008)(5660300002)(66946007)(2616005)(83380400001)(450100002)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?urhiQQknnNd2zP1JwsDgHz50lj4FHcp5BUO887Ffq5Zda14xB2WUb5bikfrs?=
 =?us-ascii?Q?+s8p4X/9UgfU0s1CeZy3Mit6BHXYb/cqHTuwkdzWyHLdOpXMFo3/zooSJ0HV?=
 =?us-ascii?Q?M+tPzEvyguNpWKMwzZfddCFXOGxEFSdFovXXj7Sjz8Fi6ylbVLQM/chI0pbf?=
 =?us-ascii?Q?vRlt/yXQ9JGb9+ajDvBtMv65uBJmcYfT5SNAVtV3SLan71OqmMOfpBdBBjge?=
 =?us-ascii?Q?02wvFa3QdeREJ9nC+SAoe9R2nFSqqUiBwn3LxJ/zFO6ExO5l7jUFe6yYmQL+?=
 =?us-ascii?Q?rGt8S059L3R5Q8YkUakJkUKRkvDDblbo1C32FdOmBk+VaOiEAyU5xcL4m1QK?=
 =?us-ascii?Q?9jFggT8BUIf1n1dWjXXarPF9hjGdb2bzzRKgTHjnWdil7uJB9x2TzKMsweEj?=
 =?us-ascii?Q?5UITFGYBaDNqCteUt126BcDsI3wUJXAwEXQd51LPirLvVH6amI7ZKSl8u+5l?=
 =?us-ascii?Q?sdsQTZCXqZABBNfX2vE9Uj+IUa2O1gVCW4VOYSHEFk1jDxZl8tY0w1PNU/Cp?=
 =?us-ascii?Q?mVOVL7EnGkOxDXe8bcuYQzBsaaBoQKVJG2n9ngfdoC5DaoRQJ0mC41vbU7YZ?=
 =?us-ascii?Q?eV+0SycLXpEKnPgxB+x2TYPgrfFhRphyEEHbAgTl5FQyU+cQCjvzOVYShS/m?=
 =?us-ascii?Q?F/FYMM0l1dFKjYNvrr4seQS07nKEU1/91cFDJPRPghglwzdEyCqydt1fE9Kh?=
 =?us-ascii?Q?2vGH+ZJ5dijcxbAswy3NrqYqqQQXnzJ8D5P82UZls7Jn46p4boyhvjH6XKyU?=
 =?us-ascii?Q?aG7HO62Ab/xwJi4E1xH4rhK8LpRjp7+mSFvCAiuaG5UhSBak0twgqrSRHEre?=
 =?us-ascii?Q?xiVTIJ/OrNk8AJbh/6ZyRxKzwuS9XiTnGhHLmxRoj++UiItU1JHXPAJzWmrg?=
 =?us-ascii?Q?C1oT7VNKhHlmDgMBlitTYJZ4ZplsezqgFZ1okzxa4mz+5RHD5ZzkcaRZtWqT?=
 =?us-ascii?Q?JvNAVU1KbCFZE8d872fIIGYC0KFXrMqRBecoNBS1N/96atSyNZ8d8gAekst8?=
 =?us-ascii?Q?EOByubWS141Un1Rury0DeIu9XrXvtQkG8ScbSEwgs9AGroUZrhSwPk9uFFSo?=
 =?us-ascii?Q?CUqfrcT5slQQR47C510yeeOttJOhSNofD7M44QKwu9218Olh2I9WZkh8/kOU?=
 =?us-ascii?Q?A++gXDZxvuDyk32Hg9yMrcCDNPHfmIP5lQZye3GuyOCGtWAN5FHgAsllpIwW?=
 =?us-ascii?Q?WVCz7yDGXIEZRmEXzVznuC0dnowYvYo0l2yzLhx8nQOSdmbsbaX4MAHqx2UQ?=
 =?us-ascii?Q?JBAw9h7dg5Gencqwhzauc3AHjycJ7Y8lfEZdh8imqyZHEBVkXZTiUMD92uss?=
 =?us-ascii?Q?KHCu5YzFo17kMzJ+D0QR5tVB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdd87b9-fb50-44b4-546a-08d8f89de31c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:07.8157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJ21B4lLAhBV6jxxr6rIXKFHc9XhsT+RLKRvoR0AnRz8xjIiICuxXehBT8H4o++0uOc3zEV9C0/jF+JWH9jyMg==
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
Cc: Alex Sierra <alex.sierra@amd.com>
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h       | 4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 6 ++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 14f68c028126..beb2ef070a0c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -75,6 +75,7 @@ struct amdgpu_amdkfd_fence {
 	struct mm_struct *mm;
 	spinlock_t lock;
 	char timeline_name[TASK_COMM_LEN];
+	struct svm_range_bo *svm_bo;
 };
 
 struct amdgpu_kfd_dev {
@@ -148,7 +149,8 @@ int amdgpu_queue_mask_bit_to_set_resource_bit(struct amdgpu_device *adev,
 					int queue_bit);
 
 struct amdgpu_amdkfd_fence *amdgpu_amdkfd_fence_create(u64 context,
-								struct mm_struct *mm);
+				struct mm_struct *mm,
+				struct svm_range_bo *svm_bo);
 #if IS_ENABLED(CONFIG_HSA_AMD)
 bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 5af464933976..53559643c712 100644
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
index e93850f2f3b1..9af644f256e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -970,7 +970,8 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 
 		info->eviction_fence =
 			amdgpu_amdkfd_fence_create(dma_fence_context_alloc(1),
-						   current->mm);
+						   current->mm,
+						   NULL);
 		if (!info->eviction_fence) {
 			pr_err("Failed to create eviction fence\n");
 			ret = -ENOMEM;
@@ -2188,7 +2189,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
