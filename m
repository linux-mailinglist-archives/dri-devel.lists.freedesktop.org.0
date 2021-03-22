Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615B343F16
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBB16E0CF;
	Mon, 22 Mar 2021 11:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201FD6E0BA;
 Mon, 22 Mar 2021 11:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSDZVWCX3cvuVQS/nT4zwG0wp7AIL2Yynn8YoSXQg+UoXIWTH2vmSgEfAeC3IKO1t90uNAePEaSxo6dWsBKb8VLClX5JZGWgcqfApWSqhB+2GF55frW8O2q8TLNcua3LECPoiUI1foUTZaQQjGCZdHvJ5Rrcd+VWubkAY78TwuG0zrVFM/X3ykRtJ6mfwOeWRegDAr9PiR1tA2mLUHtlDBEv+jlfxiOOQtn4tACfgQqKeVTqjCM/FHj4MLYfGJrIYOiIMyzqWCh+LVxaGqSgxAmFy2wd/aCNR1uiZ8KlK7xri1fqUB2QfnTW8dyy5KhMB+f00ZpQG4vroxttsdwYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS1W1O47IQlwMsVh/EWDH+eDzzFPWhv1qN5EoiJsLDE=;
 b=DKwp3jUeHWm3HO680aBKs/bC6Ktsm0h/K7mWml0CGjdbbeVZhFsMHG06GU/Vb94xiXltVBleaeGoXPYV9S3vy7XXSOdlAyCUKrhkedUwFpVmiyoxQXZt+vR88rQ9LfDJlwDlh7MTEp6bviKR9z6wCm9nc5lE5hRE9gsBYQDNqpZLXz+ZTmsKX1564om6b/FzZ1nT8BhFaeys52ynEYbWbfTcC0djWWnpbSf4iMjIo/zxwe+gTuZ2TjYMwdb2WJMbcT22ro38+L4FAypdBJt7SmUQQQFTRVvInnfl8gT6unsUUjjfu0jnZuAtvr4CiIoRACtjiFVUj7HQOIGBOODR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS1W1O47IQlwMsVh/EWDH+eDzzFPWhv1qN5EoiJsLDE=;
 b=QP8hPZUSOQcgaOr/12TNqm/fu8FN2cU7f/7AeLaeelOvUTpu+8Q4rbVp04RRB4dipTls8k1UvqeiFANgECPuwp/sdvkM6kSx2v+YcPC+j1mGF4dg6uPdFHiR0eCCtQOxQ/taoUdoXMWxwKORx6e0avul19Yw2PgS7M7CbLtXcYs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:43 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 24/44] drm/amdkfd: add svm_bo reference for eviction fence
Date: Mon, 22 Mar 2021 06:58:40 -0400
Message-Id: <20210322105900.14068-25-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 170885c4-671c-4b7a-7015-08d8ed22b6ec
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB48992707C2F2E550088DCEB792659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HzWRQ5heJ1/ntiYxB/biA15sidMxHp5QiU/RPcqbvNx+jdoCWemCIpT64q6OgbpxQ1PcGuMxcHNSzTyUiRU63TX58sNPVvIk59hgOdJIG6whl5T33EGnF3ZO5V8/oIo6eqWRWsLDdsqd20km/qQVM0pEQkU9/7jDZBMOfDb12yl0aQNgP2y/VXWu6XIP5P6McL3G82+3izzBSjj4e3QZTMAFLrB8dhbqIVrBZxexyPsCLP6RDLwmydxv3ZywOJnAWXzGMPU54b/lMs6HUFIX2d3i7e3ufD5BrKBRhAsCgKlmZeiQFX/drOKcnAHJCk/3MALobWMos7/ZjzXuV0pnEwIc89KzxkaMNQcXosbJgvpZ3DzJJ6AanIwAMz3cNOeInXtPS5tjP1Z9WgBhvjmyC3VMos7pPPWU67PmuEgKaIc7wOM6e2jKcG+ZCMo3TImsCXXZOSfmmmS0h0N2EliDwjW9o60w9UA29m9EgInfH7/qQik8IE9hztiwMLJt4AxLF2Tzle0WJHNoO9haYVClJoBEfQ601rJVVmWze8f908eXiR+Paos3oyxVdNaygf0Q+ubTzQpd4+fJwgCKjJ0mLFN7D1yChaJG7qXLA299XvRYC5No3I+J99hKexc9fMgwEoj8YAKwOTXWSWy2kZP/9Ee1q+vLsLckx22cu0XLfuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(7696005)(1076003)(52116002)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?x/YjuFx74Kun70zKLs/s+WxN5wYU3Ogme5aXe2itNssIYIEgmqt4Fiz64D73?=
 =?us-ascii?Q?KtikYLBnW5iiCmGgTZSD6lOQQzTX/V4dokwbtf5NKk2Ttkl46q0zTj4V2vFE?=
 =?us-ascii?Q?tFOnceE/uHppl8esEu/F+xTQ/p6RYewHW453IcbnVId5ezQjOVhUxNgqVznG?=
 =?us-ascii?Q?U41426rL/hK1JpF3a2PyOSJnvAIhHt1oXx6CXlZOcoY7IDsF3tl3Gc+dJ+VV?=
 =?us-ascii?Q?SrBTuWxlxkS5SgBcoDXCvQK8059lLxmt5sdkyzHQBaD2v4LoTElI4PXc0Rf6?=
 =?us-ascii?Q?joh+hyQNt2EdqFazstqUnsrLedgHaQdaaO4805tB+IvdkJDt1eN5I3eCsb05?=
 =?us-ascii?Q?eRrNA3P2Y1Pvqy9+xMgxhKsI0WFi1VWNu0gglMwcTAr6t75hkqy/hdMPQij4?=
 =?us-ascii?Q?ZhgGU/wQey+q7iwyzdpLyuT+wmJNqtKuRe2vQ9NAcU2V/Rf/3dlpQyHcgFGl?=
 =?us-ascii?Q?Lpr3mQ4tDIjG/17atVb/9RIbKAKPppypvx4bu+gdJAu71F6jGEuaGI6ZPALW?=
 =?us-ascii?Q?10Mn7ZYlf9t0kfVS5hx3kp6jy0WohsHDKuVPvLULFMm3iTzlNk5bDduCxqiV?=
 =?us-ascii?Q?EKE70c4r3dnMTbj7n/VZ+hV99XhUAdzBuP2vMYRCgEGI5RLdFTIkG8NMAuRm?=
 =?us-ascii?Q?WrqkKQLvEQ5Zozxh4Ilfw4RydLL6HZuD1MR86Ts4zMVDG8PskZj9OFbrq7gy?=
 =?us-ascii?Q?KUj3dHy1g4C08rShqCv8h4SJgBW6cst+heTJBHzuKT3ce5R3q7DsldWNw8J2?=
 =?us-ascii?Q?vywB0BcdjmW4RI6LponQfd1oueibeWIXQW01AB6A+iyoR3surHFFhLxbyL3T?=
 =?us-ascii?Q?1ijRqva0ZzcwZNcTKjSzA6D5xEGqFbg6n01ayIWsA41J4CP1ss4F/EL0rbsj?=
 =?us-ascii?Q?EtpfzBTX35UCXlc/AoFmH+mQCGIsdCmWD7CEm4WWK4hS/GCOqmuWCcDpw9TT?=
 =?us-ascii?Q?aW/zuzAuHixlnd1A+wTkg/zum6ZzqpCR+ZqYGlRkfgp9Lp+tEJOx7pR5Dsmk?=
 =?us-ascii?Q?4uwalTS4tRjb76JIuO/O3GuixxMDFkvcbCOFnBrfh/IWhb3N7N+7a6gREqIh?=
 =?us-ascii?Q?jAIcbkC7aqG2nYOqBS88cEQaOc9UV36FgqRRRlWt1wUdIGrwysW2+RheZAQn?=
 =?us-ascii?Q?Gjr43Rt2NliCFAdC5C/dOGSPG+ruD8BJdsR801z/h4oYaOQ+TJfXe0IPkh0M?=
 =?us-ascii?Q?4uBVH1Icl+Z0Pdg3hGh+qD/QQyaUcScUg6xGrSVn/Q3UjJ81mzGEeZYe+moh?=
 =?us-ascii?Q?xtvNO9LgucPzxMzouSvDu+P2fFVV+MzXyhWKasGAKSAyuA7Ua6Lu4h6O8+Iu?=
 =?us-ascii?Q?f0b0cAl/qccw3264a3GYpRgz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170885c4-671c-4b7a-7015-08d8ed22b6ec
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:42.8416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6s3aMDqTKmv2HpqysgxEntyEJyLK+zBp87xPlNyiPaY+wiC98PncFrBJhd83/SdCEsFx5wGJ0HrZk45RvRG4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
