Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12212739CAB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE49A10E50A;
	Thu, 22 Jun 2023 09:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EBD10E506
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:46 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by albert.telenet-ops.be with bizsmtp
 id C9Nj2A00R1yfRTD069NjkD; Thu, 22 Jun 2023 11:22:44 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWY-000BxE-4W;
 Thu, 22 Jun 2023 11:22:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWZ-003Vxw-Mx;
 Thu, 22 Jun 2023 11:22:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 30/39] drm: renesas: shmobile: Wait for page flip when turning
 CRTC off
Date: Thu, 22 Jun 2023 11:21:42 +0200
Message-Id: <0b0cc2971b2abc8fe0fc55a9ae652a7b8a7235cd.1687423204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687423204.git.geert+renesas@glider.be>
References: <cover.1687423204.git.geert+renesas@glider.be>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Turning a CRTC off will prevent a queued page flip from ever completing,
potentially confusing userspace.  Wait for queued page flips to complete
before turning the CRTC off to avoid this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 37 +++++++++++++++++++
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  3 ++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 1d7fcf64bf2aab80..d2a0ac5f9368c11c 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -285,11 +285,40 @@ void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
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
  * CRTC Functions
  */
@@ -302,6 +331,12 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
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
 
@@ -515,6 +550,8 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
 	unsigned int i;
 	int ret;
 
+	init_waitqueue_head(&sdev->crtc.flip_wait);
+
 	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
 
 	primary = shmob_drm_plane_create(sdev, 0);
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

