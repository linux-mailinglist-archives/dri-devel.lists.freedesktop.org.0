Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE9812C82
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC7110E8F9;
	Thu, 14 Dec 2023 10:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAF910E906
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 10:09:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9A81ACE2270;
 Thu, 14 Dec 2023 10:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DAEC433C7;
 Thu, 14 Dec 2023 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702548566;
 bh=H209USp+BPkGA8SeKFE6v91ToS7a7y8PB9+ctzoobn0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YRbhxXt5n99dUCpctoff+UWkOC1yoVfTFXEVGlKFhHVbkN6BWN6mL9vHaUIL5cD4M
 d+YTfQLP9B5j7tnZvGRZ2D+0H0IEpnuZLqE3mTQXgpu2JoqFcSWLB6pG04UDevgmfq
 Sfd2ki14T0FFfd2pBUrYg76+jKGZX9RO0Vt8YGLU/7leflH6bbPmBkcl7qJPsVU511
 rT6LWdJiepFd1Naj8IY0hU7PKnBrjFSqc+Hp752PGkpevDNKqvvNgJeRmOdSpSS+25
 TeMiP8v9SuwbTAP7Ykvee6iKsqWiS90n6OO7UM3HNRN3rlvNSEjLaFb5/WDYm9SA5V
 i+CHT90RmQQqg==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 3/5] drm/atomic: Rework the object doc a bit
Date: Thu, 14 Dec 2023 11:09:14 +0100
Message-ID: <20231214100917.277842-3-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214100917.277842-1-mripard@kernel.org>
References: <20231214100917.277842-1-mripard@kernel.org>
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

Commits 63e83c1dba54 ("drm: Consolidate connector arrays in
drm_atomic_state"), b8b5342b699b ("drm: Consolidate plane arrays in
drm_atomic_state") and 5d943aa6c0d4 ("drm: Consolidate crtc arrays in
drm_atomic_state") moved the object pointer and their state pointer to
an intermediate structure storing both.

The CRTC commit didn't update the doc of the crtcs field to reflect
that, and the doc for the planes and connectors fields mention that they
are pointers to an array of structures with per-$OBJECT data.

The private_objs field was added later on by commit b430c27a7de3 ("drm:
Add driver-private objects to atomic state") reusing the same sentence
than the crtcs field, probably due to copy and paste.

While these fields are indeed pointers to an array, each item of that
array contain a pointer to the object structure affected by the update,
and its old and new state. There's no per-object data there, and there's
more than just a pointer to the objects.

Let's rephrase those fields a bit to better match the current situation.

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

