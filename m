Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C52C83CC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B976E463;
	Mon, 30 Nov 2020 12:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D031189D66
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:04:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D4C2AE65;
 Mon, 30 Nov 2020 12:04:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Subject: [PATCH 5/8] drm/vboxvideo: Use drm_gem_vram_vmap_unlocked() in cursor
 update
Date: Mon, 30 Nov 2020 13:04:30 +0100
Message-Id: <20201130120433.7205-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>
References: <20201130120433.7205-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change avoids to pin the source BO and instead acquires the BO's
reservations lock. Prevents concurrent access during the buffer update.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index dbc0dd53c69e..cd3001fa209f 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -401,11 +401,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 
 	vbox_crtc->cursor_enabled = true;
 
-	ret = drm_gem_vram_vmap(gbo, &map);
+	ret = drm_gem_vram_vmap_unlocked(gbo, &map, NULL);
 	if (ret) {
-		/*
-		 * BUG: we should have pinned the BO in prepare_fb().
-		 */
 		mutex_unlock(&vbox->hw_mutex);
 		DRM_WARN("Could not map cursor bo, skipping update\n");
 		return;
@@ -421,7 +418,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	data_size = width * height * 4 + mask_size;
 
 	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
-	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_vunmap_unlocked(gbo, &map);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
