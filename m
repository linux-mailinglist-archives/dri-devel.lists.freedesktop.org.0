Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C485EE49D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043A510E762;
	Wed, 28 Sep 2022 18:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8245910E762;
 Wed, 28 Sep 2022 18:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klEZcmxTrMVS1lLDlIW+2edWGJJpm/qcrHtMOYZAdqRge26Rm0kdOujkvxij1pdkFguhjmBlht0XXP1GFWTLHHnDIMpSqUxEx8WcpndTkv/qdZZzZXoknDZk0YWz00SGKp07RC4kSqyUBXjYDyTewJ/XMtCKBzZi6Uw+YQHWXHUxuanSjgNzxQXFIRrpj2ehddwfMkkc2sA6uw9aUPF+xmnvvYyu3/PP1+ZR77Ww3VSGJhrk5NNn+wv0Wl9IAbGjFcpKXReHSX/q5D/9Qq66xFlZid2mn6I3qvgRboJjTBflurtRBZ4DASLPYznxI24C+0AosP6+pQSHR2SXQ6UPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAJhmpHylicqHYpYFzdCr0Rm1nx1R1Sx6M6tRMsts04=;
 b=lPAQqKQVzxnp8y0EwdlStP65y+PyETusVKPEjjNN7K+niv2JXFsfIYauPldWG9bhKUDwjVBh4Jq5g9t4FevsH8Phw4KNXM5MqbMEqYL/i2HjYe/t9kYIR6AxFXO8I3UKY/JjAyHGmapNp0+z0KN4FsOnOYnnt+X3uOm9GoF0gOPuDfGfI3eKExucK9TlbEK3w38mylfRH2ZGCNx9lc8L2E2DJqOHw/DD41TjxaGXh/9W6T/DmGEqsz913PVF+NfUmA7PCMnViFAZrhIDuuqNGESh6gDvnKF5Z3XeyqwbHx1SbENb+0FIvhzDwAfek12j9438pEKQhiql+9F1hPfx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAJhmpHylicqHYpYFzdCr0Rm1nx1R1Sx6M6tRMsts04=;
 b=H2eXwHpvY3+aZ/2KDgFkEAiOXHwY39nPIuruSDokoQfXep331rqyDMo0BnNb+pJwDoFqfWoFRMy5cmx9gK7na7gmjMaQVT6njMHC+2QUaedriuDGCv1lYxPf9Jfd/4ezJZPOIu9oPuxi2VldytYNyg2orxZITeTxBLSbKJ3C1Gw=
Received: from BN9PR03CA0072.namprd03.prod.outlook.com (2603:10b6:408:fc::17)
 by CY8PR12MB7291.namprd12.prod.outlook.com (2603:10b6:930:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 18:49:36 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::86) by BN9PR03CA0072.outlook.office365.com
 (2603:10b6:408:fc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Wed, 28 Sep 2022 18:49:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Wed, 28 Sep 2022 18:49:36 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 28 Sep 2022 13:49:35 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <luben.tuikov@amd.com>
Subject: [PATCH v5] drm/sched: Add FIFO sched policy to run queue
Date: Wed, 28 Sep 2022 14:49:06 -0400
Message-ID: <20220928184906.51760-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|CY8PR12MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb7b0d1-26fb-4680-1880-08daa18230d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SucsEnucXlrWkZGDoS3jfAUXM0D7BLVITwTf3VnwNbSxbZnU+MAXKfbMbKyJbA+Dr3hDS+iGf8K1nzgALtJDqv0bjB7XOWwLx0uDKJzwyB2G64PKyw6dsOWPchAcSFf8MsZtUH33Yt0gny3hN26V1k5CV2i2wRkvNmLyqjD5tNYjGkXIPMbdE8NbAoYSp+QMT0IbNcSacStGHMprjexUfPnGN+RwrrKIQBGxVX4yeJm0cNLXCr7M+tX+x+nJygva/ojUmiZomkUE1ysX8xafiGFiTcwvaZ1YbaXl/QXPkp9EMtowoe+YM6ou6ct0149hVKIIvgrEO5Va9fKOXVyshG4QsSF1S6ef6vTLkAY/MOkcAAhLgx3CBXglU6RfKpjuYD3guVNN9FIcc15dpvx+TxjZUU4v9FplZigMYsIuYfdu4oGeSiZqVbyY2K69iriDW5eze0jZ6e1KE/jNCUC0Xd+JQnRykIxC8GCMMOR7zK75Yby2uAwM2PrOR4W1/cpumapTf4up0mN9KdErYiNWMQDwfkga32USPhblK7JVagzC3r05QEt6AIFmstY9izogVaFMGTmCPKXIqaqXukICIYGAWlz3UAbd459+qKIsaC9QWDegDrPsX0RQvhzGjVka4o3v90n3gwRJqx8UNgAKaKb9Trmo2KFTxZrdat40dzBK7pXdEGVHSxuydrtIAl9TC2RmGum+IgwzLsDOQikTRsyBls90ZRdxDB0b8kxJi1COEbzSSE3ZDV7lMoPGNJortLj/wdtWudUzq+WPb9zWFnAcxfrYnUVxP4bdLdy9kNg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(2616005)(47076005)(336012)(1076003)(426003)(16526019)(186003)(81166007)(356005)(82740400003)(30864003)(36860700001)(5660300002)(41300700001)(2906002)(44832011)(8936002)(82310400005)(40460700003)(478600001)(26005)(7696005)(6666004)(8676002)(4326008)(40480700001)(70586007)(70206006)(6636002)(316002)(54906003)(110136005)(36756003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 18:49:36.2460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb7b0d1-26fb-4680-1880-08daa18230d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7291
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
Cc: ckoenig.leichtzumerken@gmail.com, Li Yunxiang <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

v5: Fix up drm_sched_rq_select_entity_fifo loop
   
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 26 ++++++-
 drivers/gpu/drm/scheduler/sched_main.c   | 99 +++++++++++++++++++++++-
 include/drm/gpu_scheduler.h              | 32 ++++++++
 3 files changed, 151 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 6b25b2f4f5a3..f3ffce3c9304 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->priority = priority;
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
 	entity->last_scheduled = NULL;
+	RB_CLEAR_NODE(&entity->rb_tree_node);
 
 	if(num_sched_list)
 		entity->rq = &sched_list[0]->sched_rq[entity->priority];
@@ -417,14 +418,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
 	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
 	if (!sched_job)
-		return NULL;
+		goto skip;
 
 	while ((entity->dependency =
 			drm_sched_job_dependency(sched_job, entity))) {
 		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
 
-		if (drm_sched_entity_add_dependency_cb(entity))
-			return NULL;
+		if (drm_sched_entity_add_dependency_cb(entity)) {
+			sched_job = NULL;
+			goto skip;
+		}
 	}
 
 	/* skip jobs from entity that marked guilty */
@@ -443,6 +446,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	smp_wmb();
 
 	spsc_queue_pop(&entity->job_queue);
+
+	/*
+	 * It's when head job is extracted we can access the next job (or empty)
+	 * queue and update the entity location in the min heap accordingly.
+	 */
+skip:
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		drm_sched_rq_update_fifo(entity,
+					 (sched_job ? sched_job->submit_ts : ktime_get()));
+
 	return sched_job;
 }
 
@@ -502,11 +515,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
 	bool first;
+	ktime_t ts =  ktime_get();
 
 	trace_drm_sched_job(sched_job, entity);
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
+	sched_job->submit_ts = ts;
 
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
+			drm_sched_rq_update_fifo(entity, ts);
+
 		drm_sched_wakeup(entity->rq->sched);
 	}
 }
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4f2395d1a791..5349fc049384 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -62,6 +62,58 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
+int drm_sched_policy = DRM_SCHED_POLICY_RR;
+
+/**
+ * DOC: sched_policy (int)
+ * Used to override default entities scheduling policy in a run queue.
+ */
+MODULE_PARM_DESC(sched_policy,
+		 "specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default), DRM_SCHED_POLICY_FIFO  = use FIFO");
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
+	struct drm_sched_rq *rq;
+
+	/*
+	 * Both locks need to be grabbed, one to protect from entity->rq change
+	 * for entity from within concurrent drm_sched_entity_select_rq and the
+	 * other to update the rb tree structure.
+	 */
+	spin_lock(&entity->rq_lock);
+	spin_lock(&entity->rq->lock);
+
+	rq = entity->rq;
+
+	entity->oldest_job_waiting = ts;
+
+	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
+		      drm_sched_entity_compare_before);
+
+	spin_unlock(&entity->rq->lock);
+	spin_unlock(&entity->rq_lock);
+}
+
 /**
  * drm_sched_rq_init - initialize a given run queue struct
  *
@@ -75,6 +127,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 {
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
+	rq->rb_tree_root = RB_ROOT_CACHED;
 	rq->current_entity = NULL;
 	rq->sched = sched;
 }
@@ -92,9 +145,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
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
 
@@ -111,23 +167,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
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
 
@@ -163,6 +226,34 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
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
@@ -803,7 +894,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
+		entity = drm_sched_policy != DRM_SCHED_POLICY_FIFO ?
+				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
+				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 599855c6a672..1f7d9dd1a444 100644
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
-- 
2.25.1

