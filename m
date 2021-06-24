Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364533B30FA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DDE6EBAA;
	Thu, 24 Jun 2021 14:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644356EBAA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:08:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ED32C1F43FA3;
 Thu, 24 Jun 2021 15:08:54 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: Declare entity idle only after HW submission
Date: Thu, 24 Jun 2021 16:08:50 +0200
Message-Id: <20210624140850.2229697-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panfrost driver tries to kill in-flight jobs on FD close after
destroying the FD scheduler entities. For this to work properly, we
need to make sure the jobs popped from the scheduler entities have
been queued at the HW level before declaring the entity idle, otherwise
we might iterate over a list that doesn't contain those jobs.

Suggested-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 81496ae2602e..aa776ebe326a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -811,10 +811,10 @@ static int drm_sched_main(void *param)
 
 		sched_job = drm_sched_entity_pop_job(entity);
 
-		complete(&entity->entity_idle);
-
-		if (!sched_job)
+		if (!sched_job) {
+			complete(&entity->entity_idle);
 			continue;
+		}
 
 		s_fence = sched_job->s_fence;
 
@@ -823,6 +823,7 @@ static int drm_sched_main(void *param)
 
 		trace_drm_run_job(sched_job, entity);
 		fence = sched->ops->run_job(sched_job);
+		complete(&entity->entity_idle);
 		drm_sched_fence_scheduled(s_fence);
 
 		if (!IS_ERR_OR_NULL(fence)) {
-- 
2.31.1

