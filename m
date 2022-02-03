Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644824A80FE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4A410EA08;
	Thu,  3 Feb 2022 09:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BF810EA18;
 Thu,  3 Feb 2022 09:09:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOCFXATskVuJ+8pMm5YNlmg5/UWhU5UnMSKD9n3xLtFUpAcn6/7d8qxLeTG+gPmZJyly3HhKWWAEsHHVsls1GSJGxrxIhQZo2tLoe5in4P6wyqqgyE0DpRKP/K9LZNnLmXhvZN9GKugx9Brr5LH6SOWT3hymGVQg1BNm+hOXQaIdZJ2gumDE0d+Tb6V2b9UUsNnkf3e2970boKA9ntYDgF8pHFHW/Yx97Hk869eqI53tFT9HpmJRdx5V1yyku/bX9av5UCCOpHNxmOAhzKYUlgxZNsmomQkt8lQhKchLUbofaNgj1CeeDrOfPNaLRCKlB2ClTGL/u6cL9cYdC3KinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bp1Y8ENoT5FH7Oexg2Evesj3tTWZ5084F75KmBA0dok=;
 b=O+Yx23Z+DlLls2BKp5QHITGBoFGSyeop1hr78lFyqiVsUh9R9ENRv1nSFxUCSQ7aYB9rayTvypKSIcGDFE3oL34edLUCNfCOZo4J22i9JtD6j41l86j0JmIRTiPPoW9Y6Gw+tOYWclmycJBafimMPpnuvAs28AZhArJBWQ/IAnKhOsHimozfQPSQZ074SfIqlxkfex611KoVVd0QBa+Ucn3S9px3N0B6o0k1CH8g6cC7SVwoX9Hkc+W2k+p96Lj+CIGsOVi90xdnycZgUkUlhRPjLDdycw5LdRzzbqyhnKpalUMa9zO77U1Df3GtEoHJca7/fKdA9bkH9E3F2JCj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp1Y8ENoT5FH7Oexg2Evesj3tTWZ5084F75KmBA0dok=;
 b=Z/L4SORIwGorveVC7mmXKdDVPAi3Q6JvKEATvYRvLKWDc5fh7y1Ren48EyX/0CSWaGuA8xdw64wCiL8gukZk09umUgiYBlimvUC72SdnH/EzZEzIiVVDp61rjJnsIA60i7tvUR681Vuq/8BuYh68KDoqo1bh+nwBReHeV5KbbNg=
Received: from BN9PR03CA0368.namprd03.prod.outlook.com (2603:10b6:408:f7::13)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:37 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::56) by BN9PR03CA0368.outlook.office365.com
 (2603:10b6:408:f7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:36 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:34 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 04/24] drm/amdkfd: CRIU Implement KFD checkpoint ioctl
Date: Thu, 3 Feb 2022 04:08:58 -0500
Message-ID: <20220203090918.11520-5-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 95db5642-8726-43da-64b0-08d9e6f4e6ee
X-MS-TrafficTypeDiagnostic: MN2PR12MB4469:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB446920AF7482AA7FD59F1F0FFE289@MN2PR12MB4469.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0sSOvrhy9zmusUwjdgnwOFV9arG6r14Yb0eDQXSJWnCu/O7wBIFJO6cN8X7BPQ2G+zT28lpgdL04QMWlJeXcPiq9WBLO/OXr42+yjlBSVlK+X7xil9+EEvpru8pwmEKWUvqTit4juAXHkRQetm5CtmqGS2cXyRKUu9Yd4GyPxXtHZMukwSlQjE3m4UTojL6JaR/22kK30Ey9bFG8oAVURWF8yhYy+yYf5CUlbzEQ99IR4aqEQqUdXsaAx9BVjxRpbhgHR+gl5ATPXKd0eTkcNpKuUwSyCxMQVX4UDkbb/YSH8TwphqEt7A4MRYYlZjF4CC0aqzQk62gHrefbryasbYMQ88vU0p9Keg4ilSs41yUvMUdd/+pNlW6gcTAjpXzZinEnQqNkUfFAztD0t8ItuhXbxJrrnz3q9VT4Ix5kwEEEtVGs6O7XlskQgRLxB9MRLErpdCMoDcrP7lIcXhIz3bHJPZ/6fjYeHLeVa19uIb9Dp18Ad5qQgd1XbDmhsGWjInmMkrX0Ga50wrE9uLmupTY+u8mDJGFZts3hzZfUBnK3jjWhfBRT3+MxzVtWTcKxb6vVaVKv/tyhUBrspBt7RmB3NO00rrCaPQY8DbWXbMCiGb9E3p46oKCoBaFnWGnDCaWeqtELuLa39iswoigRs02WsQpZhfeVh1aEtNxk/0n/ApEhalWWsasYx2zmFwl27Ch9klNACZ7CZDH8PDYUZA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8676002)(70206006)(4326008)(8936002)(2906002)(82310400004)(86362001)(70586007)(5660300002)(44832011)(81166007)(450100002)(426003)(336012)(356005)(16526019)(1076003)(186003)(508600001)(40460700003)(36756003)(83380400001)(26005)(7696005)(6666004)(2616005)(316002)(47076005)(6916009)(54906003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:36.9646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95db5642-8726-43da-64b0-08d9e6f4e6ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
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

This adds support to discover the  buffer objects that belong to a
process being checkpointed. The data corresponding to these buffer
objects is returned to user space plugin running under criu master
context which then stores this info to recreate these buffer objects
during a restore operation.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  11 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  20 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 177 +++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   4 +-
 6 files changed, 213 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index ac841ae8f5cc..395ba9566afe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -297,6 +297,7 @@ int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 				struct tile_config *config);
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev,
 				bool reset);
+bool amdgpu_amdkfd_bo_mapped_to_dev(struct amdgpu_device *adev, struct kgd_mem *mem);
 #if IS_ENABLED(CONFIG_HSA_AMD)
 void amdgpu_amdkfd_gpuvm_init_mem_limits(void);
 void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 5df387c4d7fb..3485ef856860 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2629,3 +2629,14 @@ int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 
 	return 0;
 }
+
+bool amdgpu_amdkfd_bo_mapped_to_dev(struct amdgpu_device *adev, struct kgd_mem *mem)
+{
+	struct kfd_mem_attachment *entry;
+
+	list_for_each_entry(entry, &mem->attachments, list) {
+		if (entry->is_mapped && entry->adev == adev)
+			return true;
+	}
+	return false;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b9637d1cf147..5a32ee66d8c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1127,6 +1127,26 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	return ttm_pool_free(&adev->mman.bdev.pool, ttm);
 }
 
+/**
+ * amdgpu_ttm_tt_get_userptr - Return the userptr GTT ttm_tt for the current
+ * task
+ *
+ * @tbo: The ttm_buffer_object that contains the userptr
+ * @user_addr:  The returned value
+ */
+int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
+			      uint64_t *user_addr)
+{
+	struct amdgpu_ttm_tt *gtt;
+
+	if (!tbo->ttm)
+		return -EINVAL;
+
+	gtt = (void *)tbo->ttm;
+	*user_addr = gtt->userptr;
+	return 0;
+}
+
 /**
  * amdgpu_ttm_tt_set_userptr - Initialize userptr GTT ttm_tt for the current
  * task
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index d9691f262f16..39d966e7185d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -181,6 +181,8 @@ static inline bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
 #endif
 
 void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct page **pages);
+int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
+			      uint64_t *user_addr);
 int amdgpu_ttm_tt_set_userptr(struct ttm_buffer_object *bo,
 			      uint64_t addr, uint32_t flags);
 bool amdgpu_ttm_tt_has_userptr(struct ttm_tt *ttm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 29443419bbf0..17a937b7139f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1860,6 +1860,29 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 }
 #endif
 
+static int criu_checkpoint_process(struct kfd_process *p,
+			     uint8_t __user *user_priv_data,
+			     uint64_t *priv_offset)
+{
+	struct kfd_criu_process_priv_data process_priv;
+	int ret;
+
+	memset(&process_priv, 0, sizeof(process_priv));
+
+	process_priv.version = KFD_CRIU_PRIV_VERSION;
+
+	ret = copy_to_user(user_priv_data + *priv_offset,
+				&process_priv, sizeof(process_priv));
+
+	if (ret) {
+		pr_err("Failed to copy process information to user\n");
+		ret = -EFAULT;
+	}
+
+	*priv_offset += sizeof(process_priv);
+	return ret;
+}
+
 uint32_t get_process_num_bos(struct kfd_process *p)
 {
 	uint32_t num_of_bos = 0;
@@ -1881,6 +1904,117 @@ uint32_t get_process_num_bos(struct kfd_process *p)
 	return num_of_bos;
 }
 
+static int criu_checkpoint_bos(struct kfd_process *p,
+			       uint32_t num_bos,
+			       uint8_t __user *user_bos,
+			       uint8_t __user *user_priv_data,
+			       uint64_t *priv_offset)
+{
+	struct kfd_criu_bo_bucket *bo_buckets;
+	struct kfd_criu_bo_priv_data *bo_privs;
+	int ret = 0, pdd_index, bo_index = 0, id;
+	void *mem;
+
+	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
+	if (!bo_buckets) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	bo_privs = kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
+	if (!bo_privs) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	for (pdd_index = 0; pdd_index < p->n_pdds; pdd_index++) {
+		struct kfd_process_device *pdd = p->pdds[pdd_index];
+		struct amdgpu_bo *dumper_bo;
+		struct kgd_mem *kgd_mem;
+
+		idr_for_each_entry(&pdd->alloc_idr, mem, id) {
+			struct kfd_criu_bo_bucket *bo_bucket;
+			struct kfd_criu_bo_priv_data *bo_priv;
+			int i, dev_idx = 0;
+
+			if (!mem) {
+				ret = -ENOMEM;
+				goto exit;
+			}
+
+			kgd_mem = (struct kgd_mem *)mem;
+			dumper_bo = kgd_mem->bo;
+
+			if ((uint64_t)kgd_mem->va <= pdd->gpuvm_base)
+				continue;
+
+			bo_bucket = &bo_buckets[bo_index];
+			bo_priv = &bo_privs[bo_index];
+
+			bo_bucket->addr = (uint64_t)kgd_mem->va;
+			bo_bucket->size = amdgpu_bo_size(dumper_bo);
+			bo_bucket->gpu_id = pdd->dev->id;
+			bo_bucket->alloc_flags = (uint32_t)kgd_mem->alloc_flags;
+			bo_priv->idr_handle = id;
+
+			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
+				ret = amdgpu_ttm_tt_get_userptr(&dumper_bo->tbo,
+								&bo_priv->user_addr);
+				if (ret) {
+					pr_err("Failed to obtain user address for user-pointer bo\n");
+					goto exit;
+				}
+			}
+			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
+				bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
+					KFD_MMAP_GPU_ID(pdd->dev->id);
+			else if (bo_bucket->alloc_flags &
+				KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP)
+				bo_bucket->offset = KFD_MMAP_TYPE_MMIO |
+					KFD_MMAP_GPU_ID(pdd->dev->id);
+			else
+				bo_bucket->offset = amdgpu_bo_mmap_offset(dumper_bo);
+
+			for (i = 0; i < p->n_pdds; i++) {
+				if (amdgpu_amdkfd_bo_mapped_to_dev(p->pdds[i]->dev->adev, kgd_mem))
+					bo_priv->mapped_gpuids[dev_idx++] = p->pdds[i]->dev->id;
+			}
+
+			pr_debug("bo_size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
+					"gpu_id = 0x%x alloc_flags = 0x%x idr_handle = 0x%x",
+					bo_bucket->size,
+					bo_bucket->addr,
+					bo_bucket->offset,
+					bo_bucket->gpu_id,
+					bo_bucket->alloc_flags,
+					bo_priv->idr_handle);
+			bo_index++;
+		}
+	}
+
+	ret = copy_to_user(user_bos, bo_buckets, num_bos * sizeof(*bo_buckets));
+	if (ret) {
+		pr_err("Failed to copy BO information to user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	ret = copy_to_user(user_priv_data + *priv_offset, bo_privs, num_bos * sizeof(*bo_privs));
+	if (ret) {
+		pr_err("Failed to copy BO priv information to user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	*priv_offset += num_bos * sizeof(*bo_privs);
+
+exit:
+
+	kvfree(bo_buckets);
+	kvfree(bo_privs);
+	return ret;
+}
+
 static void criu_get_process_object_info(struct kfd_process *p,
 					 uint32_t *num_bos,
 					 uint64_t *objs_priv_size)
@@ -1900,7 +2034,48 @@ static int criu_checkpoint(struct file *filep,
 			   struct kfd_process *p,
 			   struct kfd_ioctl_criu_args *args)
 {
-	return 0;
+	int ret;
+	uint32_t num_bos;
+	uint64_t priv_size, priv_offset = 0;
+
+	if (!args->bos || !args->priv_data)
+		return -EINVAL;
+
+	mutex_lock(&p->mutex);
+
+	if (!p->n_pdds) {
+		pr_err("No pdd for given process\n");
+		ret = -ENODEV;
+		goto exit_unlock;
+	}
+
+	criu_get_process_object_info(p, &num_bos, &priv_size);
+
+	if (num_bos != args->num_bos ||
+	    priv_size != args->priv_data_size) {
+
+		ret = -EINVAL;
+		goto exit_unlock;
+	}
+
+	/* each function will store private data inside priv_data and adjust priv_offset */
+	ret = criu_checkpoint_process(p, (uint8_t __user *)args->priv_data, &priv_offset);
+	if (ret)
+		goto exit_unlock;
+
+	ret = criu_checkpoint_bos(p, num_bos, (uint8_t __user *)args->bos,
+			    (uint8_t __user *)args->priv_data, &priv_offset);
+	if (ret)
+		goto exit_unlock;
+
+exit_unlock:
+	mutex_unlock(&p->mutex);
+	if (ret)
+		pr_err("Failed to dump CRIU ret:%d\n", ret);
+	else
+		pr_debug("CRIU dump ret:%d\n", ret);
+
+	return ret;
 }
 
 static int criu_restore(struct file *filep,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index f928878196ef..a4d08b6b2e6b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1049,7 +1049,9 @@ struct kfd_criu_device_priv_data {
 };
 
 struct kfd_criu_bo_priv_data {
-	uint64_t reserved;
+	uint64_t user_addr;
+	uint32_t idr_handle;
+	uint32_t mapped_gpuids[MAX_GPU_INSTANCE];
 };
 
 struct kfd_criu_svm_range_priv_data {
-- 
2.17.1

