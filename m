Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596694A810B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4C410EAA4;
	Thu,  3 Feb 2022 09:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FA510EA49;
 Thu,  3 Feb 2022 09:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR7syZnmRWaV0AV/KC/KaFkbc5Xkdg39mW7m/OdPXvr6x08eDG8NyUvQvMZMEyP886h30nbHS7n30ObbgJMI4wGPkQLd2OVNKLprgC7AKOaWwLYF8ChXqrOGAGeeLKnc75QlchwqrvwJnlqejWd2NyjKBjn7a5oVyiEnJeIqZIQzNS2P7zPftagd0WS8L0PFDuL323dcoyEi2r6A13982lOfLZjMBjYseqmV4lLmZGCojbcl1gawdpear19Lg8SmyUVSFsURduXfkI9HDGdDTpsR9T7NMxYCf36DPHBO3Omm0R1Oklt9j5t7coB3gbyjUIOY1OJHVR/8F0RZt/XZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J97OUcjpBeXXp1yswkHYY2ogs6F8z37KJjHaenETR9A=;
 b=D605zAjgH5T3+5mCk19/ZXNXuLZtSkbh4eoMHleskXaJfo4sjfuqXJ5zWoUzRNcn2/8AXidQBj3cEmdUKVuaN95cAGaiV32FolQQa2nGEUphfc5NrpJAQvadyHxowR/03tU1JufqGz45gZLeTNc8l7nqPtA6W9Uw6fVWoxIBzusTwcFR3PEbg75M5gCqapgp4kEPt2Pq2i3V16m1FoiuDTuWApUr/ylH5DkULKw2UY4eX/WATbblfi3pWstbDv1tolY0X54asPEw3GJEyYHDNK6fp1Ccc//bJ97goP0L+u+v86vLhf3DcGcdFcx6utPkMu5OlO5YchIaED9IiaF8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J97OUcjpBeXXp1yswkHYY2ogs6F8z37KJjHaenETR9A=;
 b=PXjDisMtI0tloKM4Ya82iBx39qRd1u0+RKtYcBInvMfUzjRS2vgpdLCBpFwjICt4V03oYcyzlFF4SmFwZ8eNqsVm8Apc0rg2Mu+KQdSTRYCSQ9pvqvKK+Nf3RLJztpdznA7VU9IQwCcupmARoWpzslULZAbOA93sSihLx1V7Osg=
Received: from BN6PR11CA0068.namprd11.prod.outlook.com (2603:10b6:404:f7::30)
 by SN1PR12MB2591.namprd12.prod.outlook.com (2603:10b6:802:30::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:42 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::bf) by BN6PR11CA0068.outlook.office365.com
 (2603:10b6:404:f7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:42 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:38 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 12/24] drm/amdkfd: CRIU checkpoint and restore queue mqds
Date: Thu, 3 Feb 2022 04:09:06 -0500
Message-ID: <20220203090918.11520-13-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 31e16059-2708-440f-e505-08d9e6f4ea0c
X-MS-TrafficTypeDiagnostic: SN1PR12MB2591:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB259178C4C2C1A678105024E7FE289@SN1PR12MB2591.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kP3vREywXqmy8M3kDGphT4OsCeqSwwnKHpgbgLBswUsnOlVXJ4j2/VgIHvWINfkqk51d6PzC3JBFfnJ1ozF/touxPLEoxHnCWYJKpavccEBtaC1gxoiHMg0J+kxEkZcpGzrDyNX9WwIg38dW/+StQBYXZH82RXu1kkiehnsK16sFeSManhBCRQzIueVP+7nr5IdnyvhXeG3s+56KsL7ZE5oWelNONe1og2fSsXv22WmnTE73gwXlxhE6KOoOBtEQYS6ldPpjgwf/tPmsV1bGbyBvjtcZzKGyb21/s1o70cGK07pzbH01nXkvcva6rFgfTXfjhCr+qLr9dcrb68kWc66TmPDEZfSclhtg9n3L8+Lxu0QdxWrrdloBkRWyLeD1GI8RJqQV2Env5iu1vX5tR7IUKs0OXlmq3s7ulTHVTzwZhXDNxMa6Bl18+C05YFTuvPjm+B8A1B+iR0D434xBZgxEu00Nkqf6tFUrhTVF/SdGWM4ow7UtX/9W3BtgNhd4eCq4lBBPPqUCDW3bBUFnHxmTb0looyMCIx69735RamB+HdLRzZ5V9yXWVTTrwDfd/Q5T8Bpigiz7YK+5zz/FhWFXyGRG3tYxoAJM+YWw1umEoRHeegK7AxYhkq1mmL8QW/qtKtoYTQLgGBwuZw0a6eRg19Zk/KClEids7v6kF1wqjf8ucCBn35IYBaKAyQhSLySojg1ej1RAnMtZpXHDlCci4S3uhH2GRw+swBHw9CNzqH8HT7wn5zyA/QYKmc+4
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(54906003)(6916009)(36860700001)(508600001)(336012)(86362001)(47076005)(316002)(40460700003)(36756003)(426003)(8936002)(6666004)(4326008)(26005)(1076003)(16526019)(450100002)(7696005)(70206006)(83380400001)(70586007)(82310400004)(8676002)(186003)(2906002)(2616005)(5660300002)(356005)(81166007)(44832011)(30864003)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:42.2133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e16059-2708-440f-e505-08d9e6f4ea0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2591
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

Checkpoint contents of queue MQD's on CRIU dump and restore them during
CRIU restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |   2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  73 +++++++-
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |   7 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |  70 ++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  71 ++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  71 ++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  72 ++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 +
 .../amd/amdkfd/kfd_process_queue_manager.c    | 157 ++++++++++++++++--
 11 files changed, 516 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index d35911550792..999672602252 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -311,7 +311,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 			p->pasid,
 			dev->id);
 
-	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL,
+	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL, NULL,
 			&doorbell_offset_in_process);
 	if (err != 0)
 		goto err_create_queue;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
index 0c50e67e2b51..3a5303ebcabf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
@@ -185,7 +185,7 @@ static int dbgdev_register_diq(struct kfd_dbgdev *dbgdev)
 	properties.type = KFD_QUEUE_TYPE_DIQ;
 
 	status = pqm_create_queue(dbgdev->pqm, dbgdev->dev, NULL,
-				&properties, &qid, NULL, NULL);
+				&properties, &qid, NULL, NULL, NULL);
 
 	if (status) {
 		pr_err("Failed to create DIQ\n");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 13317d2c8959..42933610d4e1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -322,7 +322,8 @@ static void deallocate_vmid(struct device_queue_manager *dqm,
 static int create_queue_nocpsch(struct device_queue_manager *dqm,
 				struct queue *q,
 				struct qcm_process_device *qpd,
-				const struct kfd_criu_queue_priv_data *qd)
+				const struct kfd_criu_queue_priv_data *qd,
+				const void *restore_mqd)
 {
 	struct mqd_manager *mqd_mgr;
 	int retval;
@@ -381,8 +382,14 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 		retval = -ENOMEM;
 		goto out_deallocate_doorbell;
 	}
-	mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
-				&q->gart_mqd_addr, &q->properties);
+
+	if (qd)
+		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
+				     &q->properties, restore_mqd);
+	else
+		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
+					&q->gart_mqd_addr, &q->properties);
+
 	if (q->properties.is_active) {
 		if (!dqm->sched_running) {
 			WARN_ONCE(1, "Load non-HWS mqd while stopped\n");
@@ -1334,7 +1341,8 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
 
 static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 			struct qcm_process_device *qpd,
-			const struct kfd_criu_queue_priv_data *qd)
+			const struct kfd_criu_queue_priv_data *qd,
+			const void *restore_mqd)
 {
 	int retval;
 	struct mqd_manager *mqd_mgr;
@@ -1380,8 +1388,13 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	 * updates the is_evicted flag but is a no-op otherwise.
 	 */
 	q->properties.is_evicted = !!qpd->evicted;
-	mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
-				&q->gart_mqd_addr, &q->properties);
+
+	if (qd)
+		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
+				     &q->properties, restore_mqd);
+	else
+		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
+					&q->gart_mqd_addr, &q->properties);
 
 	list_add(&q->list, &qpd->queues_list);
 	qpd->queue_count++;
@@ -1784,6 +1797,50 @@ static int get_wave_state(struct device_queue_manager *dqm,
 			ctl_stack_used_size, save_area_used_size);
 }
 
+static void get_queue_checkpoint_info(struct device_queue_manager *dqm,
+			const struct queue *q,
+			u32 *mqd_size)
+{
+	struct mqd_manager *mqd_mgr;
+	enum KFD_MQD_TYPE mqd_type =
+			get_mqd_type_from_queue_type(q->properties.type);
+
+	dqm_lock(dqm);
+	mqd_mgr = dqm->mqd_mgrs[mqd_type];
+	*mqd_size = mqd_mgr->mqd_size;
+
+	dqm_unlock(dqm);
+}
+
+static int checkpoint_mqd(struct device_queue_manager *dqm,
+			  const struct queue *q,
+			  void *mqd)
+{
+	struct mqd_manager *mqd_mgr;
+	int r = 0;
+	enum KFD_MQD_TYPE mqd_type =
+			get_mqd_type_from_queue_type(q->properties.type);
+
+	dqm_lock(dqm);
+
+	if (q->properties.is_active || !q->device->cwsr_enabled) {
+		r = -EINVAL;
+		goto dqm_unlock;
+	}
+
+	mqd_mgr = dqm->mqd_mgrs[mqd_type];
+	if (!mqd_mgr->checkpoint_mqd) {
+		r = -EOPNOTSUPP;
+		goto dqm_unlock;
+	}
+
+	mqd_mgr->checkpoint_mqd(mqd_mgr, q->mqd, mqd);
+
+dqm_unlock:
+	dqm_unlock(dqm);
+	return r;
+}
+
 static int process_termination_cpsch(struct device_queue_manager *dqm,
 		struct qcm_process_device *qpd)
 {
@@ -1961,6 +2018,8 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 		dqm->ops.restore_process_queues = restore_process_queues_cpsch;
 		dqm->ops.get_wave_state = get_wave_state;
 		dqm->ops.reset_queues = reset_queues_cpsch;
+		dqm->ops.get_queue_checkpoint_info = get_queue_checkpoint_info;
+		dqm->ops.checkpoint_mqd = checkpoint_mqd;
 		break;
 	case KFD_SCHED_POLICY_NO_HWS:
 		/* initialize dqm for no cp scheduling */
@@ -1980,6 +2039,8 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 		dqm->ops.restore_process_queues =
 			restore_process_queues_nocpsch;
 		dqm->ops.get_wave_state = get_wave_state;
+		dqm->ops.get_queue_checkpoint_info = get_queue_checkpoint_info;
+		dqm->ops.checkpoint_mqd = checkpoint_mqd;
 		break;
 	default:
 		pr_err("Invalid scheduling policy %d\n", dqm->sched_policy);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 76cc5e2a9733..fb6aa2a1ca0f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -83,13 +83,17 @@ struct device_process_node {
  * control stack, if kept in the MQD, to the given userspace address.
  *
  * @reset_queues: reset queues which consume RAS poison
+ * @get_queue_checkpoint_info: Retrieves queue size information for CRIU checkpoint.
+ *
+ * @checkpoint_mqd: checkpoint queue MQD contents for CRIU.
  */
 
 struct device_queue_manager_ops {
 	int	(*create_queue)(struct device_queue_manager *dqm,
 				struct queue *q,
 				struct qcm_process_device *qpd,
-				const struct kfd_criu_queue_priv_data *qd);
+				const struct kfd_criu_queue_priv_data *qd,
+				const void *restore_mqd);
 
 	int	(*destroy_queue)(struct device_queue_manager *dqm,
 				struct qcm_process_device *qpd,
@@ -140,6 +144,12 @@ struct device_queue_manager_ops {
 
 	int (*reset_queues)(struct device_queue_manager *dqm,
 					uint16_t pasid);
+	void	(*get_queue_checkpoint_info)(struct device_queue_manager *dqm,
+				  const struct queue *q, u32 *mqd_size);
+
+	int	(*checkpoint_mqd)(struct device_queue_manager *dqm,
+				  const struct queue *q,
+				  void *mqd);
 };
 
 struct device_queue_manager_asic_ops {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
index 965e17c5dbb4..cebb2877a505 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
@@ -100,6 +100,13 @@ struct mqd_manager {
 				  u32 *ctl_stack_used_size,
 				  u32 *save_area_used_size);
 
+	void	(*checkpoint_mqd)(struct mqd_manager *mm, void *mqd, void *mqd_dst);
+
+	void	(*restore_mqd)(struct mqd_manager *mm, void **mqd,
+				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+				struct queue_properties *p,
+				const void *mqd_src);
+
 #if defined(CONFIG_DEBUG_FS)
 	int	(*debugfs_show_mqd)(struct seq_file *m, void *data);
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index e9a8e21e144e..83117209bc15 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -280,6 +280,72 @@ static int destroy_mqd(struct mqd_manager *mm, void *mqd,
 					pipe_id, queue_id);
 }
 
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+{
+	struct cik_mqd *m;
+
+	m = get_mqd(mqd);
+
+	memcpy(mqd_dst, m, sizeof(struct cik_mqd));
+}
+
+static void restore_mqd(struct mqd_manager *mm, void **mqd,
+			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+			struct queue_properties *qp,
+			const void *mqd_src)
+{
+	uint64_t addr;
+	struct cik_mqd *m;
+
+	m = (struct cik_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, mqd_src, sizeof(*m));
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	m->cp_hqd_pq_doorbell_control = DOORBELL_OFFSET(qp->doorbell_off);
+
+	pr_debug("cp_hqd_pq_doorbell_control 0x%x\n",
+			m->cp_hqd_pq_doorbell_control);
+
+	qp->is_active = 0;
+}
+
+static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+{
+	struct cik_sdma_rlc_registers *m;
+
+	m = get_sdma_mqd(mqd);
+
+	memcpy(mqd_dst, m, sizeof(struct cik_sdma_rlc_registers));
+}
+
+static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
+				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+				struct queue_properties *qp,
+				const void *mqd_src)
+{
+	uint64_t addr;
+	struct cik_sdma_rlc_registers *m;
+
+	m = (struct cik_sdma_rlc_registers *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, mqd_src, sizeof(*m));
+
+	m->sdma_rlc_doorbell =
+		qp->doorbell_off << SDMA0_RLC0_DOORBELL__OFFSET__SHIFT;
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	qp->is_active = 0;
+}
+
 /*
  * preempt type here is ignored because there is only one way
  * to preempt sdma queue
@@ -394,6 +460,8 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd;
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
+		mqd->checkpoint_mqd = checkpoint_mqd;
+		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct cik_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -434,6 +502,8 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct cik_sdma_rlc_registers);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index d74d8a6ac27a..4ddf5b45c42a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -285,6 +285,41 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+{
+	struct v10_compute_mqd *m;
+
+	m = get_mqd(mqd);
+
+	memcpy(mqd_dst, m, sizeof(struct v10_compute_mqd));
+}
+
+static void restore_mqd(struct mqd_manager *mm, void **mqd,
+			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+			struct queue_properties *qp,
+			const void *mqd_src)
+{
+	uint64_t addr;
+	struct v10_compute_mqd *m;
+
+	m = (struct v10_compute_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, mqd_src, sizeof(*m));
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	m->cp_hqd_pq_doorbell_control =
+		qp->doorbell_off <<
+			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
+	pr_debug("cp_hqd_pq_doorbell_control 0x%x\n",
+			m->cp_hqd_pq_doorbell_control);
+
+	qp->is_active = 0;
+}
+
 static void init_mqd_hiq(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *q)
@@ -373,6 +408,38 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
 }
 
+static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+{
+	struct v10_sdma_mqd *m;
+
+	m = get_sdma_mqd(mqd);
+
+	memcpy(mqd_dst, m, sizeof(struct v10_sdma_mqd));
+}
+
+static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
+			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+			     struct queue_properties *qp,
+			     const void *mqd_src)
+{
+	uint64_t addr;
+	struct v10_sdma_mqd *m;
+
+	m = (struct v10_sdma_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, mqd_src, sizeof(*m));
+
+	m->sdmax_rlcx_doorbell_offset =
+		qp->doorbell_off << SDMA0_RLC0_DOORBELL_OFFSET__OFFSET__SHIFT;
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	qp->is_active = 0;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int debugfs_show_mqd(struct seq_file *m, void *data)
@@ -417,6 +484,8 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->is_occupied = is_occupied;
 		mqd->mqd_size = sizeof(struct v10_compute_mqd);
 		mqd->get_wave_state = get_wave_state;
+		mqd->checkpoint_mqd = checkpoint_mqd;
+		mqd->restore_mqd = restore_mqd;
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
 #endif
@@ -460,6 +529,8 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct v10_sdma_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 326eb2285029..18ad7669eedf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -340,6 +340,41 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+{
+	struct v9_mqd *m;
+
+	m = get_mqd(mqd);
+
+	memcpy(mqd_dst, m, sizeof(struct v9_mqd));
+}
+
+static void restore_mqd(struct mqd_manager *mm, void **mqd,
+			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+			struct queue_properties *qp,
+			const void *mqd_src)
+{
+	uint64_t addr;
+	struct v9_mqd *m;
+
+	m = (struct v9_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, mqd_src, sizeof(*m));
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	m->cp_hqd_pq_doorbell_control =
+		qp->doorbell_off <<
+			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
+	pr_debug("cp_hqd_pq_doorbell_control 0x%x\n",
+				m->cp_hqd_pq_doorbell_control);
+
+	qp->is_active = 0;
+}
+
 static void init_mqd_hiq(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *q)
@@ -428,6 +463,38 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
 }
 
+static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+{
+	struct v9_sdma_mqd *m;
+
+	m = get_sdma_mqd(mqd);
+
+	memcpy(mqd_dst, m, sizeof(struct v9_sdma_mqd));
+}
+
+static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
+			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+			     struct queue_properties *qp,
+			     const void *mqd_src)
+{
+	uint64_t addr;
+	struct v9_sdma_mqd *m;
+
+	m = (struct v9_sdma_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, mqd_src, sizeof(*m));
+
+	m->sdmax_rlcx_doorbell_offset =
+		qp->doorbell_off << SDMA0_RLC0_DOORBELL_OFFSET__OFFSET__SHIFT;
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	qp->is_active = 0;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int debugfs_show_mqd(struct seq_file *m, void *data)
@@ -470,6 +537,8 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->checkpoint_mqd = checkpoint_mqd;
+		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct v9_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -510,6 +579,8 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct v9_sdma_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index d456e950ce1d..9fdc67b60bb4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -306,6 +306,42 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+{
+	struct vi_mqd *m;
+
+	m = get_mqd(mqd);
+
+	memcpy(mqd_dst, m, sizeof(struct vi_mqd));
+}
+
+static void restore_mqd(struct mqd_manager *mm, void **mqd,
+			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+			struct queue_properties *qp,
+			const void *mqd_src)
+{
+	uint64_t addr;
+	struct vi_mqd *m;
+
+	m = (struct vi_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, mqd_src, sizeof(*m));
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	m->cp_hqd_pq_doorbell_control =
+		qp->doorbell_off <<
+			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
+	pr_debug("cp_hqd_pq_doorbell_control 0x%x\n",
+			m->cp_hqd_pq_doorbell_control);
+
+	qp->is_active = 0;
+}
+
+
 static void init_mqd_hiq(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *q)
@@ -399,6 +435,38 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
 }
 
+static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+{
+	struct vi_sdma_mqd *m;
+
+	m = get_sdma_mqd(mqd);
+
+	memcpy(mqd_dst, m, sizeof(struct vi_sdma_mqd));
+}
+
+static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
+			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+			     struct queue_properties *qp,
+			     const void *mqd_src)
+{
+	uint64_t addr;
+	struct vi_sdma_mqd *m;
+
+	m = (struct vi_sdma_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, mqd_src, sizeof(*m));
+
+	m->sdmax_rlcx_doorbell =
+		qp->doorbell_off << SDMA0_RLC0_DOORBELL__OFFSET__SHIFT;
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	qp->is_active = 0;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int debugfs_show_mqd(struct seq_file *m, void *data)
@@ -441,6 +509,8 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->checkpoint_mqd = checkpoint_mqd;
+		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct vi_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -481,6 +551,8 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct vi_sdma_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 59125d8f16a7..1c62abe0dbd5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1158,6 +1158,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
 			    const struct kfd_criu_queue_priv_data *q_data,
+			    const void *restore_mqd,
 			    uint32_t *p_doorbell_offset_in_process);
 int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid);
 int pqm_update_queue_properties(struct process_queue_manager *pqm, unsigned int qid,
@@ -1180,6 +1181,10 @@ int amdkfd_fence_wait_timeout(uint64_t *fence_addr,
 			      uint64_t fence_value,
 			      unsigned int timeout_ms);
 
+int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
+				  unsigned int qid,
+				  u32 *mqd_size);
+
 /* Packet Manager */
 
 #define KFD_FENCE_COMPLETED (100)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 8afe6879b861..844917c1c346 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -208,6 +208,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
 			    const struct kfd_criu_queue_priv_data *q_data,
+			    const void *restore_mqd,
 			    uint32_t *p_doorbell_offset_in_process)
 {
 	int retval;
@@ -272,7 +273,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
 		print_queue(q);
 		break;
 
@@ -292,7 +293,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
 		print_queue(q);
 		break;
 	case KFD_QUEUE_TYPE_DIQ:
@@ -517,12 +518,25 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
+static int get_queue_data_sizes(struct kfd_process_device *pdd, struct queue *q, uint32_t *mqd_size)
+{
+	int ret;
+
+	ret = pqm_get_queue_checkpoint_info(&pdd->process->pqm, q->properties.queue_id, mqd_size);
+	if (ret)
+		pr_err("Failed to get queue dump info (%d)\n", ret);
+
+	return ret;
+}
+
 int kfd_process_get_queue_info(struct kfd_process *p,
 			       uint32_t *num_queues,
 			       uint64_t *priv_data_sizes)
 {
+	uint32_t extra_data_sizes = 0;
 	struct queue *q;
 	int i;
+	int ret;
 
 	*num_queues = 0;
 
@@ -534,23 +548,53 @@ int kfd_process_get_queue_info(struct kfd_process *p,
 			if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE ||
 				q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 				q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
-
+				uint32_t mqd_size;
 				*num_queues = *num_queues + 1;
+
+				ret = get_queue_data_sizes(pdd, q, &mqd_size);
+				if (ret)
+					return ret;
+
+				extra_data_sizes += mqd_size;
 			} else {
 				pr_err("Unsupported queue type (%d)\n", q->properties.type);
 				return -EOPNOTSUPP;
 			}
 		}
 	}
-	*priv_data_sizes = *num_queues * sizeof(struct kfd_criu_queue_priv_data);
+	*priv_data_sizes = extra_data_sizes +
+				(*num_queues * sizeof(struct kfd_criu_queue_priv_data));
 
 	return 0;
 }
 
-static void criu_checkpoint_queue(struct kfd_process_device *pdd,
+static int pqm_checkpoint_mqd(struct process_queue_manager *pqm, unsigned int qid, void *mqd)
+{
+	struct process_queue_node *pqn;
+
+	pqn = get_queue_by_qid(pqm, qid);
+	if (!pqn) {
+		pr_debug("amdkfd: No queue %d exists for operation\n", qid);
+		return -EFAULT;
+	}
+
+	if (!pqn->q->device->dqm->ops.checkpoint_mqd) {
+		pr_err("amdkfd: queue dumping not supported on this device\n");
+		return -EOPNOTSUPP;
+	}
+
+	return pqn->q->device->dqm->ops.checkpoint_mqd(pqn->q->device->dqm, pqn->q, mqd);
+}
+
+static int criu_checkpoint_queue(struct kfd_process_device *pdd,
 			   struct queue *q,
 			   struct kfd_criu_queue_priv_data *q_data)
 {
+	uint8_t *mqd;
+	int ret;
+
+	mqd = (void *)(q_data + 1);
+
 	q_data->gpu_id = pdd->dev->id;
 	q_data->type = q->properties.type;
 	q_data->format = q->properties.format;
@@ -576,7 +620,14 @@ static void criu_checkpoint_queue(struct kfd_process_device *pdd,
 	q_data->ctx_save_restore_area_size =
 		q->properties.ctx_save_restore_area_size;
 
+	ret = pqm_checkpoint_mqd(&pdd->process->pqm, q->properties.queue_id, mqd);
+	if (ret) {
+		pr_err("Failed checkpoint queue_mqd (%d)\n", ret);
+		return ret;
+	}
+
 	pr_debug("Dumping Queue: gpu_id:%x queue_id:%u\n", q_data->gpu_id, q_data->q_id);
+	return ret;
 }
 
 static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
@@ -584,15 +635,16 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 				   unsigned int *q_index,
 				   uint64_t *queues_priv_data_offset)
 {
-	struct kfd_criu_queue_priv_data *q_data;
+	unsigned int q_private_data_size = 0;
+	uint8_t *q_private_data = NULL; /* Local buffer to store individual queue private data */
 	struct queue *q;
 	int ret = 0;
 
-	q_data = kzalloc(sizeof(*q_data), GFP_KERNEL);
-	if (!q_data)
-		return -ENOMEM;
-
 	list_for_each_entry(q, &pdd->qpd.queues_list, list) {
+		struct kfd_criu_queue_priv_data *q_data;
+		uint64_t q_data_size;
+		uint32_t mqd_size;
+
 		if (q->properties.type != KFD_QUEUE_TYPE_COMPUTE &&
 			q->properties.type != KFD_QUEUE_TYPE_SDMA &&
 			q->properties.type != KFD_QUEUE_TYPE_SDMA_XGMI) {
@@ -602,19 +654,46 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 			break;
 		}
 
-		criu_checkpoint_queue(pdd, q, q_data);
+		ret = get_queue_data_sizes(pdd, q, &mqd_size);
+		if (ret)
+			break;
+
+		q_data_size = sizeof(*q_data) + mqd_size;
+
+		/* Increase local buffer space if needed */
+		if (q_private_data_size < q_data_size) {
+			kfree(q_private_data);
+
+			q_private_data = kzalloc(q_data_size, GFP_KERNEL);
+			if (!q_private_data) {
+				ret = -ENOMEM;
+				break;
+			}
+			q_private_data_size = q_data_size;
+		}
+
+		q_data = (struct kfd_criu_queue_priv_data *)q_private_data;
+
+		/* data stored in this order: priv_data, mqd */
+		q_data->mqd_size = mqd_size;
+
+		ret = criu_checkpoint_queue(pdd, q, q_data);
+		if (ret)
+			break;
+
 		q_data->object_type = KFD_CRIU_OBJECT_TYPE_QUEUE;
 
-		ret = copy_to_user(user_priv + *queues_priv_data_offset, q_data, sizeof(*q_data));
+		ret = copy_to_user(user_priv + *queues_priv_data_offset,
+				q_data, q_data_size);
 		if (ret) {
 			ret = -EFAULT;
 			break;
 		}
-		*queues_priv_data_offset += sizeof(*q_data);
+		*queues_priv_data_offset += q_data_size;
 		*q_index = *q_index + 1;
 	}
 
-	kfree(q_data);
+	kfree(q_private_data);
 
 	return ret;
 }
@@ -668,11 +747,12 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 			   uint64_t max_priv_data_size)
 {
 	struct kfd_criu_queue_priv_data *q_data;
+	uint8_t *mqd, *q_extra_data = NULL;
 	struct kfd_process_device *pdd;
-	struct kfd_dev *dev;
+	uint64_t q_extra_data_size;
 	struct queue_properties qp;
 	unsigned int queue_id;
-
+	struct kfd_dev *dev;
 	int ret = 0;
 
 	if (*priv_data_offset + sizeof(*q_data) > max_priv_data_size)
@@ -689,6 +769,26 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 	}
 
 	*priv_data_offset += sizeof(*q_data);
+	q_extra_data_size = q_data->mqd_size;
+
+	if (*priv_data_offset + q_extra_data_size > max_priv_data_size) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	q_extra_data = kmalloc(q_extra_data_size, GFP_KERNEL);
+	if (!q_extra_data) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	ret = copy_from_user(q_extra_data, user_priv_ptr + *priv_data_offset, q_extra_data_size);
+	if (ret) {
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	*priv_data_offset += q_extra_data_size;
 
 	dev = kfd_device_by_id(q_data->gpu_id);
 	if (!dev) {
@@ -705,13 +805,15 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 		ret = -EFAULT;
 		return ret;
 	}
+	/* data stored in this order: mqd */
+	mqd = q_extra_data;
 
 	memset(&qp, 0, sizeof(qp));
 	set_queue_properties_from_criu(&qp, q_data);
 
 	print_queue_properties(&qp);
 
-	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, NULL);
+	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, mqd, NULL);
 	if (ret) {
 		pr_err("Failed to create new queue err:%d\n", ret);
 		ret = -EINVAL;
@@ -728,6 +830,27 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 	return ret;
 }
 
+int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
+				  unsigned int qid,
+				  uint32_t *mqd_size)
+{
+	struct process_queue_node *pqn;
+
+	pqn = get_queue_by_qid(pqm, qid);
+	if (!pqn) {
+		pr_debug("amdkfd: No queue %d exists for operation\n", qid);
+		return -EFAULT;
+	}
+
+	if (!pqn->q->device->dqm->ops.get_queue_checkpoint_info) {
+		pr_err("amdkfd: queue dumping not supported on this device\n");
+		return -EOPNOTSUPP;
+	}
+
+	pqn->q->device->dqm->ops.get_queue_checkpoint_info(pqn->q->device->dqm, pqn->q, mqd_size);
+	return 0;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 int pqm_debugfs_mqds(struct seq_file *m, void *data)
-- 
2.17.1

