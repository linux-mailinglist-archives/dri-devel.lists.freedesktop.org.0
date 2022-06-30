Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDFF562166
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6783B11BA09;
	Thu, 30 Jun 2022 17:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2575311BA1B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:40:42 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3C0C9838BB;
 Thu, 30 Jun 2022 19:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656610840;
 bh=W9guudHH89vmObZIPNajFsVoiMmESYuvXuBkund8uCY=;
 h=From:To:Cc:Subject:Date:From;
 b=NuZU5o4OlqIDQZAiGX1c/U5EjkYrK+wikE2O9hL6ayYRthwhZ42vNAm0fEjC1aev3
 4wknnVL8lzuanj9ef1OnHXsbCXD00/KpBLlWzBl8gryVfnsLhBupRoMtc5WUoy/03T
 IMtV4Xdy/9i7WeQmnYwc+q/Y0x24/Fg7F6N33QnRxZlnJJjUiXsxy8f32oBAgchdn4
 fG6msheshfkR4+/uovaF1uQcYbruDZAGaxfJ6t72Kdwkn5Il9Hr+F/xcwPTPqbxiMs
 sDo9t/Xfb8HHF/ohdEnFPbWEL5xOVjhrK5AkJz24AcjIjvxDP3/rTsSYKHHogGtYYD
 nr9GsUieJ/aLw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: ldb: Drop DE flip from Freescale i.MX8MP LDB
 bridge
Date: Thu, 30 Jun 2022 19:40:31 +0200
Message-Id: <20220630174031.92354-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DE inversion is implemented in LCDIFv3 driver and is no longer
needed in the LDB bridge which does not invert the DE signal. Drop
the inversion.

Fixes: 463db5c2ed4ae ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index b2675c769a550..10077d4aed358 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -74,22 +74,6 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static int fsl_ldb_atomic_check(struct drm_bridge *bridge,
-				struct drm_bridge_state *bridge_state,
-				struct drm_crtc_state *crtc_state,
-				struct drm_connector_state *conn_state)
-{
-	/* Invert DE signal polarity. */
-	bridge_state->input_bus_cfg.flags &= ~(DRM_BUS_FLAG_DE_LOW |
-					       DRM_BUS_FLAG_DE_HIGH);
-	if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
-		bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_HIGH;
-	else if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_HIGH)
-		bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_LOW;
-
-	return 0;
-}
-
 static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
@@ -241,7 +225,6 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs funcs = {
 	.attach = fsl_ldb_attach,
-	.atomic_check = fsl_ldb_atomic_check,
 	.atomic_enable = fsl_ldb_atomic_enable,
 	.atomic_disable = fsl_ldb_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.35.1

