Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5AF74093F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 07:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C9F10E358;
	Wed, 28 Jun 2023 05:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020A410E355
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 05:21:56 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 88A0D324FBE;
 Wed, 28 Jun 2023 06:21:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1687929714; bh=xCkWyjfyA9kPokoRaC60GU1p6SAoj9MczZmQ63VrJYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mnFurI9wES4gH3ryUqjPceRY8rZ8Fj9Bvlzc34HGBkQ1i9NFvAu/VqP5CCtnTKEKR
 CjEHJadNkESmvAradrTV8Z10vegGU82DNkbCq6T78I9lot2JtnbqcH5WBSdQAOXj+D
 Etd+/ddNFJ+q1NxmF/2sVq5RJiBGvdYkD1teP8wfYqVTWES5w7rVEBFMILsn9Lfkns
 8XWjuEODHWOl/sN6xn7G+P9PGcTKgn5ZHq+KLp+Y4lIhFHTekACQKibytKkwEWqKV2
 UntDIjL5KmkZzj1T00sLS47jzQV2gCHkwp5xJOf3TASUEbrOecHa0wM7zDh86aI4Tr
 FVHI4wfZd2k2w==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 7/8] drm: Remove legacy cursor hotspot code
Date: Wed, 28 Jun 2023 01:21:32 -0400
Message-Id: <20230628052133.553154-8-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628052133.553154-1-zack@kde.org>
References: <20230628052133.553154-1-zack@kde.org>
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

