Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FCD350DA9
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF786EC2F;
	Thu,  1 Apr 2021 04:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46BC6EC2B;
 Thu,  1 Apr 2021 04:22:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKPDI7F42H3k74bVdFs1DFFR+iey6X745NqzkMdDii+yBeD4qZSE8ydkLLPnZNyYbiAp7a0umqWKCKkos0TG0LCN5fzF8CU/MNpaJAsGAx5x9e6vyRvkf1gWIhD1AoYRdZ1ugPERX7Nu7rrlvDXN2w2NkC3tssa8J4cx3FjRlIDnVtV+RVRMP3Wr1WqfvMa/4G+L85B7jXh2bfRYaBsJax5qbQk5pB5islaprcMw+Czuybv3vhttW71TFRcrG1HFsmCM4yhq7IIhp7rneP02WXE11VGFuAAzkoaDrHQ9dLUN/ITw5Ti1FhTjgu67dzQH69QsEl/O5bDZLTuWeTPIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixnMRuDl7WAklL6QVqetn4OMgNvJaw513IB2MeesY9g=;
 b=Bi7li/nh2tyASDqntWF7QAXkC24pZWI5ZFF994XH0E3L4zZVxRwKLrb24m0BbCpOJKC772zyZ6QxKA6YvmWBc1WE41uqyUEd6DaK22p24be28Q4lrTX13Vk/sNf+06F1B9V6qV8pUaAx7YvPqm7WQSdl5F2KuYGdFHNk9tMMHM+rzh0/Ir0ORwaiu0gZAmyRfEXWRcezlCrODJWvotQHmvikHQ1Mdr7DrnCBukA50J38AMMDuNziNweYCGFTh4pcQNLX6EesDt0ust/+1g3mi7ctUZfGrSKJ74bE0seotE/fTCi4Hj+OAYESFPzInPdrsjIlF47CqYot7YoYvu0ETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixnMRuDl7WAklL6QVqetn4OMgNvJaw513IB2MeesY9g=;
 b=lvPjKivZ0St/dy7Vq4VFptARQyn95DyYr8ot+GO9Lq2CIjhyzeal+NYeycpEud35+jC9G+hTryCnBie4plTyrVe7lMoZdujciUkEXnEp9UQLYJN4A4C5Af6wLWW4icSmh99KHsQxfTKP0+jSR8VVYtYmY4oJjXmMGkb/77y0Spg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:49 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:49 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/34] drm/amdgpu: export vm update mapping interface
Date: Thu,  1 Apr 2021 00:22:02 -0400
Message-Id: <20210401042228.1423-9-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e361ad87-7b85-4ed3-e452-08d8f4c5cf36
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB491689B5379FBD4D2D7D3389927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /L1BoTOH0RFY71BMuHdyk8DF19nbfkoYN1ZVp5Ont7iTJSpGnF+lMSQRf3seVPpLYm4+BjhAQDCMhmnMiatF/mm351pLHod6ZnBZPMN954jmhEAcxk5kp8j5KU17P7k80w4DTS/6wL70X//oO8fbq0BatLftwus2OXTxWCrMKs0oP/UfEqfgJreYW3Jvx8Ei25u2PNFodkcTDTeZV23o0GU5AHi4O83wGBRUiZSm97Fj1QAm3mmrHtqRS8hP6qbU+B+zyNUxF4yuHrRlN7v387SaQ0Jz7NKzJhsJoPfMipMAouNvQlUrVFDuRL01e2KUOVFtjnDzZc/kf5jcEDumpMmSy7LearQRo8lATNtHn7Hm+9+QK4rhHjj6KdlN8sqHXOn144SJUd2rU2CZA4jQSMcGiF+Z/mfnRER8LiR2Rwys0vBbTg3DvWWYNcg/cHmG0k/BarRgMMxTP9l5e5fcfknOdDajN44JMV9w90BO4sB+iagr1TveIa/YiUZUZ3jkBKGXUqy6jH49DekeN+viehr6kUMCUj2iOYWhJN1mToYkHbbhUZzsdQQ9c56G2KGJ6t5a2U1YHuQJuEF0DOR1NYWu/YckMgC0CjBG5SC2L5bGnwFNm9381na5z2Yy548ULx/+s0DcA50dm6cl6eZ7JsCzzlQuyNTXmp4d8N84BXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(15650500001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MELVzNOcF051VUQpEYD9ye6p3Z/OXK5LZwmHcVa7WfLyR8sSYgteBUqiuWZ6?=
 =?us-ascii?Q?pntEK3RQjXJlRpPFJwa8/mVz60d+v9SL5fC3sAMOBVH+ZPybViitwD9KBQCI?=
 =?us-ascii?Q?2zjbdIhzZodyoOUJUuYuoQn7pJrftd54D6djSQTHL5W6N++PwkMeHbWeleUl?=
 =?us-ascii?Q?+BMteU9pOOr+Ox4XGqsPnidu+MBb+sdxn1U0YfWiv5ALcZLodElGSbpuvzxm?=
 =?us-ascii?Q?UsoW07XLSVwsfNeYezisAuGs3MOx36TRiJABV2hebSxQKnSQRNI9DZSfoJIf?=
 =?us-ascii?Q?b15RVXCiwF87wogBODeSkY+14RHZVi5+SEuzxR/5l2E9KsaKq92halQkpKF+?=
 =?us-ascii?Q?ddXsgFzFai9NGEaf2RXNKY1D7r9qlMV/kQjMiV57z2isU3Cm0L0nM0L9vFzA?=
 =?us-ascii?Q?xqj43JRIZgRuazYjSIXzw1m8vPdZN7dsDWtHw5MkoaDxcZHVnDB3DwBfpR/D?=
 =?us-ascii?Q?pJF5lhulrFXTQ6Mdp4nf/pGQZ/Bb6/UNNzSQNxd2b/cDxvk8JaTR+5nO2oRt?=
 =?us-ascii?Q?V+CFL5vItLqantFK/ezYR2Az4Cgr3Lt0L9zMlcmjiA1qJ6GHxK5Rhl+QP92x?=
 =?us-ascii?Q?dS+FZ/65ORlbr/2CEG4yv5wyj3XXJs8TazO8g1SigZDr8EhNqsKChIdc7fBU?=
 =?us-ascii?Q?0HYZ6DR3Y5n9zrPNo8pI8HRUC6Tz6Yp1KIW7eL/mAVinsnePzUZH+QwaGXZq?=
 =?us-ascii?Q?zqk+WZX22PIN3T57WV50iTH2iC3JmFu8uuUUF5VsCrUqgXy87qCnrIqfT2mQ?=
 =?us-ascii?Q?JrLmiNVqHPOlCq+UNoUR0NyBi8y5dY2897/1vNNfL0vqnnXWdMcTk7XJN6sB?=
 =?us-ascii?Q?Tw7xw6QX/F9ClVqxuxViBxaI4o1NYloLl6xE0eM3erujBTt1gLJqxZY1o/9A?=
 =?us-ascii?Q?hwjOZ/xdzkHyxwe5VsZtinzPKp4pueiwwyrjI9/iW1gZUnENQFb99W2iUn1V?=
 =?us-ascii?Q?xcOOX7FYEYF+ZIPzwMzhb1h09DG0cWEnkC/D3rGR9gS2iK7WT29OZVL61swI?=
 =?us-ascii?Q?xFlt3PJcx19IjUUVqwuHagpA+glVPHRaBMdz7bMdso0R/JD04dbxbNO7OlbH?=
 =?us-ascii?Q?r46YA0xw5PG+bdvhxxIHf3YlJ5dBBR9YJ7brnxpmUay9Xyn2SQbMprfzTyTk?=
 =?us-ascii?Q?8e5pynErlXc1B56Ylpxgf1/mKigxbHsRawXPR/C2xzDwqO8xA/X7Qihuke0s?=
 =?us-ascii?Q?7owUbWhtIVT8IM3Oi5zWU4jPXyg/hdj7IUTZDmRHz4fJxAzJRJn2C9k5Qfq/?=
 =?us-ascii?Q?t9hRnuHEQ6fETSRj0gWxaDRNrKljBYrAEjHnKP6ZBOgsIo6n3iMm+1hkl4Ol?=
 =?us-ascii?Q?ZsfczX48HHZINYIO3H3rD0Jg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e361ad87-7b85-4ed3-e452-08d8f4c5cf36
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:49.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tf+cgXOHXLzGOiMHSG5t0M9rMz8xl80xHOiXdV5EKxpCvjFxW8G6k3smjwLoc7p9ssmD3mUggfYkmavfSAX2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

It will be used by kfd to map svm range to GPU, because svm range does
not have amdgpu_bo and bo_va, cannot use amdgpu_bo_update interface, use
amdgpu vm update interface directly.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 18 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 11 +++++++++++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index dc4d6ae71476..7e306fd20de4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1592,15 +1592,15 @@ static int amdgpu_vm_update_ptes(struct amdgpu_vm_update_params *params,
  * Returns:
  * 0 for success, -EINVAL for failure.
  */
-static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
-				       struct amdgpu_device *bo_adev,
-				       struct amdgpu_vm *vm, bool immediate,
-				       bool unlocked, struct dma_resv *resv,
-				       uint64_t start, uint64_t last,
-				       uint64_t flags, uint64_t offset,
-				       struct drm_mm_node *nodes,
-				       dma_addr_t *pages_addr,
-				       struct dma_fence **fence)
+int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
+				struct amdgpu_device *bo_adev,
+				struct amdgpu_vm *vm, bool immediate,
+				bool unlocked, struct dma_resv *resv,
+				uint64_t start, uint64_t last,
+				uint64_t flags, uint64_t offset,
+				struct drm_mm_node *nodes,
+				dma_addr_t *pages_addr,
+				struct dma_fence **fence)
 {
 	struct amdgpu_vm_update_params params;
 	enum amdgpu_sync_mode sync_mode;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 976a12e5a8b9..848e175e99ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -366,6 +366,8 @@ struct amdgpu_vm_manager {
 	spinlock_t				pasid_lock;
 };
 
+struct amdgpu_bo_va_mapping;
+
 #define amdgpu_vm_copy_pte(adev, ib, pe, src, count) ((adev)->vm_manager.vm_pte_funcs->copy_pte((ib), (pe), (src), (count)))
 #define amdgpu_vm_write_pte(adev, ib, pe, value, count, incr) ((adev)->vm_manager.vm_pte_funcs->write_pte((ib), (pe), (value), (count), (incr)))
 #define amdgpu_vm_set_pte_pde(adev, ib, pe, addr, count, incr, flags) ((adev)->vm_manager.vm_pte_funcs->set_pte_pde((ib), (pe), (addr), (count), (incr), (flags)))
@@ -397,6 +399,15 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 			  struct dma_fence **fence);
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 			   struct amdgpu_vm *vm);
+int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
+				struct amdgpu_device *bo_adev,
+				struct amdgpu_vm *vm, bool immediate,
+				bool unlocked, struct dma_resv *resv,
+				uint64_t start, uint64_t last,
+				uint64_t flags, uint64_t offset,
+				struct drm_mm_node *nodes,
+				dma_addr_t *pages_addr,
+				struct dma_fence **fence);
 int amdgpu_vm_bo_update(struct amdgpu_device *adev,
 			struct amdgpu_bo_va *bo_va,
 			bool clear);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
