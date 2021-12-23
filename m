Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A547DC39
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F9E10E1B4;
	Thu, 23 Dec 2021 00:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F7D10E164;
 Thu, 23 Dec 2021 00:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcgR6e+7m1AwN4OsBz0MX/FAz2dOhPEAfMUq79DhYD08GMQ6KNxE/Cj//BZTSnDH+sJGl6rL2bsDqbKHgR3DpfvL4TvTjku0h17Bu02AoKutOAOG+jup/iAsFo7BkrfcqTBuRVck1JWQc6PvhqM1EtQuFXcCjQvuu6W2S6klsuKJAdbr2PGaJoIHmi2uIrpFMP+tv/9JC/uo/7OWfMGUkdF0lhn7vCs0Cn8bs3v7X7ZRmvghY/gzyUQ1mpJvMJ2Adi74bcif0Fq9ruzXVpTj+UZbqeVFQ8cnfUfpwfywOF1ioISvoEmMuyaqn/JAShBK88HXG9NPC2ftQiWDQ5tObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82qmnYzWFNkEF7DKZOmvy+nPSe8SN9Xq4tpyBMwtUMU=;
 b=iLPAW8H3kvcKk6FD4CJH0C2Wvg8Fle+8sMzQFpzSS+L3NuORIRtzAYxiaFBVuLtd2SI/6jcbtRv2sp3Cva64MEzRdvxE6hHGtEixlAlhsI5gepAem4TA4Bd6uzX7sYX2BIwUP4Kg7YDJo47LvH0xY7oF/BRVLdS3gwbXqFC8Ig/tIWzU/6LDJXG43dV+Ixk0xCrkbSk2Vi3bQ5gFPe5P8FB/s/0+W5mKZVA73gAZhDzcscFm/h3bD3jEpoQj+s8PS9vbXrtx29QeBsjqQeQ1AvADRBxEEZFnMtTbhw4wqCnhEISdn8KNFuQmGRfJBvn3jjEW/OCIy4mJmfmooRpbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82qmnYzWFNkEF7DKZOmvy+nPSe8SN9Xq4tpyBMwtUMU=;
 b=fa36X9q4nvvVwu1OWOcmx/LoCz29GE+QMMF3vBrBFihY4u9TOBY2kE95ycJBeGZw4tvCvB2QGQXPWOF+GrnvJC0jVcXXPxUzFVzZxQYokfHBOc+bQOyiZEDnXyo1eS3VtYRuot03oueLA7gF5vHZgMc85tnDgJbkCGufxGaXbz8=
Received: from BN0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:e8::14)
 by SN1PR12MB2574.namprd12.prod.outlook.com (2603:10b6:802:26::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.18; Thu, 23 Dec
 2021 00:37:33 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::39) by BN0PR04CA0039.outlook.office365.com
 (2603:10b6:408:e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:33 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:32 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 15/24] drm/amdkfd: CRIU checkpoint and restore events
Date: Wed, 22 Dec 2021 19:37:02 -0500
Message-ID: <20211223003711.13064-16-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ba9f6e46-66c5-41d1-9ad9-08d9c5ac6929
X-MS-TrafficTypeDiagnostic: SN1PR12MB2574:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2574FCAB55732DB5B65DD25AFE7E9@SN1PR12MB2574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +hR44K+Xy6kOu5/2Zl3wAd/qnZdjA8Rw8Ii2ERCQWrsx0SSTinB+TOw67IU2H7qxWGo7WIjNwTXT5eDYFfZXdrylewmjIPf0bTG8zj48IPTQCPdPSdo6FICP0ldGbZ9how94+4D7LdeNq/GFN3jSiuItp1Mt29DY6biDLYyblYTjXrW7WfahSVEJiAbhz/tf5bllg04uhsMqABWNaN0x8FhDA3CJspGXZZGSBxdu3aRTmMYeHQxgrVRAjRUJms79yDswtBHZCsGLF1p4KgNkH+R1zvfOjojD5qqc+CW9WjkK204EhRHeKEdiZXRTr9hCcLrkAh4ggcXNmQ1/A65iAS/yeKHdZOdkETgye/qVQDUcy/YzfDq8rrXD2P7/xc45lzbIre2V1SIZkG4yV02AwORJ+TBn7dWlE3P4XktlKVXMoGeVBPU+sH/VGvCKuYNUMpebBtSLudZlm5kb1177r/LYs6muV0ugJ73VL4KJEIYGC5ZGyTOshs4eFLvVey83Nc4FcGDtuqTGnue3VrXN0ARxSY68irbk3NL2GAMhpNL134PMtBrf+pD4jdw3SWL5hHza2C+upLHBdRS/BlGuPxFub+ucM2WQwNHajqRG7Lwup8tMbpKXlDTtqpErRbalW5PhWTJ2MjBUmV6EuuA55B+hqwfEXKPK858TI33lqil/Pf7/wTMExjt428445RSGf8+kmBoBEcLzhAqYDxTk3Ue8pGSRm8Jqk1XT0Mfi+2xPWreTqPgzsmKVdDUgXLNXoABlVObiAOjTy3pcT7uX9pdMkLyAHd7I+9T+JXtvKqQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(26005)(336012)(8676002)(316002)(47076005)(508600001)(186003)(36860700001)(356005)(7696005)(86362001)(16526019)(8936002)(70206006)(70586007)(40460700001)(110136005)(44832011)(426003)(4326008)(36756003)(2616005)(6666004)(54906003)(83380400001)(2906002)(82310400004)(1076003)(81166007)(30864003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:33.8548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9f6e46-66c5-41d1-9ad9-08d9c5ac6929
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2574
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
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

Add support to existing CRIU ioctl's to save and restore events during
criu checkpoint and restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  70 +-----
 drivers/gpu/drm/amd/amdkfd/kfd_events.c  | 272 ++++++++++++++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  27 ++-
 3 files changed, 280 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 582b4a393f95..08467fa2f514 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1009,57 +1009,11 @@ static int kfd_ioctl_create_event(struct file *filp, struct kfd_process *p,
 	 * through the event_page_offset field.
 	 */
 	if (args->event_page_offset) {
-		struct kfd_dev *kfd;
-		struct kfd_process_device *pdd;
-		void *mem, *kern_addr;
-		uint64_t size;
-
-		kfd = kfd_device_by_id(GET_GPU_ID(args->event_page_offset));
-		if (!kfd) {
-			pr_err("Getting device by id failed in %s\n", __func__);
-			return -EINVAL;
-		}
-
 		mutex_lock(&p->mutex);
-
-		if (p->signal_page) {
-			pr_err("Event page is already set\n");
-			err = -EINVAL;
-			goto out_unlock;
-		}
-
-		pdd = kfd_bind_process_to_device(kfd, p);
-		if (IS_ERR(pdd)) {
-			err = PTR_ERR(pdd);
-			goto out_unlock;
-		}
-
-		mem = kfd_process_device_translate_handle(pdd,
-				GET_IDR_HANDLE(args->event_page_offset));
-		if (!mem) {
-			pr_err("Can't find BO, offset is 0x%llx\n",
-			       args->event_page_offset);
-			err = -EINVAL;
-			goto out_unlock;
-		}
-
-		err = amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(kfd->adev,
-						mem, &kern_addr, &size);
-		if (err) {
-			pr_err("Failed to map event page to kernel\n");
-			goto out_unlock;
-		}
-
-		err = kfd_event_page_set(p, kern_addr, size);
-		if (err) {
-			pr_err("Failed to set event page\n");
-			amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel(kfd->adev, mem);
-			goto out_unlock;
-		}
-
-		p->signal_handle = args->event_page_offset;
-
+		err = kfd_kmap_event_page(p, args->event_page_offset);
 		mutex_unlock(&p->mutex);
+		if (err)
+			return err;
 	}
 
 	err = kfd_event_create(filp, p, args->event_type,
@@ -1068,10 +1022,7 @@ static int kfd_ioctl_create_event(struct file *filp, struct kfd_process *p,
 				&args->event_page_offset,
 				&args->event_slot_index);
 
-	return err;
-
-out_unlock:
-	mutex_unlock(&p->mutex);
+	pr_debug("Created event (id:0x%08x) (%s)\n", args->event_id, __func__);
 	return err;
 }
 
@@ -2022,7 +1973,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
 	if (ret)
 		return ret;
 
-	num_events = 0;     /* TODO: Implement Events */
+	num_events = kfd_get_num_events(p);
 	num_svm_ranges = 0; /* TODO: Implement SVM-Ranges */
 
 	*num_objects = num_queues + num_events + num_svm_ranges;
@@ -2031,7 +1982,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
 		priv_size = sizeof(struct kfd_criu_process_priv_data);
 		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
 		priv_size += queues_priv_data_size;
-		/* TODO: Add Events priv size */
+		priv_size += num_events * sizeof(struct kfd_criu_event_priv_data);
 		/* TODO: Add SVM ranges priv size */
 		*objs_priv_size = priv_size;
 	}
@@ -2093,7 +2044,10 @@ static int criu_checkpoint(struct file *filep,
 		if (ret)
 			goto exit_unlock;
 
-		/* TODO: Dump Events */
+		ret = kfd_criu_checkpoint_events(p, (uint8_t __user *)args->priv_data,
+						 &priv_offset);
+		if (ret)
+			goto exit_unlock;
 
 		/* TODO: Dump SVM-Ranges */
 	}
@@ -2406,8 +2360,8 @@ static int criu_restore_objects(struct file *filep,
 				goto exit;
 			break;
 		case KFD_CRIU_OBJECT_TYPE_EVENT:
-			/* TODO: Implement Events */
-			*priv_offset += sizeof(struct kfd_criu_event_priv_data);
+			ret = kfd_criu_restore_event(filep, p, (uint8_t __user *)args->priv_data,
+						     priv_offset, max_priv_data_size);
 			if (ret)
 				goto exit;
 			break;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index afe72dd11325..acd8cdf1324e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -55,7 +55,6 @@ struct kfd_signal_page {
 	bool need_to_free_pages;
 };
 
-
 static uint64_t *page_slots(struct kfd_signal_page *page)
 {
 	return page->kernel_address;
@@ -92,7 +91,8 @@ static struct kfd_signal_page *allocate_signal_page(struct kfd_process *p)
 }
 
 static int allocate_event_notification_slot(struct kfd_process *p,
-					    struct kfd_event *ev)
+					    struct kfd_event *ev,
+					    const int *restore_id)
 {
 	int id;
 
@@ -104,14 +104,19 @@ static int allocate_event_notification_slot(struct kfd_process *p,
 		p->signal_mapped_size = 256*8;
 	}
 
-	/*
-	 * Compatibility with old user mode: Only use signal slots
-	 * user mode has mapped, may be less than
-	 * KFD_SIGNAL_EVENT_LIMIT. This also allows future increase
-	 * of the event limit without breaking user mode.
-	 */
-	id = idr_alloc(&p->event_idr, ev, 0, p->signal_mapped_size / 8,
-		       GFP_KERNEL);
+	if (restore_id) {
+		id = idr_alloc(&p->event_idr, ev, *restore_id, *restore_id + 1,
+				GFP_KERNEL);
+	} else {
+		/*
+		 * Compatibility with old user mode: Only use signal slots
+		 * user mode has mapped, may be less than
+		 * KFD_SIGNAL_EVENT_LIMIT. This also allows future increase
+		 * of the event limit without breaking user mode.
+		 */
+		id = idr_alloc(&p->event_idr, ev, 0, p->signal_mapped_size / 8,
+				GFP_KERNEL);
+	}
 	if (id < 0)
 		return id;
 
@@ -178,9 +183,8 @@ static struct kfd_event *lookup_signaled_event_by_partial_id(
 	return ev;
 }
 
-static int create_signal_event(struct file *devkfd,
-				struct kfd_process *p,
-				struct kfd_event *ev)
+static int create_signal_event(struct file *devkfd, struct kfd_process *p,
+				struct kfd_event *ev, const int *restore_id)
 {
 	int ret;
 
@@ -193,7 +197,7 @@ static int create_signal_event(struct file *devkfd,
 		return -ENOSPC;
 	}
 
-	ret = allocate_event_notification_slot(p, ev);
+	ret = allocate_event_notification_slot(p, ev, restore_id);
 	if (ret) {
 		pr_warn("Signal event wasn't created because out of kernel memory\n");
 		return ret;
@@ -209,16 +213,22 @@ static int create_signal_event(struct file *devkfd,
 	return 0;
 }
 
-static int create_other_event(struct kfd_process *p, struct kfd_event *ev)
+static int create_other_event(struct kfd_process *p, struct kfd_event *ev, const int *restore_id)
 {
-	/* Cast KFD_LAST_NONSIGNAL_EVENT to uint32_t. This allows an
-	 * intentional integer overflow to -1 without a compiler
-	 * warning. idr_alloc treats a negative value as "maximum
-	 * signed integer".
-	 */
-	int id = idr_alloc(&p->event_idr, ev, KFD_FIRST_NONSIGNAL_EVENT_ID,
-			   (uint32_t)KFD_LAST_NONSIGNAL_EVENT_ID + 1,
-			   GFP_KERNEL);
+	int id;
+
+	if (restore_id)
+		id = idr_alloc(&p->event_idr, ev, *restore_id, *restore_id + 1,
+			GFP_KERNEL);
+	else
+		/* Cast KFD_LAST_NONSIGNAL_EVENT to uint32_t. This allows an
+		 * intentional integer overflow to -1 without a compiler
+		 * warning. idr_alloc treats a negative value as "maximum
+		 * signed integer".
+		 */
+		id = idr_alloc(&p->event_idr, ev, KFD_FIRST_NONSIGNAL_EVENT_ID,
+				(uint32_t)KFD_LAST_NONSIGNAL_EVENT_ID + 1,
+				GFP_KERNEL);
 
 	if (id < 0)
 		return id;
@@ -295,8 +305,8 @@ static bool event_can_be_cpu_signaled(const struct kfd_event *ev)
 	return ev->type == KFD_EVENT_TYPE_SIGNAL;
 }
 
-int kfd_event_page_set(struct kfd_process *p, void *kernel_address,
-		       uint64_t size)
+static int kfd_event_page_set(struct kfd_process *p, void *kernel_address,
+		       uint64_t size, uint64_t user_handle)
 {
 	struct kfd_signal_page *page;
 
@@ -315,10 +325,56 @@ int kfd_event_page_set(struct kfd_process *p, void *kernel_address,
 
 	p->signal_page = page;
 	p->signal_mapped_size = size;
-
+	p->signal_handle = user_handle;
 	return 0;
 }
 
+int kfd_kmap_event_page(struct kfd_process *p, uint64_t event_page_offset)
+{
+	struct kfd_dev *kfd;
+	struct kfd_process_device *pdd;
+	void *mem, *kern_addr;
+	uint64_t size;
+	int err = 0;
+
+	if (p->signal_page) {
+		pr_err("Event page is already set\n");
+		return -EINVAL;
+	}
+
+	kfd = kfd_device_by_id(GET_GPU_ID(event_page_offset));
+	if (!kfd) {
+		pr_err("Getting device by id failed in %s\n", __func__);
+		return -EINVAL;
+	}
+
+	pdd = kfd_bind_process_to_device(kfd, p);
+	if (IS_ERR(pdd))
+		return PTR_ERR(pdd);
+
+	mem = kfd_process_device_translate_handle(pdd,
+			GET_IDR_HANDLE(event_page_offset));
+	if (!mem) {
+		pr_err("Can't find BO, offset is 0x%llx\n", event_page_offset);
+		return -EINVAL;
+	}
+
+	err = amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(kfd->adev,
+					mem, &kern_addr, &size);
+	if (err) {
+		pr_err("Failed to map event page to kernel\n");
+		return err;
+	}
+
+	err = kfd_event_page_set(p, kern_addr, size, event_page_offset);
+	if (err) {
+		pr_err("Failed to set event page\n");
+		amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel(kfd->adev, mem);
+		return err;
+	}
+	return err;
+}
+
 int kfd_event_create(struct file *devkfd, struct kfd_process *p,
 		     uint32_t event_type, bool auto_reset, uint32_t node_id,
 		     uint32_t *event_id, uint32_t *event_trigger_data,
@@ -343,14 +399,14 @@ int kfd_event_create(struct file *devkfd, struct kfd_process *p,
 	switch (event_type) {
 	case KFD_EVENT_TYPE_SIGNAL:
 	case KFD_EVENT_TYPE_DEBUG:
-		ret = create_signal_event(devkfd, p, ev);
+		ret = create_signal_event(devkfd, p, ev, NULL);
 		if (!ret) {
 			*event_page_offset = KFD_MMAP_TYPE_EVENTS;
 			*event_slot_index = ev->event_id;
 		}
 		break;
 	default:
-		ret = create_other_event(p, ev);
+		ret = create_other_event(p, ev, NULL);
 		break;
 	}
 
@@ -366,6 +422,166 @@ int kfd_event_create(struct file *devkfd, struct kfd_process *p,
 	return ret;
 }
 
+int kfd_criu_restore_event(struct file *devkfd,
+			   struct kfd_process *p,
+			   uint8_t __user *user_priv_ptr,
+			   uint64_t *priv_data_offset,
+			   uint64_t max_priv_data_size)
+{
+	struct kfd_criu_event_priv_data *ev_priv;
+	struct kfd_event *ev = NULL;
+	int ret = 0;
+
+	ev_priv = kmalloc(sizeof(*ev_priv), GFP_KERNEL);
+	if (!ev_priv)
+		return -ENOMEM;
+
+	ev = kzalloc(sizeof(*ev), GFP_KERNEL);
+	if (!ev) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	if (*priv_data_offset + sizeof(*ev_priv) > max_priv_data_size) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = copy_from_user(ev_priv, user_priv_ptr + *priv_data_offset, sizeof(*ev_priv));
+	if (ret) {
+		ret = -EFAULT;
+		goto exit;
+	}
+	*priv_data_offset += sizeof(*ev_priv);
+
+	if (ev_priv->user_handle) {
+		ret = kfd_kmap_event_page(p, ev_priv->user_handle);
+		if (ret)
+			goto exit;
+	}
+
+	ev->type = ev_priv->type;
+	ev->auto_reset = ev_priv->auto_reset;
+	ev->signaled = ev_priv->signaled;
+
+	init_waitqueue_head(&ev->wq);
+
+	mutex_lock(&p->event_mutex);
+	switch (ev->type) {
+	case KFD_EVENT_TYPE_SIGNAL:
+	case KFD_EVENT_TYPE_DEBUG:
+		ret = create_signal_event(devkfd, p, ev, &ev_priv->event_id);
+		break;
+	case KFD_EVENT_TYPE_MEMORY:
+		memcpy(&ev->memory_exception_data,
+			&ev_priv->memory_exception_data,
+			sizeof(struct kfd_hsa_memory_exception_data));
+
+		ret = create_other_event(p, ev, &ev_priv->event_id);
+		break;
+	case KFD_EVENT_TYPE_HW_EXCEPTION:
+		memcpy(&ev->hw_exception_data,
+			&ev_priv->hw_exception_data,
+			sizeof(struct kfd_hsa_hw_exception_data));
+
+		ret = create_other_event(p, ev, &ev_priv->event_id);
+		break;
+	}
+
+exit:
+	if (ret)
+		kfree(ev);
+
+	kfree(ev_priv);
+
+	mutex_unlock(&p->event_mutex);
+
+	return ret;
+}
+
+int kfd_criu_checkpoint_events(struct kfd_process *p,
+			 uint8_t __user *user_priv_data,
+			 uint64_t *priv_data_offset)
+{
+	struct kfd_criu_event_priv_data *ev_privs;
+	int i = 0;
+	int ret =  0;
+	struct kfd_event *ev;
+	uint32_t ev_id;
+
+	uint32_t num_events = kfd_get_num_events(p);
+
+	if (!num_events)
+		return 0;
+
+	ev_privs = kvzalloc(num_events * sizeof(*ev_privs), GFP_KERNEL);
+	if (!ev_privs)
+		return -ENOMEM;
+
+
+	idr_for_each_entry(&p->event_idr, ev, ev_id) {
+		struct kfd_criu_event_priv_data *ev_priv;
+
+		/*
+		 * Currently, all events have same size of private_data, but the current ioctl's
+		 * and CRIU plugin supports private_data of variable sizes
+		 */
+		ev_priv = &ev_privs[i];
+
+		ev_priv->object_type = KFD_CRIU_OBJECT_TYPE_EVENT;
+
+		/* We store the user_handle with the first event */
+		if (i == 0 && p->signal_page)
+			ev_priv->user_handle = p->signal_handle;
+
+		ev_priv->event_id = ev->event_id;
+		ev_priv->auto_reset = ev->auto_reset;
+		ev_priv->type = ev->type;
+		ev_priv->signaled = ev->signaled;
+
+		if (ev_priv->type == KFD_EVENT_TYPE_MEMORY)
+			memcpy(&ev_priv->memory_exception_data,
+				&ev->memory_exception_data,
+				sizeof(struct kfd_hsa_memory_exception_data));
+		else if (ev_priv->type == KFD_EVENT_TYPE_HW_EXCEPTION)
+			memcpy(&ev_priv->hw_exception_data,
+				&ev->hw_exception_data,
+				sizeof(struct kfd_hsa_hw_exception_data));
+
+		pr_debug("Checkpointed event[%d] id = 0x%08x auto_reset = %x type = %x signaled = %x\n",
+			  i,
+			  ev_priv->event_id,
+			  ev_priv->auto_reset,
+			  ev_priv->type,
+			  ev_priv->signaled);
+		i++;
+	}
+
+	ret = copy_to_user(user_priv_data + *priv_data_offset,
+			   ev_privs, num_events * sizeof(*ev_privs));
+	if (ret) {
+		pr_err("Failed to copy events priv to user\n");
+		ret = -EFAULT;
+	}
+
+	*priv_data_offset += num_events * sizeof(*ev_privs);
+
+	kvfree(ev_privs);
+	return ret;
+}
+
+int kfd_get_num_events(struct kfd_process *p)
+{
+	struct kfd_event *ev;
+	uint32_t id;
+	u32 num_events = 0;
+
+	idr_for_each_entry(&p->event_idr, ev, id)
+		num_events++;
+
+	return num_events++;
+}
+
 /* Assumes that p is current. */
 int kfd_event_destroy(struct kfd_process *p, uint32_t event_id)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 34e0cafc3870..f50c0af6a045 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1099,7 +1099,16 @@ struct kfd_criu_queue_priv_data {
 
 struct kfd_criu_event_priv_data {
 	uint32_t object_type;
-	uint64_t reserved;
+	uint64_t user_handle;
+	uint32_t event_id;
+	uint32_t auto_reset;
+	uint32_t type;
+	uint32_t signaled;
+
+	union {
+		struct kfd_hsa_memory_exception_data memory_exception_data;
+		struct kfd_hsa_hw_exception_data hw_exception_data;
+	};
 };
 
 int kfd_process_get_queue_info(struct kfd_process *p,
@@ -1114,6 +1123,16 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 			   uint8_t __user *user_priv_data,
 			   uint64_t *priv_data_offset,
 			   uint64_t max_priv_data_size);
+
+int kfd_criu_checkpoint_events(struct kfd_process *p,
+			 uint8_t __user *user_priv_data,
+			 uint64_t *priv_data_offset);
+
+int kfd_criu_restore_event(struct file *devkfd,
+			   struct kfd_process *p,
+			   uint8_t __user *user_priv_data,
+			   uint64_t *priv_data_offset,
+			   uint64_t max_priv_data_size);
 /* CRIU - End */
 
 /* Queue Context Management */
@@ -1277,12 +1296,14 @@ void kfd_signal_iommu_event(struct kfd_dev *dev,
 void kfd_signal_hw_exception_event(u32 pasid);
 int kfd_set_event(struct kfd_process *p, uint32_t event_id);
 int kfd_reset_event(struct kfd_process *p, uint32_t event_id);
-int kfd_event_page_set(struct kfd_process *p, void *kernel_address,
-		       uint64_t size);
+int kfd_kmap_event_page(struct kfd_process *p, uint64_t event_page_offset);
+
 int kfd_event_create(struct file *devkfd, struct kfd_process *p,
 		     uint32_t event_type, bool auto_reset, uint32_t node_id,
 		     uint32_t *event_id, uint32_t *event_trigger_data,
 		     uint64_t *event_page_offset, uint32_t *event_slot_index);
+
+int kfd_get_num_events(struct kfd_process *p);
 int kfd_event_destroy(struct kfd_process *p, uint32_t event_id);
 
 void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
-- 
2.17.1

