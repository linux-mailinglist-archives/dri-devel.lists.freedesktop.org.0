Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C0723B5C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 10:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE5F10E303;
	Tue,  6 Jun 2023 08:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1674E10E30A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 08:22:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3568Lse3038662;
 Tue, 6 Jun 2023 03:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686039714;
 bh=ZFTuDRCNh0K2sxCkjXJOFdyKf3fRWYBGiUnO3q2fd4Q=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=E3+fJdfg6JrTVqO2/K1qWkriVmYPDbL4GteKGTxbJBSXTSc/jmNczCyRwaUIpOiZH
 EDEQLduqvzKjHIRsRRI0MVfXy8eUVa/jooJ/EaLeESsmkELLIMmNsySElbm/d+bpmU
 o00A5vrPWzdrvdnhlZrHRqI1Ti3zpM+0xYUKTywI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3568LsQ8032040
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jun 2023 03:21:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 03:21:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 03:21:53 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3568Lr2L090266;
 Tue, 6 Jun 2023 03:21:53 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v7 7/8] drm/tidss: Update encoder/bridge chain connect model
Date: Tue, 6 Jun 2023 13:51:41 +0530
Message-ID: <20230606082142.23760-8-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606082142.23760-1-a-bhatia1@ti.com>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the new encoder/bridge chain model, the display controller driver
is required to create a drm_connector entity instead of asking the
bridge to do so during drm_bridge_attach. Moreover, the controller
driver should create a drm_bridge entity to negotiate bus formats and a
'simple' drm_encoder entity to expose it to userspace.

Update the encoder/bridge initialization sequence in tidss as per the
new model.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---

Notes:

    changes from v5:
    * Drop patches 5 and 6 from the original series.
    * Instead add this patch that addresses Boris Brezillon's comments
      of creating bridge, simple encoder and connector.

 drivers/gpu/drm/tidss/tidss_encoder.c | 140 ++++++++++++++++----------
 drivers/gpu/drm/tidss/tidss_encoder.h |   5 +-
 drivers/gpu/drm/tidss/tidss_kms.c     |  12 +--
 3 files changed, 94 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 0d4865e9c03d..17a86bed8054 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -6,91 +6,125 @@
 
 #include <linux/export.h>
 
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
 #include "tidss_encoder.h"
 
-static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
-				      struct drm_crtc_state *crtc_state,
-				      struct drm_connector_state *conn_state)
+struct tidss_encoder {
+	struct drm_bridge bridge;
+	struct drm_encoder encoder;
+	struct drm_connector *connector;
+	struct drm_bridge *next_bridge;
+	struct tidss_device *tidss;
+};
+
+static inline struct tidss_encoder
+*bridge_to_tidss_encoder(struct drm_bridge *b)
+{
+	return container_of(b, struct tidss_encoder, bridge);
+}
+
+static int tidss_bridge_attach(struct drm_bridge *bridge,
+			       enum drm_bridge_attach_flags flags)
+{
+	struct tidss_encoder *t_enc = bridge_to_tidss_encoder(bridge);
+
+	return drm_bridge_attach(bridge->encoder, t_enc->next_bridge,
+				 bridge, flags);
+}
+
+static int tidss_bridge_atomic_check(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
 {
-	struct drm_device *ddev = encoder->dev;
+	struct tidss_encoder *t_enc = bridge_to_tidss_encoder(bridge);
+	struct tidss_device *tidss = t_enc->tidss;
 	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
 	struct drm_display_info *di = &conn_state->connector->display_info;
-	struct drm_bridge *bridge;
-	bool bus_flags_set = false;
-
-	dev_dbg(ddev->dev, "%s\n", __func__);
-
-	/*
-	 * Take the bus_flags from the first bridge that defines
-	 * bridge timings, or from the connector's display_info if no
-	 * bridge defines the timings.
-	 */
-	drm_for_each_bridge_in_chain(encoder, bridge) {
-		if (!bridge->timings)
-			continue;
-
-		tcrtc_state->bus_flags = bridge->timings->input_bus_flags;
-		bus_flags_set = true;
-		break;
-	}
+	struct drm_bridge_state *next_bridge_state = NULL;
+
+	if (t_enc->next_bridge)
+		next_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+								    t_enc->next_bridge);
 
-	if (!di->bus_formats || di->num_bus_formats == 0)  {
-		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
+	if (next_bridge_state) {
+		tcrtc_state->bus_flags = next_bridge_state->input_bus_cfg.flags;
+		tcrtc_state->bus_format = next_bridge_state->input_bus_cfg.format;
+	} else if (di->num_bus_formats) {
+		tcrtc_state->bus_format = di->bus_formats[0];
+		tcrtc_state->bus_flags = di->bus_flags;
+	} else {
+		dev_err(tidss->dev, "%s: No bus_formats in connected display\n",
 			__func__);
 		return -EINVAL;
 	}
 
-	// XXX any cleaner way to set bus format and flags?
-	tcrtc_state->bus_format = di->bus_formats[0];
-	if (!bus_flags_set)
-		tcrtc_state->bus_flags = di->bus_flags;
-
 	return 0;
 }
 
-static void tidss_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-	kfree(encoder);
-}
-
-static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
-	.atomic_check = tidss_encoder_atomic_check,
-};
-
-static const struct drm_encoder_funcs encoder_funcs = {
-	.destroy = tidss_encoder_destroy,
+static const struct drm_bridge_funcs tidss_bridge_funcs = {
+	.attach				= tidss_bridge_attach,
+	.atomic_check			= tidss_bridge_atomic_check,
+	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
-struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
-					 u32 encoder_type, u32 possible_crtcs)
+int tidss_encoder_create(struct tidss_device *tidss,
+			 struct drm_bridge *next_bridge,
+			 u32 encoder_type, u32 possible_crtcs)
 {
+	struct tidss_encoder *t_enc;
 	struct drm_encoder *enc;
+	struct drm_connector *connector;
 	int ret;
 
-	enc = kzalloc(sizeof(*enc), GFP_KERNEL);
-	if (!enc)
-		return ERR_PTR(-ENOMEM);
+	t_enc = drmm_simple_encoder_alloc(&tidss->ddev, struct tidss_encoder,
+					  encoder, encoder_type);
+	if (IS_ERR(t_enc))
+		return PTR_ERR(t_enc);
+
+	t_enc->tidss = tidss;
+	t_enc->next_bridge = next_bridge;
+	t_enc->bridge.funcs = &tidss_bridge_funcs;
 
+	enc = &t_enc->encoder;
 	enc->possible_crtcs = possible_crtcs;
 
-	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
-			       encoder_type, NULL);
-	if (ret < 0) {
-		kfree(enc);
-		return ERR_PTR(ret);
+	/* Attaching first bridge to the encoder */
+	ret = drm_bridge_attach(enc, &t_enc->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(tidss->dev, "bridge attach failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Initializing the connector at the end of bridge-chain */
+	connector = drm_bridge_connector_init(&tidss->ddev, enc);
+	if (IS_ERR(connector)) {
+		dev_err(tidss->dev, "bridge_connector create failed\n");
+		return PTR_ERR(connector);
+	}
+
+	ret = drm_connector_attach_encoder(connector, enc);
+	if (ret) {
+		dev_err(tidss->dev, "attaching encoder to connector failed\n");
+		return ret;
 	}
 
-	drm_encoder_helper_add(enc, &encoder_helper_funcs);
+	t_enc->connector = connector;
 
 	dev_dbg(tidss->dev, "Encoder create done\n");
 
-	return enc;
+	return ret;
 }
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.h b/drivers/gpu/drm/tidss/tidss_encoder.h
index ace877c0e0fd..3e561d6b1e83 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.h
+++ b/drivers/gpu/drm/tidss/tidss_encoder.h
@@ -11,7 +11,8 @@
 
 struct tidss_device;
 
-struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
-					 u32 encoder_type, u32 possible_crtcs);
+int tidss_encoder_create(struct tidss_device *tidss,
+			 struct drm_bridge *next_bridge,
+			 u32 encoder_type, u32 possible_crtcs);
 
 #endif
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index ad2fa3c3d4a7..c979ad1af236 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -193,7 +193,6 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 	for (i = 0; i < num_pipes; ++i) {
 		struct tidss_plane *tplane;
 		struct tidss_crtc *tcrtc;
-		struct drm_encoder *enc;
 		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
 		int ret;
 
@@ -216,16 +215,13 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 		tidss->crtcs[tidss->num_crtcs++] = &tcrtc->crtc;
 
-		enc = tidss_encoder_create(tidss, pipes[i].enc_type,
+		ret = tidss_encoder_create(tidss, pipes[i].bridge,
+					   pipes[i].enc_type,
 					   1 << tcrtc->crtc.index);
-		if (IS_ERR(enc)) {
+		if (ret) {
 			dev_err(tidss->dev, "encoder create failed\n");
-			return PTR_ERR(enc);
-		}
-
-		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL, 0);
-		if (ret)
 			return ret;
+		}
 	}
 
 	/* create overlay planes of the leftover planes */
-- 
2.40.1

