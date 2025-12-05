Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FECA763B
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936D310EAE7;
	Fri,  5 Dec 2025 11:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sa6ExQ6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A4E10EAE7;
 Fri,  5 Dec 2025 11:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934143; x=1796470143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ijoA+3uV30cxeNYBXwoTbXOYCIAKK2n5Ciijm+tobuk=;
 b=Sa6ExQ6zgPCygyYS0x+WcA4ORBRdo29rzUG6tt4c+ofFbVKMQh7Qovfm
 qJDDsilAFjh5cy2Ogs6zM8bWCBfdL/0oQF5wzUWfamr18JChtrQ9ztyMc
 fF+nVt0ylT1eiJ+mMBtNn7owZP3Val0vXIIz9fKjnXnVaMjcbJhGRElmF
 fpEfbdp7wPkf2VJ7U905VoLDXy3svYCmOMM2gSC8s8Vp/U2UZctYzkNb6
 /F6HhIKt4qy1w+LoiIf73CBfSeAMeoDLf6PeCIYueyhehUbvGWCW2fVv2
 mYuj5mJbjz1ybhSJhmRa7tVKRrbMLPvGOi241ww2UXotFNhloMwu3Z1Lq w==;
X-CSE-ConnectionGUID: IsMptaoKT/W99UMFHro40g==
X-CSE-MsgGUID: 8a8zCj3QR+KMkX921QFNQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78431597"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="78431597"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:02 -0800
X-CSE-ConnectionGUID: i2JaSgNKQFiBkS0gkrga+w==
X-CSE-MsgGUID: HEPTY1fPT7awbACvmn3TZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195097556"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 14/25] drm/vblank: pass vblank to
 drm_vblank_count_and_time()
Date: Fri,  5 Dec 2025 13:27:30 +0200
Message-ID: <6997288b8d20c69a4b1b17371c970341521003f7.1764933891.git.jani.nikula@intel.com>
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

Use the vblank pointer instead of a dev, pipe pair to simplify
code. Rename to drm_vblank_crtc_count_and_time().

Drop the pipe check warning, as we can be sure vblank->pipe is within
limits.

v2: Rename (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 38 +++++++++++++++---------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 233c60860c78..5182dfc7b930 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -395,8 +395,8 @@ u64 drm_vblank_crtc_count(struct drm_vblank_crtc *vblank)
 	 * This read barrier corresponds to the implicit write barrier of the
 	 * write seqlock in store_vblank(). Note that this is the only place
 	 * where we need an explicit barrier, since all other access goes
-	 * through drm_vblank_count_and_time(), which already has the required
-	 * read barrier curtesy of the read seqlock.
+	 * through drm_vblank_crtc_count_and_time(), which already has the
+	 * required read barrier curtesy of the read seqlock.
 	 */
 	smp_rmb();
 
@@ -939,7 +939,7 @@ u64 drm_crtc_vblank_count(struct drm_crtc *crtc)
 EXPORT_SYMBOL(drm_crtc_vblank_count);
 
 /**
- * drm_vblank_count_and_time - retrieve "cooked" vblank counter value and the
+ * drm_vblank_crtc_count_and_time - retrieve "cooked" vblank counter value and the
  *     system timestamp corresponding to that vblank counter value.
  * @dev: DRM device
  * @pipe: index of CRTC whose counter to retrieve
@@ -952,18 +952,12 @@ EXPORT_SYMBOL(drm_crtc_vblank_count);
  *
  * This is the legacy version of drm_crtc_vblank_count_and_time().
  */
-static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
-				     ktime_t *vblanktime)
+static u64 drm_vblank_crtc_count_and_time(struct drm_vblank_crtc *vblank,
+					  ktime_t *vblanktime)
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
@@ -995,8 +989,8 @@ static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime)
 {
-	return drm_vblank_count_and_time(crtc->dev, drm_crtc_index(crtc),
-					 vblanktime);
+	return drm_vblank_crtc_count_and_time(drm_crtc_vblank_crtc(crtc),
+					      vblanktime);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
 
@@ -1138,18 +1132,18 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 				struct drm_pending_vblank_event *e)
 {
 	struct drm_device *dev = crtc->dev;
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	u64 seq;
-	unsigned int pipe = drm_crtc_index(crtc);
 	ktime_t now;
 
 	if (drm_dev_has_vblank(dev)) {
-		seq = drm_vblank_count_and_time(dev, pipe, &now);
+		seq = drm_vblank_crtc_count_and_time(vblank, &now);
 	} else {
 		seq = 0;
 
 		now = ktime_get();
 	}
-	e->pipe = pipe;
+	e->pipe = vblank->pipe;
 	send_vblank_event(dev, e, seq, now);
 }
 EXPORT_SYMBOL(drm_crtc_send_vblank_event);
@@ -1371,7 +1365,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 	spin_unlock(&dev->vbl_lock);
 
 	/* Send any queued vblank events, lest the natives grow disquiet */
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
+	seq = drm_vblank_crtc_count_and_time(vblank, &now);
 
 	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
 		if (e->pipe != pipe)
@@ -1648,7 +1642,7 @@ static int drm_vblank_crtc_queue_event(struct drm_vblank_crtc *vblank,
 	if (ret)
 		goto err_unlock;
 
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
+	seq = drm_vblank_crtc_count_and_time(vblank, &now);
 
 	drm_dbg_core(dev, "event on vblank count %llu, current %llu, crtc %u\n",
 		     req_seq, seq, pipe);
@@ -1716,7 +1710,7 @@ static void drm_vblank_crtc_wait_reply(struct drm_vblank_crtc *vblank,
 	 * to store the seconds. This is safe as we always use monotonic
 	 * timestamps since linux-4.15.
 	 */
-	reply->sequence = drm_vblank_count_and_time(vblank->dev, vblank->pipe, &now);
+	reply->sequence = drm_vblank_crtc_count_and_time(vblank, &now);
 	ts = ktime_to_timespec64(now);
 	reply->tval_sec = (u32)ts.tv_sec;
 	reply->tval_usec = ts.tv_nsec / 1000;
@@ -1881,7 +1875,7 @@ static void drm_vblank_crtc_handle_events(struct drm_vblank_crtc *vblank)
 
 	assert_spin_locked(&dev->event_lock);
 
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
+	seq = drm_vblank_crtc_count_and_time(vblank, &now);
 
 	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
 		if (e->pipe != pipe)
@@ -2043,7 +2037,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	else
 		get_seq->active = crtc->enabled;
 	drm_modeset_unlock(&crtc->mutex);
-	get_seq->sequence = drm_vblank_count_and_time(dev, pipe, &now);
+	get_seq->sequence = drm_vblank_crtc_count_and_time(vblank, &now);
 	get_seq->sequence_ns = ktime_to_ns(now);
 	if (!vblank_enabled)
 		drm_crtc_vblank_put(crtc);
@@ -2104,7 +2098,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 		goto err_free;
 	}
 
-	seq = drm_vblank_count_and_time(dev, pipe, &now);
+	seq = drm_vblank_crtc_count_and_time(vblank, &now);
 	req_seq = queue_seq->sequence;
 
 	if (flags & DRM_CRTC_SEQUENCE_RELATIVE)
-- 
2.47.3

