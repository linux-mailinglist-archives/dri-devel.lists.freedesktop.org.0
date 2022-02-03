Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613C64A810C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F090C10EB02;
	Thu,  3 Feb 2022 09:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4658710EA11;
 Thu,  3 Feb 2022 09:09:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SO41+OtUj/NH9YJi00y+YEDmogSWfydO0iPaIdSH5nkoUY3cQMsP2gh9aYj9PtHerIzREETu07lmZ5JLlETuZzfxOStlsDTSAMOAQ8Qdi5RBnauFe9XhL28o7AP2zBDPgR9gcO5ODv892BKWkycl0gPss1WEwp8QCzd1zqSrZhkk66zDOm7qXy46/kJPX/2QKvBmG+kW0xf0/r9HFNG/B69GxAjp9b/mI58iskUMZSbZ9l/Cm5NYTfAzxdBcGgNprd5s+N5b87MkcYAWzJBpiNEtO0scPrQjBfIRMBrQtFf6/AyvM3qyqlXvqzQkzfCHgnCXa2Q7A7Trstwz0q0+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap0OzOnJGDR9wYA+QGduIY8kA7jfDnz3ng3AW2go3bA=;
 b=HJfV9gHifjmlrXCJKpeeC6cz0eGF5dOQ4f6cFb8ffc1YQ2OYYPFti5V/8D5aHtHQ4/XXARqQpHDQP7HemY2r2kugbEfjVxGs4Ab4mP4Opc1awhgQAE0WQ0AEavmaoqzmfYhF8uBnOShL9Iv1s75gXDN7ai85qA+yH6ToIDfgdV1yPjls5dblXlrmoomzFc7FAVu4j9gd3uGVo0zHlMp9Mz9ebNFOoqQtnEzYMVZ6JeRwloNXBchUkjPMR4Zb7PEzNhBzo4+thANOO+KJNRW5q0TU9h8txiHAmy/nOtTG0VGAMkWKllYYNpzKzK2LU9p1r8AOSmUqcd8ZNfCM67Jdgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap0OzOnJGDR9wYA+QGduIY8kA7jfDnz3ng3AW2go3bA=;
 b=u4CHM3Rcg3U7TYT36BPa8rdHEP5NgkqbBLafVTkemc37m+6fJRpsDuopKY6IsD58WQu07T5Yr9r8qaLVKJllKBybEXmi54A+lBKKznje8LoRTuS1FQ1PPN41hcC8xOIYNi8Ylp9gpKGGcGAXRprJTaKMag6WUZ3tQsP9Ee4QLiA=
Received: from BN9PR03CA0375.namprd03.prod.outlook.com (2603:10b6:408:f7::20)
 by CY4PR12MB1173.namprd12.prod.outlook.com (2603:10b6:903:41::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Thu, 3 Feb
 2022 09:09:38 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::8e) by BN9PR03CA0375.outlook.office365.com
 (2603:10b6:408:f7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:38 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:35 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 06/24] drm/amdkfd: CRIU Implement KFD resume ioctl
Date: Thu, 3 Feb 2022 04:09:00 -0500
Message-ID: <20220203090918.11520-7-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 225f235c-d6df-489c-4694-08d9e6f4e795
X-MS-TrafficTypeDiagnostic: CY4PR12MB1173:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB117320EB17DFAC9D583B6A26FE289@CY4PR12MB1173.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8A+Uimu2Tud0El8eqTUKo7Ka+CIyz983mmvs4Sly94jWMpBicDKS/8UT0GWpTbTRyMeyjrVinGNSGt7YvTSkrSetTcSVBmr25vWDJYVyKCx6I1KZBNFJv9ubs9A89skqbp3J/6NI06vXLg2yzssEb4pzPhp1JQoEtTGh/daW8iEgW7F19bUYBKsuBinBUq0qTJIy1YlUvkSdth1qoSISUwsddTwafrtb/XJBhpnWaFqAcI9iXD3BkoYDXHwVP/GjYzYZunPEi7znOsagh6FoCO6AudB3Sq8piXtrTGnA2F5pGYXoQc6riGzpGdLQwVrgeNld+cY2IigsgifDVh2RHZVt7HdnI5tRs1Hne0zLH8El9xdNeCEwCsl1nQcypv3CzQJ99Tx1kccJHtgMXCaz//7s7nXSuTHhM6MpKbrBqmHeVunUaoEmNu9Ip73eW5VrAs17/VebNjMLIzqNrPyDA5jFhTL/bzvfnqeX7HXZcF1hXyOmbILBUJ9sLhL2EiR8EUb2V0fq7JqsIEyjlrjy1boGc9Dk06RmPnWoZX4j3D8R8jTLKLl0zeqR1tguRX7+fVOKmLnrwikidJEUlKmndrwokdynDoxLTHtgQPWeIVHB6vkuQA/ZQy6cq+oKOOwerdn7LGAT97ZT9vDeM/2i/KV0DZbbl+dfOF8up89RXfNE7fDKi4rEcy7shtmWCQPZtdW5Oa1mFxjOlu55Nplfqw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(16526019)(1076003)(26005)(47076005)(336012)(83380400001)(36860700001)(356005)(186003)(81166007)(2616005)(426003)(82310400004)(86362001)(5660300002)(54906003)(30864003)(508600001)(4326008)(40460700003)(8676002)(6916009)(8936002)(316002)(2906002)(7696005)(6666004)(70586007)(36756003)(44832011)(70206006)(450100002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:38.0739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 225f235c-d6df-489c-4694-08d9e6f4e795
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1173
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support to create userptr BOs on restore and introduces a new
ioctl op to restart memory notifiers for the restored userptr BOs.
When doing CRIU restore MMU notifications can happen anytime after we call
amdgpu_mn_register. Prevent MMU notifications until we reach stage-4 of the
restore process i.e. criu_resume ioctl op is received, and the process is
ready to be resumed. This ioctl is different from other KFD CRIU ioctls
since its called by CRIU master restore process for all the target
processes being resumed by CRIU.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 53 +++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 41 ++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 35 ++++++++++--
 5 files changed, 122 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 395ba9566afe..4cb14c2fe53f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -131,6 +131,7 @@ struct amdkfd_process_info {
 	atomic_t evicted_bos;
 	struct delayed_work restore_userptr_work;
 	struct pid *pid;
+	bool block_mmu_notifications;
 };
 
 int amdgpu_amdkfd_init(void);
@@ -268,7 +269,7 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct amdgpu_device *adev, uint64_t va, uint64_t size,
 		void *drm_priv, struct kgd_mem **mem,
-		uint64_t *offset, uint32_t flags);
+		uint64_t *offset, uint32_t flags, bool criu_resume);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv,
 		uint64_t *size);
@@ -298,6 +299,9 @@ int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev,
 				bool reset);
 bool amdgpu_amdkfd_bo_mapped_to_dev(struct amdgpu_device *adev, struct kgd_mem *mem);
+void amdgpu_amdkfd_block_mmu_notifications(void *p);
+int amdgpu_amdkfd_criu_resume(void *p);
+
 #if IS_ENABLED(CONFIG_HSA_AMD)
 void amdgpu_amdkfd_gpuvm_init_mem_limits(void);
 void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 3485ef856860..69dc9e4d841c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -842,7 +842,8 @@ static void remove_kgd_mem_from_kfd_bo_list(struct kgd_mem *mem,
  *
  * Returns 0 for success, negative errno for errors.
  */
-static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
+static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
+			   bool criu_resume)
 {
 	struct amdkfd_process_info *process_info = mem->process_info;
 	struct amdgpu_bo *bo = mem->bo;
@@ -864,6 +865,18 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
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
+
 	ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
 	if (ret) {
 		pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
@@ -1452,10 +1465,39 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv)
 	return avm->pd_phys_addr;
 }
 
+void amdgpu_amdkfd_block_mmu_notifications(void *p)
+{
+	struct amdkfd_process_info *pinfo = (struct amdkfd_process_info *)p;
+
+	mutex_lock(&pinfo->lock);
+	WRITE_ONCE(pinfo->block_mmu_notifications, true);
+	mutex_unlock(&pinfo->lock);
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
+	if (!READ_ONCE(pinfo->block_mmu_notifications)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	WRITE_ONCE(pinfo->block_mmu_notifications, false);
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
@@ -1558,7 +1600,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	add_kgd_mem_to_kfd_bo_list(*mem, avm->process_info, user_addr);
 
 	if (user_addr) {
-		ret = init_user_pages(*mem, user_addr);
+		pr_debug("creating userptr BO for user_addr = %llu\n", user_addr);
+		ret = init_user_pages(*mem, user_addr, criu_resume);
 		if (ret)
 			goto allocate_init_user_pages_failed;
 	} else  if (flags & (KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL |
@@ -2062,6 +2105,10 @@ int amdgpu_amdkfd_evict_userptr(struct kgd_mem *mem,
 	int evicted_bos;
 	int r = 0;
 
+	/* Do not process MMU notifications until stage-4 IOCTL is received */
+	if (READ_ONCE(process_info->block_mmu_notifications))
+		return 0;
+
 	atomic_inc(&mem->invalid);
 	evicted_bos = atomic_inc_return(&process_info->evicted_bos);
 	if (evicted_bos == 1) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 342fc56b1940..95fc5668195c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1324,7 +1324,7 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		dev->adev, args->va_addr, args->size,
 		pdd->drm_priv, (struct kgd_mem **) &mem, &offset,
-		flags);
+		flags, false);
 
 	if (err)
 		goto err_unlock;
@@ -2116,6 +2116,7 @@ static int criu_restore_bos(struct kfd_process *p,
 {
 	struct kfd_criu_bo_bucket *bo_buckets;
 	struct kfd_criu_bo_priv_data *bo_privs;
+	const bool criu_resume = true;
 	bool flush_tlbs = false;
 	int ret = 0, j = 0;
 	uint32_t i;
@@ -2123,6 +2124,9 @@ static int criu_restore_bos(struct kfd_process *p,
 	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
 		return -EINVAL;
 
+	/* Prevent MMU notifications until stage-4 IOCTL (CRIU_RESUME) is received */
+	amdgpu_amdkfd_block_mmu_notifications(p->kgd_process_info);
+
 	bo_buckets = kvmalloc_array(args->num_bos, sizeof(*bo_buckets), GFP_KERNEL);
 	if (!bo_buckets)
 		return -ENOMEM;
@@ -2211,7 +2215,6 @@ static int criu_restore_bos(struct kfd_process *p,
 		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
 			offset = bo_priv->user_addr;
 		}
-
 		/* Create the BO */
 		ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(dev->adev,
 						bo_bucket->addr,
@@ -2219,7 +2222,8 @@ static int criu_restore_bos(struct kfd_process *p,
 						pdd->drm_priv,
 						(struct kgd_mem **) &mem,
 						&offset,
-						bo_bucket->alloc_flags);
+						bo_bucket->alloc_flags,
+						criu_resume);
 		if (ret) {
 			pr_err("Could not create the BO\n");
 			ret = -ENOMEM;
@@ -2239,7 +2243,6 @@ static int criu_restore_bos(struct kfd_process *p,
 			amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev,
 						(struct kgd_mem *)mem,
 						pdd->drm_priv, NULL);
-
 			ret = -ENOMEM;
 			goto exit;
 		}
@@ -2392,7 +2395,35 @@ static int criu_resume(struct file *filep,
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
index a4d08b6b2e6b..9b347247055c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -951,6 +951,7 @@ void *kfd_process_device_translate_handle(struct kfd_process_device *p,
 					int handle);
 void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
 					int handle);
+struct kfd_process *kfd_lookup_process_by_pid(struct pid *pid);
 
 /* PASIDs */
 int kfd_pasid_init(void);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 74f162887d3b..b3198e186622 100644
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
@@ -715,7 +716,8 @@ static int kfd_process_alloc_gpuvm(struct kfd_process_device *pdd,
 	int err;
 
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(kdev->adev, gpu_va, size,
-						 pdd->drm_priv, mem, NULL, flags);
+						 pdd->drm_priv, mem, NULL,
+						 flags, false);
 	if (err)
 		goto err_alloc_mem;
 
@@ -816,7 +818,7 @@ struct kfd_process *kfd_create_process(struct file *filep)
 	mutex_lock(&kfd_processes_mutex);
 
 	/* A prior open of /dev/kfd could have already created the process. */
-	process = find_process(thread);
+	process = find_process(thread, false);
 	if (process) {
 		pr_debug("Process already found\n");
 	} else {
@@ -884,7 +886,7 @@ struct kfd_process *kfd_get_process(const struct task_struct *thread)
 	if (thread->group_leader->mm != thread->mm)
 		return ERR_PTR(-EINVAL);
 
-	process = find_process(thread);
+	process = find_process(thread, false);
 	if (!process)
 		return ERR_PTR(-EINVAL);
 
@@ -903,13 +905,16 @@ static struct kfd_process *find_process_by_mm(const struct mm_struct *mm)
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
@@ -920,6 +925,26 @@ void kfd_unref_process(struct kfd_process *p)
 	kref_put(&p->ref, kfd_process_ref_release);
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
 
 static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 {
-- 
2.17.1

