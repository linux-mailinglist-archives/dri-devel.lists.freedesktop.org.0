Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A03950FF
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 14:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ECC6E4BA;
	Sun, 30 May 2021 12:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E9B6E5A2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9n4ilDFeEZkrMt2fapteRcChbmDyKI5GaTGTuSDYSI0=; b=W/6Lo+fhtWCJ3ftaGxX6B1ehA8
 wsdt88OvBIRRpS/8FY8fNT8AUclaF8moPZDwb5Fq3Er9G4kmhKtIkasX7DQfdEkPd4zNRtZE02c1m
 G8XHKl+4s/RCeLhoPW1D2PrbI9zLkrU3XkPPgy8PEioyNrQxdfzU251xjJ3L0ek2O0fpWppGJEMn6
 8qnHOSUHmFhNBAs1/zBb+PY9aDQcSG0kCmBIi1bCLBGB49VsGpLfnNnCE9ZOUYLUtre9ti/JJFL8p
 Jq8N60L7lq/b0FvHjVL1gl0rQf4gd0Borq5hv4pXFK/dlboY+54OIMmLUS3RM4D/svqqIr4Q6lVlK
 fIjxci6Q==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lnKSP-000775-OS; Sun, 30 May 2021 15:22:17 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v6 02/14] gpu: host1x: Add no-recovery mode
Date: Sun, 30 May 2021 15:21:44 +0300
Message-Id: <20210530122156.3292479-3-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210530122156.3292479-1-mperttunen@nvidia.com>
References: <20210530122156.3292479-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new property for jobs to enable or disable recovery i.e.
CPU increments of syncpoints to max value on job timeout. This
allows for a more solid model for hanged jobs, where userspace
doesn't need to guess if a syncpoint increment happened because
the job completed, or because job timeout was triggered.

On job timeout, we stop the channel, NOP all future jobs on the
channel using the same syncpoint, mark the syncpoint as locked
and resume the channel from the next job, if any.

The future jobs are NOPed, since because we don't do the CPU
increments, the value of the syncpoint is no longer synchronized,
and any waiters would become confused if a future job incremented
the syncpoint. The syncpoint is marked locked to ensure that any
future jobs cannot increment the syncpoint either, until the
application has recognized the situation and reallocated the
syncpoint.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Update for change in put_ref prototype.
* Fixed typo in comment.
v3:
* Move 'locked' check inside CDMA lock to prevent race
* Add clarifying comment to NOP-patching code
---
 drivers/gpu/drm/tegra/drm.c        |  1 +
 drivers/gpu/host1x/cdma.c          | 58 ++++++++++++++++++++++++++----
 drivers/gpu/host1x/hw/channel_hw.c |  2 +-
 drivers/gpu/host1x/job.c           |  4 +++
 drivers/gpu/host1x/syncpt.c        |  2 ++
 drivers/gpu/host1x/syncpt.h        | 12 +++++++
 include/linux/host1x.h             |  9 +++++
 7 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ce5bdc58d315..992aa5cde510 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -200,6 +200,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	job->client = client;
 	job->class = client->class;
 	job->serialize = true;
+	job->syncpt_recovery = true;
 
 	/*
 	 * Track referenced BOs so that they can be unreferenced after the
diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 6e6ca774f68d..765e5aa64eb6 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -312,10 +312,6 @@ static void update_cdma_locked(struct host1x_cdma *cdma)
 	bool signal = false;
 	struct host1x_job *job, *n;
 
-	/* If CDMA is stopped, queue is cleared and we can return */
-	if (!cdma->running)
-		return;
-
 	/*
 	 * Walk the sync queue, reading the sync point registers as necessary,
 	 * to consume as many sync queue entries as possible without blocking
@@ -324,7 +320,8 @@ static void update_cdma_locked(struct host1x_cdma *cdma)
 		struct host1x_syncpt *sp = job->syncpt;
 
 		/* Check whether this syncpt has completed, and bail if not */
-		if (!host1x_syncpt_is_expired(sp, job->syncpt_end)) {
+		if (!host1x_syncpt_is_expired(sp, job->syncpt_end) &&
+		    !job->cancelled) {
 			/* Start timer on next pending syncpt */
 			if (job->timeout)
 				cdma_start_timer_locked(cdma, job);
@@ -413,8 +410,11 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 	else
 		restart_addr = cdma->last_pos;
 
+	if (!job)
+		goto resume;
+
 	/* do CPU increments for the remaining syncpts */
-	if (job) {
+	if (job->syncpt_recovery) {
 		dev_dbg(dev, "%s: perform CPU incr on pending buffers\n",
 			__func__);
 
@@ -433,8 +433,44 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 
 		dev_dbg(dev, "%s: finished sync_queue modification\n",
 			__func__);
+	} else {
+		struct host1x_job *failed_job = job;
+
+		host1x_job_dump(dev, job);
+
+		host1x_syncpt_set_locked(job->syncpt);
+		failed_job->cancelled = true;
+
+		list_for_each_entry_continue(job, &cdma->sync_queue, list) {
+			unsigned int i;
+
+			if (job->syncpt != failed_job->syncpt)
+				continue;
+
+			for (i = 0; i < job->num_slots; i++) {
+				unsigned int slot = (job->first_get/8 + i) %
+						    HOST1X_PUSHBUFFER_SLOTS;
+				u32 *mapped = cdma->push_buffer.mapped;
+
+				/*
+				 * Overwrite opcodes with 0 word writes
+				 * to offset 0xbad. This does nothing but
+				 * has a easily detected signature in debug
+				 * traces.
+				 */
+				mapped[2*slot+0] = 0x1bad0000;
+				mapped[2*slot+1] = 0x1bad0000;
+			}
+
+			job->cancelled = true;
+		}
+
+		wmb();
+
+		update_cdma_locked(cdma);
 	}
 
+resume:
 	/* roll back DMAGET and start up channel again */
 	host1x_hw_cdma_resume(host1x, cdma, restart_addr);
 }
@@ -490,6 +526,16 @@ int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job *job)
 
 	mutex_lock(&cdma->lock);
 
+	/*
+	 * Check if syncpoint was locked due to previous job timeout.
+	 * This needs to be done within the cdma lock to avoid a race
+	 * with the timeout handler.
+	 */
+	if (job->syncpt->locked) {
+		mutex_unlock(&cdma->lock);
+		return -EPERM;
+	}
+
 	if (job->timeout) {
 		/* init state on first submit with timeout value */
 		if (!cdma->timeout.initialized) {
diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index d4c28faf27d1..bf21512e5078 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -191,7 +191,7 @@ static int channel_submit(struct host1x_job *job)
 	/* schedule a submit complete interrupt */
 	err = host1x_intr_add_action(host, sp, syncval,
 				     HOST1X_INTR_ACTION_SUBMIT_COMPLETE, ch,
-				     completed_waiter, NULL);
+				     completed_waiter, &job->waiter);
 	completed_waiter = NULL;
 	WARN(err, "Failed to set submit complete interrupt");
 
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index adbdc225de8d..8f59b34672c2 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -79,6 +79,10 @@ static void job_free(struct kref *ref)
 {
 	struct host1x_job *job = container_of(ref, struct host1x_job, ref);
 
+	if (job->waiter)
+		host1x_intr_put_ref(job->syncpt->host, job->syncpt->id,
+				    job->waiter, false);
+
 	if (job->syncpt)
 		host1x_syncpt_put(job->syncpt);
 
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index e648ebbb2027..d198a10848c6 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -407,6 +407,8 @@ static void syncpt_release(struct kref *ref)
 
 	atomic_set(&sp->max_val, host1x_syncpt_read(sp));
 
+	sp->locked = false;
+
 	mutex_lock(&sp->host->syncpt_mutex);
 
 	host1x_syncpt_base_free(sp->base);
diff --git a/drivers/gpu/host1x/syncpt.h b/drivers/gpu/host1x/syncpt.h
index a6766f8d55ee..93e894677d89 100644
--- a/drivers/gpu/host1x/syncpt.h
+++ b/drivers/gpu/host1x/syncpt.h
@@ -40,6 +40,13 @@ struct host1x_syncpt {
 
 	/* interrupt data */
 	struct host1x_syncpt_intr intr;
+
+	/* 
+	 * If a submission incrementing this syncpoint fails, lock it so that
+	 * further submission cannot be made until application has handled the
+	 * failure.
+	 */
+	bool locked;
 };
 
 /* Initialize sync point array  */
@@ -115,4 +122,9 @@ static inline int host1x_syncpt_is_valid(struct host1x_syncpt *sp)
 	return sp->id < host1x_syncpt_nb_pts(sp->host);
 }
 
+static inline void host1x_syncpt_set_locked(struct host1x_syncpt *sp)
+{
+	sp->locked = true;
+}
+
 #endif
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index f2ea24fe0b0d..98dfb72e6c77 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -233,9 +233,15 @@ struct host1x_job {
 	u32 syncpt_incrs;
 	u32 syncpt_end;
 
+	/* Completion waiter ref */
+	void *waiter;
+
 	/* Maximum time to wait for this job */
 	unsigned int timeout;
 
+	/* Job has timed out and should be released */
+	bool cancelled;
+
 	/* Index and number of slots used in the push buffer */
 	unsigned int first_get;
 	unsigned int num_slots;
@@ -256,6 +262,9 @@ struct host1x_job {
 
 	/* Add a channel wait for previous ops to complete */
 	bool serialize;
+
+	/* Fast-forward syncpoint increments on job timeout */
+	bool syncpt_recovery;
 };
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-- 
2.30.1

