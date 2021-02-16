Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F188931CEA7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 18:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5306E452;
	Tue, 16 Feb 2021 17:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4486E452;
 Tue, 16 Feb 2021 17:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMCQVP1cwboJ6lua3o3l7UlJWRhwKDOPuPzv2veoPszvHFJsqhlBuqSDmR9pyIvjmdZ0241P+bRNIeSAthP58X7Gfy97C4N/o7RN9CVeMvNd6+gqypvYzJLU0NeE4wcLCD1twyvAGkvguk22WCe2he+lJrng7Bwmar5HZLR0q1vxhS3oklpAHyb8Ibgv9x+gXmNz8z1T8/tzGaEEGfo7DAjHpM6CrxIDJdi4VIXGhsxQa1X2by9VSG0VgTUJGTEp1D0LFqFoJSEx/L/GzVUDevvvIki0EfaWbh702fuXHowXoX/1c557Fz8oXXK+XYVIJV2dw+hp6Sb/wU2OOrd5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/c53vPyj2nFg7Bz9mIgdgMLg8milkxsS9vPCtD+LME=;
 b=XXL+Vg8jqSWXS25uGBTYoofrAMA0MRZ8XJ5+s84odQQDyW3HiQ4ZJx2XUwMi34XuJlqBRxK7YTDQBMhMMGqSi4V3TKyb5/9H/b8QXMpIdeKrOQnJYmJh9Mo3iqQHOcz8HZC6DnB/reNAu631Epkayofsb7nqlwcsFHgl1wg63SxnbcbBctEN+Lgtmo0mAgfPKBPcRlk7KWdr+0494hk2tNUlVkC5QKpEQXdAJ87wNMH4SXk2se68HqKpcRCqScqyZlwXwCrLgJlU1uvr1+enRMtOc+pAV05rvEE1XaG8NzdnzPW6kxbR6xI79RTPXh0uh5dE4QA6D/LzIm8lo/eTeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/c53vPyj2nFg7Bz9mIgdgMLg8milkxsS9vPCtD+LME=;
 b=ky3SoFm0QSMsONotIus9OZvBXFyII5zKktzxeMMGeQoOfNwarr6PYNirgYsrMUa/Jdl3LPK43nO8oZn+n1h+tH8x9+y9d77rKynWCN6cO9r6QRy72r5ecERUU0zQUBXSbLgzuZi3DqYJjcuSM9KAODcShxeYJIHfqP6ybGr1Lv4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4766.namprd12.prod.outlook.com (2603:10b6:805:e2::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 17:08:08 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Tue, 16 Feb 2021
 17:08:08 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/scheduler: Fix hang when sched_entity released
Date: Tue, 16 Feb 2021 12:07:42 -0500
Message-Id: <1613495262-22605-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2607:fea8:3edf:49b0:d587:8aea:4bdd:18b6]
X-ClientProxiedBy: YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::12) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:d587:8aea:4bdd:18b6) by
 YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3846.36 via Frontend Transport; Tue, 16 Feb 2021 17:08:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05d6bf98-d273-4847-3320-08d8d29d6e8a
X-MS-TrafficTypeDiagnostic: SN6PR12MB4766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47660D7AB1F3EDA5D3BFDDD8EA879@SN6PR12MB4766.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iT5LGJjWBi6QnWLt+59a0KQdZz2eyVxYdf5hpEa1orZTDlmJmue3ZOdEtgSnSd/I+u3DEXwuZg73MCsireRIrphdpHEg8dt2ecjWeRrHDfcMq5l1eFyKR6hRWFyIz1sqUwhLV9feauyQvuWeOo7XEZl46wFt+Ysr8LJB/sD2+dQyul25KJPLGQ4qNeprGJuh78ydS0HSTqXzG3+kUp8DvqoTX7aUfkr1lJAeD/crMvtAJgrfywXmQ4E2UDMAXZ72YPG7MHwSamzEs4VXSBHzI6WAgul3FTBHHU4NPTmmZt0rrZXpbTxCBg5KI9uqZN9fEvRaqRDa33ZL59bABweOtDy7DOXwfrYPaQ57Si9xUD3/RsJzYY2j9rvnfug0YetWbO0lIOoYsj62tj+esk7t4T4SR4NH8945vsCwZjHxhVDUaYfvf8qiDOxDG4dwXTraTLd9N3uR8zrTDaM3jc6Q4VoKvG/2pZdDNrMvfkEzdEB/DyN0ozS6fvLIdv7+9bWi3HRIT1+EdMeYzrANLr6bVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(2906002)(6486002)(66556008)(6512007)(4326008)(66476007)(52116002)(316002)(186003)(86362001)(478600001)(6666004)(66946007)(6506007)(16526019)(2616005)(8936002)(44832011)(5660300002)(8676002)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?M7WZVzvnlEURIO3bJxFMkecXNNSsPXX5fpRJBVH0y6m6JCdO7duZZ3LrBTCs?=
 =?us-ascii?Q?zZwz5sUrU1Opf1R+O3RF5YfNhc4FDhxdMPXoxqrHjr6ax2o+WDyExv5Lr4Y9?=
 =?us-ascii?Q?1eQcFvBf+HcqK+h9X4lWf5oWV2/WBAhKm1y9iACwfPqX/WVrvm20M6pHGnyt?=
 =?us-ascii?Q?vDV5Lm4D7yZ3q6Shr1Q0DVBcthbIQyJaK4MiSsev0kdSJTwhRkoXKHeDs36v?=
 =?us-ascii?Q?MNPd0KkyRFWsmu5mDgGMFp8vEr86NOp3zMpoXeY/YUT0KPNNusXFafP3KG/1?=
 =?us-ascii?Q?COK/EKk56kmJ+++kY99bQO2m5J2Sz7OmColxXuhIFuOIpa/RRThmiLeV/jxF?=
 =?us-ascii?Q?XHJGPqHXj9xD5o/rAkvFVM19RiTErF+hb8GoxtzmRsT0u+KQpDd2Uh0pIlcB?=
 =?us-ascii?Q?fKbQQ283Fncm17HkS9UHj/WCKreVujrJSRO+BAB1Kdo97TXDcnI7Fngn4PK8?=
 =?us-ascii?Q?kDkyjuE/Mq8QuE3gW3/+4TJwZdFmLAF0gfjllESJzof2W8qubyCDVNlnp5xY?=
 =?us-ascii?Q?tv5gE+qQGEepX1V+K10srAKjdwMS2xVjxOmUiFPssdudZC33K+hvZ65PBxhZ?=
 =?us-ascii?Q?3Z+J8fcuQjAWQz334r22mISrspoz1nYsfwiln/dhE+X/iZ5L0NzhkiXeCivF?=
 =?us-ascii?Q?A5v/0FqcYY/sAAieUglR0ImUpNwCjNSro2kG1JkCcsWGCEYy43OQAHWLwB/2?=
 =?us-ascii?Q?Wbe2fNgFfkbvpNqEYMy8OR5he504HZ0ej0z03HDYtSo+a5r+sdT/+5sqnhaz?=
 =?us-ascii?Q?c11N8/pEkLsXiAQkWK0Igqk/UtlGeEvi5AYHRsf9U1gk7IIQAUmr+cxBuYeK?=
 =?us-ascii?Q?ddbIPRq36ujKtUuwxPvgUIZD3SHKiHRjMU4moqJKNP8L5tLL4XRLnVkEn80o?=
 =?us-ascii?Q?DTFrSwYA0tF9YbfLxoJ07WM7DtpwdgLpXNLquxsrqWmFoFcMx/xDrU8ysVwN?=
 =?us-ascii?Q?J5z4AoizY7nbaTPEGw5whFpqXRMUnnjWUvrACZJStihOx/3OjAm/7Qz/cZO3?=
 =?us-ascii?Q?OyEJqqpqq5LrEBJmiG/lm1q5lSGTGUf/Acafi9ZpghL5pZPsT4YaviiHgFJx?=
 =?us-ascii?Q?xIjXUFa2IVc+3AUIUrysgCOxumoVCCQhmhCaMZwlCHxbMcNqYpXg7Iu/i0DU?=
 =?us-ascii?Q?zIqeHAZCqf5L0P/wy+ZQVBueTYjFEJcCQ6NmrldfIkY5M5MhT5Goloi2Rzou?=
 =?us-ascii?Q?ml2KtqletU58CD7izZwBo6NQzumn8F4axOjXMFkho/rJWDr4ZiXKrH1jdceS?=
 =?us-ascii?Q?n+HkfAeympYwh3w5mR17qXisdFkUd9m+bqkW8d4UnAGYAlQ8duWNfGNCJnEc?=
 =?us-ascii?Q?gpGv8mduLlEBnKEsNvDQM7LN8SEVEmLAzX826O0INyTORyNYPzD/WQszLajx?=
 =?us-ascii?Q?5SNyC0NNjrLZ/6iQkuA8ZK9ZvQ73?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d6bf98-d273-4847-3320-08d8d29d6e8a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 17:08:08.1263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+hM0za0mTm92th4ycZqQ+HL1gL50dUP1AX+Vw5CDHS5CGMOl4wbbgzM7yg0c9JEFS9/H419mEv0dMoWArFWhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4766
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
Cc: ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem: If scheduler is already stopped by the time sched_entity
is released and entity's job_queue not empty I encountred
a hang in drm_sched_entity_flush. This is because drm_sched_entity_is_idle
never becomes false.

Fix: In drm_sched_fini detach all sched_entities from the
scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
Also wakeup all those processes stuck in sched_entity flushing
as the scheduler main thread which wakes them up is stopped by now.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 908b0b5..11abf5d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -897,9 +897,40 @@ EXPORT_SYMBOL(drm_sched_init);
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
+	int i;
+	struct drm_sched_entity *s_entity;
 	if (sched->thread)
 		kthread_stop(sched->thread);
 
+	/* Detach all sched_entites from this scheduler once it's stopped */
+	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = &sched->sched_rq[i];
+
+		if (!rq)
+			continue;
+
+		/* Loop this way because rq->lock is taken in drm_sched_rq_remove_entity */
+		spin_lock(&rq->lock);
+		while ((s_entity = list_first_entry_or_null(&rq->entities,
+							    struct drm_sched_entity,
+							    list))) {
+			spin_unlock(&rq->lock);
+			drm_sched_rq_remove_entity(rq, s_entity);
+
+			/* Mark as stopped to reject adding to any new rq */
+			spin_lock(&s_entity->rq_lock);
+			s_entity->stopped = true;
+			spin_unlock(&s_entity->rq_lock);
+
+			spin_lock(&rq->lock);
+		}
+		spin_unlock(&rq->lock);
+
+	}
+
+	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
+	wake_up_all(&sched->job_scheduled);
+
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&sched->work_tdr);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
