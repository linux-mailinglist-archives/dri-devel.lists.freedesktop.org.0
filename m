Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8218B350DC9
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA826EC53;
	Thu,  1 Apr 2021 04:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1956EC48;
 Thu,  1 Apr 2021 04:23:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYEyl+9f62x7soNexVlBOjtyqSfbI3S/m61HebkCoXoDXtWyh6K8XOhTgQXpGSiC7hebmIpWMxhm/z8ieTXcnXc8QQ4Pms7x9VFjkQbtnUwDStoZgGlMwvMrEExAFzY8h+4NXH13P7nlfZABxGjgE4Gx/O552WoeTdItTAedxKpb83jcFoytmBolSQeNWyHo+v/OyUHUmtkC39Zn79gQo3eHtInV2P2c4XOApt96zbz1j7J+RcY3/xsHyArQXSfEs8IlUFdDmWZ6XLxBjnLlvQ/eVoeuaSEncVbKROfSve9RNAR3jxaOhaS2XC+XMwP/ktR2h6VBV7dJqTzla8yGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3De01qbRCb1dA3rt9XBhlADJJEgvTk36CekLAl24hJA=;
 b=GaSGayZA8ALwTn/9I10fzjcFFg8ej1bXbGCK5WXBcZWbk+D1DkIQGJZbmYHBy4IYqbt9lwiOgI91QhfwjmuQuvrXMonr0UqDX/qtoWkpRhdY0NvisZDzvi9tT9lPVQqqHnuiuj90dvKviJ5diAcYRAOJqFpVRE7TgQLvpjLkbj9SDP33xpZ3rqe2axuCMjKYAbTCZfqT9PrAOgq5ehLMRw8cTWxYggBXFSW4sgUqQnoZbawVmDybcDzKNi0jcYeq9GoVgvaAEvTBuS8t5k+bBp4Q0I2qVPsETlcXGXRE6MUIHSWNanFJhJ8fnlAyF08Bd0VZSt5ORNp7vExHl2J+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3De01qbRCb1dA3rt9XBhlADJJEgvTk36CekLAl24hJA=;
 b=sTXvcrY1rjR0PGqhgZwu5vU7+GJzkbLoNUnkSW6W9sKprRiEp2RHxxLJPUAPz/gvuuWPmekhkgkyyEJGlTgOSCQ2cMUlXff47Wcsjs2OPymywvmGfifXO4wTa297D6haWQgsSCHRWf7VsgpQmlDZGHhAykoMmK/RmxJ+XrRZIPY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:06 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:06 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 24/34] drm/amdkfd: add svm_bo reference for eviction fence
Date: Thu,  1 Apr 2021 00:22:18 -0400
Message-Id: <20210401042228.1423-25-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd7bc672-0772-43c2-b26e-08d8f4c5d8ce
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222B93AA0FE96D53CBEB7A2927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eA4dwspXWM+nx6YYmmqkn1h1jY0qzI/XP/BESZeN4GDNmEldjh2J1HV4rpuvFwiXh8WNlJZXLEPdNT07lf/7n0D+rOWpN7y2bWO1aKeCQDYWmN4XdmiH6mPT8N0K8x1ZL7BApLPh5LGDEcofrd56U/0+VyYZ5RQGfOrDEBhrCT2C48F7SDArU3sdmuBbi6izFh8d5icvwmSNibZ8CL4rZgDxnf7/PYEyv0cdjgWXdAbq7SZPVGYwSW70+sOv/wEb7P9KosxKzwGbna86+e29C/j7E6HH7LlQ5VE7vzXSM9GiuAqVhZWG6JYG42r+tT96L/5PA3hhgo8R44wBI4j8PeRX+mZdxilq5U5fQSu2/Tvd57XZ+Qs5ETUeNNmGeiAUJHWbaHo3v5lC43tgCxpo5jbF1OYgEjuBECRWdGBixEfuSoWdK6E0o2ecO/posRWguuRZtMSsxa6kNvt/pOGv0ixvnIRCY4uVpV9aTDUAIgNgLfNDmLwXUqOZrvgELctncDel+lsJRcnyZl52+cSDJ/D5N38FV01ognqwgupAgoochtb2rZuTReEI+qGmjdgj03ME5lSJH4X6wdSCo6PovVl9SoRh4Tr9xezeHPfvVYPSvu8TvCvriZOjFtuajD0lyR8wMb0jDahTXi1uDqQASzUkfHnAUrpOcXX9/dENizo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rxSybLtRS4iNE4KqE+SRBKtm/mk5LIth3rPcSCcEJNIlrK2MPSOgNSNV9eiO?=
 =?us-ascii?Q?nbcPNQZwHDsXIIEW4Y/h5frjeIhqyOpA2GBXZxvTvotGHmk3Ed+cO98ML6LO?=
 =?us-ascii?Q?4IX3w+hU9JszOgH7yuKVBIJJ8IsGJgLQ/UIzVEItFdIE7uTuH9ydmmGxxBMs?=
 =?us-ascii?Q?CD1o2o5DO6ddXQ4yKYTbf7kw2uYBz0SwxMcHXk/ZMo+9wQkH9uVVHtbuml72?=
 =?us-ascii?Q?c0hxyY1mBHNuLGu/CwxgGBjhPBjk7O86rI3K7bAhYBMv1w08O3qLgMrFv8SK?=
 =?us-ascii?Q?LOrdb7tzFpyaTaagF3352wSGpn/t+OVcihIc/6Td0O01sTE/og9GBh05ynXb?=
 =?us-ascii?Q?O1oqGkn2UMw82ZVrZ5xyPmptPbZMway8ePr6yzGa33U2QuDe30hx5b1Lhz/y?=
 =?us-ascii?Q?amcccX390E18NCbWS7jnhBqOfDpqufLM8IGZkjFSSZt5Q94aO1LF/gg65+7J?=
 =?us-ascii?Q?HcTh19RVp2uRKuYfl7Wkiw09iJQccpUOlHXrXhXwwymaacVJffuSDBOqvDcn?=
 =?us-ascii?Q?5+IPyGYUjmaBTQs25snqfZh4ah7bw4RFfKoOxzICjrQy/P3SSj4FYe1a0aSt?=
 =?us-ascii?Q?bv/LJ9p+Fw5Rj8H+iJKktdAFr7lz/KpPRwwQdwIfcrzENd4kQck5vGNZaWwv?=
 =?us-ascii?Q?gd1gxDdeAGIljS898pTvLpTinNEATdrzaw7UMBYiwi04oERutQY+cNH5gHtH?=
 =?us-ascii?Q?XHpW7ZD+52jq5UVwKvql5n/SId29hPahgdggjnQU3uzo8hViH8OeGVupIslh?=
 =?us-ascii?Q?q14roZrVZHxqwMq+X12TEIy+VKUV+rsNm5yEPipCrjZ/zjopZadeaks3gZgt?=
 =?us-ascii?Q?iSNthffiTUK9nL+QcElYe+h90P0jTpiHrq19A1MnTmgfwh9MXLuN2GD2RX57?=
 =?us-ascii?Q?rYjqNiOfIQ2FQprJY2mwHI+TZl80qaIpzvUmNM80550yylTfEdccl/9lIVzg?=
 =?us-ascii?Q?HwRbA00XyuiC/B9hSZURA5hWbvQo4Tf3sVGZZNu8jWRg+FfhSFI918z/L0kd?=
 =?us-ascii?Q?QzcAONr7Y507B5gKosL3qo5PIYeGsSm/LiWEyjg7dWfzexr1fdhDAmmyvH9U?=
 =?us-ascii?Q?6W8SuPPfuTjBmQ97lpvNyqWNeyXOJUDMhQr4M9Jw3fZL9zjAXyUBDBmNBvPz?=
 =?us-ascii?Q?UGzxru7ldRzaisUshANXj0a48vqOsytB+8jJdChu7s9YbNRbOZ6MP1dU/OqO?=
 =?us-ascii?Q?IkMnBqJyDE1+Ia1sDwXLxQg0DfFuXByKE+8tCjHhDJbXzNMP/M7NNOPG9rbh?=
 =?us-ascii?Q?mD1gGcP8nhu7Z4lB6dL8Tmq1Gs4kmWnUhPclKQMs3UeRwa3phEF54jsQNGjj?=
 =?us-ascii?Q?lYsHvG2zknXmElR+cAW7FKz2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7bc672-0772-43c2-b26e-08d8f4c5d8ce
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:06.0525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qS6/hjoAx1sON2OrBPGNJndWt5wd0vwgA3mOI9l4yItJWm7d0Asjh1Q0YdJXNdrowO6pKeTo60QtPsMLjOAt5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
