Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D411FBAC96A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A758C10E574;
	Tue, 30 Sep 2025 11:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PSa9nCPC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CA010E570
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C95B439A0;
 Tue, 30 Sep 2025 11:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8287CC4CEF0;
 Tue, 30 Sep 2025 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230015;
 bh=u1Ar0uPrY0y072B2mm7n9GaCFQn0XBkkmJGA4p9Tw3M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PSa9nCPC6Qwa+qRWrkv6WNzstfz631l3TeNXavriALjGu8cOI8P/9TpM6EBMkvghE
 +x/U8Eax7GVlKXAbwJGfT4Nr3Q/sBBTF32vxwtYk5+wRGICP86lgZ+X2rYzUqfDa92
 NVV0rZ7EK5bhZkmHKryseB8it+scYUTCN6WLOjsSmumzHExnE9jDCfSWRQyUS5o9rH
 zfjTkfA0pGpQBH4K+vNDE6qZccegWcsB4zEAp6DOPGb5Ml21yCpKf4Ydby0N19I63E
 4W1Hk5bIWoLzLWtKZnRhHHyyUHIxsXwc2hKZyQwnMq6C3VNU3Jwh3kZ6T6s9Qdsvoo
 IdE2nFc5LR6KQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:19 +0200
Subject: [PATCH v5 04/39] drm/atomic: Convert
 __drm_atomic_get_current_plane_state() to modern accessor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-4-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3784; i=mripard@kernel.org;
 h=from:subject:message-id; bh=u1Ar0uPrY0y072B2mm7n9GaCFQn0XBkkmJGA4p9Tw3M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dyjqqgcW3Pj326v6nNvyv7MWl/pVryqPKo+fI3lxL
 8cr/h9vO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEHpoz1uc8a3+0Oa3m5I5l
 PHtOf2W16F1/+9Eii8xL/PuUyhk2ZGzfKRLw7oXcrrSPl+74Cy0Vz2SsTxNW6+JeclYj1DRUiM/
 be8pzGR6had4fAhfU1e1h0eu4zvLu5j23uNUV8psuPWVytpIAAA==
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

The __drm_atomic_get_current_plane_state() function tries to get and
return the existing plane state, and if it doesn't exist returns the one
stored in the drm_plane->state field.

Using the current nomenclature, it tries to get the existing plane state
with an ad-hoc implementation of drm_atomic_get_existing_plane_state(),
and falls back to either the old or new plane state, depending on
whether it is called before or after drm_atomic_helper_swap_state().

The existing plane state itself is deprecated, because it also changes
when swapping states from the new state to the old state.

Fortunately for us, we can simplify things. Indeed,
__drm_atomic_get_current_plane_state() is only used in two macros:
intel_atomic_crtc_state_for_each_plane_state and
drm_atomic_crtc_state_for_each_plane_state().

The intel variant is only used through the intel_wm_compute() function
that is only ever called in intel_crtc_atomic_check().

The generic variant is more widely used, and can be found in the malidp,
msm, tegra and vc4 drivers. All of these call sites though are during
atomic_check(), so we end up in the same situation than Intel's.

Thus, we only ever use the existing state as the new state, and
plane->state is always going to be the old state. Any plane isn't
guaranteed to be part of the state though, so we can't rely on
drm_atomic_get_old_plane_state() and we still need to use plane->state.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index fe47715c31e41ad8bd45140fe6413b57b69b7c61..c8b88990506e5c9d2cbed76d04aca74efa8db346 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -791,15 +791,15 @@ drm_atomic_get_new_connector_state(const struct drm_atomic_state *state,
 /**
  * __drm_atomic_get_current_plane_state - get current plane state
  * @state: global atomic state object
  * @plane: plane to grab
  *
- * This function returns the plane state for the given plane, either from
- * @state, or if the plane isn't part of the atomic state update, from @plane.
- * This is useful in atomic check callbacks, when drivers need to peek at, but
- * not change, state of other planes, since it avoids threading an error code
- * back up the call chain.
+ * This function returns the plane state for the given plane, either the
+ * new plane state from @state, or if the plane isn't part of the atomic
+ * state update, from @plane. This is useful in atomic check callbacks,
+ * when drivers need to peek at, but not change, state of other planes,
+ * since it avoids threading an error code back up the call chain.
  *
  * WARNING:
  *
  * Note that this function is in general unsafe since it doesn't check for the
  * required locking for access state structures. Drivers must ensure that it is
@@ -816,13 +816,19 @@ drm_atomic_get_new_connector_state(const struct drm_atomic_state *state,
  */
 static inline const struct drm_plane_state *
 __drm_atomic_get_current_plane_state(const struct drm_atomic_state *state,
 				     struct drm_plane *plane)
 {
-	if (state->planes[drm_plane_index(plane)].state)
-		return state->planes[drm_plane_index(plane)].state;
+	struct drm_plane_state *plane_state;
 
+	plane_state = drm_atomic_get_new_plane_state(state, plane);
+	if (plane_state)
+		return plane_state;
+
+	/*
+	 * If the plane isn't part of the state, fallback to the currently active one.
+	 */
 	return plane->state;
 }
 
 int __must_check
 drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,

-- 
2.51.0

