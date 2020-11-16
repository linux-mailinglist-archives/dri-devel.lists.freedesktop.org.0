Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005582B51E0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D216E0EF;
	Mon, 16 Nov 2020 20:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0681989C53
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:04:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD77DAEAE;
 Mon, 16 Nov 2020 20:04:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com
Subject: [PATCH 05/10] drm/fb-helper: Return early in dirty worker
Date: Mon, 16 Nov 2020 21:04:32 +0100
Message-Id: <20201116200437.17977-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116200437.17977-1-tzimmermann@suse.de>
References: <20201116200437.17977-1-tzimmermann@suse.de>
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

Returning early in the dirty worker if no update is required makes the
code more readable. No functional changes are made.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 58db64cdbfa1..741ac8254a6e 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -407,24 +407,23 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
 	clip->x2 = clip->y2 = 0;
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
 
-	/* call dirty callback only when it has been really touched */
-	if (clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2) {
-
-		/* Generic fbdev uses a shadow buffer */
-		if (helper->buffer) {
-			ret = drm_client_buffer_vmap(helper->buffer, &map);
-			if (ret)
-				return;
-			drm_fb_helper_damage_blit_real(helper, &clip_copy, &map);
-		}
-
-		if (helper->fb->funcs->dirty)
-			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
-						 &clip_copy, 1);
+	/* Call damage handlers only if necessary */
+	if (!(clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2))
+		return;
 
-		if (helper->buffer)
-			drm_client_buffer_vunmap(helper->buffer);
+	/* Generic fbdev uses a shadow buffer */
+	if (helper->buffer) {
+		ret = drm_client_buffer_vmap(helper->buffer, &map);
+		if (ret)
+			return;
+		drm_fb_helper_damage_blit_real(helper, &clip_copy, &map);
 	}
+
+	if (helper->fb->funcs->dirty)
+		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
+
+	if (helper->buffer)
+		drm_client_buffer_vunmap(helper->buffer);
 }
 
 /**
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
