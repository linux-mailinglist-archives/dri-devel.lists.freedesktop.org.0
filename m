Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4404082FC8E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 23:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D136310E5ED;
	Tue, 16 Jan 2024 22:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4C610E5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 22:22:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40GKuUi3019595; Tue, 16 Jan 2024 22:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=MFPWM5GBpWmAY6Bf2jzybp2l/7nikz060YYsWvLndjo
 =; b=YRcq8vxzgE5wgiQ8rjD1Tc7ghDWC8P2CN4R+q/9WVoSUBcooyZ6aMoYyu8H
 UK3WBzjd+IFiEmLVbMfLffeM8QqlLhKGp3vQ+YlmqyyiQ4ipRMkeMXYddhtCT1Bm
 KYGcqS7lSc1aK9p12VargWeOo5mgZAb+AZS5+D2sgY22Oh0Sa2wdNTvAd7Y6htvS
 wvwjWURcTZd9xZrfsMaAfCIrgzp5dmbbjCiE1fXxq7dCro6iRVkh+79QhruvGnda
 CA0G7AtEtyMVEGon/ASQnU3rqrEmrvsFffVI5UmgX3pBmsoLCbLtiCjohso1bhQM
 DKoMB7zv4ndc+P+VMNQpQfnFl4g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnymj0eyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 22:22:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40GMMOR7023919
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 22:22:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 14:22:24 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 16 Jan 2024 14:22:04 -0800
Subject: [PATCH RFC 1/4] drm/panel: add driver for simulated panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240116-jz-test-sim-panel-v1-1-f9511f46c9c7@quicinc.com>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
In-Reply-To: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705443743; l=6259;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=FiYzZ9AnVho9qS5eyIx3V1JsUjnlxCXhj8N/Niy4d3w=;
 b=XY7EXkLGbwnxZ9o8g4Ez/2xZdVEWsZ4Hom74ZsOJ3SpDOtUTm0OVZ9fQjDd8FjJBvyL33l7oG
 4K5q5PvPZPfAwc8R320oPKBzVqo9jJrmiCOYYyVbTZ7gR1d64tjXen8
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gskj7KkfCmh0ED-vnJ0rtu5yw5vChADm
X-Proofpoint-GUID: gskj7KkfCmh0ED-vnJ0rtu5yw5vChADm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401160174
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
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a driver for simulating panels. This module also supports a mode
parameter for users to specify a custom mode. If no custom mode is set,
it will fall back to a custom, hard-coded mode.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/Kconfig            |   9 ++
 drivers/gpu/drm/panel/Makefile           |   1 +
 drivers/gpu/drm/panel/panel-simulation.c | 147 +++++++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 99e14dc212ecb..d711ec170c586 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -107,6 +107,15 @@ config DRM_PANEL_SIMPLE
 	  that it can be automatically turned off when the panel goes into a
 	  low power state.
 
+config DRM_PANEL_SIMULATION
+	tristate "support for simulation panels"
+	depends on DRM_MIPI_DSI
+	help
+	  DRM panel driver for simulated DSI panels. Enabling this config will
+	  cause the physical panel driver to not be attached to the DT panel
+	  node. After the kernel boots, users can load the module and specify a
+	  custom mode using the driver modparams.
+
 config DRM_PANEL_EDP
 	tristate "support for simple Embedded DisplayPort panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index d10c3de51c6db..5bc55357714ad 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
 obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
+obj-$(CONFIG_DRM_PANEL_SIMULATION) += panel-simulation.o
 obj-$(CONFIG_DRM_PANEL_EDP) += panel-edp.o
 obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
diff --git a/drivers/gpu/drm/panel/panel-simulation.c b/drivers/gpu/drm/panel/panel-simulation.c
new file mode 100644
index 0000000000000..081c03bea188d
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-simulation.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+static char sim_panel_mode[PATH_MAX];
+
+module_param_string(mode, sim_panel_mode, sizeof(sim_panel_mode), 0644);
+MODULE_PARM_DESC(mode, "Sim panel mode");
+
+struct panel_simulation {
+	struct drm_panel base;
+	struct platform_device *platform;
+} *sim_panel;
+
+static struct drm_display_mode panel_simulation_mode = {
+	.clock = 345830,
+	.hdisplay = 1080,
+	.hsync_start = 1175,
+	.hsync_end = 1176,
+	.htotal = 1216,
+	.vdisplay = 2340,
+	.vsync_start = 2365,
+	.vsync_end = 2366,
+	.vtotal = 2370,
+	.width_mm = 0,
+	.height_mm = 0,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int panel_simulation_parse_mode(void)
+{
+	int count;
+	struct drm_display_mode user_mode = { 0 };
+	unsigned int vrefresh;
+
+	if (sim_panel_mode[0] == '\0')
+		return 0;
+
+	count = sscanf(sim_panel_mode, "%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu-%u",
+			     &user_mode.hdisplay, &user_mode.hsync_start,
+			     &user_mode.hsync_end, &user_mode.htotal,
+			     &user_mode.vdisplay, &user_mode.vsync_start,
+			     &user_mode.vsync_end, &user_mode.vtotal, &vrefresh);
+
+	if (count != 9)
+		return -EINVAL;
+
+	user_mode.clock = user_mode.htotal * user_mode.vtotal * vrefresh / 1000;
+	memcpy(&panel_simulation_mode, &user_mode, sizeof(struct drm_display_mode));
+
+	return 0;
+}
+
+static int panel_simulation_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+	int ret;
+
+	ret = panel_simulation_parse_mode();
+
+	mode = drm_mode_duplicate(connector->dev, &panel_simulation_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs panel_simulation_funcs = {
+	.get_modes = panel_simulation_get_modes,
+};
+
+static int panel_simulation_probe(struct mipi_dsi_device *dsi)
+{
+	struct panel_simulation *panel;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
+	if (!panel)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, panel);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	drm_panel_init(&panel->base, dev, &panel_simulation_funcs, DRM_MODE_CONNECTOR_DSI);
+	drm_panel_add(&panel->base);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret)
+		drm_panel_remove(&panel->base);
+
+	return ret;
+}
+
+static void panel_simulation_remove(struct mipi_dsi_device *dsi)
+{
+	struct panel_simulation *panel = mipi_dsi_get_drvdata(dsi);
+	int err;
+
+	err = mipi_dsi_detach(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
+
+	drm_panel_remove(&panel->base);
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
+}
+
+static void panel_simulation_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct panel_simulation *panel = dev_get_drvdata(&dsi->dev);
+
+	drm_panel_disable(&panel->base);
+	drm_panel_unprepare(&panel->base);
+}
+
+static struct mipi_dsi_driver panel_simulation_driver = {
+	.driver = {
+		.name = "panel_simulation",
+	},
+	.probe = panel_simulation_probe,
+	.remove = panel_simulation_remove,
+	.shutdown = panel_simulation_shutdown,
+};
+module_mipi_dsi_driver(panel_simulation_driver);
+
+MODULE_AUTHOR("Jessica Zhang <quic_jesszhan@quicinc.com>");
+MODULE_DESCRIPTION("DRM Driver for Simulated Panels");
+MODULE_LICENSE("GPL");

-- 
2.43.0

