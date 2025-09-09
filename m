Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEAFB4ABCF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAF910E6A7;
	Tue,  9 Sep 2025 11:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tufnAc0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B92310E6A7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 347C844248;
 Tue,  9 Sep 2025 11:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C2FC4CEF7;
 Tue,  9 Sep 2025 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417293;
 bh=0E/FbUNXvha4JUtPWhXsAdlAR06iBe44Vr5er+olGXI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tufnAc0EtFRePKgH3YqYBnWeUumveXe2MlrX8T5Gic8WEHhEXIns9f/AJv7NIp9k0
 8xbsqzBCe+ucxT3zw0Pss8mJZh5VaTzIz3PxBg5TDFF0dYVWD1OPw9iMqU57vswt7c
 HOG9hMM7fsR8Q5lC0Ip6MaWtsbGONgMNeOoQqd9+0JLKI6ey+qMqeBWgpHkG4M9koo
 v53i6XUFM5Wa4R/D7VO3WHBBj5ifwtRpL1N6i567jgvwunw+TcmmCiOG9ttvI2SwAV
 4M3v8mT2+owsHt00LOQY3ntuq82BKjbeq1/V8thzxlLpXeAuNxjxVmlabHfdT5Qh/8
 JYI9/L9yIx0Jg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:27 +0200
Subject: [PATCH v3 08/39] drm/atomic: Remove unused
 drm_atomic_get_existing_plane_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-8-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0E/FbUNXvha4JUtPWhXsAdlAR06iBe44Vr5er+olGXI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+FUvbP7yooGX4efzR/E7dKd++bfmreS5Pf9+rHthl
 Mlp836Dd8dUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgGYyLKNjA3vje7+t3i7zWNv
 XOJU0WPXo0OFYqJ87jkJZt9abSctOG2F4YJTZjxvPqSV9an2l8UH32ZseGnyK0PK7riR7cqqpz0
 RbcaNE/2NZmuyPl6mOH1bP+N2cWuDNUkb/4Us26GhlOFjEu8OAA==
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

