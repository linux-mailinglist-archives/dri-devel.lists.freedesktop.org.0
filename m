Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA747DC33
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6045710E1B5;
	Thu, 23 Dec 2021 00:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7346210E155;
 Thu, 23 Dec 2021 00:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekG98jSAH+LK7isV9umaskSUIbhgZ66WCT3QxG2KGrcC/o5HxSVfCFjdU7anWK8bbtWZ60j+9BIh60VGNQZ4wgW7PYCEVLmVe7ya3KegZQ4ZGGr3B38Irk14tVYviAqAaCccoC0cXUkwy79Po7p8V1ekgKd1W8zq9jBBqBswMFxYugFEy6npNDqoXra0FntPlFB5Q3zlc23u07CK6Zx7JszPC/EQJh3zBAfvsRdsnHMDL6s1Hdtn2Reh9FtsSzD2LItxo2DKp55Bkr2JxjTcFd6VyHfHbUWFrD5AQKLzwIi2CuYSqK3RdStJb5SvwJwTMiMjjyfuKv5Thon1dWSWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5by1d/bG6cSmgpXLGkQQF5pT3qXN9NVk5NIZpq85yRY=;
 b=CXPE1GamOTWNfOuMcDWeA/W0KjpQmOCEr1ayikhiUml0X0dajRGKBFnaKQG729ss9RA08RmYO2zKYaGqQSymERAhtGRb2eSoYcrw0PfeV022uodImmoXie3I0PnroPiqS4O7IfuRLbph56iaymDU5ydUIoGXqgWbuHaOUGOtq8x+cbZ2I5Ie0EqUCT9rXu0m77lELE+8azwfEXT7WzlMvB7ap73oHnkAgW9t/Jn2ymwJf33PaV8p2xWrXP4+t5zkZAVKrE1g1tJBtn1ergmFf0qbf3glGuKAd88Jk8fCzHkGN6ugIzLmavxP0GHGqUxxXWX7QnPuJwWHW8ZhZ3UBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5by1d/bG6cSmgpXLGkQQF5pT3qXN9NVk5NIZpq85yRY=;
 b=Cch0llGNxJu8EZtYgNb+kahUQIwTCBLpw3k9SiISwB2f06CNuTuCvxv8tdqCbxvqDuyvhht7Tas2LWTDt+VsF0zDhDmf8bOC5OzvbhQsEucdWnbAuBBt9R8WoXt66F+jWbbg5yk9hEIHORsgtiBChY1YjK//bC++0EfCvR3RLEM=
Received: from BN0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:408:e8::13)
 by MN2PR12MB3422.namprd12.prod.outlook.com (2603:10b6:208:ce::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Thu, 23 Dec
 2021 00:37:31 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::df) by BN0PR04CA0038.outlook.office365.com
 (2603:10b6:408:e8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:31 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:29 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 09/24] drm/amdkfd: CRIU add queues support
Date: Wed, 22 Dec 2021 19:36:56 -0500
Message-ID: <20211223003711.13064-10-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 739e8076-7b0e-47bc-f143-08d9c5ac6785
X-MS-TrafficTypeDiagnostic: MN2PR12MB3422:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3422405E782898786786FA14FE7E9@MN2PR12MB3422.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wp5BByPPlkxBzs3BSW0Qf5mWIbs1pDB76fUdw6n0Mmdihn3caKRb6pg51lMSbM3kovu2pfy/1Td8G+n/OTFw940WMiQMu1ZoAJIorQ5d1NrS8BBOst6knVnkYTe8P89QzidtDHcrGtc26Mhibz4kDEIjBoKYtvZxCWlvMH/n+Wa+F+6V1EceM6jY+p6+so4iyCOXQd8ATVQumxk9bYOEo/SSG4ZdUlx6CfxUsjiRGoMzvTOS/lqHJghqZa+o1KbDsNkV7FOQQZ+POf/o0VG54tc9zRNMmgNkYBJQvu/sVvvt1Gss0/uBWCuCTDNsA2+aMo6jEWMxL78QqTlbYTi+wQrcZbjj93EfcmfnWeO76m2ilz7Q0BjvRPYgLUW+s65vKq3Ir+jtBrkEH3/vsg+v90KXo0Js1JVsRIfIr4vs/F+fs5X1Gj0YCtyZvQ0ivRFhfcjDqa1z+IXLS8V3oTNdOgQ0iSzE2csGkbkZLQDEYM+nyuzTbHPNUwoJ7A6e/cJR20nI/EzdRRIwI9KK5wNa2iPc2Xm0VNnZxlA7wlQ96Qa6PH8hz8x6pw/mHC+219wH3LRcI1r10M7g7oLBl3lIfF6aBy8GP/iKD0ENlzLEKsDg27YUsTAD1ZV7BsImwRTntI58wVcSfjUxxMQJffrN9nd9DCgLDnxUqHyGqaBGvYowrcpyXHt4KqJ1KR3Bp0mkd5UkC2/g2uw4p0hqbfCbbce/1zstbNR9JGnc86RlmZQffKypVkIKfm9dHpkqkgLbkpyVEznz5ydDU9SWo1lnPp8uJp6Mmrf0DqUyNWtZWpk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(36860700001)(4326008)(47076005)(356005)(5660300002)(82310400004)(40460700001)(1076003)(30864003)(36756003)(81166007)(83380400001)(2616005)(7696005)(2906002)(6666004)(70586007)(26005)(186003)(336012)(16526019)(316002)(70206006)(508600001)(110136005)(54906003)(426003)(86362001)(8676002)(8936002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:31.1045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 739e8076-7b0e-47bc-f143-08d9c5ac6785
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3422
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

Add support to existing CRIU ioctl's to save number of queues and queue
properties for each queue during checkpoint and re-create queues on
restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 110 ++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  43 +++-
 .../amd/amdkfd/kfd_process_queue_manager.c    | 212 ++++++++++++++++++
 3 files changed, 357 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index db2bb302a8d4..9665c8657929 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2006,19 +2006,36 @@ static int criu_checkpoint_bos(struct kfd_process *p,
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
@@ -2026,7 +2043,7 @@ static int criu_checkpoint(struct file *filep,
 			   struct kfd_ioctl_criu_args *args)
 {
 	int ret;
-	uint32_t num_bos;
+	uint32_t num_bos, num_objects;
 	uint64_t priv_size, priv_offset = 0;
 
 	if (!args->bos || !args->priv_data)
@@ -2048,9 +2065,12 @@ static int criu_checkpoint(struct file *filep,
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
@@ -2067,6 +2087,17 @@ static int criu_checkpoint(struct file *filep,
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
@@ -2340,6 +2371,62 @@ static int criu_restore_bos(struct kfd_process *p,
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
@@ -2371,6 +2458,10 @@ static int criu_restore(struct file *filep,
 	if (ret)
 		goto exit_unlock;
 
+	ret = criu_restore_objects(filep, p, args, &priv_offset, args->priv_data_size);
+	if (ret)
+		goto exit_unlock;
+
 	if (priv_offset != args->priv_data_size) {
 		pr_err("Invalid private data size\n");
 		ret = -EINVAL;
@@ -2468,9 +2559,14 @@ static int criu_process_info(struct file *filep,
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
index f3a9f3de34e4..7c2679a23aa3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1057,6 +1057,16 @@ struct kfd_criu_bo_priv_data {
 	uint32_t idr_handle;
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
 	uint64_t reserved;
@@ -1064,7 +1074,26 @@ struct kfd_criu_svm_range_priv_data {
 
 struct kfd_criu_queue_priv_data {
 	uint32_t object_type;
-	uint64_t reserved;
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
 	uint64_t reserved;
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
index 4f8464658daf..480ad794df4e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -498,6 +498,218 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
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
+			return -EOPNOTSUPP;
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
+static int set_queue_properties_from_criu(struct queue_properties *qp,
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
+
+	return 0;
+}
+
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
+	ret = set_queue_properties_from_criu(&qp, q_data);
+	if (ret)
+		goto exit;
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

