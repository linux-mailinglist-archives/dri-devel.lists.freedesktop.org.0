Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5741D5ABC6A
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 04:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A081710E66B;
	Sat,  3 Sep 2022 02:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90DE10E66B;
 Sat,  3 Sep 2022 02:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT5lVAZktX/9cMYqf74FXQqs3/coFcoMV89tT85NwAiOJEOnft7TEGrLTEXXDiBslwDLN00uuvAFBbF4AQVpK/29GXoQn2jbUAtfpyT8YntMlERoLCyp5f/drhUazKAutUrb7OG82dy4GhOkHrSiFRXy3OgOi0jfV2vfx1uaLJY1li4uLd2iMgU4j294cSN0dEvvbAJRPEazTS+tZ3R13Zm/4BAxMwhfCKDVPJRA6v2+zfZfup/NGMoVWB50GxJMgbpfVwzM6qHKixmtCqd0QSAGFe+Ki55Md5pMLNgYJP3IysKtmW0CjSmaWyHzYfmu60s549MzNmvSxSF9Y+msVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91D0LPcxtpQLCNmNQSEWxugRoegJTY8l4tK6ThF4kmk=;
 b=gbL2zRJa70s93UVb711t6waIpWtsOeROMCBHSrHDtPWgdA1Woga772BBvy5oyq9G1lw8B4YmCYKlMMw8wf3giHQmq+Zt9I1OlZN90Mty+qV3BN2FnyynessTEGVoI5i4lIp6oehuxzMAps3zgLzoxpXQfDg7Q5UV7YV8jdlszrOViN625QgQCJXsvUGO4lyGobIs0xlmDPRm8R4wLWZEeRqzF7BhOI/iFzqE9rKzf2dOHijBS4PF/EmT9p+YgnUpt8TB7IH9nyy+BZvc0rWU4BuXAvBf6AA6afSI3lcob8JhN1hj2G02vEQxh+Xgqy8YbhCTH0ag7Ikcq+V+t51w4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91D0LPcxtpQLCNmNQSEWxugRoegJTY8l4tK6ThF4kmk=;
 b=Qfr2wN08dxenY9j0HR58fhogl/j1B6tBbd3v5L3b5cEX5TDcNZm59tIKm2vWDrdlALdQ9IIl2u1W8ZOXL/13CtF5iVF+PgFvuB6LqosqTmwJol8+fpWWk3h48DngzlLe9uI2D1fQ7hSCGOPU4ZhOsD+YTd0QIAmRkfs389NR3pg=
Received: from MW2PR2101CA0026.namprd21.prod.outlook.com (2603:10b6:302:1::39)
 by DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:bb::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.12; Sat, 3 Sep 2022 02:48:42 +0000
Received: from CO1PEPF00001A61.namprd05.prod.outlook.com
 (2603:10b6:302:1:cafe::bb) by MW2PR2101CA0026.outlook.office365.com
 (2603:10b6:302:1::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.9 via Frontend
 Transport; Sat, 3 Sep 2022 02:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF00001A61.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.7 via Frontend Transport; Sat, 3 Sep 2022 02:48:42 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 2 Sep 2022 21:48:40 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/sced: Add FIFO sched policy to rq
Date: Fri, 2 Sep 2022 22:48:17 -0400
Message-ID: <20220903024817.528107-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06ef4d38-7357-4c63-1d13-08da8d56d00f
X-MS-TrafficTypeDiagnostic: DM4PR12MB6663:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uDdQO79aPJiXwNtnxKU0cHBlia8CVATHAX+7m3BUMjHkrQdUZlqaWhz8wyQKTNlvdZ2pr/munYTkaOAnS833mdD5e2z7FYouuRCree5xXQcFLb+1XgoEauSyqKOm9TlMEVrZqqEMQKFIMQr/YVA5vYi/hsxcYD8nyWKUp6v8zD5bSHezKdUmzHokDaCweJeuEJTkLFFN9LhV+FJxJVO2AckbDLnskmk3dSFO1+SBh4OCB5axr/WrnewpqV3zz59nYSd1rbmFW200ntncW/HVu4QTVcVS6H+WKGEDk8VVHa4svzjfkluN4x8vukA61CN+crb58KYkxZf9bN3KovJpW6LQb/4ssw11CC2ekDHYRre1M62em0J2/wlHXsKmGR7aGeai0GblfrwxUdS9N3G0tsXxQeb40y8eZ+i1WgjcZ9EUMUfCzaMcf2ashNUSGFZ6AcvQSQetIZlwcCh4r/h74gK3tt4LKbv/JDD02B0XUvsc2LNxUBnBdBY9c4FScMkHrrqxqmNnPmyL1Sjc38cvFVEsJsakyf2O8/fCgz1pGhK3Z/AZJwYLT2HBuCWSrDltQJ+KRRpE0jkvTLGU/ncWEQfZcVrZrvlJzdbsB61quIGvbzJhZW1PSqvJpTbnTfLEimrPtwpiOHUMWchxqSOGMj1MSae2l+2dhGxG6ANoKsZ//JnVNQy71+MlyevrJNHvlWm++c0veK8BAS9zV2ullo5yobZ3lF20NkbvNZY/dv4PMdWaLtE0q+lBBtwv1FSwlHD8pCu4FIQ0eT7KBzIFz/hSI+8bsiI0f2U6O6zSpDo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(40470700004)(36840700001)(86362001)(7696005)(83380400001)(356005)(81166007)(36756003)(426003)(2616005)(47076005)(186003)(1076003)(336012)(26005)(41300700001)(36860700001)(6666004)(54906003)(6916009)(316002)(40480700001)(82310400005)(70586007)(4326008)(16526019)(478600001)(8676002)(70206006)(2906002)(30864003)(44832011)(40460700003)(5660300002)(82740400003)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2022 02:48:42.1826 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ef4d38-7357-4c63-1d13-08da8d56d00f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00001A61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663
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
Cc: ckoenig.leichtzumerken@gmail.com, Li
 Yunxiang <Yunxiang.Li@amd.com>, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Poblem: Given many entities competing for same rq on
same scheduler an uncceptabliy long wait time for some
jobs waiting stuck in rq before being picked up are
observed (seen using  GPUVis).
The issue is due to Round Robin policy used by scheduler
to pick up the next entity for execution. Under stress
of many entities and long job queus within entity some
jobs could be stack for very long time in it's entity's
queue before being popped from the queue and executed
while for other entites with samller job queues a job
might execute ealier even though that job arrived later
then the job in the long queue.

Fix:
Add FIFO selection policy to entites in RQ, chose next enitity
on rq in such order that if job on one entity arrived
ealrier then job on another entity the first job will start
executing ealier regardless of the length of the entity's job
queue.

v2:
Switch to rb tree structure for entites based on TS of
oldest job waiting in job queue of enitity. Improves next
enitity extraction to O(1). Enitity TS update
O(log(number of entites in rq))

Drop default option in module control parameter.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  29 ++++-
 drivers/gpu/drm/scheduler/sched_main.c   | 131 ++++++++++++++++++++++-
 include/drm/gpu_scheduler.h              |  29 +++++
 3 files changed, 183 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 191c56064f19..65ae4be2248b 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -33,6 +33,8 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
+extern int drm_sched_policy;
+
 /**
  * drm_sched_entity_init - Init a context entity used by scheduler when
  * submit to HW ring.
@@ -73,6 +75,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->priority = priority;
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
 	entity->last_scheduled = NULL;
+	RB_CLEAR_NODE(&entity->rb_tree_node);
 
 	if(num_sched_list)
 		entity->rq = &sched_list[0]->sched_rq[entity->priority];
@@ -417,14 +420,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
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
@@ -443,6 +448,17 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	smp_wmb();
 
 	spsc_queue_pop(&entity->job_queue);
+
+	/*
+	 * It's when head job is extracted we can access the next job (or empty)
+	 * queue and update the entity location in the min heap accordingly.
+	 */
+skip:
+	if (drm_sched_policy == 1)
+		drm_sched_rq_update_fifo(entity,
+					 (sched_job ? sched_job->submit_ts : ktime_get()),
+					 false);
+
 	return sched_job;
 }
 
@@ -502,11 +518,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
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
@@ -518,8 +536,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			DRM_ERROR("Trying to push to a killed entity\n");
 			return;
 		}
+
 		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
+
+		if (drm_sched_policy == 1)
+			drm_sched_rq_update_fifo(entity, ts,  false);
+
 		drm_sched_wakeup(entity->rq->sched);
 	}
 }
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c5437ee03e3f..4d2450b3f5bd 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -62,6 +62,62 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
+int drm_sched_policy = 0;
+
+/**
+ * DOC: sched_policy (int)
+ * Used to override default entites scheduling policy in a run queue.
+ */
+MODULE_PARM_DESC(sched_policy,
+	"specify schedule policy for entites on a runqueue (0 = Round Robin (default) ,1  = use FIFO");
+module_param_named(sched_policy, drm_sched_policy, int, 0444);
+
+static __always_inline bool drm_sched_entity_compare_earlier(struct rb_node *a,
+							     const struct rb_node *b)
+{
+	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
+	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
+
+	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
+}
+
+static inline void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+						   ktime_t ts, bool remove_only)
+{
+	struct drm_sched_rq *rq = entity->rq;
+
+	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
+		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
+		RB_CLEAR_NODE(&entity->rb_tree_node);
+	}
+
+	if (remove_only)
+		return;
+
+	entity->oldest_job_waiting = ts;
+
+	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
+		      drm_sched_entity_compare_earlier);
+}
+
+void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts,
+			      bool remove_only)
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
+	drm_sched_rq_update_fifo_locked(entity, ts, remove_only);
+
+	spin_unlock(&entity->rq->lock);
+	spin_unlock(&entity->rq_lock);
+}
+
 /**
  * drm_sched_rq_init - initialize a given run queue struct
  *
@@ -75,6 +131,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 {
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
+	rq->rb_tree_root = RB_ROOT_CACHED;
 	rq->current_entity = NULL;
 	rq->sched = sched;
 }
@@ -92,9 +149,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
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
 
@@ -111,23 +171,32 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
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
+	if (drm_sched_policy == 1)
+		drm_sched_rq_update_fifo_locked(entity, 0, true);
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
 
@@ -163,6 +232,59 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
 	return NULL;
 }
 
+
+/**
+ * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
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
+		spin_lock(&rq->lock);
+
+		rb = rb_first_cached(&rq->rb_tree_root);
+		if (!rb)
+			goto out;
+
+		first = rb_entry((rb), struct drm_sched_entity, rb_tree_node);
+		entity = first;
+
+		while(true){
+
+
+
+			if (drm_sched_entity_is_ready(entity)) {
+				rq->current_entity = entity;
+				reinit_completion(&entity->entity_idle);
+				break;
+			} else {
+				/*
+				 * Push not ready entity to the end of the line so others
+				 * have chance
+				 */
+				drm_sched_rq_update_fifo_locked(entity, ktime_get(), false);
+			}
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
+
+	out:
+		spin_unlock(&rq->lock);
+		return entity;
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -592,6 +714,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
+
 	drm_sched_entity_select_rq(entity);
 	if (!entity->rq)
 		return -ENOENT;
@@ -801,7 +924,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
+		entity = drm_sched_policy != 1 ?
+				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
+				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 944f83ef9f2e..9fb20c963c5c 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -196,6 +196,21 @@ struct drm_sched_entity {
 	 * drm_sched_entity_fini().
 	 */
 	struct completion		entity_idle;
+
+	/**
+	 * @oldest_job_waiting:
+	 *
+	 * Marks earliest job waiting in SW queue
+	 */
+	ktime_t 			oldest_job_waiting;
+
+	/**
+	 * @rb_tree_node:
+	 *
+	 * To insert this entity into time based priority queue
+	 */
+	struct rb_node 			rb_tree_node;
+
 };
 
 /**
@@ -205,6 +220,7 @@ struct drm_sched_entity {
  * @sched: the scheduler to which this rq belongs to.
  * @entities: list of the entities to be scheduled.
  * @current_entity: the entity which is to be scheduled.
+ * @rb_tree_root: root of time based priory queue of entites for FIFO scheduling
  *
  * Run queue is a set of entities scheduling command submissions for
  * one specific ring. It implements the scheduling policy that selects
@@ -215,6 +231,7 @@ struct drm_sched_rq {
 	struct drm_gpu_scheduler	*sched;
 	struct list_head		entities;
 	struct drm_sched_entity		*current_entity;
+	struct rb_root_cached 		rb_tree_root;
 };
 
 /**
@@ -313,6 +330,14 @@ struct drm_sched_job {
 
 	/** @last_dependency: tracks @dependencies as they signal */
 	unsigned long			last_dependency;
+
+
+	/**
+	* @submit_ts:
+	*
+	* Marks job submit time
+	*/
+	ktime_t                         submit_ts;
 };
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
@@ -501,6 +526,10 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
+void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts,
+			      bool remove_only);
+
+
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
 			  struct drm_gpu_scheduler **sched_list,
-- 
2.25.1

