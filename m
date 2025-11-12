Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DECC50F32
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DABA10E6C8;
	Wed, 12 Nov 2025 07:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t+Uy7WT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383FF10E6BB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:31:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 41BFD60215;
 Wed, 12 Nov 2025 07:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D9EC116B1;
 Wed, 12 Nov 2025 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762932712;
 bh=mukyEYZU61HPqq/3z4Of9cSo849HTj7DUQobL9BMk4g=;
 h=From:To:Cc:Subject:Date:From;
 b=t+Uy7WT2gYSfhVWGNM8ovrPlC07Dndkkgj4V5Du4KyJq/FQ+1aHq7jEJBBSklk1hs
 uwxvniCj+ekwRrNOyEQ2CfhJ+q23NjTi2AooXxGSAXnCuSj4UwkaqqO/KkhqWxzl4e
 dZJYI5eaMIIylUUjumS2mt5gCIXUEaK91A2WY2go9XURMKfvmR1NHN/4A5DmQVN+bO
 8y+XqI95NAtaaqDN9D6n+IwaEjHEXY1D1LZS6MCSfay0HQvOLDVpPqMOG2BeyukAZ4
 pb30at2kxnSqpXakHja4Vyfh+17DKs9+WdJdJMJVqxScOEj4xN8eP36Ob+TTkZTQdb
 O05ud4uuReC8Q==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Document racy behavior of
 drm_sched_entity_push_job()
Date: Wed, 12 Nov 2025 08:31:39 +0100
Message-ID: <20251112073138.93355-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

drm_sched_entity_push_job() uses the unlocked spsc_queue. It takes a
reference to that queue's tip at the start, and some time later removes
that entry from that list, without locking or protection against
preemption.

This is by design, since the spsc_queue demands single producer and
single consumer. It was, however, never documented.

Document that you must not call drm_sched_entity_push_job() in parallel
for the same entity.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 5a4697f636f2..b31e8d14aa20 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -562,6 +562,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
  * drm_sched_entity_push_job - Submit a job to the entity's job queue
  * @sched_job: job to submit
  *
+ * It is illegal to call this function in parallel, at least for jobs belonging
+ * to the same entity. Doing so leads to undefined behavior.
+ *
  * Note: To guarantee that the order of insertion to queue matches the job's
  * fence sequence number this function should be called with drm_sched_job_arm()
  * under common lock for the struct drm_sched_entity that was set up for
-- 
2.49.0

