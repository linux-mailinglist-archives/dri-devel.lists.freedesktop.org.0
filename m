Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7752E912E2C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 21:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC9F10E1A7;
	Fri, 21 Jun 2024 19:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED2D10E0D8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 19:59:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sKkPn-0006JL-TM; Fri, 21 Jun 2024 21:59:19 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sKkPn-0040xj-Bj; Fri, 21 Jun 2024 21:59:19 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de
Subject: [PATCH] drm/etnaviv: don't block scheduler when GPU is still active
Date: Fri, 21 Jun 2024 21:59:19 +0200
Message-Id: <20240621195919.491217-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Since 45ecaea73883 ("drm/sched: Partial revert of 'drm/sched: Keep
s_fence->parent pointer'") still active jobs aren't put back in the
pending list on drm_sched_start(), as they don't have a active
parent fence anymore, so if the GPU is still working and the timeout
is extended, all currently active jobs will be freed.

To avoid prematurely freeing jobs that are still active on the GPU,
don't block the scheduler until we are fully committed to actually
reset the GPU.

As the current job is already removed from the pending list and
will not be put back when drm_sched_start() isn't called, we must
make sure to put the job back on the pending list when extending
the timeout.

Cc: stable@vger.kernel.org #6.0
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index c4b04b0dee16..62dcfdc7894d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -38,9 +38,6 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	u32 dma_addr;
 	int change;
 
-	/* block scheduler */
-	drm_sched_stop(&gpu->sched, sched_job);
-
 	/*
 	 * If the GPU managed to complete this jobs fence, the timout is
 	 * spurious. Bail out.
@@ -63,6 +60,9 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 		goto out_no_timeout;
 	}
 
+	/* block scheduler */
+	drm_sched_stop(&gpu->sched, sched_job);
+
 	if(sched_job)
 		drm_sched_increase_karma(sched_job);
 
@@ -76,8 +76,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 
 out_no_timeout:
-	/* restart scheduler after GPU is usable again */
-	drm_sched_start(&gpu->sched, true);
+	list_add(&sched_job->list, &sched_job->sched->pending_list);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
-- 
2.39.2

