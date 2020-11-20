Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFDD2BA759
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 11:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EAC6E8AE;
	Fri, 20 Nov 2020 10:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0D76E8AF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:25:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6D52AED9;
 Fri, 20 Nov 2020 10:25:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 02/10] drm/fb-helper: Unmap client buffer during shutdown
Date: Fri, 20 Nov 2020 11:25:37 +0100
Message-Id: <20201120102545.4047-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120102545.4047-1-tzimmermann@suse.de>
References: <20201120102545.4047-1-tzimmermann@suse.de>
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

The fbdev helper's generic probe function establishes a mapping for
framebuffers without shadow buffer. The clean-up function did not unmap
the buffer object. Add the unmap operation.

As fbdev devices are usally released during system shutdown, this has
not been a problem in practice.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 9c673f33d222..aa7af463c50d 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1988,14 +1988,19 @@ static void drm_fbdev_cleanup(struct drm_fb_helper *fb_helper)
 	if (!fb_helper->dev)
 		return;
 
-	if (fbi && fbi->fbdefio) {
-		fb_deferred_io_cleanup(fbi);
-		shadow = fbi->screen_buffer;
+	if (fbi) {
+		if (fbi->fbdefio)
+			fb_deferred_io_cleanup(fbi);
+		if (drm_fbdev_use_shadow_fb(fb_helper))
+			shadow = fbi->screen_buffer;
 	}
 
 	drm_fb_helper_fini(fb_helper);
 
-	vfree(shadow);
+	if (shadow)
+		vfree(shadow);
+	else
+		drm_client_buffer_vunmap(fb_helper->buffer);
 
 	drm_client_framebuffer_delete(fb_helper->buffer);
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
