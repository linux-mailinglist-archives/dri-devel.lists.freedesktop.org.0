Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08D4BBE2C8
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 15:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD19210E344;
	Mon,  6 Oct 2025 13:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B4FXxKee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EF910E30E;
 Mon,  6 Oct 2025 13:22:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D79D9405EE;
 Mon,  6 Oct 2025 13:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A25DC4CEF5;
 Mon,  6 Oct 2025 13:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759756954;
 bh=C7Pc5wjKUSE+0XJ+GWiarbK8FBKcT33nhLIzqUFN2eY=;
 h=From:Date:Subject:To:Cc:From;
 b=B4FXxKeeoNMV2iLzxE2oZ9Rykb6wM0Rr6OVduWa5L8w1/z/tP1UJuFlV1SlT+to6I
 9ni1ksAlklBFGlHuAHzbVEtXqOw6KbF4TOt8WF8g+fI+Usuib1+vnBIFE/3i7dc65e
 5CODkXqsOafNCbcHfoJ/E7yxeOIWsgZzi+qFd8TciWMkRj832L6QEh2LJeObyqf9gY
 Ugw2z4Y60wxy/k9V+bD4O2QEknRisoIDMARsW+7cLrXEsEPoXUrXjKSwYpfvI1SzKo
 sK6BeYrzST4blQkWw1GgFwKa8NAR95Iabffvn/oPPxrY6fuR9QfQe2yx9djMdWQ6Ff
 Ee26a9UfoQ5nA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 06 Oct 2025 15:22:26 +0200
Subject: [PATCH] drm/atomic: Change state pointers to a more meaningful
 name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-drm-rename-state-v1-1-5b7c4154772b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJHC42gC/x3MQQqEMAxG4atI1gZiocPgVcRFtX9nsrBKKiKId
 7e4/BbvXVRgikJ9c5Hh0KJrrujahuZ/yD+wxmpy4nwn8uFoCxtyWMBlDzt4cpMkRPHp66hmmyH
 p+S6H8b4fKr+DvWIAAAA=
X-Change-ID: 20251006-drm-rename-state-b2b0fed05f82
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11613; i=mripard@kernel.org;
 h=from:subject:message-id; bh=C7Pc5wjKUSE+0XJ+GWiarbK8FBKcT33nhLIzqUFN2eY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmPD03/9GrGDNf3T9/l9LZ3F69sWz1FJ2zKA9uNzOIrz
 7CeO5Ts1DGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmcmQDY0Ofwpyf218H6Wz/
 3208g1M4I0lS6ufro+EqK0WuP3swLW9mIfdWm7Nnn6y/y3AwctHck4mMDc+zBH5Wqzn4s7DuurR
 wr7vN8Y3yfrmxm5OS7MsWSzNxhGRcmn3s4l3ZU3+2HJ7jM/uoIAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The state pointer found in the struct drm_atomic_state internals for
most object is a bit ambiguous, and confusing when those internals also
have old state and new state.

After the recent cleanups, the state pointer only use is to point to the
state we need to free when destroying the atomic state.

We can thus rename it something less ambiguous, and hopefully more
meaningful.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 ++--
 drivers/gpu/drm/drm_atomic.c                      | 24 +++++++++++------------
 drivers/gpu/drm/drm_atomic_helper.c               |  8 ++++----
 include/drm/drm_atomic.h                          | 16 +++++++--------
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 62defeccbb5ca09c89523fc4112d2085bbdbb0a9..b9036b59a671b2802fae28db623f020bbc535837 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -12335,22 +12335,22 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 
 			if (obj->funcs == adev->dm.atomic_obj.funcs) {
 				int j = state->num_private_objs-1;
 
 				dm_atomic_destroy_state(obj,
-						state->private_objs[i].state);
+						state->private_objs[i].freeable_state);
 
 				/* If i is not at the end of the array then the
 				 * last element needs to be moved to where i was
 				 * before the array can safely be truncated.
 				 */
 				if (i != j)
 					state->private_objs[i] =
 						state->private_objs[j];
 
 				state->private_objs[j].ptr = NULL;
-				state->private_objs[j].state = NULL;
+				state->private_objs[j].freeable_state = NULL;
 				state->private_objs[j].old_state = NULL;
 				state->private_objs[j].new_state = NULL;
 
 				state->num_private_objs = j;
 				break;
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0fda567c390057b10bce691d9ddc11308088d92e..f3e6a3fc0fdd0a7ad77209dcae1be59759e2a7c1 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -205,13 +205,13 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 
 		if (!connector)
 			continue;
 
 		connector->funcs->atomic_destroy_state(connector,
-						       state->connectors[i].state);
+						       state->connectors[i].freeable_state);
 		state->connectors[i].ptr = NULL;
-		state->connectors[i].state = NULL;
+		state->connectors[i].freeable_state = NULL;
 		state->connectors[i].old_state = NULL;
 		state->connectors[i].new_state = NULL;
 		drm_connector_put(connector);
 	}
 
@@ -220,14 +220,14 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 
 		if (!crtc)
 			continue;
 
 		crtc->funcs->atomic_destroy_state(crtc,
-						  state->crtcs[i].state);
+						  state->crtcs[i].freeable_state);
 
 		state->crtcs[i].ptr = NULL;
-		state->crtcs[i].state = NULL;
+		state->crtcs[i].freeable_state = NULL;
 		state->crtcs[i].old_state = NULL;
 		state->crtcs[i].new_state = NULL;
 
 		if (state->crtcs[i].commit) {
 			drm_crtc_commit_put(state->crtcs[i].commit);
@@ -240,24 +240,24 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 
 		if (!plane)
 			continue;
 
 		plane->funcs->atomic_destroy_state(plane,
-						   state->planes[i].state);
+						   state->planes[i].freeable_state);
 		state->planes[i].ptr = NULL;
-		state->planes[i].state = NULL;
+		state->planes[i].freeable_state = NULL;
 		state->planes[i].old_state = NULL;
 		state->planes[i].new_state = NULL;
 	}
 
 	for (i = 0; i < state->num_private_objs; i++) {
 		struct drm_private_obj *obj = state->private_objs[i].ptr;
 
 		obj->funcs->atomic_destroy_state(obj,
-						 state->private_objs[i].state);
+						 state->private_objs[i].freeable_state);
 		state->private_objs[i].ptr = NULL;
-		state->private_objs[i].state = NULL;
+		state->private_objs[i].freeable_state = NULL;
 		state->private_objs[i].old_state = NULL;
 		state->private_objs[i].new_state = NULL;
 	}
 	state->num_private_objs = 0;
 
@@ -359,11 +359,11 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 
 	crtc_state = crtc->funcs->atomic_duplicate_state(crtc);
 	if (!crtc_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->crtcs[index].state = crtc_state;
+	state->crtcs[index].freeable_state = crtc_state;
 	state->crtcs[index].old_state = crtc->state;
 	state->crtcs[index].new_state = crtc_state;
 	state->crtcs[index].ptr = crtc;
 	crtc_state->state = state;
 
@@ -544,11 +544,11 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 
 	plane_state = plane->funcs->atomic_duplicate_state(plane);
 	if (!plane_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->planes[index].state = plane_state;
+	state->planes[index].freeable_state = plane_state;
 	state->planes[index].ptr = plane;
 	state->planes[index].old_state = plane->state;
 	state->planes[index].new_state = plane_state;
 	plane_state->state = state;
 
@@ -856,11 +856,11 @@ drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 
 	obj_state = obj->funcs->atomic_duplicate_state(obj);
 	if (!obj_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->private_objs[index].state = obj_state;
+	state->private_objs[index].freeable_state = obj_state;
 	state->private_objs[index].old_state = obj->state;
 	state->private_objs[index].new_state = obj_state;
 	state->private_objs[index].ptr = obj;
 	obj_state->state = state;
 
@@ -1159,11 +1159,11 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 	connector_state = connector->funcs->atomic_duplicate_state(connector);
 	if (!connector_state)
 		return ERR_PTR(-ENOMEM);
 
 	drm_connector_get(connector);
-	state->connectors[index].state = connector_state;
+	state->connectors[index].freeable_state = connector_state;
 	state->connectors[index].old_state = connector->state;
 	state->connectors[index].new_state = connector_state;
 	state->connectors[index].ptr = connector;
 	connector_state->state = state;
 
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acbc5a08aef7fa41ecb9ed5d8fa8e80..7b9cee78f0969ee9bd66ac7f28cbe39c747f7ab2 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3234,21 +3234,21 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 		WARN_ON(connector->state != old_conn_state);
 
 		old_conn_state->state = state;
 		new_conn_state->state = NULL;
 
-		state->connectors[i].state = old_conn_state;
+		state->connectors[i].freeable_state = old_conn_state;
 		connector->state = new_conn_state;
 	}
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		WARN_ON(crtc->state != old_crtc_state);
 
 		old_crtc_state->state = state;
 		new_crtc_state->state = NULL;
 
-		state->crtcs[i].state = old_crtc_state;
+		state->crtcs[i].freeable_state = old_crtc_state;
 		crtc->state = new_crtc_state;
 
 		if (new_crtc_state->commit) {
 			spin_lock(&crtc->commit_lock);
 			list_add(&new_crtc_state->commit->commit_entry,
@@ -3264,22 +3264,22 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 		WARN_ON(plane->state != old_plane_state);
 
 		old_plane_state->state = state;
 		new_plane_state->state = NULL;
 
-		state->planes[i].state = old_plane_state;
+		state->planes[i].freeable_state = old_plane_state;
 		plane->state = new_plane_state;
 	}
 	drm_panic_unlock(state->dev, flags);
 
 	for_each_oldnew_private_obj_in_state(state, obj, old_obj_state, new_obj_state, i) {
 		WARN_ON(obj->state != old_obj_state);
 
 		old_obj_state->state = state;
 		new_obj_state->state = NULL;
 
-		state->private_objs[i].state = old_obj_state;
+		state->private_objs[i].freeable_state = old_obj_state;
 		obj->state = new_obj_state;
 	}
 
 	return 0;
 }
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index c8ab2163bf658cd06b12a8dabada7c088a328654..cdb76ed0bcc08b82b728747f915f064f1ddbcbf7 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -159,11 +159,11 @@ struct drm_crtc_commit {
 
 struct __drm_planes_state {
 	struct drm_plane *ptr;
 
 	/**
-	 * @state:
+	 * @freeable_state:
 	 *
 	 * Used to track the @drm_plane_state we will need to free when
 	 * tearing down the associated &drm_atomic_state in
 	 * $drm_mode_config_funcs.atomic_state_clear or
 	 * drm_atomic_state_default_clear().
@@ -171,20 +171,20 @@ struct __drm_planes_state {
 	 * Before a commit, and the call to
 	 * drm_atomic_helper_swap_state() in particular, it points to
 	 * the same state than @new_state. After a commit, it points to
 	 * the same state than @old_state.
 	 */
-	struct drm_plane_state *state;
+	struct drm_plane_state *freeable_state;
 
 	struct drm_plane_state *old_state, *new_state;
 };
 
 struct __drm_crtcs_state {
 	struct drm_crtc *ptr;
 
 	/**
-	 * @state:
+	 * @freeable_state:
 	 *
 	 * Used to track the @drm_crtc_state we will need to free when
 	 * tearing down the associated &drm_atomic_state in
 	 * $drm_mode_config_funcs.atomic_state_clear or
 	 * drm_atomic_state_default_clear().
@@ -192,11 +192,11 @@ struct __drm_crtcs_state {
 	 * Before a commit, and the call to
 	 * drm_atomic_helper_swap_state() in particular, it points to
 	 * the same state than @new_state. After a commit, it points to
 	 * the same state than @old_state.
 	 */
-	struct drm_crtc_state *state;
+	struct drm_crtc_state *freeable_state;
 
 	struct drm_crtc_state *old_state, *new_state;
 
 	/**
 	 * @commit:
@@ -214,11 +214,11 @@ struct __drm_crtcs_state {
 
 struct __drm_connnectors_state {
 	struct drm_connector *ptr;
 
 	/**
-	 * @state:
+	 * @freeable_state:
 	 *
 	 * Used to track the @drm_connector_state we will need to free
 	 * when tearing down the associated &drm_atomic_state in
 	 * $drm_mode_config_funcs.atomic_state_clear or
 	 * drm_atomic_state_default_clear().
@@ -226,11 +226,11 @@ struct __drm_connnectors_state {
 	 * Before a commit, and the call to
 	 * drm_atomic_helper_swap_state() in particular, it points to
 	 * the same state than @new_state. After a commit, it points to
 	 * the same state than @old_state.
 	 */
-	struct drm_connector_state *state;
+	struct drm_connector_state *freeable_state;
 
 	struct drm_connector_state *old_state, *new_state;
 
 	/**
 	 * @out_fence_ptr:
@@ -391,11 +391,11 @@ struct drm_private_state {
 
 struct __drm_private_objs_state {
 	struct drm_private_obj *ptr;
 
 	/**
-	 * @state:
+	 * @freeable_state:
 	 *
 	 * Used to track the @drm_private_state we will need to free
 	 * when tearing down the associated &drm_atomic_state in
 	 * $drm_mode_config_funcs.atomic_state_clear or
 	 * drm_atomic_state_default_clear().
@@ -403,11 +403,11 @@ struct __drm_private_objs_state {
 	 * Before a commit, and the call to
 	 * drm_atomic_helper_swap_state() in particular, it points to
 	 * the same state than @new_state. After a commit, it points to
 	 * the same state than @old_state.
 	 */
-	struct drm_private_state *state;
+	struct drm_private_state *freeable_state;
 
 	struct drm_private_state *old_state, *new_state;
 };
 
 /**

---
base-commit: 7a031e8d3528ba0860d282ffd3c88fbda4bf8c4c
change-id: 20251006-drm-rename-state-b2b0fed05f82

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

