Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48888357851
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 01:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD706E9B3;
	Wed,  7 Apr 2021 23:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FB76E9AE;
 Wed,  7 Apr 2021 23:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnJZpbECu7iBcAub4lTKx6XjfzTWGvWpP2El7L5hrucR4Qk88ufh99jSwfdm2xtmS+8u9kcpyM/nVK9N98skCCoYFXB7uCHb2/ppE3cWiF9nMxdwGGD5ZPcLyj++hG2xZvb2uwt903SscTBpqRlP/7+Of1wMDlYEgN7aGSYlV7wLaTy4BOXzeodHN66kxPqnikJxWpXiJAB8GMkUqOqjKQi/xmJL/MWGjtIRmjYXfLLIN+Ki1L4EkzvSE2zdmV60LeEhvs6oSRvHu0aFJu2CQO45IMaoQhM4WhaDjU3+v5T085vsC+M6hGhp38WNFz8wcgO66ch44sJ7Xrw0xUtujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otwCauVhtQ0DzDt2JV6j39P7uomxRJ8PRz2KzjwdLTo=;
 b=KqUKxpI7l/8bzmvNZycrdHon23kJBUlF1huyMPJGOJzycGWwInSNGIP+mFMhU3MpJpObkpCQJnGkxGa4G52fzETVE9JUGei/rTmOURUpDSRRxMEVY692+0TgXkrlEdt7CC4tMOzy/eXofZcM9C6xWWDLMUAer+VmaLhSb8nlOrgSILHKb32zVb9+Q+MIvJvYZxRcR0GfA6Bx6Z3gqBRAWxTo28yZXW+8/NZavVWk0nmLRTBrUFfLiN6ZHMgQinnJrlHFrxYk3MfW2U2Bplr0VqOHavzk+0IydbD0q7DZLqc0FwTgTw5emtRurGLZYk15R275CobfCTkTGL4WopKGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otwCauVhtQ0DzDt2JV6j39P7uomxRJ8PRz2KzjwdLTo=;
 b=BUsyAO1Fs2Sev/nK9EQ1Ukq2Xd03Um8Bk0GkQL6VRDKi5658Af83wKR8GoU9JNurjiQx8tIOjuMr69EATKW/fz8LqTB6Gl63bO0syAOq7hPtjd+3zrU82zErx7PJ8LX3qeYPHY+tVPzwwRCbNratK8A2zxA0pEBHp1VFge83VEk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 23:13:37 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Wed, 7 Apr 2021
 23:13:37 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdkfd: Use drm_priv to pass VM from KFD to amdgpu
Date: Wed,  7 Apr 2021 19:12:57 -0400
Message-Id: <20210407231259.1787-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407231259.1787-1-Felix.Kuehling@amd.com>
References: <20210407231259.1787-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Wed, 7 Apr 2021 23:13:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5232fa61-6bf6-43bf-06fb-08d8fa1ac622
X-MS-TrafficTypeDiagnostic: MN2PR12MB4392:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB439239F446B8241CF9D9A1E092759@MN2PR12MB4392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBh/3x8JKilIf4+6V6wJZyEnC1JT7gBfI+athsxW+jzuVQGd5/fUjbip6JkHJmpFavdEN3D5HfbB1WpCeB2bT6UDtubCuuXskM2bSBFWd9FAmcu6dt7wDBJhwqi/I9DyL6pzOawZdublgJVNXTH60F4gPNVc9Bhpu6e5RKWKjjYEIKygSjk4kWqlit2VOpgWVgOv1qu2L/qIFrPtNV77LkR7yR9gSGK+EVc+zQlalbqfNRNO2um6fb/29Ztjo9iG7czM3c/NdS0SpVjX5OcrMpUgV9/9kIK+aW69rNC5hHnr4Fh16ebZmUrkkwKLYKXvNTI6tDaBZqdTv46K+OCRFSRC5oYKL+Nojz5/FIinHQyG3U/tg4ZyO0niBO1HDKRPUMw/vuNkajp1Lw8lRKyJItZ7AORWKSf8MWT70bC0aL+zjSR5Ol0w9piNjZbDAtdTaKftsusf7Hw8GELm3Yu4QRv92hPQR3rfBAxtqSqpFrZNF182aA5EBB3hZu3f7I0sv11jksP4w7/Ucz1NFoiPgB7+iIrR9VHORfZfgyl8Iz/22pC5OsTvvTBrAr7OOb8UOJl3TvRGzKokeQBaT6ri55GakuyeRtLxqGAIx/QhAOfTDyJKllsReYXKspuO0XBcH3N3PaEU8eBhYhToVsZpIrZofD3c40Yct4dGVJ/iQj/ckZiyjwr6l9YNRkxnI+p5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(66556008)(66946007)(316002)(16526019)(86362001)(186003)(52116002)(83380400001)(26005)(66476007)(1076003)(478600001)(7696005)(5660300002)(6666004)(2616005)(38100700001)(2906002)(36756003)(8936002)(8676002)(956004)(38350700001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AuYwOVBfObcZw8FcUNTC27zGXHygkm6xbB21q0lR5ayaMYD5KJXCRVOlEkJc?=
 =?us-ascii?Q?HPa4MMjbT2Tp2kKFDx1CQNEZqrwzfmBzGuj5+RRU+SRFkxqgZYEc6gsbiWrh?=
 =?us-ascii?Q?Vri1+ENzaI6gIWXwHSNFnIAbo5tgMeIagxHC45LvUoaJLZfgDaDxVTP0Bb12?=
 =?us-ascii?Q?IP6x0VLtL7Xfx82a0uxa7b/760yPRIrcDTZI9tSIKamWisHxRDmUOIElcMwi?=
 =?us-ascii?Q?ym/0LVphrobo5xslBHxvmSdyszPs8D3Qpit4c5lGmhlZaotgNrq0u/tCy7lK?=
 =?us-ascii?Q?98C5X92IJhC3Xxd7CaoqLrhoLN68O4AZp3TAaOI9yTVzUfyRn2W0NL0r7Db8?=
 =?us-ascii?Q?RzTCLAfFE7SBdHlx1kTrY7Z9f6fPqZ8X7ssxybYddiX/sVwAQkwJSJrihrN4?=
 =?us-ascii?Q?VkivBPS6s6AOjDN+awet15Lvor5oemFzD+Xw3ju5c9XTizCXkBC8VY2kE4le?=
 =?us-ascii?Q?OAmzgoGgEaoKFgR6fRpGJXj/y2+9jDi+dJA+M56YOn09KCQpp1k6EvR2npnm?=
 =?us-ascii?Q?VXffJzThRXigt8edjjeDxubQ4WNSPAMI3oXH8grM+72ghurFFS57RgecWBLK?=
 =?us-ascii?Q?6QvAz/GozqSd6ZXiN0/+4g5Sk+RRtCWSVg2MSZP7nNIrBnQwVaZjWBys1On8?=
 =?us-ascii?Q?LJOBSObNh5LaIg0DtoE7p+yuHPjj+GP083Sc5Yjp24lmjXMV3hFPgR1fJ/NA?=
 =?us-ascii?Q?CV66qHTTFG5Ob91xEPeEH6xlWhDicsljPnDzIKvRkCYpOOQhUGuwJwcSW2xx?=
 =?us-ascii?Q?xBShSbJJs9aVFFroe5967RJlrreYfR618xg54yv95YLPO6Rhf+d4W8kSDy4S?=
 =?us-ascii?Q?eLgyBAc9t38W5QRpGeuRy7n2cC6B+kAnFeRHtY7AG1yoF7RuDcjMafB/+hKI?=
 =?us-ascii?Q?clvamRYKIcXHduQCjo0esMrfygg5IAryNhsAcKSXLyEpteVo3Pmrf/8V0zjd?=
 =?us-ascii?Q?/OJPxbxnZDd6O6oSfq49sJTAX3nDyYO9TaRn56qo7SJkJUcpH7WyYiqx+oJZ?=
 =?us-ascii?Q?/X9exU8q1mtjkZvTUv3EN86Sp2EK9cyxjU2h4IIBa9d16U/UdFUyMCspkQg9?=
 =?us-ascii?Q?ML/9DUxNZwOrm6gHvUxqvQ+wqQPkxc16mq9FeS/cRbWlcY6n+rIJdlNlJsnY?=
 =?us-ascii?Q?wzEFsmlBbOZGfFmQlUvgVi6WPwSEtRoIo3A0h5/2heF6e+6IylXLmbyBRRqz?=
 =?us-ascii?Q?3PVYl3IAXv4ZbY82V1T5/VcwD0o2uhs2qTDnY1h6MOOhaRVLSrtaHLD4sScU?=
 =?us-ascii?Q?yGfNszguQMjaWkuX2HgjFFf4Q86Gz3AWup0L9gb630nBnwEwoqmUCU3X7xIA?=
 =?us-ascii?Q?C4VrAnTvDHlGyGvxAgkz6I+R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5232fa61-6bf6-43bf-06fb-08d8fa1ac622
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 23:13:37.8394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7txgQU4WgjNtNl2xph25JbdzFDpBs1WHRv+66VYLnDGRCxgveU4dUSu9HhUIjJ6qXuLuWMcBIPGL2eVa679cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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
Cc: christian.koenig@amd.com, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu needs the drm_priv to allow mmap
to access the BO through the corresponding file descriptor.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    | 14 ++--
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 69 +++++++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 +-
 3 files changed, 50 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 5ffb07b02810..0d59bebd92af 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -236,20 +236,20 @@ uint8_t amdgpu_amdkfd_get_xgmi_hops_count(struct kgd_dev *dst, struct kgd_dev *s
 /* GPUVM API */
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					struct file *filp, u32 pasid,
-					void **vm, void **process_info,
+					void **process_info,
 					struct dma_fence **ef);
-void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm);
-uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm);
+void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *drm_priv);
+uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct kgd_dev *kgd, uint64_t va, uint64_t size,
-		void *vm, struct kgd_mem **mem,
+		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct kgd_dev *kgd, struct kgd_mem *mem, uint64_t *size);
 int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm);
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv);
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm);
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv);
 int amdgpu_amdkfd_gpuvm_sync_memory(
 		struct kgd_dev *kgd, struct kgd_mem *mem, bool intr);
 int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct kgd_dev *kgd,
@@ -260,7 +260,7 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct kgd_dev *kgd,
 					      struct kfd_vm_fault_info *info);
 int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 				      struct dma_buf *dmabuf,
-				      uint64_t va, void *vm,
+				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset);
 int amdgpu_amdkfd_get_tile_config(struct kgd_dev *kgd,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 36012229ccc1..95442bcd60fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -951,6 +951,13 @@ static int process_update_pds(struct amdkfd_process_info *process_info,
 	return 0;
 }
 
+static struct amdgpu_vm *drm_priv_to_vm(struct drm_file *drm_priv)
+{
+	struct amdgpu_fpriv *fpriv = drm_priv->driver_priv;
+
+	return &fpriv->vm;
+}
+
 static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 		       struct dma_fence **ef)
 {
@@ -1039,15 +1046,19 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					   struct file *filp, u32 pasid,
-					   void **vm, void **process_info,
+					   void **process_info,
 					   struct dma_fence **ef)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct drm_file *drm_priv = filp->private_data;
-	struct amdgpu_fpriv *drv_priv = drm_priv->driver_priv;
-	struct amdgpu_vm *avm = &drv_priv->vm;
+	struct amdgpu_fpriv *drv_priv;
+	struct amdgpu_vm *avm;
 	int ret;
 
+	ret = amdgpu_file_to_fpriv(filp, &drv_priv);
+	if (ret)
+		return ret;
+	avm = &drv_priv->vm;
+
 	/* Already a compute VM? */
 	if (avm->process_info)
 		return -EINVAL;
@@ -1062,7 +1073,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 	if (ret)
 		return ret;
 
-	*vm = (void *)avm;
+	amdgpu_vm_set_task_info(avm);
 
 	return 0;
 }
@@ -1103,15 +1114,17 @@ void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
 	}
 }
 
-void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
+void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *drm_priv)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm;
 
-	if (WARN_ON(!kgd || !vm))
+	if (WARN_ON(!kgd || !drm_priv))
 		return;
 
-	pr_debug("Releasing process vm %p\n", vm);
+	avm = drm_priv_to_vm(drm_priv);
+
+	pr_debug("Releasing process vm %p\n", avm);
 
 	/* The original pasid of amdgpu vm has already been
 	 * released during making a amdgpu vm to a compute vm
@@ -1122,9 +1135,9 @@ void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
 	amdgpu_vm_release_compute(adev, avm);
 }
 
-uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm)
+uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv)
 {
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct amdgpu_bo *pd = avm->root.base.bo;
 	struct amdgpu_device *adev = amdgpu_ttm_adev(pd->tbo.bdev);
 
@@ -1135,11 +1148,11 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm)
 
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct kgd_dev *kgd, uint64_t va, uint64_t size,
-		void *vm, struct kgd_mem **mem,
+		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	enum ttm_bo_type bo_type = ttm_bo_type_device;
 	struct sg_table *sg = NULL;
 	uint64_t user_addr = 0;
@@ -1350,10 +1363,10 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 }
 
 int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm)
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	int ret;
 	struct amdgpu_bo *bo;
 	uint32_t domain;
@@ -1394,9 +1407,9 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	pr_debug("Map VA 0x%llx - 0x%llx to vm %p domain %s\n",
 			mem->va,
 			mem->va + bo_size * (1 + mem->aql_queue),
-			vm, domain_string(domain));
+			avm, domain_string(domain));
 
-	ret = reserve_bo_and_vm(mem, vm, &ctx);
+	ret = reserve_bo_and_vm(mem, avm, &ctx);
 	if (unlikely(ret))
 		goto out;
 
@@ -1440,7 +1453,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	}
 
 	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
-		if (entry->bo_va->base.vm == vm && !entry->is_mapped) {
+		if (entry->bo_va->base.vm == avm && !entry->is_mapped) {
 			pr_debug("\t map VA 0x%llx - 0x%llx in entry %p\n",
 					entry->va, entry->va + bo_size,
 					entry);
@@ -1452,7 +1465,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 				goto map_bo_to_gpuvm_failed;
 			}
 
-			ret = vm_update_pds(vm, ctx.sync);
+			ret = vm_update_pds(avm, ctx.sync);
 			if (ret) {
 				pr_err("Failed to update page directories\n");
 				goto map_bo_to_gpuvm_failed;
@@ -1488,11 +1501,11 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 }
 
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm)
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdkfd_process_info *process_info =
-		((struct amdgpu_vm *)vm)->process_info;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
+	struct amdkfd_process_info *process_info = avm->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
 	struct kfd_bo_va_list *entry;
 	struct bo_vm_reservation_context ctx;
@@ -1500,7 +1513,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 
 	mutex_lock(&mem->lock);
 
-	ret = reserve_bo_and_cond_vms(mem, vm, BO_VM_MAPPED, &ctx);
+	ret = reserve_bo_and_cond_vms(mem, avm, BO_VM_MAPPED, &ctx);
 	if (unlikely(ret))
 		goto out;
 	/* If no VMs were reserved, it means the BO wasn't actually mapped */
@@ -1509,17 +1522,17 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		goto unreserve_out;
 	}
 
-	ret = vm_validate_pt_pd_bos((struct amdgpu_vm *)vm);
+	ret = vm_validate_pt_pd_bos(avm);
 	if (unlikely(ret))
 		goto unreserve_out;
 
 	pr_debug("Unmap VA 0x%llx - 0x%llx from vm %p\n",
 		mem->va,
 		mem->va + bo_size * (1 + mem->aql_queue),
-		vm);
+		avm);
 
 	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
-		if (entry->bo_va->base.vm == vm && entry->is_mapped) {
+		if (entry->bo_va->base.vm == avm && entry->is_mapped) {
 			pr_debug("\t unmap VA 0x%llx - 0x%llx from entry %p\n",
 					entry->va,
 					entry->va + bo_size,
@@ -1645,14 +1658,14 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct kgd_dev *kgd,
 
 int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 				      struct dma_buf *dma_buf,
-				      uint64_t va, void *vm,
+				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct drm_gem_object *obj;
 	struct amdgpu_bo *bo;
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
 
 	if (dma_buf->ops != &amdgpu_dmabuf_ops)
 		/* Can't handle non-graphics buffers */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d97e330a5022..bad0ecd6ef87 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1383,13 +1383,12 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 
 	ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(
 		dev->kgd, drm_file, p->pasid,
-		&pdd->vm, &p->kgd_process_info, &p->ef);
+		&p->kgd_process_info, &p->ef);
 	if (ret) {
 		pr_err("Failed to create process VM object\n");
 		return ret;
 	}
-
-	amdgpu_vm_set_task_info(pdd->vm);
+	pdd->vm = drm_file->private_data;
 
 	ret = kfd_process_device_reserve_ib_mem(pdd);
 	if (ret)
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
