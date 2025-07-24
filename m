Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6CDB10D2D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B43410E98E;
	Thu, 24 Jul 2025 14:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="W9qcK/tD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14D810E97F;
 Thu, 24 Jul 2025 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Jng4+ppJH5wtJvlHtAwirfUpu0s+PDWanJvMf7vwcw=; b=W9qcK/tD0Hjm66oivd2Rrzcgl2
 HBfB9yOXA+sDp6lu9dQOfdO4c+yOSH85psQRXPYEq7N0vcMY8tI0vGEAZz7CWW0vfb3HjqkLpx6ee
 0QGsrxEmDsl3ejRdudFtCLeFKWeFPPlPaxuxdb6e1F9DANQVbyO68G8OvL8UC25TpWuC5sQ6C1vxY
 Ixgl0kmt0k+NyI4/+JVs6rxB9eMxCI1EAqiXsVS64sC11V9GADTH8bSyGr6nM6s2a5xULokXw3f27
 +Bi8jGl8Bv+BXqVhG59hB66vf7YFybGAA7eXush2aFxKZxrt2kLyLjcP8vRZgRaHsIomY+yAdrbOk
 00SesSDQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uewnC-003Dsl-TX; Thu, 24 Jul 2025 16:19:31 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [RFC v7 10/12] drm/sched: Break submission patterns with some
 randomness
Date: Thu, 24 Jul 2025 15:19:19 +0100
Message-ID: <20250724141921.75583-11-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
References: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

GPUs generally don't implement preemption and DRM scheduler definitely
does not support it at the front end scheduling level. This means
execution quanta can be quite long and is controlled by userspace,
consequence of which is picking the "wrong" entity to run can have a
larger negative effect than it would have with a virtual runtime based CPU
scheduler.

Another important consideration is that rendering clients often have
shallow submission queues, meaning they will be entering and exiting the
scheduler's runnable queue often.

Relevant scenario here is what happens when an entity re-joins the
runnable queue with other entities already present. One cornerstone of the
virtual runtime algorithm is to let it re-join at the head and depend on
the virtual runtime accounting to sort out the order after an execution
quanta or two.

However, as explained above, this may not work fully reliably in the GPU
world. Entity could always get to overtake the existing entities, or not,
depending on the submission order and rbtree equal key insertion
behaviour.

We can break this latching by adding some randomness for this specific
corner case.

If an entity is re-joining the runnable queue, was head of the queue the
last time it got picked, and there is an already queued different entity
of an equal scheduling priority, we can break the tie by randomly choosing
the execution order between the two.

For randomness we implement a simple driver global boolean which selects
whether new entity will be first or not. Because the boolean is global and
shared between all the run queues and entities, its actual effect can be
loosely called random. Under the assumption it will not always be the same
entity which is re-joining the queue under these circumstances.

Another way to look at this is that it is adding a little bit of limited
random round-robin behaviour to the fair scheduling algorithm.

Net effect is a significant improvemnt to the scheduling unit tests which
check the scheduling quality for the interactive client running in
parallel with GPU hogs.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/sched_rq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index d16ee3ee3653..087a6bdbb824 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -147,6 +147,16 @@ drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
 			 * Higher priority can go first.
 			 */
 			vruntime = -us_to_ktime(rq_prio - prio);
+		} else {
+			static const int shuffle[2] = { -100, 100 };
+			static bool r = 0;
+
+			/*
+			 * For equal priority apply some randomness to break
+			 * latching caused by submission patterns.
+			 */
+			vruntime = shuffle[r];
+			r ^= 1;
 		}
 	}
 
-- 
2.48.0

