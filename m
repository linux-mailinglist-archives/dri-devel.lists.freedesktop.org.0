Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EFFAE7764
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 08:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BC410E676;
	Wed, 25 Jun 2025 06:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YWsw54oO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BF010E672
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 06:49:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 448F05C4BE6;
 Wed, 25 Jun 2025 06:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15927C4CEF1;
 Wed, 25 Jun 2025 06:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750834141;
 bh=996mJ21JrIRt/8zZvRVt3DWeLhU4aeBd9zfaG+L5ogU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YWsw54oOtBeVkNGC96P9c4nS6RnKErmEtzoBb4O+5jMAeWJjcq28NP3LyWrcy/FuD
 Z1/tUFqXYkF/6+QEGV0IdAJwuhdAb+FsZ3ypX9jYSkikVtvgq1OriSlpkC18VTGcai
 e2cdflc5YM1Vde2kPtb7lPKJCD6mnuEWK6ggg4I2LccOjoO4UvsrTy55dpVdOLCx32
 Ic4NEAL8uWjDImhcooBKUQ62xpbQhCC8pvtMCWE5/rvpXVnmSca+hAvuXuI9eqq+at
 si0lkIor5Hd7bVjsX/lroM/nknebINJD1VGvsNBqxxiQ95MITpFG05hhFArgqP60gf
 hn7n92faWSHKw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 25 Jun 2025 08:48:42 +0200
Subject: [PATCH 5/5] drm/panel: panel-simple: get rid of panel_dpi hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-panel-simple-fixes-v1-5-c428494a86b8@kernel.org>
References: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
In-Reply-To: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2757; i=mripard@kernel.org;
 h=from:subject:message-id; bh=996mJ21JrIRt/8zZvRVt3DWeLhU4aeBd9zfaG+L5ogU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnRs898i9Ng5XNwP/azqFpxy+/4A1VR6SKbBarCJx/JX
 MPt/mB6x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIxDbGhm+Ldl65t+Z4xtud
 dbsW7rxSWsIssvfA7+9ezkeeMrerW0dzt9jJtF/d+07sSM32PwnFLxgbDsdvtjk2O6HnFrdLNH/
 Rs2hBT3n1fut/P6b+m6B4PK1wRaroqrVLQq0i06QLtjmt5XwNAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The empty panel_dpi struct was only ever used as a discriminant, but
it's kind of a hack, and with the reworks done in the previous patches,
we shouldn't need it anymore.

Let's get rid of it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d3390ba4ecec5a5aa531c12f51eebdf1ed9d5545..d19170a4531dff7b6e522b6d58e72d0dadc70680 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -437,12 +437,10 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.get_modes = panel_simple_get_modes,
 	.get_orientation = panel_simple_get_orientation,
 	.get_timings = panel_simple_get_timings,
 };
 
-static struct panel_desc panel_dpi;
-
 static struct panel_desc *panel_dpi_probe(struct device *dev)
 {
 	struct display_timing *timing;
 	const struct device_node *np;
 	struct panel_desc *desc;
@@ -590,15 +588,21 @@ static const struct panel_desc *panel_simple_get_desc(struct device *dev)
 
 	if (dev_is_platform(dev)) {
 		const struct panel_desc *desc;
 
 		desc = of_device_get_match_data(dev);
-		if (!desc)
-			return ERR_PTR(-ENODEV);
-
-		if (desc == &panel_dpi)
-			return panel_dpi_probe(dev);
+		if (!desc) {
+			/*
+			 * panel-dpi probes without a descriptor and
+			 * panel_dpi_probe() will initialize one for us
+			 * based on the device tree.
+			 */
+			if (of_device_is_compatible(dev->of_node, "panel-dpi"))
+				return panel_dpi_probe(dev);
+			else
+				return ERR_PTR(-ENODEV);
+		}
 
 		return desc;
 	}
 
 	return ERR_PTR(-ENODEV);
@@ -648,11 +652,11 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
 
 		if (!panel->ddc)
 			return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	if ((desc != &panel_dpi) &&
+	if (!of_device_is_compatible(dev->of_node, "panel-dpi") &&
 	    !of_get_display_timing(dev->of_node, "panel-timing", &dt))
 		panel_simple_parse_panel_timing_node(dev, panel, &dt);
 
 	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
 		/* Optional data-mapping property for overriding bus format */
@@ -5397,11 +5401,16 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "microchip,ac69t88a",
 		.data = &mchp_ac69t88a,
 	}, {
 		/* Must be the last entry */
 		.compatible = "panel-dpi",
-		.data = &panel_dpi,
+
+		/*
+		 * Explicitly NULL, the panel_desc structure will be
+		 * allocated by panel_dpi_probe().
+		 */
+		.data = NULL,
 	}, {
 		/* sentinel */
 	}
 };
 MODULE_DEVICE_TABLE(of, platform_of_match);

-- 
2.49.0

