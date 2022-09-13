Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C554F5B7C42
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A266A10E477;
	Tue, 13 Sep 2022 20:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2688910E477;
 Tue, 13 Sep 2022 20:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP3i3hXpmF6QbZo/yOlS7ROgY0xE2txJW+jyGi6a+hhYXoY/+T9v7+V6640AxjZ6A2U3dnoXMvrzgYKRSA4OCrFvl3q2OKLPOLgK5m/J9IS8lvYIpQ96Vudlypk9lsLVoQTuS+qGP3et9dyBePDO9mIFCZdTVu7rnkHD5BnJkhYKma2ZJUiUXWdCTnuf/Kst65jVK3atPMJn8kGEEvLBtIevPIOm1uuv0N1wx74qNyXplnPC5hqFEpsTn3NVQisPbTOzbSjO673FNeS/dhNKD6CxQQnl2RReBZzURwcvRdJgsLwZGr0nXeSadHlO7TeBLsid9Ir0Oe8G+URYfcYObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeO4qFjyww53zBEN052X0iBzvz0cb+2cz/OVhSwHqFA=;
 b=kA9KIIIbL5G4edb7xC3B0bR0Gfv51lkILbUyqJ8WKQjEa6Zx8Eu27Rup0ggDyGHDWKEZ0UHyMH9ihGuVrD/cMPOea1aQ0B5HelsAIyPdY9lCMp8f3CRNNCU6Gy4HbVJ6oiNZKaGKzwo8Cp+IqMwkvhF4dn68i9jJRJiGQYNE4KI5s35xUl8/SoNOm+GATq1OVafTUzo37+cj2CRV/cvoZtPKR5MxWMS5UxABJqMi1NPBaSObzvgB04EtgSnmjvlznTRKSFMg7LincBeEuWuyaIkUyqii6gmuxYcaDh3H5BR1oIClNY0Z3mjMwynqgxDNZkHYs6/lv2jy90+ViEwj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeO4qFjyww53zBEN052X0iBzvz0cb+2cz/OVhSwHqFA=;
 b=mTv0zrS7KlPE6eSl0SjZB3mAw4T4eBalpSXgyqNLVjOhpwzs5Ueo6eotjmQqpzjXzETL1i4HHp/vX9ihDSVphvYTjjkLxR0IQGTQg/2s0PtOhBE7cEj6+9S94o4HmMBjPg4Kf7/Rm5fpdPGNkIO9u7g7VOxaqqetWTt6ILDw5RQ=
Received: from DS7PR03CA0206.namprd03.prod.outlook.com (2603:10b6:5:3b6::31)
 by PH0PR12MB5420.namprd12.prod.outlook.com (2603:10b6:510:e8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Tue, 13 Sep
 2022 20:40:45 +0000
Received: from CY4PEPF0000B8E9.namprd05.prod.outlook.com
 (2603:10b6:5:3b6:cafe::ea) by DS7PR03CA0206.outlook.office365.com
 (2603:10b6:5:3b6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 13 Sep 2022 20:40:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8E9.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.12 via Frontend Transport; Tue, 13 Sep 2022 20:40:45 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 13 Sep 2022 15:40:44 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <luben.tuikov@amd.com>
Subject: [PATCH v3] drm/sched: Add FIFO sched policy to run queue v3
Date: Tue, 13 Sep 2022 16:40:25 -0400
Message-ID: <20220913204025.1473086-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8E9:EE_|PH0PR12MB5420:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d35da0-1b91-444d-952f-08da95c83bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s3jMvaJ0TCsoC9Jzxn0plIg0+AeMrQHaR8cxQ0riTdjpGNbSUBTpH2HOrJVoE4YqgF84WxdA0SY7yIS0cEwuesPU7o+1A6ecnvDR6xX50jzhAOt5A+2AiutBkcO4gS2DzvCNUzEnsvyAGV7wR2q6qbRO2ScO3f9+dAmztzC/SB/rZLmw3JhFa523GY7jAza7aaMuoDHEiaqnzMhrRvU1MivMvPIBbf353/NUC8IEFpA7E6obsE4S2IW3cRALBfCNgxwOkfmDxdRwbQ+QXDvmEwqoYCNSBkK0SGPtYCFjjxbL1U31rr26FnWE47FJQA3nx/SIWer9HeXtIQuM4qxumUVQaIwWlAZs/tlkBBEwtZ6msYrxW1/E5mBCuxb+LjVaXa9PlbLikk4/7VSozw0vHNle5hpdIZ/A4+aMn7cFzwm2Uw6v2p30+rs1KgdC6ex2Gs/hE/w75mFR5K0Nzdg2l14pJSskyfi+z58Oz8jv3v5e+euWgfqtKu8Ql+yQt5AWJUu2EmBI+GtdBynQI1nxcWarehrVUYEDvJP8Fj83RKfBsrqV8Lh1QzshfBzsya81UnRLauWo0qEfz3QVIPb6jmsGsZj1GGz6lNnK+h3a5E97jXFDuHkn70zh9BLImrdFSETB4+BBE2z88iN8GU5GLoQLMkCi62KivPOvI+TwbhQsb5NLwOkBtiFB6P4/VR2znAurgMoJsplLloJQyfEI5e+jUgPRGCzlPLlY3G8jN8Mps4z9AzzJqSWG5e4tpiR9ATt5pSJK4FldTfuBUbfDYCooCspXUU5cMN60NDhkSDw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(478600001)(41300700001)(70206006)(26005)(4326008)(356005)(36756003)(2906002)(86362001)(82310400005)(47076005)(40480700001)(186003)(54906003)(82740400003)(6666004)(40460700003)(2616005)(8676002)(16526019)(36860700001)(70586007)(81166007)(316002)(6636002)(44832011)(1076003)(336012)(110136005)(8936002)(83380400001)(30864003)(426003)(7696005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 20:40:45.4095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d35da0-1b91-444d-952f-08da95c83bc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5420
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

Given many entities competing for same run queue on
the same scheduler and unacceptably long wait time for some
jobs waiting stuck in the run queue before being picked up are
observed (seen using  GPUVis).
The issue is due to the Round Robin policy used by schedulers
to pick up the next entity's job queue for execution. Under stress
of many entities and long job queus within entity some
jobs could be stack for very long time in it's entity's
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
Various cosmetical fixes and minor refactoring of fifo update function.
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  26 ++++-
 drivers/gpu/drm/scheduler/sched_main.c   | 132 ++++++++++++++++++++++-
 include/drm/gpu_scheduler.h              |  35 ++++++
 3 files changed, 187 insertions(+), 6 deletions(-)

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
index e5a4ecde0063..72f7105e0b16 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -62,6 +62,65 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
+int drm_sched_policy = DRM_SCHED_POLICY_RR;
+
+/**
+ * DOC: sched_policy (int)
+ * Used to override default entities scheduling policy in a run queue.
+ */
+MODULE_PARM_DESC(sched_policy,
+	"specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default) ,DRM_SCHED_POLICY_FIFO  = use FIFO");
+module_param_named(sched_policy, drm_sched_policy, int, 0444);
+
+static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
+							     const struct rb_node *b)
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
+static inline void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+						   ktime_t ts)
+{
+	struct drm_sched_rq *rq = entity->rq;
+
+	drm_sched_rq_remove_fifo_locked(entity);
+
+	entity->oldest_job_waiting = ts;
+
+	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
+			drm_sched_entity_compare_before);
+}
+
+void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
+{
+
+	/*
+	 * Both locks need to be grabbed, one to protect from entity->rq change
+	 * for entity from within concurrent drm_sched_entity_select_rq and the
+	 * other to update the rb tree structure.
+	 */
+	spin_lock(&entity->rq_lock);
+	spin_lock(&entity->rq->lock);
+
+	drm_sched_rq_update_fifo_locked(entity, ts);
+
+	spin_unlock(&entity->rq->lock);
+	spin_unlock(&entity->rq_lock);
+}
+
 /**
  * drm_sched_rq_init - initialize a given run queue struct
  *
@@ -75,6 +134,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 {
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
+	rq->rb_tree_root = RB_ROOT_CACHED;
 	rq->current_entity = NULL;
 	rq->sched = sched;
 }
@@ -92,9 +152,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
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
 
@@ -111,23 +174,32 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 {
 	if (list_empty(&entity->list))
 		return;
+
 	spin_lock(&rq->lock);
+
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
 
+
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
 
@@ -163,6 +235,58 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
 	return NULL;
 }
 
+
+/**
+ * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
+ *
+ * @rq: scheduler run queue to check.
+ *
+ * Try to find a ready entity, returns NULL if none found.
+ */
+static struct drm_sched_entity *
+drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
+{
+		struct drm_sched_entity *first, *entity = NULL;
+		struct rb_node *rb;
+
+		spin_lock(&rq->lock);
+
+		rb = rb_first_cached(&rq->rb_tree_root);
+		if (!rb)
+			goto out;
+
+		first = rb_entry((rb), struct drm_sched_entity, rb_tree_node);
+		entity = first;
+
+		while (true) {
+
+			if (drm_sched_entity_is_ready(entity)) {
+				rq->current_entity = entity;
+				reinit_completion(&entity->entity_idle);
+				break;
+			}
+
+			/*
+			 * Push not ready entity to the end of the line so others
+			 * have chance
+			 */
+			drm_sched_rq_update_fifo_locked(entity, ktime_get());
+
+
+			rb = rb_first_cached(&rq->rb_tree_root);
+			entity =  rb_entry((rb), struct drm_sched_entity, rb_tree_node);
+
+			/* We completed full cycle */
+			if (!drm_sched_entity_is_ready(entity) && entity == first) {
+				entity = NULL;
+				break;
+			}
+		}
+out:
+		spin_unlock(&rq->lock);
+		return entity;
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -803,7 +927,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
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
index 599855c6a672..e3fdfb757d61 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -50,6 +50,13 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_UNSET = -2
 };
 
+/* Used to chose between FIFO and RR jobs scheduling */
+extern int drm_sched_policy;
+
+
+#define DRM_SCHED_POLICY_RR    0
+#define DRM_SCHED_POLICY_FIFO  1
+
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
  * attached to the DRM file_priv).
@@ -196,6 +203,21 @@ struct drm_sched_entity {
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
@@ -205,6 +227,7 @@ struct drm_sched_entity {
  * @sched: the scheduler to which this rq belongs to.
  * @entities: list of the entities to be scheduled.
  * @current_entity: the entity which is to be scheduled.
+ * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
  *
  * Run queue is a set of entities scheduling command submissions for
  * one specific ring. It implements the scheduling policy that selects
@@ -215,6 +238,7 @@ struct drm_sched_rq {
 	struct drm_gpu_scheduler	*sched;
 	struct list_head		entities;
 	struct drm_sched_entity		*current_entity;
+	struct rb_root_cached		rb_tree_root;
 };
 
 /**
@@ -314,6 +338,14 @@ struct drm_sched_job {
 
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned long			last_dependency;
+
+
+	/**
+	 * @submit_ts:
+	 *
+	 * When the job was pushed into the entity queue.
+	 */
+	ktime_t                         submit_ts;
 };
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
@@ -503,6 +535,9 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
+void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
+
+
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
 			  struct drm_gpu_scheduler **sched_list,
-- 
2.25.1

