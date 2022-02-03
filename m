Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB754A8119
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D04910EB32;
	Thu,  3 Feb 2022 09:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0795910EA18;
 Thu,  3 Feb 2022 09:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N66+T+jHa+wlAZPHMqL+p2sz8RbdMtIYPxfwEma9MX4MdcMAMtOuV5PLdiL1Vxa+c7+wj617dWnNvCY/h9Pug+3Cms3pDReSEFRQ+wfQmtvId1NUJRrb4y70torY1Wjxrf/enMfmvODhUVfcyoinl9xTKAMosrcNmyeGgVKQfmke28zdch+x4lRbAG58R0gXqdJBVHETbHvnB2cGh/CVPI8Ez9smRrNXjH8aW1anzwBnZ6uZMWZV/rIA1Zjaz8HD9JosYP2IQC0iERl0HDIcMx9gIF8NxfNsArPZAfHC41ci/jHU5kaa213N4H8hFbs3spLdpG0UmiTsQv52AvEBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akNoJMjdH9f7x4FPDA5HBfTTKVt9CMBPodh9kOvw3uw=;
 b=C4SVqSSwTMTWZ2Afkq8bBOY+xnoghkf/9+faPmXQvAbKdINqtaSUB8zhiLeTAZybeJ6+cMD63Anlpq3Q9heKL7M15k+xr3aqujYcNsAeRXlgVO+R+ijyBzJSWEIPJHmOGaFTkrcctAUyJkOVx4jHRzicbaTZTanj85KcCOM3nPZ+XvmJP63Ve73OQCHiPeRrivX02b9tgZp7jziin7WHE1Ki0XmyZWsKyCyo8V3+q5EV9lQCUITnBSfgXXFy2NDCt23nUfK7EjoRh22nUQCUbVWTqGqMAs+CIMqFuj/Yzv/+VKU5+sQFwxRHJp2yc0YG9hocyFpIuTnW8o+VdWM6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akNoJMjdH9f7x4FPDA5HBfTTKVt9CMBPodh9kOvw3uw=;
 b=XyDY8QrQm7AJ/2EWTIF8le30xkt4wQczuf48hKg5ZcnQT7RBIyoKODlNabQ698tp2/rRTwnefGKIo4hG/3TNimeKFjfZLGJ6HzoK0eNl9P5nVOm32KqqcHn6ENpZAE5vR3olRzosACQmaHxJraooYnXXELblkvlOFtD/fGgZrRY=
Received: from BN6PR11CA0058.namprd11.prod.outlook.com (2603:10b6:404:f7::20)
 by DM4PR12MB5231.namprd12.prod.outlook.com (2603:10b6:5:39b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:46 +0000
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
Subject: [Patch v5 23/24] drm/amdkfd: CRIU resume shared virtual memory ranges
Date: Thu, 3 Feb 2022 04:09:17 -0500
Message-ID: <20220203090918.11520-24-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: cf6a6b15-98fe-476c-2562-08d9e6f4ec1e
X-MS-TrafficTypeDiagnostic: DM4PR12MB5231:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5231DF24E22889F03309DCDDFE289@DM4PR12MB5231.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FsRo9e+YTJQ4vZLOoeAxg/R85iIa713JhwsyBq/AjkrW4YI3t03yZ5zNRxqR9bPCSR/+SMKwKmKz0GiaF29xf1ugVoJoM0TbNqmJ1doQj6qum+iaWT7ZQ3Fuy+y/4PCC9wd95nYTygj8olIaFGV1Lns2Gi26BkbL2wj33dpzba5K+SRsda76J1auiOvx5IaWbzifTHgb9Ko+aZ1G4cTfp6Wp4SIU/NlFenwW+W6onUOpcW8Neuz++7OQu92GYCtWZFSmc9thkzhcis1FCAF496UbqqPO4IZhmTuUToU6WKLCx7ETvvfbuDzhpaBYlskjXd5BiYi8lDv76/diOqsescEXYIXnVzhYQ0eH5WCIG3r6TLuD4hoJL7WwVOVJ8vNQaT6dDr2+jXul1y8h3CX8VzI7NN719SJYXQqJfPHE1btuvoV5x12inYzGOZ5Hk7suxMkmWBpfkiAHvlPkVV52WF2bzmC5FrXDmT5vy8dyeVShvvi0qBzBya5Wnta6homvAYt8NfcU3hrWr9pXht6hJxuiKwRF6AH0gd4be4zg1XNW/mr/OiUSA2wj55vpq64llX2Ie8Pr/QDSDhPjFVKMsPJC8E2zOaWFNLeDOZL0qzx+YxCh2/J69vWhxhXphHr1CClWS7ji6a+CjJ4qNfKiKuDZ1ZjZx1OKKEa0KOifZs7EcKTxdbN8EeDGW16csgmQTCYtn0Ve8+9UHWe/vHw38g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(16526019)(186003)(26005)(1076003)(2616005)(426003)(336012)(82310400004)(508600001)(316002)(86362001)(70206006)(70586007)(8936002)(7696005)(4326008)(8676002)(450100002)(6666004)(44832011)(81166007)(356005)(2906002)(6916009)(54906003)(47076005)(83380400001)(36860700001)(40460700003)(36756003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:45.6661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6a6b15-98fe-476c-2562-08d9e6f4ec1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5231
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

In CRIU resume stage, resume all the shared virtual memory ranges from
the data stored inside the resuming kfd process during CRIU restore
phase. Also setup xnack mode and free up the resources.

KFD_IOCTL_SVM_ATTR_CLR_FLAGS is not available for querying via get_attr
interface but we must clear the flags during restore as there might be
some default flags set when the prange is created. Also handle the
invalid PREFETCH atribute values saved during checkpoint by replacing
them with another dummy KFD_IOCTL_SVM_ATTR_SET_FLAGS attribute.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  10 +++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 102 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   6 ++
 3 files changed, 118 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index c143f242a84d..64e3b4e3a712 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2766,7 +2766,17 @@ static int criu_resume(struct file *filep,
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
index 41ac049b3316..30ae21953da5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3487,6 +3487,108 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	return 0;
 }
 
+int kfd_criu_resume_svm(struct kfd_process *p)
+{
+	struct kfd_ioctl_svm_attribute *set_attr = NULL;
+	int nattr_common = 4, nattr_accessibility = 1;
+	struct criu_svm_metadata *criu_svm_md = NULL;
+	struct svm_range_list *svms = &p->svms;
+	struct criu_svm_metadata *next = NULL;
+	uint32_t set_flags = 0xffffffff;
+	int i, j, num_attrs, ret = 0;
+	uint64_t set_attr_size;
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
+			 i, criu_svm_md->data.start_addr, criu_svm_md->data.size);
+
+		for (j = 0; j < num_attrs; j++) {
+			pr_debug("\ncriu_svm_md[%d]->attrs[%d].type : 0x%x \ncriu_svm_md[%d]->attrs[%d].value : 0x%x\n",
+				 i,j, criu_svm_md->data.attrs[j].type,
+				 i,j, criu_svm_md->data.attrs[j].value);
+			switch (criu_svm_md->data.attrs[j].type) {
+			/* During Checkpoint operation, the query for
+			 * KFD_IOCTL_SVM_ATTR_PREFETCH_LOC attribute might
+			 * return KFD_IOCTL_SVM_LOCATION_UNDEFINED if they were
+			 * not used by the range which was checkpointed. Care
+			 * must be taken to not restore with an invalid value
+			 * otherwise the gpuidx value will be invalid and
+			 * set_attr would eventually fail so just replace those
+			 * with another dummy attribute such as
+			 * KFD_IOCTL_SVM_ATTR_SET_FLAGS.
+			 */
+			case KFD_IOCTL_SVM_ATTR_PREFETCH_LOC:
+				if (criu_svm_md->data.attrs[j].value ==
+				    KFD_IOCTL_SVM_LOCATION_UNDEFINED) {
+					criu_svm_md->data.attrs[j].type =
+						KFD_IOCTL_SVM_ATTR_SET_FLAGS;
+					criu_svm_md->data.attrs[j].value = 0;
+				}
+				break;
+			case KFD_IOCTL_SVM_ATTR_SET_FLAGS:
+				set_flags = criu_svm_md->data.attrs[j].value;
+				break;
+			default:
+				break;
+			}
+		}
+
+		/* CLR_FLAGS is not available via get_attr during checkpoint but
+		 * it needs to be inserted before restoring the ranges so
+		 * allocate extra space for it before calling set_attr
+		 */
+		set_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
+						(num_attrs + 1);
+		set_attr = krealloc(set_attr, set_attr_size,
+					    GFP_KERNEL);
+		if (!set_attr) {
+			ret = -ENOMEM;
+			goto exit;
+		}
+
+		memcpy(set_attr, criu_svm_md->data.attrs, num_attrs *
+					sizeof(struct kfd_ioctl_svm_attribute));
+		set_attr[num_attrs].type = KFD_IOCTL_SVM_ATTR_CLR_FLAGS;
+		set_attr[num_attrs].value = ~set_flags;
+
+		ret = svm_range_set_attr(p, mm, criu_svm_md->data.start_addr,
+					 criu_svm_md->data.size, num_attrs + 1,
+					 set_attr);
+		if (ret) {
+			pr_err("CRIU: failed to set range attributes\n");
+			goto exit;
+		}
+
+		i++;
+	}
+exit:
+	kfree(set_attr);
+	list_for_each_entry_safe(criu_svm_md, next, &svms->criu_svm_metadata_list, list) {
+		pr_debug("freeing criu_svm_md[]\n\tstart: 0x%llx\n",
+						criu_svm_md->data.start_addr);
+		kfree(criu_svm_md);
+	}
+
+	mmput(mm);
+	return ret;
+
+}
+
 int kfd_criu_restore_svm(struct kfd_process *p,
 			 uint8_t __user *user_priv_ptr,
 			 uint64_t *priv_data_offset,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 3b5948f67de2..66c77f00ac3e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -192,6 +192,7 @@ int kfd_criu_restore_svm(struct kfd_process *p,
 			 uint8_t __user *user_priv_ptr,
 			 uint64_t *priv_data_offset,
 			 uint64_t max_priv_data_size);
+int kfd_criu_resume_svm(struct kfd_process *p);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -253,6 +254,11 @@ static inline int kfd_criu_restore_svm(struct kfd_process *p,
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

