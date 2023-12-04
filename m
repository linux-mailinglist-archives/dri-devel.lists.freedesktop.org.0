Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCFB803250
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAC010E19C;
	Mon,  4 Dec 2023 12:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDBD10E18A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:17:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34CF0CE0F42;
 Mon,  4 Dec 2023 12:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573FFC433C8;
 Mon,  4 Dec 2023 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701692230;
 bh=I6XRYrkt4NjAvPCxEXWxs429NTsQWs1vTGJqrkVbsPY=;
 h=From:To:Cc:Subject:Date:From;
 b=kgFpfccP3mkzDbewbYTnuVKpp4AlpNYI6zHykVf6qxi9n8SKFlAgS/iYSzYESmMjz
 xEba+gjtRm4sSl/HTlI93D6jV/6ZugkTdaebWci68nZ18U09A2ASpp4NGmEj1LQMPt
 LNK9jZ1Z0+l7IMOkfEk/ic4yAhW4uB7xh/x5YmKGG/48A1uOp6WWhbSZFtQUbnhtvq
 wFt7Op7FJRWVEE3UU42G2Q5bHumQp/YOYyNXnVNyKX9lPWzvTVYqJa/26Ry6oJrQaK
 RavxO/IOrEK2JXkk4fwwg7XVwVKbjw7Pbyo1lErE9x6P9c/xRf+CiP30nBmtoJ7Jt0
 Dy9WpRmdNZpqw==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/5] drm/atomic: Move the drm_atomic_state field doc inline
Date: Mon,  4 Dec 2023 13:17:03 +0100
Message-ID: <20231204121707.3647961-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some fields of drm_atomic_state have been documented in-line, but some
were documented in the main kerneldoc block before the structure.

Since the former is the preferred option in DRM, let's move all the
fields to an inline documentation.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 50 ++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index cf8e1220a4ac..2a08030fcd75 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -347,24 +347,22 @@ struct __drm_private_objs_state {
 
 /**
  * struct drm_atomic_state - the global state object for atomic updates
- * @ref: count of all references to this state (will not be freed until zero)
- * @dev: parent DRM device
- * @async_update: hint for asynchronous plane update
- * @planes: pointer to array of structures with per-plane data
- * @crtcs: pointer to array of CRTC pointers
- * @num_connector: size of the @connectors and @connector_states arrays
- * @connectors: pointer to array of structures with per-connector data
- * @num_private_objs: size of the @private_objs array
- * @private_objs: pointer to array of private object pointers
- * @acquire_ctx: acquire context for this atomic modeset state update
  *
  * States are added to an atomic update by calling drm_atomic_get_crtc_state(),
  * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
  * private state structures, drm_atomic_get_private_obj_state().
  */
 struct drm_atomic_state {
+	/**
+	 * @ref:
+	 *
+	 * Count of all references to this update (will not be freed until zero).
+	 */
 	struct kref ref;
 
+	/**
+	 * @dev: Parent DRM Device.
+	 */
 	struct drm_device *dev;
 
 	/**
@@ -388,7 +386,12 @@ struct drm_atomic_state {
 	 * flag are not allowed.
 	 */
 	bool legacy_cursor_update : 1;
+
+	/**
+	 * @async_update: hint for asynchronous plane update
+	 */
 	bool async_update : 1;
+
 	/**
 	 * @duplicated:
 	 *
@@ -398,13 +401,40 @@ struct drm_atomic_state {
 	 * states.
 	 */
 	bool duplicated : 1;
+
+	/**
+	 * @planes: pointer to array of structures with per-plane data
+	 */
 	struct __drm_planes_state *planes;
+
+	/**
+	 * @crtcs: pointer to array of CRTC pointers
+	 */
 	struct __drm_crtcs_state *crtcs;
+
+	/**
+	 * @num_connector: size of the @connectors and @connector_states arrays
+	 */
 	int num_connector;
+
+	/**
+	 * @connectors: pointer to array of structures with per-connector data
+	 */
 	struct __drm_connnectors_state *connectors;
+
+	/**
+	 * @num_private_objs: size of the @private_objs array
+	 */
 	int num_private_objs;
+
+	/**
+	 * @private_objs: pointer to array of private object pointers
+	 */
 	struct __drm_private_objs_state *private_objs;
 
+	/**
+	 * @acquire_ctx: acquire context for this atomic modeset state update
+	 */
 	struct drm_modeset_acquire_ctx *acquire_ctx;
 
 	/**
-- 
2.43.0

