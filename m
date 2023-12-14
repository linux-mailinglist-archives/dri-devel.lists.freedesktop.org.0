Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58961812C81
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4EB10E900;
	Thu, 14 Dec 2023 10:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3353F10E8F9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 10:09:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B7E43CE10E4;
 Thu, 14 Dec 2023 10:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E73C433C8;
 Thu, 14 Dec 2023 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702548561;
 bh=+11YBo0kmFgr2krbb5UDhkf2knSUBIclo+6BcfnIGvs=;
 h=From:To:Cc:Subject:Date:From;
 b=juRBcW/iMj5z+FZai6bfPLjompiA9NKXlf5UGxldoNN/zCgTMD+x8Xi3YcmXLxCDN
 pA5XhL+K50hHq0u6kpbAiImW3MtwsaanSmUbLRDsMbA7zKXx7LLOsGHds7oPrsrwXQ
 gWaBEdTrDU6k62WiCseUJPHb/x6Ej38BZLldXQTFxuW+rXvPlbeI9P2dBmPWl843rH
 PjVPpdSBHWcA071klJf2zqoePQiuboOWjGqyLFUztNya0JJXt7evV9j4EovUNZLUSj
 FRIaGVKL+kxac+M1+tghLMdaqB14JSmIxFwNmj+0THskmXZEkgvMK8+iTsguSWy9g0
 B9OxxYp8+uVOA==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 1/5] drm/atomic: Move the drm_atomic_state field doc inline
Date: Thu, 14 Dec 2023 11:09:12 +0100
Message-ID: <20231214100917.277842-1-mripard@kernel.org>
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some fields of drm_atomic_state have been documented in-line, but some
were documented in the main kerneldoc block before the structure.

Since the former is the preferred option in DRM, let's move all the
fields to an inline documentation.

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
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

