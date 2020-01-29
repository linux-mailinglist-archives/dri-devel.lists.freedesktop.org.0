Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F4514CA2C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 13:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4546F518;
	Wed, 29 Jan 2020 12:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096296E339
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 12:05:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC3C5B1C8;
 Wed, 29 Jan 2020 12:05:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Subject: [PATCH v5 12/15] drm/udl: Don't set struct drm_crtc_state.no_vblank
 explictly
Date: Wed, 29 Jan 2020 13:05:28 +0100
Message-Id: <20200129120531.6891-13-tzimmermann@suse.de>
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

As udl does not initialize vblanking, atomic helpers initialize the
value of struct drm_crtc_state.no_vblank to be true. No need to set
it from within the driver.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/udl/udl_modeset.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 22af17959053..d59ebac70b15 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -375,8 +375,6 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	char *wrptr;
 	int color_depth = UDL_COLOR_DEPTH_16BPP;
 
-	crtc_state->no_vblank = true;
-
 	buf = (char *)udl->mode_buf;
 
 	/* This first section has to do with setting the base address on the
@@ -428,14 +426,6 @@ udl_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
 	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
 }
 
-static int
-udl_simple_display_pipe_check(struct drm_simple_display_pipe *pipe,
-			      struct drm_plane_state *plane_state,
-			      struct drm_crtc_state *crtc_state)
-{
-	return 0;
-}
-
 static void
 udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_plane_state)
@@ -457,7 +447,6 @@ struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
 	.mode_valid = udl_simple_display_pipe_mode_valid,
 	.enable = udl_simple_display_pipe_enable,
 	.disable = udl_simple_display_pipe_disable,
-	.check = udl_simple_display_pipe_check,
 	.update = udl_simple_display_pipe_update,
 	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
 };
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
