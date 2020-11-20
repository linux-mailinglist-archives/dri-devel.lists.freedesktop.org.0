Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D342BA754
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 11:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2706E8A1;
	Fri, 20 Nov 2020 10:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEC36E8BD
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 10:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6304AEFF;
 Fri, 20 Nov 2020 10:25:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 08/10] drm/fb-helper: Restore damage area upon errors
Date: Fri, 20 Nov 2020 11:25:43 +0100
Message-Id: <20201120102545.4047-9-tzimmermann@suse.de>
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

If the damage handling fails, restore the damage area. The next invocation
of the damage worker will then perform the update.

v2:
	* print a single warning if dirty callback fails (Daniel, Sebastian)
	* update comment

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index b0bde894bf39..b36d9852cdf7 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -432,11 +432,28 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
 	if (helper->buffer) {
 		ret = drm_fb_helper_damage_blit(helper, &clip_copy);
 		if (drm_WARN_ON_ONCE(dev, ret))
-			return;
+			goto err;
 	}
 
-	if (helper->fb->funcs->dirty)
-		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
+	if (helper->fb->funcs->dirty) {
+		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
+		if (drm_WARN_ON_ONCE(dev, ret))
+			goto err;
+	}
+
+	return;
+
+err:
+	/*
+	 * Restore damage clip rectangle on errors. The next run
+	 * of the damage worker will perform the update.
+	 */
+	spin_lock_irqsave(&helper->damage_lock, flags);
+	clip->x1 = min_t(u32, clip->x1, clip_copy.x1);
+	clip->y1 = min_t(u32, clip->y1, clip_copy.y1);
+	clip->x2 = max_t(u32, clip->x2, clip_copy.x2);
+	clip->y2 = max_t(u32, clip->y2, clip_copy.y2);
+	spin_unlock_irqrestore(&helper->damage_lock, flags);
 }
 
 /**
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
