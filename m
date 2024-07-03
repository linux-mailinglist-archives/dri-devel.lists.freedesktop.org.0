Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC20926556
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A6310E920;
	Wed,  3 Jul 2024 15:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2935E10E920
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:56:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6041367;
 Wed,  3 Jul 2024 08:57:23 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com
 [10.1.37.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D8C23F766;
 Wed,  3 Jul 2024 08:56:57 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH] drm/panthor: Record devfreq busy as soon as a job is started
Date: Wed,  3 Jul 2024 16:56:46 +0100
Message-Id: <20240703155646.80928-1-steven.price@arm.com>
X-Mailer: git-send-email 2.34.1
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

If a queue is already assigned to the hardware, then a newly submitted
job can start straight away without waiting for the tick. However in
this case the devfreq infrastructure isn't notified that the GPU is
busy. By the time the tick happens the job might well have finished and
no time will be accounted for the GPU being busy.

Fix this by recording the GPU as busy directly in queue_run_job() in the
case where there is a CSG assigned and therefore we just ring the
doorbell.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 951ff7e63ea8..e7afaa1ad8dc 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2942,6 +2942,7 @@ queue_run_job(struct drm_sched_job *sched_job)
 			pm_runtime_get(ptdev->base.dev);
 			sched->pm.has_ref = true;
 		}
+		panthor_devfreq_record_busy(sched->ptdev);
 	}
 
 	/* Update the last fence. */
-- 
2.39.2

