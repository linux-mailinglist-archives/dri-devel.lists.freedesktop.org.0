Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D877DF22
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DF810E329;
	Wed, 16 Aug 2023 10:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479B610E330
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 10:44:43 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
 by xavier.telenet-ops.be with bizsmtp
 id aAkg2A00P45ualL01AkgwX; Wed, 16 Aug 2023 12:44:41 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWE0v-000orZ-RN;
 Wed, 16 Aug 2023 12:44:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWDAx-00676f-0p;
 Wed, 16 Aug 2023 11:50:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 32/41] drm: renesas: shmobile: Wait for page flip when
 turning CRTC off
Date: Wed, 16 Aug 2023 11:50:39 +0200
Message-Id: <3777d3233e08ffbe3fbcd1d84ac947942160e8d8.1692178020.git.geert+renesas@glider.be>
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

Turning a CRTC off will prevent a queued page flip from ever completing,
potentially confusing userspace.  Wait for queued page flips to complete
before turning the CRTC off to avoid this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 37 +++++++++++++++++++
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  3 ++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 0adf5d33ba31695e..20adb9d2fa178250 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -50,11 +50,40 @@ void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
 	scrtc->event = NULL;
 	if (event) {
 		drm_crtc_send_vblank_event(&scrtc->base, event);
+		wake_up(&scrtc->flip_wait);
 		drm_crtc_vblank_put(&scrtc->base);
 	}
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
+static bool shmob_drm_crtc_page_flip_pending(struct shmob_drm_crtc *scrtc)
+{
+	struct drm_device *dev = scrtc->base.dev;
+	unsigned long flags;
+	bool pending;
+
+	spin_lock_irqsave(&dev->event_lock, flags);
+	pending = scrtc->event != NULL;
+	spin_unlock_irqrestore(&dev->event_lock, flags);
+
+	return pending;
+}
+
+static void shmob_drm_crtc_wait_page_flip(struct shmob_drm_crtc *scrtc)
+{
+	struct drm_crtc *crtc = &scrtc->base;
+	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
+
+	if (wait_event_timeout(scrtc->flip_wait,
+			       !shmob_drm_crtc_page_flip_pending(scrtc),
+			       msecs_to_jiffies(50)))
+		return;
+
+	dev_warn(sdev->dev, "page flip timeout\n");
+
+	shmob_drm_crtc_finish_page_flip(scrtc);
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -253,6 +282,12 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 	if (!scrtc->started)
 		return;
 
+	/*
+	 * Wait for page flip completion before stopping the CRTC as userspace
+	 * expects page flips to eventually complete.
+	 */
+	shmob_drm_crtc_wait_page_flip(scrtc);
+
 	/* Stop the LCDC. */
 	shmob_drm_crtc_start_stop(scrtc, false);
 
@@ -463,6 +498,8 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 	unsigned int i;
 	int ret;
 
+	init_waitqueue_head(&sdev->crtc.flip_wait);
+
 	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
 
 	primary = shmob_drm_plane_create(sdev, DRM_PLANE_TYPE_PRIMARY, 0);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
index 2c6d7541427581a6..b9863e026e8a9b83 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
@@ -14,6 +14,8 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_encoder.h>
 
+#include <linux/wait.h>
+
 #include <video/videomode.h>
 
 struct drm_pending_vblank_event;
@@ -24,6 +26,7 @@ struct shmob_drm_crtc {
 	struct drm_crtc base;
 
 	struct drm_pending_vblank_event *event;
+	wait_queue_head_t flip_wait;
 	int dpms;
 
 	const struct shmob_drm_format_info *format;
-- 
2.34.1

