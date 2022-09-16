Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB45BB11D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 18:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA2510E4CD;
	Fri, 16 Sep 2022 16:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AE310E4C5;
 Fri, 16 Sep 2022 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663346029; x=1694882029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fxFbYNk+mC+hLp92Ar8qnUDygZQHSO3zI9XyyF1M+SU=;
 b=gTBj8ozCoZHiBpHzCp4iH/MtC4a9MbjOHVvY5e1vYdxaq1ltms4oEiUJ
 T2bDb3xiXSEldlotDlhT1NxxprK91AI5c8cjfYAhCp824hvELkohnXC5n
 c+NaZuUrSWqISZcbyiU7L93fKfcx6z5Tv+0fyVigGabLLruVzTYhO7Nti
 AV9sW2+hY62lkjiOSn5yn7X+MCVEu/6YNJJyX9jphTvb8nh4ahtsUMLc+
 zbXIucKV1t3sLIu2fa1If5IJ7J1OtMNhgNVeTT0NOdU02aK1YfVtOaaW+
 62ZBC+ip7CX8haoqcShBdf2prrLj8rYCyO5+FZeu76hwsmTaZWhnoigyW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="282056307"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="282056307"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 09:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="680024986"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 16 Sep 2022 09:33:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Sep 2022 19:33:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/atomic: Allow lockless blocking commits
Date: Fri, 16 Sep 2022 19:33:30 +0300
Message-Id: <20220916163331.6849-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
References: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The easiest way to execute blocking commits locklessly is to just
schedule them onto the workqueue excatly as we do for nonblocking
commits. And to preserve the blocking behaviour of the ioctl we
just flush the work before exiting the kernel.

We do need to reorder the state_put() vs drop_locks() of course
so we don't flush_work() while still holding the locks.

Note that a lot of the current users of drm_atomic_commit()
(eg. lot of the atomic helpers) have the ww_ctx stuff outside
the drm_atomic_state handling. With that structure we can't
actually pull the flush_work() past the drop_locks(). So in
order to make those places actually lockless we'll need
reverse the layers. That is left for a future excercise
and for now we just roll the flush_work() straight into
drm_atomic_commit(), leaving the non-flushing version for
just the atomic ioctl handler.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Jonas Ådahl <jadahl@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic.c      | 32 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_atomic_uapi.c | 11 ++++++++---
 include/drm/drm_atomic.h          |  1 +
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f197f59f6d99..6d728af4e8cf 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1411,7 +1411,7 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 EXPORT_SYMBOL(drm_atomic_check_only);
 
 /**
- * drm_atomic_commit - commit configuration atomically
+ * drm_atomic_commit_noflush - commit configuration atomically, without waiting for the commit
  * @state: atomic configuration to check
  *
  * Note that this function can return -EDEADLK if the driver needed to acquire
@@ -1424,7 +1424,7 @@ EXPORT_SYMBOL(drm_atomic_check_only);
  * Returns:
  * 0 on success, negative error code on failure.
  */
-int drm_atomic_commit(struct drm_atomic_state *state)
+int drm_atomic_commit_noflush(struct drm_atomic_state *state)
 {
 	struct drm_mode_config *config = &state->dev->mode_config;
 	struct drm_printer p = drm_info_printer(state->dev->dev);
@@ -1441,6 +1441,34 @@ int drm_atomic_commit(struct drm_atomic_state *state)
 
 	return config->funcs->atomic_commit(state->dev, state, false);
 }
+EXPORT_SYMBOL(drm_atomic_commit_noflush);
+
+/**
+ * drm_atomic_commit - commit configuration atomically, waiting for the commit to finish
+ * @state: atomic configuration to check
+ *
+ * Note that this function can return -EDEADLK if the driver needed to acquire
+ * more locks but encountered a deadlock. The caller must then do the usual w/w
+ * backoff dance and restart. All other errors are fatal.
+ *
+ * This function will take its own reference on @state.
+ * Callers should always release their reference with drm_atomic_state_put().
+ *
+ * Returns:
+ * 0 on success, negative error code on failure.
+ */
+int drm_atomic_commit(struct drm_atomic_state *state)
+{
+	int ret;
+
+	ret = drm_atomic_commit_noflush(state);
+	if (ret)
+		return ret;
+
+	flush_work(&state->commit_work);
+
+	return 0;
+}
 EXPORT_SYMBOL(drm_atomic_commit);
 
 /**
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 79730fa1dd8e..73ec26fe3393 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1290,6 +1290,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_out_fence_state *fence_state;
+	bool flush = false;
 	int ret = 0;
 	unsigned int i, j, num_fences;
 
@@ -1423,7 +1424,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	} else if (arg->flags & DRM_MODE_ATOMIC_NONBLOCK) {
 		ret = drm_atomic_nonblocking_commit(state);
 	} else {
-		ret = drm_atomic_commit(state);
+		ret = drm_atomic_commit_noflush(state);
+		flush = ret == 0;
 	}
 
 out:
@@ -1436,10 +1438,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			goto retry;
 	}
 
-	drm_atomic_state_put(state);
-
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
+	if (flush)
+		flush_work(&state->commit_work);
+
+	drm_atomic_state_put(state);
+
 	return ret;
 }
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 0924c322ddfb..d19ce8898bd4 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -740,6 +740,7 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 			       struct drm_crtc *crtc);
 
 int __must_check drm_atomic_check_only(struct drm_atomic_state *state);
+int __must_check drm_atomic_commit_noflush(struct drm_atomic_state *state);
 int __must_check drm_atomic_commit(struct drm_atomic_state *state);
 int __must_check drm_atomic_nonblocking_commit(struct drm_atomic_state *state);
 
-- 
2.35.1

