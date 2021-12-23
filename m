Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FBD47DC3A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1111C10E1FC;
	Thu, 23 Dec 2021 00:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0CC10E18F;
 Thu, 23 Dec 2021 00:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3JwHL+ULlmWFcIKedy8scCfbr6grWeDdoUoHByX5vEGClaVGqryt3MAhC1CRSeZ3lLh5Pm1B/4Oo0QzcrEYFeS8v48fLOIrulTuxmvJc5M4Ih4AfgvnFugzCEsyKkZgGZ0LSZtl8ZpbsWBpkGGHTsGUSyHZF5gWuq9sURQ11FdTpGeVjWuv/oMWx2tHKe4j5qoKIqHxQY93INZtEgFX0ZTJ4pt3T72TQVMwYDEGEhzqsQ8XXYrIhwoCssFT2gx0jDQfE5TKwb5Bcg57s98W/LEGGKXMU34J6/hCBUqWcXNjv/ULR1pU+ZmQYSINf44cdqyKA6f30BCR9CqrScj6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exyk6wCapbg0q1CXlkt+6LsugRc4lY81PS77/6F+i1c=;
 b=c9Fgx27j3FcYe4SmRNEMmrXz6Ckx2N78QrbRlE38DgufFK9RpARO0Az3fA3uIqreil6ybaE43sDeZ7WjcmqSRkMa8FqtOYt6m8zScDH1jzD07xPNP4noWMDFuc/ZhRT2r75GcuINSS7gGo2CtAcnYJg2EOXZ4hZIwhnNX5855LCDV/KbJP0HjxO5tW9bJALQW7Hmt2nz4+ifKPtt5GZkXWIVnvpnI+LIEpPowSzFQQ4ZfJ2/DhLabXwXeLQ+fTxE5kqjr3hzD85mhEn5fOm2Wavs6Yis0od9t0oq3gFJyAPPgQaFL49uYjZbCH6+a17f6Ir7JYC9nodX0kK9vmudpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exyk6wCapbg0q1CXlkt+6LsugRc4lY81PS77/6F+i1c=;
 b=YUHC8svU/LMD3AuJFT4XoelDkkyP02HNnH83q5Wgq1AkcDPWH7SsJ5dVIkZyJu08jKJK3TIbPZW/EC1RP5dSPJtin6CeKciQ1B2IJeViNOtZbSfGe+FhutD6x0llcnTpx2QMp83l6rJOm7XUDOeEj5iOfOKiFK5GlSQSfEhSv6I=
Received: from BN9PR03CA0538.namprd03.prod.outlook.com (2603:10b6:408:131::33)
 by BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 00:37:37 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::62) by BN9PR03CA0538.outlook.office365.com
 (2603:10b6:408:131::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:37 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:36 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 21/24] drm/amdkfd: CRIU Discover svm ranges
Date: Wed, 22 Dec 2021 19:37:08 -0500
Message-ID: <20211223003711.13064-22-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 751fc4fb-614e-478c-849a-08d9c5ac6b36
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5112A9F645D1A89DBD4C28C8FE7E9@BL1PR12MB5112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W7JkFTherKZ4rXWHDW8o1Tgp+NID7B2qedRgg4pFdwtA1l/OBEbWzOEFvpS1n9tP3diVc5jwsGeJvNN7H5c4fSDermZx5jAahSVsTUcNDRqK5HQpVpim9Hg1+SvU30TbogRdRU+5odq0cjfGSNVyXN6Mb8OLiAQbgWj6mDiV4tpjAk5hyZcH+RTPrzXKPfwCSurKXCK3FoQ49V+5p1X4ola2qQXTIrM45yPLKYWgYUnQSFA2HAqhlJqhcx3iDPT5CEryp+ROCS7PabmjDUVkru8w12DlBaTdLF9QnBckM2BuzrvsfntMXRD/X5t1ltlR1Fsnccy3zC3B++mxg2D+9ffXZDS/SQMIvypozxnrJOm1YXHo5k4qYRRcWWPgyYmFRc2sV5yD0uQf9de/mdt/XLp5zUFOrRcbm+cGVzgwyaeW/hr9/okyNfq5ZwgCNNP/j1COIiLqhOGcRhEdrijtbijN0cBzS2PzdPckSuM3BxFlQggqkK20vuNy8PczILC5MTQKNmqYT3WKY1E9Ot9NgYZ3SlUizo19Z45YZkUNtmj6uSCSkzNf8epfluwQd3PW2MC0MgJffrMk+X7z3KIyXUBClf+G6r/a8gqaTo3OIic3qsXsW0zwkLxwnJDtvRhBCP292F125N1ZzWGPq8p7KXnz+d9EzuNBlkqO+6lm3taVV9I1dt/0vYydmKs4yeNp9IiJmQIgFY3kxeSEJDRIHuzk8jpFRO3jTJyy9256bZ6JykQE+JRfLVNppBX8AgsdKGlJCgCsYFG9EfU7b7ptYrDi5loVuSLJtZyBsticBzo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(4326008)(47076005)(186003)(7696005)(8676002)(8936002)(316002)(16526019)(2906002)(508600001)(26005)(110136005)(83380400001)(81166007)(36756003)(70586007)(36860700001)(6666004)(86362001)(2616005)(1076003)(5660300002)(54906003)(82310400004)(70206006)(356005)(336012)(44832011)(40460700001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:37.2948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 751fc4fb-614e-478c-849a-08d9c5ac6b36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5112
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

A KFD process may contain a number of virtual address ranges for shared
virtual memory management and each such range can have many SVM
attributes spanning across various nodes within the process boundary.
This change reports the total number of such SVM ranges and
their total private data size by extending the PROCESS_INFO op of the the
CRIU IOCTL to discover the svm ranges in the target process and a future
patches brings in the required support for checkpoint and restore for
SVM ranges.


Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 60 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 11 +++++
 4 files changed, 82 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 446eb9310915..1c25d5e9067c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2089,10 +2089,9 @@ static int criu_get_process_object_info(struct kfd_process *p,
 					uint32_t *num_objects,
 					uint64_t *objs_priv_size)
 {
-	int ret;
-	uint64_t priv_size;
+	uint64_t queues_priv_data_size, svm_priv_data_size, priv_size;
 	uint32_t num_queues, num_events, num_svm_ranges;
-	uint64_t queues_priv_data_size;
+	int ret;
 
 	*num_devices = p->n_pdds;
 	*num_bos = get_process_num_bos(p);
@@ -2102,7 +2101,10 @@ static int criu_get_process_object_info(struct kfd_process *p,
 		return ret;
 
 	num_events = kfd_get_num_events(p);
-	num_svm_ranges = 0; /* TODO: Implement SVM-Ranges */
+
+	ret = svm_range_get_info(p, &num_svm_ranges, &svm_priv_data_size);
+	if (ret)
+		return ret;
 
 	*num_objects = num_queues + num_events + num_svm_ranges;
 
@@ -2112,7 +2114,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
 		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
 		priv_size += queues_priv_data_size;
 		priv_size += num_events * sizeof(struct kfd_criu_event_priv_data);
-		/* TODO: Add SVM ranges priv size */
+		priv_size += svm_priv_data_size;
 		*objs_priv_size = priv_size;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index d72dda84c18c..87eb6739a78e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1082,7 +1082,10 @@ enum kfd_criu_object_type {
 
 struct kfd_criu_svm_range_priv_data {
 	uint32_t object_type;
-	uint64_t reserved;
+	uint64_t start_addr;
+	uint64_t size;
+	/* Variable length array of attributes */
+	struct kfd_ioctl_svm_attribute attrs[0];
 };
 
 struct kfd_criu_queue_priv_data {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7c92116153fe..49e05fb5c898 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3418,6 +3418,66 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	return 0;
 }
 
+int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
+		       uint64_t *svm_priv_data_size)
+{
+	uint64_t total_size, accessibility_size, common_attr_size;
+	int nattr_common = 4, naatr_accessibility = 1;
+	int num_devices = p->n_pdds;
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	uint32_t count = 0;
+
+	*svm_priv_data_size = 0;
+
+	svms = &p->svms;
+	if (!svms)
+		return -EINVAL;
+
+	mutex_lock(&svms->lock);
+	list_for_each_entry(prange, &svms->list, list) {
+		pr_debug("prange: 0x%p start: 0x%lx\t npages: 0x%llx\t end: 0x%llx\n",
+			 prange, prange->start, prange->npages,
+			 prange->start + prange->npages - 1);
+		count++;
+	}
+	mutex_unlock(&svms->lock);
+
+	*num_svm_ranges = count;
+	/* Only the accessbility attributes need to be queried for all the gpus
+	 * individually, remaining ones are spanned across the entire process
+	 * regardless of the various gpu nodes. Of the remaining attributes,
+	 * KFD_IOCTL_SVM_ATTR_CLR_FLAGS need not be saved.
+	 *
+	 * KFD_IOCTL_SVM_ATTR_PREFERRED_LOC
+	 * KFD_IOCTL_SVM_ATTR_PREFETCH_LOC
+	 * KFD_IOCTL_SVM_ATTR_SET_FLAGS
+	 * KFD_IOCTL_SVM_ATTR_GRANULARITY
+	 *
+	 * ** ACCESSBILITY ATTRIBUTES **
+	 * (Considered as one, type is altered during query, value is gpuid)
+	 * KFD_IOCTL_SVM_ATTR_ACCESS
+	 * KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE
+	 * KFD_IOCTL_SVM_ATTR_NO_ACCESS
+	 */
+	if (*num_svm_ranges > 0)
+	{
+		common_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
+			nattr_common;
+		accessibility_size = sizeof(struct kfd_ioctl_svm_attribute) *
+			naatr_accessibility * num_devices;
+
+		total_size = sizeof(struct kfd_criu_svm_range_priv_data) +
+			common_attr_size + accessibility_size;
+
+		*svm_priv_data_size = *num_svm_ranges * total_size;
+	}
+
+	pr_debug("num_svm_ranges %u total_priv_size %llu\n", *num_svm_ranges,
+		 *svm_priv_data_size);
+	return 0;
+}
+
 int
 svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 6dc91c33e80f..c8c1251920d4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -186,6 +186,8 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 void svm_range_free_dma_mappings(struct svm_range *prange);
 void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm,
 			void *owner);
+int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
+		       uint64_t *svm_priv_data_size);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -223,6 +225,15 @@ static inline int svm_range_schedule_evict_svm_bo(
 	return -EINVAL;
 }
 
+static inline int svm_range_get_info(struct kfd_process *p,
+				     uint32_t *num_svm_ranges,
+				     uint64_t *svm_priv_data_size)
+{
+	*num_svm_ranges = 0;
+	*svm_priv_data_size = 0;
+	return 0;
+}
+
 #define KFD_IS_SVM_API_SUPPORTED(dev) false
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
-- 
2.17.1

