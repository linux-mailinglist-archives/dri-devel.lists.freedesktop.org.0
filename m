Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6F0C47DF4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2F10E44D;
	Mon, 10 Nov 2025 16:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOLHUImQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A974D10E455;
 Mon, 10 Nov 2025 16:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791534; x=1794327534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3znaEvVnagrz0L4llo5CX4XH63/+cwcEOWCDxQ7eXI=;
 b=BOLHUImQpaYwnXbcZ8f8B539+Ex2VP6MXCZTe5+bh7qGBhZtcisaaTL8
 7E03UxtUVWkEznjVjE7uWDw4sYUhBWn1orbMEo+xWG+yArFgfgpqCky1d
 NVJJl/h2hJrgtuA/y1SkuoD7c6HxYSv4+9/o98FKPJ1tldWGtEQL7Q/CX
 h0PD2PXHWUlHtT+BGO+2FshhRWJxzvI6xlxoIbaeZPfMOyv0Sd2xVkWz/
 GV7mLEPe4NCRjDgq5YV+VwTTvqQd58GU3V5CIFveHvZp9mMHD1GMNq0zY
 FZK5GCGK7aiBWHvxchgSjU9wi8co2vX6ddcCyDgfVqbamREmWN3gtIXcp Q==;
X-CSE-ConnectionGUID: Vx9soHDoSl+zS4KYcD2NoQ==
X-CSE-MsgGUID: 9lA9ynBoRhOkszMn+Grvcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76191662"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="76191662"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:54 -0800
X-CSE-ConnectionGUID: M7Jyjl8uReCfnXHny4xTlA==
X-CSE-MsgGUID: gEvKrZTURRCUGtpFYZj4Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="212100318"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 13/24] drm/vblank: pass vblank to drm_vblank_count_and_time()
Date: Mon, 10 Nov 2025 18:17:31 +0200
Message-ID: <39a203dcc71aa4bfcf349d9c85672a6b9db4201f.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Use the vblank pointer instead of a dev, pipe pair to simplify code.

Drop the pipe check warning, as we can be sure vblank->pipe is within
limits.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index e33b7fa6f19a..0a2e372dd549 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -950,18 +950,12 @@ EXPORT_SYMBOL(drm_crtc_vblank_count);
  *
  * This is the legacy version of drm_crtc_vblank_count_and_time().
  */
-static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
+static u64 drm_vblank_count_and_time(struct drm_vblank_crtc *vblank,
 				     ktime_t *vblanktime)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	u64 vblank_count;
 	unsigned int seq;
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs)) {
-		*vblanktime = 0;
-		return 0;
-	}
-
 	do {
 		seq = read_seqbegin(&vblank->seqlock);
 		vblank_count = atomic64_read(&vblank->count);
@@ -993,7 +987,7 @@ static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime)
 {
-	return drm_vblank_count_and_time(crtc->dev, drm_crtc_index(crtc),
+	return drm_vblank_count_and_time(drm_crtc_vblank_crtc(crtc),
 					 vblanktime);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
@@ -1136,18 +1130,18 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 				struct drm_pending_vblank_event *e)
 {
 	struct drm_device *dev = crtc->dev;
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	u64 seq;
-	unsigned int pipe = drm_crtc_index(crtc);
 	ktime_t now;
 
 	if (drm_dev_has_vblank(dev)) {
-		seq = drm_vblank_count_and_time(dev, pipe, &now);
+		seq = drm_vblank_count_and_time(vblank, &now);
 	} else {
 		seq = 0;
 
 		now = ktime_get();
 	}
-	e->pipe = pipe;
+	e->pipe = vblank->pipe;
 	send_vblank_event(dev, e, seq, now);
 }
 EXPORT_SYMBOL(drm_crtc_send_vblank_event);
@@ -1368,7 +1362,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	spin_unlock(&dev->vbl_lock);
 
 	/* Send any queued vblank events, lest the natives grow disquiet */
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
+	seq = drm_vblank_count_and_time(vblank, &now);
 
 	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
 		if (e->pipe != pipe)
@@ -1645,7 +1639,7 @@ static int drm_queue_vblank_event(struct drm_vblank_crtc *vblank,
 	if (ret)
 		goto err_unlock;
 
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
+	seq = drm_vblank_count_and_time(vblank, &now);
 
 	drm_dbg_core(dev, "event on vblank count %llu, current %llu, crtc %u\n",
 		     req_seq, seq, pipe);
@@ -1713,7 +1707,7 @@ static void drm_wait_vblank_reply(struct drm_vblank_crtc *vblank,
 	 * to store the seconds. This is safe as we always use monotonic
 	 * timestamps since linux-4.15.
 	 */
-	reply->sequence = drm_vblank_count_and_time(vblank->dev, vblank->pipe, &now);
+	reply->sequence = drm_vblank_count_and_time(vblank, &now);
 	ts = ktime_to_timespec64(now);
 	reply->tval_sec = (u32)ts.tv_sec;
 	reply->tval_usec = ts.tv_nsec / 1000;
@@ -1878,7 +1872,7 @@ static void drm_handle_vblank_events(struct drm_vblank_crtc *vblank)
 
 	assert_spin_locked(&dev->event_lock);
 
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
+	seq = drm_vblank_count_and_time(vblank, &now);
 
 	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
 		if (e->pipe != pipe)
@@ -2040,7 +2034,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	else
 		get_seq->active = crtc->enabled;
 	drm_modeset_unlock(&crtc->mutex);
-	get_seq->sequence = drm_vblank_count_and_time(dev, pipe, &now);
+	get_seq->sequence = drm_vblank_count_and_time(vblank, &now);
 	get_seq->sequence_ns = ktime_to_ns(now);
 	if (!vblank_enabled)
 		drm_crtc_vblank_put(crtc);
@@ -2101,7 +2095,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 		goto err_free;
 	}
 
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
+	seq = drm_vblank_count_and_time(vblank, &now);
 	req_seq = queue_seq->sequence;
 
 	if (flags & DRM_CRTC_SEQUENCE_RELATIVE)
-- 
2.47.3

