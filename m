Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F34A8112
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3437110EA5E;
	Thu,  3 Feb 2022 09:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5335310EA1A;
 Thu,  3 Feb 2022 09:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P68qcpHiB+KFJmVc1hcWah7e527rsh9yiO+WHPc7rwDqD8ku61gIjoZPWYVupAMlpGl0CHl2lCmx+lPUiuizN/xU4E2OsPJwgl0us60/htu8FxR4Z8XF7JYO52ZHfp2auK2Rr5XA1KfqTykOtGB1Y0pFl50wgIs3PE7ZnbOcMeY3MyWSNvjXKhXKyr/wqZBMTZmHqKvlQd5pIzSIaXlVI5fir4BLmvIm1K68J0wT6b5qCSoHPPcuCsa7dCVwwEPL3uAgLGahHH/4T4pmrS923/IZ7liCx73gUzJteWtU4tRPXBOoKHz625EEWcqKcPJN5yA1pgrpxlEyBvf7o9UeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcCy5T3O0iJKr684hUDtWt46H7D2OrVuDSNFp6wPZTU=;
 b=XJV06JNu0mVl+pe5siFkCm48zav27BzwtHMZT9K4bx/oxCErZIT/JrzB+ohZc1NpNEc/5RZOhw642Deen1sVwIj4Xm/RERQtEJ0bGyGymBqR3Rt/a8qqrnLMWOn09zOfeS0Yegw+P/XxxYV8TQYdq0W1ypGKr5w0MgKX0aCruuB4Il74yrkFXtFCD+sxhg5QU2nsJbKZigDakW0mpKOiUck4Wo718hdPTaRFRsUwXtnDIyIV41TmVvNJ80qlIcBaJCRhv1Kc/bS9gDLunePdxG3OIjGo8eJgJD+78RnJk9xctstITyZNu8Enid0CG61zYTMXMkMAPJuQuJi+ScKvLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcCy5T3O0iJKr684hUDtWt46H7D2OrVuDSNFp6wPZTU=;
 b=yIxPawRDKVuP/0Xyg14a4SSDUFGFkim2x9Z0lh0NBDNtA4j4Ku+MnKZzqQHhBGQ78GV0QRflnLju3n2h7AHSBt5Twi/zYHHnUyn+64LtqO5tssrAIBf83KnHqTCx2hPcCa7biiTTvS6gLbebURNm7ludQIi8VztvWWkI7z35J1w=
Received: from BN9PR03CA0374.namprd03.prod.outlook.com (2603:10b6:408:f7::19)
 by SJ0PR12MB5423.namprd12.prod.outlook.com (2603:10b6:a03:301::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:09:42 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::2f) by BN9PR03CA0374.outlook.office365.com
 (2603:10b6:408:f7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:41 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:38 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 11/24] drm/amdkfd: CRIU restore queue doorbell id
Date: Thu, 3 Feb 2022 04:09:05 -0500
Message-ID: <20220203090918.11520-12-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7f365983-0724-4100-d5f5-08d9e6f4e9b4
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5423:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5423B53EEFBFB25B40B4F5EAFE289@SJ0PR12MB5423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OVJY4Sq9+AFyabQBzGGlq+bYgvuW247D3YY8ke4pfIJ4FGHQj5oBK3Em/bcnzqDW17bTlhlZoiX2aG/KoSyZ0r/HNmoiJFeiWAlDkLwzZ427r5P2xwCKhJIl3PWCO/JX6Mxamd/Kz+CECO4PtbHKkLP4NStAdNVlXX7hndPfPyqMgba5E5umIc+nF9Hc7LHYE9r1uYmVEX41JoJuptGacmZbCPtLRByiISDki1AzyDOE4o8PSOeVz++17f/4boklvTgYSm16U/grTsXYaFVYHH4aGuMlA4Ok8gK1li0ndzaHD1vzeVlHcaH8+lUQoB2+x1Y72Fob46UhtKx17jObZNTl0v0lFXZP3ifWM1wXxR+XSCmnHk2JmZdhiRh6ro6RkJUAlcKKCjuqz7u/9dpaLZvsSJjq7ozT81CjjV9HlPvnLVErblktvw5lOY10EnmvNWSNZ60lzwOUR4F/lfX9l7Be35w9Zw1ZWOjwnphyxtHLFSjQCeVY3gKnpzaz64fteSi4p1Nqw1D1Y2pBG4/ROgiXvsC3ZL7dOwGhKNfI9CNdgdyyK9qUx+4izdKMRfb+Hgz36iDUAyaWFwNZuoMGF5fyPSUXSjaFGjiC5mmaEsih/z4SFlYkr+Mp8dpJ27vLsf/G/dECDajUasQefqyv+ZcBRTfmeSBpCDU1yxnaZtfydRjhhJMIqlsTKhUnpSp+fk+ttH7EC+pYVZ1A2AQidw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(6916009)(54906003)(47076005)(36860700001)(82310400004)(5660300002)(83380400001)(316002)(508600001)(7696005)(70206006)(70586007)(6666004)(450100002)(356005)(1076003)(16526019)(26005)(44832011)(186003)(336012)(426003)(4326008)(8676002)(2906002)(8936002)(2616005)(40460700003)(81166007)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:41.6362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f365983-0724-4100-d5f5-08d9e6f4e9b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5423
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

When re-creating queues during CRIU restore, restore the queue with the
same doorbell id value used during CRIU dump.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 60 +++++++++++++------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 15fa2dc6dcba..13317d2c8959 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -144,7 +144,13 @@ static void decrement_queue_count(struct device_queue_manager *dqm,
 		dqm->active_cp_queue_count--;
 }
 
-static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q)
+/*
+ * Allocate a doorbell ID to this queue.
+ * If doorbell_id is passed in, make sure requested ID is valid then allocate it.
+ */
+static int allocate_doorbell(struct qcm_process_device *qpd,
+			     struct queue *q,
+			     uint32_t const *restore_id)
 {
 	struct kfd_dev *dev = qpd->dqm->dev;
 
@@ -152,6 +158,10 @@ static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q)
 		/* On pre-SOC15 chips we need to use the queue ID to
 		 * preserve the user mode ABI.
 		 */
+
+		if (restore_id && *restore_id != q->properties.queue_id)
+			return -EINVAL;
+
 		q->doorbell_id = q->properties.queue_id;
 	} else if (q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 			q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
@@ -160,25 +170,37 @@ static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q)
 		 * The doobell index distance between RLC (2*i) and (2*i+1)
 		 * for a SDMA engine is 512.
 		 */
-		uint32_t *idx_offset =
-				dev->shared_resources.sdma_doorbell_idx;
 
-		q->doorbell_id = idx_offset[q->properties.sdma_engine_id]
-			+ (q->properties.sdma_queue_id & 1)
-			* KFD_QUEUE_DOORBELL_MIRROR_OFFSET
-			+ (q->properties.sdma_queue_id >> 1);
+		uint32_t *idx_offset = dev->shared_resources.sdma_doorbell_idx;
+		uint32_t valid_id = idx_offset[q->properties.sdma_engine_id]
+						+ (q->properties.sdma_queue_id & 1)
+						* KFD_QUEUE_DOORBELL_MIRROR_OFFSET
+						+ (q->properties.sdma_queue_id >> 1);
+
+		if (restore_id && *restore_id != valid_id)
+			return -EINVAL;
+		q->doorbell_id = valid_id;
 	} else {
-		/* For CP queues on SOC15 reserve a free doorbell ID */
-		unsigned int found;
-
-		found = find_first_zero_bit(qpd->doorbell_bitmap,
-					    KFD_MAX_NUM_OF_QUEUES_PER_PROCESS);
-		if (found >= KFD_MAX_NUM_OF_QUEUES_PER_PROCESS) {
-			pr_debug("No doorbells available");
-			return -EBUSY;
+		/* For CP queues on SOC15 */
+		if (restore_id) {
+			/* make sure that ID is free  */
+			if (__test_and_set_bit(*restore_id, qpd->doorbell_bitmap))
+				return -EINVAL;
+
+			q->doorbell_id = *restore_id;
+		} else {
+			/* or reserve a free doorbell ID */
+			unsigned int found;
+
+			found = find_first_zero_bit(qpd->doorbell_bitmap,
+						KFD_MAX_NUM_OF_QUEUES_PER_PROCESS);
+			if (found >= KFD_MAX_NUM_OF_QUEUES_PER_PROCESS) {
+				pr_debug("No doorbells available");
+				return -EBUSY;
+			}
+			set_bit(found, qpd->doorbell_bitmap);
+			q->doorbell_id = found;
 		}
-		set_bit(found, qpd->doorbell_bitmap);
-		q->doorbell_id = found;
 	}
 
 	q->properties.doorbell_off =
@@ -346,7 +368,7 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 		dqm->asic_ops.init_sdma_vm(dqm, q, qpd);
 	}
 
-	retval = allocate_doorbell(qpd, q);
+	retval = allocate_doorbell(qpd, q, qd ? &qd->doorbell_id : NULL);
 	if (retval)
 		goto out_deallocate_hqd;
 
@@ -1333,7 +1355,7 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 			goto out;
 	}
 
-	retval = allocate_doorbell(qpd, q);
+	retval = allocate_doorbell(qpd, q, qd ? &qd->doorbell_id : NULL);
 	if (retval)
 		goto out_deallocate_sdma_queue;
 
-- 
2.17.1

