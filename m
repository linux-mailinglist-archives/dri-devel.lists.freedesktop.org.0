Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74904A811A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBED10EB2D;
	Thu,  3 Feb 2022 09:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE1A10EA78;
 Thu,  3 Feb 2022 09:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOTV3lulm6CsBYXihB3dLe0YNQqetDctlXr/jMwx41lsPFhiS4sQU3pNkLqbTHGE5HuTEoeWjH10TrxnlxoGyDyeLHo7qVQpegFxRoxG+SXZhSlXycGUtaG2lp5lGe12z8WBSPcfKMC7DFDLDlp4rpXuCp7I0YvT7jFl8x6FecHC8w+urOqNibYi31AkbpJ9/JDqDhLntJLPz5aQA/j1Qd/DJchj5w8/dDihrXP+JfYC8KKu9mJd0fUsEI2duoyU+WOWJ3fd3b0FxkDdMXLjsLpivn1jqyNxWxEhELZT7RFpA4Udu+iRCSAl82qQbP6vc9lJ0Dn9YNsGwQuKqMZIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrdnVA59n5xmwgC3zzwdczreJfmGOUGeCsxsicIRhvU=;
 b=nO6qRw81zOCNs+jLGYnDn+GnGnFe0wm193NJit1Kke/Wkvf4hWpfKk3cZEtBtusYkLaJabOKe+7Thl18YAghoECUhNSZqON5EyoAkx99ixqfDDDGj7fxLUWMn2va5IVMYlMSUo5eXhAmbpFiUfFk+lbPCW3fLyyu1g3RfiBtNbZaF6BmrjySUWUdSlEAiRmAsIhglD+YCc2WwD5t4P76GpmRsn1SxbiSB7XIPgwQgN07a9dx1aaX7BXr8l15IvyXbJPLy1yP9U3/dwLxcKY9REfvWCynCVy+fkXIhUfEx1b3iM+RJ5G7kIDVg3xE7u0tIMeOS6zclh12ZL1fI7uLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrdnVA59n5xmwgC3zzwdczreJfmGOUGeCsxsicIRhvU=;
 b=4rXIbqOmrASei31K0w7oRhnJRRbK/iNioST+LC/vtmtkJWrK8roFLPUgg5d7g0n+AgEnOIxgUUOto8FOcAQZq0xCnH7+15UFIjtibmDXNismziHJxSpJba0hfPFWI+0kKrneSFoK7BfbFYLlmfOdd/nTEjV2Km6CXgQScKoyWVI=
Received: from BN9PR03CA0367.namprd03.prod.outlook.com (2603:10b6:408:f7::12)
 by DM6PR12MB4812.namprd12.prod.outlook.com (2603:10b6:5:1ff::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Thu, 3 Feb
 2022 09:09:42 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::a7) by BN9PR03CA0367.outlook.office365.com
 (2603:10b6:408:f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:42 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:39 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 13/24] drm/amdkfd: CRIU checkpoint and restore queue
 control stack
Date: Thu, 3 Feb 2022 04:09:07 -0500
Message-ID: <20220203090918.11520-14-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0237177e-c493-45d7-92de-08d9e6f4ea35
X-MS-TrafficTypeDiagnostic: DM6PR12MB4812:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB48123CF167B999C6C9C7970AFE289@DM6PR12MB4812.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/sahkNBAA6u01z22cpF8VA6iO1WgWgFmsX//RbjKfcyNOhcNnFWfQ9ceh2RPXAXwV1JaE8ah5C3Pd9PSYrG5pqHhrJcQS4eWCP1zv36Kjk069pwt4gi+od2duOAHpR5vAD+gUA8VwZvVp9cSKXIlLmQs1XERpJyCcNcWQQcIKkmc5lCIkNTO+fZfm5SpXhEXA2QpA/iU1MU3uMFrNXI4WxaSGg1FRNw3T9QAarzTeaNKdwUxvCfSYU3n9rfjxTDwyQ/AwBUeyaNXgYbEWGZX3Rdm9pDA09PS2XE8XTqj2TFrtyNiqOB4jgN0Qkm1S3Z1QktfitXEgGuVqMGyYpaKeGHXq93ouM+yxC/np5CYM0z9Yxyif4cSle5kQIljIB+uhe9zfKMOs3PG88Q/N3hXR0dDleLZ0H/KAPSB+aFRoKP4OUcFyj8z/1Q+DqX4HNnTrrAoKakM8mAqjsEmfR4C23u6MxD5hMnqRyye9zgIyyy4spYXagttzhlWV0YpHun9/sfxSBWbPd8Jqbsw8VktdSARudH9pmrHtO31zOlJPMsyDqmZFbVfmceo7ySWcUEdj8EKP8SkhVNueve5/q7oMP8Wnj0IlzyeGEdfYHAn5LAtWDp2QOWeNMGMyyC4lCE8NvsmBUC67aBLQMRh9gQaOlK9zH7jNBUSvMBqKRIbGrnBAlfl8TXNCtD2p14BIr2vSHa+GVTMYeYQCR5CMOpkg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6916009)(83380400001)(508600001)(186003)(5660300002)(36756003)(26005)(316002)(2616005)(426003)(1076003)(336012)(82310400004)(47076005)(2906002)(8936002)(70586007)(81166007)(8676002)(6666004)(30864003)(4326008)(36860700001)(70206006)(16526019)(44832011)(40460700003)(356005)(450100002)(86362001)(7696005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:42.4799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0237177e-c493-45d7-92de-08d9e6f4ea35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4812
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

Checkpoint contents of queue control stacks on CRIU dump and restore them
during CRIU restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |  2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 22 ++++---
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  9 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  | 11 +++-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  | 13 ++--
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  | 14 +++--
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   | 29 +++++++--
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   | 22 +++++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    | 62 +++++++++++++------
 11 files changed, 138 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 999672602252..608214ea634d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -311,7 +311,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 			p->pasid,
 			dev->id);
 
-	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL, NULL,
+	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL, NULL, NULL,
 			&doorbell_offset_in_process);
 	if (err != 0)
 		goto err_create_queue;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
index 3a5303ebcabf..8eca9ed3ab36 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
@@ -185,7 +185,7 @@ static int dbgdev_register_diq(struct kfd_dbgdev *dbgdev)
 	properties.type = KFD_QUEUE_TYPE_DIQ;
 
 	status = pqm_create_queue(dbgdev->pqm, dbgdev->dev, NULL,
-				&properties, &qid, NULL, NULL, NULL);
+				&properties, &qid, NULL, NULL, NULL, NULL);
 
 	if (status) {
 		pr_err("Failed to create DIQ\n");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 42933610d4e1..63b3c7af681b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -323,7 +323,7 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 				struct queue *q,
 				struct qcm_process_device *qpd,
 				const struct kfd_criu_queue_priv_data *qd,
-				const void *restore_mqd)
+				const void *restore_mqd, const void *restore_ctl_stack)
 {
 	struct mqd_manager *mqd_mgr;
 	int retval;
@@ -385,7 +385,8 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 
 	if (qd)
 		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
-				     &q->properties, restore_mqd);
+				     &q->properties, restore_mqd, restore_ctl_stack,
+				     qd->ctl_stack_size);
 	else
 		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
 					&q->gart_mqd_addr, &q->properties);
@@ -1342,7 +1343,7 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
 static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 			struct qcm_process_device *qpd,
 			const struct kfd_criu_queue_priv_data *qd,
-			const void *restore_mqd)
+			const void *restore_mqd, const void *restore_ctl_stack)
 {
 	int retval;
 	struct mqd_manager *mqd_mgr;
@@ -1391,7 +1392,8 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 
 	if (qd)
 		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
-				     &q->properties, restore_mqd);
+				     &q->properties, restore_mqd, restore_ctl_stack,
+				     qd->ctl_stack_size);
 	else
 		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
 					&q->gart_mqd_addr, &q->properties);
@@ -1799,7 +1801,8 @@ static int get_wave_state(struct device_queue_manager *dqm,
 
 static void get_queue_checkpoint_info(struct device_queue_manager *dqm,
 			const struct queue *q,
-			u32 *mqd_size)
+			u32 *mqd_size,
+			u32 *ctl_stack_size)
 {
 	struct mqd_manager *mqd_mgr;
 	enum KFD_MQD_TYPE mqd_type =
@@ -1808,13 +1811,18 @@ static void get_queue_checkpoint_info(struct device_queue_manager *dqm,
 	dqm_lock(dqm);
 	mqd_mgr = dqm->mqd_mgrs[mqd_type];
 	*mqd_size = mqd_mgr->mqd_size;
+	*ctl_stack_size = 0;
+
+	if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE && mqd_mgr->get_checkpoint_info)
+		mqd_mgr->get_checkpoint_info(mqd_mgr, q->mqd, ctl_stack_size);
 
 	dqm_unlock(dqm);
 }
 
 static int checkpoint_mqd(struct device_queue_manager *dqm,
 			  const struct queue *q,
-			  void *mqd)
+			  void *mqd,
+			  void *ctl_stack)
 {
 	struct mqd_manager *mqd_mgr;
 	int r = 0;
@@ -1834,7 +1842,7 @@ static int checkpoint_mqd(struct device_queue_manager *dqm,
 		goto dqm_unlock;
 	}
 
-	mqd_mgr->checkpoint_mqd(mqd_mgr, q->mqd, mqd);
+	mqd_mgr->checkpoint_mqd(mqd_mgr, q->mqd, mqd, ctl_stack);
 
 dqm_unlock:
 	dqm_unlock(dqm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index fb6aa2a1ca0f..a7d2e3323977 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -93,7 +93,8 @@ struct device_queue_manager_ops {
 				struct queue *q,
 				struct qcm_process_device *qpd,
 				const struct kfd_criu_queue_priv_data *qd,
-				const void *restore_mqd);
+				const void *restore_mqd,
+				const void *restore_ctl_stack);
 
 	int	(*destroy_queue)(struct device_queue_manager *dqm,
 				struct qcm_process_device *qpd,
@@ -145,11 +146,13 @@ struct device_queue_manager_ops {
 	int (*reset_queues)(struct device_queue_manager *dqm,
 					uint16_t pasid);
 	void	(*get_queue_checkpoint_info)(struct device_queue_manager *dqm,
-				  const struct queue *q, u32 *mqd_size);
+				  const struct queue *q, u32 *mqd_size,
+				  u32 *ctl_stack_size);
 
 	int	(*checkpoint_mqd)(struct device_queue_manager *dqm,
 				  const struct queue *q,
-				  void *mqd);
+				  void *mqd,
+				  void *ctl_stack);
 };
 
 struct device_queue_manager_asic_ops {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
index cebb2877a505..23486a23df84 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
@@ -100,12 +100,19 @@ struct mqd_manager {
 				  u32 *ctl_stack_used_size,
 				  u32 *save_area_used_size);
 
-	void	(*checkpoint_mqd)(struct mqd_manager *mm, void *mqd, void *mqd_dst);
+	void	(*get_checkpoint_info)(struct mqd_manager *mm, void *mqd, uint32_t *ctl_stack_size);
+
+	void	(*checkpoint_mqd)(struct mqd_manager *mm,
+				  void *mqd,
+				  void *mqd_dst,
+				  void *ctl_stack_dst);
 
 	void	(*restore_mqd)(struct mqd_manager *mm, void **mqd,
 				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 				struct queue_properties *p,
-				const void *mqd_src);
+				const void *mqd_src,
+				const void *ctl_stack_src,
+				const u32 ctl_stack_size);
 
 #if defined(CONFIG_DEBUG_FS)
 	int	(*debugfs_show_mqd)(struct seq_file *m, void *data);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index 83117209bc15..96e3303fa27c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -280,7 +280,7 @@ static int destroy_mqd(struct mqd_manager *mm, void *mqd,
 					pipe_id, queue_id);
 }
 
-static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct cik_mqd *m;
 
@@ -292,7 +292,8 @@ static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct cik_mqd *m;
@@ -314,7 +315,10 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 	qp->is_active = 0;
 }
 
-static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd_sdma(struct mqd_manager *mm,
+				void *mqd,
+				void *mqd_dst,
+				void *ctl_stack_dst)
 {
 	struct cik_sdma_rlc_registers *m;
 
@@ -326,7 +330,8 @@ static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 				struct queue_properties *qp,
-				const void *mqd_src)
+				const void *mqd_src,
+				const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct cik_sdma_rlc_registers *m;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index 4ddf5b45c42a..0cc8679c24fa 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -285,7 +285,7 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
-static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct v10_compute_mqd *m;
 
@@ -297,7 +297,8 @@ static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v10_compute_mqd *m;
@@ -408,7 +409,10 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
 }
 
-static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd_sdma(struct mqd_manager *mm,
+				void *mqd,
+				void *mqd_dst,
+				void *ctl_stack_dst)
 {
 	struct v10_sdma_mqd *m;
 
@@ -420,7 +424,9 @@ static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			     struct queue_properties *qp,
-			     const void *mqd_src)
+			     const void *mqd_src,
+			     const void *ctl_stack_src,
+			     const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v10_sdma_mqd *m;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 18ad7669eedf..87da4329dbf2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -340,22 +340,34 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
-static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void get_checkpoint_info(struct mqd_manager *mm, void *mqd, u32 *ctl_stack_size)
+{
+	struct v9_mqd *m = get_mqd(mqd);
+
+	*ctl_stack_size = m->cp_hqd_cntl_stack_size;
+}
+
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct v9_mqd *m;
+	/* Control stack is located one page after MQD. */
+	void *ctl_stack = (void *)((uintptr_t)mqd + PAGE_SIZE);
 
 	m = get_mqd(mqd);
 
 	memcpy(mqd_dst, m, sizeof(struct v9_mqd));
+	memcpy(ctl_stack_dst, ctl_stack, m->cp_hqd_cntl_stack_size);
 }
 
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v9_mqd *m;
+	void *ctl_stack;
 
 	m = (struct v9_mqd *) mqd_mem_obj->cpu_ptr;
 	addr = mqd_mem_obj->gpu_addr;
@@ -366,6 +378,10 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 	if (gart_addr)
 		*gart_addr = addr;
 
+	/* Control stack is located one page after MQD. */
+	ctl_stack = (void *)((uintptr_t)*mqd + PAGE_SIZE);
+	memcpy(ctl_stack, ctl_stack_src, ctl_stack_size);
+
 	m->cp_hqd_pq_doorbell_control =
 		qp->doorbell_off <<
 			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
@@ -463,7 +479,10 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
 }
 
-static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd_sdma(struct mqd_manager *mm,
+				void *mqd,
+				void *mqd_dst,
+				void *ctl_stack_dst)
 {
 	struct v9_sdma_mqd *m;
 
@@ -475,7 +494,8 @@ static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			     struct queue_properties *qp,
-			     const void *mqd_src)
+			     const void *mqd_src,
+			     const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct v9_sdma_mqd *m;
@@ -537,6 +557,7 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_checkpoint_info = get_checkpoint_info;
 		mqd->checkpoint_mqd = checkpoint_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct v9_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index 9fdc67b60bb4..137b208135a0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -306,7 +306,13 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
-static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void get_checkpoint_info(struct mqd_manager *mm, void *mqd, u32 *ctl_stack_size)
+{
+	/* Control stack is stored in user mode */
+	*ctl_stack_size = 0;
+}
+
+static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct vi_mqd *m;
 
@@ -318,7 +324,8 @@ static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst)
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *qp,
-			const void *mqd_src)
+			const void *mqd_src,
+			const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct vi_mqd *m;
@@ -341,7 +348,6 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 	qp->is_active = 0;
 }
 
-
 static void init_mqd_hiq(struct mqd_manager *mm, void **mqd,
 			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			struct queue_properties *q)
@@ -435,7 +441,10 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
 }
 
-static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst)
+static void checkpoint_mqd_sdma(struct mqd_manager *mm,
+				void *mqd,
+				void *mqd_dst,
+				void *ctl_stack_dst)
 {
 	struct vi_sdma_mqd *m;
 
@@ -447,7 +456,8 @@ static void checkpoint_mqd_sdma(struct mqd_manager *mm, void *mqd, void *mqd_dst
 static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 			     struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
 			     struct queue_properties *qp,
-			     const void *mqd_src)
+			     const void *mqd_src,
+			     const void *ctl_stack_src, const u32 ctl_stack_size)
 {
 	uint64_t addr;
 	struct vi_sdma_mqd *m;
@@ -469,6 +479,7 @@ static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 
 #if defined(CONFIG_DEBUG_FS)
 
+
 static int debugfs_show_mqd(struct seq_file *m, void *data)
 {
 	seq_hex_dump(m, "    ", DUMP_PREFIX_OFFSET, 32, 4,
@@ -509,6 +520,7 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_checkpoint_info = get_checkpoint_info;
 		mqd->checkpoint_mqd = checkpoint_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct vi_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 1c62abe0dbd5..03242975078a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1159,6 +1159,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    unsigned int *qid,
 			    const struct kfd_criu_queue_priv_data *q_data,
 			    const void *restore_mqd,
+			    const void *restore_ctl_stack,
 			    uint32_t *p_doorbell_offset_in_process);
 int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid);
 int pqm_update_queue_properties(struct process_queue_manager *pqm, unsigned int qid,
@@ -1183,8 +1184,8 @@ int amdkfd_fence_wait_timeout(uint64_t *fence_addr,
 
 int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
 				  unsigned int qid,
-				  u32 *mqd_size);
-
+				  u32 *mqd_size,
+				  u32 *ctl_stack_size);
 /* Packet Manager */
 
 #define KFD_FENCE_COMPLETED (100)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 844917c1c346..bd89dd0ca83e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -209,6 +209,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    unsigned int *qid,
 			    const struct kfd_criu_queue_priv_data *q_data,
 			    const void *restore_mqd,
+			    const void *restore_ctl_stack,
 			    uint32_t *p_doorbell_offset_in_process)
 {
 	int retval;
@@ -273,7 +274,8 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data,
+						    restore_mqd, restore_ctl_stack);
 		print_queue(q);
 		break;
 
@@ -293,7 +295,8 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data,
+						    restore_mqd, restore_ctl_stack);
 		print_queue(q);
 		break;
 	case KFD_QUEUE_TYPE_DIQ:
@@ -518,11 +521,17 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
-static int get_queue_data_sizes(struct kfd_process_device *pdd, struct queue *q, uint32_t *mqd_size)
+static int get_queue_data_sizes(struct kfd_process_device *pdd,
+				struct queue *q,
+				uint32_t *mqd_size,
+				uint32_t *ctl_stack_size)
 {
 	int ret;
 
-	ret = pqm_get_queue_checkpoint_info(&pdd->process->pqm, q->properties.queue_id, mqd_size);
+	ret = pqm_get_queue_checkpoint_info(&pdd->process->pqm,
+					    q->properties.queue_id,
+					    mqd_size,
+					    ctl_stack_size);
 	if (ret)
 		pr_err("Failed to get queue dump info (%d)\n", ret);
 
@@ -548,14 +557,15 @@ int kfd_process_get_queue_info(struct kfd_process *p,
 			if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE ||
 				q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 				q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
-				uint32_t mqd_size;
+				uint32_t mqd_size, ctl_stack_size;
+
 				*num_queues = *num_queues + 1;
 
-				ret = get_queue_data_sizes(pdd, q, &mqd_size);
+				ret = get_queue_data_sizes(pdd, q, &mqd_size, &ctl_stack_size);
 				if (ret)
 					return ret;
 
-				extra_data_sizes += mqd_size;
+				extra_data_sizes += mqd_size + ctl_stack_size;
 			} else {
 				pr_err("Unsupported queue type (%d)\n", q->properties.type);
 				return -EOPNOTSUPP;
@@ -568,7 +578,10 @@ int kfd_process_get_queue_info(struct kfd_process *p,
 	return 0;
 }
 
-static int pqm_checkpoint_mqd(struct process_queue_manager *pqm, unsigned int qid, void *mqd)
+static int pqm_checkpoint_mqd(struct process_queue_manager *pqm,
+			      unsigned int qid,
+			      void *mqd,
+			      void *ctl_stack)
 {
 	struct process_queue_node *pqn;
 
@@ -583,17 +596,19 @@ static int pqm_checkpoint_mqd(struct process_queue_manager *pqm, unsigned int qi
 		return -EOPNOTSUPP;
 	}
 
-	return pqn->q->device->dqm->ops.checkpoint_mqd(pqn->q->device->dqm, pqn->q, mqd);
+	return pqn->q->device->dqm->ops.checkpoint_mqd(pqn->q->device->dqm,
+						       pqn->q, mqd, ctl_stack);
 }
 
 static int criu_checkpoint_queue(struct kfd_process_device *pdd,
 			   struct queue *q,
 			   struct kfd_criu_queue_priv_data *q_data)
 {
-	uint8_t *mqd;
+	uint8_t *mqd, *ctl_stack;
 	int ret;
 
 	mqd = (void *)(q_data + 1);
+	ctl_stack = mqd + q_data->mqd_size;
 
 	q_data->gpu_id = pdd->dev->id;
 	q_data->type = q->properties.type;
@@ -620,7 +635,7 @@ static int criu_checkpoint_queue(struct kfd_process_device *pdd,
 	q_data->ctx_save_restore_area_size =
 		q->properties.ctx_save_restore_area_size;
 
-	ret = pqm_checkpoint_mqd(&pdd->process->pqm, q->properties.queue_id, mqd);
+	ret = pqm_checkpoint_mqd(&pdd->process->pqm, q->properties.queue_id, mqd, ctl_stack);
 	if (ret) {
 		pr_err("Failed checkpoint queue_mqd (%d)\n", ret);
 		return ret;
@@ -644,6 +659,7 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 		struct kfd_criu_queue_priv_data *q_data;
 		uint64_t q_data_size;
 		uint32_t mqd_size;
+		uint32_t ctl_stack_size;
 
 		if (q->properties.type != KFD_QUEUE_TYPE_COMPUTE &&
 			q->properties.type != KFD_QUEUE_TYPE_SDMA &&
@@ -654,11 +670,11 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 			break;
 		}
 
-		ret = get_queue_data_sizes(pdd, q, &mqd_size);
+		ret = get_queue_data_sizes(pdd, q, &mqd_size, &ctl_stack_size);
 		if (ret)
 			break;
 
-		q_data_size = sizeof(*q_data) + mqd_size;
+		q_data_size = sizeof(*q_data) + mqd_size + ctl_stack_size;
 
 		/* Increase local buffer space if needed */
 		if (q_private_data_size < q_data_size) {
@@ -674,8 +690,9 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 
 		q_data = (struct kfd_criu_queue_priv_data *)q_private_data;
 
-		/* data stored in this order: priv_data, mqd */
+		/* data stored in this order: priv_data, mqd, ctl_stack */
 		q_data->mqd_size = mqd_size;
+		q_data->ctl_stack_size = ctl_stack_size;
 
 		ret = criu_checkpoint_queue(pdd, q, q_data);
 		if (ret)
@@ -746,8 +763,8 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 			   uint64_t *priv_data_offset,
 			   uint64_t max_priv_data_size)
 {
+	uint8_t *mqd, *ctl_stack, *q_extra_data = NULL;
 	struct kfd_criu_queue_priv_data *q_data;
-	uint8_t *mqd, *q_extra_data = NULL;
 	struct kfd_process_device *pdd;
 	uint64_t q_extra_data_size;
 	struct queue_properties qp;
@@ -769,7 +786,7 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 	}
 
 	*priv_data_offset += sizeof(*q_data);
-	q_extra_data_size = q_data->mqd_size;
+	q_extra_data_size = q_data->ctl_stack_size + q_data->mqd_size;
 
 	if (*priv_data_offset + q_extra_data_size > max_priv_data_size) {
 		ret = -EINVAL;
@@ -805,15 +822,17 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 		ret = -EFAULT;
 		return ret;
 	}
-	/* data stored in this order: mqd */
+	/* data stored in this order: mqd, ctl_stack */
 	mqd = q_extra_data;
+	ctl_stack = mqd + q_data->mqd_size;
 
 	memset(&qp, 0, sizeof(qp));
 	set_queue_properties_from_criu(&qp, q_data);
 
 	print_queue_properties(&qp);
 
-	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, mqd, NULL);
+	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, mqd, ctl_stack,
+				NULL);
 	if (ret) {
 		pr_err("Failed to create new queue err:%d\n", ret);
 		ret = -EINVAL;
@@ -832,7 +851,8 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 
 int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
 				  unsigned int qid,
-				  uint32_t *mqd_size)
+				  uint32_t *mqd_size,
+				  uint32_t *ctl_stack_size)
 {
 	struct process_queue_node *pqn;
 
@@ -847,7 +867,9 @@ int pqm_get_queue_checkpoint_info(struct process_queue_manager *pqm,
 		return -EOPNOTSUPP;
 	}
 
-	pqn->q->device->dqm->ops.get_queue_checkpoint_info(pqn->q->device->dqm, pqn->q, mqd_size);
+	pqn->q->device->dqm->ops.get_queue_checkpoint_info(pqn->q->device->dqm,
+						       pqn->q, mqd_size,
+						       ctl_stack_size);
 	return 0;
 }
 
-- 
2.17.1

