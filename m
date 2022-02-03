Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A04A811E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B371410EAFC;
	Thu,  3 Feb 2022 09:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F3110EA48;
 Thu,  3 Feb 2022 09:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNGc4f3JWzSn9yn3mQP0htPnst0XmJ9BxWQb7adYn/snUvbP0l+xCFm9x9JwopARY5Qi+RHw2HZOwEFXbfvphdotkeBSKGoC/5by6XJTauC2fSoC5pH46VM8bDOzRvDOcXOLdwUNs1F13jj6pQgkbI+HoKnCDogtqAAoyWXc3DBDunp6luARoHX8WktY++9CuQu5Do8MfdMsrTMHyaoBYCXmD2uKbmLtv6uZPmTMlC1+hHErOzMMI4xBopPns14145nuaJbQa/hc3mjpWDpipfNaQHKVJn23efS7SsO1zhuOAIihYoL40/Rc4p/ieiEQIc8YryCM1vPQVpngg3JdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VUGSDZgRiljzkkCQxu3xDHLxcmCn7YrvhwD3bcJVm8=;
 b=IMDA+miGvV9Ek8gsrA7IDcAdtoX2hgBzXn+Fnd7TonpQ44+q59cJQYkK1IJ68L93KjMLCGSKY1M5VtDtiGLYs8QUDkRXPBcJnmXL5YN2k/5Q8JVnIFe7QW+0Ubb8JnYK8FBTQMcqzU1tflnLze6XWoBKW+2CHy6z6ShHHzbq9fmBRC6oe6ThWSVkHyqLCD6yDcmGUSU0ei6MHQWH+fMPSNvTtLb0KIblgurdRwuC9lHLeG5eMDwIh//TJLOnVTcRZmXjL/e4VGn6/wRAk5jsnycyIlKgJB26fJfQhQNfBj6LigPozDTaGSKJlQDG7qcva1mrbjvQHlfkC5Q9vYmgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VUGSDZgRiljzkkCQxu3xDHLxcmCn7YrvhwD3bcJVm8=;
 b=Sj+VnpUVknzkVKFp9CGeBUP7HnTA6dKsc8w16fZQKFdutb6FlChuisl5xe6uqz90V7lHww85LTEsMH6ZxsqpHK+gIJl4ekepmm+sNDd954I+edvHPNQkFLeNzghC59V1+D00UrrJ/FtAYtRJUCZ2ADRn5t+pXTId5ernV6iWyoQ=
Received: from BN9PR03CA0368.namprd03.prod.outlook.com (2603:10b6:408:f7::13)
 by MN2PR12MB4656.namprd12.prod.outlook.com (2603:10b6:208:182::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 3 Feb
 2022 09:09:45 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::56) by BN9PR03CA0368.outlook.office365.com
 (2603:10b6:408:f7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:45 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:43 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 21/24] drm/amdkfd: CRIU Save Shared Virtual Memory ranges
Date: Thu, 3 Feb 2022 04:09:15 -0500
Message-ID: <20220203090918.11520-22-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b06ece78-5464-4e32-ee9e-08d9e6f4ebdd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4656:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4656F4392A46807340E418C4FE289@MN2PR12MB4656.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w5pY4ONlPvHV8YQERLa4C35m1QW9ph+wfu/9ohu230OftgxhinHEQSXPYa/zxUsiRyix5I0QaigrzXVFZTuJnWQS6JWl+yfbAZFcEJaWlXR/mdu5OxuWvCvwmuwNoJZbk1d7SdixLuipl/SS8DH9fvCe0GB1z2xE9lyNJFdc1PNCHatjmycMeLLFRu+mVQYFSCgok7/EEEPox0cI2HeSJTFAILcsajAXOn9k/Yi60xxmZwJeOv+u8TMn81sH2CtpNdWRr9pvo26f2sWWxOdDPDir6IZupFuVi8ml2eQp+ZUF8TUwSLsBJ8VFga9evYytqMsWFPYzToMEBSUXeh95Hi7pwoMF0mMqbqhOBoDub9cDAPWjjyv9mtb4hz45IYWChdBvrozJk4/QmQI9gIl+qUyjmWQPyHSiPRlt28r6Dm9Wzu18GH/bXp4Ahu2YMAaCHrd5bLcx/Xda2WNRIW52VTN3dIAXLRR7eMGEDakGoBOomMapMeyNSz0MMk5fyKtUn59PiDd9US6lsB6fv1xhJ9nRn36hvf9msM3z9D6PKiOnoH4fn52wYcRZvHbjCYgswidsX9puecMfGUsQS54Mx2hm4H/8WWc6wBF2bk+tpUbvOmKqs3eWlNS7KqV6X0Ho091/LqRzQLqPS+QeTYc/hL3464rovTpp5DyAIgM6YU39oChbz0ozgwjOlZcmXHqh0dL2GDbyJ70ATdvYheGIpm8CtAOiHIiI9hSB578MxQiJIhs0r3MCpMSnrRZ/wtjBAXmU9W5Nj5hKSXCOlf46QthN8yVmYU8VnbIxh8XKmC4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(36840700001)(46966006)(508600001)(8936002)(36860700001)(36756003)(40460700003)(426003)(16526019)(47076005)(6916009)(26005)(336012)(8676002)(44832011)(81166007)(2906002)(5660300002)(1076003)(316002)(7696005)(186003)(70206006)(82310400004)(356005)(70586007)(4326008)(54906003)(83380400001)(450100002)(6666004)(2616005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:45.2609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b06ece78-5464-4e32-ee9e-08d9e6f4ebdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4656
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

During checkpoint stage, save the shared virtual memory ranges and
attributes for the target process. A process may contain a number of svm
ranges and each range might contain a number of attributes. While not
all attributes may be applicable for a given prange but during
checkpoint we store all possible values for the max possible attribute
types.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 95 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 10 +++
 3 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a755ea68a428..721c86ceba22 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2196,7 +2196,9 @@ static int criu_checkpoint(struct file *filep,
 		if (ret)
 			goto close_bo_fds;
 
-		/* TODO: Dump SVM-Ranges */
+		ret = kfd_criu_checkpoint_svm(p, (uint8_t __user *)args->priv_data, &priv_offset);
+		if (ret)
+			goto close_bo_fds;
 	}
 
 close_bo_fds:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 64cd7712c098..7cf63995c079 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3540,6 +3540,101 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 	return 0;
 }
 
+int kfd_criu_checkpoint_svm(struct kfd_process *p,
+			    uint8_t __user *user_priv_data,
+			    uint64_t *priv_data_offset)
+{
+	struct kfd_criu_svm_range_priv_data *svm_priv = NULL;
+	struct kfd_ioctl_svm_attribute *query_attr = NULL;
+	uint64_t svm_priv_data_size, query_attr_size = 0;
+	int index, nattr_common = 4, ret = 0;
+	struct svm_range_list *svms;
+	int num_devices = p->n_pdds;
+	struct svm_range *prange;
+	struct mm_struct *mm;
+
+	svms = &p->svms;
+	if (!svms)
+		return -EINVAL;
+
+	mm = get_task_mm(p->lead_thread);
+	if (!mm) {
+		pr_err("failed to get mm for the target process\n");
+		return -ESRCH;
+	}
+
+	query_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
+				(nattr_common + num_devices);
+
+	query_attr = kzalloc(query_attr_size, GFP_KERNEL);
+	if (!query_attr) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	query_attr[0].type = KFD_IOCTL_SVM_ATTR_PREFERRED_LOC;
+	query_attr[1].type = KFD_IOCTL_SVM_ATTR_PREFETCH_LOC;
+	query_attr[2].type = KFD_IOCTL_SVM_ATTR_SET_FLAGS;
+	query_attr[3].type = KFD_IOCTL_SVM_ATTR_GRANULARITY;
+
+	for (index = 0; index < num_devices; index++) {
+		struct kfd_process_device *pdd = p->pdds[index];
+
+		query_attr[index + nattr_common].type =
+			KFD_IOCTL_SVM_ATTR_ACCESS;
+		query_attr[index + nattr_common].value = pdd->user_gpu_id;
+	}
+
+	svm_priv_data_size = sizeof(*svm_priv) + query_attr_size;
+
+	svm_priv = kzalloc(svm_priv_data_size, GFP_KERNEL);
+	if (!svm_priv) {
+		ret = -ENOMEM;
+		goto exit_query;
+	}
+
+	index = 0;
+	list_for_each_entry(prange, &svms->list, list) {
+
+		svm_priv->object_type = KFD_CRIU_OBJECT_TYPE_SVM_RANGE;
+		svm_priv->start_addr = prange->start;
+		svm_priv->size = prange->npages;
+		memcpy(&svm_priv->attrs, query_attr, query_attr_size);
+		pr_debug("CRIU: prange: 0x%p start: 0x%lx\t npages: 0x%llx end: 0x%llx\t size: 0x%llx\n",
+			 prange, prange->start, prange->npages,
+			 prange->start + prange->npages - 1,
+			 prange->npages * PAGE_SIZE);
+
+		ret = svm_range_get_attr(p, mm, svm_priv->start_addr,
+					 svm_priv->size,
+					 (nattr_common + num_devices),
+					 svm_priv->attrs);
+		if (ret) {
+			pr_err("CRIU: failed to obtain range attributes\n");
+			goto exit_priv;
+		}
+
+		ret = copy_to_user(user_priv_data + *priv_data_offset,
+				   svm_priv, svm_priv_data_size);
+		if (ret) {
+			pr_err("Failed to copy svm priv to user\n");
+			goto exit_priv;
+		}
+
+		*priv_data_offset += svm_priv_data_size;
+
+	}
+
+
+exit_priv:
+	kfree(svm_priv);
+exit_query:
+	kfree(query_attr);
+exit:
+	mmput(mm);
+	return ret;
+}
+
 int
 svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index f052b6022e76..f36c2fa8469a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -185,6 +185,9 @@ void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm,
 			void *owner);
 int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 		       uint64_t *svm_priv_data_size);
+int kfd_criu_checkpoint_svm(struct kfd_process *p,
+			    uint8_t __user *user_priv_data,
+			    uint64_t *priv_offset);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -231,6 +234,13 @@ static inline int svm_range_get_info(struct kfd_process *p,
 	return 0;
 }
 
+static inline int kfd_criu_checkpoint_svm(struct kfd_process *p,
+					  uint8_t __user *user_priv_data,
+					  uint64_t *priv_offset)
+{
+	return 0;
+}
+
 #define KFD_IS_SVM_API_SUPPORTED(dev) false
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
-- 
2.17.1

