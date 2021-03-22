Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E8343F2C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831626E131;
	Mon, 22 Mar 2021 11:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543916E084;
 Mon, 22 Mar 2021 11:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2EfZHqu18yLbRXoS1D6zkGsgJGGRUys5PufWSaAUzbVumEAPKnuBn/OQv6US7mNroRCOBHU5ibw78PjG8X3yInIu8LYoihd6SFVl9XJVua79aDuVq3FSSDYVXPT0KjnRPrBZbrwLZex3xVvxSrooNOHY0Mmd3j+8Hpr4tDq45zKx5psZXovrRReJ97Gis5DrG5GitVzvuiQCERE1au+dbq2EQmmdmj51XGps2SDHWkDz1pXVLBRAzT5kI47TWu+Kqhgnq0HC3Ggm66aJYmUwb94Sy8duqa8M1bbsaDtQLu5AkPQj/Z5jJ4SRdgKXZTh0SIhJ5gaLb1bi3SXzEQ5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rS9NQkqydZvbsSVxX5fbDh2inCGWs7BtSqnr9rI2uGg=;
 b=UCF576SG10MAQ9wIAFJ3x7wHznqT0UaddpbQcaEMpS9iuKGfb1XUOvY0kHbXaYGFT363mN5MMLqXxOtZGx+yvPtdC1JfmIJLt73LYDu8MOeNrX9l+PZkV2lAzUSw3i1TrYImem/m6RtUPNIX8ppE63Ty8juvrP2yb7h9ybqKtZgOW0hx5E9xHXDXtbMpM07BVjeRBYdVvRr5J0i472Xx+fuHPr65SfaghTXjwbqHPcYyKOMs5JWZ2JV94+/YjCkvS0Lk4ZsNlXBudZabFL2BRNgdwXm5gvJYoUDEk9HlpGBNXoAerKoQkDLq4hjF00G0zbYcUYsAGaIOP8tRyMOWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rS9NQkqydZvbsSVxX5fbDh2inCGWs7BtSqnr9rI2uGg=;
 b=025A5w0MdXHBnEpQbgLgK8CRMGYOtjdiLsQvMVxLLapaGgrbH2sJThew838IRtfS4/XiJtK9A4so33FDFqY5MPfUcydsUSsOdrQOOFRjxaGmgvrIW/epXkP0Pwbj2ORzYS739nT7ty99P3P+M0dvXgnCQw/uay3ZsnHn6c+sS6k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:08:16 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:16 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 30/44] drm/amdkfd: refine migration policy with xnack on
Date: Mon, 22 Mar 2021 06:58:46 -0400
Message-Id: <20210322105900.14068-31-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4b803d8-9aee-4a46-23e0-08d8ed22b8cb
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB48995B840122CF6C989AF78992659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVzZ9MhhQ2auXzUc7ltEqwV7JmD+Dj2nlYarSR9s+fX5OXKm7sGKxuS4rMv3yFL9p77XXRl9SLmbvlUMG9YbPtCK6I4qjOf0bhUpPHpubngXQlllqN8NaCZhRJCIJ0LACZL9rMkNuTUcYEdw7tJ6wIAoaYbMXFLKRxj5z7o16fRlj0C75K1DTttT1LcBc0YxPS3iabIgjfePc2UNZdKiM1OcjMkfxyzUdqlBoV5YzmgSQ+2+4HRQNNe4HIMuTcjvBIMWGigFfJJeCf7L4GyGkGY3VlYMd94QbmDe7kDjTqsGQweD+gxh0xryudV5kBpFO0yXP7MnniwHUYBX7EvYxEt13KJjVJHCygoHQulh71Q0SN1UPF0RCfLDdMUthKYl7ejybYewhtHQuCLXMcGbGJRw9zFgRrBIhjthh46nPEEJvmvpk3f9iZxXk2XEZL58Zfl9R+iQGu0RT8dfPtRcX+pzQJx60p1KAUx7mklA5zBp3DDZ2MGDbmDm2Fz6UrE+MDg842irpZOOuy+qZ45pf3MQqlh7Pm6t4BQEBer8YaGG+uS0fxBwUI0f8bxJK1BdThpi8py03T6Dw8O8tvKXXzGGzPZo22X9j8BxSV1iTZ7WaTWT47u5ggvLkB6aXiQxseY+Kotg5aQWAO457O5Arg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(30864003)(450100002)(316002)(2906002)(54906003)(7696005)(1076003)(52116002)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BkRCaJjpci661i5en4NDvBuFEiBFwArTzcZbIj8hKR9CkxRyuSEcUPsaM6dn?=
 =?us-ascii?Q?yZVrR2gbLlL8GvEWAP69mxN3z/AGI/y28QqZKR3bWr2GWHGCs3tjffCIezH4?=
 =?us-ascii?Q?TNy8hXlOtCfSVg2WvYMb30D8G7Z+oQFdyLJrJIF2Yrlec0DIaH2Y6JKtf0yL?=
 =?us-ascii?Q?SO73/ygJbkP/N009BvCypvqtprCQS30po7vzVTTmb0AQcKdLBeRNuyZanOKR?=
 =?us-ascii?Q?mCBM52zMDrEncP3tzNqG9WmvqmoV4G2CnX9aXr93ZliHzEZZ3Z2cduJneoCF?=
 =?us-ascii?Q?Jmksf9UIhk53hZD5bDoDewV2F+Bvi/JN+qxuHlUVzRS0AT2Z99GuYNuueOci?=
 =?us-ascii?Q?hBMQz49x9Dhy//JTVlt/UzAJ1JQekx9Xnr/IxEe3seyvJvI5nR2d6Ik+Hmsy?=
 =?us-ascii?Q?2z7kRvV6NqiJhSNJVmlha8FF75d8HA22dNHC45pVLQPEg12ax0OQExVahgPc?=
 =?us-ascii?Q?a6ZEDvUJXbkndC3+TSmIqY1xj8F7+vCfK3d/5EjFuAY94S0ciF8QAmwDJ632?=
 =?us-ascii?Q?AZ9w6vufvf2yIjfLcc5K2Kom2B+fKof/k5kxq0CosyTNCDdbcvxWXVSNFcmn?=
 =?us-ascii?Q?cP1u8UDmvOV5pwTBjstp0h3VEzaqJFO1VxQ2l24Yw7QzQumKXpvWc4pRZLK1?=
 =?us-ascii?Q?xLM6Oy8czAi5yN+w84OuFSL5Upx+5FCEE/XrQshnFOUs7F0fVE1nut1Ea5lG?=
 =?us-ascii?Q?5yh+WNrYks3YhUGgFBu0+0nLCrr8nZLbWIxPW72zWaUWW36U7Sod4m7IxrR1?=
 =?us-ascii?Q?aR8P2N7fc50ogbye91qAhdnEFuRYi5RN/Lr3OjKglHgzbvuqTICmKKRxSRao?=
 =?us-ascii?Q?KjsZSZvSHUC4kBYyGDb3+VM3sSVjoRlB16kpJsR//Hxu915BQYD0DxjeSkD1?=
 =?us-ascii?Q?cazNbjIS/xyjCdzdC0k9fSG/FxMJcPWRw9b0i/JDb/ulGkQgg8pBLuQxMWcr?=
 =?us-ascii?Q?3FleCs0CO9tmA+sEUGM8AP2I+P/00cNbSnxIdzsv5L2HRye6DPYHa99M7EQk?=
 =?us-ascii?Q?gq+QkFx+M354udrBEztPJUW7hRbpq54jCdQGpmrowpiQz6kenErLkdREVtW+?=
 =?us-ascii?Q?8TjaBPx3nLGA8tZMUtFAyS4nLScSvbN3zsal38OGiFm0Y0esKXbjzqawRAgA?=
 =?us-ascii?Q?zDe3mMJWhZEvQWFdSyIXZr40RyPXTNzjg++B8BZcqt/XVeyt+wQ3vT6ZI6kR?=
 =?us-ascii?Q?bxCSRDkt/NV8pdWlt1/88qjR1Gmz+7E+uIOZHngybvTSJkkkv1pIVa3aytQK?=
 =?us-ascii?Q?MBbEzqmR+wMByog41dS1vxI0l1cTx3awNZy4KcUnh4acybiFoQBom77I2ONv?=
 =?us-ascii?Q?3Lc0eU9S9rPdE3js8n2SaVqc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b803d8-9aee-4a46-23e0-08d8ed22b8cb
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:45.9639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/CJu6LwL7onaTin+Mb76PfTZmBaCouqI7Ydsx18kv6l5v8xd+VYlnE/umnJ80VBdjqzfN+lIBWsN9xLkleQxA==
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With xnack on, GPU vm fault handler decide the best restore location,
then migrate range to the best restore location and update GPU mapping
to recover the GPU vm fault.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |  16 +++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 150 ++++++++++++++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   1 +
 6 files changed, 157 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 8ce3ff56a0ce..cd89b38e3d9b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -455,18 +455,19 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
  * svm_migrate_ram_to_vram - migrate svm range from system to device
  * @prange: range structure
  * @best_loc: the device to migrate to
+ * @mm: the process mm structure
  *
  * Context: Process context, caller hold mmap read lock, svms lock, prange lock
  *
  * Return:
  * 0 - OK, otherwise error code
  */
-int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
+int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			    struct mm_struct *mm)
 {
 	unsigned long addr, start, end;
 	struct vm_area_struct *vma;
 	struct amdgpu_device *adev;
-	struct mm_struct *mm;
 	int r = 0;
 
 	if (prange->actual_loc == best_loc) {
@@ -487,8 +488,6 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
 	start = prange->start << PAGE_SHIFT;
 	end = (prange->last + 1) << PAGE_SHIFT;
 
-	mm = current->mm;
-
 	for (addr = start; addr < end;) {
 		unsigned long next;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 95fd7b21791f..9949b55d3b6a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -37,7 +37,8 @@ enum MIGRATION_COPY_DIR {
 	FROM_VRAM_TO_RAM
 };
 
-int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc);
+int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc,
+			    struct mm_struct *mm);
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 755c0517867d..2ccfdb218198 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -867,6 +867,9 @@ int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
 int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id);
 int kfd_process_device_from_gpuidx(struct kfd_process *p,
 					uint32_t gpu_idx, struct kfd_dev **gpu);
+int kfd_process_gpuid_from_kgd(struct kfd_process *p,
+			       struct amdgpu_device *adev, uint32_t *gpuid,
+			       uint32_t *gpuidx);
 void kfd_unref_process(struct kfd_process *p);
 int kfd_process_evict_queues(struct kfd_process *p);
 int kfd_process_restore_queues(struct kfd_process *p);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index c8479f6bd68c..48ea6f393353 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1684,6 +1684,22 @@ int kfd_process_device_from_gpuidx(struct kfd_process *p,
 	return -EINVAL;
 }
 
+int
+kfd_process_gpuid_from_kgd(struct kfd_process *p, struct amdgpu_device *adev,
+			   uint32_t *gpuid, uint32_t *gpuidx)
+{
+	struct kgd_dev *kgd = (struct kgd_dev *)adev;
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i] && p->pdds[i]->dev->kgd == kgd) {
+			*gpuid = p->pdds[i]->dev->id;
+			*gpuidx = i;
+			return 0;
+		}
+	return -EINVAL;
+}
+
 static void evict_process_worker(struct work_struct *work)
 {
 	int ret;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 3a7b842b362c..98c049dc3a63 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -179,8 +179,11 @@ static void svm_range_free_dma_mappings(struct svm_range *prange)
 	int r;
 
 	p = container_of(prange->svms, struct kfd_process, svms);
-	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
-		  MAX_GPU_INSTANCE);
+	if (p->xnack_enabled)
+		bitmap_copy(bitmap, prange->bitmap_aip, MAX_GPU_INSTANCE);
+	else
+		bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+			  MAX_GPU_INSTANCE);
 
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
 		dma_addr = prange->dma_addr[gpuidx];
@@ -1262,7 +1265,7 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	return r;
 }
 
-static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
+int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	struct kfd_process_device *pdd;
@@ -1279,9 +1282,29 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 	else
 		bo_adev = NULL;
 
-	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
-		  MAX_GPU_INSTANCE);
 	p = container_of(prange->svms, struct kfd_process, svms);
+	if (p->xnack_enabled) {
+		bitmap_copy(bitmap, prange->bitmap_aip, MAX_GPU_INSTANCE);
+
+		/* If prefetch range to GPU, or GPU retry fault migrate range to
+		 * GPU, which has ACCESS attribute to the range, create mapping
+		 * on that GPU.
+		 */
+		if (prange->actual_loc) {
+			gpuidx = kfd_process_gpuidx_from_gpuid(p,
+							prange->actual_loc);
+			if (gpuidx < 0) {
+				WARN_ONCE(1, "failed get device by id 0x%x\n",
+					 prange->actual_loc);
+				return -EINVAL;
+			}
+			if (test_bit(gpuidx, prange->bitmap_access))
+				bitmap_set(bitmap, gpuidx, 1);
+		}
+	} else {
+		bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+			  MAX_GPU_INSTANCE);
+	}
 
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
 		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
@@ -1995,15 +2018,76 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
 	return NULL;
 }
 
+/* svm_range_best_restore_location - decide the best fault restore location
+ * @prange: svm range structure
+ * @adev: the GPU on which vm fault happened
+ *
+ * This is only called when xnack is on, to decide the best location to restore
+ * the range mapping after GPU vm fault. Caller uses the best location to do
+ * migration if actual loc is not best location, then update GPU page table
+ * mapping to the best location.
+ *
+ * If vm fault gpu is range preferred loc, the best_loc is preferred loc.
+ * If vm fault gpu idx is on range ACCESSIBLE bitmap, best_loc is vm fault gpu
+ * If vm fault gpu idx is on range ACCESSIBLE_IN_PLACE bitmap, then
+ *    if range actual loc is cpu, best_loc is cpu
+ *    if vm fault gpu is on xgmi same hive of range actual loc gpu, best_loc is
+ *    range actual loc.
+ * Otherwise, GPU no access, best_loc is -1.
+ *
+ * Return:
+ * -1 means vm fault GPU no access
+ * 0 for CPU or GPU id
+ */
+static int32_t
+svm_range_best_restore_location(struct svm_range *prange,
+				struct amdgpu_device *adev)
+{
+	struct amdgpu_device *bo_adev;
+	struct kfd_process *p;
+	int32_t gpuidx;
+	uint32_t gpuid;
+	int r;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	r = kfd_process_gpuid_from_kgd(p, adev, &gpuid, &gpuidx);
+	if (r < 0) {
+		pr_debug("failed to get gpuid from kgd\n");
+		return -1;
+	}
+
+	if (prange->preferred_loc == gpuid)
+		return prange->preferred_loc;
+
+	if (test_bit(gpuidx, prange->bitmap_access))
+		return gpuid;
+
+	if (test_bit(gpuidx, prange->bitmap_aip)) {
+		if (!prange->actual_loc)
+			return 0;
+
+		bo_adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
+		if (amdgpu_xgmi_same_hive(adev, bo_adev))
+			return prange->actual_loc;
+		else
+			return 0;
+	}
+
+	return -1;
+}
+
 int
 svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 			uint64_t addr)
 {
-	int r = 0;
+	struct amdgpu_device *bo_adev;
 	struct mm_struct *mm = NULL;
-	struct svm_range *prange;
 	struct svm_range_list *svms;
+	struct svm_range *prange;
 	struct kfd_process *p;
+	int32_t best_loc;
+	int r = 0;
 
 	p = kfd_lookup_process_by_pasid(pasid);
 	if (!p) {
@@ -2036,21 +2120,50 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 
 	mutex_lock(&prange->migrate_mutex);
 
+	best_loc = svm_range_best_restore_location(prange, adev);
+	if (best_loc == -1) {
+		pr_debug("svms %p failed get best restore loc [0x%lx 0x%lx]\n",
+			 svms, prange->start, prange->last);
+		r = -EACCES;
+		goto out_unlock_range;
+	}
+
+	pr_debug("svms %p [0x%lx 0x%lx] best restore 0x%x, actual loc 0x%x\n",
+		 svms, prange->start, prange->last, best_loc,
+		 prange->actual_loc);
+
+	if (prange->actual_loc != best_loc) {
+		if (best_loc)
+			r = svm_migrate_ram_to_vram(prange, best_loc, mm);
+		else
+			r = svm_migrate_vram_to_ram(prange, mm);
+		if (r) {
+			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
+				 r, svms, prange->start, prange->last);
+			goto out_unlock_range;
+		}
+	}
+
 	r = svm_range_validate(mm, prange);
 	if (r) {
-		pr_debug("failed %d to validate svms 0x%p [0x%lx 0x%lx]\n", r,
+		pr_debug("failed %d to validate svms %p [0x%lx 0x%lx]\n", r,
 			 svms, prange->start, prange->last);
-
 		goto out_unlock_range;
 	}
 
-	pr_debug("restoring svms 0x%p [0x%lx %lx] mapping\n",
-		 svms, prange->start, prange->last);
+	if (prange->svm_bo && prange->ttm_res)
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+	else
+		bo_adev = NULL;
+
+	pr_debug("restoring svms 0x%p [0x%lx %lx] mapping, bo_adev is %s\n",
+		 svms, prange->start, prange->last,
+		 bo_adev ? "not NULL" : "NULL");
 
 	r = svm_range_map_to_gpus(prange, true);
 	if (r)
-		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpu\n", r,
-			 svms, prange->start, prange->last);
+		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpus\n",
+			 r, svms, prange->start, prange->last);
 
 out_unlock_range:
 	mutex_unlock(&prange->migrate_mutex);
@@ -2184,7 +2297,7 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 	return 0;
 }
 
-/* svm_range_best_location - decide the best actual location
+/* svm_range_best_prefetch_location - decide the best prefetch location
  * @prange: svm range structure
  *
  * For xnack off:
@@ -2206,7 +2319,8 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
  * Return:
  * 0 for CPU or GPU id
  */
-static uint32_t svm_range_best_location(struct svm_range *prange)
+static uint32_t
+svm_range_best_prefetch_location(struct svm_range *prange)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	uint32_t best_loc = prange->prefetch_loc;
@@ -2283,7 +2397,7 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	int r = 0;
 
 	*migrated = false;
-	best_loc = svm_range_best_location(prange);
+	best_loc = svm_range_best_prefetch_location(prange);
 
 	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
 	    best_loc == prange->actual_loc)
@@ -2304,10 +2418,10 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 		}
 
 		pr_debug("migrate from ram to vram\n");
-		r = svm_migrate_ram_to_vram(prange, best_loc);
+		r = svm_migrate_ram_to_vram(prange, best_loc, mm);
 	} else {
 		pr_debug("migrate from vram to ram\n");
-		r = svm_migrate_vram_to_ram(prange, current->mm);
+		r = svm_migrate_vram_to_ram(prange, mm);
 	}
 
 	if (!r)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index f8e282ec9d8a..fed28e487878 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -166,6 +166,7 @@ int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 int svm_range_restore_pages(struct amdgpu_device *adev,
 			    unsigned int pasid, uint64_t addr);
 int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence);
+int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm);
 void svm_range_add_list_work(struct svm_range_list *svms,
 			     struct svm_range *prange, struct mm_struct *mm,
 			     enum svm_work_list_ops op);
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
