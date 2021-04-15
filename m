Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58F535FF79
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA406E9AE;
	Thu, 15 Apr 2021 01:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9D06E9AE;
 Thu, 15 Apr 2021 01:24:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4CIPIdwwM3JLfiGxEsR2l6+w7ZZ4BX9zBuhfBTSaBhh0jyAZSfSgnBM476IlQZLsjhx6veaAwuY1sdpJQvEbLanwlhw7DJIR+BC35+LVzzr2KBIA+zwkY/hqXEpQzgHVHbXn/VfScaMpuO4dj8lf+dGeR1CgFrwfK0aJENbgzkyuJdMOiIyI9J1uNB4g3rhW48n9oGRJAaPoqS01ontpRh7wCWxSMHhLlTYPkeXP1kKpToj8c6jsBZ12d8F/jSthz/e++p9/VsE6q0uzHCNd+DsZPMAPhh0dibp/hiDk3Qe16YpuKoZFAlIK7JFVKElckuSQSYB0Ukk8KtH1yseYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCQojPp2IhnU0h8ufcLo4Lhm+o+bDWg7gHNbDkcTgP0=;
 b=XPLN9jPIjHgz/GUFLsIa4EnG6AqEfg1d0xx4H975HxlEaXGmatYdZ4AaPt/ppz6tL5mSXGg097hIGsZQ4IA/efzSq+C5IPH25rM+eQJHkdF/foIJT+rznnn/EZZV4b2T4Ip+gNid4TxhI3LE/io6gDhLXoJ+VNu/WOaf1zbjgQLOpHVUib9fbBjM9gxsaWZIcMb3GMakkbKrXq4cLG8uGSTkxFiOJ0tel3AOor/VXFmijM6NetLDLQMRTQalapBwJzT9bz/x6536koZSi1HHDp7nkjo9cKL+2W4xXXq/F5netHVTk8RYBcwq4+9egpitWIlvsB4xeC8s2SnH3vhGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCQojPp2IhnU0h8ufcLo4Lhm+o+bDWg7gHNbDkcTgP0=;
 b=dxSZkL+yFVDn2v8bqz6NgX7n/xbz3YcRKF7UpqGPWhcIc6BEZA5GZ4ygxiEMVePm7H0rrctr9q57fUiicAsIxw+JsaG/86g/t15IkT0/o+qoIqc3LcdCws6pawwaaCUOJ+BjjjfCt+IVFkzP8iuf+hjxTIQi0wT2VW9daK+GnUU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:07 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:07 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 25/34] drm/amdkfd: add svm_bo reference for eviction fence
Date: Wed, 14 Apr 2021 21:23:28 -0400
Message-Id: <20210415012337.1755-26-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2acec0ef-719b-40e2-e462-08d8ffad29b0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4208096A905792B8D18729C9924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X3UPNeVSNynrwzCrJ78znVgqIHKUjewS0+D5z6hhxendmAoy2jeETCUBv9L/kD0UkErdFn6ymKJCewyQpAvgn2xu+jjDW0m9Rc5MsAvD8+mrN0YDD8AbVsemW5c3NkzuT5PZxcp2vgzd3TpWhjsxXKTyoq+SkBzFZTQADKHqoHUOPL2hseUV/Sezut2wnZAdZ5kJQe/s2bp5WdgzAdOmQHrp7hmo3bSrfBW1GL3yuUhVpRgWRc8RwVSguuFXa5EbX8xerCzZ4DChEwZc7gKSbPhY9+UMRmtm1BI3P6pOiZEhBwY+y5coCinSAhOk32YkmXsmfpUF8Izzkrk+D1OEoglVfZXx/whTBh2RUxcHjkcF2H4yAqnmD3G80itg0WNfyeFMc0EnCKUACEUicAqeks5sobIvsoXPflDjZPgo/IwXZatqDTfp4/DY7mixzK7IvBMPoWMBkFOJCS5KiyEIvJdLHuq8z2MPZrQ6UlaD52FMhJmSvxGa1iJfzQQW3NUCVWdINaM8z3G4cayR72HdU2ZWbx4GTLYwuisy5VhzaOcFIrEw02G3Gw6/z6lk1E3n++NPLFGkjvxbBWkIYlOLqSqaCeAZF+IQF5gH28jtpw+i4dgyBDeg45+qbZTDlB04MDMrvyCzpAHbK4zrxI+d89fkQ2NbDZIhFIfsHmue6AE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l//TVFEUZW6Ummp+A2OtLAN0lpyfe10QoXjSCZTs01r97BrMmI8bADl5pFTq?=
 =?us-ascii?Q?DLTLYH79JIn9wrJfDJZSHS7A5KOZxOCvj9YDMxhdd8tBwM3iDGZFX8Pg19J3?=
 =?us-ascii?Q?UPXXjfeMvLvcqnONDMvtnBFSuSOmayxd8hkxIiNE2SppjCWWcBYY4YO/Z3gW?=
 =?us-ascii?Q?SBhDX4KjTw7bt0PZICegHI02EErNfA02PQMkdJXwpydeQ8NO01uQMLTZclIk?=
 =?us-ascii?Q?k7loF5lBlO9u8wGZXa7++cvM1BrefkOy8ycxhUmA/9jsPchjbeDZQSzq+kJC?=
 =?us-ascii?Q?e5kARdYplJoVZCi1/u/8a/nYmz3ACv+uHUj+/IcMgdHlpWqSRtoLEKieBKCl?=
 =?us-ascii?Q?Sh6LFRQh62qauP3nVKJ1a0jnjDrpcDDIafmaFjWtQNcLsT1OWfuAjHLR9jAm?=
 =?us-ascii?Q?YXyRqz2UXPtBNI7bq/Ex/TxW9RkjecBn9WT/lld2PBgM6hLCfwE5/f4Nuvmh?=
 =?us-ascii?Q?diLWkv2PHOqsWMX7/q3eM3uDcS7y0Ciw3rjPyVyUssRLktj8IFRMw61Pdiwt?=
 =?us-ascii?Q?t4W+Y7rsGgymvKFIqlVVV+ZYlGtO17N6d2bSb7SLOFZNvNlti35F4aIn39DW?=
 =?us-ascii?Q?HtKc+vaSjS5V6x0MpvQIBcDWjIBliQfWhojxTiOvmQK+kG4fisQWtjmDcTT2?=
 =?us-ascii?Q?db/NTnjrkL+/3CLnszPAQFOqEX2SZjIpbmpns1JMfJKDi91MkrgvUmS6OTLk?=
 =?us-ascii?Q?x0xO4/A9fcjKc8XNRON61Uy29wu32wfMbVG0wzKCA9mOhCX2ixea3Tl3hWMT?=
 =?us-ascii?Q?VTBvY00nVVvn2kjE6w/7KL7oZ4664nGvP3eV3qWz3OHyyUn5bnF/10uuIxc6?=
 =?us-ascii?Q?4/Dxyol5zcFEIWHimPeW3N8++XTCL5YCPSt+7ScbkJFAGWB3ekYLgWkU/uAY?=
 =?us-ascii?Q?A2ByDcMa3r6jGHwA9NEAkjePcfYPi+W2hiUbXrLm69l+Y9VyDNB2d2iBqPDY?=
 =?us-ascii?Q?Cp3A6smerty9hY5IzOFlLygm4yFLtYlFSYSRqsMYRZuA+JUUkCr7W29kbHCf?=
 =?us-ascii?Q?+Dp6UbnqcX87CYXJb+eeMH0UUHqpSzznDoJiTP6SMmHsSJxegx1hUOM13wrm?=
 =?us-ascii?Q?3Q+5nzLZkOeOkdDCIBPY9hfpPjH/kXDHOhZiccUIsrIzw+YztQJJ0w/CJcK6?=
 =?us-ascii?Q?gZglOp9JNTfMcbB24QzNmLDoUHJeQWuJ+jt8ayvTGeeMomnkdgHSMcYQcrzu?=
 =?us-ascii?Q?dOh6XS2AQq+FIfrERcmjhP4dNgkjITvkjWLXycuwYLTcQNYyAMIkqQJeZ3OG?=
 =?us-ascii?Q?mfUZsZ9hW5iEmHoLJJ0BNfGnE1MUyc597CrZQ2mto1uhLjODwf1L73cjE743?=
 =?us-ascii?Q?YaQ9J/9j2jNNZJ4bFfVDigS4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acec0ef-719b-40e2-e462-08d8ffad29b0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:06.8133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QITT+KrIb07XzJw9dKPxdm8AVqekluTF43N13dl6uvBOAIruQH3a1Bp4V1yz6vq+ESGvL8S1gPrsWUnsY+Smcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
index 6622695a5eed..eef17986d6fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -967,7 +967,8 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 
 		info->eviction_fence =
 			amdgpu_amdkfd_fence_create(dma_fence_context_alloc(1),
-						   current->mm);
+						   current->mm,
+						   NULL);
 		if (!info->eviction_fence) {
 			pr_err("Failed to create eviction fence\n");
 			ret = -ENOMEM;
@@ -2185,7 +2186,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
