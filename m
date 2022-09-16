Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AEC5BB11E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 18:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5E510E4CE;
	Fri, 16 Sep 2022 16:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7838010E05A;
 Fri, 16 Sep 2022 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663346020; x=1694882020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+XPV8HcaE/9L71hkSOiFNYaVu+xuhMgleVwsoSICrYg=;
 b=ZvZxcVdEmN8yQqPPY4GgbBQ7WA6BuchmR6bGp603/7IAPezrJ4a+KQtN
 NJ0nTcsfcjBA1B1ROsjX21JPowfMHIVKSoBT1jnMl2IY13JiCAM0hYCqc
 mRWrehgYzhVDo7AXQRwpygKglg1zqvFSYNTBWSGMiEl2/zYT6zyTRDW9V
 zge1b+BPlTeOxEAp8O3CGOw2NqcPVNcaN9Dns1zkFd4Qb2af1THbC8IC/
 bf19wpJsm0RQCU8fu2R94tB5kNq0u66puDMANW2P6SjFBcH6mwHQ3a8ny
 cSsJ0F6m5BQYGe/OC1v24CvxwLMF1+vnwXPN0kIDQPycTzldbvf+hfaf9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="278756930"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="278756930"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 09:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="620140528"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 16 Sep 2022 09:33:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Sep 2022 19:33:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/atomic: Treat a nonblocking commit following a
 blocking commit as blocking commit
Date: Fri, 16 Sep 2022 19:33:28 +0300
Message-Id: <20220916163331.6849-2-ville.syrjala@linux.intel.com>
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

Currently a nonblocking commit will actually block if it is
preceded by a blocking commit. It just happens block on the
mutex rather than on the completion. I shall call these as
not-actually-nonblocking commits.

I would like to make blocking commits execute locklessly,
just as nonblocking commits already do. The main benefit
would that parallel TEST_ONLY commits would not get blocked
on the mutexes until the parallel blocking commit is done.
To achieve that without a significant change in behaviour
for the not-actually-nonblocking commits let's treat them
exactly the same as blocking commit, ie. instead of
returning -EBUSY they will just block.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Jonas Ådahl <jadahl@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 19 ++++++++++++-------
 include/drm/drm_atomic.h            |  7 +++++++
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ee5fea48b5cb..bff087674cb5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2109,7 +2109,7 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
 			 * Userspace is not allowed to get ahead of the previous
 			 * commit with nonblocking ones.
 			 */
-			if (!completed && nonblock) {
+			if (!completed && nonblock && commit->nonblock) {
 				spin_unlock(&crtc->commit_lock);
 				drm_dbg_atomic(crtc->dev,
 					       "[CRTC:%d:%s] busy with a previous commit\n",
@@ -2152,7 +2152,7 @@ static void release_crtc_commit(struct completion *completion)
 	drm_crtc_commit_put(commit);
 }
 
-static void init_commit(struct drm_crtc_commit *commit, struct drm_crtc *crtc)
+static void init_commit(struct drm_crtc_commit *commit, struct drm_crtc *crtc, bool nonblock)
 {
 	init_completion(&commit->flip_done);
 	init_completion(&commit->hw_done);
@@ -2160,10 +2160,11 @@ static void init_commit(struct drm_crtc_commit *commit, struct drm_crtc *crtc)
 	INIT_LIST_HEAD(&commit->commit_entry);
 	kref_init(&commit->ref);
 	commit->crtc = crtc;
+	commit->nonblock = nonblock;
 }
 
 static struct drm_crtc_commit *
-crtc_or_fake_commit(struct drm_atomic_state *state, struct drm_crtc *crtc)
+crtc_or_fake_commit(struct drm_atomic_state *state, struct drm_crtc *crtc, bool nonblock)
 {
 	if (crtc) {
 		struct drm_crtc_state *new_crtc_state;
@@ -2178,7 +2179,7 @@ crtc_or_fake_commit(struct drm_atomic_state *state, struct drm_crtc *crtc)
 		if (!state->fake_commit)
 			return NULL;
 
-		init_commit(state->fake_commit, NULL);
+		init_commit(state->fake_commit, NULL, nonblock);
 	}
 
 	return state->fake_commit;
@@ -2250,7 +2251,7 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 		if (!commit)
 			return -ENOMEM;
 
-		init_commit(commit, crtc);
+		init_commit(commit, crtc, nonblock);
 
 		new_crtc_state->commit = commit;
 
@@ -2299,6 +2300,7 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 		 * commit with nonblocking ones.
 		 */
 		if (nonblock && old_conn_state->commit &&
+		    old_conn_state->commit->nonblock &&
 		    !try_wait_for_completion(&old_conn_state->commit->flip_done)) {
 			drm_dbg_atomic(conn->dev,
 				       "[CONNECTOR:%d:%s] busy with a previous commit\n",
@@ -2308,7 +2310,8 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 		}
 
 		/* Always track connectors explicitly for e.g. link retraining. */
-		commit = crtc_or_fake_commit(state, new_conn_state->crtc ?: old_conn_state->crtc);
+		commit = crtc_or_fake_commit(state, new_conn_state->crtc ?: old_conn_state->crtc,
+					     nonblock);
 		if (!commit)
 			return -ENOMEM;
 
@@ -2321,6 +2324,7 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 		 * commit with nonblocking ones.
 		 */
 		if (nonblock && old_plane_state->commit &&
+		    old_plane_state->commit->nonblock &&
 		    !try_wait_for_completion(&old_plane_state->commit->flip_done)) {
 			drm_dbg_atomic(plane->dev,
 				       "[PLANE:%d:%s] busy with a previous commit\n",
@@ -2330,7 +2334,8 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 		}
 
 		/* Always track planes explicitly for async pageflip support. */
-		commit = crtc_or_fake_commit(state, new_plane_state->crtc ?: old_plane_state->crtc);
+		commit = crtc_or_fake_commit(state, new_plane_state->crtc ?: old_plane_state->crtc,
+					     nonblock);
 		if (!commit)
 			return -ENOMEM;
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 10b1990bc1f6..0924c322ddfb 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -155,6 +155,13 @@ struct drm_crtc_commit {
 	 * used by the free code to remove the second reference if commit fails.
 	 */
 	bool abort_completion;
+
+	/**
+	 * @nonblock:
+	 *
+	 * Nonblocking commit?
+	 */
+	bool nonblock;
 };
 
 struct __drm_planes_state {
-- 
2.35.1

