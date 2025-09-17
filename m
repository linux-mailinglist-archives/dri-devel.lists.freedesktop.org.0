Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B2EB802F6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65CB10E1CC;
	Wed, 17 Sep 2025 14:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YYYcNxKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E13410E866
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:46:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CF774178A;
 Wed, 17 Sep 2025 14:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4ACC4CEE7;
 Wed, 17 Sep 2025 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120393;
 bh=0E/FbUNXvha4JUtPWhXsAdlAR06iBe44Vr5er+olGXI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YYYcNxKfPwEjOmkr0cjj0dOD96PM1WH2ucr0RfaPdQwh+w8tRMdi+4I3FZGDPeaFT
 YoPQlNB3bomDKujyd6ldP5M8X6637FYncavCKWGiqFyYsnZewzQ7YP6N3NmTjlBZJ6
 nDDpVhrYj5MOcA2tbVHoOQ83h+qtZjk5gp5JfBaqTUmJvXOmjp+MSi4HNo30fuHzDA
 xt7ultlFAFVy4JiIt4XyB0SfRpkNII3pzBHW6hkmBSLJR8RKPi5XH6lkHyGJaXWIK/
 NLnQ84euaknsk4L/dYa4Zf5sCbfgv+1bQaccY0hFSEXnD2smUSdIxn0dnmu94PWXH+
 9UCcdNhlQYHyQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:49 +0200
Subject: [PATCH v4 08/39] drm/atomic: Remove unused
 drm_atomic_get_existing_plane_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-8-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0E/FbUNXvha4JUtPWhXsAdlAR06iBe44Vr5er+olGXI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi5iMSqrfpHz9Lhq4hr1NZMybxoFrN/16bFh5ou4n
 Y9L7CpFOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEkisZG65vr3uzbUndzwdx
 B1/Pf6i27lOr7q0Lzcb7Zf15LXg3rX002yDW/jP/Dzfh7y3/jxUt7mVsWFP3OeGzxtdV0QeTZfa
 ycv07ymg30X3SRBnGJzl7uz7dfMLzcm9e3opzd07PWtyn+4NdBgA=
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

The drm_atomic_get_existing_plane_state() function is deprecated and
isn't used anymore, so let's remove it.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/drm_atomic.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 82e74d9444c4fa7f02ee0e472c8c68f7bc44cc6a..2f2c92fc4c20ee4e6abd6911bd574969d9cabbbb 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -696,28 +696,10 @@ drm_atomic_get_new_crtc_state(const struct drm_atomic_state *state,
 			      struct drm_crtc *crtc)
 {
 	return state->crtcs[drm_crtc_index(crtc)].new_state;
 }
 
-/**
- * drm_atomic_get_existing_plane_state - get plane state, if it exists
- * @state: global atomic state object
- * @plane: plane to grab
- *
- * This function returns the plane state for the given plane, or NULL
- * if the plane is not part of the global atomic state.
- *
- * This function is deprecated, @drm_atomic_get_old_plane_state or
- * @drm_atomic_get_new_plane_state should be used instead.
- */
-static inline struct drm_plane_state *
-drm_atomic_get_existing_plane_state(const struct drm_atomic_state *state,
-				    struct drm_plane *plane)
-{
-	return state->planes[drm_plane_index(plane)].state;
-}
-
 /**
  * drm_atomic_get_old_plane_state - get plane state, if it exists
  * @state: global atomic state object
  * @plane: plane to grab
  *

-- 
2.50.1

