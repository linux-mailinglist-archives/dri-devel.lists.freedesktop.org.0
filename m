Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE097A19C1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF8610E618;
	Fri, 15 Sep 2023 08:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E27A10E5EA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:54:18 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by albert.telenet-ops.be with bizsmtp
 id m8uF2A00b1C8whw068uFYn; Fri, 15 Sep 2023 10:54:16 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4aK-003lHt-1R;
 Fri, 15 Sep 2023 10:54:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4ad-00Gdd7-1b;
 Fri, 15 Sep 2023 10:54:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 31/41] drm: renesas: shmobile: Move
 shmob_drm_crtc_finish_page_flip()
Date: Fri, 15 Sep 2023 10:53:46 +0200
Message-Id: <4c87bb31403d142f8f146176cb859a10a28a3601.1694767209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
References: <cover.1694767208.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the shmob_drm_crtc_finish_page_flip() function up, to avoid having
to move it during the modification in the next change.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v4:
  - No changes,

v3:
  - No changes,

v2:
  - Add Reviewed-by,
  - Move further up.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 36 ++++++++++---------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index f55b5263e611c782..0adf5d33ba31695e 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -35,6 +35,26 @@
  * TODO: panel support
  */
 
+/* -----------------------------------------------------------------------------
+ * Page Flip
+ */
+
+void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
+{
+	struct drm_pending_vblank_event *event;
+	struct drm_device *dev = scrtc->base.dev;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->event_lock, flags);
+	event = scrtc->event;
+	scrtc->event = NULL;
+	if (event) {
+		drm_crtc_send_vblank_event(&scrtc->base, event);
+		drm_crtc_vblank_put(&scrtc->base);
+	}
+	spin_unlock_irqrestore(&dev->event_lock, flags);
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -364,22 +384,6 @@ static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
 	.mode_set_base = shmob_drm_crtc_mode_set_base,
 };
 
-void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
-{
-	struct drm_pending_vblank_event *event;
-	struct drm_device *dev = scrtc->base.dev;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->event_lock, flags);
-	event = scrtc->event;
-	scrtc->event = NULL;
-	if (event) {
-		drm_crtc_send_vblank_event(&scrtc->base, event);
-		drm_crtc_vblank_put(&scrtc->base);
-	}
-	spin_unlock_irqrestore(&dev->event_lock, flags);
-}
-
 static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
 				    struct drm_framebuffer *fb,
 				    struct drm_pending_vblank_event *event,
-- 
2.34.1

