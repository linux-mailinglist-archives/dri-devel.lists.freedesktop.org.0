Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B077847DC46
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EE010E210;
	Thu, 23 Dec 2021 00:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9671310E156;
 Thu, 23 Dec 2021 00:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTFwN/YIXpuro39qpryyvtzNMdb0AGEpjqyTD40/7QWnIbfj35S7ZlFACHLOuMN2RHo7AG8VRzqng4saHJQ5Q7KCOOGZkhc3ygiYY2VUzbtLJcB1CkWVYu1cDFitpBs9eWW9xKLiw9STlE893DwWgB1hg+9Db0stni8D/Rkt0ekAILs69E2RXU6LMFPSaKUzFeQZ5EOpFuwNRTNo8cIVFoq5aWhqW0XCkSSabMRs1/gacKGSEsKF55qJjd9She+iVyqNU9mMVvyNWrnosbwCXxm8vn8tW4OD9PuTLAplhRV0s5ym0G0EeMDhO22t0dwNQ/Zua/K1aLcZls8wTH9XBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bw+UmIbVuS5pPXmFY5O6mNN6dyDNsf1HFSXfvqUJS0s=;
 b=HSEs7W4TlXo1XNuZAjboAp5sFNQru3k3zzITafB9pozsPi2NKqMDvjXxXWS1rJF1TjPXUWjeGouq9/x4t82NhS4BLLPcBiOzHp3SLe+hmwx+kAC1+mMSIlG/kqXJZBJHpApQPszyDrd7kR/kcVyKpS45/r8QI2AM4nicmMXt5+lmAEaKSzPPZW64u7B+IDje9o7/lCU2wA+R2iEf7eTnUP3vx9TWr1NxFid1SKxb/BSdxOfWM7MkCfpaGjB0UIQREwPb/dXMU6huH2Ew8d8xcU+8cLgj5zfFFbdt9/WOBkCqwJNpCaNGSN+cmR12q7xXLjt4U63VZ+vUBlki34M4Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bw+UmIbVuS5pPXmFY5O6mNN6dyDNsf1HFSXfvqUJS0s=;
 b=LdMY6NCYiKDD6DxMXS2iij3Jp2PMxTr5ghZ6vpSiWPWBIt6agXfoXVnJYPgiu/pf0t/7Aj5NqTD0ztDZXwkBljqqdaXLrpt7t1dU3XO9KLYKCOc1IKEgx+vRGbgJ0rRCsyKQLuJsMfAojyAj32cw8h9a+wktcGbn3Th2/e+iYDU=
Received: from BN0PR04CA0040.namprd04.prod.outlook.com (2603:10b6:408:e8::15)
 by CY4PR12MB1878.namprd12.prod.outlook.com (2603:10b6:903:123::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Thu, 23 Dec
 2021 00:37:32 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::25) by BN0PR04CA0040.outlook.office365.com
 (2603:10b6:408:e8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
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
 2021 18:37:31 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 12/24] drm/amdkfd: CRIU restore queue doorbell id
Date: Wed, 22 Dec 2021 19:36:59 -0500
Message-ID: <20211223003711.13064-13-rajneesh.bhardwaj@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: eb13f843-a43f-41c0-4546-08d9c5ac6880
X-MS-TrafficTypeDiagnostic: CY4PR12MB1878:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1878DF7111B7F0FEF0A3B987FE7E9@CY4PR12MB1878.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: spXhESr14DZA3HFeNawuhgsUg/BIsYrgT42NPfL1L6k/cZLVg2AgrDm9jM8GBJUqxPPnJoi/dtdzwYJys64MADsjSnBhVsm90v54qgW0hmLGIhhpGcSVjDlIUz+4lC8e0JcJax3Xw0EWqGrEFxgsP4miO4Yuufxe13tGLqvXrL49VoYlheDg8LiDgckBcz98rKrY+lxDmt6QV5D0ehl/uM5l7AmGyM97OcDOzzNnJsANONBa+F6ZNAPKDuX/+AfTFFHPDh0mDE7EBt04dorOi04Yn8uWZVSCD1qdaL5nNIKTMhIkrY/P9H6IHFnF3nXf15uyKC8mXvb0V6lDK3QCCbwOguDkQmE9Aoip0OO2U8PP874o1Fdnmi7xR2UZYpUJMcZbSCFBaK2SY0wvbLI/LnqfT9LE/Q7THXNXhexpMQCPjfpTz4HxDFhqsw9zmMWwNIJeiFfkZ12Zt5gwNuhs7vdzSm5PGOQFPXMPcBYrJR1R46dard21geFh4n+1OqC6noyR8PKuJ8RqrQ68ri6JZ0dqskC7C0ffjIz73WFsvyTlF6LwfMIVZQqS6R4zIvJyC7lxyLMGYCThgkxzVCACepjq1b5O6BHUhG1N5Sl4xhCkA43TEXEUWVVPYDCTN2zb/uhz5inGrQQtGn+pJ+MXSS6yMCkM1AYS67LxeSBtW0Eq2fHtMSogyQMMTDgBecIgfeTn7UGafOB8hAG/8zKg2mw+PTLFkInf2ikN3ziyYZmaNo8/NGYghXj8jf0MY2/d8jsVvrDKvyirGOu30GK8cBVfvkKs1PbY4v17ZdjNZiE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(26005)(1076003)(356005)(508600001)(81166007)(16526019)(186003)(426003)(110136005)(36756003)(4326008)(2616005)(54906003)(316002)(36860700001)(44832011)(5660300002)(336012)(8676002)(7696005)(70586007)(70206006)(86362001)(47076005)(40460700001)(6666004)(82310400004)(2906002)(8936002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:32.7450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb13f843-a43f-41c0-4546-08d9c5ac6880
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1878
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

When re-creating queues during CRIU restore, restore the queue with the
same doorbell id value used during CRIU dump.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>

---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 60 +++++++++++++------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 7e49f70b81b9..a0f5b8533a03 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -153,7 +153,13 @@ static void decrement_queue_count(struct device_queue_manager *dqm,
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
 
@@ -161,6 +167,10 @@ static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q)
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
@@ -169,25 +179,37 @@ static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q)
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
@@ -355,7 +377,7 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 		dqm->asic_ops.init_sdma_vm(dqm, q, qpd);
 	}
 
-	retval = allocate_doorbell(qpd, q);
+	retval = allocate_doorbell(qpd, q, qd ? &qd->doorbell_id : NULL);
 	if (retval)
 		goto out_deallocate_hqd;
 
@@ -1338,7 +1360,7 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 			goto out;
 	}
 
-	retval = allocate_doorbell(qpd, q);
+	retval = allocate_doorbell(qpd, q, qd ? &qd->doorbell_id : NULL);
 	if (retval)
 		goto out_deallocate_sdma_queue;
 
-- 
2.17.1

