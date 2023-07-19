Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA60758AF8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 03:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D55810E3F4;
	Wed, 19 Jul 2023 01:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C446E10E3EE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:42:37 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 6C0963262AF;
 Wed, 19 Jul 2023 02:42:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1689730956; bh=xCkWyjfyA9kPokoRaC60GU1p6SAoj9MczZmQ63VrJYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ee5qdvbkK9gK70fQQ3MrOoZjJHjbyRFPv/2E35NGDGYMVVnad/1mZqnTlP8TNnCCa
 VVyWO8YQ9YHeK5hZFEngP7Ya7pTcvN70XCTal/W0hnv7e0bsDuGPrWfJ6p9tTaFa3s
 lOn3XziM9BaDHkHPr2X2xOzuBzBd+J1Bb+A/2Uu/8ZPG1YbYd4opdjHz127KRGVfOv
 mIRFBZ6iMymadpU1ldlma9tKnPgO2p/8Eyz9uWyHaLdQDZ7gZ/L3mSHIJ1sa9tJa9i
 xP6WVUdMF4ge6+cVZ8ka8wExtS2ezWKdNpzOzEBndrHJXobyBj4CUXn3a9ZD6rts2o
 OqqlBBc51s4pA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 7/9] drm: Remove legacy cursor hotspot code
Date: Tue, 18 Jul 2023 21:42:16 -0400
Message-Id: <20230719014218.1700057-8-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719014218.1700057-1-zack@kde.org>
References: <20230719014218.1700057-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, javierm@redhat.com, banackm@vmware.com,
 krastevm@vmware.com, ppaalanen@gmail.com, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting supports mouse cursor offsets via the hotspot
properties that are created on cursor planes. All drivers which
support hotspots are atomic and the legacy code has been implemented
in terms of the atomic properties as well.

Due to the above the lagacy cursor hotspot code is no longer used or
needed and can be removed.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_plane.c   |  3 ---
 include/drm/drm_framebuffer.h | 12 ------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index eaca367bdc7e..1dc00ad4c33c 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1110,9 +1110,6 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
 				return PTR_ERR(fb);
 			}
 
-			fb->hot_x = req->hot_x;
-			fb->hot_y = req->hot_y;
-
 			if (plane->hotspot_x_property && plane->state)
 				plane->state->hotspot_x = req->hot_x;
 			if (plane->hotspot_y_property && plane->state)
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 0dcc07b68654..1e108c1789b1 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -188,18 +188,6 @@ struct drm_framebuffer {
 	 * DRM_MODE_FB_MODIFIERS.
 	 */
 	int flags;
-	/**
-	 * @hot_x: X coordinate of the cursor hotspot. Used by the legacy cursor
-	 * IOCTL when the driver supports cursor through a DRM_PLANE_TYPE_CURSOR
-	 * universal plane.
-	 */
-	int hot_x;
-	/**
-	 * @hot_y: Y coordinate of the cursor hotspot. Used by the legacy cursor
-	 * IOCTL when the driver supports cursor through a DRM_PLANE_TYPE_CURSOR
-	 * universal plane.
-	 */
-	int hot_y;
 	/**
 	 * @filp_head: Placed on &drm_file.fbs, protected by &drm_file.fbs_lock.
 	 */
-- 
2.39.2

