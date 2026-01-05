Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F0CF1C8B
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 05:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E84510E39F;
	Mon,  5 Jan 2026 04:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idh7v3Le";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2BC10E395;
 Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585767; x=1799121767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xUhXEfnUOO28h+l50ozfjdZKUotxN1xCccQ08S8HzKA=;
 b=idh7v3LeoIna7S7QgdsWw8mJOiWgI00YxN1jqnaEYpOBYkWFjb/3yuJI
 69gTFbA0Jv8RcLNj0TG8tnSv1TOPyaaUQucaVOV/8po18CsjONfqLcsW4
 4CkGe6WpbkFSXpk8zO+ZUeKgJ9os2ZMwSrhhTZ4iT5LwAtSJSyjvBYOa2
 FINylamhJYxeZPRBRKcQcxQ/UbMwBUmE1qTfaqdo4/bdDPl9yWsnKYIWz
 U1zOuhs8nk6BWglRM0vUg+Md5AWldEj7NIe92VV2TlpDj/Obmx+IXKohJ
 P6YOXGYSvOuQ6sxDAvtkhrwKNHGNYDwSFOX4qU1NNEAn8Vhg5+gIXKBEi Q==;
X-CSE-ConnectionGUID: 1PErsKpzRimzOoI1TdTWWQ==
X-CSE-MsgGUID: ielk9tQ1T9KObWNlua+akA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856277"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:46 -0800
X-CSE-ConnectionGUID: hg8jDOPARqC1kGgx7YJAyQ==
X-CSE-MsgGUID: ePgdiP0ERlKzdo5Rd0lCfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060694"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, carlos.santa@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/22] drm/atomic: Export fence deadline helper for atomic
 commits
Date: Sun,  4 Jan 2026 20:02:36 -0800
Message-Id: <20260105040237.1307873-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

drm_atomic_helper_wait_for_fences() computes the next vblank start time
(for single-CRTC commits) and uses it to set an advisory deadline on the
incoming plane fences before waiting.

Expose this logic as drm_atomic_helper_set_fence_deadline() so drivers
with custom commit plumbing can reuse the same deadline calculation and
fence annotation without open-coding it.

No functional change intended: drm_atomic_helper_wait_for_fences()
continues to set the same deadlines as before, now via the exported
helper.

Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 11 ++++++++---
 include/drm/drm_atomic_helper.h     |  3 +++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index cc1f0c102414..321fad478ee0 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1770,11 +1770,15 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
 /*
+ * drm_atomic_helper_set_fence_deadline() - set fence deadlines
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
  * For atomic updates which touch just a single CRTC, calculate the time of the
  * next vblank, and inform all the fences of the deadline.
  */
-static void set_fence_deadline(struct drm_device *dev,
-			       struct drm_atomic_state *state)
+void drm_atomic_helper_set_fence_deadline(struct drm_device *dev,
+					  struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
@@ -1809,6 +1813,7 @@ static void set_fence_deadline(struct drm_device *dev,
 		dma_fence_set_deadline(new_plane_state->fence, vbltime);
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_set_fence_deadline);
 
 /**
  * drm_atomic_helper_wait_for_fences - wait for fences stashed in plane state
@@ -1839,7 +1844,7 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 	struct drm_plane_state *new_plane_state;
 	int i, ret;
 
-	set_fence_deadline(dev, state);
+	drm_atomic_helper_set_fence_deadline(dev, state);
 
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		if (!new_plane_state->fence)
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index e154ee4f0696..401e83ab408d 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -186,6 +186,9 @@ int drm_atomic_helper_page_flip_target(
 				uint32_t target,
 				struct drm_modeset_acquire_ctx *ctx);
 
+void drm_atomic_helper_set_fence_deadline(struct drm_device *dev,
+					  struct drm_atomic_state *state);
+
 /**
  * drm_atomic_crtc_for_each_plane - iterate over planes currently attached to CRTC
  * @plane: the loop cursor
-- 
2.34.1

