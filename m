Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78C6CA7616
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC7310EAD8;
	Fri,  5 Dec 2025 11:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5yxHO1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516E210EACB;
 Fri,  5 Dec 2025 11:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934113; x=1796470113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YM0S9YRPkMsnJhQBziwqmcHZ5gnMBgySagWnFSg9Rpw=;
 b=f5yxHO1JNxwoTnRLHSD+9YRGQIzclVNhm26hLkEQNkl+yt3iLyB1lCzp
 eJs0M5HzkL45p+SSzgs/HoZdsN1tV3U2MLGznI1vgGnCRSz5/Tvi2BDqv
 ZqgRDnt81SKyFwM8VqlPxJO2mtAijQVHzIRSNDpVD5RsI4EWpFvCC+yLd
 +I1fr5knbMIZ+EzVqJ40bfYQW6C3B8dXcapgWFiBtHiXWWxIOIPBuoNqS
 qiJ7Ul3gaadKQlxDr7dbQ6vSUt1HMXiKL0dBkjyPukq4JQjk5E4j/LiMn
 L0144X9bKEuFU3V3PvVF7i/fMW2uaqRada2aKehwMcB3N9R1I2Hd3Ufhd Q==;
X-CSE-ConnectionGUID: lxJNcrpvT/aHyZ/pMOcktQ==
X-CSE-MsgGUID: 96B4cRGcQ9GWlwwgPeD2GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66861926"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66861926"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:32 -0800
X-CSE-ConnectionGUID: 3LVKVR7DRPKSKGFZFP6JgA==
X-CSE-MsgGUID: +TFS4AksQk2DzVTgsZL9jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195188140"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 08/25] drm/vblank: pass vlank to
 drm_vblank_get()/_put()/_count()
Date: Fri,  5 Dec 2025 13:27:24 +0200
Message-ID: <082ee152882302ac775d12bde94d6e999d6d07c3.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Pass struct drm_vblank_crtc * to drm_vblank_get(), drm_vblank_put(), and
drm_vblank_count(). They'll figure out the vblank pointer as the first
thing anyway, so it's handy to pass it when available. We can also rely
on vblank having a valid pipe, and can reduce the number of checks we
do.

Rename the functions to drm_vblank_crtc_*() naming. Directly convert the
call sites that already have the vblank pointer available.

v2: Use drm_vblank_crtc_* naming (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_internal.h    |  6 +--
 drivers/gpu/drm/drm_vblank.c      | 69 +++++++++++++++++++------------
 drivers/gpu/drm/drm_vblank_work.c | 12 +++---
 3 files changed, 51 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index f893b1e3a596..6e7ac5b16d92 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -112,9 +112,9 @@ static inline bool drm_vblank_passed(u64 seq, u64 ref)
 }
 
 void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
-int drm_vblank_get(struct drm_device *dev, unsigned int pipe);
-void drm_vblank_put(struct drm_device *dev, unsigned int pipe);
-u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe);
+int drm_vblank_crtc_get(struct drm_vblank_crtc *vblank);
+void drm_vblank_crtc_put(struct drm_vblank_crtc *vblank);
+u64 drm_vblank_crtc_count(struct drm_vblank_crtc *vblank);
 
 /* drm_vblank_work.c */
 static inline void drm_vblank_flush_worker(struct drm_vblank_crtc *vblank)
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 498fc91450e6..aeb931c825ca 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -384,14 +384,10 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
 	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
 }
 
-u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
+u64 drm_vblank_crtc_count(struct drm_vblank_crtc *vblank)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	u64 count;
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return 0;
-
 	count = atomic64_read(&vblank->count);
 
 	/*
@@ -406,6 +402,14 @@ u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
 	return count;
 }
 
+static u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
+{
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
+		return 0;
+
+	return drm_vblank_crtc_count(drm_vblank_crtc(dev, pipe));
+}
+
 /**
  * drm_crtc_accurate_vblank_count - retrieve the master vblank counter
  * @crtc: which counter to retrieve
@@ -1210,18 +1214,16 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 	return ret;
 }
 
-int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
+int drm_vblank_crtc_get(struct drm_vblank_crtc *vblank)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
+	int pipe = vblank->pipe;
 	unsigned long irqflags;
 	int ret = 0;
 
 	if (!drm_dev_has_vblank(dev))
 		return -EINVAL;
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return -EINVAL;
-
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
 	/* Going from 0->1 means we have to enable interrupts again */
 	if (atomic_add_return(1, &vblank->refcount) == 1) {
@@ -1237,6 +1239,14 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 	return ret;
 }
 
+static int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
+{
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
+		return -EINVAL;
+
+	return drm_vblank_crtc_get(drm_vblank_crtc(dev, pipe));
+}
+
 /**
  * drm_crtc_vblank_get - get a reference count on vblank events
  * @crtc: which CRTC to own
@@ -1253,14 +1263,11 @@ int drm_crtc_vblank_get(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_get);
 
-void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
+void drm_vblank_crtc_put(struct drm_vblank_crtc *vblank)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
 	int vblank_offdelay = vblank->config.offdelay_ms;
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
 	if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
 		return;
 
@@ -1276,6 +1283,14 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 	}
 }
 
+static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
+{
+	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
+		return;
+
+	drm_vblank_crtc_put(drm_vblank_crtc(dev, pipe));
+}
+
 /**
  * drm_crtc_vblank_put - give up ownership of vblank events
  * @crtc: which counter to give up
@@ -1308,20 +1323,20 @@ int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 	int ret;
 	u64 last;
 
-	ret = drm_vblank_get(dev, pipe);
+	ret = drm_vblank_crtc_get(vblank);
 	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
 		     pipe, ret))
 		return ret;
 
-	last = drm_vblank_count(dev, pipe);
+	last = drm_vblank_crtc_count(vblank);
 
 	ret = wait_event_timeout(vblank->queue,
-				 last != drm_vblank_count(dev, pipe),
+				 last != drm_vblank_crtc_count(vblank),
 				 msecs_to_jiffies(1000));
 
 	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
 
-	drm_vblank_put(dev, pipe);
+	drm_vblank_crtc_put(vblank);
 
 	return ret ? 0 : -ETIMEDOUT;
 }
@@ -1368,7 +1383,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	wake_up(&vblank->queue);
 
 	/*
-	 * Prevent subsequent drm_vblank_get() from re-enabling
+	 * Prevent subsequent drm_vblank_crtc_get() from re-enabling
 	 * the vblank interrupt by bumping the refcount.
 	 */
 	if (!vblank->inmodeset) {
@@ -1424,7 +1439,7 @@ void drm_crtc_vblank_reset(struct drm_crtc *crtc)
 
 	spin_lock_irq(&dev->vbl_lock);
 	/*
-	 * Prevent subsequent drm_vblank_get() from enabling the vblank
+	 * Prevent subsequent drm_vblank_crtc_get() from enabling the vblank
 	 * interrupt by bumping the refcount.
 	 */
 	if (!vblank->inmodeset) {
@@ -1497,7 +1512,7 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 
 	vblank->config = *config;
 
-	/* Drop our private "prevent drm_vblank_get" refcount */
+	/* Drop our private "prevent drm_vblank_crtc_get" refcount */
 	if (vblank->inmodeset) {
 		atomic_dec(&vblank->refcount);
 		vblank->inmodeset = 0;
@@ -1639,9 +1654,9 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 
 	/*
 	 * drm_crtc_vblank_off() might have been called after we called
-	 * drm_vblank_get(). drm_crtc_vblank_off() holds event_lock around the
+	 * drm_vblank_crtc_get(). drm_crtc_vblank_off() holds event_lock around the
 	 * vblank disable, so no need for further locking.  The reference from
-	 * drm_vblank_get() protects against vblank disable from another source.
+	 * drm_vblank_crtc_get() protects against vblank disable from another source.
 	 */
 	if (!READ_ONCE(vblank->enabled)) {
 		ret = -EINVAL;
@@ -1667,7 +1682,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 		send_vblank_event(dev, e, seq, now);
 		vblwait->reply.sequence = seq;
 	} else {
-		/* drm_handle_vblank_events will call drm_vblank_put */
+		/* drm_handle_vblank_events will call drm_vblank_crtc_put */
 		list_add_tail(&e->base.link, &dev->vblank_event_list);
 		vblwait->reply.sequence = req_seq;
 	}
@@ -1830,7 +1845,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 
 	if (flags & _DRM_VBLANK_EVENT) {
 		/* must hold on to the vblank ref until the event fires
-		 * drm_vblank_put will be called asynchronously
+		 * drm_vblank_crtc_put will be called asynchronously
 		 */
 		return drm_queue_vblank_event(dev, pipe, req_seq, vblwait, file_priv);
 	}
@@ -2148,7 +2163,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 		send_vblank_event(dev, e, seq, now);
 		queue_seq->sequence = seq;
 	} else {
-		/* drm_handle_vblank_events will call drm_vblank_put */
+		/* drm_handle_vblank_events will call drm_vblank_crtc_put */
 		list_add_tail(&e->base.link, &dev->vblank_event_list);
 		queue_seq->sequence = req_seq;
 	}
diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index 70f0199251ea..52158f85c855 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -58,7 +58,7 @@ void drm_handle_vblank_works(struct drm_vblank_crtc *vblank)
 			continue;
 
 		list_del_init(&work->node);
-		drm_vblank_put(vblank->dev, vblank->pipe);
+		drm_vblank_crtc_put(vblank);
 		kthread_queue_work(vblank->worker, &work->base);
 		wake = true;
 	}
@@ -80,7 +80,7 @@ void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank)
 
 	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
 		list_del_init(&work->node);
-		drm_vblank_put(vblank->dev, vblank->pipe);
+		drm_vblank_crtc_put(vblank);
 	}
 
 	wake_up_all(&vblank->work_wait_queue);
@@ -129,7 +129,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
 		goto out;
 
 	if (list_empty(&work->node)) {
-		ret = drm_vblank_get(dev, vblank->pipe);
+		ret = drm_vblank_crtc_get(vblank);
 		if (ret < 0)
 			goto out;
 	} else if (work->count == count) {
@@ -140,7 +140,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
 	}
 
 	work->count = count;
-	cur_vbl = drm_vblank_count(dev, vblank->pipe);
+	cur_vbl = drm_vblank_crtc_count(vblank);
 	passed = drm_vblank_passed(cur_vbl, count);
 	if (passed)
 		drm_dbg_core(dev,
@@ -148,7 +148,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
 			     vblank->pipe, count, cur_vbl);
 
 	if (!nextonmiss && passed) {
-		drm_vblank_put(dev, vblank->pipe);
+		drm_vblank_crtc_put(vblank);
 		ret = kthread_queue_work(vblank->worker, &work->base);
 
 		if (rescheduling) {
@@ -193,7 +193,7 @@ bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work)
 	spin_lock_irq(&dev->event_lock);
 	if (!list_empty(&work->node)) {
 		list_del_init(&work->node);
-		drm_vblank_put(vblank->dev, vblank->pipe);
+		drm_vblank_crtc_put(vblank);
 		ret = true;
 	}
 
-- 
2.47.3

