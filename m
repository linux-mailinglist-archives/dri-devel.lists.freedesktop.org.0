Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12803704D8
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17806F636;
	Sat,  1 May 2021 01:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CB56F626;
 Sat,  1 May 2021 01:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OScA+pCxFt6zg/ly5sdjZhT2jpyv0gifPg9wcEX4hJnePlb8Jjtuls/JhC2rFhS8AlcBqCd25DkutQBzV1QbE8G589CooyhK63DUFG49TfM+KNGCllL9KYbmP/scypFTibNOSGD6pwMW+ZI/2x4ep+VhbiUJHairmKWSiLlyBXurkdDkUJD+E9cL7/hCdK+6txVdntUlOKW4lxAKuMZS7C3iScySmeB24+3EJ9RJkuQOGOwVt7QM13yoZ3/J25MctGZSYrbzRHdn021oUuovQNiMhWbQcYs5V8P1ZfOhzquIhozf89XHUkvH7EOct2TQj+5CMPYyE6Ywxufi+cogEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8no+FGVa0f9KK6HgvK0PnemaMs9dnFnrsvq694xj+8=;
 b=iUC0ov0tni4wRTtDWHh58MPCo53rvOacTMg9RcnQERO59Es0fl2LDn6PhR2omfhkNtpf3cZlUWdPdml3yUYz1loZtpvlKCTEgv4IVCwhwwMgYmOgPkTkZmIAVtqyzei7z+WalK5OWL5bzHzXa5UZAq8SEtS6mAL6nUs3UYhpSOC3lu85Dt4LV0J3y8Y9pEQkN5mZ1lQAftYjLFoxlI6KckECvTcYVix0NmK7viVxgZFI7U/xW398gProxUNLtH+TiyvNu/xiDpAb5w7R6N+hHHSKxBFr2COcYJSdAT4lice0hHF+LGca0bfNPCjdSzA7c8wRpImJXATyYVu69IrqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8no+FGVa0f9KK6HgvK0PnemaMs9dnFnrsvq694xj+8=;
 b=nV5bff24T2/pZiRSzzuzqBqWOmaSu0pNLwN8N9yIJgaJBz80njtAqVPx8NAJ/cfDLSsH2LlgLeeenMyZQkc8zD36II0mlFKDitNE9eKSN6RGMNp8RBUzeFnjqKCRusvhTVLvDhJP58hdRq06G1glFTgqqIA6PLzKCenBre1RFSc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Sat, 1 May
 2021 01:58:26 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:26 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 09/17] drm/amdkfd: CRIU restore queue ids
Date: Fri, 30 Apr 2021 21:57:44 -0400
Message-Id: <20210501015752.888-10-Felix.Kuehling@amd.com>
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
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed68cd14-cd48-48fd-7288-08d90c449bec
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB48986C86CDE331863EE49879925D9@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDjpB+Gt43mMa7yI9OH9XuTkgaXyxUZPpPFqA+/B5JnvoEmr9OdvGt4coMWeot49+EdtA40ZG2qJ1gqGWhEu0/UR6boMB5uieotxIcsy8BJrmMkrWOYClVfkh8cOYzkaXRH1a07OezZG9t0EPH1k9fkdnr+4eGsmXmJrVcxqZaLWu0xj2uooU51ohO5ebqWr7/+Zs28/SXuKX5UkvGm47LTUwg+IOi0RZrS37B181MsCqjGOwQJs6xUjNKwxCzCK2aTSQFC17th3w6lHXyAv5QlUAnvXdyyx7MBkYepV2gR25jfwYxIt9wSP2K+4XMO3r/P9UJXUQ/utRGHUfJKDp6arbqWaIjm2OvsXDmmeusMcPSFd53e6kbtnUWVS+KviGjmpLwJkx5smJzwdcwTvSLLhv8K0oD9J4shWyjuQ6liqVBOEDyq28w62JlGBN5b/Ri/WbME8IMBevG2QSNCfUiq5HtvEgNsYmiwgf8c10mWJjj9AcGgUJR5lXPlsRZJS2HoJ3aETOMvpclCUb22hhP00vGc6yE5Pf50vY3ZFWiiRT3DPmliLiJwsch++goaAb8bTUIpZXKqTI0OwMCUvpgVsGFCU2fQViMmSVf2V4VmfCagkimP21q1J4+04VPmSpUaLtfpGeC6pwjk9XwFb3oMNn3E1YQN1fHhNePcSOjIe1pKCwIjhnKEfW2E+Y2Ab
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(36756003)(66556008)(66476007)(66946007)(6512007)(86362001)(8936002)(52116002)(478600001)(5660300002)(8676002)(6506007)(6666004)(38350700002)(38100700002)(2616005)(450100002)(4326008)(83380400001)(54906003)(1076003)(2906002)(26005)(16526019)(6486002)(956004)(316002)(186003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s9ciD7VFqEw+TRQsxILNj+ojYQzOaxXh9tQmrqjL2LxQHJOFI1gcfD2BSlbE?=
 =?us-ascii?Q?egse9sapOwLRn+V7e8Djlw4V7kf9kGi1UJ1Gi3IHTOobWU0k90dVjuJfV12I?=
 =?us-ascii?Q?7l2axaMIaZr84aJ84WeqdnmuL2BQadJ6rz71tGNg8wSYokueEbdI4EjWlIum?=
 =?us-ascii?Q?HV41afOCdAnEQiMYzX71DqkZ4s/BWa6zPT3FwZdleB3GNq2wHK5DgTiwORfn?=
 =?us-ascii?Q?q3KQLH9BE1aWkuiDRqtwRHx2mh8f/b5GivJlRjrJg0NU7bKKt2HBWmXf7Tfr?=
 =?us-ascii?Q?TNkZ095gMFihf+FEBHkc+7TtUXx54Q52qR6/NXH/w2F9XhQQFWK+crqMnyUg?=
 =?us-ascii?Q?a6cKg8+1M0gv9J0miumlwPZEMRi0kqEKKlYTYPXvKbzHjdxmeJ8G9SlE0Evh?=
 =?us-ascii?Q?eo5QbjqKx0fireDDNXaOxP0LO6AK7+3Gg6E8LwDt+3DOXSDzCCcwWBplwHnJ?=
 =?us-ascii?Q?9vRFm0XHV2Drlaz+29zjb1LD8FxUFzppAg7PvbVCMLd+/cHqZHmHhhQ6XkkB?=
 =?us-ascii?Q?C6b5Ol8sGXfaeRiSMmRyLl8zwfW9WALf+7A9zn9jsvwAqWaNWXUzpdxSVOPA?=
 =?us-ascii?Q?TZWzBJMHGx6xnHbLj4LdqopK9OQqYIcvEkZ5EaVWxMxw6JEjffylbxBu9TOG?=
 =?us-ascii?Q?cC2ge8x+uaHYL5ygPzQTSRUpbaZdGpyDAiAImjRA8CvxO7v8O48FTvzV3GQ8?=
 =?us-ascii?Q?dAK/ZjV/6STSjmtuMV3uOnGBmqSCiVwq6ai0rIV2SFyZ7LbUfstDXMyWJgxT?=
 =?us-ascii?Q?ShJ6HgAVbu/YhJmoW37UQK0dnlKEIIBYgD37zKEwM4UHne2S4XaZUd3NQt1g?=
 =?us-ascii?Q?dbpXlOk619N1dSiPUoBspdKcDOOBlUaSaJ43wk6QyEJCLOypK67/pZBYZnMY?=
 =?us-ascii?Q?T+Gt/XewlVWsA1QyJ8qeG2gcVccPn5V4ZheCL8/a0SIB0wOdm2CHbmL4zpbB?=
 =?us-ascii?Q?t2208BtxqAxu3GDngQP51Z9CYjcT7pbhevARSVzjySdaQ2YQZqKtqjWjiB/4?=
 =?us-ascii?Q?6eKmYmdF1c0WXSVUXmW0UmXkMaMh5p41OGBcJo4fq3kmdrfb16wGstGMqw7Z?=
 =?us-ascii?Q?gFYadoeBaP8he+tBd7ndI1LHx/Vwl2fyzQUpc8Zvg9yYrEfiWOWxPxQRaPhb?=
 =?us-ascii?Q?a1v/CFu8hhVu8zmsX4jnrh6M1Q/gIQd2F3E53cfzQcpHDmQzt1YHBbYqgEmv?=
 =?us-ascii?Q?QVOZLtbn7Qp/K5SyIKRrW5rYI5ZNVUuyMAAvqmyIf5TxpQ0NneaZKGUMA986?=
 =?us-ascii?Q?I3ENW4wkIeDzWsKWoHFQxN++hJx6zjJWMt7ZzxGDMj2dDxi4JuCjU2Ck+yf+?=
 =?us-ascii?Q?9v8Acav+Ny1TNRuljq40sDpS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed68cd14-cd48-48fd-7288-08d90c449bec
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:26.5279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psTwanD4cCXdJvrJ37KYBjCjX+nklVwSB2rLEjQKVDJmD5BpF2sMuN0Fl8YOzyrhIpI7/sb4iqKaHgpXbhwJ0w==
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
Cc: David Yat Sin <david.yatsin@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

When re-creating queues during CRIU restore, restore the queue with the
same queue id value used during CRIU dump. Adding a new private
structure queue_restore_data to store queue restore information.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Change-Id: I6959da5d3aeebe5be6623483883ef79676591134
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 18 ++++++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  6 +++++
 .../amd/amdkfd/kfd_process_queue_manager.c    | 22 ++++++++++++++++++-
 4 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a9a04148e94c..a21d32ff0730 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -313,7 +313,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 			dev->id);
 
 	err = pqm_create_queue(&p->pqm, dev, filep, &q_properties, &queue_id,
-			&doorbell_offset_in_process);
+			NULL, &doorbell_offset_in_process);
 	if (err != 0)
 		goto err_create_queue;
 
@@ -1905,7 +1905,7 @@ static void criu_dump_queue(struct kfd_process_device *pdd,
 	q_bucket->read_ptr_addr = (uint64_t)q->properties.read_ptr;
 	q_bucket->write_ptr_addr = (uint64_t)q->properties.write_ptr;
 	q_bucket->doorbell_id = q->doorbell_id;
-	q_bucket->doorbell_off = q->properties.doorbell_off;
+
 	q_bucket->sdma_id = q->sdma_id;
 
 	q_bucket->eop_ring_buffer_address =
@@ -2122,7 +2122,8 @@ static void set_queue_properties_from_criu(struct queue_properties *qp,
 int criu_restore_queue(struct kfd_process *p,
 					struct kfd_dev *dev,
 					struct kfd_process_device *pdd,
-					struct kfd_criu_q_bucket *q_bucket)
+					struct kfd_criu_q_bucket *q_bucket,
+					struct queue_restore_data *qrd)
 {
 	int ret = 0;
 	unsigned int queue_id;
@@ -2150,11 +2151,14 @@ int criu_restore_queue(struct kfd_process *p,
 	set_queue_properties_from_criu(&qp, q_bucket);
 	print_queue_properties(&qp);
 
-	ret = pqm_create_queue(&p->pqm, dev, NULL, &qp, &queue_id, NULL);
+	qrd->qid = q_bucket->q_id;
+
+	ret = pqm_create_queue(&p->pqm, dev, NULL, &qp, &queue_id, qrd, NULL);
 	if (ret) {
 		pr_err("Failed to create new queue err:%d\n", ret);
 		return -EINVAL;
 	}
+
 	pr_debug("Queue id %d was restored successfully\n", queue_id);
 
 	return 0;
@@ -2178,6 +2182,10 @@ static int criu_restore_queues(struct kfd_process *p,
 
 	for (i = 0; i < args->num_of_queues; i++) {
 		struct kfd_criu_q_bucket q_bucket;
+		struct queue_restore_data qrd;
+
+		memset(&qrd, 0, sizeof(qrd));
+
 		ret = copy_from_user(&q_bucket, (void __user *)&user_buckets[i],
 				sizeof(struct kfd_criu_q_bucket));
 
@@ -2202,7 +2210,7 @@ static int criu_restore_queues(struct kfd_process *p,
 			ret = -EFAULT;
 			return ret;
 		}
-		ret = criu_restore_queue(p, dev, pdd, &q_bucket);
+		ret = criu_restore_queue(p, dev, pdd, &q_bucket, &qrd);
 		if (ret) {
 			pr_err("Failed to restore queue (%d)\n", ret);
 			break;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
index 159add0f5aaa..749a7a3bf191 100644
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
index 8278c43f4e50..d21b7eb08a76 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -468,6 +468,11 @@ enum KFD_QUEUE_PRIORITY {
  * it's user mode or kernel mode queue.
  *
  */
+
+struct queue_restore_data {
+	uint32_t qid;
+};
+
 struct queue_properties {
 	enum kfd_queue_type type;
 	enum kfd_queue_format format;
@@ -1055,6 +1060,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			    struct file *f,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
+			    const struct queue_restore_data *qrd,
 			    uint32_t *p_doorbell_offset_in_process);
 int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid);
 int pqm_update_queue(struct process_queue_manager *pqm, unsigned int qid,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 95a6c36cea4c..cb136e13baff 100644
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
+			    const struct queue_restore_data *qrd,
 			    uint32_t *p_doorbell_offset_in_process)
 {
 	int retval;
@@ -224,7 +239,12 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 	if (pdd->qpd.queue_count >= max_queues)
 		return -ENOSPC;
 
-	retval = find_available_queue_slot(pqm, qid);
+	if (qrd) {
+		retval = assign_queue_slot_by_qid(pqm, qrd->qid);
+		*qid = qrd->qid;
+	} else
+		retval = find_available_queue_slot(pqm, qid);
+
 	if (retval != 0)
 		return retval;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
