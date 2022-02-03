Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D37E4A8120
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC17410EB4B;
	Thu,  3 Feb 2022 09:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2062110EA5E;
 Thu,  3 Feb 2022 09:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLH5eJ7reqFYl/Ow1U5fka8HgNPu1kSXeK7BMkH3Vq3rxvJq/PxmzQ7fNzB4+F8Z74LOMThXPm8UneetLu5ioUe6TWzMg4YE1+BVXBe+h2x7TDyot3Jffr/8SEUJoQGWbUp5XIiuQ0avkDYp/pdlVAMKaSUs53HweLBiiObf0Q3FZN1H7eIfSYdesaYQ2t2wFymCwsG9cMIjHmUlSTpWDbgjiajYAZGPQOfdSRfVVvCFJ5Yh3jBcAZPR01uqnbqPncFj05rDl8Wmte0bMe/dDervbQq3hxBZEn4LIu+CKweEuVtplmBvEIJHgXc6l+8g5+/ZYerqei9c51dNC1dchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ36hr4oL46EzE6jxBw463kiygzsmbLKb9943FpK3bI=;
 b=d38wsAEAfxwta9nSF4Q+Z43VTgLCo6ge2FMho8LTZ81I+KOtRU0+0922ZVbkz2/2DDKzGOwgh2ZUNCjTPbx0wrW+pgj1plFzFUBZ+GBLZBVbmahf2vJ1U6l+bkTUS7EqMHsQQGMA2MkxanvPx+SFnrC7EmBvdMI58kWbBbLHvOZf27ZqIAoJqkoh2arA+abkXt7qxV4+xV113qpZqfHn0GKKMY5KjCozaNriG5/ZgLIYyYrwpiZ7Fa0rcoYZPAXHnwamQhNWrN6s6QQ6ZoYSCBbd1FeXS/tvQrwrznwhc2TbQk+eyySRy2U3D519RFZZKsWGOU1ysCCP8xnTP3ELpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ36hr4oL46EzE6jxBw463kiygzsmbLKb9943FpK3bI=;
 b=0+A7M1m4SZzLmHHfKYA0eEOjhjvdM+NONkI8mA8OSZLQXN+ri9B5gJhrnI67kamT+iduKB3AI7zJCVyJ9TpH7BunB4zOnc1HI4ffNla3q0DezEfgY/FyaO8bfRd1hVLKcXZfxkdeEqxJPSNdeAR0VXW6oh1AVW6cJbC8G3g5aK4=
Received: from BN6PR11CA0058.namprd11.prod.outlook.com (2603:10b6:404:f7::20)
 by BN6PR1201MB0097.namprd12.prod.outlook.com (2603:10b6:405:54::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:45 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::6f) by BN6PR11CA0058.outlook.office365.com
 (2603:10b6:404:f7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:45 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:44 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 22/24] drm/amdkfd: CRIU prepare for svm resume
Date: Thu, 3 Feb 2022 04:09:16 -0500
Message-ID: <20220203090918.11520-23-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ae0933f0-e7de-4f90-ee58-08d9e6f4ebe4
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0097:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0097F7B5744994764509CB09FE289@BN6PR1201MB0097.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ge1AaFIME9KeoDnE79fz1TBcL7MfS8YVjiHNmzTIW26RLBa3s4HO9gbKzkWv4+F+vjjOxiwe0Hlc64SYqrnwtH3jXjuBQ+Sa4uYiwanBNhZxXaARqdAoL/8BBSxXeS8nx2Gm1loPOaCCRf+AW38QZ8l0zVk4DI+EiXgNIDsBJLlXdjjaNxFKZOpDLEw6ZRoK/QgKXJo3QIVIq4cgHHhanf6Y9FTw6mVBDLg6I8Q4DmvSzcV2qq4U7YSkIPF1XUZG5aDb5QM2JIjAxtBpXSKcrfZQM/pqS6T8ucYFwSbwr4XqxiyMaBJWV3dBBe2K0CKJP5QW86zQbTrzbw1gJLKR8jDyRtRnTQDiiqzzDKyCl7UgFUo7dr21WJ2piUZK7EiqCgsW59AiHS5BL5vhEZRWiQspfyL/ev7FWSl2bIlz/Yl4707hHV64G8mOL32x2ML7Z+cXaKzAj/XnKqeSieB0DcYfj2FJPBDKFSg1Cpo0Vf2lgsxVt0tSPaf/LTsTrvNIR5I+XHoFL3el6wSvkgTbXmnvitb8SMyp/IBhos5QJv+9ztu13RqNHYX+Zhonu2r6LEYFPKrNWPnizyo4+yneetjtHty2/7a4QhF9IDaZW+J/D8gwTZdvSGvdsTrwNV2K6glOT6eq7HEdoFMTDknuLbjHpJwPR+7bf2kR3+idpHtiPEm/N3NMw5JUHwUiXNJhGK5GctVnfgziHjnM1wJiwg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(44832011)(86362001)(426003)(2906002)(82310400004)(356005)(5660300002)(81166007)(16526019)(26005)(186003)(1076003)(2616005)(83380400001)(336012)(316002)(36860700001)(6666004)(7696005)(508600001)(8676002)(450100002)(8936002)(70586007)(70206006)(54906003)(6916009)(40460700003)(47076005)(4326008)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:45.2912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0933f0-e7de-4f90-ee58-08d9e6f4ebe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0097
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

During CRIU restore phase, the VMAs for the virtual address ranges are
not at their final location yet so in this stage, only cache the data
required to successfully resume the svm ranges during an imminent CRIU
resume phase.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 58 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 12 +++++
 4 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 721c86ceba22..c143f242a84d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2643,8 +2643,8 @@ static int criu_restore_objects(struct file *filep,
 				goto exit;
 			break;
 		case KFD_CRIU_OBJECT_TYPE_SVM_RANGE:
-			/* TODO: Implement SVM range */
-			*priv_offset += sizeof(struct kfd_criu_svm_range_priv_data);
+			ret = kfd_criu_restore_svm(p, (uint8_t __user *)args->priv_data,
+						     priv_offset, max_priv_data_size);
 			if (ret)
 				goto exit;
 			break;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 715dd0d4fac5..74ff4132a163 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -790,6 +790,7 @@ struct svm_range_list {
 	struct list_head		list;
 	struct work_struct		deferred_list_work;
 	struct list_head		deferred_range_list;
+	struct list_head                criu_svm_metadata_list;
 	spinlock_t			deferred_list_lock;
 	atomic_t			evicted_ranges;
 	atomic_t			drain_pagefaults;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7cf63995c079..41ac049b3316 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -45,6 +45,11 @@
  */
 #define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	2000
 
+struct criu_svm_metadata {
+	struct list_head list;
+	struct kfd_criu_svm_range_priv_data data;
+};
+
 static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
@@ -2875,6 +2880,7 @@ int svm_range_list_init(struct kfd_process *p)
 	INIT_DELAYED_WORK(&svms->restore_work, svm_range_restore_work);
 	INIT_WORK(&svms->deferred_list_work, svm_range_deferred_list_work);
 	INIT_LIST_HEAD(&svms->deferred_range_list);
+	INIT_LIST_HEAD(&svms->criu_svm_metadata_list);
 	spin_lock_init(&svms->deferred_list_lock);
 
 	for (i = 0; i < p->n_pdds; i++)
@@ -3481,6 +3487,58 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	return 0;
 }
 
+int kfd_criu_restore_svm(struct kfd_process *p,
+			 uint8_t __user *user_priv_ptr,
+			 uint64_t *priv_data_offset,
+			 uint64_t max_priv_data_size)
+{
+	uint64_t svm_priv_data_size, svm_object_md_size, svm_attrs_size;
+	int nattr_common = 4, nattr_accessibility = 1;
+	struct criu_svm_metadata *criu_svm_md = NULL;
+	struct svm_range_list *svms = &p->svms;
+	uint32_t num_devices;
+	int ret = 0;
+
+	num_devices = p->n_pdds;
+	/* Handle one SVM range object at a time, also the number of gpus are
+	 * assumed to be same on the restore node, checking must be done while
+	 * evaluating the topology earlier */
+
+	svm_attrs_size = sizeof(struct kfd_ioctl_svm_attribute) *
+		(nattr_common + nattr_accessibility * num_devices);
+	svm_object_md_size = sizeof(struct criu_svm_metadata) + svm_attrs_size;
+
+	svm_priv_data_size = sizeof(struct kfd_criu_svm_range_priv_data) +
+								svm_attrs_size;
+
+	criu_svm_md = kzalloc(svm_object_md_size, GFP_KERNEL);
+	if (!criu_svm_md) {
+		pr_err("failed to allocate memory to store svm metadata\n");
+		return -ENOMEM;
+	}
+	if (*priv_data_offset + svm_priv_data_size > max_priv_data_size) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = copy_from_user(&criu_svm_md->data, user_priv_ptr + *priv_data_offset,
+			     svm_priv_data_size);
+	if (ret) {
+		ret = -EFAULT;
+		goto exit;
+	}
+	*priv_data_offset += svm_priv_data_size;
+
+	list_add_tail(&criu_svm_md->list, &svms->criu_svm_metadata_list);
+
+	return 0;
+
+
+exit:
+	kfree(criu_svm_md);
+	return ret;
+}
+
 int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 		       uint64_t *svm_priv_data_size)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index f36c2fa8469a..3b5948f67de2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -188,6 +188,10 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 int kfd_criu_checkpoint_svm(struct kfd_process *p,
 			    uint8_t __user *user_priv_data,
 			    uint64_t *priv_offset);
+int kfd_criu_restore_svm(struct kfd_process *p,
+			 uint8_t __user *user_priv_ptr,
+			 uint64_t *priv_data_offset,
+			 uint64_t max_priv_data_size);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -241,6 +245,14 @@ static inline int kfd_criu_checkpoint_svm(struct kfd_process *p,
 	return 0;
 }
 
+static inline int kfd_criu_restore_svm(struct kfd_process *p,
+				       uint8_t __user *user_priv_ptr,
+				       uint64_t *priv_data_offset,
+				       uint64_t max_priv_data_size)
+{
+	return -EINVAL;
+}
+
 #define KFD_IS_SVM_API_SUPPORTED(dev) false
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
-- 
2.17.1

