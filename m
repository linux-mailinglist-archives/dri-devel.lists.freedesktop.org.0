Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056AD35FF56
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65C06E9AB;
	Thu, 15 Apr 2021 01:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6190E6E9A2;
 Thu, 15 Apr 2021 01:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8pQKeSD8tisLo9zazT7uNcagEHKPyZKS+274j8w+SCKmzYgVfIcER6SSe+oN72wQuFCJLpueSxh8kUGtfm6SoKq4NL9GeGsQU04a/8YkNpZ8T0LlUComCjJ47xYcLmPpxu2WDg82pkJeeyHZBpaOcKR2ESoFiHuXlYARtyeCy/QO/IUY1GYQAIkzHz/Gn1KISn2BI4qfNKtlGbGdkg8oTbsSvpoPezbjR+58MaXhe3YzKFtzkzxg3ByYa8QDKRAYmKm352UxvibX+ZfLnXECvRHil1j3VO9aNzRm+CoW/HUzTI0aCmFFU7PUyUqbjRl4I0tF2i+zZRHZPcu8pYQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUYyf4HSU87l8tZJ9/8efCcvlS5r5o2V/EMIUdJApPA=;
 b=b6NWe/G6wtT5c1Bqq+poN4lcu4RnahALrJ/BXvmjDMG97cNfHecgVD0TpjBW8MPmBT14yEaM4PLYtxwiXGxMagKLwGcuwyMJqH5x3gfU/VXjzBQSjjHN9tiZIEHbLSTX5tdQYhWPCNJ+UIFgFjnzGDGilkBkio/TEsF87vWRob4LmRHzNSHWdwc4RhuGnZHP6WCjEOBZaqUMPM+4KEHTFTc9jkxUV+qxgWRx98nbE67yOe3rLFImU5Lkt1q/6Kf8ttvUo7VAYCGW9VWqiCkSlEosL8seAvEZ0hUBecsJkFsa/F/yecf1G/V+JYoQlxHWFTcC9O1lmWY5XN17uGJHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUYyf4HSU87l8tZJ9/8efCcvlS5r5o2V/EMIUdJApPA=;
 b=UScROSBaqQS84wrodvq8e5u/a6sphpU0T+izXRGYI4onsvDIFc5ISmh6+W3ZwfqRVZb4lGnnokFZeUqKiiIS88gA7qP7h9ZN5nXrBocpLSw4E5BaKZnySqjmwcXvdQHHwZUYgJ0+O/4I8VC+7vx0ThW/MoPEB/eF0xqNScdpFzg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:23:59 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:23:59 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/34] drm/amdgpu: export vm update mapping interface
Date: Wed, 14 Apr 2021 21:23:12 -0400
Message-Id: <20210415012337.1755-10-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:23:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d290e439-b757-4b42-64ff-08d8ffad2526
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB479788F46A139E756FFF3E94924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAZCscZO0Ni3FbiFliB1vigqjQ5IKTsAfElgridlFpUdudtLafRaoAM9f58ojTK85M4lYssdCr4nSEM+o05mCH283E+gkJFwZQlKfTD4f0x4yVS3WJA7jBX+KtPFRUNskBmIPF7M8O3YlAFrrMeYs/bHIbLxQ3GH3qebuwQt3gVDkyetuNKhn9U91ZkFKQNEHy//+ik6ACLVYvhsLAqmPKJ2NFObrrw+QfsmzPYZqeGe6B+qPtFpsExmd28YPIVM29uzzr+QU+4htjKvpcQwGd07hfYVWw9IH/PhqbsA/7k2n9fXKIb3czM0EDUNwHfTu4yodigWUQ9l5N0dfo1cqQ/Tk9j5nfZtAaLa2L+wcvwj8BUaLec18n47h9Bd53lMELTteZwe2XzjOaJcLdU1Obky/qxiBpns+rFZJIS1nnhx7uzFhDw0VJL8X+CmQKo8ArFl9WohR9rZ1683xaIMlzxqReb8KA+90VhWGZapkRAwJO/nmvZICGKVynebItHQWNbkwryVhKtrgP8cVArvpTx2qmBxNrJDUPdibGaH6gIIwyeBEHWhr3NOsmVPAkYKJcrwasfF2pl7qC7NQ1+Tvgaas/I/4XlPoSzjjF1Lg2DSxrFCu7B0oKfgM/wb1jUljHCknCdslOmby/iNMi8jAuayrhvfNvDjKlYpvYfEpf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(15650500001)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oQcxEcg9wLQgKAXYyxtf1eiOFkaoUgGNdnBRWLsSKKCYqA6rXWHyDfPZCs0v?=
 =?us-ascii?Q?3bhk5J8/T9OXYxD0w8c62eKZ4WyL/fz+ANC8YKU2Qe/eQlgOx4I3Unt8PSei?=
 =?us-ascii?Q?QdMyBFxyzgBBWUKps3H+jeWvkGDZPAT9X7AmG5eUqnuVYPybKk6gfB33/6b5?=
 =?us-ascii?Q?AmCr/cNyEWr5baCNSxh7UOoBxaMRNidtIWZkFn4Q69Ea0/sKLLz+IBkTOikp?=
 =?us-ascii?Q?9sWkNjIsDv//j0KmTuFvkbVmO/arBpLQ1id4YNGgfgSv3+snsnnY4QjOPfZz?=
 =?us-ascii?Q?um5iz0zbhs1TdttW5jl8r2zYS01hAoefsbH6a/X83UVeHjfAwM2hQJ3Ry2vc?=
 =?us-ascii?Q?+MIJLy877VgeetHJLCg0RazG5mgSgiCqb3MAG86l3wR6MDj2VwZsb0VPg1TZ?=
 =?us-ascii?Q?h1ZLMM0IuLnrJN0iQDF5pO5qqFnzG77IYLZLc3j/jwwiIeKylCsCfugeG6rk?=
 =?us-ascii?Q?lac7YspeDgfe97LkfFC3e/SebcyU3C1o329LR589I89kOYH+cYD7JbhZJ1Nj?=
 =?us-ascii?Q?tCqs/L+1/lbir+QQgJSlYMtr90Y1Xqt++n0u/KdckeqYgljyA5nWOPOs3wIU?=
 =?us-ascii?Q?RqhSG6VgnwZ6xGOGVx3HIByjchGrNPFgibYtcubOCTl+b+VJ4RwjU42Qjqqn?=
 =?us-ascii?Q?5kOc+R7t78VyMFyrUFRmA6oXQwnc8qv9ecJtCSJsSmrc7ev0n6S5sCnfQKPK?=
 =?us-ascii?Q?ZnZ61iXDsSszGoQYtQjTirbKnz9R+trFC78Ta7zS0z90EdzrZA48F68n8pqy?=
 =?us-ascii?Q?Na/JleuP5XL257kOuYuZqU9xXcUU3sCxGvPo9ws2S2/Mjfykrn0iIh5fszHw?=
 =?us-ascii?Q?/0+iblN90pc83V+8oSyeFd3h/4ekia/CedWYLifiUghpBEYxzXw57GMrsvNa?=
 =?us-ascii?Q?vxQdNQQ4UH0iv7UdF+YsrLYTo2d3ZVoc058CM0vlZ5QH/A0K5481aUZuGekn?=
 =?us-ascii?Q?wQA7veHzPvoz8G13QqziUaYiKPr2Ld5ns+y5YHJ7trj5RipB0kngF7YJOH5i?=
 =?us-ascii?Q?tyxu6h8pM0JWumJ7L6C+fz/bO8/dtkKrZ50XCmJIUF4Hs0LbTOI0ckv2WG3c?=
 =?us-ascii?Q?RgMyf1MOThdr/MX4NhUnnpS95QMl2TnptfWm8X7ZDfFU8uiBlwKtw7nNCPPo?=
 =?us-ascii?Q?fejHcHjdjopvP5DTWMhZg3xterhoBzWBnuwAGRcoZ012xjXWcKPHYo/8y7JB?=
 =?us-ascii?Q?ujWKGyCl7ag5xptsrrVdMghDiKgMGFYRpFrwD3dGb6CoPl3rsEpVNriAcIls?=
 =?us-ascii?Q?r2Hrmv2Zn03I3uxBT034p1E4fv5/fYmO/XQTeLhlT6AsOfWRQfIpZUf1cgGZ?=
 =?us-ascii?Q?PExLFF8Zp9EihJc9c/RYU/Fc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d290e439-b757-4b42-64ff-08d8ffad2526
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:59.1808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1vySh94xuzPXMJZ6m10gnd0NWuYJVIljYfEBpfgDHWLk+Ncnt6bFhzL8nUkMoVUOthYnYscNt0WjgLnQHUb5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 18 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 11 +++++++++++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index daf926a63c51..f06de6dd7f16 100644
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
