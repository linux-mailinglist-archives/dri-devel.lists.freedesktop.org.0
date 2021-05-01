Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FA43704E3
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786246F64E;
	Sat,  1 May 2021 01:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E556F639;
 Sat,  1 May 2021 01:58:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXogQJXS4tdEajfwOzusqx4XePmIpcOgRd4GyeuuPhJUuJuqVAYfGlt3dzwOpehfWQhgW6s61eNCrrzsQhgCz4a+xDQ4PQOR2kkB5It1Ltb3IXBZKAJH6i78Ld9T7RRR+dJP3Tsa6pqyqsMItA2Da0RZcKISCq4qctZ9WTzNU5Hnhe5OsNyG2mXkRQKW5ZieTw5Z7m9vZ0HzSjYy8/yv647onsghR91mw8rEzN2qs+afgUbzyOxFE2qIY3avDbbR2+m2ZOYMyHKSetT0kYJGGx2RxJLd71JoMQKhnJOySeKiO5wNIZKp8oF7uAHou1LGi7dMGL8Rd+3520D1bDzfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ysgf8kLhBax3YVgVuwLM5JSAhyMI4f5UwFggAcHvGFI=;
 b=a2r6toXkOzeJTpEqr8fuDBC9yeZaNbfxRlxxSF61UHfTcauHZAUQ8WNH0DtbjdFJ9gHG5cHMcxVv1YLcTQZwDGp0dc6oN+zqQLVSyuJ+0dIDcXHTysJUSCFUKLKxVJxkBJIstkERux6NDDy+T6Q9cdc3S7IPC2xmgaXfOHW7V+JJGzk1ZcJWOV1Y2EN1OnFPGQCqv3HjX7ENFwJS4eaKQkMZoZASUgBt6PcUxXx7EkqxPI/H4Q/tkm8MyW0dII4bumWlPpREVd8qJ5TxlcTaoxHkh2DlOnLxDT9rspxAb9JNxH+zz9TkVmlw/0GCEm1/0nO9J+2V+OD1WOBZWFowRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ysgf8kLhBax3YVgVuwLM5JSAhyMI4f5UwFggAcHvGFI=;
 b=rBX79yUm2QgHFmHB/hfFc1TZrrK4iyI9QAMDkgtmrX0ogPJ0wvSe/jErl123eDlOQIzsUj6fRtXIZF7/cAaQS5jRbb9qAc+36aJ3nt5H+K8S1elGwJ8iuDJoJOGnG0etqWDQ4iAGwrt6UnApjfKiEw2gYqBIjRMhU02LW/whi+I=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Sat, 1 May
 2021 01:58:32 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:32 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 14/17] drm/amdkfd: CRIU dump/restore queue control stack
Date: Fri, 30 Apr 2021 21:57:49 -0400
Message-Id: <20210501015752.888-15-Felix.Kuehling@amd.com>
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
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6608beed-4f25-45a3-5ea3-08d90c449f60
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4932D23A5A17AFBE5199FF2A925D9@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:144;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/qZ6ovz5dP+qf+xO9EYbW4kXaRbTSQEPYwP4LvfkmhgLVmjH7cwj+vFPAo6+z3gD5h+xHYpP1/BgW0sYLqJAnggzhhNgnUVIOlcgxQlJ6Gog4CW5wAVwsKQ5wf5AhEs5zzKH6qm9XHitZAvt/5VX1txz8x9vk+dsA3gogziW6Ezwb/NPvA3d/6C25ZoPXkFVXCv3e9A1m4HJWfPHuD3XJE8XvIlQulWsMRXXz9/fPxGfCpqdCLjuk45dnZkYRU4/NbxGzWv9UZoonTtKDbxkGCeboHT7Pe8ZmzbNYr9mQmeng1NvyHtqHHcbQbwHJSC0F3Lqb9XFu4EwJnLfkc/Mt4XLTpSqP0Ku2Da5z+CHZMsbA+nemG5gYo6wPrKEppO+zKodRHoJOEcPxqDAt/Iz6uKJLYZhAKMGR9Tt1p8NuzYOkbgXJnmWoi0NZdNig15y/f+ewxiTVJgvMcVv4VQEq7AVTsdScyICpGNbqnxU9IB4QIeFmUxLr2jK1nF/lftzhm4R7/7iwlr+XQiHxYipWYa8kI2r3jnvoNugYYtLULtR1CBYaaXCXsNe6UyeQq7xDrLWN64EtaLnSnc//W8hDuTL49oNC+pjlGRL2dESnr60CBhTx/l8HTz66tpoe0fsNUUdvGQlsailE/7Fmmvu7t6nB6IlpFXRko6lRVP46CcYJ7NV++yOX2j7uou7m6h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(6512007)(83380400001)(38350700002)(38100700002)(478600001)(26005)(16526019)(186003)(6486002)(86362001)(4326008)(316002)(54906003)(2616005)(956004)(450100002)(5660300002)(6666004)(66476007)(66556008)(52116002)(2906002)(6506007)(66946007)(8676002)(36756003)(8936002)(30864003)(1076003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iLuI5Cof0/bwqkAfrBv/sB5p9siulNcXPgex6DKOqd41YUDrDDiLwN3z4lE+?=
 =?us-ascii?Q?VN6IRUH+8z9zo74hslXbqPJ1YS6JTkYl73gOXXzuIfRP2b3Pq6cArqENmQsz?=
 =?us-ascii?Q?0DUKvcjqNAMyHU+eTfuB3lkTIVX+0Xq0h9nmY3AqAvNeGDgonJmCgWkEGvc2?=
 =?us-ascii?Q?Bax6INH9L/zn7m0Xk/AWdE2idKkIKEsdmx9wVofu7Om8ulrtHO/BjU6cbeUo?=
 =?us-ascii?Q?L3G/pfrATdhCDzXygYFnWWEIdixVsrACSpGmwlua+IiyL5qJVD8ZPryk5Drk?=
 =?us-ascii?Q?iQLIXjOHF6AyUrYF7XjTcpkh9Nt+Bzuj5WYz0GTOzJ7jAn022nwC7SUCkNOP?=
 =?us-ascii?Q?q0y3JCqsV9TvvzXfJOS6Y8quc0eJGcRihi0gwSFuMvlVNKC40aFWdbeTaDhs?=
 =?us-ascii?Q?YJ2prrODDpHQDHsDnr/qBCmiL+fLcI7vTIuHs7/cx4Y/doeZpLUxoqzkZiCR?=
 =?us-ascii?Q?0r5kpIPmVLrUGjJEAQRVIwqcnvewAnPZfGhZ/eYVL7g3DbXK2DuFlJHDpE1S?=
 =?us-ascii?Q?TE1Jk6NCGfZt66XXckgIG5OTePiM9BxzqG9qGu1rYIu3wQu5FspkJlKFpw3Q?=
 =?us-ascii?Q?U7cdDr96jR1JLR0Qozp9qxtt7MkDzErgScq6WLoat2P9M7f5X2vV44yymqwc?=
 =?us-ascii?Q?TwY9I0jPPSuQ54J1XefkHQqnNsWxdB+e/7997nwleBcKWti/G+ToYkqLo91c?=
 =?us-ascii?Q?6SNszuoqgw11t3ahQi192kc1TJQcELflVHXu+w4oGhp3fuQTRiXVTEP9F0wR?=
 =?us-ascii?Q?jfqf6nKhauRRvV0aDHgzCiqiqnZ9A3Ut21ZMhZnM2mKGyZIFKHW9DbSD8eTj?=
 =?us-ascii?Q?L//eEMoqHwlbLrOc+6/OUkzQbWI7ozRaVX3ukd+nP36qwufaZN8NjuEIo079?=
 =?us-ascii?Q?Mr/FvUAWeXaJx95R+QMiMO52mS0wLxwejwehOm31UIk+lPkhjgV4Sc3WoOQp?=
 =?us-ascii?Q?F2Z3j2rvYLGYV6sH9FrgYTB0g5KcCVR7BmGVKUs0fqdqe1t65gENpWb5tMWs?=
 =?us-ascii?Q?sbPhcvoa4lh2bME/K6BsFmhpDsp2wXJE5G3CShLCwVDOGgdNjUBhLSOE3hHp?=
 =?us-ascii?Q?tUzUxicXGyzXxaNCbqYutNEBNDNHAlU/QIA4b1sCeH3x+gxhdSckbgm3KaKi?=
 =?us-ascii?Q?DZncj+Cf8JhxEX8b3hDAK/BYmKx7VkohFBwSWxwA2t/skFmPBF29ASxxK2nA?=
 =?us-ascii?Q?xu7L9S7ayfTuRkjJjqAVQ2ooftb6wVCdRoe0PPFCT6p6mguldj5ZrcvgpFiN?=
 =?us-ascii?Q?vkZ/OnU38VVZS8aUVekeHBoCyrYCxzZweI6f4UZ3JnM18DmzvfElHaCTcNcW?=
 =?us-ascii?Q?L7UIFE7wJGYrlNkyTH60mfOs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6608beed-4f25-45a3-5ea3-08d90c449f60
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:32.2690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HZP4ey62sLIOqO40RsshGpaFQ4L785udOLVl3w2bFKHAdUN/HumyerMp+uhNDkK5MYVOWzE0YJXPelVLgJeug==
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
Cc: David Yat Sin <david.yatsin@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

Dump contents of queue control stacks on CRIU dump and restore them
during CRIU restore.

(rajneesh: rebased to 5.11 and fixed merge conflict)
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Change-Id: Ia1f38f3d4309e1f026981b16d26306672f3bf266
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 32 +++++++++++++++----
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 10 +++++-
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  4 +--
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |  3 ++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |  8 +++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  8 +++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   | 18 +++++++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  8 +++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  6 ++--
 .../amd/amdkfd/kfd_process_queue_manager.c    |  8 ++---
 10 files changed, 89 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index b7f3aa759c17..71f734eae071 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1894,13 +1894,15 @@ static int kfd_devinfo_restore(struct kfd_process *p, struct kfd_criu_devinfo_bu
 static int get_queue_data_sizes(struct kfd_process_device *pdd,
 				struct queue *q,
 				uint32_t *cu_mask_size,
-				uint32_t *mqd_size)
+				uint32_t *mqd_size,
+				uint32_t *ctl_stack_size)
 {
 	int ret = 0;
 
 	*cu_mask_size = sizeof(uint32_t) * (q->properties.cu_mask_count / 32);
 
-	ret = pqm_get_queue_dump_info(&pdd->process->pqm, q->properties.queue_id, mqd_size);
+	ret = pqm_get_queue_dump_info(&pdd->process->pqm,
+			q->properties.queue_id, mqd_size, ctl_stack_size);
 	if (ret) {
 		pr_err("Failed to get queue dump info (%d)\n", ret);
 		return ret;
@@ -1941,6 +1943,8 @@ static int criu_dump_queue(struct kfd_process_device *pdd,
 		q->properties.ctx_save_restore_area_size;
 
 	q_bucket->ctl_stack_size = q->properties.ctl_stack_size;
+
+	/* queue_data contains data in this order cu_mask, mqd, ctl_stack */
 	if (qrd->cu_mask_size)
 		memcpy(qrd->cu_mask, q->properties.cu_mask, qrd->cu_mask_size);
 
@@ -1952,6 +1956,7 @@ static int criu_dump_queue(struct kfd_process_device *pdd,
 
 	q_bucket->cu_mask_size = qrd->cu_mask_size;
 	q_bucket->mqd_size = qrd->mqd_size;
+	q_bucket->ctl_stack_size = qrd->ctl_stack_size;
 	return ret;
 }
 
@@ -1991,14 +1996,15 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 		memset(&q_bucket, 0, sizeof(q_bucket));
 		memset(&qrd, 0, sizeof(qrd));
 
-		ret = get_queue_data_sizes(pdd, q, &qrd.cu_mask_size, &qrd.mqd_size);
+		ret = get_queue_data_sizes(pdd, q, &qrd.cu_mask_size,
+				&qrd.mqd_size, &qrd.ctl_stack_size);
 		if (ret) {
 			pr_err("Failed to get queue dump info (%d)\n", ret);
 			ret = -EFAULT;
 			break;
 		}
 
-		q_data_size = qrd.cu_mask_size + qrd.mqd_size;
+		q_data_size = qrd.cu_mask_size + qrd.mqd_size + qrd.ctl_stack_size;
 
 		/* Increase local buffer space if needed */
 		if (data_ptr_size < q_data_size) {
@@ -2013,8 +2019,11 @@ static int criu_dump_queues_device(struct kfd_process_device *pdd,
 			data_ptr_size = q_data_size;
 		}
 
+		/* data stored in this order: cu_mask, mqd, mqd_ctl_stack */
 		qrd.cu_mask = data_ptr;
 		qrd.mqd = data_ptr + qrd.cu_mask_size;
+		qrd.mqd_ctl_stack = qrd.mqd + qrd.mqd_size;
+
 		ret = criu_dump_queue(pdd, q, &q_bucket, &qrd);
 		if (ret)
 			break;
@@ -2334,7 +2343,8 @@ static int criu_restore_queues(struct kfd_process *p,
 			return ret;
 		}
 
-		q_data_size = q_bucket.cu_mask_size + q_bucket.mqd_size;
+		q_data_size = q_bucket.cu_mask_size + q_bucket.mqd_size
+				+ q_bucket.ctl_stack_size;
 
 		/* Increase local buffer space if needed */
 		if (q_data_size > data_ptr_size) {
@@ -2363,6 +2373,9 @@ static int criu_restore_queues(struct kfd_process *p,
 		qrd.mqd_size = q_bucket.mqd_size;
 		qrd.mqd = data_ptr + qrd.cu_mask_size;
 
+		qrd.ctl_stack_size = q_bucket.ctl_stack_size;
+		qrd.mqd_ctl_stack = qrd.mqd + qrd.mqd_size;
+
 		ret = criu_restore_queue(p, dev, pdd, &q_bucket, &qrd);
 		if (ret) {
 			pr_err("Failed to restore queue (%d)\n", ret);
@@ -2701,11 +2714,16 @@ static int kfd_ioctl_criu_helper(struct file *filep,
 
 				u32 cu_mask_size = 0;
 				u32 mqd_size = 0;
-				ret = get_queue_data_sizes(pdd, q, &cu_mask_size, &mqd_size);
+				u32 ctl_stack_size = 0;
+
+				ret = get_queue_data_sizes(pdd, q,
+					&cu_mask_size, &mqd_size,
+					&ctl_stack_size);
 				if (ret)
 					goto err_unlock;
 
-				queues_data_size += cu_mask_size + mqd_size;
+				queues_data_size += cu_mask_size + mqd_size
+							+ ctl_stack_size;
 				q_index++;
 			} else {
 				pr_err("Unsupported queue type (%d)\n", q->properties.type);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index ee34229a41b0..04adc374b185 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1756,14 +1756,22 @@ static int get_wave_state(struct device_queue_manager *dqm,
 
 static void get_queue_dump_info(struct device_queue_manager *dqm,
 			const struct queue *q,
-			u32 *mqd_size)
+			u32 *mqd_size,
+			u32 *ctl_stack_size)
 {
 	struct mqd_manager *mqd_mgr;
 	enum KFD_MQD_TYPE mqd_type =
 			get_mqd_type_from_queue_type(q->properties.type);
 
+	dqm_lock(dqm);
 	mqd_mgr = dqm->mqd_mgrs[mqd_type];
 	*mqd_size = mqd_mgr->mqd_size;
+	*ctl_stack_size = 0;
+
+	if (q->properties.type == KFD_QUEUE_TYPE_COMPUTE && mqd_mgr->get_dump_info)
+		mqd_mgr->get_dump_info(mqd_mgr, q->mqd, ctl_stack_size);
+
+	dqm_unlock(dqm);
 }
 
 static int dump_mqd(struct device_queue_manager *dqm,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 27952e33a404..c04af287d5a0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -137,8 +137,8 @@ struct device_queue_manager_ops {
 				  u32 *save_area_used_size);
 
 	void	(*get_queue_dump_info)(struct device_queue_manager *dqm,
-				  const struct queue *q,
-				  u32 *mqd_size);
+				  const struct queue *q, u32 *mqd_size,
+				  u32 *ctl_stack_size);
 
 	int	(*dump_mqd)(struct device_queue_manager *dqm,
 				  const struct queue *q,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
index 82da00bc71aa..07cc34e5a31a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
@@ -98,6 +98,9 @@ struct mqd_manager {
 				  u32 *ctl_stack_used_size,
 				  u32 *save_area_used_size);
 
+	void	(*get_dump_info)(struct mqd_manager *mm, void *mqd,
+				uint32_t *ctl_stack_size);
+
 	void	(*dump_mqd)(struct mqd_manager *mm, void *mqd,
 				struct queue_restore_data *qrd);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index 3f59466a5104..98b2b3b9c740 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -275,6 +275,13 @@ static int destroy_mqd(struct mqd_manager *mm, void *mqd,
 					pipe_id, queue_id);
 }
 
+static void get_dump_info(struct mqd_manager *mm, void *mqd,
+			 u32 *ctl_stack_size)
+{
+	/* Control stack is stored in user mode */
+	*ctl_stack_size = 0;
+}
+
 static void dump_mqd(struct mqd_manager *mm, void *mqd,
                        struct queue_restore_data *qrd)
 {
@@ -450,6 +457,7 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->update_mqd = update_mqd;
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
+		mqd->get_dump_info = get_dump_info;
 		mqd->dump_mqd = dump_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct cik_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index 126c0dc63f10..c4c05a71352d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -283,6 +283,13 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
+static void get_dump_info(struct mqd_manager *mm, void *mqd,
+			 u32 *ctl_stack_size)
+{
+	/* Control stack is stored in user mode */
+	*ctl_stack_size = 0;
+}
+
 static void dump_mqd(struct mqd_manager *mm, void *mqd,
                        struct queue_restore_data *qrd)
 {
@@ -477,6 +484,7 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->is_occupied = is_occupied;
 		mqd->mqd_size = sizeof(struct v10_compute_mqd);
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_dump_info = get_dump_info;
 		mqd->dump_mqd = dump_mqd;
 		mqd->restore_mqd = restore_mqd;
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 8318192920e4..68cd108c2f9a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -338,13 +338,24 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
+static void get_dump_info(struct mqd_manager *mm, void *mqd, u32 *ctl_stack_size)
+{
+	struct v9_mqd *m = get_mqd(mqd);
+
+	*ctl_stack_size = m->cp_hqd_cntl_stack_size;
+}
+
 static void dump_mqd(struct mqd_manager *mm, void *mqd,
                        struct queue_restore_data *qrd)
 {
 	struct v9_mqd *m;
+	/* Control stack is located one page after MQD. */
+	void *mqd_ctl_stack = (void *)((uintptr_t)mqd + PAGE_SIZE);
+
 	m = get_mqd(mqd);
 
 	memcpy(qrd->mqd, m, sizeof(struct v9_mqd));
+	memcpy(qrd->mqd_ctl_stack, mqd_ctl_stack, m->cp_hqd_cntl_stack_size);
 }
 
 static void restore_mqd(struct mqd_manager *mm, void **mqd,
@@ -354,6 +365,8 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 {
 	uint64_t addr;
 	struct v9_mqd *m;
+	void *mqd_ctl_stack;
+
 	m = (struct v9_mqd *) mqd_mem_obj->cpu_ptr;
 	addr = mqd_mem_obj->gpu_addr;
 
@@ -364,6 +377,10 @@ static void restore_mqd(struct mqd_manager *mm, void **mqd,
 		*gart_addr = addr;
 
 	/* Control stack is located one page after MQD. */
+	mqd_ctl_stack = (void *)((uintptr_t)*mqd + PAGE_SIZE);
+	memcpy(mqd_ctl_stack, qrd->mqd_ctl_stack, qrd->ctl_stack_size);
+
+	/* TODO: Confirm that qp->doorbell_off is restored properly */
 	m->cp_hqd_pq_doorbell_control =
 		qp->doorbell_off <<
 			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
@@ -531,6 +548,7 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_dump_info = get_dump_info;
 		mqd->dump_mqd = dump_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct v9_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index ff436737b717..9ae3a16ae69b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -303,6 +303,13 @@ static int get_wave_state(struct mqd_manager *mm, void *mqd,
 	return 0;
 }
 
+static void get_dump_info(struct mqd_manager *mm, void *mqd,
+                       u32 *ctl_stack_size)
+{
+	/* Control stack is stored in user mode */
+	*ctl_stack_size = 0;
+}
+
 static void dump_mqd(struct mqd_manager *mm, void *mqd,
                        struct queue_restore_data *qrd)
 {
@@ -499,6 +506,7 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->destroy_mqd = destroy_mqd;
 		mqd->is_occupied = is_occupied;
 		mqd->get_wave_state = get_wave_state;
+		mqd->get_dump_info = get_dump_info;
 		mqd->dump_mqd = dump_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct vi_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index defea19c8bb9..3ebca0a4e046 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -478,6 +478,8 @@ struct queue_restore_data {
 	uint32_t cu_mask_size;
 	void *mqd;
 	uint32_t mqd_size;
+	void *mqd_ctl_stack;
+	uint32_t ctl_stack_size;
 };
 
 struct queue_properties {
@@ -1090,8 +1092,8 @@ int amdkfd_fence_wait_timeout(uint64_t *fence_addr,
 			      uint64_t fence_value,
 			      unsigned int timeout_ms);
 int pqm_get_queue_dump_info(struct process_queue_manager *pqm,
-			unsigned int qid,
-			u32 *mqd_size);
+			    unsigned int qid,
+			    u32 *mqd_size, u32 *ctl_stack_size);
 int pqm_dump_mqd(struct process_queue_manager *pqm,
 		       unsigned int qid,
 		       struct queue_restore_data* qrd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 8516e93b521b..815a28b88a9c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -527,9 +527,8 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
 						       save_area_used_size);
 }
 
-int pqm_get_queue_dump_info(struct process_queue_manager *pqm,
-			unsigned int qid,
-			u32 *mqd_size)
+int pqm_get_queue_dump_info(struct process_queue_manager *pqm, unsigned int qid,
+			u32 *mqd_size, u32 *ctl_stack_size)
 {
 	struct process_queue_node *pqn;
 
@@ -545,7 +544,8 @@ int pqm_get_queue_dump_info(struct process_queue_manager *pqm,
 	}
 
 	pqn->q->device->dqm->ops.get_queue_dump_info(pqn->q->device->dqm,
-						       pqn->q, mqd_size);
+						       pqn->q, mqd_size,
+						       ctl_stack_size);
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
