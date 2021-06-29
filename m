Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB223B6ECE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 09:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380C36E7EC;
	Tue, 29 Jun 2021 07:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C6A6E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 07:35:16 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DDEA51F42EB4;
 Tue, 29 Jun 2021 08:35:14 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/16] drm/sched: Document what the timedout_job method
 should do
Date: Tue, 29 Jun 2021 09:34:55 +0200
Message-Id: <20210629073510.2764391-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629073510.2764391-1-boris.brezillon@collabora.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation is a bit vague and doesn't really describe what the
->timedout_job() is expected to do. Let's add a few more details.

v5:
* New patch

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/drm/gpu_scheduler.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 10225a0a35d0..65700511e074 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -239,6 +239,20 @@ struct drm_sched_backend_ops {
 	 * @timedout_job: Called when a job has taken too long to execute,
 	 * to trigger GPU recovery.
 	 *
+	 * This method is called in a workqueue context.
+	 *
+	 * Drivers typically issue a reset to recover from GPU hangs, and this
+	 * procedure usually follows the following workflow:
+	 *
+	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
+	 *    scheduler thread and cancel the timeout work, guaranteeing that
+	 *    nothing is queued while we reset the hardware queue
+	 * 2. Try to gracefully stop non-faulty jobs (optional)
+	 * 3. Issue a GPU reset (driver-specific)
+	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
+	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
+	 *    jobs can be queued, and the scheduler thread is unblocked
+	 *
 	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
 	 * and the underlying driver has started or completed recovery.
 	 *
-- 
2.31.1

