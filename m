Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB75F0381
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 06:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ECA10EB0E;
	Fri, 30 Sep 2022 04:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBED10EB09;
 Fri, 30 Sep 2022 04:13:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C955/KA+qJx2qwTBQXN4KQQsXB9RBDbF1YKozN0m6K57cD3oc7rAYds7ofBQssqqsEukU4jYplOsD7yG8qzHH4JsvOfVufOw1cHbQ1aZZtGMALfZky/oOjpFUvROHxwuVYMc2zkrEmp83Y8Uu5wsZkavxqbpTDeP020vURBR8LjSAPN0V1Fjj9DnDKCbroRb1co6bdCb9VZ/WggVlUIFZK/AwZ4qKxpo9tvCwDuWntKkjd/GPArzJK3RLrECTbIMUTl2Hf4zNl/palSoJ+I7lI1cJDzkmDOfnY7q48LZ4BhclxJqcmdcHz31DB8RhjkhU41Nm2/i/RNSTHDPkHYjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Q5QkoUzV0PtLsy1Vc5XkDidJeekfxtfe9T/pvSGPhA=;
 b=WP5N+icOWNrMGfc4yLkTN5tcGdcMUAI7Ca21rHXmyfXugD85x8S3oJH56jiAq5pQvykJsvQ7z+jvOgdoEpBiUQxzRSpJcG535jRHpQYm53clJrurHQsIw3pXRLNJ6pFUQezr/PT+ABnmOEXyM7O/R2DdYm+eniMU/JYRQKkBAFLwrOvkdNYUBjkRsEhH90QYFxy3HIVsSeYL71fogFGb7XYG+sJXPfifAB+U4FNGVnFIrOfA/4nc8AnCOVHuBUdD7zeSJp1Us708AI0fQGjBw77Y4wK0JX5COGGYbRrCMVVKOxdpXQ6oPuGGjE2RJ7juxC1ypyRX8J0X3uf+TOMqmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q5QkoUzV0PtLsy1Vc5XkDidJeekfxtfe9T/pvSGPhA=;
 b=JlUm17KZkpEAytuysnORnNRPrs+kqvNXfJMvTzX2pOSHV1fCOUtAwHJGfNxSKUBt53oMys+F8p/DHxIzPYXD6ZjfGY0gUxTv7dnGZbzfM0DNfNJRzfmZagKfBxuW4UztWSrX9HPkt6sMySSAWr6mimvIGvcMFOIaelQvMI4aQuA=
Received: from MW4PR03CA0332.namprd03.prod.outlook.com (2603:10b6:303:dc::7)
 by DM4PR12MB5055.namprd12.prod.outlook.com (2603:10b6:5:39a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 04:13:31 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::e4) by MW4PR03CA0332.outlook.office365.com
 (2603:10b6:303:dc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 04:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 04:13:30 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 29 Sep
 2022 23:13:27 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8] drm/sched: Add FIFO sched policy to run queue
Date: Fri, 30 Sep 2022 00:12:58 -0400
Message-ID: <20220930041258.1050247-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.38.0-rc2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT004:EE_|DM4PR12MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: eece0bb2-9d2a-480f-6ec8-08daa29a2212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbQbiTGsO0KaerAOsxWi5Tpz3oiQRWpvHcL1D1gD832Tmi1ZP4bGJroHHn9zyYJSYuWfZvsn7u3OhBIHSzStYb30+6KPGnUJp96tZPPd3ilvku/vzRFOILhD1NZ3TAOK/GZLdd1diu+b4e+YujpkBWjRqLgQWz6Oi1Tuj3HfhAabeFBD3qhtsTemJdu45WkRIshMwYfGkleAwoi9yWNWiGJ3hiZjQbTNRSvqhX5Qpr9OFY7hnGYL3cEGbjKhnEl2Jwrr3FuMWb0uifNI3t1GaaSffoIBVwuSSy5GGvr6Q0mrnV2F1lJavpRNiS52ZB9WDInEmDfuc+JVom7kYNwzcJ5Mzxu0SByfPlYqsr88aApAvTwit67LjMRgqSj2A2cpmXDzXJ9i+dXrqRIsIutfcwL6dfMWHxUtsl5DnSlo4CN1hSEl5KgMbS/ywOs4zvcUgNHTbbaZpuVEJoD492hGUbhTg9WNV3jIJw3t/TvHEN4T4HDGYVyAUruQXfv8hjJ3U6JpRQxbXvnxS6HoAxuHlbPAuB76MLL3gZcQdt9xX5ZT16eIZbQ16VW8wHysjhzEL5WJAvBLwRS/hDhb725utzvh6wQsdWJvIEA8MgnXyOR96Mx/sXf5PlY+k1iTL9FAbzHOhAs1hBJC4FjT9s4nfowXeEkJwsEF0C8lHjPvm7MUoQF/ZOBmRMaiFIJkY2Gy51S3J3ac80vuk5aiezF7gXserSgllxi07ClCZJH+ghruBE2v/yniitowpYZCmLlFZ+dugggtziTYBFDu1Qm6k6zWDQxPSncuhjOTbphj7xQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(40480700001)(83380400001)(66574015)(47076005)(2616005)(426003)(186003)(336012)(1076003)(16526019)(356005)(82740400003)(30864003)(81166007)(36860700001)(41300700001)(2906002)(82310400005)(44832011)(70206006)(40460700003)(8936002)(70586007)(478600001)(26005)(6666004)(7696005)(316002)(5660300002)(450100002)(8676002)(54906003)(6916009)(36756003)(4326008)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 04:13:30.0862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eece0bb2-9d2a-480f-6ec8-08daa29a2212
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5055
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

When many entities are competing for the same run queue
on the same scheduler, we observe an unusually long wait
times and some jobs get starved. This has been observed on GPUVis.

The issue is due to the Round Robin policy used by schedulers
to pick up the next entity's job queue for execution. Under stress
of many entities and long job queues within entity some
jobs could be stuck for very long time in it's entity's
queue before being popped from the queue and executed
while for other entities with smaller job queues a job
might execute earlier even though that job arrived later
then the job in the long queue.

Fix:
Add FIFO selection policy to entities in run queue, chose next entity
on run queue in such order that if job on one entity arrived
earlier then job on another entity the first job will start
executing earlier regardless of the length of the entity's job
queue.

v2:
Switch to rb tree structure for entities based on TS of
oldest job waiting in the job queue of an entity. Improves next
entity extraction to O(1). Entity TS update
O(log N) where N is the number of entities in the run-queue

Drop default option in module control parameter.

v3:
Various cosmetical fixes and minor refactoring of fifo update function. (Luben)

v4:
Switch drm_sched_rq_select_entity_fifo to in order search (Luben)

v5: Fix up drm_sched_rq_select_entity_fifo loop (Luben)

v6: Add missing drm_sched_rq_remove_fifo_locked

v7: Fix ts sampling bug and more cosmetic stuff (Luben)

v8: Fix module parameter string (Luben)

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Tested-by: Yunxiang Li (Teddy) <Yunxiang.Li@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 20 +++++
 drivers/gpu/drm/scheduler/sched_main.c   | 96 +++++++++++++++++++++++-
 include/drm/gpu_scheduler.h              | 32 ++++++++
 3 files changed, 145 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 6b25b2f4f5a308..7060e4ed5a3148 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->priority = priority;
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
 	entity->last_scheduled = NULL;
+	RB_CLEAR_NODE(&entity->rb_tree_node);
 
 	if(num_sched_list)
 		entity->rq = &sched_list[0]->sched_rq[entity->priority];
@@ -443,6 +444,19 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	smp_wmb();
 
 	spsc_queue_pop(&entity->job_queue);
+
+	/*
+	 * Update the entity's location in the min heap according to
+	 * the timestamp of the next job, if any.
+	 */
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
+		struct drm_sched_job *next;
+
+		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
+		if (next)
+			drm_sched_rq_update_fifo(entity, next->submit_ts);
+	}
+
 	return sched_job;
 }
 
@@ -507,6 +521,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
+	sched_job->submit_ts = ktime_get();
 
 	/* first job wakes up scheduler */
 	if (first) {
@@ -518,8 +533,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			DRM_ERROR("Trying to push to a killed entity\n");
 			return;
 		}
+
 		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
+
+		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
+
 		drm_sched_wakeup(entity->rq->sched);
 	}
 }
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4f2395d1a79182..ce86b03e838699 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -62,6 +62,55 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
+int drm_sched_policy = DRM_SCHED_POLICY_RR;
+
+/**
+ * DOC: sched_policy (int)
+ * Used to override default entities scheduling policy in a run queue.
+ */
+MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
+module_param_named(sched_policy, drm_sched_policy, int, 0444);
+
+static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
+							    const struct rb_node *b)
+{
+	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
+	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
+
+	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
+}
+
+static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
+{
+	struct drm_sched_rq *rq = entity->rq;
+
+	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
+		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
+		RB_CLEAR_NODE(&entity->rb_tree_node);
+	}
+}
+
+void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
+{
+	/*
+	 * Both locks need to be grabbed, one to protect from entity->rq change
+	 * for entity from within concurrent drm_sched_entity_select_rq and the
+	 * other to update the rb tree structure.
+	 */
+	spin_lock(&entity->rq_lock);
+	spin_lock(&entity->rq->lock);
+
+	drm_sched_rq_remove_fifo_locked(entity);
+
+	entity->oldest_job_waiting = ts;
+
+	rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
+		      drm_sched_entity_compare_before);
+
+	spin_unlock(&entity->rq->lock);
+	spin_unlock(&entity->rq_lock);
+}
+
 /**
  * drm_sched_rq_init - initialize a given run queue struct
  *
@@ -75,6 +124,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 {
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
+	rq->rb_tree_root = RB_ROOT_CACHED;
 	rq->current_entity = NULL;
 	rq->sched = sched;
 }
@@ -92,9 +142,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 {
 	if (!list_empty(&entity->list))
 		return;
+
 	spin_lock(&rq->lock);
+
 	atomic_inc(rq->sched->score);
 	list_add_tail(&entity->list, &rq->entities);
+
 	spin_unlock(&rq->lock);
 }
 
@@ -111,23 +164,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 {
 	if (list_empty(&entity->list))
 		return;
+
 	spin_lock(&rq->lock);
+
 	atomic_dec(rq->sched->score);
 	list_del_init(&entity->list);
+
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
+
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		drm_sched_rq_remove_fifo_locked(entity);
+
 	spin_unlock(&rq->lock);
 }
 
 /**
- * drm_sched_rq_select_entity - Select an entity which could provide a job to run
+ * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
  *
  * @rq: scheduler run queue to check.
  *
  * Try to find a ready entity, returns NULL if none found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 {
 	struct drm_sched_entity *entity;
 
@@ -163,6 +223,34 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
 	return NULL;
 }
 
+/**
+ * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
+ *
+ * @rq: scheduler run queue to check.
+ *
+ * Find oldest waiting ready entity, returns NULL if none found.
+ */
+static struct drm_sched_entity *
+drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
+{
+	struct rb_node *rb;
+
+	spin_lock(&rq->lock);
+	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
+		struct drm_sched_entity *entity;
+
+		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
+		if (drm_sched_entity_is_ready(entity)) {
+			rq->current_entity = entity;
+			reinit_completion(&entity->entity_idle);
+			break;
+		}
+	}
+	spin_unlock(&rq->lock);
+
+	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -803,7 +891,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
+		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
+			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
+			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 599855c6a6727b..1f7d9dd1a44484 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -50,6 +50,12 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_UNSET = -2
 };
 
+/* Used to chose between FIFO and RR jobs scheduling */
+extern int drm_sched_policy;
+
+#define DRM_SCHED_POLICY_RR    0
+#define DRM_SCHED_POLICY_FIFO  1
+
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
  * attached to the DRM file_priv).
@@ -196,6 +202,21 @@ struct drm_sched_entity {
 	 * drm_sched_entity_fini().
 	 */
 	struct completion		entity_idle;
+
+	/**
+	 * @oldest_job_waiting:
+	 *
+	 * Marks earliest job waiting in SW queue
+	 */
+	ktime_t				oldest_job_waiting;
+
+	/**
+	 * @rb_tree_node:
+	 *
+	 * The node used to insert this entity into time based priority queue
+	 */
+	struct rb_node			rb_tree_node;
+
 };
 
 /**
@@ -205,6 +226,7 @@ struct drm_sched_entity {
  * @sched: the scheduler to which this rq belongs to.
  * @entities: list of the entities to be scheduled.
  * @current_entity: the entity which is to be scheduled.
+ * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
  *
  * Run queue is a set of entities scheduling command submissions for
  * one specific ring. It implements the scheduling policy that selects
@@ -215,6 +237,7 @@ struct drm_sched_rq {
 	struct drm_gpu_scheduler	*sched;
 	struct list_head		entities;
 	struct drm_sched_entity		*current_entity;
+	struct rb_root_cached		rb_tree_root;
 };
 
 /**
@@ -314,6 +337,13 @@ struct drm_sched_job {
 
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned long			last_dependency;
+
+	/**
+	 * @submit_ts:
+	 *
+	 * When the job was pushed into the entity queue.
+	 */
+	ktime_t                         submit_ts;
 };
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
@@ -503,6 +533,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
+void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
+
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
 			  struct drm_gpu_scheduler **sched_list,

base-commit: 2ab69739209c843a47af82c0620036b233c83688
-- 
2.38.0-rc2

