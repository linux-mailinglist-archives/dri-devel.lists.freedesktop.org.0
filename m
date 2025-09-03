Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BF6B42538
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98210E927;
	Wed,  3 Sep 2025 15:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GLQ9RTqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F9010E918;
 Wed,  3 Sep 2025 15:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CLwx/0TzVEyIzWF6Q4ej0j1todm89w8SJx6+nTsjHVA=; b=GLQ9RTqx6pt9xEBn5zSNUBaIft
 /iTBtUcKJsBr6FLqrsR0imNkDoLvHZqgJZSrKSlJ4C67VbstzJe75wwnolzddpPIOwIl68LtogE4e
 vrJhVATeLTD49/L/wDztDhswns+h9fJT9dxoqqPZeg/gExMMatpK7xDolF9TPB4NCFFxKD6DkT/76
 9B/Qej6NVfZXdwmsv7MA9foMs5jum341fXlC8JMY0qe9Jb+S4/vo5t9Y/VR4inHqBWi4zbB2GoPH5
 XKn//oY9Bno/58fHBQfyso8ak/4ZFHXL0BEWmrt09cFr/UrHY0DPih7cuSiX6jykOe0nSjI3uN9kT
 gzZgJXug==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utpKr-006Gbk-P4; Wed, 03 Sep 2025 17:23:45 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 20/21] drm/xe: Allow changing GuC scheduling priority
Date: Wed,  3 Sep 2025 16:23:26 +0100
Message-ID: <20250903152327.66002-21-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently queue priority is fixed at the queue creation and communicated
to the GuC together with the other scheduling parameters. The upcoming
integration with the DRM scheduling cgroup controller will however want to
override it (the priority).

Add a new sideband message which allows communicating just the scheduling
priority to the GuC.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c          | 41 ++++++++++++++++++---
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 6731b13da8bb..ebe7dcef0ccd 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -23,6 +23,7 @@ struct xe_sched_msg {
 	void				*private_data;
 	/** @opcode: opcode of message (backend defined) */
 	unsigned int			opcode;
+	unsigned int			value;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1185b23b1384..86daf6f4728f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -448,6 +448,21 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
 }
 
+static void init_prio(struct xe_guc *guc, struct xe_exec_queue *q,
+		      enum xe_exec_queue_priority prio)
+{
+	struct exec_queue_policy policy;
+
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+
+	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
+	__guc_exec_queue_policy_add_priority(&policy,
+					     xe_exec_queue_prio_to_guc[prio]);
+
+	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
+		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
+}
+
 static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
@@ -1437,6 +1452,16 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
 	kfree(msg);
 }
 
+static void __guc_exec_queue_process_msg_set_sched_prio(struct xe_sched_msg *msg)
+{
+	struct xe_exec_queue *q = msg->private_data;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	if (guc_exec_queue_allowed_to_change_state(q))
+		init_prio(guc, q, msg->value);
+	kfree(msg);
+}
+
 static void __suspend_fence_signal(struct xe_exec_queue *q)
 {
 	if (!q->guc->suspend_pending)
@@ -1503,8 +1528,9 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 
 #define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
 #define SET_SCHED_PROPS	2
-#define SUSPEND		3
-#define RESUME		4
+#define SET_SCHED_PRIO	3
+#define SUSPEND		4
+#define RESUME		5
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
 
@@ -1521,6 +1547,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	case SET_SCHED_PROPS:
 		__guc_exec_queue_process_msg_set_sched_props(msg);
 		break;
+	case SET_SCHED_PRIO:
+		__guc_exec_queue_process_msg_set_sched_prio(msg);
+		break;
 	case SUSPEND:
 		__guc_exec_queue_process_msg_suspend(msg);
 		break;
@@ -1667,16 +1696,16 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 {
 	struct xe_sched_msg *msg;
 
-	if (q->sched_props.priority == priority ||
-	    exec_queue_killed_or_banned_or_wedged(q))
+	if (exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
-	q->sched_props.priority = priority;
-	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
+	msg->value = priority;
+
+	guc_exec_queue_add_msg(q, msg, SET_SCHED_PRIO);
 
 	return 0;
 }
-- 
2.48.0

