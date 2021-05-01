Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2809F3704D5
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439DD6F626;
	Sat,  1 May 2021 01:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4372D6F633;
 Sat,  1 May 2021 01:58:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lII7mjbV48xnscr4Qghgo9KhYu+np2/f0+ePB4/lJwXQUpLbDEwkrVSGWNHcqLIJ3rxDj/lOIOVlckwe16QMJ0Xi7pWpmfeL3pnZ325i6hH/BXN9qrxXEHs09YnBS6CO2Kp9YKUV4TZdaVtdXHst1W4jp/LVxpl6DHILdNgznzbIGoRRSodnFbnAJ88oXuji5+aPFDkSHsmRGTTNPe+Dnb0OU5YV2hr4oGAfLPXAradzGu+JhAousxJE8068PLLHg0k7Yx39hlj/RqWtnEhhx567xuyLulTZohny1IBjtYtrTCQjjWhrrETCWWyfRByDboSvuhGz59YxNNVPq+7Y9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXUcnLOcggcN2WkbgiH6Iw1F6xdRywFWKJtwxKN2tCc=;
 b=ld1eRDl0ZSkhH45loP3InwHK0KGGipjQsBMcmcGLr+JaWHL2yDVIyTFi2DqNwSMutErRjm7K5TAgdmdIBWjuQANeHEjEjk763Xu9eGwjOnDrG8N1qmxQJp9BMJxRblU7JW8l88pNPk05fUprU7fylQHrLUsO41cj43mkpDHBFrwZbzPP0AdrMtxT3eyJo6K+Fy3w90OJwz5X37/vA/JaBsWh5rJCN8rMGH90j5uDm7DGlT2Qoll2MlK908pqzJiMzUsBA01iChIFCPPJbs2FZSIDKN4LG6K7i0omQCRSBzs3e5fuJNSVtjaB1aS9o8+IAaRAdk3zlOCPjTp0YXXsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXUcnLOcggcN2WkbgiH6Iw1F6xdRywFWKJtwxKN2tCc=;
 b=WY9cVWifBkenqt//vkj7G2TKyvNCC1FYEuai9LQ7tKnxmcZy/F9KA2mmALUYqF3D8bCCMV91sNeCp/YUmumRjFYMKUlcTbFLNx9Q3zQuKtuODLAoSwRynqJ3fYPgOPvNpDWFpOWrSa1wVf4vAFRjQR8LvE5TiVqzhl4BGlIYyqw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:58:25 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:25 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 08/17] drm/amdkfd: CRIU add queues support
Date: Fri, 30 Apr 2021 21:57:43 -0400
Message-Id: <20210501015752.888-9-Felix.Kuehling@amd.com>
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
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fba8fd5-221a-447b-a813-08d90c449b4f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB414281EB56AD57DCD229A837925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2MoId0dONm8LrcjdAXRQo1tYCtrGR8Lyu+rXAyLnn94Ms6IUq9IsWEO1Oq/Dwe+E2raeAjQjp6lnxV+hRby8GJUTgZDcWOQyuuREI5NGzcyqIJ7Xk5ugWpKIGdLEjSVWWwT5SKTx1WIZglB54A0jVardS/Uj/5oKrus1rGytrMoihK9bk2jSJKKn63StWcpYFVJQLMvVpgiqLUpyADmPkbqKkl5JNWzk2eDoWn2xYpTn12F+oGPzzyKMpNN0Hph0b3Y8QYaQjCOwKnepoogoiLjH+OZBDJp/N8tn5kOrxsZ4IsBC66qxS8oweewbSHCBuskHubipCUR98MCVVmy+/QHhcFjmp6UAA8/N1eXj1FBjEwPW1nCLLUnZdHbTL6ApRrhIzmBirCFupxPotlxvNugfG+4YlEYbscNz1YMhe9H6brc/o2EbdeAqXqrM8naBqOLQ5wGkGn6revjmSGoXpq6R15vOk/C3ZUlQUNDQyH1F3q+DBnE+EX/tAvEVaMVt3eKFQXy8Fp0SxzEGBfNZGpbsi0zuVYg8kboldZhzZrWceg4y+2L0IoRnzFxvW/FpSzrafnqn0Ci2iQlH+1agMoFv2RlmwecbTFvKV21oOdixKz/oSMQ4+VXNiOjKg+33JVdMf94SoLxlequBKjKJUuXp5Vvri4LueC/emEOkb+3xCrn/Dld0DdcnL6PcQOxK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(6506007)(2616005)(66946007)(66476007)(52116002)(956004)(38100700002)(6512007)(450100002)(4326008)(8676002)(8936002)(478600001)(2906002)(6486002)(86362001)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(36756003)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DNT871V87sPPKi9CSPsIwg+045dy1ZiTNXY4w3XjcIs/NChRuq+Pon0Ems/d?=
 =?us-ascii?Q?Dyv/65pPnuSHo1+c308lZlhW0KsVwENXLDXDkrRzoVPsO6LfFYaKyCK/PkIO?=
 =?us-ascii?Q?XOemQ1YdT7fy+Uyb0BIy5J8wakkm56aI1ZTOWxZ0zudRZF6FrsOT3u3lvE3e?=
 =?us-ascii?Q?BVALXBNG5oDJ/c413Ai5KiZiExGfWPRslrt5NOWbkRf/woFnfomCjTf2jMTC?=
 =?us-ascii?Q?OqNxHB2Z1yIzAUz7nKBYlCe1Im6wX3ngMYlniXfM3RVsTyJnkijgVwWYGLV0?=
 =?us-ascii?Q?FHgKBLgDxWOnro82nUUAr2FNsJLwwg16SxaPHOpNmM2iqythS5alnE8c+vFf?=
 =?us-ascii?Q?5XQ325I5ifMgQdJX7g2J/K2iVdxYImYLiEbifB04tfXMSEt9CnaIpQDXYLKO?=
 =?us-ascii?Q?jNpzYO2ZVojTw+fzEO8Z+GqlZii00AfF3XkSRwhO/+pS+xOr6Mpc9S98CSLu?=
 =?us-ascii?Q?ILcMv1TPETWpYHStYpxWx703EtOSCzSUhrLQYJHDc4URYLlhfEkC9baWjNvR?=
 =?us-ascii?Q?8yYL+cWTToJRhOznsYEmLTrl+Vn7rIVTJmGf0Ewv4ikwODqSMFhcjAaC2Kvn?=
 =?us-ascii?Q?6qYPhnX1Dhpn0tWN+YXAtjxLmVyb3Cxntfe1T+qTuJJdP4RRzrEMXJrALpDL?=
 =?us-ascii?Q?5x/jRML+9l1/KRIf1crAlVZmle12diym8nzW3l9FgO6PTl0UE2xEA0q08Bvq?=
 =?us-ascii?Q?Au8jB1DOTb1jhy6Somt0gjrEEu+XQcafO2FQaOGZs/hKll2MvfQ57BbXJxvL?=
 =?us-ascii?Q?5hmD8qtuNcWm+SDpLBwf+4RINe0oZ5BgM8oy5NkMPUO3azSFcCbOOmsX23T/?=
 =?us-ascii?Q?r4VRXgZ0jSTw5WKPwhgaXKbZIIBqfIswUlRAvWGEaKlZTWz3mJxkOU7sTG+B?=
 =?us-ascii?Q?WRjJFXrAE44lmBsH8I6pvn/abUKd7M0+NqI+g9JxcRj9fanyAJ/3tRIF9fs8?=
 =?us-ascii?Q?dTlPLfRb0ziaVfOTjjdBhBzKQ/8punG+iIBk7uEHFjkdlY6bNBUz3aKbCRl7?=
 =?us-ascii?Q?W7UwBPBZTb7qJBGBYGhU4Xvpycwe/K1DrJO/5Mm6zNSrwecFtNSIAjEaCyBW?=
 =?us-ascii?Q?nyl6LGEn7d7rXI7RN/hbS14OeIgLruiaF0nyktRqAekT3CJ1m92R8svVdTkO?=
 =?us-ascii?Q?RPT771dDvqBUVWTMQCsM9sAR13/SbcEDTucLduADH+ABQ66QKXw27AzqBKIM?=
 =?us-ascii?Q?buZxWRKNdZrp0//KNFs1EV7UVx57/zi8lT6xWwnNOK4cxRBsnQLMxyMTRoph?=
 =?us-ascii?Q?iwhvwS4hl6Chfwe0Y1iTeTUT1XGK9qSSr+nLc1MIAB9QvULmI+7BvIMEFRGZ?=
 =?us-ascii?Q?+hcSWB9gPm7VfjSF5Yy1ImNA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fba8fd5-221a-447b-a813-08d90c449b4f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:25.5481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIQCzruqZTr+6crLTr2lPMHRzWVBJbz67Dc0KV7zxyBdC3OwrhIXQN+7Nh6p+g6zdUKD9kSckdOVaujJy/z/nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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

Add support to existing CRIU ioctl's to save number of queues and queue
properties for each queue during checkpoint and re-create queues on restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Change-Id: Ifcd5e8359f492eef015867f354f44146dd1b6848
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 234 ++++++++++++++++++++++-
 1 file changed, 231 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 788baee2a025..a9a04148e94c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1840,7 +1840,6 @@ static int kfd_devinfo_restore(struct kfd_process *p, struct kfd_criu_devinfo_bu
 			       uint32_t num_of_devices)
 {
 	int i;
-
 	if (p->n_pdds != num_of_devices)
 		return -EINVAL;
 
@@ -1891,6 +1890,77 @@ static int kfd_devinfo_restore(struct kfd_process *p, struct kfd_criu_devinfo_bu
 	}
 	return 0;
 }
+static void criu_dump_queue(struct kfd_process_device *pdd,
+                           struct queue *q,
+                           struct kfd_criu_q_bucket *q_bucket)
+{
+	q_bucket->gpu_id = pdd->dev->id;
+	q_bucket->type = q->properties.type;
+	q_bucket->format = q->properties.format;
+	q_bucket->q_id =  q->properties.queue_id;
+	q_bucket->q_address = q->properties.queue_address;
+	q_bucket->q_size = q->properties.queue_size;
+	q_bucket->priority = q->properties.priority;
+	q_bucket->q_percent = q->properties.queue_percent;
+	q_bucket->read_ptr_addr = (uint64_t)q->properties.read_ptr;
+	q_bucket->write_ptr_addr = (uint64_t)q->properties.write_ptr;
+	q_bucket->doorbell_id = q->doorbell_id;
+	q_bucket->doorbell_off = q->properties.doorbell_off;
+	q_bucket->sdma_id = q->sdma_id;
+
+	q_bucket->eop_ring_buffer_address =
+		q->properties.eop_ring_buffer_address;
+
+	q_bucket->eop_ring_buffer_size = q->properties.eop_ring_buffer_size;
+
+	q_bucket->ctx_save_restore_area_address =
+		q->properties.ctx_save_restore_area_address;
+
+	q_bucket->ctx_save_restore_area_size =
+		q->properties.ctx_save_restore_area_size;
+
+	q_bucket->ctl_stack_size = q->properties.ctl_stack_size;
+}
+
+static int criu_dump_queues_device(struct kfd_process_device *pdd,
+				unsigned *q_index,
+				unsigned int max_num_queues,
+				struct kfd_criu_q_bucket *user_buckets)
+{
+	struct queue *q;
+	struct kfd_criu_q_bucket q_bucket;
+	int ret = 0;
+
+	list_for_each_entry(q, &pdd->qpd.queues_list, list) {
+		if (q->properties.type != KFD_QUEUE_TYPE_COMPUTE &&
+			q->properties.type != KFD_QUEUE_TYPE_SDMA &&
+			q->properties.type != KFD_QUEUE_TYPE_SDMA_XGMI) {
+
+			pr_err("Unsupported queue type (%d)\n", q->properties.type);
+			return -ENOTSUPP;
+		}
+
+		if (*q_index >= max_num_queues) {
+			pr_err("Number of queues(%d) exceed allocated(%d)\n",
+				*q_index, max_num_queues);
+
+			ret = -ENOMEM;
+			break;
+		}
+
+		memset(&q_bucket, 0, sizeof(q_bucket));
+		criu_dump_queue(pdd, q, &q_bucket);
+		ret = copy_to_user((void __user *)&user_buckets[*q_index],
+					&q_bucket, sizeof(q_bucket));
+		if (ret) {
+			pr_err("Failed to copy queue information to user\n");
+			ret = -EFAULT;
+			break;
+		}
+		*q_index = *q_index + 1;
+	}
+	return ret;
+}
 
 static int kfd_ioctl_criu_dumper(struct file *filep,
 				struct kfd_process *p, void *data)
@@ -1900,8 +1970,13 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 	struct amdgpu_bo *dumper_bo;
 	int ret, id, index, i = 0;
 	struct kgd_mem *kgd_mem;
+	int q_index = 0;
 	void *mem;
 
+	struct kfd_criu_q_bucket *user_buckets =
+		(struct kfd_criu_q_bucket*) args->kfd_criu_q_buckets_ptr;
+
+
 	pr_info("Inside %s\n",__func__);
 
 	if (args->num_of_bos == 0) {
@@ -1922,6 +1997,8 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 	if (!bo_bucket)
 		return -ENOMEM;
 
+	pr_debug("num of queues = %u\n", args->num_of_queues);
+
 	mutex_lock(&p->mutex);
 
 	if (!kfd_has_process_device_data(p)) {
@@ -1930,9 +2007,17 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 		goto err_unlock;
 	}
 
+	ret = kfd_process_evict_queues(p);
+	if (ret) {
+		pr_err("Failed to evict queues\n");
+		goto err_unlock;
+	}
+
 	ret = kfd_devinfo_dump(p, args);
-	if (ret)
+	if (ret) {
+		pr_err("Failed to dump devices\n");
 		goto err_unlock;
+	}
 
 	/* Run over all PDDs of the process */
 	for (index = 0; index < p->n_pdds; index++) {
@@ -1989,6 +2074,11 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 				i++;
 			}
 		}
+
+		ret = criu_dump_queues_device(pdd, &q_index,
+					args->num_of_queues, user_buckets);
+		if (ret)
+			goto err_unlock;
 	}
 
 	ret = copy_to_user((void __user *)args->kfd_criu_bo_buckets_ptr,
@@ -1996,15 +2086,131 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 			(args->num_of_bos *
 			 sizeof(struct kfd_criu_bo_buckets)));
 	kvfree(bo_bucket);
+
+	kfd_process_restore_queues(p);
 	mutex_unlock(&p->mutex);
-	return ret ? -EFAULT : 0;
+	return 0;
 
 err_unlock:
+	kfd_process_restore_queues(p);
 	mutex_unlock(&p->mutex);
 	pr_err("Dumper ioctl failed err:%d\n", ret);
 	return ret;
 }
 
+static void set_queue_properties_from_criu(struct queue_properties *qp,
+                                       struct kfd_criu_q_bucket *q_bucket)
+{
+	qp->is_interop = false;
+	qp->is_gws = q_bucket->is_gws;
+	qp->queue_percent = q_bucket->q_percent;
+	qp->priority = q_bucket->priority;
+	qp->queue_address = q_bucket->q_address;
+	qp->queue_size = q_bucket->q_size;
+	qp->read_ptr = (uint32_t *) q_bucket->read_ptr_addr;
+	qp->write_ptr = (uint32_t *) q_bucket->write_ptr_addr;
+	qp->eop_ring_buffer_address = q_bucket->eop_ring_buffer_address;
+	qp->eop_ring_buffer_size = q_bucket->eop_ring_buffer_size;
+	qp->ctx_save_restore_area_address = q_bucket->ctx_save_restore_area_address;
+	qp->ctx_save_restore_area_size = q_bucket->ctx_save_restore_area_size;
+	qp->ctl_stack_size = q_bucket->ctl_stack_size;
+	qp->type = q_bucket->type;
+	qp->format = q_bucket->format;
+}
+
+/* criu_restore_queue runs with the process mutex locked */
+int criu_restore_queue(struct kfd_process *p,
+					struct kfd_dev *dev,
+					struct kfd_process_device *pdd,
+					struct kfd_criu_q_bucket *q_bucket)
+{
+	int ret = 0;
+	unsigned int queue_id;
+	struct queue_properties qp;
+
+	pr_debug("Restoring Queue: gpu_id:%x type:%x format:%x queue_id:%u "
+			"address:%llx size:%llx priority:%u percent:%u "
+			"read_ptr:%llx write_ptr:%llx doorbell_id:%x "
+			"doorbell_off:%llx queue_address:%llx\n",
+			q_bucket->gpu_id,
+			q_bucket->type,
+			q_bucket->format,
+			q_bucket->q_id,
+			q_bucket->q_address,
+			q_bucket->q_size,
+			q_bucket->priority,
+			q_bucket->q_percent,
+			q_bucket->read_ptr_addr,
+			q_bucket->write_ptr_addr,
+			q_bucket->doorbell_id,
+			q_bucket->doorbell_off,
+			q_bucket->q_address);
+
+	memset(&qp, 0, sizeof(qp));
+	set_queue_properties_from_criu(&qp, q_bucket);
+	print_queue_properties(&qp);
+
+	ret = pqm_create_queue(&p->pqm, dev, NULL, &qp, &queue_id, NULL);
+	if (ret) {
+		pr_err("Failed to create new queue err:%d\n", ret);
+		return -EINVAL;
+	}
+	pr_debug("Queue id %d was restored successfully\n", queue_id);
+
+	return 0;
+}
+
+/* criu_restore_queues runs with the process mutex locked */
+static int criu_restore_queues(struct kfd_process *p,
+			struct kfd_ioctl_criu_restorer_args *args)
+{
+	struct kfd_process_device *pdd;
+	struct kfd_dev *dev;
+	int i;
+	int ret;
+	struct kfd_criu_q_bucket *user_buckets =
+		(struct kfd_criu_q_bucket*) args->kfd_criu_q_buckets_ptr;
+	/*
+         * This process will not have any queues at this point, but we are
+         * setting all the dqm's for this process to evicted state.
+         */
+        kfd_process_evict_queues(p);
+
+	for (i = 0; i < args->num_of_queues; i++) {
+		struct kfd_criu_q_bucket q_bucket;
+		ret = copy_from_user(&q_bucket, (void __user *)&user_buckets[i],
+				sizeof(struct kfd_criu_q_bucket));
+
+		if (ret) {
+			ret = -EFAULT;
+			pr_err("Failed to access");
+			return ret;
+		}
+
+		dev = kfd_device_by_id(q_bucket.gpu_id);
+		if (!dev) {
+			pr_err("Could not get kfd_dev from gpu_id = 0x%x\n",
+			q_bucket.gpu_id);
+
+			ret = -EINVAL;
+			return ret;
+		}
+
+		pdd = kfd_get_process_device_data(dev, p);
+		if (!pdd) {
+			pr_err("Failed to get pdd\n");
+			ret = -EFAULT;
+			return ret;
+		}
+		ret = criu_restore_queue(p, dev, pdd, &q_bucket);
+		if (ret) {
+			pr_err("Failed to restore queue (%d)\n", ret);
+			break;
+		}
+	}
+	return ret;
+}
+
 static int kfd_ioctl_criu_restorer(struct file *filep,
 				struct kfd_process *p, void *data)
 {
@@ -2229,6 +2435,12 @@ static int kfd_ioctl_criu_restorer(struct file *filep,
 		kfd_flush_tlb(peer_pdd);
 	}
 
+	ret = criu_restore_queues(p, args);
+	if (ret) {
+		err = ret;
+		goto err_unlock;
+	}
+
 	ret = copy_to_user((void __user *)args->restored_bo_array_ptr,
 			   restored_bo_offsets_arr,
 			   (args->num_of_bos * sizeof(*restored_bo_offsets_arr)));
@@ -2286,8 +2498,10 @@ static int kfd_ioctl_criu_helper(struct file *filep,
 {
 	struct kfd_ioctl_criu_helper_args *args = data;
 	struct kgd_mem *kgd_mem;
+	struct queue *q;
 	u64 num_of_bos = 0;
 	int id, i = 0;
+	u32 q_index = 0;
 	void *mem;
 	int ret = 0;
 
@@ -2314,12 +2528,26 @@ static int kfd_ioctl_criu_helper(struct file *filep,
 			if ((uint64_t)kgd_mem->va > pdd->gpuvm_base)
 				num_of_bos++;
 		}
+
+		list_for_each_entry(q, &pdd->qpd.queues_list, list) {
+			if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE ||
+				q->properties.type == KFD_QUEUE_TYPE_SDMA ||
+				q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
+
+				q_index++;
+			} else {
+				pr_err("Unsupported queue type (%d)\n", q->properties.type);
+				ret = -ENOTSUPP;
+				goto err_unlock;
+			}
+		}
 	}
 
 	args->task_pid = task_pid_nr_ns(p->lead_thread,
 					task_active_pid_ns(p->lead_thread));
 	args->num_of_devices = p->n_pdds;
 	args->num_of_bos = num_of_bos;
+	args->num_of_queues = q_index;
 	dev_dbg(kfd_device, "Num of bos = %llu\n", num_of_bos);
 
 err_unlock:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
