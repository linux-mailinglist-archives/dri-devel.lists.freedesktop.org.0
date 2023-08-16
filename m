Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F7377DF29
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F3C10E32D;
	Wed, 16 Aug 2023 10:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB7E10E328
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 10:44:43 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
 by andre.telenet-ops.be with bizsmtp
 id aAkg2A00H45ualL01AkgCF; Wed, 16 Aug 2023 12:44:41 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWE0v-000orc-TE;
 Wed, 16 Aug 2023 12:44:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWDAx-00676a-02;
 Wed, 16 Aug 2023 11:50:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 31/41] drm: renesas: shmobile: Move
 shmob_drm_crtc_finish_page_flip()
Date: Wed, 16 Aug 2023 11:50:38 +0200
Message-Id: <88bcd675b03a109874e1dff24ff0aa4d45ab96ce.1692178020.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692178020.git.geert+renesas@glider.be>
References: <cover.1692178020.git.geert+renesas@glider.be>
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

