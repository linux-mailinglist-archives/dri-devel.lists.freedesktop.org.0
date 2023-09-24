Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 599D67ACB9E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 21:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8122410E148;
	Sun, 24 Sep 2023 19:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3904710E133
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 19:26:17 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9ad810be221so635096166b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 12:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695583575; x=1696188375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6KY3l38JJQzo0U3VJY6BsoHFoiqXvY2L3IXiGvOPS0=;
 b=Ksu+nrzhXcR1FwtkEJ5P+4xs4YZu4a2vkQuBdWGIKfG7T7pU/VeBMbML0y8tEfibLS
 PjVmqQtynkEzONgzhHZmfKycbYlBUi++J71tJvceSt6GC3Jm7GYyL2CEL1qbXweGtMQU
 Q7C/u857qmgUNu4ou6h0/NLtkLMDJqvq0FKmUL66voCxRhmnpVo9IlMvR02MPNtJptTq
 kw/Tv3VU9T810wXvtfGZ2szG4BxU63+jU/LWo5b/+4Qyu231Ngy5utbAeao7+Kww2xNv
 /N8yEcMcUUoPDjhfe7t01JbPjPflRotAEhkMteK2Q1/szW6Y2qZUFZjc0+R5rA0Gi5F2
 /AUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695583575; x=1696188375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6KY3l38JJQzo0U3VJY6BsoHFoiqXvY2L3IXiGvOPS0=;
 b=tPVkYqxlJVyEjx18YXESRL/P2ENucH50Ml3tQ/HGCsdKrojpyrYwegnNZshfedO8CY
 c2gSoDSX6CYpElJNXcIcXRRDSDCZ7eO3b5dl1uoJVLJlTgWTCbNJLZiC+3N66lWLIl64
 /Ngjj61koTOPuAAfrp4UoapbsbVJK4d/C8bL6Px6eoeJfs/2IZAYzQ2goFrxmG6GXyIJ
 JvH5h7B68ghoZeVrpEiI4cS6E1TFsdp59IvcmidzbRPBsNsUx23nuaHyD6/sEFkxRAfT
 oLCKobGeNOn58ins7o7lT6LCY3kJVQVTIqhyyBdxuZ4kWm9EPZUlb/f+B/nR6rQO2NDz
 1uQg==
X-Gm-Message-State: AOJu0Yz7T7Z9joTjU+GiCy3DejjRriZAqJTCCFK4kakI/DJOlIoZVdD7
 prNqjdWpHrPTyHsCuysrDss=
X-Google-Smtp-Source: AGHT+IF4uX/JM0VD6gvHTuHkWGbsMKKjWVglfewHDhBluusXbQjwKroAN2PZ5soeZgKDAFdDgJwZ1Q==
X-Received: by 2002:a17:906:3010:b0:9ae:513d:de22 with SMTP id
 16-20020a170906301000b009ae513dde22mr4045355ejz.56.1695583575563; 
 Sun, 24 Sep 2023 12:26:15 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 12:26:15 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 3/7] drm/sun4i: dw-hdmi: Switch to bridge functions
Date: Sun, 24 Sep 2023 21:26:00 +0200
Message-ID: <20230924192604.3262187-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since ddc-en property handling was moved from sun8i dw-hdmi driver to
display connector driver, probe order of drivers determines if EDID is
properly read at boot time or not.

In order to fix this, let's switch to bridge functions which allows us
to build proper chain and defer execution until all drivers are probed.

Fixes: 920169041baa ("drm/sun4i: dw-hdmi: Fix ddc-en GPIO consumer conflict")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 114 +++++++++++++++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |   5 ++
 2 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 8f8d3bdba5ce..93831cdf1917 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -8,14 +8,82 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include <media/cec-notifier.h>
+
 #include "sun8i_dw_hdmi.h"
 #include "sun8i_tcon_top.h"
 
+#define bridge_to_sun8i_dw_hdmi(x) \
+	container_of(x, struct sun8i_dw_hdmi, enc_bridge)
+
+static int sun8i_hdmi_enc_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	struct sun8i_dw_hdmi *hdmi = bridge_to_sun8i_dw_hdmi(bridge);
+
+	return drm_bridge_attach(&hdmi->encoder, hdmi->hdmi_bridge,
+				 &hdmi->enc_bridge, flags);
+}
+
+static void sun8i_hdmi_enc_detach(struct drm_bridge *bridge)
+{
+	struct sun8i_dw_hdmi *hdmi = bridge_to_sun8i_dw_hdmi(bridge);
+
+	cec_notifier_conn_unregister(hdmi->cec_notifier);
+	hdmi->cec_notifier = NULL;
+}
+
+static void sun8i_hdmi_enc_hpd_notify(struct drm_bridge *bridge,
+				      enum drm_connector_status status)
+{
+	struct sun8i_dw_hdmi *hdmi = bridge_to_sun8i_dw_hdmi(bridge);
+	struct edid *edid;
+
+	if (!hdmi->cec_notifier)
+		return;
+
+	if (status == connector_status_connected) {
+		edid = drm_bridge_get_edid(hdmi->hdmi_bridge, hdmi->connector);
+		if (edid)
+			cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier,
+							     edid);
+	} else {
+		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
+	}
+}
+
+static int sun8i_hdmi_enc_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	struct drm_connector_state *old_conn_state =
+		drm_atomic_get_old_connector_state(conn_state->state,
+						   conn_state->connector);
+
+	if (!drm_connector_atomic_hdr_metadata_equal(old_conn_state, conn_state))
+		crtc_state->mode_changed = true;
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs sun8i_hdmi_enc_bridge_funcs = {
+	.attach = sun8i_hdmi_enc_attach,
+	.detach = sun8i_hdmi_enc_detach,
+	.hpd_notify = sun8i_hdmi_enc_hpd_notify,
+	.atomic_check = sun8i_hdmi_enc_atomic_check,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
 static void sun8i_dw_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 					   struct drm_display_mode *mode,
 					   struct drm_display_mode *adj_mode)
@@ -99,6 +167,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dw_hdmi_plat_data *plat_data;
+	struct cec_connector_info conn_info;
+	struct drm_connector *connector;
 	struct drm_device *drm = data;
 	struct device_node *phy_node;
 	struct drm_encoder *encoder;
@@ -187,18 +257,57 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	plat_data->mode_valid = hdmi->quirks->mode_valid;
 	plat_data->use_drm_infoframe = hdmi->quirks->use_drm_infoframe;
+	plat_data->output_port = 1;
 	sun8i_hdmi_phy_set_ops(hdmi->phy, plat_data);
 
 	platform_set_drvdata(pdev, hdmi);
 
-	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
+	hdmi->hdmi = dw_hdmi_probe(pdev, plat_data);
 	if (IS_ERR(hdmi->hdmi)) {
 		ret = PTR_ERR(hdmi->hdmi);
 		goto err_deinit_phy;
 	}
 
+	hdmi->hdmi_bridge = of_drm_find_bridge(dev->of_node);
+
+	hdmi->enc_bridge.funcs = &sun8i_hdmi_enc_bridge_funcs;
+	hdmi->enc_bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->enc_bridge.interlace_allowed = true;
+
+	drm_bridge_add(&hdmi->enc_bridge);
+
+	ret = drm_bridge_attach(encoder, &hdmi->enc_bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		goto err_remove_dw_hdmi;
+
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		dev_err(dev, "Unable to create HDMI bridge connector\n");
+		ret = PTR_ERR(connector);
+		goto err_remove_dw_hdmi;
+	}
+
+	hdmi->connector = connector;
+	drm_connector_attach_encoder(connector, encoder);
+
+	if (hdmi->quirks->use_drm_infoframe)
+		drm_connector_attach_hdr_output_metadata_property(connector);
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	hdmi->cec_notifier = cec_notifier_conn_register(&pdev->dev, NULL,
+							&conn_info);
+	if (!hdmi->cec_notifier) {
+		ret = -ENOMEM;
+		goto err_remove_dw_hdmi;
+	}
+
 	return 0;
 
+err_remove_dw_hdmi:
+	drm_bridge_remove(&hdmi->enc_bridge);
+	dw_hdmi_remove(hdmi->hdmi);
 err_deinit_phy:
 	sun8i_hdmi_phy_deinit(hdmi->phy);
 err_disable_clk_tmds:
@@ -216,7 +325,8 @@ static void sun8i_dw_hdmi_unbind(struct device *dev, struct device *master,
 {
 	struct sun8i_dw_hdmi *hdmi = dev_get_drvdata(dev);
 
-	dw_hdmi_unbind(hdmi->hdmi);
+	drm_bridge_remove(&hdmi->enc_bridge);
+	dw_hdmi_remove(hdmi->hdmi);
 	sun8i_hdmi_phy_deinit(hdmi->phy);
 	clk_disable_unprepare(hdmi->clk_tmds);
 	reset_control_assert(hdmi->rst_ctrl);
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index ab80d52a70bb..18ffc1b4841f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -7,6 +7,7 @@
 #define _SUN8I_DW_HDMI_H_
 
 #include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
 #include <linux/clk.h>
 #include <linux/regmap.h>
@@ -178,9 +179,13 @@ struct sun8i_dw_hdmi_quirks {
 };
 
 struct sun8i_dw_hdmi {
+	struct cec_notifier		*cec_notifier;
 	struct clk			*clk_tmds;
+	struct drm_connector		*connector;
 	struct device			*dev;
+	struct drm_bridge		enc_bridge;
 	struct dw_hdmi			*hdmi;
+	struct drm_bridge		*hdmi_bridge;
 	struct drm_encoder		encoder;
 	struct sun8i_hdmi_phy		*phy;
 	struct dw_hdmi_plat_data	plat_data;
-- 
2.42.0

