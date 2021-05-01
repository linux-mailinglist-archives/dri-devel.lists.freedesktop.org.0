Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E053704E5
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592FA6F879;
	Sat,  1 May 2021 01:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCC16F634;
 Sat,  1 May 2021 01:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFTWFykcYdAclTkXdo3i+EZxFkXQpDaN4dMAA/jAGfpROM7E1STi1gSCqDArfk5tbFGyPrCLFVZajAYnUi0m9PdcRBhvRcm/ODWy/2AAWvinRV80EsjQ2XPM6244div8jxqh/bD0aOwa0DWk1mTqBF8FTdOg3+ONp0mqmuG4BgiQjS2CBMJ0BCFKHkgw+lY3Tldrs+TvU0kYvHdO0r7jgVE3ozpIKiOfGbz3vA8I4zi8HDOw85wPgE2AUahQrSVPaEcY4TABWo4P3OHfOAgFn6wc/XEMgyeks7EZVUHn7KSiTKkqYEBWc+gmeiHnjcQ8qx9XQ3abzcNMevvshwkazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPLhzqn3UKv+bXHAQQmMZru015YYYuUsjVAL/MQdfjQ=;
 b=PRtmpJdE/miTjIVgcTPaofm3TfWlyBRX5Nq9BagvZCSkU+wuACIkPMI4g/ULFWnmzo23mHCpYqYq8Elyo3wsU+49673EVvuJl1dL1kuTZ3O03eIdfDpldndkWlRv620WxsCOJul+uRyRbhLOWfqBSwldh2SgkoSxULDV9qcWmNKVhe2VIvaYdcVtb7nPPA0S7rZJbjJYIaQu1aC+4BnT//WkTRsFjTG4K8tsgiMrr/qUQfxlMY6Scqg+ffQmT1n4qWkP8Ns7O9b3XZCIDVRSIUaVm3hyrG8rpjzt8tv3IKCVT60GZI3BLPhgs0WVOEybIGt9zU438XWvlOEdROWTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPLhzqn3UKv+bXHAQQmMZru015YYYuUsjVAL/MQdfjQ=;
 b=cGF0i3ngaiY1bTBW8L7C7udYkLvyGwAKdRN9AKTf4mheywGOhqX9cc0M9/uLHHiCx/OndMxkYqr06sf/+kiwxpLX5JQADFflGg/R3+Gn6JC/MkKUglPSg/JIIFdmMucyE0tZRkTTbp0JsIem7BAVSAoF4xRlNPLkNdUDmg/81t4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Sat, 1 May
 2021 01:58:30 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:30 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 12/17] drm/amdkfd: CRIU restore CU mask for queues
Date: Fri, 30 Apr 2021 21:57:47 -0400
Message-Id: <20210501015752.888-13-Felix.Kuehling@amd.com>
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
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31454404-629a-4327-6aa1-08d90c449e0d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4932F556C8A9E993E1E5956F925D9@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FM+HtnrkgNzciJJwScopU/ZvR2ZjrKMT6TRc0vQ1cfdZ0u5diRQ3tXnswx8zHTRxhXER6PcDXS8OxkOXzeoBwzf8U7ncPeo8hwcuTEddgD7jhWNtErcfbvtmBIDPpyNLIt38KFY/PcDXl3n/RYsreWAwy1vt6RXPR2Cy0zjKSV/BddrGkHDF8fx+ZiqWEr1tdi/US8PuPRZYGrSPDQ04fj8Fw9G+Je9h2I9toQJ+5vwg/WCHxkovL+zRKWIvJCJnhs/PnGhoNM69FvWNyaLSQixY5Z9YsfakA6nLkLloP2t+OP8WblqX+6Tgjvl2/Ze7fxyXdRU3qQnEWiebEPLdi0XNm8wWuyQNnpQgvms+XytB5p5tGMu8kdsFu2Jmi1yW7zjaXNvIeIP/o9BwW4Gs4zhbwvE/oCuEnTvEsSmxVxDNUZp4j6zYuzHxodIxO4So5aM164nRjoJr5YbDb6ud8tUqlq6HUMGXdVYCpUv6zKjQzYQSQ5eR827xlF/LDlEWoZhR4IrPArZPVjb1eMGMJVCulXnfixpY87w6FoQ2ZvQKmzK1RhF4hm4ivYGrXz9DD2Qw2Mi15ALYjKLKmWWZBsb2l4MsJRZLzvTjNRTv/oUxKNuVoD4E0rfpIOi95e1CAOQwce1i8sav5S86KVqA5Hz6DMxbVgm2hOJjeAnBhaFf5Nvuwg8UpJ+Grjw0Hxn4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(6512007)(83380400001)(38350700002)(38100700002)(478600001)(26005)(16526019)(186003)(6486002)(86362001)(4326008)(316002)(2616005)(956004)(450100002)(5660300002)(6666004)(66476007)(66556008)(52116002)(2906002)(6506007)(66946007)(8676002)(36756003)(8936002)(1076003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Lx3zXY2J2kkNavKaGF43kEb+YaPfChPbu8koBLyd6dndAcEHXWuoBupgHg1/?=
 =?us-ascii?Q?H/xTJ1pcphxHWlSIkYrN6BuzLOp41wCynnfotCPB5jGQsR8Q93FsH2crIhzH?=
 =?us-ascii?Q?ygDl9JbnUIaIzxF4HJPLtZ4RlAF+/Z8FydxtoHJXFUouO+KA5JYwNpS7B+UO?=
 =?us-ascii?Q?7dMpkY+YZd1uFU/vb/thWha66wM3NVNjvZgwNhbJ1UzY/lL0baOX4P4VrYjf?=
 =?us-ascii?Q?u3F5BGIXx6UOKHU0u7h0eoQXG5pvatNaWJPTBzDBWs1lut4vQuaZZgGeKXa+?=
 =?us-ascii?Q?AuiDkjH2YyINSg3jHNXu/offnsEKUy4ywWi11dvSPaf5c6RuRQzb8nKNPy3Y?=
 =?us-ascii?Q?rW+wh6lCWwlidV/Ed8YnDVaCJSHmmzhOAH57mE5GwoKhan6xk0IpT/rsR3HO?=
 =?us-ascii?Q?pZfi/6qMb2Vtf8QvR9pICVOJfyCv/LIr+oCOZAeLdPJ4rpxeDxrIKqCdJ7AJ?=
 =?us-ascii?Q?lWTdC8PCVsFqCzvQIIC3IS2OSnHfaHjaqqbGlm3u8BtlCndoS+7wObonsHhZ?=
 =?us-ascii?Q?kn1A+nhNySFPeMvuhtyA02vKJV8t3AcEhTg4r2snfmiCKb3Y2OA5wyoJkQlr?=
 =?us-ascii?Q?1GSMXLbJXMVhKTRZwV5haAO0Vj3ICnY3fcfPNZHI33OCacy2qbWRi6BOuiY9?=
 =?us-ascii?Q?JO6ULocc8+hhsD7Cbcag+YcYq6FWC6a0io43uqbQrSUpcilYo1bUE2D+B/PF?=
 =?us-ascii?Q?v7zfdrmhepb87Onf+LB7I4+cCqVs6PYnxuGB3N3oJ6n+b2HEwid6MOCADcXm?=
 =?us-ascii?Q?XnQuiS+odXc8b0x+UEQENWFxY1QIOG4mrdSsUzcxdj914XBpug6q5luzMfzI?=
 =?us-ascii?Q?lvp4YmziqA0CfP7yunSw0tpJBylCCPQmGUWS1VJhkX5lOF+bsGZgtQVtVXih?=
 =?us-ascii?Q?lSBb7OEVFYns+79r4TQ2flmF+KkyOhf+DPCWVh05HB9mdt0Bu9E/jn/lviCr?=
 =?us-ascii?Q?eE1nGR6Hdw6Pqk7QEjYjXlzlWCl/H8PiFpfOEjaSseaZG7Z2alV2sYB1zMZP?=
 =?us-ascii?Q?OLgk76qDtIsPqt48/wIebVSpraUFGmlkHMX2NGwnNNW+J7t3hDEA8JGpTnES?=
 =?us-ascii?Q?zZuD331vZsjch6Cj+yKa0XlPNACYtfd3SN97coTlrIKHj1zlUZfHfZxZ93Vl?=
 =?us-ascii?Q?CdONm1pXborHxoW81lFshhyIBCNgT8dXh0czl9G12NApXaDIgUNQKBbEu1WQ?=
 =?us-ascii?Q?jmJMBdK8ROv2JCFbilOta4RCNEVTx2uc4DnxrKJqG6NY9o5RJPlP32HY5Dze?=
 =?us-ascii?Q?R5AzkUVdl7Vqti3mg66iM3fcZ+YaeWwFHNS9uHBsZqF06PcsF3W8cKkKRb54?=
 =?us-ascii?Q?hfafoSNrH2kd1233PU5X1izj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31454404-629a-4327-6aa1-08d90c449e0d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:30.2438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wHlbFtZrgIdLo/UcQws4H7USDiccQfaQTzNKZLqrzz90GXLSZcbWZtRdlHH8STDBmUZhT4QcmVr/Kf/if8hMQ==
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

When re-creating queues during CRIU restore, restore the queue
with the same CU mask value used during CRIU dump.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Change-Id: I1822fa2488f90365dfe7a3c5971a2ed6c0046b4a
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 160 +++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +
 2 files changed, 154 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 130ab100abb2..1d2c2d986a44 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1890,9 +1890,21 @@ static int kfd_devinfo_restore(struct kfd_process *p, struct kfd_criu_devinfo_bu
 	}
 	return 0;
 }
-static void criu_dump_queue(struct kfd_process_device *pdd,
+
+static int get_queue_data_sizes(struct kfd_process_device *pdd,
+				struct queue *q,
+				uint32_t *cu_mask_size)
+{
+	int ret = 0;
+
+	*cu_mask_size = sizeof(uint32_t) * (q->properties.cu_mask_count / 32);
+	return ret;
+}
+
+static int criu_dump_queue(struct kfd_process_device *pdd,
                            struct queue *q,
-                           struct kfd_criu_q_bucket *q_bucket)
+                           struct kfd_criu_q_bucket *q_bucket,
+			   struct queue_restore_data *qrd)
 {
 	q_bucket->gpu_id = pdd->dev->id;
 	q_bucket->type = q->properties.type;
@@ -1920,18 +1932,30 @@ static void criu_dump_queue(struct kfd_process_device *pdd,
 		q->properties.ctx_save_restore_area_size;
 
 	q_bucket->ctl_stack_size = q->properties.ctl_stack_size;
+	if (qrd->cu_mask_size)
+		memcpy(qrd->cu_mask, q->properties.cu_mask, qrd->cu_mask_size);
+
+	q_bucket->cu_mask_size = qrd->cu_mask_size;
+	return 0;
 }
 
 static int criu_dump_queues_device(struct kfd_process_device *pdd,
 				unsigned *q_index,
 				unsigned int max_num_queues,
-				struct kfd_criu_q_bucket *user_buckets)
+				struct kfd_criu_q_bucket *user_buckets,
+				uint8_t *queues_data,
+				uint32_t *queues_data_offset,
+				uint32_t queues_data_size)
 {
 	struct queue *q;
+	struct queue_restore_data qrd;
 	struct kfd_criu_q_bucket q_bucket;
+	uint8_t *data_ptr = NULL;
+	unsigned int data_ptr_size = 0;
 	int ret = 0;
 
 	list_for_each_entry(q, &pdd->qpd.queues_list, list) {
+		unsigned int q_data_size;
 		if (q->properties.type != KFD_QUEUE_TYPE_COMPUTE &&
 			q->properties.type != KFD_QUEUE_TYPE_SDMA &&
 			q->properties.type != KFD_QUEUE_TYPE_SDMA_XGMI) {
@@ -1949,7 +1973,49 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 		}
 
 		memset(&q_bucket, 0, sizeof(q_bucket));
-		criu_dump_queue(pdd, q, &q_bucket);
+		memset(&qrd, 0, sizeof(qrd));
+
+		ret = get_queue_data_sizes(pdd, q, &qrd.cu_mask_size);
+		if (ret) {
+			pr_err("Failed to get queue dump info (%d)\n", ret);
+			ret = -EFAULT;
+			break;
+		}
+
+		q_data_size = qrd.cu_mask_size;
+
+		/* Increase local buffer space if needed */
+		if (data_ptr_size < q_data_size) {
+			if (data_ptr)
+				kfree(data_ptr);
+
+			data_ptr = (uint8_t*)kzalloc(q_data_size, GFP_KERNEL);
+			if (!data_ptr) {
+				ret = -ENOMEM;
+				break;
+			}
+			data_ptr_size = q_data_size;
+		}
+
+		qrd.cu_mask = data_ptr;
+		ret = criu_dump_queue(pdd, q, &q_bucket, &qrd);
+		if (ret)
+			break;
+
+		if (*queues_data_offset + q_data_size > queues_data_size) {
+			pr_err("Required memory exceeds user provided\n");
+			ret = -ENOSPC;
+			break;
+		}
+		ret = copy_to_user((void __user *) (queues_data + *queues_data_offset),
+				data_ptr, q_data_size);
+		if (ret) {
+			ret = -EFAULT;
+			break;
+		}
+		q_bucket.queues_data_offset = *queues_data_offset;
+		*queues_data_offset += q_data_size;
+
 		ret = copy_to_user((void __user *)&user_buckets[*q_index],
 					&q_bucket, sizeof(q_bucket));
 		if (ret) {
@@ -1959,6 +2025,10 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 		}
 		*q_index = *q_index + 1;
 	}
+
+	if (data_ptr)
+		kfree(data_ptr);
+
 	return ret;
 }
 
@@ -1976,6 +2046,8 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 	struct kfd_criu_q_bucket *user_buckets =
 		(struct kfd_criu_q_bucket*) args->kfd_criu_q_buckets_ptr;
 
+	uint8_t *queues_data = (uint8_t*)args->queues_data_ptr;
+	uint32_t queues_data_offset = 0;
 
 	pr_info("Inside %s\n",__func__);
 
@@ -2076,7 +2148,10 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 		}
 
 		ret = criu_dump_queues_device(pdd, &q_index,
-					args->num_of_queues, user_buckets);
+					args->num_of_queues, user_buckets,
+					queues_data, &queues_data_offset,
+					args->queues_data_size);
+
 		if (ret)
 			goto err_unlock;
 	}
@@ -2098,8 +2173,9 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 	return ret;
 }
 
-static void set_queue_properties_from_criu(struct queue_properties *qp,
-                                       struct kfd_criu_q_bucket *q_bucket)
+static int set_queue_properties_from_criu(struct queue_properties *qp,
+                                       struct kfd_criu_q_bucket *q_bucket,
+				       struct queue_restore_data *qrd)
 {
 	qp->is_interop = false;
 	qp->is_gws = q_bucket->is_gws;
@@ -2116,6 +2192,19 @@ static void set_queue_properties_from_criu(struct queue_properties *qp,
 	qp->ctl_stack_size = q_bucket->ctl_stack_size;
 	qp->type = q_bucket->type;
 	qp->format = q_bucket->format;
+
+	if (qrd->cu_mask_size) {
+		qp->cu_mask = kzalloc(qrd->cu_mask_size, GFP_KERNEL);
+		if (!qp->cu_mask) {
+			pr_err("Failed to allocate memory for CU mask\n");
+			return -ENOMEM;
+		}
+
+		memcpy(qp->cu_mask, qrd->cu_mask, qrd->cu_mask_size);
+		qp->cu_mask_count = (qrd->cu_mask_size / sizeof(uint32_t)) * 32;
+	}
+
+	return 0;
 }
 
 /* criu_restore_queue runs with the process mutex locked */
@@ -2148,7 +2237,10 @@ int criu_restore_queue(struct kfd_process *p,
 			q_bucket->q_address);
 
 	memset(&qp, 0, sizeof(qp));
-	set_queue_properties_from_criu(&qp, q_bucket);
+	ret = set_queue_properties_from_criu(&qp, q_bucket, qrd);
+	if (ret)
+		goto err_create_queue;
+
 	print_queue_properties(&qp);
 
 	qrd->qid = q_bucket->q_id;
@@ -2158,12 +2250,18 @@ int criu_restore_queue(struct kfd_process *p,
 	ret = pqm_create_queue(&p->pqm, dev, NULL, &qp, &queue_id, qrd, NULL);
 	if (ret) {
 		pr_err("Failed to create new queue err:%d\n", ret);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_create_queue;
 	}
 
 	pr_debug("Queue id %d was restored successfully\n", queue_id);
 
 	return 0;
+err_create_queue:
+	if (qp.cu_mask)
+		kfree(qp.cu_mask);
+
+	return ret;
 }
 
 /* criu_restore_queues runs with the process mutex locked */
@@ -2176,6 +2274,11 @@ static int criu_restore_queues(struct kfd_process *p,
 	int ret;
 	struct kfd_criu_q_bucket *user_buckets =
 		(struct kfd_criu_q_bucket*) args->kfd_criu_q_buckets_ptr;
+
+	uint8_t *queues_data = (uint8_t*)args->queues_data_ptr;
+	uint8_t *data_ptr = NULL;
+	uint32_t data_ptr_size = 0;
+
 	/*
          * This process will not have any queues at this point, but we are
          * setting all the dqm's for this process to evicted state.
@@ -2185,6 +2288,7 @@ static int criu_restore_queues(struct kfd_process *p,
 	for (i = 0; i < args->num_of_queues; i++) {
 		struct kfd_criu_q_bucket q_bucket;
 		struct queue_restore_data qrd;
+		uint32_t q_data_size;
 
 		memset(&qrd, 0, sizeof(qrd));
 
@@ -2212,12 +2316,42 @@ static int criu_restore_queues(struct kfd_process *p,
 			ret = -EFAULT;
 			return ret;
 		}
+
+		q_data_size = q_bucket.cu_mask_size;
+
+		/* Increase local buffer space if needed */
+		if (q_data_size > data_ptr_size) {
+			if (data_ptr)
+				kfree(data_ptr);
+
+			data_ptr = (uint8_t*)kzalloc(q_data_size, GFP_KERNEL);
+			if (!data_ptr) {
+				ret = -ENOMEM;
+				break;
+			}
+			data_ptr_size = q_data_size;
+		}
+
+		ret = copy_from_user(data_ptr,
+				(void __user *) queues_data + q_bucket.queues_data_offset,
+				q_data_size);
+		if (ret) {
+			ret = -EFAULT;
+			break;
+		}
+
+		qrd.cu_mask_size = q_bucket.cu_mask_size;
+		qrd.cu_mask = data_ptr;
+
 		ret = criu_restore_queue(p, dev, pdd, &q_bucket, &qrd);
 		if (ret) {
 			pr_err("Failed to restore queue (%d)\n", ret);
 			break;
 		}
 	}
+
+	if (data_ptr)
+		kfree(data_ptr);
 	return ret;
 }
 
@@ -2507,6 +2641,7 @@ static int kfd_ioctl_criu_helper(struct file *filep,
 				struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_criu_helper_args *args = data;
+	u32 queues_data_size = 0;
 	struct kgd_mem *kgd_mem;
 	struct queue *q;
 	u64 num_of_bos = 0;
@@ -2544,6 +2679,12 @@ static int kfd_ioctl_criu_helper(struct file *filep,
 				q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 				q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
 
+				u32 cu_mask_size = 0;
+				ret = get_queue_data_sizes(pdd, q, &cu_mask_size);
+				if (ret)
+					goto err_unlock;
+
+				queues_data_size += cu_mask_size;
 				q_index++;
 			} else {
 				pr_err("Unsupported queue type (%d)\n", q->properties.type);
@@ -2558,6 +2699,7 @@ static int kfd_ioctl_criu_helper(struct file *filep,
 	args->num_of_devices = p->n_pdds;
 	args->num_of_bos = num_of_bos;
 	args->num_of_queues = q_index;
+	args->queues_data_size = queues_data_size;
 	dev_dbg(kfd_device, "Num of bos = %llu\n", num_of_bos);
 
 err_unlock:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index a4a0713ca9a3..55180a6fe102 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -473,6 +473,9 @@ struct queue_restore_data {
 	uint32_t qid;
 	uint32_t sdma_id;
 	uint32_t doorbell_id;
+
+	void *cu_mask;
+	uint32_t cu_mask_size;
 };
 
 struct queue_properties {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
