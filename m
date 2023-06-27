Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C673F31C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 05:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8E910E28A;
	Tue, 27 Jun 2023 03:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E97210E287
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 03:58:55 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id BED0D324C71;
 Tue, 27 Jun 2023 04:58:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1687838334; bh=5RKpMSGNzC+lpOnByizBn6A7pbHZXa7FEAAbVKIqMsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nBIUlynMw29+uitdMKV0KaCJ/3xWL76OT1bf8VBDgQJ96Ke4hmvuMMdbgOEFY4hVt
 oy75qe7d3EEIm1qaEHVnX0Xx5uKQr/iUrRME1yaEkBW9EFtX4xtmY+3EhLj5zq+Rf5
 Rt3jscgJZLyv+wRW3SbfNLukRTCtyq+YRLihBPGyKAvk2G1vzFeGYgJu3ClK23jrKD
 C+6DuyKHv+RQMB7AFGUu9FrDUYKskXha88RK7JeNKH6QU0D+Njv2I31vE0LZ0pLK/d
 EcJSzz9fzRsMmY5IRIN6xLAReFRMTl5pLtap7lloORoiBxd4WrqgdWJE2W9Y3k5Yn5
 0RLr0v63d/Xkw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/8] drm: Remove legacy cursor hotspot code
Date: Mon, 26 Jun 2023 23:58:38 -0400
Message-Id: <20230627035839.496399-8-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627035839.496399-1-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
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

Atomic modesetting support mouse cursor offsets via the hotspot
properties that are creates on cursor planes. All drivers which
support hotspot are atomic and the legacy code has been implemented
in terms of the atomic properties as well.

Due to the above the lagacy cursor hotspot code is no longer used or
needed and can be removed.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_plane.c   |  3 ---
 include/drm/drm_framebuffer.h | 12 ------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index ff1cc810d8f8..539fe0d94300 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1069,9 +1069,6 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
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

