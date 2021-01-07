Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A462EC896
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FF06E40F;
	Thu,  7 Jan 2021 03:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3456E41A;
 Thu,  7 Jan 2021 03:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elr2onavD146NjmK5RJC5V8BeO6TZD5ARr9IrsNoRmEDu6xq8a4Lj1dCZfBSEKSCmo8Avg9Af9WfEQ2SMmlZumkbUaawiCF8YGYQS4SjxZLDRyDvy2GGcMV5tXjEJSiX3NaNHsKi7lb9AVGG2kwOK68z2z9/R68Q5zGdW39rVaeUx5R+/qp99Q+hOHshS/EyhpWDKedY/b6uOfJZRD/Hxl8yL8mc/kmaigkYaxLi9M0YfYGC6a6OeoGfsNMZZtPLE7b+4tL3neptc9aRWJ8dsTqhyBhPBRdVkzTlF/E+Jt+sm1TBD83tm8jw4+0oInfNgXBmVHGE5y/Is74EYM46eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ4wchFX0ZYUm+Vb/bNpQf6qXtiye3nP/tR726hvQNY=;
 b=P+GPeWBmMKai7CR5yXm1pa2eAMkadzyyFFgYKPILxonINWGvh6uOzYavSpRJ3eWSlNHl6HKKs5G4kZ494Cq7/CUnzD1tTf21U3QU2ylg/NMPxUOrfB1aMKuXHiAbsHoI4OMqsKD3Xg8kZHE4qUGC9goCYeCT57+ZJTt3d5QNDmLI5vZsUlWw/gVlSl8ggdeZMvGqK6V+a6HFv2wMLa1mhA97wXFnjleZ5qKNAFIHPzBWT+01x+yb4KZ2t/o/5BupzpsI8DS9ml+FU1OCm1n0qF6/33Nujb6zKfNpxW+agxRwIOarjVEAytFKMaPHjDWsbnG+gf49a1JnW7dxK/UvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ4wchFX0ZYUm+Vb/bNpQf6qXtiye3nP/tR726hvQNY=;
 b=IDAF+VyTgQp/9piReynwh5c9Jq5cY7BjiAltNsjKYkarjRZdAUA3AKfqP9ObLCUuK0k+ydfzk+8jNq8SQP6aECM7xH4f5EV/DTAPdfq+qQILRZ2jkEDgU1B74ALaq9kKYvSQFZqeRpeKTe7x0bLwVJdhShrpqpKuSrN5d8/6hZE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:54 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:54 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/35] drm/amdgpu: export vm update mapping interface
Date: Wed,  6 Jan 2021 22:01:04 -0500
Message-Id: <20210107030127.20393-13-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b7bbf8cd-7208-4c96-f5de-08d8b2b8baaf
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39994597E0A5E9DE9856677592AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: axx/00wKeH/uEtjqXiZDj+aljyN3RmXoCxYdpBImeFwpeHAgAWe4VEVw30j0d4Vtri2SNmJfxssxlwfYtRYlRaE+NcGTTk0ihZSOJFtRvlhdOqj3mHXkqAw/Njmzmnf9bA/u4d/F60c6lXXXVesknopkNI0HQtMGgLH287v13tAGbcqy8jeXg4DvgpDIWjjHBeCztJeHnBRqawtH298ylNF9fG9vjPkX9HKg7kIfNsaT644vNK5Mn2pr9VjnzhHL6RD/l7hLMikYSm/0clMUkscn634JzQlbT7/XM93+ZyW/0BJAN3gLxz1HRenTWnH+sLMM6okAk39QqhWbDAkvROIQpElMKrFkpqf2S/Ss5q+VUeDGBCTBQa8vBRvFFz63vmNmcescdESvA2Qb8N/eIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008)(15650500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qEqISxYHXZtz49PORli2F4/h0hRhPu3yikSkmtW3LTpfgB/bdmB8yH8huPys?=
 =?us-ascii?Q?7A6FQTDTdUcuKRaEQo+diPZtamz1KQaZG5viNsf8HbSWD16o99SX+WGqm4Pf?=
 =?us-ascii?Q?CiaRmYy1Aft3/oq+kqqNMHzbIEYG1PrJ0lbhV4cHL0lytAYcDXOPlX8WJhJ3?=
 =?us-ascii?Q?5rm4ys2bF2ZVwd9WHjJbbZ1RWKztzipYyC5PoRmUBoT373laN4h/MY8BPD1S?=
 =?us-ascii?Q?WGqJ/7lEGxsxVuK54Z/muvVx0Je5LDAgZEIqnhl2i8YWXsR7o/g6UMv92AxC?=
 =?us-ascii?Q?kZVRLVx/P3E4EWPaTI21QdEhcuXnoZkKA0soyp4Hk9tUo6xtj8tNDAUbgwpG?=
 =?us-ascii?Q?sik/l6GhrE7WYWMeqnlLrBOBqh8avC7ecCaBh5bs647vc9Sda90vaZhfAGrk?=
 =?us-ascii?Q?FY4VamlaaA8UImeWEiUDltnAZg9T9PKzOCxq6l5kTENkrvJLkcrNje3jjlXy?=
 =?us-ascii?Q?Dtg9gDq7AUDbCAbdp/NbTs+DOYRCZkatt0VASncgTkzf3r2pKJVCMysIlaM6?=
 =?us-ascii?Q?lcbapeSWngJe8axksEEaKUstGR6rLsB0HtdvnKL+HP08gMb8l0Agw8g2+kfY?=
 =?us-ascii?Q?o0z/vTWzqwlqaFQLQ7vyy9KTHkgeS7Sb7RYjdCRnBVWdcMubJ6HMgLa9xnAU?=
 =?us-ascii?Q?yIkDG2yq/96FWCgoZG/1/NAtHL3zR9B8Q6S9U1LXktgxqy9r91NYwQ0IXToR?=
 =?us-ascii?Q?0W0tELlp8msTPK0di2SqlTByPstyO0WSpXBKZvulBIAHfjORbsr5U1I6nRE0?=
 =?us-ascii?Q?AabiRWLvdamEBdzsWkjjyrQG9ZqV7s3jQ8jeLfmKZTA8Jr/Oeve0YOY2wRo5?=
 =?us-ascii?Q?341HezB5ur2Gq7OPUjU8vqVCN4tWfuRldc/YUDBDFGJ2MQPO4JGe9N8B986e?=
 =?us-ascii?Q?vE24T3aQ5c5VmVNL61uQlsfAsVIlajudT88loh5tqBGH1iVzawiV3vSVYzox?=
 =?us-ascii?Q?iTeJbMdQ2xutzJVhzYk+ttim90m1vhk+IjTLn41HpU9PCHf/+Sq6ACCfsD2Y?=
 =?us-ascii?Q?+Xww?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:54.8058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bbf8cd-7208-4c96-f5de-08d8b2b8baaf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8p3RFz0fVPMbKGJdz5a6RrsejGMW+2QmYjDTRROXjDgUukZCrmeffXHurUIN8gL1lKFaMrRZlKW/NoGCoYoxZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 17 ++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 10 ++++++++++
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index fdbe7d4e8b8b..9c557e8bf0e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1589,15 +1589,14 @@ static int amdgpu_vm_update_ptes(struct amdgpu_vm_update_params *params,
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
+				uint64_t start, uint64_t last, uint64_t flags,
+				uint64_t offset, struct drm_mm_node *nodes,
+				dma_addr_t *pages_addr,
+				struct dma_fence **fence)
 {
 	struct amdgpu_vm_update_params params;
 	enum amdgpu_sync_mode sync_mode;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 2bf4ef5fb3e1..73ca630520fd 100644
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
@@ -397,6 +399,14 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 			  struct dma_fence **fence);
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 			   struct amdgpu_vm *vm);
+int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
+				struct amdgpu_device *bo_adev,
+				struct amdgpu_vm *vm, bool immediate,
+				bool unlocked, struct dma_resv *resv,
+				uint64_t start, uint64_t last, uint64_t flags,
+				uint64_t offset, struct drm_mm_node *nodes,
+				dma_addr_t *pages_addr,
+				struct dma_fence **fence);
 int amdgpu_vm_bo_update(struct amdgpu_device *adev,
 			struct amdgpu_bo_va *bo_va,
 			bool clear);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
