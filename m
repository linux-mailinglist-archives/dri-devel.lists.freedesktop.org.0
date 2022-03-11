Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3DA4D672D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 18:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48ADA10E26C;
	Fri, 11 Mar 2022 17:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3C10E199
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 17:06:27 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0AC0083AEA;
 Fri, 11 Mar 2022 18:06:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647018385;
 bh=qNBtpf4xTSQxSbk7XUOnMUwW429Gc/m6YXcTwaXngaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DeNDgHSIl5DhwtFN88lUvDGxsog2f8WjCXEkwOsuznpUDfAAMv0V0nOj0cVP+AnpW
 BqAvka3im63bJe0TTzr8+XhvrgyFcwg2DS2HzdHKNLKYBa7NERrJ8SrcYgmSOWdYk1
 iV332ODtfxZaDQl1dgMVNiopyYukIQBapyiGWC0sjQINKVmf9ey9gRTWFjsVLfHE3R
 I1hcKe93DIUxhuO4jVfld0Y6XMcitB+iTvFNjZkiZUDqy7cTbyPOpkAYHPXP7CHepg
 rQT9bfSzDyai1s0dJUMwfp0W7j5pj9EK/ie6E2Y2pl9M8xUFmH4eHWYnLEOT+xVHRt
 A2yJHTP2x9r8A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm: mxsfb: Move mxsfb_get_fb_paddr() away from
 register IO functions
Date: Fri, 11 Mar 2022 18:05:58 +0100
Message-Id: <20220311170601.50995-4-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311170601.50995-1-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
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
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move mxsfb_get_fb_paddr() out of the way, away from register IO functions.
This is a clean up. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: No change
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 015b289d93a3c..7b0abd0472aae 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -43,6 +43,21 @@ static u32 set_hsync_pulse_width(struct mxsfb_drm_private *mxsfb, u32 val)
 		mxsfb->devdata->hs_wdth_shift;
 }
 
+static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
+{
+	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_gem_cma_object *gem;
+
+	if (!fb)
+		return 0;
+
+	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	if (!gem)
+		return 0;
+
+	return gem->paddr;
+}
+
 /*
  * Setup the MXSFB registers for decoding the pixels out of the framebuffer and
  * outputting them on the bus.
@@ -215,21 +230,6 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 	return 0;
 }
 
-static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
-{
-	struct drm_framebuffer *fb = plane->state->fb;
-	struct drm_gem_cma_object *gem;
-
-	if (!fb)
-		return 0;
-
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
-	if (!gem)
-		return 0;
-
-	return gem->paddr;
-}
-
 static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 				     const u32 bus_format)
 {
-- 
2.34.1

