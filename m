Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630EC3C299C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032006EA64;
	Fri,  9 Jul 2021 19:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52326EA64
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:22 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so27318108wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7RL+gelPRYv1G4mkEK207BAuP32P4MhtT+apt0LN9h0=;
 b=Da3mU7OFnOmi8aDlmuid7jJW6s5L4PZFXtbdk866ry5O3vO5nnLfK4lsscF/1BItgu
 GcCjVX7mJLPEsTcpsrlkzVAm+InZzN/zI5vUEuy+X25C2MocA/7pUGis8E9F162NoBmU
 u0cyNG/C+tcIa/d/5nN6dfL0z5VUrVt9Kvc3gwrIRp8nOEiurs4lz5fTE91uTENXKYvX
 P9MURKWZg5YjgChPmFiVciMwlrKS46OB7wfB7JKa2fTGXUlpr9w+t5FrjpsAThj89C8v
 5dOwF6p9NGn+NeaHlT+MBMHim3lXsQ750Xt7MliEXBYzVXV+n7is/ECL8rkJZaIs/nho
 pxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7RL+gelPRYv1G4mkEK207BAuP32P4MhtT+apt0LN9h0=;
 b=EGfI2HkNcyxx57tuqc9Wsmng5WUCW0K+xuW6OM7lHpqXjJ+wforjK1X+gzwkhG8HUi
 Chwu+wWQJvyoMNSLh4oaN0vrWkBs+hZoQkKkEF7iWINwutUbxke9mI3Pu+Uexi2GwrS4
 ZdTp1JpE4KvPIMf/hgXXHqJ/SQesMK2tOvbCMGNjUWEXq3EIjc23mnNr8SSou76/kUsd
 gTBogjbx7jxKMnfXjBneO9UgxYpEXRtEMCTCuObSdQPlsLvpLSgvDr2+TsXa7nNeqNnr
 wCl0K8euskUBVwrqdoyYUkqhIt7yUer2iGOk6ckXEQOfxf2WkPolSIxQeJIrvqc6sZ2r
 Y+EQ==
X-Gm-Message-State: AOAM530YoCPAKvcWT6vqrsfToyndjzZQbSEZ+2Y0LX63UE0svVUYlENX
 dRHPPd91eIq1jTW7ZPsNCiw=
X-Google-Smtp-Source: ABdhPJzKd3NFsuCNsaMjdB4WcFHwHYKGEX9XAfnZxsrEjVl40+MNPfQAfpCaiWa4bib0ijlduHqxrA==
X-Received: by 2002:a05:600c:3541:: with SMTP id
 i1mr508522wmq.135.1625858961472; 
 Fri, 09 Jul 2021 12:29:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id o7sm7121431wrv.72.2021.07.09.12.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 02/14] gpu: host1x: Add no-recovery mode
Date: Fri,  9 Jul 2021 21:31:34 +0200
Message-Id: <20210709193146.2859516-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

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
Signed-off-by: Thierry Reding <treding@nvidia.com>
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
index f96c237b2242..739250acd498 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -201,6 +201,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
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
index 59e4a3bea0b0..5fc12db94ca1 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -237,9 +237,15 @@ struct host1x_job {
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
@@ -260,6 +266,9 @@ struct host1x_job {
 
 	/* Add a channel wait for previous ops to complete */
 	bool serialize;
+
+	/* Fast-forward syncpoint increments on job timeout */
+	bool syncpt_recovery;
 };
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-- 
2.32.0

