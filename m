Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E047DC42
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E0C10E1CD;
	Thu, 23 Dec 2021 00:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CDE10E16E;
 Thu, 23 Dec 2021 00:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bpoc5LdMOgCwT8PVWG7dTqHYf7wbMJZ+mpmwxbyMAc+VoTyhNWIjejK84xpjun8foBF5eU/QCGDDxL6qSM8R84jSDbsFdOuOXaLMqatO+zGW2tKxzimcwu64YzIoRujHskQ+fcezHll8jLY5NlOlcsGf4yxa7CF15JLe9dfhyGIEjQAQhQp4ZBWe5jj7KscfuhI1lQB/fD32v/aWscQi1qiMc1O+8qK35jO6X5M4MlRcchDEwwV4O6gGnh2ZyxZNwV41su4741JIy1N2k/pXIQYKfGVt8Xmfe98oipuEt5MBxVF8G9WO4XWcbfyGbravwzRpoEumbPfkxM19iLgl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nV8WsHAx4vLfNEHEnrNP6NietTHGOchx1VfGm0CJ9Wc=;
 b=CK7NJSq1J6PEVTC8FluyfUSS/9EY+HDYUNgNW+y2p4U2iUHsAUfaZg9IP6HrvHHjkEZUDCjSTr9qeEmv53lo6SfrlrEadNk+4gh0caxUWr2uKSap6ODxic9pmj7b8/6hPW9/cip1ZFjdIfCss/wPUddlEAoiTlQRGmjmYZRBy7KgM4Rj02mH3zLbSWXWHM6qirsYw1gLqyqqjlhLIVR85rrMOB1xFi/IOkW+9IYQaG5YGfXUoZZ/+P0GVpK1o51eGvTMDkfz5Z+965eev+S8dbfuHlLfvLaWzpPdurBDKsXNOcCihTDeXZv4rzPIz+KEuQDymlRwDEaju1owZnTAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nV8WsHAx4vLfNEHEnrNP6NietTHGOchx1VfGm0CJ9Wc=;
 b=p8f13oi9SBN2jWQieJ1191KysvQ0LLyDhIwCMvmSZ2K/qVcpIpyJ1rj5+Tu3qO80WuPc2CU5bxfI3vbPlRVF0ltBiOlFE8b2wYMRX9mvghU2AM1KskYtSrRdbLJDHf7qCG2lEBhBTM1HRJAfu7emRu/xPP9C67DVbc/8Hxbt6cw=
Received: from BN9PR03CA0516.namprd03.prod.outlook.com (2603:10b6:408:131::11)
 by DM6PR12MB4715.namprd12.prod.outlook.com (2603:10b6:5:36::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 00:37:38 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::dd) by BN9PR03CA0516.outlook.office365.com
 (2603:10b6:408:131::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:38 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:37 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 23/24] drm/amdkfd: CRIU prepare for svm resume
Date: Wed, 22 Dec 2021 19:37:10 -0500
Message-ID: <20211223003711.13064-24-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 35ed95d9-8b90-428a-a4ef-08d9c5ac6bb9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4715:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB47154CC0580FD955BE3E8C4DFE7E9@DM6PR12MB4715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNUHcXY0U3e+CKO0MFh4uIIeoawj1JdEgYQ6UxzIxlGoWRW6pBnhVwaRPse+gHbbzgoQilFY00Vfz9H4SZ4IZSEEsi5FaVKau5BFf0u+8GFZWBM7Hc+DpPe8XrmnZyxEBSzJsnkA6FATZD8Ng52hPcTLJuUObgORXctia9xvpzyRMagHusdd4Rx1MGOhlwnB4lR4DL27jCwr3+ppR70tRWaKbKiGlqiioG7BIbuS3iQnoWOdly1aYctJxcCSA7UMTmfx+ntMkNcxpUcXmHfpbJhjgoNM3HLZCTMVElfMl4y024j2rwKgN6a2LUCiyx3eWAXj7Itvx+4U5RRhIB7mblD62V7zIxrVtOeZ+yE2Q+uasAb+ZvqpgyAt/EywrtSNTyEKqu2XZPye+Xv+KtHspv6SBtN7ZcrRKzSvd0yJULs0X4PHQs4VXVdloZORMXp31pxz0OQXZIWfwNpK5OAzljmkmvPVNb91DY0wC6asqONT5VDjX8UDRbdOk6noi8JESp8Ix4fEiGXpTCHJIadfxFeh0MyrLy7wSgi8DFozxpn0qV3I0RZHTWuZL1zWBK59NdoShM/M5zfTjFE/BX4LfXi1g+ax7jYjv7paMBJk8i44z96IGFu/cFQCgBgG7YAY2A53OOufJTNu6x97JRzSX3YjCY96lUNtbb9yyynoH259gadN/Xy+9cSfjO4WrnsUaQyHkKHYW+Zs5iK0tQ2NsNq9GUmgKQfyLrbbhq+96wDG4knvTMyRb1UGenx30O6zGxIRtMRcbsflmGfiKLO8VXgC9aeUAQvyy/gWpf/t/d8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(186003)(2906002)(16526019)(36756003)(336012)(1076003)(26005)(2616005)(70206006)(86362001)(6666004)(70586007)(7696005)(426003)(110136005)(47076005)(4326008)(81166007)(8676002)(8936002)(40460700001)(54906003)(508600001)(356005)(36860700001)(82310400004)(83380400001)(316002)(44832011)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:38.1698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ed95d9-8b90-428a-a4ef-08d9c5ac6bb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4715
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
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During CRIU restore phase, the VMAs for the virtual address ranges are
not at their final location yet so in this stage, only cache the data
required to successfully resume the svm ranges during an imminent CRIU
resume phase.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  5 ++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 99 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 12 +++
 4 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 916b8d000317..f7aa15b18f95 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2638,8 +2638,8 @@ static int criu_restore_objects(struct file *filep,
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
index 87eb6739a78e..92191c541c29 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -790,6 +790,7 @@ struct svm_range_list {
 	struct list_head		list;
 	struct work_struct		deferred_list_work;
 	struct list_head		deferred_range_list;
+	struct list_head                criu_svm_metadata_list;
 	spinlock_t			deferred_list_lock;
 	atomic_t			evicted_ranges;
 	bool				drain_pagefaults;
@@ -1148,6 +1149,10 @@ int kfd_criu_restore_event(struct file *devkfd,
 			   uint8_t __user *user_priv_data,
 			   uint64_t *priv_data_offset,
 			   uint64_t max_priv_data_size);
+int kfd_criu_restore_svm(struct kfd_process *p,
+			 uint8_t __user *user_priv_data,
+			 uint64_t *priv_data_offset,
+			 uint64_t max_priv_data_size);
 /* CRIU - End */
 
 /* Queue Context Management */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 6d59f1bedcf2..e9f6c63c2a26 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -45,6 +45,14 @@
  */
 #define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	2000
 
+struct criu_svm_metadata {
+	struct list_head list;
+	__u64 start_addr;
+	__u64 size;
+	/* Variable length array of attributes */
+	struct kfd_ioctl_svm_attribute attrs[0];
+};
+
 static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
@@ -2753,6 +2761,7 @@ int svm_range_list_init(struct kfd_process *p)
 	INIT_DELAYED_WORK(&svms->restore_work, svm_range_restore_work);
 	INIT_WORK(&svms->deferred_list_work, svm_range_deferred_list_work);
 	INIT_LIST_HEAD(&svms->deferred_range_list);
+	INIT_LIST_HEAD(&svms->criu_svm_metadata_list);
 	spin_lock_init(&svms->deferred_list_lock);
 
 	for (i = 0; i < p->n_pdds; i++)
@@ -3418,6 +3427,96 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	return 0;
 }
 
+int svm_criu_prepare_for_resume(struct kfd_process *p,
+				struct kfd_criu_svm_range_priv_data *svm_priv)
+{
+	int nattr_common = 4, nattr_accessibility = 1;
+	struct criu_svm_metadata *criu_svm_md = NULL;
+	uint64_t svm_attrs_size, svm_object_md_size;
+	struct svm_range_list *svms = &p->svms;
+	int num_devices = p->n_pdds;
+	int i, ret = 0;
+
+	svm_attrs_size = sizeof(struct kfd_ioctl_svm_attribute) *
+		(nattr_common + nattr_accessibility * num_devices);
+	svm_object_md_size = sizeof(struct criu_svm_metadata) + svm_attrs_size;
+
+	criu_svm_md = kzalloc(svm_object_md_size, GFP_KERNEL);
+	if (!criu_svm_md) {
+		pr_err("failed to allocate memory to store svm metadata\n");
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	criu_svm_md->start_addr = svm_priv->start_addr;
+	criu_svm_md->size = svm_priv->size;
+	for (i = 0; i < svm_attrs_size; i++)
+	{
+		criu_svm_md->attrs[i].type = svm_priv->attrs[i].type;
+		criu_svm_md->attrs[i].value = svm_priv->attrs[i].value;
+	}
+
+	list_add_tail(&criu_svm_md->list, &svms->criu_svm_metadata_list);
+
+
+exit:
+	return ret;
+}
+
+int kfd_criu_restore_svm(struct kfd_process *p,
+			 uint8_t __user *user_priv_ptr,
+			 uint64_t *priv_data_offset,
+			 uint64_t max_priv_data_size)
+{
+	uint64_t total_size, accessibility_size, common_attr_size;
+	struct kfd_criu_svm_range_priv_data *svm_priv = NULL;
+	int nattr_common = 4, naatr_accessibility = 1;
+	uint32_t num_devices;
+	int ret = 0;
+
+	num_devices = p->n_pdds;
+	/* Handle one SVM range object at a time, also the number of gpus are
+	 * assumed to be same on the restore node, checking must be done while
+	 * evaluating the topology earlier */
+	common_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
+		nattr_common;
+	accessibility_size = sizeof(struct kfd_ioctl_svm_attribute) *
+		naatr_accessibility * num_devices;
+	total_size = sizeof(struct kfd_criu_svm_range_priv_data) +
+		common_attr_size + accessibility_size;
+
+	svm_priv = kvzalloc(total_size, GFP_KERNEL);
+	if (!svm_priv)
+		return -ENOMEM;
+
+	if (*priv_data_offset + total_size > max_priv_data_size) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = copy_from_user(svm_priv, user_priv_ptr + *priv_data_offset,
+			     total_size);
+	if (ret) {
+		ret = -EFAULT;
+		goto exit;
+	}
+	*priv_data_offset += total_size;
+
+	ret = svm_criu_prepare_for_resume(p, svm_priv);
+	if (ret) {
+		ret = -EFAULT;
+		pr_err("svm_criu_prepare_for_resume failed\n");
+		goto exit;
+	}
+
+
+exit:
+
+	kvfree(svm_priv);
+
+	return ret;
+}
+
 int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 		       uint64_t *svm_priv_data_size)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index b00576db5baa..e0c0853f085c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -191,6 +191,10 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
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
@@ -244,6 +248,14 @@ static inline int kfd_criu_checkpoint_svm(struct kfd_process *p,
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

