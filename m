Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B01BAC967
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79E610E578;
	Tue, 30 Sep 2025 11:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uvv8In3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B96C10E578
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E7399439A0;
 Tue, 30 Sep 2025 11:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF4BC4CEF0;
 Tue, 30 Sep 2025 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230021;
 bh=7wtmdcX3/1Q9quMr/jRbnPIUtOLj0Fo/iDb3ZFSUR/E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Uvv8In3ovLKi6l+qtHTouuIla04o9XTLA+bsA1ZARy6xveUsZoIBy6ldJUt8Wl50P
 GxZJFuZ9XwqLO7j1MGWOQsxYiBWYhbcVyAQXXjNZ6TqkqI7oxxKhMVasezSelwxEQY
 C6R5e7Jeiah4ubfgFu2UmSeN5z875BaDqRw+2xg0Wm09aKqi73e3ukbxKmkLWAspgT
 g7sXQxIAlRbPHSmvdpuOGr6UIEaqEbQLyU8+uhCZ5+XyZxNu2Zeozfcw6AJY7T4Iob
 gK+FdwS9eogm3sDnzD441E3Yqx7HckQX0BC/7sWmsBzLadVKN0XMpQQrE68Hz4QuFa
 jp63tScA7cw1A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:21 +0200
Subject: [PATCH v5 06/39] drm/vkms: Convert vkms_crtc_atomic_check() to use
 new plane state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-6-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7wtmdcX3/1Q9quMr/jRbnPIUtOLj0Fo/iDb3ZFSUR/E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dyh55MyZUT1LSujTAUsDqxS31na315XKTUdU++fWN
 1+Raj3RMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaSd4SxoT8hootPxOLBjE1b
 lonGzX1m77XIufDRfY5c1vnvD/9hzr3Rfkct4OKZCZOUVBptXThOMNapFN0xSuaa6nDws5zw/v2
 nq76/Wim1fFZ14Iv67SKeH92WyGSs5I/pvd+l+2eS89R9G/cCAA==
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

The vkms_crtc_atomic_check() function calls the deprecated
drm_atomic_get_existing_plane_state() helper for its internal mode
checking logic.

During atomic_check, the existing state is the new state and
drm_atomic_get_existing_plane_state() can thus be replaced by
drm_atomic_get_new_plane_state().

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index e60573e0f3e9510252e1f198b00e28bcc7987620..48237f32ac3b8f78b1495e8fbcc630be863ec7e4 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -183,11 +183,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	ret = drm_atomic_add_affected_planes(crtc_state->state, crtc);
 	if (ret < 0)
 		return ret;
 
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
+		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 		WARN_ON(!plane_state);
 
 		if (!plane_state->visible)
 			continue;
 
@@ -199,11 +199,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
 	i = 0;
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
+		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 
 		if (!plane_state->visible)
 			continue;
 
 		vkms_state->active_planes[i++] =

-- 
2.51.0

