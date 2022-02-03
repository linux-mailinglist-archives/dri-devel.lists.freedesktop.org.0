Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F974A8103
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A60E10EA3C;
	Thu,  3 Feb 2022 09:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2052.outbound.protection.outlook.com [40.107.101.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F376B10EA1A;
 Thu,  3 Feb 2022 09:09:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQh8iqaQQOLXkK+FUou4d5q+Dj+XgM08P0CCdjV3zbxQnN4ZE88YiHBo9GAcvOgu7t3rR6oC7kO801GoCKOZsQRhcKH7F2gzWyTYjymVDV7qo/FKYKWkMRHulLB2k/aKQJtzYDZqGWsB55QqgGbn+DO8Q15AlqSsKK3Ky2pIfOPGfh4U2hlvZtqUcqaZ2CzX3Uyqxmpy3upfH9iIcgsaS3XdiGw2Fz/8+57KDO92Vb6L+xksLc2UL+KNeTnxlqw4eTdknpYEG5XqKHO5MlKvuRxl0Vg1Qj7h4LzncDe1NphC3rDfOAcjCFB5OCT0g8pqTo33TB7uTpiuWLTUA40xBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zju+yNEaqQqNI9kogZN0Cl9Iej0zVvAbwJrP+Z6Ycf0=;
 b=aBuxEvWUN7JfMluhHEp9Sl6G4RxA56Qgxf8eHf8iiPF8s8Nnvg0cfs3qFh/fADahZrb7xrKUsYuHengZ97S8FrvmwNWQTfbPAxTbhjC5IB+C+YM+Vb+F46CT5Dz1vfEZtUF4fpi285xF15xu0vkESAkhR4ATz21tFEhVA6VfSVJbcm+X/qEbh22vCXVYf2m0tRFFMKIeljDrRA0MOfgU7CFujiJm2MfeG3eVCdIFAZbiz2LrhcaNqSllMFC5beKvm9M2l/qly1ZOy5ghZkcaIDiFA1SsQsXnZlEBrT+bSRl5ArbfsfqQ6oEIqTixUu+beCmJkKEHL+2v9vOtOoF3zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zju+yNEaqQqNI9kogZN0Cl9Iej0zVvAbwJrP+Z6Ycf0=;
 b=ClxPqktn1M/fJpoxqzFvMoTUvBWnb98aifaDToHH167WW3Goh6uLzCZQPOwpe8twMxvuU7XgB9ZtcIzjedvnsox19x1DMvT2t4fyRnjfDIN4EOxEW0QsOSDf+8UmR9mMWr/bNshZ9fZlWFWAqSaPP5+/JsYSn7kbGjcHt56fsJk=
Received: from BN9PR03CA0374.namprd03.prod.outlook.com (2603:10b6:408:f7::19)
 by BN8PR12MB3218.namprd12.prod.outlook.com (2603:10b6:408:6b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 3 Feb
 2022 09:09:40 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::9a) by BN9PR03CA0374.outlook.office365.com
 (2603:10b6:408:f7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:40 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:36 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 08/24] drm/amdkfd: CRIU add queues support
Date: Thu, 3 Feb 2022 04:09:02 -0500
Message-ID: <20220203090918.11520-9-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 355f99ff-e9dc-4bd0-6ea4-08d9e6f4e8c6
X-MS-TrafficTypeDiagnostic: BN8PR12MB3218:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3218203E2B4BCBE3FB048DBDFE289@BN8PR12MB3218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXVXht2cVEE97JCxI0hxYdyxXe9xvN6DaDGJOkg1l5/ocaO+Ih95fCuvSG0LEaw97dKvta/OljF60nL06zndpxTjzbhZjS18c7blFwtv7gxzpJyQRrphHx9X2MFLIbBJCw4OOpGfHGl3hzRX1kjdE70Fkk1lhdHIPSwuKgNnkskWHiKMzhtsIngfopDNwyDrMQi/QYRk+UzAb5reCn6vsG5uTDZySo4a4zlLbENE0z7vrZutw77qxbCxvRpwrb5jbhw32yD7/I9dXMHdJmCHqhOA4OKiluI1QuQktpwtqaEtsu+l5f1XdRHh588QH3jRds+F3vvwzJk2+T0Owa33Y5wmeDEHh4cUxotDzAII1cpGRGLzMq1mKC+I/8shy1Eowtvv/jev1aNWjICaAXPvAIv4LzldzAgUiSETix1dVLPWs0b/g5woTF2A0i+el29QDtO/BFtAjWglIAOLenmPVdBZuLm69xdsqxQGCYZwvn/XCCu4E/WggE7cY8tRvl4TVrWiB1bON6BkRNO6rkSFnEPAjg9ymNS01x6iUHPUFf9JAYgTHEvQjiUwRvLdQhFqXeRE6IqOaKPGoCYYK41ap8YWeQC/M0Lxv7VNlcEOS+sl5p2D2yI3rm/VpTFqGI/AuOOyzaKRi1VL38ZJm4P6s7doTqP8QbRLLpV8TAdEkxiPA2OntI8ibxxTCYeFTxqsZDZVmH33jLhdnOHBVk8q/Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(86362001)(54906003)(508600001)(6916009)(82310400004)(2906002)(44832011)(83380400001)(5660300002)(30864003)(1076003)(186003)(70586007)(36860700001)(8676002)(47076005)(26005)(450100002)(16526019)(36756003)(8936002)(6666004)(336012)(40460700003)(426003)(356005)(2616005)(81166007)(316002)(4326008)(70206006)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:40.0581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 355f99ff-e9dc-4bd0-6ea4-08d9e6f4e8c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3218
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

From: David Yat Sin <david.yatsin@amd.com>

Add support to existing CRIU ioctl's to save number of queues and queue
properties for each queue during checkpoint and re-create queues on
restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 110 ++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  43 +++-
 .../amd/amdkfd/kfd_process_queue_manager.c    | 208 ++++++++++++++++++
 3 files changed, 353 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 6af6deeda523..d049f9cbbc79 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2015,19 +2015,36 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 	return ret;
 }
 
-static void criu_get_process_object_info(struct kfd_process *p,
-					 uint32_t *num_bos,
-					 uint64_t *objs_priv_size)
+static int criu_get_process_object_info(struct kfd_process *p,
+					uint32_t *num_bos,
+					uint32_t *num_objects,
+					uint64_t *objs_priv_size)
 {
+	int ret;
 	uint64_t priv_size;
+	uint32_t num_queues, num_events, num_svm_ranges;
+	uint64_t queues_priv_data_size;
 
 	*num_bos = get_process_num_bos(p);
 
+	ret = kfd_process_get_queue_info(p, &num_queues, &queues_priv_data_size);
+	if (ret)
+		return ret;
+
+	num_events = 0;     /* TODO: Implement Events */
+	num_svm_ranges = 0; /* TODO: Implement SVM-Ranges */
+
+	*num_objects = num_queues + num_events + num_svm_ranges;
+
 	if (objs_priv_size) {
 		priv_size = sizeof(struct kfd_criu_process_priv_data);
 		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
+		priv_size += queues_priv_data_size;
+		/* TODO: Add Events priv size */
+		/* TODO: Add SVM ranges priv size */
 		*objs_priv_size = priv_size;
 	}
+	return 0;
 }
 
 static int criu_checkpoint(struct file *filep,
@@ -2035,7 +2052,7 @@ static int criu_checkpoint(struct file *filep,
 			   struct kfd_ioctl_criu_args *args)
 {
 	int ret;
-	uint32_t num_bos;
+	uint32_t num_bos, num_objects;
 	uint64_t priv_size, priv_offset = 0;
 
 	if (!args->bos || !args->priv_data)
@@ -2057,9 +2074,12 @@ static int criu_checkpoint(struct file *filep,
 		goto exit_unlock;
 	}
 
-	criu_get_process_object_info(p, &num_bos, &priv_size);
+	ret = criu_get_process_object_info(p, &num_bos, &num_objects, &priv_size);
+	if (ret)
+		goto exit_unlock;
 
 	if (num_bos != args->num_bos ||
+	    num_objects != args->num_objects ||
 	    priv_size != args->priv_data_size) {
 
 		ret = -EINVAL;
@@ -2076,6 +2096,17 @@ static int criu_checkpoint(struct file *filep,
 	if (ret)
 		goto exit_unlock;
 
+	if (num_objects) {
+		ret = kfd_criu_checkpoint_queues(p, (uint8_t __user *)args->priv_data,
+						 &priv_offset);
+		if (ret)
+			goto exit_unlock;
+
+		/* TODO: Dump Events */
+
+		/* TODO: Dump SVM-Ranges */
+	}
+
 exit_unlock:
 	mutex_unlock(&p->mutex);
 	if (ret)
@@ -2344,6 +2375,62 @@ static int criu_restore_bos(struct kfd_process *p,
 	return ret;
 }
 
+static int criu_restore_objects(struct file *filep,
+				struct kfd_process *p,
+				struct kfd_ioctl_criu_args *args,
+				uint64_t *priv_offset,
+				uint64_t max_priv_data_size)
+{
+	int ret = 0;
+	uint32_t i;
+
+	BUILD_BUG_ON(offsetof(struct kfd_criu_queue_priv_data, object_type));
+	BUILD_BUG_ON(offsetof(struct kfd_criu_event_priv_data, object_type));
+	BUILD_BUG_ON(offsetof(struct kfd_criu_svm_range_priv_data, object_type));
+
+	for (i = 0; i < args->num_objects; i++) {
+		uint32_t object_type;
+
+		if (*priv_offset + sizeof(object_type) > max_priv_data_size) {
+			pr_err("Invalid private data size\n");
+			return -EINVAL;
+		}
+
+		ret = get_user(object_type, (uint32_t __user *)(args->priv_data + *priv_offset));
+		if (ret) {
+			pr_err("Failed to copy private information from user\n");
+			goto exit;
+		}
+
+		switch (object_type) {
+		case KFD_CRIU_OBJECT_TYPE_QUEUE:
+			ret = kfd_criu_restore_queue(p, (uint8_t __user *)args->priv_data,
+						     priv_offset, max_priv_data_size);
+			if (ret)
+				goto exit;
+			break;
+		case KFD_CRIU_OBJECT_TYPE_EVENT:
+			/* TODO: Implement Events */
+			*priv_offset += sizeof(struct kfd_criu_event_priv_data);
+			if (ret)
+				goto exit;
+			break;
+		case KFD_CRIU_OBJECT_TYPE_SVM_RANGE:
+			/* TODO: Implement SVM range */
+			*priv_offset += sizeof(struct kfd_criu_svm_range_priv_data);
+			if (ret)
+				goto exit;
+			break;
+		default:
+			pr_err("Invalid object type:%u at index:%d\n", object_type, i);
+			ret = -EINVAL;
+			goto exit;
+		}
+	}
+exit:
+	return ret;
+}
+
 static int criu_restore(struct file *filep,
 			struct kfd_process *p,
 			struct kfd_ioctl_criu_args *args)
@@ -2377,6 +2464,10 @@ static int criu_restore(struct file *filep,
 	if (ret)
 		goto exit_unlock;
 
+	ret = criu_restore_objects(filep, p, args, &priv_offset, args->priv_data_size);
+	if (ret)
+		goto exit_unlock;
+
 	if (priv_offset != args->priv_data_size) {
 		pr_err("Invalid private data size\n");
 		ret = -EINVAL;
@@ -2474,9 +2565,14 @@ static int criu_process_info(struct file *filep,
 	args->pid = task_pid_nr_ns(p->lead_thread,
 					task_active_pid_ns(p->lead_thread));
 
-	criu_get_process_object_info(p, &args->num_bos, &args->priv_data_size);
+	ret = criu_get_process_object_info(p, &args->num_bos, &args->num_objects,
+					   &args->priv_data_size);
+	if (ret)
+		goto err_unlock;
+
+	dev_dbg(kfd_device, "Num of bos:%u objects:%u priv_data_size:%lld\n",
+				args->num_bos, args->num_objects, args->priv_data_size);
 
-	dev_dbg(kfd_device, "Num of bos:%u\n", args->num_bos);
 err_unlock:
 	if (ret) {
 		kfd_process_restore_queues(p);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 677f21447112..41aa7b150a96 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1057,6 +1057,16 @@ struct kfd_criu_bo_priv_data {
 	uint32_t mapped_gpuids[MAX_GPU_INSTANCE];
 };
 
+/*
+ * The first 4 bytes of kfd_criu_queue_priv_data, kfd_criu_event_priv_data,
+ * kfd_criu_svm_range_priv_data is the object type
+ */
+enum kfd_criu_object_type {
+	KFD_CRIU_OBJECT_TYPE_QUEUE,
+	KFD_CRIU_OBJECT_TYPE_EVENT,
+	KFD_CRIU_OBJECT_TYPE_SVM_RANGE,
+};
+
 struct kfd_criu_svm_range_priv_data {
 	uint32_t object_type;
 	uint32_t reserved;
@@ -1064,7 +1074,26 @@ struct kfd_criu_svm_range_priv_data {
 
 struct kfd_criu_queue_priv_data {
 	uint32_t object_type;
-	uint32_t reserved;
+	uint64_t q_address;
+	uint64_t q_size;
+	uint64_t read_ptr_addr;
+	uint64_t write_ptr_addr;
+	uint64_t doorbell_off;
+	uint64_t eop_ring_buffer_address;
+	uint64_t ctx_save_restore_area_address;
+	uint32_t gpu_id;
+	uint32_t type;
+	uint32_t format;
+	uint32_t q_id;
+	uint32_t priority;
+	uint32_t q_percent;
+	uint32_t doorbell_id;
+	uint32_t is_gws;
+	uint32_t sdma_id;
+	uint32_t eop_ring_buffer_size;
+	uint32_t ctx_save_restore_area_size;
+	uint32_t ctl_stack_size;
+	uint32_t mqd_size;
 };
 
 struct kfd_criu_event_priv_data {
@@ -1072,6 +1101,18 @@ struct kfd_criu_event_priv_data {
 	uint32_t reserved;
 };
 
+int kfd_process_get_queue_info(struct kfd_process *p,
+			       uint32_t *num_queues,
+			       uint64_t *priv_data_sizes);
+
+int kfd_criu_checkpoint_queues(struct kfd_process *p,
+			 uint8_t __user *user_priv_data,
+			 uint64_t *priv_data_offset);
+
+int kfd_criu_restore_queue(struct kfd_process *p,
+			   uint8_t __user *user_priv_data,
+			   uint64_t *priv_data_offset,
+			   uint64_t max_priv_data_size);
 /* CRIU - End */
 
 /* Queue Context Management */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 5e5c84a8e1ef..38d3217f0f67 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -497,6 +497,214 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
+int kfd_process_get_queue_info(struct kfd_process *p,
+			       uint32_t *num_queues,
+			       uint64_t *priv_data_sizes)
+{
+	struct queue *q;
+	int i;
+
+	*num_queues = 0;
+
+	/* Run over all PDDs of the process */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		list_for_each_entry(q, &pdd->qpd.queues_list, list) {
+			if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE ||
+				q->properties.type == KFD_QUEUE_TYPE_SDMA ||
+				q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
+
+				*num_queues = *num_queues + 1;
+			} else {
+				pr_err("Unsupported queue type (%d)\n", q->properties.type);
+				return -EOPNOTSUPP;
+			}
+		}
+	}
+	*priv_data_sizes = *num_queues * sizeof(struct kfd_criu_queue_priv_data);
+
+	return 0;
+}
+
+static void criu_dump_queue(struct kfd_process_device *pdd,
+			   struct queue *q,
+			   struct kfd_criu_queue_priv_data *q_data)
+{
+	q_data->gpu_id = pdd->dev->id;
+	q_data->type = q->properties.type;
+	q_data->format = q->properties.format;
+	q_data->q_id =  q->properties.queue_id;
+	q_data->q_address = q->properties.queue_address;
+	q_data->q_size = q->properties.queue_size;
+	q_data->priority = q->properties.priority;
+	q_data->q_percent = q->properties.queue_percent;
+	q_data->read_ptr_addr = (uint64_t)q->properties.read_ptr;
+	q_data->write_ptr_addr = (uint64_t)q->properties.write_ptr;
+	q_data->doorbell_id = q->doorbell_id;
+
+	q_data->sdma_id = q->sdma_id;
+
+	q_data->eop_ring_buffer_address =
+		q->properties.eop_ring_buffer_address;
+
+	q_data->eop_ring_buffer_size = q->properties.eop_ring_buffer_size;
+
+	q_data->ctx_save_restore_area_address =
+		q->properties.ctx_save_restore_area_address;
+
+	q_data->ctx_save_restore_area_size =
+		q->properties.ctx_save_restore_area_size;
+
+	pr_debug("Dumping Queue: gpu_id:%x queue_id:%u\n", q_data->gpu_id, q_data->q_id);
+}
+
+static int criu_dump_queues_device(struct kfd_process_device *pdd,
+				   uint8_t __user *user_priv,
+				   unsigned int *q_index,
+				   uint64_t *queues_priv_data_offset)
+{
+	struct kfd_criu_queue_priv_data *q_data;
+	struct queue *q;
+	int ret = 0;
+
+	q_data = kzalloc(sizeof(*q_data), GFP_KERNEL);
+	if (!q_data)
+		return -ENOMEM;
+
+	list_for_each_entry(q, &pdd->qpd.queues_list, list) {
+		if (q->properties.type != KFD_QUEUE_TYPE_COMPUTE &&
+			q->properties.type != KFD_QUEUE_TYPE_SDMA &&
+			q->properties.type != KFD_QUEUE_TYPE_SDMA_XGMI) {
+
+			pr_err("Unsupported queue type (%d)\n", q->properties.type);
+			ret = -EOPNOTSUPP;
+			break;
+		}
+
+		criu_dump_queue(pdd, q, q_data);
+
+		ret = copy_to_user(user_priv + *queues_priv_data_offset, q_data, sizeof(*q_data));
+		if (ret) {
+			ret = -EFAULT;
+			break;
+		}
+		*queues_priv_data_offset += sizeof(*q_data);
+		*q_index = *q_index + 1;
+	}
+
+	kfree(q_data);
+
+	return ret;
+}
+
+int kfd_criu_checkpoint_queues(struct kfd_process *p,
+			 uint8_t __user *user_priv_data,
+			 uint64_t *priv_data_offset)
+{
+	int ret = 0, pdd_index, q_index = 0;
+
+	for (pdd_index = 0; pdd_index < p->n_pdds; pdd_index++) {
+		struct kfd_process_device *pdd = p->pdds[pdd_index];
+
+		/*
+		 * criu_dump_queues_device will copy data to user and update q_index and
+		 * queues_priv_data_offset
+		 */
+		ret = criu_dump_queues_device(pdd, user_priv_data, &q_index, priv_data_offset);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static void set_queue_properties_from_criu(struct queue_properties *qp,
+					  struct kfd_criu_queue_priv_data *q_data)
+{
+	qp->is_interop = false;
+	qp->is_gws = q_data->is_gws;
+	qp->queue_percent = q_data->q_percent;
+	qp->priority = q_data->priority;
+	qp->queue_address = q_data->q_address;
+	qp->queue_size = q_data->q_size;
+	qp->read_ptr = (uint32_t *) q_data->read_ptr_addr;
+	qp->write_ptr = (uint32_t *) q_data->write_ptr_addr;
+	qp->eop_ring_buffer_address = q_data->eop_ring_buffer_address;
+	qp->eop_ring_buffer_size = q_data->eop_ring_buffer_size;
+	qp->ctx_save_restore_area_address = q_data->ctx_save_restore_area_address;
+	qp->ctx_save_restore_area_size = q_data->ctx_save_restore_area_size;
+	qp->ctl_stack_size = q_data->ctl_stack_size;
+	qp->type = q_data->type;
+	qp->format = q_data->format;
+}
+
+int kfd_criu_restore_queue(struct kfd_process *p,
+			   uint8_t __user *user_priv_ptr,
+			   uint64_t *priv_data_offset,
+			   uint64_t max_priv_data_size)
+{
+	struct kfd_criu_queue_priv_data *q_data;
+	struct kfd_process_device *pdd;
+	struct kfd_dev *dev;
+	struct queue_properties qp;
+	unsigned int queue_id;
+
+	int ret = 0;
+
+	if (*priv_data_offset + sizeof(*q_data) > max_priv_data_size)
+		return -EINVAL;
+
+	q_data = kmalloc(sizeof(*q_data), GFP_KERNEL);
+	if (!q_data)
+		return -ENOMEM;
+
+	ret = copy_from_user(q_data, user_priv_ptr + *priv_data_offset, sizeof(*q_data));
+	if (ret) {
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	*priv_data_offset += sizeof(*q_data);
+
+	dev = kfd_device_by_id(q_data->gpu_id);
+	if (!dev) {
+		pr_err("Could not get kfd_dev from gpu_id = 0x%x\n",
+		q_data->gpu_id);
+
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	pdd = kfd_get_process_device_data(dev, p);
+	if (!pdd) {
+		pr_err("Failed to get pdd\n");
+		ret = -EFAULT;
+		return ret;
+	}
+
+	memset(&qp, 0, sizeof(qp));
+	set_queue_properties_from_criu(&qp, q_data);
+
+	print_queue_properties(&qp);
+
+	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, NULL);
+	if (ret) {
+		pr_err("Failed to create new queue err:%d\n", ret);
+		ret = -EINVAL;
+	}
+
+exit:
+	if (ret)
+		pr_err("Failed to create queue (%d)\n", ret);
+	else
+		pr_debug("Queue id %d was restored successfully\n", queue_id);
+
+	kfree(q_data);
+
+	return ret;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 int pqm_debugfs_mqds(struct seq_file *m, void *data)
-- 
2.17.1

