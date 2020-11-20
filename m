Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C542BA758
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 11:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD26A6E8AD;
	Fri, 20 Nov 2020 10:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF8C6E8BE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1658AEEF;
 Fri, 20 Nov 2020 10:25:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 07/10] drm/fb-helper: Move damage blit code and its setup
 into separate routine
Date: Fri, 20 Nov 2020 11:25:42 +0100
Message-Id: <20201120102545.4047-8-tzimmermann@suse.de>
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

Introduce a separate function for the blit code and its vmap setup. Done
in preparation of additional changes. No functional changes are made.

v2:
	* print a single warning if damage blitter fails

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index bdfdf60e7bd8..b0bde894bf39 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -391,14 +391,32 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
 	}
 }
 
+static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
+				     struct drm_clip_rect *clip)
+{
+	struct drm_client_buffer *buffer = fb_helper->buffer;
+	struct dma_buf_map map;
+	int ret;
+
+	ret = drm_client_buffer_vmap(buffer, &map);
+	if (ret)
+		return ret;
+
+	drm_fb_helper_damage_blit_real(fb_helper, clip, &map);
+
+	drm_client_buffer_vunmap(buffer);
+
+	return 0;
+}
+
 static void drm_fb_helper_damage_work(struct work_struct *work)
 {
 	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
 						    damage_work);
+	struct drm_device *dev = helper->dev;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
-	struct dma_buf_map map;
 	int ret;
 
 	spin_lock_irqsave(&helper->damage_lock, flags);
@@ -411,13 +429,10 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
 	if (!(clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2))
 		return;
 
-	/* Generic fbdev uses a shadow buffer */
 	if (helper->buffer) {
-		ret = drm_client_buffer_vmap(helper->buffer, &map);
-		if (ret)
+		ret = drm_fb_helper_damage_blit(helper, &clip_copy);
+		if (drm_WARN_ON_ONCE(dev, ret))
 			return;
-		drm_fb_helper_damage_blit_real(helper, &clip_copy, &map);
-		drm_client_buffer_vunmap(helper->buffer);
 	}
 
 	if (helper->fb->funcs->dirty)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
