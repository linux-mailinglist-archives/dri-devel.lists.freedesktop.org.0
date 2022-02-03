Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3F4A8115
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C193510EA1A;
	Thu,  3 Feb 2022 09:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D75210EA1E;
 Thu,  3 Feb 2022 09:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdE9C3nXsYrGWOyOZrFo4xL8dE6TofcRT0Mw7Kjf6fuR3tPbZIbdXtRArRcf2YO6yz12PiUewqSvsEp8CnStMtg68PhcJfKH0a8ZR3QIvyjS9aX5ssVwL1OXvgmt1RPLWN+58HUbeSXNV791frPNzHZHLCCSAvMph9G4U5y68cVvQEoBq5HDVC6ysXTd4wHpR9W2jGFSqeZemrXTeoxQWvsSOXC6i9r8c5cm1WQo+NIyRM1QmOpAPlh9/s9EfInFCO15+41BZIiJRTTZ61DUQ+Tmqo8GBh65fdMJvcECiOvmi2UC/98V3GpBlpM3WwnTmzKq7gIX5+UETTGcG1dgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zL+4Cfi+O+unAyNb2e/k2dJ5Ifx7QcVfSYDwerNUQs0=;
 b=GBXSWHWR1WLdN2ReParsV5H3CzKYHLHsgKw1AaM0pG45bO6DLxhAKtfel/afXOiLSfDwPuiih5frjyhnOS3wrwv/qgg+wzviwTEDOK6opR2T4eO8wUUWo38Jr+PN/Rtu1cQX5zDbFGUQ8yJ19RULC8EhNoETzzX4OwT19c1+4TDW7/Z1VMqtlf5f5Y6NHwSEknI/EOqycX/TV2zwJ2SAi11Qhcc1DU+z0y4gx8PxoFcPNJAI/5w5e4/x98nES7exLjJdaNcO71IgA7ENxP/8qMZ1ZYBdFh2n213b0AJFXPPkmGeJPbcop+JUAhMlo6VpxBNGM2JyXYDvbl76x2hRug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL+4Cfi+O+unAyNb2e/k2dJ5Ifx7QcVfSYDwerNUQs0=;
 b=3+6B1V0rD7RIs1U70TKDFHU/ld6oAb/E91DDtaKUdD09lqdVjRAby/OQDcROKd5w6Lz8aQNfTdL9ziXKHp8VTqYOwx7mEY9wgMa4sXqmC+p9khCbhdFQ4YWnW6+nPEa8/wTe0ZFy/pAkssO+ttxN+oNrr3tzDpDwLAdGSa+MWE8=
Received: from BN9PR03CA0390.namprd03.prod.outlook.com (2603:10b6:408:f7::35)
 by CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:41 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::45) by BN9PR03CA0390.outlook.office365.com
 (2603:10b6:408:f7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
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
 2022 03:09:37 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 09/24] drm/amdkfd: CRIU restore queue ids
Date: Thu, 3 Feb 2022 04:09:03 -0500
Message-ID: <20220203090918.11520-10-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b2739e1b-8433-403f-5847-08d9e6f4e8f1
X-MS-TrafficTypeDiagnostic: CO6PR12MB5492:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5492878160E832A626B60A80FE289@CO6PR12MB5492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNxL5bbXEcnH1u26kur06T3+s3eKELiViu66UCmWKXiaYWgKCiZ8zu/CE7H3Qlg1rK6rWGllOS+cgxwudnINi0hmFBy/0ehCkOnKkdiuioH84+tq1KYoigCgJXTMh+06TfLwg2xWvog1vBr7CJWTWpQy3F+dMwxLYjINAUZ56EwNgV7zji9zqCwbtRar9eYvKeqtmqnlSi7koEMrbSkiuy2nZhXKOPU/ls+rFEtcFLgTMOnYlFDr22aAaROQNYl6+VLEZMtYT2pn7WwHX2YElm2J/IptQfNxaurHYtf3jLQ/gBhVr2P2WvPATQJr8M/UMVkIol2imZnpGztC2JPX4T1hn51Po6okUUaK7Kxz79FOSZMKJD/yTmFXF6EW1UXsrv6hTb5WOI4N9G5k9dLq5MnvZOVAm6RCLZeO2TMsJ0QEJES++PtDoxm0iOXOaPteKsOHrG8BqK1lTj1q85LzohbQ3i49y+8lQRS2IBWO4KfEGExyjpGhmQwPcDkBXkl6bUg57oV5EyKdg7BHNDwUdaeVfTEXC8KJbKoB/OXTqvj1PMTGEUaFLbWZYbxmDw3y+MAgXgN1FLMncQoGNUoXAqVoPzM2oStixclOz8flgmKDLeo6Ab4jQp0gJnPulzREMhx7FvXMzRaXB4dY3KT+MYv8i2B5gTfQf/l5VFulYXE+bCba7QchCIE2gFiyoOG4P9yf01tCanmHchr/GK9ONQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(81166007)(54906003)(7696005)(26005)(508600001)(6666004)(6916009)(44832011)(40460700003)(5660300002)(336012)(186003)(82310400004)(70206006)(36860700001)(47076005)(450100002)(83380400001)(70586007)(4326008)(1076003)(2906002)(36756003)(8676002)(8936002)(2616005)(426003)(16526019)(86362001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:40.3550 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2739e1b-8433-403f-5847-08d9e6f4e8f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
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
index d049f9cbbc79..d35911550792 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -311,7 +311,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
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
index 41aa7b150a96..59125d8f16a7 100644
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
index 38d3217f0f67..75bad4381421 100644
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
@@ -193,6 +207,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    struct file *f,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
+			    const struct kfd_criu_queue_priv_data *q_data,
 			    uint32_t *p_doorbell_offset_in_process)
 {
 	int retval;
@@ -224,7 +239,12 @@ int pqm_create_queue(struct process_queue_manager *pqm,
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
 
@@ -527,7 +547,7 @@ int kfd_process_get_queue_info(struct kfd_process *p,
 	return 0;
 }
 
-static void criu_dump_queue(struct kfd_process_device *pdd,
+static void criu_checkpoint_queue(struct kfd_process_device *pdd,
 			   struct queue *q,
 			   struct kfd_criu_queue_priv_data *q_data)
 {
@@ -559,7 +579,7 @@ static void criu_dump_queue(struct kfd_process_device *pdd,
 	pr_debug("Dumping Queue: gpu_id:%x queue_id:%u\n", q_data->gpu_id, q_data->q_id);
 }
 
-static int criu_dump_queues_device(struct kfd_process_device *pdd,
+static int criu_checkpoint_queues_device(struct kfd_process_device *pdd,
 				   uint8_t __user *user_priv,
 				   unsigned int *q_index,
 				   uint64_t *queues_priv_data_offset)
@@ -582,7 +602,8 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 			break;
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
@@ -688,7 +711,7 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 
 	print_queue_properties(&qp);
 
-	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, NULL);
+	ret = pqm_create_queue(&p->pqm, pdd->dev, NULL, &qp, &queue_id, q_data, NULL);
 	if (ret) {
 		pr_err("Failed to create new queue err:%d\n", ret);
 		ret = -EINVAL;
-- 
2.17.1

