Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBBF47DC2F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D73310E1AA;
	Thu, 23 Dec 2021 00:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B690A10E156;
 Thu, 23 Dec 2021 00:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi9Who98JgY8MLdOJxVkAadSAOu5hf1/QbVDBT2JJ+0BMF97L0kL8ieYkZ6HJhM4oze3M3eZIpsqxUr/eRcJV3rxCwd2tkMDkfq2EhZ6CuqDKF+76FBQwygk3E9BOiWEPgJPHVlu+qMHLG/MxCnEhsIvOd3oYJembi2HX/Tk2TcIxGi6j6366Lmvit/sIV620fEhmkcfjE+rTVlINXMeivUMUCy0oHqYX4IQfdkkOKhIzBn1LBetYR7qMVTSm+I/+MuvTtZC9bFfDpjDiJziEML08Lh2lr41PxnsCeKhniAt//x+GuJC7Ogl8dxtWuI922N29dU7HNOTdnnhtSczMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tC4wpY5Iju+vbhHdfmQhTm1XfRDzQ7A/nZAcFJC63tc=;
 b=nnVB10OI2Q1HUb8HtZf/a4T6kWt7WrLGfTYUwGPIDRkD3sbhepxY/ORvLz5HyPE98vJaEIn6ErRq18XsMsMCznkc3Akta1UuuR3oOf8dmidLqt9bxRLLTKmjocdTlpaY1hmy6zpqBAfxej9hGDe3quqvujvn+e799rNyjzvTSzVO2qIx/pH4+zqgSfweRpqKRTrYsVksD3dX5gjJSOBcLM/cPbK1Z9JiWi6tHArXq/hbkURTw3Cyxox5f8Bbm6QbXYF0xk55lSZrjnr6/ci/CmDwQNtX8+Ahn3/sN2uI+/kn7oqgMxKiUu6gy7EEdHcpqhDQsXV/fos7nGy1VoVlPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tC4wpY5Iju+vbhHdfmQhTm1XfRDzQ7A/nZAcFJC63tc=;
 b=p9XGYiIqZuamhu1Pgwl7FQsB56Gqziq9o9iJKIZpYiVjKLgxfSlfRsnNSdJNFobPDfaOIJ8K59llfHtugDjGGWgT+pMhKnEuG6hsS6TBFF4wfvCaMOxgcEf1yHnctjD969GDB71yJHbMRKadKi3ASYlJDJj49TaX58G5vsNzLNw=
Received: from BN0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:e8::14)
 by MN2PR12MB3197.namprd12.prod.outlook.com (2603:10b6:208:107::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Thu, 23 Dec
 2021 00:37:33 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::44) by BN0PR04CA0039.outlook.office365.com
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
 2021 18:37:31 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 13/24] drm/amdkfd: CRIU checkpoint and restore queue mqds
Date: Wed, 22 Dec 2021 19:37:00 -0500
Message-ID: <20211223003711.13064-14-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c684babd-2a0b-46f1-064b-08d9c5ac68c3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3197:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3197CB9406CB8F84EA327BC7FE7E9@MN2PR12MB3197.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: py+48lsLE6MdLiS22RDbKFr2TP+LoORBnQMgyunGatPMuJYamzliRKNizlCEdzmvrrLb5DhwDPQxzWPcxRLPM1B/5HmgATOS7wL1PGETjaMACc9boIkGKt2ZQl9/eJRD+YpXeqpsn/1VpvaM/RNrJfwiXsrhZ9lAzVEMXpzrnABwKZ4oPous+hsbBleDehnPcEm4ah4TPFsruYjkD85BmXh3aECwyIMrXMt4MNeZh7DfSYo33oLayOy8dWhI4t/45VbGMRJoilgXgeopB8cHdLHR0FYiSAkME5bHXbKt/fh85kQ3leZJceX8bhHwqGrPDePRB0sLwGqz14JfJvba867mNFQGBTYNuJUHql4uBSQK4d7NTcBOs4gG1oMQQVYqQo1XlyUA4n/mCRci6nOcZWth6XpU1Kc0Cfy6ichSTv2k5oRE7t8OAVRdCcculPl/hGWE+AQi8nL9AbbsAPJWRGE53B/SahS0NHVbxo18Jn1YUMhvwO3fKikECeTjdZ28JELVJXQ3ivqA4mp5n+EQ2BRamt2WNmqRC25XLsz4dcJvQ90ikcnYlVXV3qVOOWDqOmmI6QhI75Q+7cv9p6soScEp2tQxGRsBvQmBpnBs9aLKRp2ZdygZGwA0psRdISri/NV3bBCIb0mrqXp0yDMExa7QPqJHk0Mu3gtBcw5tjE1CSBq2FVaEghWIl4buVtC58QU2pdfQgxMyt9ryxPVoAwGbA8Kh0deUYa0R9GQqgeLsMrYMgcNQI3pSXxf+j43PVLpfvoRb3t+tUCU8xw+a1x89WuYWCWnyeNf6CsTYSLHiWYJO3i0O2lBTCrDIy7VqRaVLlheXzwmgsbWzRwy64A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(54906003)(40460700001)(4326008)(5660300002)(36756003)(47076005)(7696005)(110136005)(508600001)(6666004)(8936002)(30864003)(1076003)(82310400004)(186003)(316002)(356005)(26005)(81166007)(36860700001)(70586007)(70206006)(86362001)(2906002)(336012)(8676002)(426003)(16526019)(44832011)(2616005)(83380400001)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:33.1825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c684babd-2a0b-46f1-064b-08d9c5ac68c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3197
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

Checkpoint contents of queue MQD's on CRIU dump and restore them during
CRIU restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>

---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |   2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  72 +++++++-
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |   7 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |  67 ++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  68 ++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  68 ++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  69 ++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   5 +
 .../amd/amdkfd/kfd_process_queue_manager.c    | 158 ++++++++++++++++--
 11 files changed, 506 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 3fb155f756fd..146879cd3f2b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -312,7 +312,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
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
index a0f5b8533a03..a92274f9f1f7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -331,7 +331,8 @@ static void deallocate_vmid(struct device_queue_manager *dqm,
 static int create_queue_nocpsch(struct device_queue_manager *dqm,
 				struct queue *q,
 				struct qcm_process_device *qpd,
-				const struct kfd_criu_queue_priv_data *qd)
+				const struct kfd_criu_queue_priv_data *qd,
+				const void *restore_mqd)
 {
 	struct mqd_manager *mqd_mgr;
 	int retval;
@@ -390,8 +391,14 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
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
@@ -1339,7 +1346,8 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
 
 static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 			struct qcm_process_device *qpd,
-			const struct kfd_criu_queue_priv_data *qd)
+			const struct kfd_criu_queue_priv_data *qd,
+			const void *restore_mqd)
 {
 	int retval;
 	struct mqd_manager *mqd_mgr;
@@ -1385,8 +1393,12 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	 * updates the is_evicted flag but is a no-op otherwise.
 	 */
 	q->properties.is_evicted = !!qpd->evicted;
-	mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
-				&q->gart_mqd_addr, &q->properties);
+	if (qd)
+		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj, &q->gart_mqd_addr,
+				     &q->properties, restore_mqd);
+	else
+		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
+					&q->gart_mqd_addr, &q->properties);
 
 	list_add(&q->list, &qpd->queues_list);
 	qpd->queue_count++;
@@ -1774,6 +1786,50 @@ static int get_wave_state(struct device_queue_manager *dqm,
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
@@ -1950,6 +2006,8 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 		dqm->ops.evict_process_queues = evict_process_queues_cpsch;
 		dqm->ops.restore_process_queues = restore_process_queues_cpsch;
 		dqm->ops.get_wave_state = get_wave_state;
+		dqm->ops.get_queue_checkpoint_info = get_queue_checkpoint_info;
+		dqm->ops.checkpoint_mqd = checkpoint_mqd;
 		break;
 	case KFD_SCHED_POLICY_NO_HWS:
 		/* initialize dqm for no cp scheduling */
@@ -1969,6 +2027,8 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 		dqm->ops.restore_process_queues =
 			restore_process_queues_nocpsch;
 		dqm->ops.get_wave_state = get_wave_state;
+		dqm->ops.get_queue_checkpoint_info = get_queue_checkpoint_info;
+		dqm->ops.checkpoint_mqd = checkpoint_mqd;
 		break;
 	default:
 		pr_err("Invalid scheduling policy %d\n", dqm->sched_policy);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 6fa43215e3e2..ebd7d4d3772b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -81,13 +81,18 @@ struct device_process_node {
  *
  * @get_wave_state: Retrieves context save state and optionally copies the
  * control stack, if kept in the MQD, to the given userspace address.
+ *
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
@@ -135,6 +140,13 @@ struct device_queue_manager_ops {
 				  void __user *ctl_stack,
 				  u32 *ctl_stack_used_size,
 				  u32 *save_area_used_size);
+
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
index e9a8e21e144e..dee90e72f672 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -280,6 +280,69 @@ static int destroy_mqd(struct mqd_manager *mm, void *mqd,
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
@@ -394,6 +457,8 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd;
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
+		mqd->checkpoint_mqd = checkpoint_mqd;
+		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct cik_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -434,6 +499,8 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct cik_sdma_rlc_registers);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index d74d8a6ac27a..36109547494e 100644
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
@@ -373,6 +408,35 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
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
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	qp->is_active = 0;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int debugfs_show_mqd(struct seq_file *m, void *data)
@@ -417,6 +481,8 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->is_occupied = is_occupied;
 		mqd->mqd_size = sizeof(struct v10_compute_mqd);
 		mqd->get_wave_state = get_wave_state;
+		mqd->checkpoint_mqd = checkpoint_mqd;
+		mqd->restore_mqd = restore_mqd;
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
 #endif
@@ -460,6 +526,8 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct v10_sdma_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 326eb2285029..86ded61fbdeb 100644
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
@@ -428,6 +463,35 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
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
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	qp->is_active = 0;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int debugfs_show_mqd(struct seq_file *m, void *data)
@@ -470,6 +534,8 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->checkpoint_mqd = checkpoint_mqd;
+		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct v9_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -510,6 +576,8 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct v9_sdma_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index d456e950ce1d..e0204392c6dc 100644
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
@@ -399,6 +435,35 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
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
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	qp->is_active = 0;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int debugfs_show_mqd(struct seq_file *m, void *data)
@@ -441,6 +506,8 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->checkpoint_mqd = checkpoint_mqd;
+		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct vi_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -481,6 +548,8 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct vi_sdma_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 8272bd5c4600..9a381494eb67 100644
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
index 25cf97d97d87..97e794d6bb76 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -209,6 +209,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
 			    const struct kfd_criu_queue_priv_data *q_data,
+			    const void *restore_mqd,
 			    uint32_t *p_doorbell_offset_in_process)
 {
 	int retval;
@@ -273,7 +274,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
 		print_queue(q);
 		break;
 
@@ -293,7 +294,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data, restore_mqd);
 		print_queue(q);
 		break;
 	case KFD_QUEUE_TYPE_DIQ:
@@ -518,12 +519,26 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
+
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
 
@@ -535,23 +550,53 @@ int kfd_process_get_queue_info(struct kfd_process *p,
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
@@ -577,7 +622,14 @@ static void criu_checkpoint_queue(struct kfd_process_device *pdd,
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
@@ -585,15 +637,16 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
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
@@ -602,19 +655,46 @@ static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 			return -EOPNOTSUPP;
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
@@ -671,11 +751,12 @@ int kfd_criu_restore_queue(struct kfd_process *p,
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
@@ -692,6 +773,26 @@ int kfd_criu_restore_queue(struct kfd_process *p,
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
@@ -708,6 +809,8 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 		ret = -EFAULT;
 		return ret;
 	}
+	/* data stored in this order: mqd */
+	mqd = q_extra_data;
 
 	memset(&qp, 0, sizeof(qp));
 	ret = set_queue_properties_from_criu(&qp, q_data);
@@ -716,7 +819,7 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 
 	print_queue_properties(&qp);
 
-	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, NULL);
+	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, mqd, NULL);
 	if (ret) {
 		pr_err("Failed to create new queue err:%d\n", ret);
 		ret = -EINVAL;
@@ -733,6 +836,27 @@ int kfd_criu_restore_queue(struct kfd_process *p,
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

