Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38916F90A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7CB6E19A;
	Wed, 26 Feb 2020 08:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90CE46EB8B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:37:41 +0000 (UTC)
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 9F06E810E;
 Tue, 25 Feb 2020 18:38:25 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] drm/omap: Fix drm_handle_vblank() handling for command mode
 panels
Date: Tue, 25 Feb 2020 10:37:33 -0800
Message-Id: <20200225183733.50875-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, ruleh <ruleh@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When trying to run weston on droid4 with the updated sgx blobs, the LCD
is just black and not updating. Weston also displays the following on
startup:

Warning: computed repaint delay is insane: -205475 msec

Weston runs fine on the HDMI alone though, and the issue was narrowed
down to an issue with vblank as suggested by ruleh <ruleh@gmx.de>.

Turns out that for command mode displays, we're not currently calling
drm_handle_vblank() at all since omap_irq_handler() won't do it for
us since we get no vblank interrupts. Let's fix the issue by calling
drm_handle_vblank() and omap_crtc_vblank_irq() for command mode
displays from omap_crtc_framedone_irq(). And we can now remove the
old partial handling in omap_crtc_framedone_irq().

For reference, below is my current weston.ini. The repaint-window is
maxed out to force immediate repaint instead of the default 7 ms.
Otherwise it seems that the repaint is happening at about 60 fps with
es2gears_wayland compared to about 130 fps where it seems to max out.

[core]
xwayland=true
backend=drm-backend.so
repaint-window=1000
pageflip-timeout=1000

[libinput]
rotation=0

[output]
name=DSI-1
transform=90

[output]
name=HDMI-1
mode=1024x768@60

Fixes: 47103a80f55a ("drm/omap: add framedone interrupt support")
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: ruleh <ruleh@gmx.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Only lightly tested so far, please test. Also, I'm not sure if we
should get the id from somewhere for drm_handle_vblank() instead of
just using 0?

---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -326,21 +326,19 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
 
 void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
 {
+	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
 
 	if (!omap_crtc->framedone_handler)
 		return;
 
-	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
-
-	spin_lock(&crtc->dev->event_lock);
-	/* Send the vblank event if one has been requested. */
-	if (omap_crtc->event) {
-		drm_crtc_send_vblank_event(crtc, omap_crtc->event);
-		omap_crtc->event = NULL;
+	if (omap_state->manually_updated) {
+		drm_handle_vblank(dev, 0);
+		omap_crtc_vblank_irq(crtc);
 	}
-	omap_crtc->pending = false;
-	spin_unlock(&crtc->dev->event_lock);
+
+	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
 
 	/* Wake up omap_atomic_complete. */
 	wake_up(&omap_crtc->pending_wait);
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
