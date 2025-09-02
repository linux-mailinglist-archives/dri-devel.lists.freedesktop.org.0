Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF116B3FA95
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C2D10E622;
	Tue,  2 Sep 2025 09:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oxpch7iy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E006210E622
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C73C94084E;
 Tue,  2 Sep 2025 09:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C4FC4CEED;
 Tue,  2 Sep 2025 09:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805747;
 bh=3PYpw0YeuaFekoS2ekCjIGS5McOm11mjwICEE+xDOSI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oxpch7iypxO0R0u5UCxPwb6V8wbUNbHG41+s++rDMSGrWpJ2QdFhJB5EZW8x6c8h2
 Lp3ZoVTgOyxhY4kD+NPulswP0PM6V6ISPAuUdgB+wtnas/SqWZ5uZOdohJI+8NYu7K
 jL9MESL7e4Srw3kpHCWTXSjOHcOv9ZZPRyv+v4QhXo4uMHiCXNDBAy2ySJcoNy94mC
 Jen7ITzbJv8yvDXREPmxgNggr1Dbd1QoT62LDexF8bRzNa6x3qRECowh4JR6qEyHRt
 fNi4SjBfQS4LdVmvuwspdzRQbGbr5UxBnL7sPun+IZ37eeiUtf28fJ/Glr2ogvJmxf
 6nudbOLCC7tFA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:07 +0200
Subject: [PATCH v2 08/37] drm/atomic: Remove unused
 drm_atomic_get_existing_plane_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-8-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3PYpw0YeuaFekoS2ekCjIGS5McOm11mjwICEE+xDOSI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdvl3qdv1H1r0WkeF6d1viWip+wc7AxZcmWlpYF10f
 ev271M7O6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEGkQY60w+bWlunazBuUyR
 t8tnP5ddV6f3ku1+J/du0O0u1BBvnfsqaNKcomNa9zNL31ZV+ixfwVgfe0WvWlHr/qMppy91/Hj
 mkPTsCNNj99awC6zek1QnV5jwlpZ11vNNDbrwJOF1Wk6f7WIA
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

