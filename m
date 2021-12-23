Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255547DC2C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DDC10E16D;
	Thu, 23 Dec 2021 00:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A793510E155;
 Thu, 23 Dec 2021 00:37:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpSuLtAiWWQs50g5GnIKWmSxZsnR0vXGrlD6M3zx7hFZPl9pbvV1TjV3Hazxp6bcMq/TlJBGu6PI6szt42SxCsrF6s7R6SAq9+MHMVGFHAs4s0aBKMVKKEKWyKjnTdK8ej16Eg5NNSHePoQstiayhyS94wBb7viJJBTP+wAmPgHrGMxXymdUO/sS8hvpYu79SJxBbEUZS7Uhoc5t5tXSnrckKmf0+Oth9bvXcEeub1nfpt8vQbc0SQgsymrYsRkpmbd7IJqM6UW01bFeYmA+884huG/PaID4FsC5jmIL1fRLwKfql8dxkSIvZEUbr+Lnhhk91F8NAVd4W4ZDxZeu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOp3Qx0GPhRPzYOgmnW/4C5Faw5D9xCjLKAcOyzs0N8=;
 b=dNylH2qY4hwI3WfZRveltf7nFQPdOdfwoK/b2pMo/n9iXrLpORVsxVUuN9UpOH7HVhUqkYA6mqQsWcMfiMLNBMVSsjThqrdCFF4kf08H45QkmVgOFLodfqxQbaaLlCMuTvAHvBN3VxnDq8qvfAjFKyM356uiHwxnCSvKnZRklzUn/rlZ4U7OCKmgmE/e07rFt28C+IMiNZ/PL3F5veo8vK/eVeybr+1P9TETIPGN7ZSArYkngOqa5S0f8sbMJvPaSl8j9XuxUTWmUKfZg0yf4/Mq0oJm/Vg4hmkcM8hF03nxSsax/aDqbVGRZBORfbTKiVP7+mtM14kfh3L5d/u5uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOp3Qx0GPhRPzYOgmnW/4C5Faw5D9xCjLKAcOyzs0N8=;
 b=1vAJCHbaT8NdMy1TlM0RM4ybfRTRtsmdUriX252iyMCFtBwOX7An+iPy3CSFp8qyMGnF1kjL9N3UeZue29y204K9bU97yn9aMIHnonNtaS4KLbsRQngZWLshMA4Q9AC9EEtw3Fg0V91gC5c/LZ9FKlTv1S/8rA4FfXK+LRKGCeE=
Received: from BN0PR04CA0060.namprd04.prod.outlook.com (2603:10b6:408:e8::35)
 by MN2PR12MB3904.namprd12.prod.outlook.com (2603:10b6:208:165::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Thu, 23 Dec
 2021 00:37:29 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::63) by BN0PR04CA0060.outlook.office365.com
 (2603:10b6:408:e8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
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
Subject: [Patch v4 06/24] drm/amdkfd: CRIU Implement KFD restore ioctl
Date: Wed, 22 Dec 2021 19:36:53 -0500
Message-ID: <20211223003711.13064-7-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: da05863d-8d05-450f-dc2e-08d9c5ac6648
X-MS-TrafficTypeDiagnostic: MN2PR12MB3904:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB390491780103114D1C0A6781FE7E9@MN2PR12MB3904.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RIFF9fSIYfXxNGrZ0Og8Ec9iN1kRTyEPES61l1IUqYF3oJgtziJrrkC8sllkDRw2BHZc7CnUnqRYz7mWmWuwyMFYVLPkv6BDkf7nu7Acp8hFHVuGWCWiLTR3nKeO0gu1OstVihHoea3HwvJCkhVAgVN+dYUvnx7hyrmJjt5X77soBqPQZk8D6piu+cmAvALR3lOJc0910oCJ7VXw7+0ONd/zcAKORt8QcABquDz34nFAFiIfu/RL3G/rJeXpHTT4pVm3RRTtcI3uRx4lsd6KDIUyYS6x2E3w5UePt5IaSRBeNNn5NmYwfH8X5aX9fnbkzJRdHY0yBm03q16ZPmeLCqXJlC+cA6I4bPzBJGpN9Jmn1KkTNSGEk2AfC+XPQIIxENrKzfnk7rTop6sHjsFbsO1/DS9bOMRk8dsLfWRHtnHmpixEBG4xd8rDOf23K8Ko3ScWnmlSIXB3HdvAo+iX0Ao36enPY0wI8s8UOz5M573SfBe5+CnTEjhPzK222Hxpf+UfIv+L2DwZQiHW+jlDCCXEgIV1ZJt+JNDxOyNkpNZPf40IIsc0fFMqf28QC3nRKAXSRJVf6EVA3jvwHrP4hL48Wnlh1LTKiw+7BMTErLOFL0+wgv5FZkYNc/eKYKSA/pH7w9ZTi8Y6Y+i5TNckmVt2KHRz2ROCALkbJtAA/AWROlItziF0yZLeFwbLMiTUholGjnd1lw/QI3B9NFD6Yj2L4vzwWguSNT/npDfeLEEMH4xpJlJ0bU9HxQzuv/hHRFCB1zKqq0rp8aQaTkD/v3bzl9+KTEWaWVe8XUHnvU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(2616005)(81166007)(508600001)(36756003)(86362001)(426003)(2906002)(44832011)(4326008)(186003)(7696005)(5660300002)(1076003)(16526019)(40460700001)(36860700001)(83380400001)(8676002)(54906003)(47076005)(26005)(70206006)(70586007)(6666004)(110136005)(8936002)(82310400004)(336012)(316002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:29.0264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da05863d-8d05-450f-dc2e-08d9c5ac6648
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3904
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

This implements the KFD CRIU Restore ioctl that lays the basic
foundation for the CRIU restore operation. It provides support to
create the buffer objects corresponding to Non-Paged system memory
mapped for GPU and/or CPU access and lays basic foundation for the
userptrs buffer objects which will be added in a separate patch.
This ioctl creates various types of buffer objects such as VRAM,
MMIO, Doorbell, GTT based on the date sent from the userspace plugin.
The data mostly contains the previously checkpointed KFD images from
some KFD processs.

While restoring a criu process, attach old IDR values to newly
created BOs. This also adds the minimal gpu mapping support for a single
gpu checkpoint restore use case.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 298 ++++++++++++++++++++++-
 1 file changed, 297 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index cdbb92972338..c93f74ad073f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2069,11 +2069,307 @@ static int criu_checkpoint(struct file *filep,
 	return ret;
 }
 
+static int criu_restore_process(struct kfd_process *p,
+				struct kfd_ioctl_criu_args *args,
+				uint64_t *priv_offset,
+				uint64_t max_priv_data_size)
+{
+	int ret = 0;
+	struct kfd_criu_process_priv_data process_priv;
+
+	if (*priv_offset + sizeof(process_priv) > max_priv_data_size)
+		return -EINVAL;
+
+	ret = copy_from_user(&process_priv,
+				(void __user *)(args->priv_data + *priv_offset),
+				sizeof(process_priv));
+	if (ret) {
+		pr_err("Failed to copy process private information from user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+	*priv_offset += sizeof(process_priv);
+
+	if (process_priv.version != KFD_CRIU_PRIV_VERSION) {
+		pr_err("Invalid CRIU API version (checkpointed:%d current:%d)\n",
+			process_priv.version, KFD_CRIU_PRIV_VERSION);
+		return -EINVAL;
+	}
+
+exit:
+	return ret;
+}
+
+static int criu_restore_bos(struct kfd_process *p,
+			    struct kfd_ioctl_criu_args *args,
+			    uint64_t *priv_offset,
+			    uint64_t max_priv_data_size)
+{
+	struct kfd_criu_bo_bucket *bo_buckets;
+	struct kfd_criu_bo_priv_data *bo_privs;
+	bool flush_tlbs = false;
+	int ret = 0, j = 0;
+	uint32_t i;
+
+	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
+		return -EINVAL;
+
+	bo_buckets = kvmalloc_array(args->num_bos, sizeof(*bo_buckets), GFP_KERNEL);
+	if (!bo_buckets)
+		return -ENOMEM;
+
+	ret = copy_from_user(bo_buckets, (void __user *)args->bos,
+			     args->num_bos * sizeof(*bo_buckets));
+	if (ret) {
+		pr_err("Failed to copy BOs information from user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	bo_privs = kvmalloc_array(args->num_bos, sizeof(*bo_privs), GFP_KERNEL);
+	if (!bo_privs) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	ret = copy_from_user(bo_privs, (void __user *)args->priv_data + *priv_offset,
+			     args->num_bos * sizeof(*bo_privs));
+	if (ret) {
+		pr_err("Failed to copy BOs information from user\n");
+		ret = -EFAULT;
+		goto exit;
+	}
+	*priv_offset += args->num_bos * sizeof(*bo_privs);
+
+	/* Create and map new BOs */
+	for (i = 0; i < args->num_bos; i++) {
+		struct kfd_criu_bo_bucket *bo_bucket;
+		struct kfd_criu_bo_priv_data *bo_priv;
+		struct kfd_dev *dev;
+		struct kfd_process_device *pdd;
+		void *mem;
+		u64 offset;
+		int idr_handle;
+
+		bo_bucket = &bo_buckets[i];
+		bo_priv = &bo_privs[i];
+
+		dev = kfd_device_by_id(bo_bucket->gpu_id);
+		if (!dev) {
+			ret = -EINVAL;
+			pr_err("Failed to get pdd\n");
+			goto exit;
+		}
+		pdd = kfd_get_process_device_data(dev, p);
+		if (!pdd) {
+			ret = -EINVAL;
+			pr_err("Failed to get pdd\n");
+			goto exit;
+		}
+
+		pr_debug("kfd restore ioctl - bo_bucket[%d]:\n", i);
+		pr_debug("size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
+			"gpu_id = 0x%x alloc_flags = 0x%x\n"
+			"idr_handle = 0x%x\n",
+			bo_bucket->size,
+			bo_bucket->addr,
+			bo_bucket->offset,
+			bo_bucket->gpu_id,
+			bo_bucket->alloc_flags,
+			bo_priv->idr_handle);
+
+		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
+			pr_debug("restore ioctl: KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL\n");
+			if (bo_bucket->size != kfd_doorbell_process_slice(dev)) {
+				ret = -EINVAL;
+				goto exit;
+			}
+			offset = kfd_get_process_doorbells(pdd);
+		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
+			/* MMIO BOs need remapped bus address */
+			pr_debug("restore ioctl :KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP\n");
+			if (bo_bucket->size != PAGE_SIZE) {
+				pr_err("Invalid page size\n");
+				ret = -EINVAL;
+				goto exit;
+			}
+			offset = dev->adev->rmmio_remap.bus_addr;
+			if (!offset) {
+				pr_err("amdgpu_amdkfd_get_mmio_remap_phys_addr failed\n");
+				ret = -ENOMEM;
+				goto exit;
+			}
+		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
+			offset = bo_priv->user_addr;
+		}
+
+		/* Create the BO */
+		ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(dev->adev,
+						bo_bucket->addr,
+						bo_bucket->size,
+						pdd->drm_priv,
+						(struct kgd_mem **) &mem,
+						&offset,
+						bo_bucket->alloc_flags);
+		if (ret) {
+			pr_err("Could not create the BO\n");
+			ret = -ENOMEM;
+			goto exit;
+		}
+		pr_debug("New BO created: size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n",
+			bo_bucket->size, bo_bucket->addr, offset);
+
+		/* Restore previuos IDR handle */
+		pr_debug("Restoring old IDR handle for the BO");
+		idr_handle = idr_alloc(&pdd->alloc_idr, mem,
+				       bo_priv->idr_handle,
+				       bo_priv->idr_handle + 1, GFP_KERNEL);
+		if (idr_handle < 0) {
+			pr_err("Could not allocate idr\n");
+			amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev,
+						(struct kgd_mem *)mem,
+						pdd->drm_priv, NULL);
+
+			ret = -ENOMEM;
+			goto exit;
+		}
+
+		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
+			bo_bucket->restored_offset = KFD_MMAP_TYPE_DOORBELL |
+				KFD_MMAP_GPU_ID(pdd->dev->id);
+		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
+			bo_bucket->restored_offset = KFD_MMAP_TYPE_MMIO |
+				KFD_MMAP_GPU_ID(pdd->dev->id);
+		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_GTT) {
+			bo_bucket->restored_offset = offset;
+			pr_debug("updating offset for GTT\n");
+		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+			bo_bucket->restored_offset = offset;
+			/* Update the VRAM usage count */
+			WRITE_ONCE(pdd->vram_usage, pdd->vram_usage + bo_bucket->size);
+			pr_debug("updating offset for VRAM\n");
+		}
+
+		/* now map these BOs to GPU/s */
+		for (j = 0; j < p->n_pdds; j++) {
+			struct kfd_process_device *pdd = p->pdds[j];
+			struct kfd_dev *peer;
+			struct kfd_process_device *peer_pdd;
+			bool table_freed = false;
+
+			peer = kfd_device_by_id(pdd->dev->id);
+
+			pr_debug("Inside mapping loop with desired gpu_id = 0x%x\n",
+							pdd->dev->id);
+			if (!peer) {
+				pr_debug("Getting device by id failed for 0x%x\n",
+						pdd->dev->id);
+				ret = -EINVAL;
+				goto exit;
+			}
+
+			peer_pdd = kfd_bind_process_to_device(peer, p);
+			if (IS_ERR(peer_pdd)) {
+				ret = PTR_ERR(peer_pdd);
+				goto exit;
+			}
+			pr_debug("map mem in restore ioctl -> 0x%llx\n",
+				 ((struct kgd_mem *)mem)->va);
+			ret = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(peer->adev,
+				(struct kgd_mem *)mem, peer_pdd->drm_priv, &table_freed);
+			if (ret) {
+				pr_err("Failed to map to gpu %d/%d\n",
+				j, p->n_pdds);
+				goto exit;
+			}
+			if (table_freed)
+				flush_tlbs = true;
+		}
+
+		ret = amdgpu_amdkfd_gpuvm_sync_memory(dev->adev,
+						      (struct kgd_mem *) mem, true);
+		if (ret) {
+			pr_debug("Sync memory failed, wait interrupted by user signal\n");
+			goto exit;
+		}
+
+		pr_debug("map memory was successful for the BO\n");
+	} /* done */
+
+	if (flush_tlbs) {
+		/* Flush TLBs after waiting for the page table updates to complete */
+		for (j = 0; j < p->n_pdds; j++) {
+			struct kfd_dev *peer;
+			struct kfd_process_device *pdd = p->pdds[j];
+			struct kfd_process_device *peer_pdd;
+
+			peer = kfd_device_by_id(pdd->dev->id);
+			if (WARN_ON_ONCE(!peer))
+				continue;
+			peer_pdd = kfd_get_process_device_data(peer, p);
+			if (WARN_ON_ONCE(!peer_pdd))
+				continue;
+			kfd_flush_tlb(peer_pdd, TLB_FLUSH_LEGACY);
+		}
+	}
+
+	/* Copy only the buckets back so user can read bo_buckets[N].restored_offset */
+	ret = copy_to_user((void __user *)args->bos,
+				bo_buckets,
+				(args->num_bos * sizeof(*bo_buckets)));
+	if (ret)
+		ret = -EFAULT;
+
+exit:
+	kvfree(bo_buckets);
+	kvfree(bo_privs);
+	return ret;
+}
+
 static int criu_restore(struct file *filep,
 			struct kfd_process *p,
 			struct kfd_ioctl_criu_args *args)
 {
-	return 0;
+	uint64_t priv_offset = 0;
+	int ret = 0;
+
+	pr_debug("CRIU restore (num_devices:%u num_bos:%u num_objects:%u priv_data_size:%llu)\n",
+		 args->num_devices, args->num_bos, args->num_objects, args->priv_data_size);
+
+	if (!args->bos || !args->devices || !args->priv_data || !args->priv_data_size ||
+	    !args->num_devices || !args->num_bos)
+		return -EINVAL;
+
+	mutex_lock(&p->mutex);
+
+	/*
+	 * Set the process to evicted state to avoid running any new queues before all the memory
+	 * mappings are ready.
+	 */
+	kfd_process_evict_queues(p);
+
+	/* Each function will adjust priv_offset based on how many bytes they consumed */
+	ret = criu_restore_process(p, args, &priv_offset, args->priv_data_size);
+	if (ret)
+		goto exit_unlock;
+
+	ret = criu_restore_bos(p, args, &priv_offset, args->priv_data_size);
+	if (ret)
+		goto exit_unlock;
+
+	if (priv_offset != args->priv_data_size) {
+		pr_err("Invalid private data size\n");
+		ret = -EINVAL;
+	}
+
+exit_unlock:
+	mutex_unlock(&p->mutex);
+	if (ret)
+		pr_err("Failed to restore CRIU ret:%d\n", ret);
+	else
+		pr_debug("CRIU restore successful\n");
+
+	return ret;
 }
 
 static int criu_unpause(struct file *filep,
-- 
2.17.1

