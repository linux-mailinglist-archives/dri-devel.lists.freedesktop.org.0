Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE1E1DEC14
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 17:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A066E071;
	Fri, 22 May 2020 15:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C54796E071
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 15:37:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EE4F55D;
 Fri, 22 May 2020 08:37:06 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0046D3F305;
 Fri, 22 May 2020 08:37:04 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Fix inbalance of devfreq record_busy/idle()
Date: Fri, 22 May 2020 16:36:53 +0100
Message-Id: <20200522153653.40754-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The calls to panfrost_devfreq_record_busy() and
panfrost_devfreq_record_idle() must be balanced to ensure that the
devfreq utilisation is correctly reported. But there are two cases where
this doesn't work correctly.

In panfrost_job_hw_submit() if pm_runtime_get_sync() fails or the
WARN_ON() fires then no call to panfrost_devfreq_record_busy() is made,
but when the job times out the corresponding _record_idle() call is
still made in panfrost_job_timedout(). Move the call up to ensure that
it always happens.

Secondly panfrost_job_timedout() only makes a single call to
panfrost_devfreq_record_idle() even if it is cleaning up multiple jobs.
Move the call inside the loop to ensure that the number of
_record_idle() calls matches the number of _record_busy() calls.

Fixes: 9e62b885f715 ("drm/panfrost: Simplify devfreq utilisation tracking")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index b2f09c038d35..ac87ef675e8a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -145,6 +145,8 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	u64 jc_head = job->jc;
 	int ret;
 
+	panfrost_devfreq_record_busy(pfdev);
+
 	ret = pm_runtime_get_sync(pfdev->dev);
 	if (ret < 0)
 		return;
@@ -155,7 +157,6 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	}
 
 	cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
-	panfrost_devfreq_record_busy(pfdev);
 
 	job_write(pfdev, JS_HEAD_NEXT_LO(js), jc_head & 0xFFFFFFFF);
 	job_write(pfdev, JS_HEAD_NEXT_HI(js), jc_head >> 32);
@@ -410,12 +411,12 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		if (pfdev->jobs[i]) {
 			pm_runtime_put_noidle(pfdev->dev);
+			panfrost_devfreq_record_idle(pfdev);
 			pfdev->jobs[i] = NULL;
 		}
 	}
 	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
 
-	panfrost_devfreq_record_idle(pfdev);
 	panfrost_device_reset(pfdev);
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
