Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32431803254
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F37410E1A4;
	Mon,  4 Dec 2023 12:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F228310E19D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:17:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2D25AB80DDF;
 Mon,  4 Dec 2023 12:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36780C433C8;
 Mon,  4 Dec 2023 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701692236;
 bh=PB5+W8JWCXdjgWgOMq0c62L51ZpD7HhrRCspxMcpfc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pOma7LdJ+eY5ZBvfh8eIeyVcCioaMCKA1wpGUoWaOcDYuA3yfyCC1QpUNsYt0HZtb
 27enblO8+OG5VZH9HvWyQ1A3J6kqMm8e9zAhaJx36GNIUyWAfenIzn/AppZ+FGW6tA
 jKv/G7VelWQhYWQJJS+Fww1Ul/es8poJ7txF8lLUCCsm84WtGy/sL4Q/1tVIAbNWfF
 CAtvQX2PnrYUA0A9ifcEz7hx5DFWWtSH86XAZhM3h5dV8kh1qrkqCZH5lWYyJBqjd6
 S8/TycO/vrCbgtqux8zK3QUry+644kGkx+a6BKZ7/ffV/WSB3YnzaVhx3/OrvDIquC
 CMkB/cnYX/jAQ==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 3/5] drm/atomic: Rework the object doc a bit
Date: Mon,  4 Dec 2023 13:17:05 +0100
Message-ID: <20231204121707.3647961-3-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204121707.3647961-1-mripard@kernel.org>
References: <20231204121707.3647961-1-mripard@kernel.org>
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

The doc for the planes, crtcs, connectors and private_objs fields
mention that they are pointers to an array of structures with
per-$OBJECT data.

While these fields are indeed pointers to an array, each item of that
array contain a pointer to the object structure affected by the update,
and its old and new state. There's no per-object data there.

Let's rephrase those fields a bit to better match the current situation.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 13cecdc1257d..914574b58ae7 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -403,12 +403,18 @@ struct drm_atomic_state {
 	bool duplicated : 1;
 
 	/**
-	 * @planes: pointer to array of structures with per-plane data
+	 * @planes:
+	 *
+	 * Pointer to array of @drm_plane and @drm_plane_state part of this
+	 * update.
 	 */
 	struct __drm_planes_state *planes;
 
 	/**
-	 * @crtcs: pointer to array of CRTC pointers
+	 * @crtcs:
+	 *
+	 * Pointer to array of @drm_crtc and @drm_crtc_state part of this
+	 * update.
 	 */
 	struct __drm_crtcs_state *crtcs;
 
@@ -418,7 +424,10 @@ struct drm_atomic_state {
 	int num_connector;
 
 	/**
-	 * @connectors: pointer to array of structures with per-connector data
+	 * @connectors:
+	 *
+	 * Pointer to array of @drm_connector and @drm_connector_state part of
+	 * this update.
 	 */
 	struct __drm_connnectors_state *connectors;
 
@@ -428,7 +437,10 @@ struct drm_atomic_state {
 	int num_private_objs;
 
 	/**
-	 * @private_objs: pointer to array of private object pointers
+	 * @private_objs:
+	 *
+	 * Pointer to array of @drm_private_obj and @drm_private_obj_state part
+	 * of this update.
 	 */
 	struct __drm_private_objs_state *private_objs;
 
-- 
2.43.0

