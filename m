Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB58414CA2D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 13:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04676F51C;
	Wed, 29 Jan 2020 12:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE2D6E339
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 12:05:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2EF1BB1C6;
 Wed, 29 Jan 2020 12:05:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v5 11/15] drm/st7586: Remove sending of vblank event
Date: Wed, 29 Jan 2020 13:05:27 +0100
Message-Id: <20200129120531.6891-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The atomic helpers automatically send out fake VBLANK events if no
vblanking has been initialized. Remove the sending code from the
driver.

v4:
	* separate commit from core vblank changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/tiny/st7586.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 060cc756194f..9ef559dd3191 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -23,7 +23,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_rect.h>
-#include <drm/drm_vblank.h>
 
 /* controller-specific commands */
 #define ST7586_DISP_MODE_GRAY	0x38
@@ -159,18 +158,10 @@ static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		st7586_fb_dirty(state->fb, &rect);
-
-	if (crtc->state->event) {
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-		crtc->state->event = NULL;
-	}
 }
 
 static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
