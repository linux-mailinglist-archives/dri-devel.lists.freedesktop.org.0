Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3574F5A05
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 11:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEB410E175;
	Wed,  6 Apr 2022 09:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC41410E175
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 09:29:48 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D7ECF83C08;
 Wed,  6 Apr 2022 11:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649237387;
 bh=tJ2q/2AQXa+4QBAdgJ8e/FGBxSU2RNOflzxUe4ox/hw=;
 h=From:To:Cc:Subject:Date:From;
 b=AK8cb71pz7fOAI0WmNehRRqX37Z5mt6sp0cSVRyYmmYdIf5j4p+PiQEj4JHHdOhWW
 viOEzZ5hS4xdbANnjmqYG7UPIflf7sAf/KZB8BoSsbfSjnMhJ0L3V/ewydvpNvwAY+
 1yW7KKXKTGvwXbo6ZcNv+kStHmJ3V+UZWiVyDuyAZBhi6pUMVpIqrJd6s9WYAPWGlU
 dSuAvdUWJpg0e9vXJH1RQXugS8UXaOQezc1DxJzvjSizBVI5SBf52Hs23BhaS4XoD9
 8GuvIHq8Xi7G1LqkF89FsOCNMRMpbutY4Gs75RhjogzvDOPEEAeS9qVyU1SnWbYZrc
 oDgMPI6eyW3og==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: mxsfb: Obtain bus flags from bridge state
Date: Wed,  6 Apr 2022 11:29:29 +0200
Message-Id: <20220406092929.17498-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case the MXSFB is connected to a bridge, attempt to obtain bus flags
from that bridge state too. The bus flags may specify e.g. the DE signal
polarity.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 4baa3db1f3d10..c7f14ef1edc25 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -298,6 +298,7 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 }
 
 static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
+				     struct drm_bridge_state *bridge_state,
 				     const u32 bus_format)
 {
 	struct drm_device *drm = mxsfb->crtc.dev;
@@ -307,6 +308,8 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 
 	if (mxsfb->bridge && mxsfb->bridge->timings)
 		bus_flags = mxsfb->bridge->timings->input_bus_flags;
+	else if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
 
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
 			     m->crtc_clock,
@@ -365,7 +368,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
-	struct drm_bridge_state *bridge_state;
+	struct drm_bridge_state *bridge_state = NULL;
 	struct drm_device *drm = mxsfb->drm;
 	u32 bus_format = 0;
 
@@ -399,7 +402,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	pm_runtime_get_sync(drm->dev);
 
-	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
+	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
 	mxsfb_update_buffer(mxsfb, crtc->primary, true);
-- 
2.35.1

