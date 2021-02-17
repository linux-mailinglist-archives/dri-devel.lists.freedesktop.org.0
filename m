Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5E31E1B3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 22:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993186E7FA;
	Wed, 17 Feb 2021 21:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59A06E1F4;
 Wed, 17 Feb 2021 21:59:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNtjeZ4O2eerZxZu1RQHzXlDMqNOxt6m6b+ZPDKCw9L0C327H2GOE01Zho7u0jRUwaKYQ2BM1Tr+ZDKjEUw6ahRNP+OQA0QZqa40AME19LFTUDrXLvKyf6n67E16ZUHO5x0QeZ28PVZOlCeb7IuhBc0759Tqo5xBiLgUI4e/bHFWc/DYx8AMQIW/de+mjw3jXd3XCqChSvNQ1guZihJm3l6U1wGuXStVg1Plr/a0wQqDxXutWmYD8g8rXaXAN5eJBN40VsrOueFcPAwW5bFAHUA4R3AL2JtOO/K8khoRoZDaAbFpeQawqdclLKUFSMWLRANAWzejF8t9lBmFp0RQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slvNus98aWUVE92z5goKgiewjp9lUBfwAD+rBgX+b8w=;
 b=T3OYTQ0GbH+kFj/XDTocksNIrEw4uh56sx6oseKqlpSUfyYSofcZuJBepRTnCCVd/NnVYn95Fdc/Htlovrozv0XTvBbi9odyB6HxGqUhQ/66LnWye3Js90fvcFMCkBybUKKzTu8rZ8UlpkM6bKlx8x45BtjLVcPK7QyJvL3vBazoXwCAZys8ao/UL4C/oWz8fDvqRal1OV+jOnRJGCWaKuFrwaqqpJ5oYedWNUMLt3JG6LQnkpHbUSvyBca5+saGvQyAP3D/qR4uU/8uPysJcJPJHymaZidRHHtpjjwpB7UW+gFFKEkisanehW+hAywVvPvI/zN4MrECi9qGVOEfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slvNus98aWUVE92z5goKgiewjp9lUBfwAD+rBgX+b8w=;
 b=ABtCdMLbdUmd6Pqf9zMLgHuvsk5sD62kq/KltTHuSt0ErRx4ir85veRTzXnh5mZc3PCFIX4ymDMal9iuXxOQfsR8BI6TFtZ32yX0Bb49kGZrOUnKaxxXspLw7iXBgfaice/vUCKtCVmlzhU1VV4nzHV2aBGxDCfe4SypFzc6ENw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2398.namprd12.prod.outlook.com (2603:10b6:802:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.39; Wed, 17 Feb
 2021 21:59:48 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Wed, 17 Feb 2021
 21:59:48 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com
Subject: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
Date: Wed, 17 Feb 2021 16:59:41 -0500
Message-Id: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2607:fea8:3edf:49b0:1c58:abdf:5837:609f]
X-ClientProxiedBy: YT1PR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::34) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:1c58:abdf:5837:609f) by
 YT1PR01CA0095.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3846.38 via Frontend Transport; Wed, 17 Feb 2021 21:59:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81fc0c3b-5ad0-4f5f-d061-08d8d38f580c
X-MS-TrafficTypeDiagnostic: SN1PR12MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB239853404BABB45342E1B7AFEA869@SN1PR12MB2398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+iFKXEeEqjkHfBOZwgZoqQPCV2FSuqPJ9vOYveNIikopgsoZ0ARHGSUkDhp7rl55VAK10Cgo5mLWwqtFokXYvhIBjwmEG4Hh5rPwJoYmz+hao0mlryXGKn19TdezljgoBvvp+GOr14bXjajYtDaKtuLeP3dB0fch7eS1u+Pds24bbXIgvG8J0QpdVSUBJ0qhberdpQc2Tdnk1JINzGeDICLYYfOK5h5pnJV821XOcd7/VMsaluqdKY5ywUzHKLBPtV92OahcHeKmj0wj4CpAutFkTmrFAXM/KeYtOVeU+2X3sJ1VnKsqr2GNuRbgnUFd7Hk9XfGH8AlqGzfTaNdcA4UxLqRrnMi+KExcc2KhAmrjXTi9LoY1PCMYmiCbKGUNjszzxJcKHOaac8MxjcmbkgO5gcr8e9GP5y2rGv8EeLhr1Uu9WdLvn0GrqOFxjXnoASDVr3i52HbynAp/7/Hpk82c5YOFmOcpTpky7D37CwDSAmA0oskbYbgVAxZswJaz8C14d/9aZEa9Eqhi6tGkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(2906002)(86362001)(36756003)(186003)(83380400001)(4326008)(66946007)(66556008)(8936002)(66476007)(5660300002)(6666004)(6506007)(2616005)(6486002)(44832011)(16526019)(478600001)(8676002)(316002)(52116002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YBj0IMFvdMk/d5Scma3Kk1ua8IH2HxhbFu9XSwZIxY6zLQGMyjetD9hmFX1g?=
 =?us-ascii?Q?VdNaPeYHU6tFWlG4jlMJnYekHNJ+sqBl5AUjz21bJYoX7cq0dvYmkSzfTpeB?=
 =?us-ascii?Q?ASlvDjAWGUXFBwCxdRYaV9ScfsU6GrNoK8QHsUbHHM0vJh2/3QmvJzzEwIWL?=
 =?us-ascii?Q?Ug3FxhVJxL9FYNbL/9R09xB4liWrOlq5ZxSruDFNoGQ9EiEQOAwQoZvOLL2J?=
 =?us-ascii?Q?Qltaeow7wn6u47waRS+HFTmSG4KZeNUbiSz6Gr7ewiyzUG9T5nfg5gHld/Cs?=
 =?us-ascii?Q?e9GHy84kEtmZDN9iFrwJiDm4Zd/7eN5nGyy+kU9H1Am6KzMZpkn5mE7Zowfl?=
 =?us-ascii?Q?qIG4sQyJ9ecq7eIfYw+FLeHhHYp4CU2F2tOEjWNzq9NzsVKQi1xuGCJFjA0a?=
 =?us-ascii?Q?jzoHw37WX7vP/LWYqOg9okDFBdWGCa+S4ucZms2QZTc9AvIR7NPYLko2kTu8?=
 =?us-ascii?Q?8UDeFxAtqqIPdWOhTom1tJB19f1rNO1QUxeEofgZ/X+/a7c8cblWwmLlzX4r?=
 =?us-ascii?Q?YEEvuW0R6kd1XY+ihDgYKN693EcbEgeQkMgU/NGhojJBpWNZ5za1QMASqMDP?=
 =?us-ascii?Q?GGQwd2FKKy2QgBa9nGHNr6WFTbC1nri3aGUGNqzFEyY+k7IaWww2mmwPaCRx?=
 =?us-ascii?Q?hnLE19aWYk5aHl0lZFLAJb5B3yDgeFtcskpl1VpfDJmbz6ydmEDf0hJdztp9?=
 =?us-ascii?Q?EOlsMoYClv/USSJEZcXwiJV3GEO6PyAKGE0wf9AMAjg1jOj4nmqNBmfARnRR?=
 =?us-ascii?Q?enWQhf8sfUsEh4Z4gsGMLciCXpmC0KIsfbE86xRJ28Uwcbm6mqgfO3ghB/ow?=
 =?us-ascii?Q?AbtUGPsjybjKMIWbBGEPJuxK6RwiNuA+aLfMd175VFjhQ4P3xPsQ/V16+E8n?=
 =?us-ascii?Q?nKm3ru/G+4F5jxPbDUVHz2QhNKN2OqgKXdaeO0OVho3cBYatOwLbvqQvnxue?=
 =?us-ascii?Q?uobpm6XPs5g4wiNuImUTqk+7LGWUaQWpK87hNGDZM/MX/gfqjsJzjQqBz0Lr?=
 =?us-ascii?Q?xSOnPrADpPorGLViufvLaaZHOBvWhaYSZLuo0oCjMa5YNTvfhtIwtEvJEeRj?=
 =?us-ascii?Q?VncZms8lOJX+3PbfNQuJuxlK3higNRsoNuSsTLc1Ex3/0U+hbZUUGyrkgh+o?=
 =?us-ascii?Q?pL5HWB4906pETS/WzDf4cbhvTxw6AZnNX8Frh4erdvnHngwz6Pcv0lZIR7sF?=
 =?us-ascii?Q?uOn9TuhIaM1W2hv7w6crfoYpBUBPOGxpOu98IP8IS3BK9PFux1Wkigc+37Pe?=
 =?us-ascii?Q?tovKCw/081A2MFgsiFcKPUHDBh9n8lxb8m36AXEKC8PlyThWvvqTnCCFixAR?=
 =?us-ascii?Q?8fHWHizQenOC49rz3/1H+1GhcAtAIOBjLfLODSEr6UpbFH/Yk4DY1s+yXlu9?=
 =?us-ascii?Q?TKYlT9cMOGKQaZIgBTm8FywfN+3Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fc0c3b-5ad0-4f5f-d061-08d8d38f580c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 21:59:48.7082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRgllOuNgrDMsCLvtWPAu5rCkZdPIdLGqX6lMeiyhieBFRBqNO1AzodYPu+1nBpTsTXHzoe4YIs/NSJBRadbug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2398
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

v2:
Reverse order of drm_sched_rq_remove_entity and marking
s_entity as stopped to prevent reinserion back to rq due
to race.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 908b0b5..c6b7947 100644
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
+
+			/* Prevent reinsertion and remove */
+			spin_lock(&s_entity->rq_lock);
+			s_entity->stopped = true;
+			drm_sched_rq_remove_entity(rq, s_entity);
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
