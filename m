Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6FC194AA4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6BE6E942;
	Thu, 26 Mar 2020 21:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2A96E33E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 12:20:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4405BB117;
 Thu, 26 Mar 2020 12:20:17 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Eric Anholt <eric@anholt.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm/vc4: Fix HDMI mode validation
Date: Thu, 26 Mar 2020 13:20:01 +0100
Message-Id: <20200326122001.22215-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Mar 2020 21:34:52 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, f.fainelli@gmail.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current mode validation impedes setting up some video modes which should
be supported otherwise. Namely 1920x1200@60Hz.

Fix this by lowering the minimum HDMI state machine clock to pixel clock
ratio allowed.

Fixes: 32e823c63e90 ("drm/vc4: Reject HDMI modes with too high of clocks")
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cea18dc15f77..340719238753 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -681,11 +681,23 @@ static enum drm_mode_status
 vc4_hdmi_encoder_mode_valid(struct drm_encoder *crtc,
 			    const struct drm_display_mode *mode)
 {
-	/* HSM clock must be 108% of the pixel clock.  Additionally,
-	 * the AXI clock needs to be at least 25% of pixel clock, but
-	 * HSM ends up being the limiting factor.
+	/*
+	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
+	 * be faster than pixel clock, infinitesimally faster, tested in
+	 * simulation. Otherwise, exact value is unimportant for HDMI
+	 * operation." This conflicts with bcm2835's vc4 documentation, which
+	 * states HSM's clock has to be at least 108% of the pixel clock.
+	 *
+	 * Real life tests reveal that vc4's firmware statement holds up, and
+	 * users are able to use pixel clocks closer to HSM's, namely for
+	 * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
+	 * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
+	 * 162MHz.
+	 *
+	 * Additionally, the AXI clock needs to be at least 25% of
+	 * pixel clock, but HSM ends up being the limiting factor.
 	 */
-	if (mode->clock > HSM_CLOCK_FREQ / (1000 * 108 / 100))
+	if (mode->clock > HSM_CLOCK_FREQ / (1000 * 101 / 100))
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
