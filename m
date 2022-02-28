Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E4F4C603C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 01:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D281210E24B;
	Mon, 28 Feb 2022 00:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B908510E229
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 00:46:44 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0E81383BCC;
 Mon, 28 Feb 2022 01:46:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646009203;
 bh=tFc56DTs04ZcN3UQAj7XNofI/G4evJ/buPBTzXCPkqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I+Qrg/Czkx+HwY7vOp2Nj0wMpVKXvglPDLbtYJiydPKkEMMngu2P+Wdx+H9wVxBsH
 /g8Q0dXfUMsDs+vv7RFZI8D9VjJPW/hZB64CE7LL1/fz3IRkywnPU0jHVdU/qdhuUA
 6pNRcFqlfW9b/qLf/uwxPUZDfv4gD07+C8ucMYQ4Csfqldukk7jEdyGQai6aZZ0+zl
 c2VG932LZMrBlxFrwqSvqpQUwiM0HftR7GVKiQSJOqfaVIi28qmiMGmueXwLu3OMh3
 FUcEKaGciT7IbcYXRd8KWoqsruGBVFVC3Imonv9RzuLzpthoZQvw89bu4AxmafjtJU
 9B+tY21FrCqlg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm: mxsfb: Move mxsfb_get_fb_paddr() away from register
 IO functions
Date: Mon, 28 Feb 2022 01:46:01 +0100
Message-Id: <20220228004605.367040-5-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228004605.367040-1-marex@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
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

