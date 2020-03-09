Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E0B17E955
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2412C6E550;
	Mon,  9 Mar 2020 19:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568B76E536
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:53:14 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4F854108;
 Mon,  9 Mar 2020 20:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783591;
 bh=WBTNg8a121sCFp0ZkNR+/ryfPpUQpb7RlJp6jhBvhBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ETqBQSg0wKwk79ncSfmHwUFht6l5RfEfWzd/Z+qaEEdxARPTLYFayv9WZiWhaKEqj
 PaF1wRPXVgxYqgsMGiUI6N+Pz59xAJvdnsPU62PGEnMttKxXa6NS3rANMRD+cFDhm3
 BGCf8Ogz+h1d/KIwL2kQIpMmTmMCUCDa86nwP120=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/21] drm: mxsfb: Move vblank event arm to CRTC
 .atomic_flush()
Date: Mon,  9 Mar 2020 21:52:07 +0200
Message-Id: <20200309195216.31042-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vblank event is armed in the plane .atomic_update(). This works fine
as we have a single plane, but will break as soon as multiple planes are
supported (not to mention it's logically the wrong place to perform the
operation). Move it to CRTC .atomic_flush().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 35 ++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 8f339adb8d04..ebe0785694cb 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -295,6 +295,25 @@ static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
 	return drm_atomic_add_affected_planes(state->state, crtc);
 }
 
+static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
+				    struct drm_crtc_state *old_state)
+{
+	struct drm_pending_vblank_event *event;
+
+	event = crtc->state->event;
+	crtc->state->event = NULL;
+
+	if (!event)
+		return;
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
 static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
@@ -364,6 +383,7 @@ static void mxsfb_crtc_disable_vblank(struct drm_crtc *crtc)
 
 static const struct drm_crtc_helper_funcs mxsfb_crtc_helper_funcs = {
 	.atomic_check = mxsfb_crtc_atomic_check,
+	.atomic_flush = mxsfb_crtc_atomic_flush,
 	.atomic_enable = mxsfb_crtc_atomic_enable,
 	.atomic_disable = mxsfb_crtc_atomic_disable,
 };
@@ -410,23 +430,8 @@ static void mxsfb_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_pstate)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
-	struct drm_crtc *crtc = &mxsfb->crtc;
-	struct drm_pending_vblank_event *event;
 	dma_addr_t paddr;
 
-	spin_lock_irq(&crtc->dev->event_lock);
-	event = crtc->state->event;
-	if (event) {
-		crtc->state->event = NULL;
-
-		if (drm_crtc_vblank_get(crtc) == 0) {
-			drm_crtc_arm_vblank_event(crtc, event);
-		} else {
-			drm_crtc_send_vblank_event(crtc, event);
-		}
-	}
-	spin_unlock_irq(&crtc->dev->event_lock);
-
 	paddr = mxsfb_get_fb_paddr(mxsfb);
 	if (paddr) {
 		mxsfb_enable_axi_clk(mxsfb);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
