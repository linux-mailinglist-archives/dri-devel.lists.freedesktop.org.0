Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ED6343EF6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E66C89EBD;
	Mon, 22 Mar 2021 11:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58189B27;
 Mon, 22 Mar 2021 11:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEbxWds7zrWiXmpydv88jh6ak5zqvNQpmQULTTmwX0GA3MJ6PHc1LsJLT/Sh/GrU1YXBc1OZSnohlKBlPewyrT18Dh0B+cdFzD8KcUI9qE/COAc10sRjnbS3gQuBgOt1TnZ+0/VGMicFE6nO6ajVfX1OAfxLChnYmMXm1O6+HmR7+NDXrd6GVAIgHBO4qgpicT0hEnnubKnmkQbwBZswlS+1t0gpxFnc5oikzNc+VHm8Lboj6aczVmf6GpgCLyYUbWjLQeXneylvdoyinqaeSgpvIDrOK7Egu+8pu9++mXogE4YAiCoQ49+VRO3PjOmYlQrGIQNBonY1474YZE8Bhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mrhwpruagGf+8gNs25WWLkvR1NYEmptQMB/RQRodxE=;
 b=j9k+E7LF8nzVCq/WIii6hL4q63p6IckDQs/0DLCFzVZ04mDqyseaGJiXeRZbR8QDwOmT3G9c3ijFkycy39jxx851RLqv/Y93qDyDNqR7as3EDgulS1Cth+TLa4cWRZpA3g7vosJRYsCBzjQPXgBwegh4Q1NuA1rAX0sjfH9Tb7T5KYXf6JZFufO/Wby51RUKnUVc/lBadkhkQA0cSQgJO8+zqPtuXezFdFXi1dDnAzHLcoBa+vwEQDfhUVnzSy+LXqJmeR1d8C9MvOhvL2NkoJEWo3dZv20FK2Ao9Q/pueyvnfa9BkByVCVFi8vkdo52d5PbnCE/R4TA4f5r5zZPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mrhwpruagGf+8gNs25WWLkvR1NYEmptQMB/RQRodxE=;
 b=kuWhI4aaDbGKVaiCZPtcwX9w3LuPao24zEwBu7IUmX09MDeTin9gEeDa6wbdUBmoHEuwQHEiF8td4ebOcHOq2S5dgiEXIOkEHqPNtydNGh6F0k+BIMnCeYqunCk2jCpP7WVksXDp480rPsm+IJ+LAtqvHEFfbZvhNrluRtuBCSc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:34 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:34 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/44] drm/amdgpu: export vm update mapping interface
Date: Mon, 22 Mar 2021 06:58:25 -0400
Message-Id: <20210322105900.14068-10-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 86310b36-b0c7-4ce4-a4e0-08d8ed22b1e7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB367814BAE642EF17B939CBC992659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8CFTKJQTf2UfTiOfSQBEg12ALyQO/fCPUjmJv1dJ2cp15jL6iBuW9wsFvUL890ZF0eDU72eV5C7jxVcey8wegdlJqdK6953FAxhUFs/1Hk3aEbDr0Wi4o0OTrELFZZun+9fdhSajUVk0BmQXHGTUsIQC7vpdy9SCx6U511UWUu08Lgw0FCRLx0CR4zbYFJ2vSEDeJ6Uw0P3XuhakCtWwlMJYm8jqr2pJT5MdsmjwVnJXAqIUa+4/+TVQ5rKg/aFzVFVPEWsz6Vs4fJPrCfHINf6Yp2mPldDYM1NpnR8ljPUHw6zOLI2c3jGQEEP5rhTwXrp+p3Y1hLDu550kxFY3mMWxaxsQiJkGMhpr2sk9uB0Ur+AY+HiIv3yEtbMETZiSuwjLuwxEgWGoKIEu12BuNwtvVW27bZuKN6knkEHA3VpQiIaF1cksWCs+x/w5j1kQVooBfLomqcarmYbeBXyj/xxpoDsKyHihahAyhOOmJuKtn11qy3QRBDH/oC6zTgC4YS6r5i6hNivtMi8TqPKWyJyXPxakPC4gsLVTIx7SAVM37QzFgpIocZRUY/IqTP3mkna+jJsoBwIOJMAISTEnsTPo0ZazkRPnmNiF+yJkjVs0i0cqSwNzl1sBK3sBL16TmswE/WB99yiJ7McsO5kALU6RZ1WxLeucUlxR89z2yvo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(15650500001)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O2bm3Ybu01RQesJUv/afYfIM9f0cBSSKAitzJ3zV0hOfnoU8ZZo4e21cnBJL?=
 =?us-ascii?Q?clX+G3drWCRNDA3aqlPo5LCp8P2MraTPneT0h3+uhiXbxIr6Bk4IeNLZwRjW?=
 =?us-ascii?Q?rlnV0Lu6EekZeBwSLrHYtiJcnen7c8EwSNRES8v1En+UaX9jzEGlGdHjsGoZ?=
 =?us-ascii?Q?dLiCRBOXtgZGxPPkBVAZgCk72NluoJSbdzS9eDYZGdP5Pe15VJjT5A1PkdMm?=
 =?us-ascii?Q?TvD9KpxIxqVJvag6PkEpJNtvNiysyzdPH+ctDqB4uxlOaRZrZrLLWjfDsEDQ?=
 =?us-ascii?Q?g3HICZcNCeUq6GwoSs6+jMTDlAzwvCDHTDjmFacvuU2XpRlvbU7QC1uhtBUR?=
 =?us-ascii?Q?lubvs2A11AfTQAMrP8zubxCHI63+4NBaTOPH8nl5hA3m/Qal5/FcSerSCc/l?=
 =?us-ascii?Q?t9yTYYecw1wQBtoP7dutyK0NNCAOBrM8F1jSvzhVJ3YRLWwdocqEWCdRqlB7?=
 =?us-ascii?Q?EBRQQWwxeJn2JlxTMSnQotO85j0scFknkw58GAE7RGRfP6x3Nt3KY5HfeDLH?=
 =?us-ascii?Q?6Hst4QaFP5LgyyvWMixGnKM+u+Va53bOIIbEmvEXp8YO6O+onOnaLAuXYRmA?=
 =?us-ascii?Q?BB9kTdqngoMVh19i8wP2wzHcb1DsE7XtJQQ4wXEmxeeNu2KO9cRTA74AnUKS?=
 =?us-ascii?Q?4Z3N0Z9setQzkBzCcN/hj0jq5cOE5EtremiPjkneQCfExMMmNKBct/tumbNz?=
 =?us-ascii?Q?s/r8HVZeWwKMonB3Qr9braDV9AEz2xa7G57auBjgmD1B1YGmtnUGHK2vbQuA?=
 =?us-ascii?Q?ShShV8+Vx4iguOnQxZw3/qC4orPeTQV85zA8CHQrvjlYVdtHPqdm86VgrzgI?=
 =?us-ascii?Q?3gulTXp+ENSdpUB7HxalE9BjtLjR2ssHBf6RogZAY557Zm7yhQyRxeGnSS8P?=
 =?us-ascii?Q?s7QXpZdsGG6utRFJS2uUAJLhZMSxujmdbSCfvOrTJYF24uGkffOgA1eOrptx?=
 =?us-ascii?Q?VrU0bRXokxwIzk1E9gOISC3G9z0MLE4rMNCtw8CRQ7b8qsdlNKMZGBX1wuS/?=
 =?us-ascii?Q?Guy8tcJ+KogDYibQkHVF9+n6BnW7V2uKbhTMvsVaoRED7JkpXeTEi6Wiw2PT?=
 =?us-ascii?Q?cZ5OyrEul95AzHjVuLWxZq5Fd7AWdnzOgTUU8mCGIKkclT5SPptbHY+jF7bb?=
 =?us-ascii?Q?WjfnT5tVGZrjxBmEQDQqvnOmdOhiNH2yRCdEriPX9GEp9cuoy07TDexD7tY7?=
 =?us-ascii?Q?y7aOJeESunLBrr4LWwCOx2FTulrzqDVTpNwQajQQ9eBe9fMtITWxYSMG5izC?=
 =?us-ascii?Q?uyKT1kiajtaelKT7u9ENUJnnfyccGCVz0W30bMdf2fhogOc7wXH1zs15qzNK?=
 =?us-ascii?Q?5JfChlhXBmsS2IsOitbycKij?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86310b36-b0c7-4ce4-a4e0-08d8ed22b1e7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:34.4265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oCLs0JG3OQZ2JRK0+sNRXqzAZVWGk0ZCp6KEg4Tc7raEqPzdjGNZviXq73qG9OYEESvUPJTSrUgFNl3FDcKUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
index 9268db1172bd..0e9ae5f91c7c 100644
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
