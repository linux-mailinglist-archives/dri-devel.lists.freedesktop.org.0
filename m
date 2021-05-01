Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D216E3704D9
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F5F6F63D;
	Sat,  1 May 2021 01:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED8A6F626;
 Sat,  1 May 2021 01:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYCVL+8yLJX1G6O8abT26ZeO4rmp+MNWKTD2bGVDuFEYa3GegtHVzRuFp65FJQhWBzxCqJoJhi7pZLKDMbayV+8AJV1ujtF7mFv1/IcIeuLOIj21JUwb2H8q6RICFGoUZlMRx/m0bQvIOoFdZaczmBIyaov1yB3vG+/PFBB4PW229T89EoPMBGZX4zVmQ35d1LdpQSuOyFERB7VUj+qWr/shglQt9+nyDdGOcO1Hi1Sm7G42Qx/Ydy9jptJ3TDUcoUj+BBIxi2VyqZs+1Bz4h6xt4bLdhJq+0GxPUpAban0hoHt8OPN8UrUJQLgp6eFO2ia16/oUn7174Uy7hgk3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w+fzE1FBiqHuj/3D7aqa51xmjCPlFbvS8tCRRHLck0=;
 b=Pw64/fdmcz/MdCVbPaARgG05mQ9ApbSM3XOyXPfjO0GECdWaIrj4LG1Ui632hJ449K55Jdp2bvp/SeI5hTHAqqU1lgf8Y7AohoJNiIwLq38D2mk7ohXc7QSHYm4zElacWSG9Unt8VVJP3T0w+vPhvg/I/wbfEqZm8iM/UDZOiEf1MuwSreHaHBXWFkw35R1nmktRDfuriZWpALdJPhj5jtYB6HBYCWiSbjC1+C4T4qbZrAgMnxOcbi785IHC6b72DjTwLA3dVz5Pw028JLtus/Kv20TBuYf7APcvdumg1MEAYQbLfvkNK36osXEeWWi5HJoZw8UtdHNpI8tPZv8RuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w+fzE1FBiqHuj/3D7aqa51xmjCPlFbvS8tCRRHLck0=;
 b=0tiX33vkU8b+ie7P42iTDd3BfIlpfljd8xq65JPPbCBewcLUDgyYyyMJtVv4TSjnIpC81P5TgvT/S5REDLiqm9oEqxNQEChmn6uGrVVAUHmfJK2S5cOQSy8vv5Cei7PSu9O4SpSVlbP+YHcPdZ07PritUcdLZmnVmcaG0eESvXU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Sat, 1 May
 2021 01:58:28 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:28 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 11/17] drm/amdkfd: CRIU restore queue doorbell id
Date: Fri, 30 Apr 2021 21:57:46 -0400
Message-Id: <20210501015752.888-12-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501015752.888-1-Felix.Kuehling@amd.com>
References: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7c29659-f140-4652-4be4-08d90c449d2f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB489842B01260A387A7246CDF925D9@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WZQXXBOB5+jz4hEMx79ia+qCN2tOIvcRRQ86uYN9mSX1S0g/xpEOy26aBc/3o9NXBjO56bZBdDu7dJ/IconYnOyhg5afTLnGNKqpBwmaffKLV3oPptKhWOHpgOYrRB7AB6uQwmNM4anoA42DvNf+KTbVRqSQqNb+CBjnfF6/iBA/iqJ9QUHXgggD5t3zdGuwVsJVVsW0mMGl7BggAHx41kjBIP9/c6cl3KzpbTMIKHf/V5PssNb1hbOso3E9qwMyj/TYO8UTyYUYvnhV539FdAJKEd6LKvu7ges73mQaeMG3maiE90ZoR/xZjtx35OnBmamWo1juSThdjxsOJD1KxfeusWtXRrKKlt1qrw4oPMVocgoR94jGOJSJptUq+ok9BUxAnItG/++oV237cc2chT00BmlWp8RfjVFO2R7bUvPAr+ERubNQOgR0T5T6PuZK8Xxr4M+d8Ihz9VvwnQFiix3NNeEulhMig+IPzlWh2gpdkNhegrcYrWc0WmNs35dNSvvuBH+7Ap8GaNvarbLLk3E79lHA6XbUsrY/ZaVn3T/JJ2bdH7J38yC75oJdpY+1pl0Q+VHSVEG0FG2ENJPNy4KnaZ+/FvG/0QNW97xBPFLu7NhGZ9nYx8U8P66z8ekLpYQM4RxlLc8uELBIRCfTSlhhlbwTFfRgaeWGKj8G4OpzQL7erVtTtIUKleeNypVp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(36756003)(66556008)(66476007)(66946007)(6512007)(86362001)(8936002)(52116002)(478600001)(5660300002)(8676002)(6506007)(6666004)(38350700002)(38100700002)(2616005)(450100002)(4326008)(83380400001)(1076003)(2906002)(26005)(16526019)(6486002)(956004)(316002)(186003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Y45Stp9nWXTJA6D78QGrTCCKCjjpN6XsmMXoHiVAKXXcy9IrfjHk13ojPXj7?=
 =?us-ascii?Q?wYNz9eAsaBK5A4h4XNNRdh+tIxxBC3Lwu7qxUrABnYi3heKkTeE05g4TPLu7?=
 =?us-ascii?Q?D+8U9aFX6tds6dZECU6PhLEAUtaUQFUn9z8v34TduWU5qVioeuNHqx1gnmMv?=
 =?us-ascii?Q?/7/uIBqdoCu7BBTny33AeCxlY/gKWsJJT/cYeZpmZhXJ5XbS13S8OaTlVoMK?=
 =?us-ascii?Q?nvMLbCbLwxPfQPWzFiRqCtHr2UvqPS1ZVNNd5yTHGbytvxjzttmtBeUDzEG8?=
 =?us-ascii?Q?//YPneVGiFPNzRYq/vatLkzgX0FMnUwcqaVK341SQjCcrmdJ+KFu3ivt9w3S?=
 =?us-ascii?Q?+uGD5rbNoTKuYjx94M5QIIare8kubjOHfnyIsROswrjghCobeAsbdrxxSD5B?=
 =?us-ascii?Q?dEjFNrhmBMwz3O8FnrUfKQNT1RXoTt5Cklf/ER0KPzJkjGDNa6FnMVbvm9eB?=
 =?us-ascii?Q?abV7ek48uLZGCNg5Ks/RBOq/0Ko6O9YhQEpJNOUUPJbK72waSwvgcVxo4XfX?=
 =?us-ascii?Q?RkJLPrDiOT3vtd6LpO5OVE1KDSxOudAMT56XwLCwGWzCAU2XSOEF2vWOGbIz?=
 =?us-ascii?Q?02fS8dMAiGRATwA7msH0q2khvYlDgp4BMmmHcVitUILbi3AOW5L7YhgKQ0L5?=
 =?us-ascii?Q?QhgXZJXMaZqYcGpOZlEHeFjfudnOPYYWrWoBsMz4WRf9aNDOejjx7YsSFmtc?=
 =?us-ascii?Q?m+KjYqnr7Y0UJXi7nfPNM4odRseS/pOYdmZrdY+85hZfHIjhGjNaNXL1/LlX?=
 =?us-ascii?Q?WW+QRdS0H9ytfEvg26LrV44CleP3P+RpLMYE8p0dD2Jnv6PhH6sPAepkwFLY?=
 =?us-ascii?Q?uM7+p1JGPZNzHWE9D/SgW/I4M4vIMxhsKkWXIkDcuege32aSbZeds8Nbfxv5?=
 =?us-ascii?Q?aJSXbRbKo1SGB4Yl3KTHR6ROEP33WGMfN3kQOWO8Fhrn+Nk9PeYCAMvM43PQ?=
 =?us-ascii?Q?4iZ7PK2Wr29SxGJXIwaZupkfjfz0fRpoEoGbdV/Lp7iqKD19z75pIZn2v3+p?=
 =?us-ascii?Q?kQmXPo4aTSf9/JV98pPck9Mdhc1u2e1GB3A3gI26F4PUjj5ghxk63kImWIUu?=
 =?us-ascii?Q?LOElqiqg8zLqPdDfqZT4CLT9eU+nJPyamDwpJxMds/rgjxcteEawEyKlUnYC?=
 =?us-ascii?Q?VXF9pom2YthY7qvPmkKrlARfsQqf6Z4CRng0x/1W5YNtHWudH9Dpy54AHveX?=
 =?us-ascii?Q?OsN6v59OyuuvRi4N++WJ1zE3CMpcvrhCwbOC9VKJ9Fm+Tjco4vjz+wNyHv2c?=
 =?us-ascii?Q?yvzaqeeTnQIJD7eAWEyNbawMWISGztNpvYX4fIEbamE5A+flCvEpdHsiKEQE?=
 =?us-ascii?Q?gjdpf6m9ZpxbY7slWSnSPUYK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c29659-f140-4652-4be4-08d90c449d2f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:28.7731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfMvrMDwY8K/yZPxz8jUMUccbeGSE768G5rTEFvD+tsEcGD1LFtjQfPAMC5gXICirRd71jX28Gpufh71wBJ6jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: David Yat Sin <david.yatsin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

When re-creating queues during CRIU restore, restore the queue with the
same doorbell id value used during CRIU dump.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Change-Id: I6a79de1f8c760d5a9d28e7951740296f2f8796a7
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  1 +
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 58 +++++++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  1 +
 3 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index afcbdae436fa..130ab100abb2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2153,6 +2153,7 @@ int criu_restore_queue(struct kfd_process *p,
 
 	qrd->qid = q_bucket->q_id;
 	qrd->sdma_id = q_bucket->sdma_id;
+	qrd->doorbell_id = q_bucket->doorbell_id;
 
 	ret = pqm_create_queue(&p->pqm, dev, NULL, &qp, &queue_id, qrd, NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index cabdfbacce37..56250c0b5ca0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -153,7 +153,11 @@ static void decrement_queue_count(struct device_queue_manager *dqm,
 		dqm->active_cp_queue_count--;
 }
 
-static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q)
+/*
+ * Allocate a doorbell ID to this queue.
+ * If doorbell_id is passed in, make sure requested ID is valid then allocate it.
+ */
+static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q, uint32_t const *restore_id)
 {
 	struct kfd_dev *dev = qpd->dqm->dev;
 
@@ -161,6 +165,9 @@ static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q)
 		/* On pre-SOC15 chips we need to use the queue ID to
 		 * preserve the user mode ABI.
 		 */
+		if (restore_id && *restore_id != q->properties.queue_id)
+			return -EINVAL;
+
 		q->doorbell_id = q->properties.queue_id;
 	} else if (q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 			q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
@@ -169,25 +176,38 @@ static int allocate_doorbell(struct qcm_process_device *qpd, struct queue *q)
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
+			if (__test_and_set_bit(*restore_id, qpd->doorbell_bitmap)) {
+				return -EINVAL;
+			}
+
+			q->doorbell_id = *restore_id;
+		} else {
+                       /* or reserve a free doorbell ID */
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
@@ -343,7 +363,7 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 		dqm->asic_ops.init_sdma_vm(dqm, q, qpd);
 	}
 
-	retval = allocate_doorbell(qpd, q);
+	retval = allocate_doorbell(qpd, q, qrd ? &qrd->doorbell_id : NULL);
 	if (retval)
 		goto out_deallocate_hqd;
 
@@ -1314,7 +1334,7 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 			goto out;
 	}
 
-	retval = allocate_doorbell(qpd, q);
+	retval = allocate_doorbell(qpd, q, qrd ? &qrd->doorbell_id : NULL);
 	if (retval)
 		goto out_deallocate_sdma_queue;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index bd518340c38c..a4a0713ca9a3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -472,6 +472,7 @@ enum KFD_QUEUE_PRIORITY {
 struct queue_restore_data {
 	uint32_t qid;
 	uint32_t sdma_id;
+	uint32_t doorbell_id;
 };
 
 struct queue_properties {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
