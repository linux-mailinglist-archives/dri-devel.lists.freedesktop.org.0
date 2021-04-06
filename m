Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EF3354A5E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BC36E212;
	Tue,  6 Apr 2021 01:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870716E1F4;
 Tue,  6 Apr 2021 01:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DI7Yf9gupmGTfBYNQkC9dTjSzq8k2CKpqVVOq+MZ2/3fqAKEAFEwvled8UfnQMcjGf2AOhnxLlYe6nReCDST+fLw9pWmqnk4MFXRxNWqCYt0pwbBmqSb7O852O66WZmG16CSZRFVorIo8muedoRHmT31/XLCakFNtYyg+tV0RFmrVLyP9n43leZ+wfMTygTpc55yy7jgANxI+YLMNHfkqd/eOotSdkN/qSf1pwWJ1dD8iSHQS6TEfrXoHSjsmT4SjI5t1yy0KSEYsqF/+yjsfCWemPX+lFDX37QLXWGRFXJt/lu70mUgfDlIZ+/uUyoyOm5ROsC/PW5d3+JWpBnLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUYyf4HSU87l8tZJ9/8efCcvlS5r5o2V/EMIUdJApPA=;
 b=hMPebrB8IcM2PE6jsBEwZ7qF1LnbmOTT3VnZAXRs9FOFBpNCABpENeq+gION0vXjRsatmY3Z/AaDExdjhpHEkf5cQiHMxTqFRt1NaXfMLf8CVhKl8+h+TH3yAhY7S6QXeCYZXTfMO/9/u+l7l3ZDSLKsp/NZsv2u7bppyo/yIXOWwPaaf72die1sQItQAsyryvg+6IEOrCmKYNk63FBeAn5Ie4t/LrIaEsfEpkah4ansWt6YVbBw08nPoz7e1Pytz06Wizl2BVKyIBxp3GYgpyGGd3MEepuThbddvPx5kzVoPaFv9xDPyxQzKY6S+LLfv1C0U9gUPXzOmmOtccOZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUYyf4HSU87l8tZJ9/8efCcvlS5r5o2V/EMIUdJApPA=;
 b=4Co0xlu/6NCGZQ4ML1MH+JsZ09aIwt/Uddwgn5Qi0XYK1EIH3GcL9ZlCv5k33EypoJyEutdnoBmGln1kP/0b4M8LjhlyvZ+FbCXmmZ/sy49/Q/uhZMO4UlBvHsuikocinTKc+1CnbpwlVXKH1Wad1Vmt2cBiaOEDxvRbiPneJGY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:58 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:58 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/34] drm/amdgpu: export vm update mapping interface
Date: Mon,  5 Apr 2021 21:46:04 -0400
Message-Id: <20210406014629.25141-10-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3a74485-cb44-4d8c-4d7b-08d8f89ddd43
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB377364EF20E0DFFBF2CDAA0892769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +65zC9hPyv9CRrNUSoZOni8SxvfRVSpJyU0c96GeF+hUlVnfTFlcLm5NxNta2HddWMlU6KvMTieeyxywvOkT1IexrJZ+Ge/72ydlyGLlt9ag6nEvHqqFbbIvXj1xyfuf8SH4TbcnvNTiT9ZhmlPyKbmRGxUlIlXa2DHIO9pFNHNJtibA6OuWNzAUjcza74jkBP67Aj01gGfDgwSv43M6wn80UJ2TzjtMIdiz/yFDl6XYm8axoI/0hv3hAxgY4pLu2USl3T3eMCxeJ6986dOCrpcOO//G+gTEm0sJeErGMrK49dXiCerRw/KzenfBX0Pk3LHcV0tRYFCR4Q2Gs2HtJOHkqjQk6E1p0VJgOZs0ef0RJ6+IKSYA9sRNVgKNcrcxGnGyM1kJv2t29356bcobNgtpYS4WbmR4xEjPI6/bgVk4j9USN7pX+16igRa43F6BA/NTds7DyHh9KeX/CxNLecFGoHCEmRDjVf6qMUnbCNSIOKJtmudwEZoM63Y4gIvRFtFl8yiFACJNvXvz8T9zj+5YLvh/i/QW3ZKHsZv/hvRonwOvlAtIPk8cnZKB/xNO5WXLGbSlOzmR7n/2trTqvjDpYMFwYscediafjZk1+GaHKGQzt3yA7rZweZCS9xe1b2XKe04+Q5BSIanPYC/xcTwvziZNDWXFvwVSUuzKCtBSgvcv73gsH9eWkgL/8jZT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(5660300002)(6486002)(15650500001)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(4326008)(956004)(2616005)(38100700001)(83380400001)(6666004)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vvcyGAl0xSQGbZ2wX71r8A9BuWoUZ81eb7aHoD+U3Lo8UUa2Ud+qsSnuFLkE?=
 =?us-ascii?Q?csgsh6AlqCnL70uKYxFsqDgmQY8Urz15Dd79OayUfXftjvtC0x21j/hz3SqY?=
 =?us-ascii?Q?s8DYBMZiZ6Z51j6z52bFqbV3aA14U+i7OLSu4ra3UVuvyEPn7BiIFuGFwUXl?=
 =?us-ascii?Q?ME47k7r3ciclEbjzdvdrkifqoWF9lSzlzShv3LFLaCOTcbuQOKeQtwY4SOME?=
 =?us-ascii?Q?5ZhtsetUVIR3JPAKBs3B2m5dnqNl+/gX6WHkqoCnDbo4gAUZhX+rgRps2UVf?=
 =?us-ascii?Q?K25NFzYbgTgS8Y3VHHFAYpCyYLQ1yal+hIMndCE8V4DgzuEw26jx3QhFrVSQ?=
 =?us-ascii?Q?NgrlLp4WjkX2ShbQmi4lq9AmB0UbiMLnJPN1bJWvX15WTtl7vAvGm96LWjqH?=
 =?us-ascii?Q?+YnyqO1d9jPfx/G8MGGG3yxaz8fSu8E2XVzXgCakLQxHTzHit0AlXnZHSJYz?=
 =?us-ascii?Q?zmVU+EHR9TJhw6kTF6N2DcenVB/qJhnY06b2p7jabf+J5aoNCMr8flyoOMXd?=
 =?us-ascii?Q?0qlFHatutytzjDCO1nTHclyVG3RzQXMvLzsOF0XzrbV/CmwNUFAH/sTGYPv+?=
 =?us-ascii?Q?jVvF0UDEoWWJbOcPMdy3NucIfpzZZzfyTy1U/ie6wrC1aCYAHtotuXXxOe5p?=
 =?us-ascii?Q?nt9K/BR8A7lefXdOSKP34zNg2r5BjV+scg6IVoAl1Pbry954WRZqgfZhgObG?=
 =?us-ascii?Q?cZO27MFjqBKUR3aaA/s4sRfKC95CI7DelTlUBZCzm5tIoujf58CD61UcmOZn?=
 =?us-ascii?Q?taKoQVce+9+/eWSZQlcHbiaM7udBPHWZap+dam1ycGioNgQnwi2c8RtJIZht?=
 =?us-ascii?Q?yenDAh7cu2DVh7I7/octNgAhgR5QrkgYrSledyyAqNAarXYJGtFbuzRirfNw?=
 =?us-ascii?Q?+qcOOekEHlgyxSvaqVAUUwEXfqKBxvksVSO1I6eZvJwMZtC1qJmPWzw+Lli9?=
 =?us-ascii?Q?iCAsmqGsH2gh/ymJgUIcW6oDIo9i0Dh2YC43vtm/DMZCBAWKY8V292TDXxYP?=
 =?us-ascii?Q?5tRPBAiVIHFmpHBfyRX1srXyOPw+PNbseUGPGD6g3TEuZlxyRT7xp7dqA+vc?=
 =?us-ascii?Q?3uUdpUeQvA1A67Ih1ae4bKxBr/ZK2P1u8hZ2i1Axe28WeD8c3K7aWKrE1u7W?=
 =?us-ascii?Q?e02CXj2ZWJHb1J+pE29jJDZ9o//n2IrPkW2gTqjtnKUaNokzpLRAnKi3tSWg?=
 =?us-ascii?Q?FP+u+TxxgmLiTNYyjadBavZol2pOumv4TmK7iBQfvCBecSxIxV9YbkzM2a6Y?=
 =?us-ascii?Q?ickltbczU8rcGWhnI2fVsSdcQi+cVWUXzLA2G9kCFouuh/rmJU2hWLtdb8z3?=
 =?us-ascii?Q?XqvGLCwYcEWgxPcvA87Mjihn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a74485-cb44-4d8c-4d7b-08d8f89ddd43
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:58.0506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8cZN6uxfDgEQ01y+nOEeZ563DzTML+NeZgImRQJVyJ2A563NhInhM1nDYgEva7k0GdIOhhitxHX+DpyfCfriQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
