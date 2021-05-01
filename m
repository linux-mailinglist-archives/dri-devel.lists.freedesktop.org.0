Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996C3704DE
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5806F642;
	Sat,  1 May 2021 01:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470B26F63E;
 Sat,  1 May 2021 01:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZRrRUQywmBHJMCpgdM/ai5jM1hQmRo6JKS6dEujs/eCiHLaRBASsW30gQlhWxjJ2FSMVpbiBwoKWhTyFH6XVwJz5bzU4NVpA8MIwXZo8X/6pbYKTl3up/l3h8k0bY5n1slSdTlCjMfDMPGV2nsgt9QdI7COKy+Cp0rIJwqwfb0ob0LG3KsX6NKKdN/2qFogfw4naXIkJWTm+o3BPtksyHRbuFy7J+pm+Jf+74KfwazE6oAgXrzUOK56XiZkFI7CPW6O+awRZpuOnm3sohGAsPrkc0+j7pcq4E0ODgV+Do2LOSzma1s7Bfa2Y1WrspMJXBYxAaQtefcbUW7c8G3ZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BC4b4aKMFDUO8UTDtKfjT5HBi/rudmrTXTcGl+Ef3ec=;
 b=K/nqr/HtBN2NaBGjQCjISWDzBiAwhs88NMIefLGQGth+kRilNfOQYouGjJD/QvbVVNJ66+RRn3s8wjG70iZ99MjsytJxzrEEDyOXTR7ZFe8A4sJ9PBvNz/VgW1cXXED3v644Yzz+Zad13Sp3mE0/HEdH+sBt+o8ZUR63YBCVUz27CnR0ostnwexgl1cxcljZ2f7sl0qFgwFhJjWlbFlkYSNnj11xHxTln5G+eNYPvG9bHgJFOAVVypA65eqHlYmpp1u9TrdksnJsigDe25bPmyXIhg8Z8LfLjpbEEnDlLanzyccgyc3VXi+cEvOyrRuZ3lZbmFGMeXoquBaPC1qmoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BC4b4aKMFDUO8UTDtKfjT5HBi/rudmrTXTcGl+Ef3ec=;
 b=BqxDoGU54oqVZ5VVhabgEIm+Xc0v3lhE6z8V5jUsvAckFN+dGXca3Zf49lqU6YMzYjio9wVNlaVT59KeYo32DCbyUdue8UekhK8zWpngp9dk47z7prG/SK6d84mP8kpmEPZO/5+HUV0iMcQ6MRUHfp7OeJ2fWw/mkl9LYA7RbuI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Sat, 1 May
 2021 01:58:31 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:31 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 13/17] drm/amdkfd: CRIU dump and restore queue mqds
Date: Fri, 30 Apr 2021 21:57:48 -0400
Message-Id: <20210501015752.888-14-Felix.Kuehling@amd.com>
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
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce7497a3-c5c5-4439-e87c-08d90c449ec1
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4932C56958A0E54C453D2751925D9@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9vr69etK0Mc0uETSukEJQrf9qn07um3MlynShY9U/inYg3TO5JRYVFCrlLagAbxUsrC3wZVYpJj/lFy7p3ZpyIddvEXkdaBTgpAETgI9yBVo9T1tfkgl3mYHoK+6DpNtUR2Zp451rahLAdiDZm99NzJuGxuOhrWLmgXi23u2sXc4WlLp8VN30qf+z/4iZorS5jke9xGAU5b4ShnYrxsiInLwOZRqt0YS7hpP9Edev311eyVvNZX+nbAJ+fEAf935TCCOy4osRtTg/AzeaUBS7g5GAn5qGvp6coyjB5BYUVRAz0Wtx3ZbxJnBoenvXsna6/AOhUbzM9JUp0+C/EQeRnlGXjW86zchJsE0xeWlGnRQaf8hTdfKglHm0vjrbVl4w2v/0df9haiTbVXSU8dIICHV5v7PWCAH6zSJA3q9elYEiEqmoySh6u7JH/781S6P7y7L8RF/pVIwH+/+GexyURl/tT4ZQkvIgoSi6z7Zxy6DS8JuJyF5On/SplUjxb3EnW+2vILMGT0YpPC9U2qv2W5v0Eh+MyVUQHUlz4SgcEQLmJ1AoZm1CoSgGy1ZOhpxZFbGKY68PNRv3hkSDOQSpGfk2Un617xpcWK6/fgftLNTXiRCy2bhSU49obGGLqe6nPlSr4g26kWLO2eykF9cR1ClGslZSmEI89LdDv6IyfLsRjGFN1TQDJ1GpIVqyk8CfhuBNvRcI/bbH5Ng999O8Dz78JihHGKrdMooybkdttU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(6512007)(83380400001)(38350700002)(38100700002)(478600001)(26005)(16526019)(186003)(6486002)(86362001)(4326008)(316002)(2616005)(956004)(450100002)(5660300002)(6666004)(66476007)(66556008)(52116002)(2906002)(6506007)(66946007)(8676002)(36756003)(8936002)(30864003)(1076003)(69590400013)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VzqzJXSuT/2BNKZ9j7RuGsuSEIEOtOeUjhF32eOJDzGxsbcELFfgJLQ8xE5l?=
 =?us-ascii?Q?oxaSWCIIOvrWW6Xu6QuhcT4S6blw9xQAmD9xqII9DNSv6o+kEFkMTp28kKwc?=
 =?us-ascii?Q?Rj/yGCVE8BbgwDZAhLpLfeptipqcVW7TqA7CJsip8doLJgIZatpX42eN/bCW?=
 =?us-ascii?Q?ItOmQqbKXG6jo3IdfGFCnIqNgyTVBdgDYIbWvDk9kW4QOilr/hyHq7FgNDyz?=
 =?us-ascii?Q?MBSN5wrG0h9PWwRjZTl28lyFitbRhRMbUznB3/NqjhObgtkG4MWZR6XKfCNV?=
 =?us-ascii?Q?AVG5L8V0XLimPEd/0YS+tzgp45cHhk89PSwkmZTXwB7JLxQ/NNSOOXwdiRQX?=
 =?us-ascii?Q?kwWOuoV9oA1kIQIVN/XYkHqMilavmoPoCitrlcv8CkCeFxflhkjRktmTa8zj?=
 =?us-ascii?Q?ytaJh/JvPtXat1foP2PxsphGqkz0WkB0sWQhi392suDmNcfTmvL2kFuOhd/y?=
 =?us-ascii?Q?R75Rd9hjj8JGDudJnIqjBGDR7ij3x79ITV2xvPZ47XlxzUAVTIuoerO2qkvP?=
 =?us-ascii?Q?IJ645ckmlgzBnoGfOlbl4VKbzM6f8fUjMON2PIjSvq3Moe5FyxgzLH3DnmZZ?=
 =?us-ascii?Q?MzHZ2iXjPrk1Nm+9GJXGFc1f8ob+RjnAueedudYXuD+TQhHf/PGKsIUb5NLJ?=
 =?us-ascii?Q?Uomct/eMsGPb222BO+kiohxASWFCXK1ag9Aa3dB2LG7Gkaw1CrgMtHuTXW6j?=
 =?us-ascii?Q?GMerYm+kc86PnYlLQ4Fxji4xyycpUwt5KrT5PcJ+t6aF8jEOa2KdSNJ+KcNm?=
 =?us-ascii?Q?aQl3ARcMstNxt0o9zqBoyEE6tK9eEFJU/+sLo0L1A/l6UwjTvZvYZEJkHusX?=
 =?us-ascii?Q?NMgQR2IswI5Wq0fxYAx5dGs0YtsKvMMvmWHI4NzhpAfAuPf4B7HmxHRMFeOw?=
 =?us-ascii?Q?kSBYfurUpSs9qJA5vh8Qj0OeWPP1+px10hrE8KD4LJNYmXUchoMgWEy71taJ?=
 =?us-ascii?Q?6VbAI0pBTGbf3MKhBDWfoBCqUmvN/H5T0PmNmQ9GTMVAACf9GgKnznVeX3Cm?=
 =?us-ascii?Q?1rNy6nnfv0uyUdM/TPqaX7u5wGlKbjsDgpIpbQ7VuszQvNYQFacLk9vHTTfI?=
 =?us-ascii?Q?ihHQMB4rx5NpkG7pjjC/r/ZtVv8sTIls1iHqAuDBvLqamYzOxLBr8fGUIcYQ?=
 =?us-ascii?Q?B8iQNgokhWrkM1eLO7hQQW5D9GkNSyUxM29iGSpQjCuRCJJB/41xHZFY8lrH?=
 =?us-ascii?Q?g1AikEmQ6RHJGYPvv/VfbogoYPt5wG7ywdYQnAs1cFWRgYiFCCr0JZhg//JZ?=
 =?us-ascii?Q?lOxbVSuikfEBf0Gymg2sHiqlJYyES6q3bNSCn4vXjSFcwws5QSC+ewAsohNx?=
 =?us-ascii?Q?CLL+Fzqtg52wa2nO8NhVPBlk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7497a3-c5c5-4439-e87c-08d90c449ec1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:31.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyNW31BqImBlX6MwBbpTqmkVo5pPOxahDcjfV4IkPdKtibCxA+Iwt5nEURJAneAHjMkMHAzKPjBzbmv/JbE7bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
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

Dump contents of queue MQD's on CRIU dump and restore them during CRIU
restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Change-Id: If54f892fb6cb8a5bde8a993891dad0dbb997c239
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 35 ++++++++--
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 64 +++++++++++++++--
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  8 +++
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |  8 +++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  | 66 ++++++++++++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  | 67 ++++++++++++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   | 68 +++++++++++++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   | 67 ++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  8 +++
 .../amd/amdkfd/kfd_process_queue_manager.c    | 42 ++++++++++++
 10 files changed, 422 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 1d2c2d986a44..b7f3aa759c17 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1893,11 +1893,18 @@ static int kfd_devinfo_restore(struct kfd_process *p, struct kfd_criu_devinfo_bu
 
 static int get_queue_data_sizes(struct kfd_process_device *pdd,
 				struct queue *q,
-				uint32_t *cu_mask_size)
+				uint32_t *cu_mask_size,
+				uint32_t *mqd_size)
 {
 	int ret = 0;
 
 	*cu_mask_size = sizeof(uint32_t) * (q->properties.cu_mask_count / 32);
+
+	ret = pqm_get_queue_dump_info(&pdd->process->pqm, q->properties.queue_id, mqd_size);
+	if (ret) {
+		pr_err("Failed to get queue dump info (%d)\n", ret);
+		return ret;
+	}
 	return ret;
 }
 
@@ -1906,6 +1913,8 @@ static int criu_dump_queue(struct kfd_process_device *pdd,
                            struct kfd_criu_q_bucket *q_bucket,
 			   struct queue_restore_data *qrd)
 {
+	int ret = 0;
+
 	q_bucket->gpu_id = pdd->dev->id;
 	q_bucket->type = q->properties.type;
 	q_bucket->format = q->properties.format;
@@ -1935,8 +1944,15 @@ static int criu_dump_queue(struct kfd_process_device *pdd,
 	if (qrd->cu_mask_size)
 		memcpy(qrd->cu_mask, q->properties.cu_mask, qrd->cu_mask_size);
 
+	ret = pqm_dump_mqd(&pdd->process->pqm, q->properties.queue_id, qrd);
+	if (ret) {
+		pr_err("Failed dump queue_mqd (%d)\n", ret);
+		return ret;
+	}
+
 	q_bucket->cu_mask_size = qrd->cu_mask_size;
-	return 0;
+	q_bucket->mqd_size = qrd->mqd_size;
+	return ret;
 }
 
 static int criu_dump_queues_device(struct kfd_process_device *pdd,
@@ -1975,14 +1991,14 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 		memset(&q_bucket, 0, sizeof(q_bucket));
 		memset(&qrd, 0, sizeof(qrd));
 
-		ret = get_queue_data_sizes(pdd, q, &qrd.cu_mask_size);
+		ret = get_queue_data_sizes(pdd, q, &qrd.cu_mask_size, &qrd.mqd_size);
 		if (ret) {
 			pr_err("Failed to get queue dump info (%d)\n", ret);
 			ret = -EFAULT;
 			break;
 		}
 
-		q_data_size = qrd.cu_mask_size;
+		q_data_size = qrd.cu_mask_size + qrd.mqd_size;
 
 		/* Increase local buffer space if needed */
 		if (data_ptr_size < q_data_size) {
@@ -1998,6 +2014,7 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 		}
 
 		qrd.cu_mask = data_ptr;
+		qrd.mqd = data_ptr + qrd.cu_mask_size;
 		ret = criu_dump_queue(pdd, q, &q_bucket, &qrd);
 		if (ret)
 			break;
@@ -2317,7 +2334,7 @@ static int criu_restore_queues(struct kfd_process *p,
 			return ret;
 		}
 
-		q_data_size = q_bucket.cu_mask_size;
+		q_data_size = q_bucket.cu_mask_size + q_bucket.mqd_size;
 
 		/* Increase local buffer space if needed */
 		if (q_data_size > data_ptr_size) {
@@ -2343,6 +2360,9 @@ static int criu_restore_queues(struct kfd_process *p,
 		qrd.cu_mask_size = q_bucket.cu_mask_size;
 		qrd.cu_mask = data_ptr;
 
+		qrd.mqd_size = q_bucket.mqd_size;
+		qrd.mqd = data_ptr + qrd.cu_mask_size;
+
 		ret = criu_restore_queue(p, dev, pdd, &q_bucket, &qrd);
 		if (ret) {
 			pr_err("Failed to restore queue (%d)\n", ret);
@@ -2680,11 +2700,12 @@ static int kfd_ioctl_criu_helper(struct file *filep,
 				q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
 
 				u32 cu_mask_size = 0;
-				ret = get_queue_data_sizes(pdd, q, &cu_mask_size);
+				u32 mqd_size = 0;
+				ret = get_queue_data_sizes(pdd, q, &cu_mask_size, &mqd_size);
 				if (ret)
 					goto err_unlock;
 
-				queues_data_size += cu_mask_size;
+				queues_data_size += cu_mask_size + mqd_size;
 				q_index++;
 			} else {
 				pr_err("Unsupported queue type (%d)\n", q->properties.type);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 56250c0b5ca0..ee34229a41b0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -376,8 +376,14 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 		retval = -ENOMEM;
 		goto out_deallocate_doorbell;
 	}
-	mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
-				&q->gart_mqd_addr, &q->properties);
+
+	if (qrd)
+		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
+				&q->gart_mqd_addr, &q->properties, qrd);
+	else
+		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
+					&q->gart_mqd_addr, &q->properties);
+
 	if (q->properties.is_active) {
 		if (!dqm->sched_running) {
 			WARN_ONCE(1, "Load non-HWS mqd while stopped\n");
@@ -1359,8 +1365,13 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	 * updates the is_evicted flag but is a no-op otherwise.
 	 */
 	q->properties.is_evicted = !!qpd->evicted;
-	mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
-				&q->gart_mqd_addr, &q->properties);
+
+	if (qrd)
+		mqd_mgr->restore_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
+				&q->gart_mqd_addr, &q->properties, qrd);
+	else
+		mqd_mgr->init_mqd(mqd_mgr, &q->mqd, q->mqd_mem_obj,
+					&q->gart_mqd_addr, &q->properties);
 
 	list_add(&q->list, &qpd->queues_list);
 	qpd->queue_count++;
@@ -1743,6 +1754,47 @@ static int get_wave_state(struct device_queue_manager *dqm,
 	return r;
 }
 
+static void get_queue_dump_info(struct device_queue_manager *dqm,
+			const struct queue *q,
+			u32 *mqd_size)
+{
+	struct mqd_manager *mqd_mgr;
+	enum KFD_MQD_TYPE mqd_type =
+			get_mqd_type_from_queue_type(q->properties.type);
+
+	mqd_mgr = dqm->mqd_mgrs[mqd_type];
+	*mqd_size = mqd_mgr->mqd_size;
+}
+
+static int dump_mqd(struct device_queue_manager *dqm,
+			  const struct queue *q,
+			  struct queue_restore_data *qrd)
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
+	if (!mqd_mgr->dump_mqd) {
+		r = -ENOTSUPP;
+		goto dqm_unlock;
+	}
+
+	mqd_mgr->dump_mqd(mqd_mgr, q->mqd, qrd);
+
+dqm_unlock:
+	dqm_unlock(dqm);
+	return r;
+}
+
 static int process_termination_cpsch(struct device_queue_manager *dqm,
 		struct qcm_process_device *qpd)
 {
@@ -1917,6 +1969,8 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 		dqm->ops.evict_process_queues = evict_process_queues_cpsch;
 		dqm->ops.restore_process_queues = restore_process_queues_cpsch;
 		dqm->ops.get_wave_state = get_wave_state;
+		dqm->ops.get_queue_dump_info = get_queue_dump_info;
+		dqm->ops.dump_mqd = dump_mqd;
 		break;
 	case KFD_SCHED_POLICY_NO_HWS:
 		/* initialize dqm for no cp scheduling */
@@ -1936,6 +1990,8 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 		dqm->ops.restore_process_queues =
 			restore_process_queues_nocpsch;
 		dqm->ops.get_wave_state = get_wave_state;
+		dqm->ops.get_queue_dump_info = get_queue_dump_info;
+		dqm->ops.dump_mqd = dump_mqd;
 		break;
 	default:
 		pr_err("Invalid scheduling policy %d\n", dqm->sched_policy);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index a5baf50fd6dc..27952e33a404 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -135,6 +135,14 @@ struct device_queue_manager_ops {
 				  void __user *ctl_stack,
 				  u32 *ctl_stack_used_size,
 				  u32 *save_area_used_size);
+
+	void	(*get_queue_dump_info)(struct device_queue_manager *dqm,
+				  const struct queue *q,
+				  u32 *mqd_size);
+
+	int	(*dump_mqd)(struct device_queue_manager *dqm,
+				  const struct queue *q,
+				  struct queue_restore_data *qrd);
 };
 
 struct device_queue_manager_asic_ops {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
index b5e2ea7550d4..82da00bc71aa 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
@@ -98,6 +98,14 @@ struct mqd_manager {
 				  u32 *ctl_stack_used_size,
 				  u32 *save_area_used_size);
 
+	void	(*dump_mqd)(struct mqd_manager *mm, void *mqd,
+				struct queue_restore_data *qrd);
+
+	void	(*restore_mqd)(struct mqd_manager *mm, void **mqd,
+				struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+				struct queue_properties *p,
+				const struct queue_restore_data *qrd);
+
 #if defined(CONFIG_DEBUG_FS)
 	int	(*debugfs_show_mqd)(struct seq_file *m, void *data);
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index 064914e1e8d6..3f59466a5104 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -275,6 +275,68 @@ static int destroy_mqd(struct mqd_manager *mm, void *mqd,
 					pipe_id, queue_id);
 }
 
+static void dump_mqd(struct mqd_manager *mm, void *mqd,
+                       struct queue_restore_data *qrd)
+{
+	struct cik_mqd *m;
+	m = get_mqd(mqd);
+
+	memcpy(qrd->mqd, m, sizeof(struct cik_mqd));
+}
+
+static void restore_mqd(struct mqd_manager *mm, void **mqd,
+                       struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+                       struct queue_properties *qp,
+                       const struct queue_restore_data *qrd)
+{
+	uint64_t addr;
+	struct cik_mqd *m;
+	m = (struct cik_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, qrd->mqd, sizeof(*m));
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
+static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd,
+                       struct queue_restore_data *qrd)
+{
+	struct cik_sdma_rlc_registers *m;
+	m = get_sdma_mqd(mqd);
+
+	memcpy(qrd->mqd, m, sizeof(struct cik_sdma_rlc_registers));
+}
+
+static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
+                       struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+                       struct queue_properties *qp,
+                       const struct queue_restore_data *qrd)
+{
+	uint64_t addr;
+	struct cik_sdma_rlc_registers *m;
+
+	m = (struct cik_sdma_rlc_registers *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, qrd->mqd, sizeof(*m));
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
@@ -388,6 +450,8 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd;
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
+		mqd->dump_mqd = dump_mqd;
+		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct cik_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -428,6 +492,8 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->dump_mqd = dump_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct cik_sdma_rlc_registers);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index c7fb59ca597f..126c0dc63f10 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -283,6 +283,40 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
+static void dump_mqd(struct mqd_manager *mm, void *mqd,
+                       struct queue_restore_data *qrd)
+{
+	struct v10_compute_mqd *m;
+	m = get_mqd(mqd);
+
+	memcpy(qrd->mqd, m, sizeof(struct v10_compute_mqd));
+}
+
+static void restore_mqd(struct mqd_manager *mm, void **mqd,
+                       struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+                       struct queue_properties *qp,
+                       const struct queue_restore_data *qrd)
+{
+	uint64_t addr;
+	struct v10_compute_mqd *m;
+	m = (struct v10_compute_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, qrd->mqd, sizeof(*m));
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
@@ -370,6 +404,35 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->kgd, mqd);
 }
 
+static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd,
+                       struct queue_restore_data *qrd)
+{
+	struct v10_sdma_mqd *m;
+	m = get_sdma_mqd(mqd);
+
+	memcpy(qrd->mqd, m, sizeof(struct v10_sdma_mqd));
+}
+
+static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
+                       struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+                       struct queue_properties *qp,
+                       const struct queue_restore_data *qrd)
+{
+	uint64_t addr;
+	struct v10_sdma_mqd *m;
+
+	m = (struct v10_sdma_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, qrd->mqd, sizeof(*m));
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
@@ -414,6 +477,8 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->is_occupied = is_occupied;
 		mqd->mqd_size = sizeof(struct v10_compute_mqd);
 		mqd->get_wave_state = get_wave_state;
+		mqd->dump_mqd = dump_mqd;
+		mqd->restore_mqd = restore_mqd;
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
 #endif
@@ -458,6 +523,8 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
 		mqd->mqd_size = sizeof(struct v10_sdma_mqd);
+		mqd->dump_mqd = dump_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
 #endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 7f4e102ff4bd..8318192920e4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -338,6 +338,41 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
+static void dump_mqd(struct mqd_manager *mm, void *mqd,
+                       struct queue_restore_data *qrd)
+{
+	struct v9_mqd *m;
+	m = get_mqd(mqd);
+
+	memcpy(qrd->mqd, m, sizeof(struct v9_mqd));
+}
+
+static void restore_mqd(struct mqd_manager *mm, void **mqd,
+                       struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+                       struct queue_properties *qp,
+                       const struct queue_restore_data *qrd)
+{
+	uint64_t addr;
+	struct v9_mqd *m;
+	m = (struct v9_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, qrd->mqd, sizeof(*m));
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+
+	/* Control stack is located one page after MQD. */
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
@@ -425,6 +460,35 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->kgd, mqd);
 }
 
+static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd,
+                       struct queue_restore_data *qrd)
+{
+	struct v9_sdma_mqd *m;
+	m = get_sdma_mqd(mqd);
+
+	memcpy(qrd->mqd, m, sizeof(struct v9_sdma_mqd));
+}
+
+static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
+                       struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+                       struct queue_properties *qp,
+                       const struct queue_restore_data *qrd)
+{
+	uint64_t addr;
+	struct v9_sdma_mqd *m;
+
+	m = (struct v9_sdma_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, qrd->mqd, sizeof(*m));
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
@@ -467,6 +531,8 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->dump_mqd = dump_mqd;
+		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct v9_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -507,6 +573,8 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->dump_mqd = dump_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct v9_sdma_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index 33dbd22d290f..ff436737b717 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -303,6 +303,40 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
+static void dump_mqd(struct mqd_manager *mm, void *mqd,
+                       struct queue_restore_data *qrd)
+{
+	struct vi_mqd *m;
+	m = get_mqd(mqd);
+
+	memcpy(qrd->mqd, m, sizeof(struct vi_mqd));
+}
+
+static void restore_mqd(struct mqd_manager *mm, void **mqd,
+                       struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+                       struct queue_properties *qp,
+                       const struct queue_restore_data *qrd)
+{
+	uint64_t addr;
+	struct vi_mqd *m;
+	m = (struct vi_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, qrd->mqd, sizeof(*m));
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
@@ -394,6 +428,35 @@ static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
 	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->kgd, mqd);
 }
 
+static void dump_mqd_sdma(struct mqd_manager *mm, void *mqd,
+                       struct queue_restore_data *qrd)
+{
+	struct vi_sdma_mqd *m;
+	m = get_sdma_mqd(mqd);
+
+	memcpy(qrd->mqd, m, sizeof(struct vi_sdma_mqd));
+}
+
+static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
+                       struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+                       struct queue_properties *qp,
+                       const struct queue_restore_data *qrd)
+{
+	uint64_t addr;
+	struct vi_sdma_mqd *m;
+
+	m = (struct vi_sdma_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	memcpy(m, qrd->mqd, sizeof(*m));
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
@@ -436,6 +499,8 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->dump_mqd = dump_mqd;
+		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct vi_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -476,6 +541,8 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd_sdma;
 		mqd->destroy_mqd = destroy_mqd_sdma;
 		mqd->is_occupied = is_occupied_sdma;
+		mqd->dump_mqd = dump_mqd_sdma;
+		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct vi_sdma_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 55180a6fe102..defea19c8bb9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -476,6 +476,8 @@ struct queue_restore_data {
 
 	void *cu_mask;
 	uint32_t cu_mask_size;
+	void *mqd;
+	uint32_t mqd_size;
 };
 
 struct queue_properties {
@@ -1087,6 +1089,12 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 int amdkfd_fence_wait_timeout(uint64_t *fence_addr,
 			      uint64_t fence_value,
 			      unsigned int timeout_ms);
+int pqm_get_queue_dump_info(struct process_queue_manager *pqm,
+			unsigned int qid,
+			u32 *mqd_size);
+int pqm_dump_mqd(struct process_queue_manager *pqm,
+		       unsigned int qid,
+		       struct queue_restore_data* qrd);
 
 /* Packet Manager */
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 0ca7db288b9f..8516e93b521b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -527,6 +527,48 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
+int pqm_get_queue_dump_info(struct process_queue_manager *pqm,
+			unsigned int qid,
+			u32 *mqd_size)
+{
+	struct process_queue_node *pqn;
+
+	pqn = get_queue_by_qid(pqm, qid);
+	if (!pqn) {
+		pr_debug("amdkfd: No queue %d exists for operation\n", qid);
+		return -EFAULT;
+	}
+
+	if (!pqn->q->device->dqm->ops.get_queue_dump_info) {
+		pr_err("amdkfd: queue dumping not supported on this device\n");
+		return -ENOTSUPP;
+	}
+
+	pqn->q->device->dqm->ops.get_queue_dump_info(pqn->q->device->dqm,
+						       pqn->q, mqd_size);
+	return 0;
+}
+
+int pqm_dump_mqd(struct process_queue_manager *pqm,
+		       unsigned int qid, struct queue_restore_data* qrd)
+{
+	struct process_queue_node *pqn;
+
+	pqn = get_queue_by_qid(pqm, qid);
+	if (!pqn) {
+		pr_debug("amdkfd: No queue %d exists for operation\n", qid);
+		return -EFAULT;
+	}
+
+	if (!pqn->q->device->dqm->ops.dump_mqd) {
+		pr_err("amdkfd: queue dumping not supported on this device\n");
+		return -ENOTSUPP;
+	}
+
+	return pqn->q->device->dqm->ops.dump_mqd(pqn->q->device->dqm,
+						       pqn->q, qrd);
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 int pqm_debugfs_mqds(struct seq_file *m, void *data)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
