Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A5A47DC1F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DCB10E181;
	Thu, 23 Dec 2021 00:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF1810E154;
 Thu, 23 Dec 2021 00:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxXI/1n9sa7jDXX9SZCl9ju57FEs+iOhtyX2gIpOSyygZRKIpKlst2VcqJk/0JGsbUfXBAEWwk63mQ7mtc3ojgsRtEHuDS4pZ+bIyeQ/UzHLlT1Chd+LB1H3YFsn5znJy6IHSfh0HfYBBeu3pzluoTcc8n61AlUzpb+MGHoJNxmTmiXXzyCvABm03EowuTlrOYMytqinNnTTQOhUL8pHv40xtaaa7zTBx2jMPvzYCw5T/dIvztJ9gebyl/tWN5ItNvpJpZ8Cz7WunlCJX+QoA3X7/3BqlINVVro5bof8GcTt2OCgFFcOZ6d0Oe7MPr3Xpc75S6qQZEf5CKwrNkgjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8WHLZu6gjfDma2CyBUUQbBAp8AnRfTyg582u/6e5D0=;
 b=HJusXnaiCpIYvhKsqb1Mbu9ANn+kGyHPOaPxOfhlOXBZTXuzGxaOypEvX4CY4KgZgoDapMnCt2qktbBpbMTTEN5cJfzhXDNyas7+R723W/S2WnmJMDqTUcXJk+wGinDJr5RwuRi6qw0DHXzdcID9NFxbFiYxlGk/OT9PP/gkwUjKl73HzolXQxh59kTFi1OAigBH8H60e2A83vGEsxWYiHbSSqTRwGjwr52ag+BH56AtuH3Xu9ZgxTtCOfnxrOoicWxeRrnjqe88TFycgHvgBn4Quc6nJ9odFEo1vyUQJEuBPi7QkiA1cu+5A6bQJFwguPvdMmfG8nYkrWFF+A1F7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8WHLZu6gjfDma2CyBUUQbBAp8AnRfTyg582u/6e5D0=;
 b=FA6f15h2djOG1fcfIGD35JZQpNfDD7I42P1BxWZKg7WAViSVZuci4UY98wQGiHaF5DuwSaKEykGeIL13xG992oWO7Keh+KTxV5JVi4POnPNXuBcnpvZk4v/6pd3nexdQWhb8RamN21wlyToxRmzkt7P8LIhpvKVasFfrlSodF9s=
Received: from BN0PR04CA0041.namprd04.prod.outlook.com (2603:10b6:408:e8::16)
 by DM6PR12MB3802.namprd12.prod.outlook.com (2603:10b6:5:1c5::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Thu, 23 Dec
 2021 00:37:29 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::32) by BN0PR04CA0041.outlook.office365.com
 (2603:10b6:408:e8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:29 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:28 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 07/24] drm/amdkfd: CRIU Implement KFD resume ioctl
Date: Wed, 22 Dec 2021 19:36:54 -0500
Message-ID: <20211223003711.13064-8-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8d60c6e-d273-4ccb-13f4-08d9c5ac6682
X-MS-TrafficTypeDiagnostic: DM6PR12MB3802:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB38025DCBBB662C71F1546A30FE7E9@DM6PR12MB3802.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E587o//wxafkGogs6YLBDmlqXLlhw9xjO9uoyVVF858wweGp1CPtQSb1g1oy7VzeG9Xlz0USLRilGDBdfFLjPdY33R6JQ2f+9lFsDizfZQuxy/xCHowpuSOLb4ZxhE9xlN6Mr7ev5h5VIwhs5k+2fcObmw2L95QAHacKZg73Aa3pLLB+UAFupQqVQtwdTSR9yojkS5N9jfHY1QQik/f9Uk6fTdtf8jBQ6wdyFWftnDul7VvAYuDlT3sEEGg1n1oChNPj2yD1PRI0MRi0l1ebRMyKRivYvJ+YVI2KTCkwI1gwivM3NbByzwHCl3WwmYs/V0qtGC4LYPK9P8xT/XslqyLNQsgJFbEPFxcabNN8lIZEjLLcOnKwD+oZVH3nE5aVsV3T3r3CQbHY6ErAuihCkeEh6C7o7JAiNqHEzSPjHoReLVtxK6oMaB3yE74Qy5IpF7H/UL5C+XkCVwOw0qD2IcwdZiW7n5p4xS6pCd345XiKEUAe6LNZgAt9HphPEeleuPJm63YFlozMqI1BVuS1DddKuX0cSkZjbHXWUdeSmVxMHq9FYZle0DsMewPu7sGgoeAIbnZKjNk8WpgRsl4cr/X+wsKeyeDbcFuXLzXVh1SSbFFMHAZqZ05hdoGD5feYqeBqL1Q5e5Q7m7yWLgdrStPYWvSczBBlHWvCTaadXBnU10n2vPuaaRkJfQaPvsOJ1DcsiG6ZSwuLMucbZrlJEHvhnyhGcsiSwOBQ1mxB+8yob9SNpuILCB6scu2sjh3AYUZTVIJ7N/VaRGPVYOyHqPdtqnUOb9t6pm6YF+3bbKs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(356005)(30864003)(36860700001)(110136005)(7696005)(2906002)(70586007)(336012)(54906003)(426003)(316002)(81166007)(70206006)(86362001)(16526019)(8676002)(44832011)(26005)(47076005)(36756003)(2616005)(508600001)(83380400001)(1076003)(5660300002)(40460700001)(82310400004)(8936002)(186003)(6666004)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:29.4014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d60c6e-d273-4ccb-13f4-08d9c5ac6682
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3802
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support to create userptr BOs on restore and introduces a new
ioctl to restart memory notifiers for the restored userptr BOs.
When doing CRIU restore MMU notifications can happen anytime after we call
amdgpu_mn_register. Prevent MMU notifications until we reach stage-4 of the
restore process i.e. criu_resume ioctl is received, and the process is
ready to be resumed. This ioctl is different from other KFD CRIU ioctls
since its called by CRIU master restore process for all the target
processes being resumed by CRIU.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 51 +++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 44 ++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 35 +++++++++++--
 5 files changed, 123 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index fcbc8a9c9e06..5c5fc839f701 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -131,6 +131,7 @@ struct amdkfd_process_info {
 	atomic_t evicted_bos;
 	struct delayed_work restore_userptr_work;
 	struct pid *pid;
+	bool block_mmu_notifications;
 };
 
 int amdgpu_amdkfd_init(void);
@@ -269,7 +270,7 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct amdgpu_device *adev, uint64_t va, uint64_t size,
 		void *drm_priv, struct kgd_mem **mem,
-		uint64_t *offset, uint32_t flags);
+		uint64_t *offset, uint32_t flags, bool criu_resume);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv,
 		uint64_t *size);
@@ -297,6 +298,9 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 				struct tile_config *config);
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev);
+void amdgpu_amdkfd_block_mmu_notifications(void *p);
+int amdgpu_amdkfd_criu_resume(void *p);
+
 #if IS_ENABLED(CONFIG_HSA_AMD)
 void amdgpu_amdkfd_gpuvm_init_mem_limits(void);
 void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 90b985436878..5679fb75ec88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -846,7 +846,8 @@ static void remove_kgd_mem_from_kfd_bo_list(struct kgd_mem *mem,
  *
  * Returns 0 for success, negative errno for errors.
  */
-static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
+static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
+			   bool criu_resume)
 {
 	struct amdkfd_process_info *process_info = mem->process_info;
 	struct amdgpu_bo *bo = mem->bo;
@@ -868,6 +869,17 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
 		goto out;
 	}
 
+	if (criu_resume) {
+		/*
+		 * During a CRIU restore operation, the userptr buffer objects
+		 * will be validated in the restore_userptr_work worker at a
+		 * later stage when it is scheduled by another ioctl called by
+		 * CRIU master process for the target pid for restore.
+		 */
+		atomic_inc(&mem->invalid);
+		mutex_unlock(&process_info->lock);
+		return 0;
+	}
 	ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
 	if (ret) {
 		pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
@@ -1240,6 +1252,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 		INIT_DELAYED_WORK(&info->restore_userptr_work,
 				  amdgpu_amdkfd_restore_userptr_worker);
 
+		info->block_mmu_notifications = false;
 		*process_info = info;
 		*ef = dma_fence_get(&info->eviction_fence->base);
 	}
@@ -1456,10 +1469,37 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv)
 	return avm->pd_phys_addr;
 }
 
+void amdgpu_amdkfd_block_mmu_notifications(void *p)
+{
+	struct amdkfd_process_info *pinfo = (struct amdkfd_process_info *)p;
+
+	pinfo->block_mmu_notifications = true;
+}
+
+int amdgpu_amdkfd_criu_resume(void *p)
+{
+	int ret = 0;
+	struct amdkfd_process_info *pinfo = (struct amdkfd_process_info *)p;
+
+	mutex_lock(&pinfo->lock);
+	pr_debug("scheduling work\n");
+	atomic_inc(&pinfo->evicted_bos);
+	if (!pinfo->block_mmu_notifications) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	pinfo->block_mmu_notifications = false;
+	schedule_delayed_work(&pinfo->restore_userptr_work, 0);
+
+out_unlock:
+	mutex_unlock(&pinfo->lock);
+	return ret;
+}
+
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct amdgpu_device *adev, uint64_t va, uint64_t size,
 		void *drm_priv, struct kgd_mem **mem,
-		uint64_t *offset, uint32_t flags)
+		uint64_t *offset, uint32_t flags, bool criu_resume)
 {
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	enum ttm_bo_type bo_type = ttm_bo_type_device;
@@ -1562,7 +1602,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	add_kgd_mem_to_kfd_bo_list(*mem, avm->process_info, user_addr);
 
 	if (user_addr) {
-		ret = init_user_pages(*mem, user_addr);
+		pr_debug("creating userptr BO for user_addr = %llu\n", user_addr);
+		ret = init_user_pages(*mem, user_addr, criu_resume);
 		if (ret)
 			goto allocate_init_user_pages_failed;
 	}
@@ -2072,6 +2113,10 @@ int amdgpu_amdkfd_evict_userptr(struct kgd_mem *mem,
 	int evicted_bos;
 	int r = 0;
 
+	/* Do not process MMU notifications until stage-4 IOCTL is received */
+	if (process_info->block_mmu_notifications)
+		return 0;
+
 	atomic_inc(&mem->invalid);
 	evicted_bos = atomic_inc_return(&process_info->evicted_bos);
 	if (evicted_bos == 1) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index c93f74ad073f..87b9f019e96e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1325,7 +1325,7 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		dev->adev, args->va_addr, args->size,
 		pdd->drm_priv, (struct kgd_mem **) &mem, &offset,
-		flags);
+		flags, false);
 
 	if (err)
 		goto err_unlock;
@@ -2107,6 +2107,7 @@ static int criu_restore_bos(struct kfd_process *p,
 {
 	struct kfd_criu_bo_bucket *bo_buckets;
 	struct kfd_criu_bo_priv_data *bo_privs;
+	const bool criu_resume = true;
 	bool flush_tlbs = false;
 	int ret = 0, j = 0;
 	uint32_t i;
@@ -2114,6 +2115,9 @@ static int criu_restore_bos(struct kfd_process *p,
 	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
 		return -EINVAL;
 
+	/* Prevent MMU notifications until stage-4 IOCTL (CRIU_RESUME) is received */
+	amdgpu_amdkfd_block_mmu_notifications(p->kgd_process_info);
+
 	bo_buckets = kvmalloc_array(args->num_bos, sizeof(*bo_buckets), GFP_KERNEL);
 	if (!bo_buckets)
 		return -ENOMEM;
@@ -2203,6 +2207,7 @@ static int criu_restore_bos(struct kfd_process *p,
 			offset = bo_priv->user_addr;
 		}
 
+
 		/* Create the BO */
 		ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(dev->adev,
 						bo_bucket->addr,
@@ -2210,7 +2215,8 @@ static int criu_restore_bos(struct kfd_process *p,
 						pdd->drm_priv,
 						(struct kgd_mem **) &mem,
 						&offset,
-						bo_bucket->alloc_flags);
+						bo_bucket->alloc_flags,
+						criu_resume);
 		if (ret) {
 			pr_err("Could not create the BO\n");
 			ret = -ENOMEM;
@@ -2228,8 +2234,8 @@ static int criu_restore_bos(struct kfd_process *p,
 			pr_err("Could not allocate idr\n");
 			amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev,
 						(struct kgd_mem *)mem,
-						pdd->drm_priv, NULL);
-
+						pdd->drm_priv,
+						NULL);
 			ret = -ENOMEM;
 			goto exit;
 		}
@@ -2383,7 +2389,35 @@ static int criu_resume(struct file *filep,
 			struct kfd_process *p,
 			struct kfd_ioctl_criu_args *args)
 {
-	return 0;
+	struct kfd_process *target = NULL;
+	struct pid *pid = NULL;
+	int ret = 0;
+
+	pr_debug("Inside %s, target pid for criu restore: %d\n", __func__,
+		 args->pid);
+
+	pid = find_get_pid(args->pid);
+	if (!pid) {
+		pr_err("Cannot find pid info for %i\n", args->pid);
+		return -ESRCH;
+	}
+
+	pr_debug("calling kfd_lookup_process_by_pid\n");
+	target = kfd_lookup_process_by_pid(pid);
+
+	put_pid(pid);
+
+	if (!target) {
+		pr_debug("Cannot find process info for %i\n", args->pid);
+		return -ESRCH;
+	}
+
+	mutex_lock(&target->mutex);
+	ret =  amdgpu_amdkfd_criu_resume(target->kgd_process_info);
+	mutex_unlock(&target->mutex);
+
+	kfd_unref_process(target);
+	return ret;
 }
 
 static int criu_process_info(struct file *filep,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index e611366fbc34..cd72541a8f4f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -949,6 +949,7 @@ void *kfd_process_device_translate_handle(struct kfd_process_device *p,
 					int handle);
 void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
 					int handle);
+struct kfd_process *kfd_lookup_process_by_pid(struct pid *pid);
 
 bool kfd_has_process_device_data(struct kfd_process *p);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index f77d556ca0fc..d2fcdc5e581f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -64,7 +64,8 @@ static struct workqueue_struct *kfd_process_wq;
  */
 static struct workqueue_struct *kfd_restore_wq;
 
-static struct kfd_process *find_process(const struct task_struct *thread);
+static struct kfd_process *find_process(const struct task_struct *thread,
+					bool ref);
 static void kfd_process_ref_release(struct kref *ref);
 static struct kfd_process *create_process(const struct task_struct *thread);
 static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep);
@@ -715,7 +716,7 @@ static int kfd_process_alloc_gpuvm(struct kfd_process_device *pdd,
 	int err;
 
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(kdev->adev, gpu_va, size,
-						 pdd->drm_priv, mem, NULL, flags);
+						 pdd->drm_priv, mem, NULL, flags, false);
 	if (err)
 		goto err_alloc_mem;
 
@@ -816,7 +817,7 @@ struct kfd_process *kfd_create_process(struct file *filep)
 	mutex_lock(&kfd_processes_mutex);
 
 	/* A prior open of /dev/kfd could have already created the process. */
-	process = find_process(thread);
+	process = find_process(thread, false);
 	if (process) {
 		pr_debug("Process already found\n");
 	} else {
@@ -884,7 +885,7 @@ struct kfd_process *kfd_get_process(const struct task_struct *thread)
 	if (thread->group_leader->mm != thread->mm)
 		return ERR_PTR(-EINVAL);
 
-	process = find_process(thread);
+	process = find_process(thread, false);
 	if (!process)
 		return ERR_PTR(-EINVAL);
 
@@ -903,13 +904,16 @@ static struct kfd_process *find_process_by_mm(const struct mm_struct *mm)
 	return NULL;
 }
 
-static struct kfd_process *find_process(const struct task_struct *thread)
+static struct kfd_process *find_process(const struct task_struct *thread,
+					bool ref)
 {
 	struct kfd_process *p;
 	int idx;
 
 	idx = srcu_read_lock(&kfd_processes_srcu);
 	p = find_process_by_mm(thread->mm);
+	if (p && ref)
+		kref_get(&p->ref);
 	srcu_read_unlock(&kfd_processes_srcu, idx);
 
 	return p;
@@ -1675,6 +1679,27 @@ void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
 		idr_remove(&pdd->alloc_idr, handle);
 }
 
+/* This increments the process->ref counter. */
+struct kfd_process *kfd_lookup_process_by_pid(struct pid *pid)
+{
+	struct task_struct *task = NULL;
+	struct kfd_process *p    = NULL;
+
+	if (!pid) {
+		task = current;
+		get_task_struct(task);
+	} else {
+		task = get_pid_task(pid, PIDTYPE_PID);
+	}
+
+	if (task) {
+		p = find_process(task, true);
+		put_task_struct(task);
+	}
+
+	return p;
+}
+
 /* This increments the process->ref counter. */
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid)
 {
-- 
2.17.1

