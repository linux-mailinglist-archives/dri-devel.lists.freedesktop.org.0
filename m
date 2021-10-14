Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9CC42DE22
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33656E156;
	Thu, 14 Oct 2021 15:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830526E156
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 15:28:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id i20so25060849edj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uFRAg/cSZ1Ge1wEiYH5jWmFxwS6RH3twCyxI3UBC5c=;
 b=CegzzxFtb/uayp1+8cDO1U6QxOoeWj31k1k1Z7XOfoo/i5+bHkASQvbn9FvaS6p/uu
 zyF2bI8Dlz48Ki38g+v8EKeY3wBd7rRxKgwiYxQ4Kdz07k7zJikiY/sVfzPpM96SUP3V
 3QBBqZsIfzDufuPB42h2s4XgIMYIla38OL/zrNs4WISrmGbRbXACPpVK24cDsuUAgZTI
 HyyjlP5dXGMF6a6JmkpWf7Dp6oXf+ckaBDrMhcOglx+Xmv8i3XeahsyJ11Y1teohpSlg
 oH+mVbvQ+KxcbOFy/khczxq+/xllWkTBcS1Vin7m9JDit2i4TuXJ9m3RQNBHXLkNBCcD
 geMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uFRAg/cSZ1Ge1wEiYH5jWmFxwS6RH3twCyxI3UBC5c=;
 b=iM3JxNHWX8aoEX7p1EmZjghQ4eAsMg3hBwXJfjzvSO4ujFvjX2sS8Yxl0y4uEiRqFW
 i+u1tItsBzSreUEgVvi9+A28swbwS8vrveP18wOhdY33CWFFwk3dut6BTXefAgRbXL1i
 16ynX+7Ypu/8lAxI/NtrEGb7tA/lL900g2QNj5RyMwbu2TnVNSu/HRvW0BkFuXNpKbIb
 cB/NJs0iSYup6xAjE6lrcJtjVc0q8ylOHIlWT+GTwK+kd4rKhp+rBpX58aJAQWe85LpR
 ySA8YlATpAU+S9TQZZ+hKAHjindbK55CAcNq/cjYaA8FznuLuL9Y7A663rDp9bE1Qet0
 owAg==
X-Gm-Message-State: AOAM533BTpfanW0GZ31lvXw0HUgiAnEKhKT22K2whktpIeGl4qb8wkLQ
 exTA5UPtibmhV1y0bqGRXFjTLb5W2io0qg==
X-Google-Smtp-Source: ABdhPJzpwhH69ZbKantF9xkYUjaz9jOHz93hDwbCoysI7kqMKMlD1YIqvGMp0yv9zTTaW8r/t+xrqw==
X-Received: by 2002:adf:9b97:: with SMTP id d23mr7342393wrc.135.1634225177180; 
 Thu, 14 Oct 2021 08:26:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:209b:8400:2b80:b4ae])
 by smtp.gmail.com with ESMTPSA id k22sm2626790wrd.59.2021.10.14.08.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:26:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 5/7] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Thu, 14 Oct 2021 17:26:04 +0200
Message-Id: <20211014152606.2289528-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014152606.2289528-1-narmstrong@baylibre.com>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7744; h=from:subject;
 bh=6i6KMw5kTyiPYblQgBG12n2DEPIZia2mYTPpIOLuziA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaEuA/2fFsyQw1JOef8WiTXD7UMaSzOoThtR9lJXC
 d6jt0DCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWhLgAAKCRB33NvayMhJ0Z6OD/
 9RP0uaVWA6EnqwnTt5JQMCDaCIBbX6KmvlbMTRxFt5vBaFuFaqSOQGLyxcWBu12Fgn0khi3fl6pfn6
 EzZ3iID8xbgAnoSyNj/QMiwOcVVelzuK0xDxlQwH2crdVVgKCulq1lnBi8C2OQ4x7NN3i+e3LevgIk
 bOBIXUH14xVi0BEhIAy7PbvuQc6/KNN8nNjss+uEQcHH6UbPHtDIxpepVPRdD6rncFOxZ/aqKcEf9F
 hVYJL3YmBxoQM4rf1mKd0Qqvm+k6j/C/UlIIIlm5KetkfgDYRX7ZfP3VZnGWnQV3ZU2k/hZbKhiQKH
 DwrSlvYG1yG874xnwPbOZYfD9IJWNHnVNg6YeTeQjleKLBX+Mxg3OUUDM3oOEYuKWe9fK/I+UK/NZQ
 +TO43vYsrIHrRAi+aaiSvEDPKimW+iHOWowQAYAd+T16PVnzyOsC7Qy8bwYHfzmgc+2UuTEHm9YQ9E
 CJI0cVudV7KcNl2b7ji82l38K7fBbM9KB/2UGpKXFSeYvHX5jl3k+cBaiRsQwRZJzcbDxtpNYK5qoF
 sOuQkYZ95JORAPj7xmjqIIudXSF+m934EcvFi0B3AmU2gZQDU4QHwir+xiGc8h9oVeVMRfWKgYEA+S
 UYc0ZmTALl0aMM9B4JPpKNUT7Bjl6WzJOKAo4m9AdmeJAruU5V6B9laHY5bA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This implements the necessary change to no more use the embedded
connector in dw-hdmi and use the dedicated bridge connector driver
by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.

The necessary connector properties are added to handle the same
functionalities as the embedded dw-hdmi connector, i.e. the HDR
metadata, the CEC notifier & other flags.

The dw-hdmi output_port is set to 1 in order to look for a connector
next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/Kconfig              |  2 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c      |  1 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 81 +++++++++++++++++++++-
 3 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 9f9281dd49f8..a4e1ed96e5e8 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -6,9 +6,11 @@ config DRM_MESON
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
+	select DRM_DISPLAY_CONNECTOR
 	select VIDEOMODE_HELPERS
 	select REGMAP_MMIO
 	select MESON_CANVAS
+	select CEC_CORE if CEC_NOTIFIER
 
 config DRM_MESON_DW_HDMI
 	tristate "HDMI Synopsys Controller support for Amlogic Meson Display"
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index c2480b3335ac..933ff63b1ecf 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -805,6 +805,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
 	dw_plat_data->ycbcr_420_allowed = true;
 	dw_plat_data->disable_cec = true;
+	dw_plat_data->output_port = 1;
 
 	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c775a1ab5b1e..a4264587d89a 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -14,9 +14,12 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include <media/cec-notifier.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
@@ -34,8 +37,10 @@ struct meson_encoder_hdmi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_connector *connector;
 	struct meson_drm *priv;
 	unsigned long output_bus_fmt;
+	struct cec_notifier *cec_notifier;
 };
 
 #define bridge_to_meson_encoder_hdmi(x) \
@@ -50,6 +55,14 @@ static int meson_encoder_hdmi_attach(struct drm_bridge *bridge,
 				 &encoder_hdmi->bridge, flags);
 }
 
+static void meson_encoder_hdmi_detach(struct drm_bridge *bridge)
+{
+	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
+
+	cec_notifier_conn_unregister(encoder_hdmi->cec_notifier);
+	encoder_hdmi->cec_notifier = NULL;
+}
+
 static void meson_encoder_hdmi_enable(struct drm_bridge *bridge)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
@@ -284,12 +297,33 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
+					  enum drm_connector_status status)
+{
+	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
+	struct edid *edid;
+
+	if (!encoder_hdmi->cec_notifier)
+		return;
+
+	if (status == connector_status_connected) {
+		edid = drm_bridge_get_edid(encoder_hdmi->next_bridge, encoder_hdmi->connector);
+		if (!edid)
+			return;
+
+		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
+	} else
+		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
+}
+
 static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 	.attach = meson_encoder_hdmi_attach,
+	.detach = meson_encoder_hdmi_detach,
 	.enable	= meson_encoder_hdmi_enable,
 	.disable = meson_encoder_hdmi_disable,
 	.mode_valid = meson_encoder_hdmi_mode_valid,
 	.mode_set = meson_encoder_hdmi_mode_set,
+	.hpd_notify = meson_encoder_hdmi_hpd_notify,
 	.atomic_get_input_bus_fmts = meson_encoder_hdmi_get_inp_bus_fmts,
 	.atomic_check = meson_encoder_hdmi_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
@@ -300,6 +334,7 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 int meson_encoder_hdmi_init(struct meson_drm *priv)
 {
 	struct meson_encoder_hdmi *meson_encoder_hdmi;
+	struct platform_device *pdev;
 	struct device_node *remote;
 	int ret;
 
@@ -326,6 +361,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	meson_encoder_hdmi->bridge.funcs = &meson_encoder_hdmi_bridge_funcs;
 	meson_encoder_hdmi->bridge.of_node = priv->dev->of_node;
 	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	meson_encoder_hdmi->bridge.interlace_allowed = true;
 
 	drm_bridge_add(&meson_encoder_hdmi->bridge);
 
@@ -342,17 +378,58 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	meson_encoder_hdmi->encoder.possible_crtcs = BIT(0);
 
 	/* Attach HDMI Encoder Bridge to Encoder */
-	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL, 0);
+	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
 		return ret;
 	}
 
+	/* Initialize & attach Bridge Connector */
+	meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
+							&meson_encoder_hdmi->encoder);
+	if (IS_ERR(meson_encoder_hdmi->connector)) {
+		dev_err(priv->dev, "Unable to create HDMI bridge connector\n");
+		return PTR_ERR(meson_encoder_hdmi->connector);
+	}
+	drm_connector_attach_encoder(meson_encoder_hdmi->connector,
+				     &meson_encoder_hdmi->encoder);
+
 	/*
 	 * We should have now in place:
-	 * encoder->[hdmi encoder bridge]->[dw-hdmi bridge]->[dw-hdmi connector]
+	 * encoder->[hdmi encoder bridge]->[dw-hdmi bridge]->[display connector bridge]->[display connector]
 	 */
 
+	/*
+	 * drm_connector_attach_max_bpc_property() requires the
+	 * connector to have a state.
+	 */
+	drm_atomic_helper_connector_reset(meson_encoder_hdmi->connector);
+
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+		drm_connector_attach_hdr_output_metadata_property(meson_encoder_hdmi->connector);
+
+	drm_connector_attach_max_bpc_property(meson_encoder_hdmi->connector, 8, 8);
+
+	/* Handle this here until handled by drm_bridge_connector_init() */
+	meson_encoder_hdmi->connector->ycbcr_420_allowed = true;
+
+	pdev = of_find_device_by_node(remote);
+	if (pdev) {
+		struct cec_connector_info conn_info;
+		struct cec_notifier *notifier;
+
+		cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
+
+		notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
+		if (!notifier)
+			return -ENOMEM;
+
+		meson_encoder_hdmi->cec_notifier = notifier;
+	}
+
 	DRM_DEBUG_DRIVER("HDMI encoder initialized\n");
 
 	return 0;
-- 
2.25.1

