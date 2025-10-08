Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E3BC524D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 15:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467D389B30;
	Wed,  8 Oct 2025 13:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CvR2V9C7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A9C10E32A;
 Wed,  8 Oct 2025 13:11:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 362F261FE6;
 Wed,  8 Oct 2025 13:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5B4C4CEF4;
 Wed,  8 Oct 2025 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759929106;
 bh=Rjxnb9v8OPdRmchJHGE4ToAHqtgpWsjRyLajQl5ctos=;
 h=From:Date:Subject:To:Cc:From;
 b=CvR2V9C7Oh+kS3sJN1+u6DuzWtq1byguoOwq0sfOn1xd9iB4yD9U90I3W9UhEyc9R
 I7Maw9f3tCpvB0h7UEMDpl/KiPiJ8HOQKeb+jpzIyoNnV8mt4bEoVPPi/KkRJ/6iQO
 xl2MB5FR6IhkeHwqtoPvVLnMKNK7Kjegcax8BsWBaYoDp0WhD7IusBqPEjlbbI0pLc
 1xO0ldYE/RKs4/Owh8r9NDu8kdsRfxt0KOelYbmTY/eqyzY2nm52kdTc4lCJ9WTMmj
 5wsotfhTdV6OktU6LOXZ4VdodBLPuVsAItGU+/9o3NLUR2pWwSNhw6DQY1CYJeOM18
 2GEIgUPGmahRw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 15:11:42 +0200
Subject: [PATCH v2] drm/atomic: Change state pointers to a more meaningful name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-rename-state-v2-1-49b490b2676a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAA1j5mgC/32NQQ6CMBBFr0Jm7Zh2QsW48h6GRQsDNEoh04ZoS
 O9u5QAu30v++ztEFs8RbtUOwpuPfgkF6FRBN9kwMvq+MJAio5W6YC8zCgc7M8ZkE6MjpwbulRm
 uBGW2Cg/+fSQfbeHJx7TI53jY9M/+iW0aNRrXdLU2ddOQuz9ZAr/Oi4zQ5py/MIx2QbEAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11832; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Rjxnb9v8OPdRmchJHGE4ToAHqtgpWsjRyLajQl5ctos=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPkvlzWjyua9/S2DL9pb2PzC1dNgO9a99a9vhf2M71V
 LT/3ZzOjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR7bcYG9YKfyyOc68T7X6V
 nGK0tzbT+Iy0JJ/mFi+/ALGth1MntdXfduhdL5Qo9iJ3XfnvM4GujPWe0bLH364WMShhjlF2c5h
 081sN/7c7Rjd1Da6bNxza8UYwXX3xxSdrUrhOnzpab9008zsA
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
Changes in v2:
- Switch from freeable_state to state_to_destroy
- Link to v1: https://lore.kernel.org/r/20251006-drm-rename-state-v1-1-5b7c4154772b@kernel.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 ++--
 drivers/gpu/drm/drm_atomic.c                      | 24 +++++++++++------------
 drivers/gpu/drm/drm_atomic_helper.c               |  8 ++++----
 include/drm/drm_atomic.h                          | 16 +++++++--------
 4 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 62defeccbb5ca09c89523fc4112d2085bbdbb0a9..275e237c1058b76640c8dd36443b034c6c71f84f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -12335,22 +12335,22 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 
 			if (obj->funcs == adev->dm.atomic_obj.funcs) {
 				int j = state->num_private_objs-1;
 
 				dm_atomic_destroy_state(obj,
-						state->private_objs[i].state);
+						state->private_objs[i].state_to_destroy);
 
 				/* If i is not at the end of the array then the
 				 * last element needs to be moved to where i was
 				 * before the array can safely be truncated.
 				 */
 				if (i != j)
 					state->private_objs[i] =
 						state->private_objs[j];
 
 				state->private_objs[j].ptr = NULL;
-				state->private_objs[j].state = NULL;
+				state->private_objs[j].state_to_destroy = NULL;
 				state->private_objs[j].old_state = NULL;
 				state->private_objs[j].new_state = NULL;
 
 				state->num_private_objs = j;
 				break;
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0fda567c390057b10bce691d9ddc11308088d92e..be2cb6e43cb07fbe553d1ab875911253be628d1a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -205,13 +205,13 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 
 		if (!connector)
 			continue;
 
 		connector->funcs->atomic_destroy_state(connector,
-						       state->connectors[i].state);
+						       state->connectors[i].state_to_destroy);
 		state->connectors[i].ptr = NULL;
-		state->connectors[i].state = NULL;
+		state->connectors[i].state_to_destroy = NULL;
 		state->connectors[i].old_state = NULL;
 		state->connectors[i].new_state = NULL;
 		drm_connector_put(connector);
 	}
 
@@ -220,14 +220,14 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 
 		if (!crtc)
 			continue;
 
 		crtc->funcs->atomic_destroy_state(crtc,
-						  state->crtcs[i].state);
+						  state->crtcs[i].state_to_destroy);
 
 		state->crtcs[i].ptr = NULL;
-		state->crtcs[i].state = NULL;
+		state->crtcs[i].state_to_destroy = NULL;
 		state->crtcs[i].old_state = NULL;
 		state->crtcs[i].new_state = NULL;
 
 		if (state->crtcs[i].commit) {
 			drm_crtc_commit_put(state->crtcs[i].commit);
@@ -240,24 +240,24 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 
 		if (!plane)
 			continue;
 
 		plane->funcs->atomic_destroy_state(plane,
-						   state->planes[i].state);
+						   state->planes[i].state_to_destroy);
 		state->planes[i].ptr = NULL;
-		state->planes[i].state = NULL;
+		state->planes[i].state_to_destroy = NULL;
 		state->planes[i].old_state = NULL;
 		state->planes[i].new_state = NULL;
 	}
 
 	for (i = 0; i < state->num_private_objs; i++) {
 		struct drm_private_obj *obj = state->private_objs[i].ptr;
 
 		obj->funcs->atomic_destroy_state(obj,
-						 state->private_objs[i].state);
+						 state->private_objs[i].state_to_destroy);
 		state->private_objs[i].ptr = NULL;
-		state->private_objs[i].state = NULL;
+		state->private_objs[i].state_to_destroy = NULL;
 		state->private_objs[i].old_state = NULL;
 		state->private_objs[i].new_state = NULL;
 	}
 	state->num_private_objs = 0;
 
@@ -359,11 +359,11 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 
 	crtc_state = crtc->funcs->atomic_duplicate_state(crtc);
 	if (!crtc_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->crtcs[index].state = crtc_state;
+	state->crtcs[index].state_to_destroy = crtc_state;
 	state->crtcs[index].old_state = crtc->state;
 	state->crtcs[index].new_state = crtc_state;
 	state->crtcs[index].ptr = crtc;
 	crtc_state->state = state;
 
@@ -544,11 +544,11 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 
 	plane_state = plane->funcs->atomic_duplicate_state(plane);
 	if (!plane_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->planes[index].state = plane_state;
+	state->planes[index].state_to_destroy = plane_state;
 	state->planes[index].ptr = plane;
 	state->planes[index].old_state = plane->state;
 	state->planes[index].new_state = plane_state;
 	plane_state->state = state;
 
@@ -856,11 +856,11 @@ drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 
 	obj_state = obj->funcs->atomic_duplicate_state(obj);
 	if (!obj_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->private_objs[index].state = obj_state;
+	state->private_objs[index].state_to_destroy = obj_state;
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
+	state->connectors[index].state_to_destroy = connector_state;
 	state->connectors[index].old_state = connector->state;
 	state->connectors[index].new_state = connector_state;
 	state->connectors[index].ptr = connector;
 	connector_state->state = state;
 
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acbc5a08aef7fa41ecb9ed5d8fa8e80..5a473a274ff06d7ab83039e0a6328e1372b80a00 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3234,21 +3234,21 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 		WARN_ON(connector->state != old_conn_state);
 
 		old_conn_state->state = state;
 		new_conn_state->state = NULL;
 
-		state->connectors[i].state = old_conn_state;
+		state->connectors[i].state_to_destroy = old_conn_state;
 		connector->state = new_conn_state;
 	}
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		WARN_ON(crtc->state != old_crtc_state);
 
 		old_crtc_state->state = state;
 		new_crtc_state->state = NULL;
 
-		state->crtcs[i].state = old_crtc_state;
+		state->crtcs[i].state_to_destroy = old_crtc_state;
 		crtc->state = new_crtc_state;
 
 		if (new_crtc_state->commit) {
 			spin_lock(&crtc->commit_lock);
 			list_add(&new_crtc_state->commit->commit_entry,
@@ -3264,22 +3264,22 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 		WARN_ON(plane->state != old_plane_state);
 
 		old_plane_state->state = state;
 		new_plane_state->state = NULL;
 
-		state->planes[i].state = old_plane_state;
+		state->planes[i].state_to_destroy = old_plane_state;
 		plane->state = new_plane_state;
 	}
 	drm_panic_unlock(state->dev, flags);
 
 	for_each_oldnew_private_obj_in_state(state, obj, old_obj_state, new_obj_state, i) {
 		WARN_ON(obj->state != old_obj_state);
 
 		old_obj_state->state = state;
 		new_obj_state->state = NULL;
 
-		state->private_objs[i].state = old_obj_state;
+		state->private_objs[i].state_to_destroy = old_obj_state;
 		obj->state = new_obj_state;
 	}
 
 	return 0;
 }
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index c8ab2163bf658cd06b12a8dabada7c088a328654..155e82f87e4d47161475b57fc28762d7ba8fd206 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -159,11 +159,11 @@ struct drm_crtc_commit {
 
 struct __drm_planes_state {
 	struct drm_plane *ptr;
 
 	/**
-	 * @state:
+	 * @state_to_destroy:
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
+	struct drm_plane_state *state_to_destroy;
 
 	struct drm_plane_state *old_state, *new_state;
 };
 
 struct __drm_crtcs_state {
 	struct drm_crtc *ptr;
 
 	/**
-	 * @state:
+	 * @state_to_destroy:
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
+	struct drm_crtc_state *state_to_destroy;
 
 	struct drm_crtc_state *old_state, *new_state;
 
 	/**
 	 * @commit:
@@ -214,11 +214,11 @@ struct __drm_crtcs_state {
 
 struct __drm_connnectors_state {
 	struct drm_connector *ptr;
 
 	/**
-	 * @state:
+	 * @state_to_destroy:
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
+	struct drm_connector_state *state_to_destroy;
 
 	struct drm_connector_state *old_state, *new_state;
 
 	/**
 	 * @out_fence_ptr:
@@ -391,11 +391,11 @@ struct drm_private_state {
 
 struct __drm_private_objs_state {
 	struct drm_private_obj *ptr;
 
 	/**
-	 * @state:
+	 * @state_to_destroy:
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
+	struct drm_private_state *state_to_destroy;
 
 	struct drm_private_state *old_state, *new_state;
 };
 
 /**

---
base-commit: 7a031e8d3528ba0860d282ffd3c88fbda4bf8c4c
change-id: 20251006-drm-rename-state-b2b0fed05f82

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

