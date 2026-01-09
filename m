Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB0D07948
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 08:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F8A10E7FC;
	Fri,  9 Jan 2026 07:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wfUa1/x9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBB710E7FC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 07:32:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 86E214E4201B;
 Fri,  9 Jan 2026 07:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5BD2660734;
 Fri,  9 Jan 2026 07:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9918E103C8820; Fri,  9 Jan 2026 08:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767943939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7iqDfxUkukxgHnkpAItwIxVCJfcJyoW7v+OTkqRu2ww=;
 b=wfUa1/x9gPAJupv1NstN+FEpg1om/b5kWSEidra5PWmkVO4FW8xChlVs1fv9YaEpqgg9vw
 EjVH2k3qcUiR7mrD4+W8UWjRSLHXgziWvt3z4voAAr3oJpG0p3rHJdJATXAq4wb394IS/r
 HwETWKZH4skir9SCWpHBKTUG5H9L2Ia3VYSVQCTHIe5chjz/jBChWun0ORiOba/70HWhUZ
 VmnukaJSCwHVos01/UHjy6n9CyVr5icw0t8Yta/VL7TqHMJyLkpzfg+GZRYJ4Gvxe9xFRc
 nZmal0FhoVttm/3ajVc20pMxH4RnGAPKWnsQM6nbRkPg+4pdcWhnZYvM62bfgQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:40 +0100
Subject: [PATCH v2 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-9-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

Since the companion bridge pointer is used by many bridge funcs, putting
its reference in the remove function would be dangerous. Use .destroy to
put it on final deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- put in .destroy, not in remove
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 122502968927..675995cbeb6b 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -62,6 +62,15 @@ static inline struct imx8qxp_ldb *base_to_imx8qxp_ldb(struct ldb *base)
 	return container_of(base, struct imx8qxp_ldb, base);
 }
 
+static void imx8qxp_ldb_bridge_destroy(struct drm_bridge *bridge)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+
+	drm_bridge_put(imx8qxp_ldb->companion);
+}
+
 static void imx8qxp_ldb_set_phy_cfg(struct imx8qxp_ldb *imx8qxp_ldb,
 				    unsigned long di_clk, bool is_split,
 				    struct phy_configure_opts_lvds *phy_cfg)
@@ -391,6 +400,7 @@ imx8qxp_ldb_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_ldb_bridge_funcs = {
+	.destroy		= imx8qxp_ldb_bridge_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
@@ -552,7 +562,7 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
 		goto out;
 	}
 
-	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
+	imx8qxp_ldb->companion = of_drm_find_and_get_bridge(companion_port);
 	if (!imx8qxp_ldb->companion) {
 		ret = -EPROBE_DEFER;
 		DRM_DEV_DEBUG_DRIVER(dev,

-- 
2.52.0

