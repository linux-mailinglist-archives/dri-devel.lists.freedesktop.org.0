Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6E4A8105
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753A410EA1B;
	Thu,  3 Feb 2022 09:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37B910E9F4;
 Thu,  3 Feb 2022 09:09:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YR8QnPTPnlPjcu4tCh79j7ignxp+N59PRgMvBXyeLk6F2pOcJsAQE7QlmbdzGcQwbYVQl3bhWGfFsrU7XACh7q9K3Jddh7/gMCG0Rpctx8NI1tVzd9Cu/iE4LG3fM/FQMW6JsajGoR/TWhCFTlIOgJsqmtPkgoyadK0Vgi2ziY8wJ++pVf3u2tX+RpxEhwaxavmGa5Q0f2OSP+LJVf+vfWC3++J691nuOraHrj9bJw7Twn2xwROWi0pYbKv664WPmQuUSLVWwuQWRNyPEK1KmNY3GNdcaIC3wbUxvxdx5xRGc2oHHXAe6OVIFh6DiMnm9NW7Mvva+4zrImrbPGPFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhEqIFQfUkJZ5fvQAd6F3x93RweD05UksJtrfvD8feg=;
 b=YiiIPGzGHYNyE+rARBZtkzRmda7ljhdG6CEBmNEgzuA0DPC1ql4Q++9E5JahbP18KaqOTSHBbpM9SIyhaiN/HEh7NPzZseRDot8ujjo3YiQDJjszoRqJYTZ+EUVp7JNuSOOSOFIDqThjPvQDYNHnsf8dHvdbZg0dMJJLOfwz8ug6NDhWSyoO66i5RpspOJveGPD8Wwg26aez6pHs42uY6qVdDBc2ATbRuUhhMys934H1vLhbxuN+6Pfgfgifzd55fKqVNNJFfmTUPy+ie/T7MfgxrqBgNuxfIh5fS/BRUy5DAJAiBloqq3BRUzeclS2Fdw5RFaAZl4QUaJBnNY/KyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhEqIFQfUkJZ5fvQAd6F3x93RweD05UksJtrfvD8feg=;
 b=lHR7e6lSLAQXXXXCIC1iZnWJXwTlwJGcXAxN8BXBx6aTlML/ScEg1n5BNcOekt37gGZBpnSvBCn+0FmENF+LC6UYaxvxRveyFYbzMAfevMOLRiiSr2ys6XwE1VoaMl/lRU95QuQiHbZxknBz9EnyCQpqzyW45qfvuHznU4LhO8Q=
Received: from BN9PR03CA0369.namprd03.prod.outlook.com (2603:10b6:408:f7::14)
 by DM6PR12MB3772.namprd12.prod.outlook.com (2603:10b6:5:1c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Thu, 3 Feb
 2022 09:09:37 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::45) by BN9PR03CA0369.outlook.office365.com
 (2603:10b6:408:f7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11 via Frontend
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
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:37 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:34 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 05/24] drm/amdkfd: CRIU Implement KFD restore ioctl
Date: Thu, 3 Feb 2022 04:08:59 -0500
Message-ID: <20220203090918.11520-6-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: e74f3cfc-664d-4b21-9c2c-08d9e6f4e727
X-MS-TrafficTypeDiagnostic: DM6PR12MB3772:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB377256A1DE1ADAD251C97E1FFE289@DM6PR12MB3772.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nmMSzhAsOtUHvb0pRFF8NoFP1/wrr86cFJ1MsWYNtYMPOheS+Y8cO4wYrkeRDaRJhZ438QGZvaKhtgsgPjU33vsIaX5kqDa8nuvdskDgk4gMBUK3yon2faeKq+MTqvme1FV7wznAGIumKdSqZonVwrvOGRrcAz/V50jDx6MynfTmXM5stL/hdLjL5wYbzV0X3zxVB9Og1RwvivS/Ib43UTaEy7TsPmJoazRAYldoSR98EIfBb9hho3Qh5/K/Sf2vV/2PYxKLfS6hvfahTa+RVzk4i2JHGkgExRJioGaXkkCoIozafXTFXjy2jQHszu2BvTX88CCfGQNo4L9szI9PXlAk1m17LeZEOJgN3eT7qN9seujv1zPrT+pBce0tZGOTpB0KjRtj1RmaLm7zMIDUP4wxpBYRlQqK0xYWW+qqQ2wbEkbMmK4fhLa/kG57msQs44YiWhmr8PWzz7h5/wXCru/Y5yUICDTJkzeRK0gZewKqFSdf7c5O4X6h40iq6rjz4SS9GwE1DUC/IHS0chBcB/loUBANlTQ0fL3//LER5aYBhnrQElDEC9iZ238amLkBPzE2C0PFWORzguQZDHwLut4XVPssplWfamNQlhxcNQsz5qSsAPTsyklDDfHtlaciretJlbn4lUbWVySCr9m5wH9S9clZvlC/7fSx/TJABABbV5isKTl4iZ3oCyfhyV64Wj5RuyN4BT4B8uC45cFOGQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(16526019)(36860700001)(8936002)(336012)(6666004)(1076003)(8676002)(426003)(186003)(356005)(508600001)(2616005)(81166007)(2906002)(7696005)(70586007)(82310400004)(5660300002)(86362001)(83380400001)(47076005)(4326008)(6916009)(44832011)(40460700003)(316002)(70206006)(36756003)(54906003)(450100002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:37.3396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e74f3cfc-664d-4b21-9c2c-08d9e6f4e727
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3772
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

This implements the KFD CRIU Restore ioctl that lays the basic
foundation for the CRIU restore operation. It provides support to
create the buffer objects corresponding to the checkpointed image.
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
index 17a937b7139f..342fc56b1940 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2078,11 +2078,307 @@ static int criu_checkpoint(struct file *filep,
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
+
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
+			struct kfd_dev *peer;
+			struct kfd_process_device *peer_pdd;
+			bool table_freed = false;
+
+			if (!bo_priv->mapped_gpuids[j])
+				break;
+
+			peer = kfd_device_by_id(bo_priv->mapped_gpuids[j]);
+			if (!peer) {
+				pr_debug("Getting device by id failed for 0x%x\n", pdd->dev->id);
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
+				pr_err("Failed to map to gpu %d/%d\n", j, p->n_pdds);
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
+	ret = kfd_process_evict_queues(p);
+	if (ret)
+		goto exit_unlock;
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

