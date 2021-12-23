Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A3A47DC2B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E2D10E18F;
	Thu, 23 Dec 2021 00:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECA510E197;
 Thu, 23 Dec 2021 00:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPqR9+ykj0pBJgc4HftSdvqAdh+MBIPQGInFvgz2LeOja4RP1jffM4ENng2G2lRWX75v+j994NtBaksXHt3XsDU06wlqwquOL6bNhoOXEHtZhu7MSoBQJxtvmV6mJAuOlXWwZxUWLI8sQ4tmJhrfA+js/xmx67KBGcSsh4schhbyUFbmMxsf/U2x9Jk5kN3iu/YwTyoBl4w4vqoXTaAONcf/SOrM+/7cuhQlMwcLZPhcWAoECY8qoHgfUNlIDY7Hly/VIeWWCwKByTeyFIMAr67J5I64DoIOTtrUyF9p0zl+qk2BhygGoKcshExDNR6aBW/n2LBSHnzx3o5O/HAS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+odl/8V36AMeeL4PdQ2pkDdYq9QayvzJOFW8MbaX9o=;
 b=XMoG7qQPK+9sEqG73AlVoE5Q+RkvInD2LYEQHXP08ywGhUyNLMhT4ay4pYILR7rH24gSJeq7OGLZzPQVg/qCko2zy1qIBjGm6a7ZWsWBDSN3WmWNMxXW1oMva5bWmwnNV3T0BPh/Klvse4EKVX3cnAMWvxSYxqd2MqLiI8HQqdi5MTyr/GcVaBUpPBWQcD9DikeX+HumcNkJyqTDaoP9ZhCZWcjBO23bikGQfA9LlyOSc1LGLhwKZJdi9d1tJryvIh/0gyMwle7VX3bPFb3nljsU0+ok8OSwzevrm0IlfzQZf2+HhiAI24KeJWqKajG3lpfJlCk9L7F7RvLIQWSSbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+odl/8V36AMeeL4PdQ2pkDdYq9QayvzJOFW8MbaX9o=;
 b=Gmk4TKoLfFgCBJmTaS88cG3D5XCLglvMH/U6d1J4QXqfv9aIGpDuQ9thVlZWCqLpIzMO6PukYCeD2eKV6XulvhVhJtaknVx/oB3KVvxa5Abyf/zLNz2KtYnVo8UA4ZB5I0WAOPytPejSAC3Hg0oqRG4kCaAK0FcBu+OGKT9Mfeo=
Received: from BN9PR03CA0534.namprd03.prod.outlook.com (2603:10b6:408:131::29)
 by MW2PR12MB2585.namprd12.prod.outlook.com (2603:10b6:907:3::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 23 Dec
 2021 00:37:43 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::83) by BN9PR03CA0534.outlook.office365.com
 (2603:10b6:408:131::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
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
Subject: [Patch v4 24/24] drm/amdkfd: CRIU resume shared virtual memory ranges
Date: Wed, 22 Dec 2021 19:37:11 -0500
Message-ID: <20211223003711.13064-25-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2acf0f01-5adf-4e94-7a98-08d9c5ac6bf0
X-MS-TrafficTypeDiagnostic: MW2PR12MB2585:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2585A02977C6D3961EDB8D8CFE7E9@MW2PR12MB2585.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8f1P/DaWuJWDkpzePyk0GJQh2rsUvf94QUGaij4WD8IKUFWXRQCz7WYec3wRqTIDUjMmFfAU89NMlB7AERqc3Ko8c5h/hCn8MbaxnGYuaOH9mQZ+dGQOo7QDdpq/Qf7LgNpB/QiGHdfzHFTj16mvZ22JLv03IZNVjaYaTHGKmpL/ltvIunwcao9wjOStvnHa7MxZM9DZ0Hmuz35dFLVoihwgrViBQbUSng6LuthfOHa8zTYe5+CSHzJiQLbBg0j86WrTNaY3R95VZ+VG5DIULIm7TGR3BHGRHXUiJcfSpbvabfjyhQIn02WgXLNxviOkGUl2vL3Pt0ioyOr852vwsgUxr4ONQMDTfREd9Hbz2+xfs8xr00XawVT7NmPtcZY00FS1hDYQWvTzO44mXw295ttTQOg2yJXPEnR6rOye0D7M6CC0Tq054VoijFJHqDZ3jRmKFOULqQKdLUrUWNYqbM90kxINTczY6bZ0la8tyIEKvbGYXVyrjDtKcua3M3o1a24xoAXwaxR6TmZWcipkJx3Zi8R6jAUobFywZs+5HWhUoTkands6EaqywtGL/6/tZSkKn5ovm1BPjVxQZ0Qr+ofS7eJMWaFio3DGV98Yj475xTADj+frrjLCxHzHNE+WMEsWCZ3PMJaXgUZgBQQvg/ayiiEkisToj0bg9C3jXgQOnNCmx38Dx/7owmTTD/wrWRow6jv+vGOkU8KSn9GKPh8Qf5dGwJNzXNxDq+gzZoNDZJPivXdx8SADHQQBSiRW6BmaFXsv3wMRYN6869utFphS/Zdqre5ER0+9jrfN6Yg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(7696005)(16526019)(186003)(44832011)(110136005)(40460700001)(26005)(36756003)(1076003)(6666004)(8676002)(70206006)(54906003)(36860700001)(508600001)(4326008)(70586007)(82310400004)(8936002)(426003)(5660300002)(83380400001)(86362001)(316002)(47076005)(2616005)(2906002)(336012)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:38.5136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acf0f01-5adf-4e94-7a98-08d9c5ac6bf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2585
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

In CRIU resume stage, resume all the shared virtual memory ranges from
the data stored inside the resuming kfd process during CRIU restore
phase. Also setup xnack mode and free up the resources.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 10 +++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 55 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  6 +++
 3 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index f7aa15b18f95..6191e37656dd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2759,7 +2759,17 @@ static int criu_resume(struct file *filep,
 	}
 
 	mutex_lock(&target->mutex);
+	ret = kfd_criu_resume_svm(target);
+	if (ret) {
+		pr_err("kfd_criu_resume_svm failed for %i\n", args->pid);
+		goto exit;
+	}
+
 	ret =  amdgpu_amdkfd_criu_resume(target->kgd_process_info);
+	if (ret)
+		pr_err("amdgpu_amdkfd_criu_resume failed for %i\n", args->pid);
+
+exit:
 	mutex_unlock(&target->mutex);
 
 	kfd_unref_process(target);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index e9f6c63c2a26..bd2dce37f345 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3427,6 +3427,61 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	return 0;
 }
 
+int kfd_criu_resume_svm(struct kfd_process *p)
+{
+	int nattr_common = 4, nattr_accessibility = 1;
+	struct criu_svm_metadata *criu_svm_md = NULL;
+	struct criu_svm_metadata *next = NULL;
+	struct svm_range_list *svms = &p->svms;
+	int i, j, num_attrs, ret = 0;
+	struct mm_struct *mm;
+
+	if (list_empty(&svms->criu_svm_metadata_list)) {
+		pr_debug("No SVM data from CRIU restore stage 2\n");
+		return ret;
+	}
+
+	mm = get_task_mm(p->lead_thread);
+	if (!mm) {
+		pr_err("failed to get mm for the target process\n");
+		return -ESRCH;
+	}
+
+	num_attrs = nattr_common + (nattr_accessibility * p->n_pdds);
+
+	i = j = 0;
+	list_for_each_entry(criu_svm_md, &svms->criu_svm_metadata_list, list) {
+		pr_debug("criu_svm_md[%d]\n\tstart: 0x%llx size: 0x%llx (npages)\n",
+			 i, criu_svm_md->start_addr, criu_svm_md->size);
+		for (j = 0; j < num_attrs; j++) {
+			pr_debug("\ncriu_svm_md[%d]->attrs[%d].type : 0x%x \ncriu_svm_md[%d]->attrs[%d].value : 0x%x\n",
+				 i,j, criu_svm_md->attrs[j].type,
+				 i,j, criu_svm_md->attrs[j].value);
+		}
+
+		ret = svm_range_set_attr(p, mm, criu_svm_md->start_addr,
+					 criu_svm_md->size, num_attrs,
+					 criu_svm_md->attrs);
+		if (ret) {
+			pr_err("CRIU: failed to set range attributes\n");
+			goto exit;
+		}
+
+		i++;
+	}
+
+exit:
+	list_for_each_entry_safe(criu_svm_md, next, &svms->criu_svm_metadata_list, list) {
+		pr_debug("freeing criu_svm_md[]\n\tstart: 0x%llx\n",
+						criu_svm_md->start_addr);
+		kfree(criu_svm_md);
+	}
+
+	mmput(mm);
+	return ret;
+
+}
+
 int svm_criu_prepare_for_resume(struct kfd_process *p,
 				struct kfd_criu_svm_range_priv_data *svm_priv)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index e0c0853f085c..3b5bcb52723c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -195,6 +195,7 @@ int kfd_criu_restore_svm(struct kfd_process *p,
 			 uint8_t __user *user_priv_ptr,
 			 uint64_t *priv_data_offset,
 			 uint64_t max_priv_data_size);
+int kfd_criu_resume_svm(struct kfd_process *p);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -256,6 +257,11 @@ static inline int kfd_criu_restore_svm(struct kfd_process *p,
 	return -EINVAL;
 }
 
+static inline int kfd_criu_resume_svm(struct kfd_process *p)
+{
+	return 0;
+}
+
 #define KFD_IS_SVM_API_SUPPORTED(dev) false
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
-- 
2.17.1

