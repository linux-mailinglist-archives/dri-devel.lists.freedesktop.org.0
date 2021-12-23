Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC847DC22
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBD210E162;
	Thu, 23 Dec 2021 00:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2070.outbound.protection.outlook.com [40.107.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37F710E156;
 Thu, 23 Dec 2021 00:37:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aG9LenKNVe+Z1D9lp1P1MESU5l0W6AlJMnz6X42ojthzY0ivD5yOVYNxa2tqnI1HPfEYHd1iZ95OuMfgDZ/x6kSmD+HccLg5qFb6Y5J5vPDLoq6dcLL/zZ2kFhZ3Kq7tvnihBqoyvXpXScY/NjMuXloJB5/R/tVvji9ljzET4ofb+tiWohVqUXymQdcRhA7DnR8pQ8I/6Wy+TPoK6ZplxpTJbbil6CGIqcTeFH6af6Ll3u4mgpnroeqq0+KBCBkrbauexuLFomABLwxrrLjebY+ENnVZVQhT331NrOdLpZ3Jl1dOkPFzYi8iLLdEJyVR+GGCUBfCbAdPKlDVHnl2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tL8qfmaZedB1GitLEyTY70GMcfsPAJNU6DzFsPZbGG8=;
 b=VIOFB364nfTLr+SiR5/QvaN5ax2WfWO1H2Bc3j7yxqXDTrLCT1iQvY1LWfVxv0q0HNcw8NdNsmdRxJei1eoW4XHNHxR92C4GC8qcMKdq2rJ9CfZC0Pf+rsJPIBJ9ih6ewaYrwyvz0VWITXYga6HScz9d0zBSW30uoIPLXIJGjeVru+kwwRtECcoOlj2queYn9OD9hU1MqjfXD01jkn6qWeKiwiIas/QaR+hAc1oITT8tWGyyt2Qwq/FVqfM2SD3iiPlkM/L/LAJwSI6wNyc9aa3wIhpy+Cn01TsAWboX4ZqAcay2okb4duTCMzOa2XEutgvFx+w8Wnd10NyhDjJhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tL8qfmaZedB1GitLEyTY70GMcfsPAJNU6DzFsPZbGG8=;
 b=Lrl0hTkXw7hCOEDWNfoVgSw5Hp2wpgtq4rl+F/Ot60b3E1fal3khlpEMgCcdXtLya9GCgM0tlfNGcsVgQagmsrkHNdlcm6/M/QS1vbk+TIutx2mOIT+Z1nfayRBP5pTq2kimVDosyPdlOf7WIdiKFZG8Ls2jALiLPvKVN/K2P3M=
Received: from BN0PR04CA0033.namprd04.prod.outlook.com (2603:10b6:408:e8::8)
 by CY4PR1201MB0085.namprd12.prod.outlook.com (2603:10b6:910:1c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 00:37:32 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::9f) by BN0PR04CA0033.outlook.office365.com
 (2603:10b6:408:e8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:32 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:30 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 10/24] drm/amdkfd: CRIU restore queue ids
Date: Wed, 22 Dec 2021 19:36:57 -0500
Message-ID: <20211223003711.13064-11-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 05ed03aa-f4ed-4aff-e845-08d9c5ac6820
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0085:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0085668FC05D03A1FDF474B0FE7E9@CY4PR1201MB0085.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wa/BxEbeSWNDDxEKix9rC1bjKRilC5uEFum2NgWjb3QJwG2lgm/THqXGhSGnx5vSRoDkdrEsWgaci1psc1QdXuH6iayWBf+i6KJ1Img8upWZEAhwuCA0w2ubl/oGQ2XCe4G/Ofxa/OmWBtWhfXmnTCpC2PtIiYW6aiy2f2z/oOoOSxCQyJ/Al7E505V0P50sM8uca1q/FD12L8hqGtSmusKzDYj54p4wiHR2QmF6yf6Lo7ilxbYt75ezGgfsx1ic3Iqcn4EK0j0BsX2javmTBenTr3t0mObEA/Fbh8s5CQnEmokJp0VcTG9pvKvXMXruERCAw4m0GTogQRe7LKk5RtntySQ/Ht+POVYporeK29eUt2U4M0YqFtASKern9DnxQ2HG8+n+D+/KaZsTidvGWm9/ZIwI02Bj7m+jwtyOQ/r8AinODe4/IWa4fokKOfk9XjWpKbOmpRJ3+pAvipyJMgRCq7oIBAQ6cuPm2dotRlE+Rg2IaKhwNtHLAPSfrdD/1kj3fdCuGaMXhnsBRR8h6B7n6PEiVvWK7pGKl5WEL6ChO7l6iOuJFc/QPF3hBJl5vFaP+KtUL6fEAS/72XX1sEe6AUwY5Jqog80QLhWJasaPQSZ9NZg6HIZ4qeoiwWfZPiC0kkefReRgvS/MNNMUSU5HvEGuj5Gz/6IqU8cXODMN+5OUqxoa8KNk5rAkbrKpItjTFMtop858ppwBXy9xUnvnN5mqVwie6MVr4F3m0Pil1BDdLG3GDQwRMXcApMdBP987J6wa+FZveq50EDNpbAERBLxjA+MVrAHPEsBozBQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(186003)(26005)(16526019)(1076003)(36756003)(4326008)(336012)(2906002)(6666004)(508600001)(426003)(2616005)(86362001)(70206006)(70586007)(7696005)(8676002)(8936002)(110136005)(83380400001)(44832011)(47076005)(5660300002)(82310400004)(356005)(316002)(36860700001)(54906003)(81166007)(40460700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:32.1357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ed03aa-f4ed-4aff-e845-08d9c5ac6820
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0085
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
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

When re-creating queues during CRIU restore, restore the queue with the
same queue id value used during CRIU dump.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>

---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  2 +
 .../amd/amdkfd/kfd_process_queue_manager.c    | 37 +++++++++++++++----
 4 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 9665c8657929..3fb155f756fd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -312,7 +312,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 			p->pasid,
 			dev->id);
 
-	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id,
+	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id, NULL,
 			&doorbell_offset_in_process);
 	if (err != 0)
 		goto err_create_queue;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
index 1e30717b5253..0c50e67e2b51 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
@@ -185,7 +185,7 @@ static int dbgdev_register_diq(struct kfd_dbgdev *dbgdev)
 	properties.type = KFD_QUEUE_TYPE_DIQ;
 
 	status = pqm_create_queue(dbgdev->pqm, dbgdev->dev, NULL,
-				&properties, &qid, NULL);
+				&properties, &qid, NULL, NULL);
 
 	if (status) {
 		pr_err("Failed to create DIQ\n");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 7c2679a23aa3..8272bd5c4600 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -461,6 +461,7 @@ enum KFD_QUEUE_PRIORITY {
  * it's user mode or kernel mode queue.
  *
  */
+
 struct queue_properties {
 	enum kfd_queue_type type;
 	enum kfd_queue_format format;
@@ -1156,6 +1157,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    struct file *f,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
+			    const struct kfd_criu_queue_priv_data *q_data,
 			    uint32_t *p_doorbell_offset_in_process);
 int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid);
 int pqm_update_queue_properties(struct process_queue_manager *pqm, unsigned int qid,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 480ad794df4e..275aeebc58fa 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -42,6 +42,20 @@ static inline struct process_queue_node *get_queue_by_qid(
 	return NULL;
 }
 
+static int assign_queue_slot_by_qid(struct process_queue_manager *pqm,
+				    unsigned int qid)
+{
+	if (qid >= KFD_MAX_NUM_OF_QUEUES_PER_PROCESS)
+		return -EINVAL;
+
+	if (__test_and_set_bit(qid, pqm->queue_slot_bitmap)) {
+		pr_err("Cannot create new queue because requested qid(%u) is in use\n", qid);
+		return -ENOSPC;
+	}
+
+	return 0;
+}
+
 static int find_available_queue_slot(struct process_queue_manager *pqm,
 					unsigned int *qid)
 {
@@ -194,6 +208,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    struct file *f,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
+			    const struct kfd_criu_queue_priv_data *q_data,
 			    uint32_t *p_doorbell_offset_in_process)
 {
 	int retval;
@@ -225,7 +240,12 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 	if (pdd->qpd.queue_count >= max_queues)
 		return -ENOSPC;
 
-	retval = find_available_queue_slot(pqm, qid);
+	if (q_data) {
+		retval = assign_queue_slot_by_qid(pqm, q_data->q_id);
+		*qid = q_data->q_id;
+	} else
+		retval = find_available_queue_slot(pqm, qid);
+
 	if (retval != 0)
 		return retval;
 
@@ -528,7 +548,7 @@ int kfd_process_get_queue_info(struct kfd_process *p,
 	return 0;
 }
 
-static void criu_dump_queue(struct kfd_process_device *pdd,
+static void criu_checkpoint_queue(struct kfd_process_device *pdd,
 			   struct queue *q,
 			   struct kfd_criu_queue_priv_data *q_data)
 {
@@ -560,7 +580,7 @@ static void criu_dump_queue(struct kfd_process_device *pdd,
 	pr_debug("Dumping Queue: gpu_id:%x queue_id:%u\n", q_data->gpu_id, q_data->q_id);
 }
 
-static int criu_dump_queues_device(struct kfd_process_device *pdd,
+static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 				   uint8_t __user *user_priv,
 				   unsigned int *q_index,
 				   uint64_t *queues_priv_data_offset)
@@ -582,7 +602,8 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 			return -EOPNOTSUPP;
 		}
 
-		criu_dump_queue(pdd, q, q_data);
+		criu_checkpoint_queue(pdd, q, q_data);
+		q_data->object_type = KFD_CRIU_OBJECT_TYPE_QUEUE;
 
 		ret = copy_to_user(user_priv + *queues_priv_data_offset, q_data, sizeof(*q_data));
 		if (ret) {
@@ -608,10 +629,12 @@ int kfd_criu_checkpoint_queues(struct kfd_process *p,
 		struct kfd_process_device *pdd = p->pdds[pdd_index];
 
 		/*
-		 * criu_dump_queues_device will copy data to user and update q_index and
+		 * criu_checkpoint_queues_device will copy data to user and update q_index and
 		 * queues_priv_data_offset
 		 */
-		ret = criu_dump_queues_device(pdd, user_priv_data, &q_index, priv_data_offset);
+		ret = criu_checkpoint_queues_device(pdd, user_priv_data, &q_index,
+					      priv_data_offset);
+
 		if (ret)
 			break;
 	}
@@ -693,7 +716,7 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 
 	print_queue_properties(&qp);
 
-	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, NULL);
+	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, NULL);
 	if (ret) {
 		pr_err("Failed to create new queue err:%d\n", ret);
 		ret = -EINVAL;
-- 
2.17.1

