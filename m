Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D14907C3C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BAC10EB79;
	Thu, 13 Jun 2024 19:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEAD10EB80
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:18:11 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4W0XHk0tkKz4x1dV
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:18:10 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
 by baptiste.telenet-ops.be with bizsmtp
 id b7J62C00T3w30qz017J6ok; Thu, 13 Jun 2024 21:18:09 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHpwS-00Ax71-Gm;
 Thu, 13 Jun 2024 21:18:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHpxW-00FL8j-H0;
 Thu, 13 Jun 2024 21:18:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
Date: Thu, 13 Jun 2024 21:18:03 +0200
Message-Id: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718305355.git.geert+renesas@glider.be>
References: <cover.1718305355.git.geert+renesas@glider.be>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the drm_fb_clip_offset() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
DRM_PANIC already selects DRM_KMS_HELPER.

v2:
  - New.
---
 drivers/gpu/drm/drm_panic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 814ef5c20c08ee42..5b0acf8c86e402a8 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -285,7 +285,7 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, fg_color);
 
 	map = sb->map[0];
-	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
+	iosys_map_incr(&map, drm_fb_clip_offset(sb->pitch[0], sb->format, clip));
 
 	switch (sb->format->cpp[0]) {
 	case 2:
@@ -373,7 +373,7 @@ static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 		return drm_panic_fill_pixel(sb, clip, color);
 
 	map = sb->map[0];
-	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
+	iosys_map_incr(&map, drm_fb_clip_offset(sb->pitch[0], sb->format, clip));
 
 	switch (sb->format->cpp[0]) {
 	case 2:
-- 
2.34.1

