Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301AF995149
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 16:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526CD10E55A;
	Tue,  8 Oct 2024 14:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pUyWPLeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A1E10E556
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 14:18:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498DqX01010551;
 Tue, 8 Oct 2024 14:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h7KtTqJFLwF8PTmHcsqsieXXCW211RyQKjuk7kT+TCw=; b=pUyWPLeT/4Tw011n
 qnw0RLpYF4UxAW9SnJkgNRj5ARrafMOlmfEiZmb9+xrcE6LnizDM6O29zHaoSoWa
 zWM2/ArN9Y542vmalE+OME5YSmpOD84cBNue/U2Q4HmCU/An/luL3ohfzTbP8wPo
 Z7ZAdj7KZ1FYlH44qDziXua1eomd6VYK8C0J3bDGq0wr+JTpQ/ZQ9RWc9n3fRVWk
 fxFD8Fo1CVCCBIZcQFX1X3wfB6W4TdOptjg7GHtGq2HMcCSlgmgJkoHlWoF68kKJ
 5UvdFXeBb0z5ttu28/MxmEQS+cHuuif9uwLAO3fugMb50/BwSBIjXze+ZjD1Kz3v
 pTw/qg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424x7rsfrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 14:18:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498EIBrm016899
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Oct 2024 14:18:11 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Oct 2024 07:18:10 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 8 Oct 2024 07:17:38 -0700
Subject: [PATCH RFC v2 1/3] drm/panel: add driver for simulated panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-jz-test-sim-panel-v2-1-d60046470e6c@quicinc.com>
References: <20241008-jz-test-sim-panel-v2-0-d60046470e6c@quicinc.com>
In-Reply-To: <20241008-jz-test-sim-panel-v2-0-d60046470e6c@quicinc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728397090; l=13166;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Twf9mm7xogNNeoBoUvQt5BEkK5aQyfHPm72uUfULHLI=;
 b=wg0HTjqEbkwRUK2/Q1qhXNEiTjU22FDnaxELIiZRQH02uCh0lClrG+7kGTaYQfeFqEWDszIMx
 r8gimxIBbP2ACZuYWgbRpZunVzJSEq1egsJOwaNb/vtQdow69Za6f8h
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ofn_klOyOcAbgE3uEJmokhHK83dxKWya
X-Proofpoint-ORIG-GUID: Ofn_klOyOcAbgE3uEJmokhHK83dxKWya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080091
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

Add a driver for simulating DSI panels.

The DSI simulated panel can be configured via the sim_panel configfs.
Currently, the simulated panel supports configuring a supported DRM mode
(modes) and setting the DSI mode flags (mode_flags).

To enable the simulated panel, the user must write the DSI host device
name to the "enable" node.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 MAINTAINERS                              |   5 +
 drivers/gpu/drm/panel/Kconfig            |   9 +
 drivers/gpu/drm/panel/Makefile           |   1 +
 drivers/gpu/drm/panel/panel-simulation.c | 371 +++++++++++++++++++++++++++++++
 4 files changed, 386 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f8b85779bde5489639c8b899f4fd8..cd7019cf3b492691059d897a739dc746266e6ae8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7383,6 +7383,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 
+DRM DRIVER FOR SIMULATED DSI PANELS
+M:	Jessica Zhang <quic_jesszhan@quicinc.com>
+S:	Maintained
+F:	drivers/gpu/drm/panel/panel-simulation.c
+
 DRM DRIVER FOR SITRONIX ST7586 PANELS
 M:	David Lechner <david@lechnology.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d3a9a9fafe4ec7c276214871cc43be099f3a5534..d9aacb8c287371f072fe6652c7e884d5764be567 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -96,6 +96,15 @@ config DRM_PANEL_BOE_TV101WUM_LL2
 	  Say Y here if you want to support for BOE TV101WUM-LL2
 	  WUXGA PANEL DSI Video Mode panel
 
+config DRM_PANEL_SIMULATION
+	tristate "support for simulation panels"
+	depends on DRM_MIPI_DSI
+	help
+	  Say Y here if you want to simulate a DSI panel. This module will allow
+	  users to configure a simulated DSI panel driver via the configfs.
+	  Enabling this config will cause the physical panel driver to not be
+	  attached to its DSI host.
+
 config DRM_PANEL_EBBG_FT8719
 	tristate "EBBG FT8719 panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 987a0870241035c6184a25c412c17caf03465dff..75038f6d93ba3d93c82744429044e2ec8dfe51f8 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
 obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
+obj-$(CONFIG_DRM_PANEL_SIMULATION) += panel-simulation.o
 obj-$(CONFIG_DRM_PANEL_EDP) += panel-edp.o
 obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
diff --git a/drivers/gpu/drm/panel/panel-simulation.c b/drivers/gpu/drm/panel/panel-simulation.c
new file mode 100644
index 0000000000000000000000000000000000000000..2f14bd36062ec876cf573637f9e4d6193a3a2864
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-simulation.c
@@ -0,0 +1,371 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+
+#include <linux/module.h>
+#include <linux/configfs.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+#define MAX_DSI_COUNT 2
+
+static struct mipi_dsi_driver panel_simulation_driver;
+struct panel_simulation;
+struct panel_simulation_cfs {
+	struct config_group group;
+	struct panel_simulation *panel;
+	char *dev_name;
+	unsigned int num_modes;
+	struct drm_display_mode *display_modes;
+	u32 mode_flags;
+};
+
+struct panel_simulation {
+	struct drm_panel base;
+	unsigned int num_modes;
+	struct drm_display_mode *display_modes;
+	struct mipi_dsi_device *dsi;
+};
+
+static struct drm_display_mode sim_panel_default_mode = {
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
+	.name = "FOO",
+};
+
+static inline struct panel_simulation *to_sim_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_simulation, base);
+}
+
+static int panel_simulation_get_modes(struct drm_panel *panel,
+				    struct drm_connector *connector)
+{
+	struct panel_simulation *sim_panel = to_sim_panel(panel);
+	struct drm_display_mode *mode;
+	u32 num_modes = 0;
+
+	for (int i = 0; i < sim_panel->num_modes; i++) {
+		mode = drm_mode_duplicate(connector->dev,
+					  &sim_panel->display_modes[i]);
+		if (!mode) {
+			dev_err(panel->dev, "failed to add mode %s\n",
+					sim_panel->display_modes[i].name);
+			continue;
+		}
+
+		drm_mode_set_name(mode);
+		num_modes++;
+	}
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return num_modes;
+}
+
+static const struct drm_panel_funcs panel_simulation_funcs = {
+	.get_modes = panel_simulation_get_modes,
+};
+
+static inline struct panel_simulation_cfs *get_sim_panel_config(struct config_item *item)
+{
+	return container_of(to_config_group(item),
+			    struct panel_simulation_cfs, group);
+}
+
+static ssize_t sim_panel_cfs_item_enable_show(struct config_item *item, char *page)
+{
+	struct panel_simulation_cfs *config = get_sim_panel_config(item);
+
+	return sprintf(page, "%s\n", config->dev_name);
+}
+
+static ssize_t sim_panel_cfs_item_enable_store(struct config_item *item,
+		const char *page, size_t count)
+{
+	struct panel_simulation_cfs *config = get_sim_panel_config(item);
+	struct device *dev;
+	int ret;
+	char name[216];
+
+	if (config->dev_name)
+		return count;
+
+	strscpy(name, page, strcspn(page, "\n"));
+	name[strcspn(page, "\n")] = '\0';
+
+	dev = bus_find_device_by_name(panel_simulation_driver.driver.bus,
+				      NULL, name);
+	if (!dev)
+		return -EINVAL;
+
+	config->dev_name = name;
+
+	dev_set_drvdata(dev, config);
+	ret = device_reprobe(dev);
+	if (ret)
+		dev_warn(dev, "failed to reprobe: %d\n", ret);
+
+	return count;
+}
+CONFIGFS_ATTR(sim_panel_cfs_item_, enable);
+
+static ssize_t sim_panel_cfs_item_modes_show(struct config_item *item, char *page)
+{
+	struct panel_simulation_cfs *configfs = get_sim_panel_config(item);
+	int count = 0;
+
+	for (int i = 0; i < configfs->num_modes; i++) {
+		count += sprintf(page, DRM_MODE_FMT "\n",
+				DRM_MODE_ARG(&configfs->display_modes[i]));
+	}
+
+	return count;
+}
+
+static struct drm_display_mode *panel_simulation_parse_modes(const char *buf,
+							     struct panel_simulation_cfs *config)
+{
+	int ret, num_modes;
+	struct drm_display_mode *modes = drm_mode_create(NULL);
+
+	if (!modes)
+		return NULL;
+
+	ret = sscanf(buf, "%d %hu %hu %hu %hu %hu %hu %hu %hu 0x%hhx 0x%x",
+			&modes->clock, &modes->hdisplay, &modes->hsync_start,
+			&modes->hsync_end, &modes->htotal, &modes->vdisplay,
+			&modes->vsync_start, &modes->vsync_end, &modes->vtotal,
+			&modes->type, &modes->flags);
+	if (ret != 11)
+		return NULL;
+
+	snprintf(modes->name, sizeof(modes->name), "custom%dx%d@%d",
+			modes->hdisplay, modes->vdisplay,
+			drm_mode_vrefresh(modes));
+	num_modes = 1;
+
+	config->num_modes = num_modes;
+
+	return modes;
+}
+
+static ssize_t sim_panel_cfs_item_modes_store(struct config_item *item,
+		const char *page, size_t count)
+{
+	struct panel_simulation_cfs *config = get_sim_panel_config(item);
+	struct drm_display_mode *new_modes = NULL;
+
+	if (config->dev_name)
+		return count;
+
+	new_modes = panel_simulation_parse_modes(page, config);
+	if (!new_modes)
+		return -EINVAL;
+
+	config->display_modes = new_modes;
+
+	return count;
+}
+CONFIGFS_ATTR(sim_panel_cfs_item_, modes);
+
+static ssize_t sim_panel_cfs_item_mode_flags_show(struct config_item *item,
+						  char *page)
+{
+	struct panel_simulation_cfs *configfs = get_sim_panel_config(item);
+
+	return sprintf(page, "%d\n", configfs->mode_flags);
+}
+
+static ssize_t sim_panel_cfs_item_mode_flags_store(struct config_item *item,
+		const char *page, size_t count)
+{
+	struct panel_simulation_cfs *configfs = get_sim_panel_config(item);
+	int ret, mode_flags;
+
+	ret = kstrtoint(page, 0, &mode_flags);
+	if (ret < 0)
+		return ret;
+
+	configfs->mode_flags = mode_flags;
+
+	return 0;
+}
+CONFIGFS_ATTR(sim_panel_cfs_item_, mode_flags);
+
+static struct configfs_attribute *sim_panel_cfs_item_attrs[] = {
+	&sim_panel_cfs_item_attr_enable,
+	&sim_panel_cfs_item_attr_modes,
+	&sim_panel_cfs_item_attr_mode_flags,
+	NULL,
+};
+
+static void sim_panel_cfs_item_release(struct config_item *item)
+{
+	kfree(get_sim_panel_config(item));
+}
+
+static struct configfs_item_operations sim_panel_cfs_item_ops = {
+	.release	= sim_panel_cfs_item_release,
+};
+
+static const struct config_item_type sim_panel_cfs_item_type = {
+	.ct_item_ops	= &sim_panel_cfs_item_ops,
+	.ct_attrs	= sim_panel_cfs_item_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *sim_panel_cfs_make_group(struct config_group *group,
+		const char *name)
+{
+	struct panel_simulation_cfs *sim_panel;
+
+	sim_panel = kzalloc(sizeof(struct panel_simulation_cfs), GFP_KERNEL);
+	if (!sim_panel)
+		return ERR_PTR(-ENOMEM);
+
+	sim_panel->num_modes = 1;
+	sim_panel->display_modes = &sim_panel_default_mode;
+	sim_panel->mode_flags = 0;
+
+	config_group_init_type_name(&sim_panel->group, name,
+				    &sim_panel_cfs_item_type);
+
+	return &sim_panel->group;
+}
+
+static struct configfs_attribute *sim_panel_cfs_attrs[] = {
+	NULL,
+};
+
+static struct configfs_group_operations sim_panel_cfs_group_ops = {
+	.make_group	= sim_panel_cfs_make_group,
+};
+
+static const struct config_item_type sim_panel_cfs_group_type = {
+	.ct_group_ops	= &sim_panel_cfs_group_ops,
+	.ct_attrs	= sim_panel_cfs_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem sim_panel_cfs_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf = "sim_panel",
+			.ci_type = &sim_panel_cfs_group_type,
+		},
+	},
+};
+
+static int panel_simulation_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct panel_simulation *panel;
+	int ret = 0;
+	struct panel_simulation_cfs *configfs = mipi_dsi_get_drvdata(dsi);
+
+	if (!configfs)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "Cannot get configfs\n");
+
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
+	if (!panel)
+		return -ENOMEM;
+
+	panel->display_modes = configfs->display_modes;
+	panel->num_modes = configfs->num_modes;
+
+	mipi_dsi_set_drvdata(dsi, panel);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = configfs->mode_flags;
+
+	drm_panel_init(&panel->base, dev, &panel_simulation_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
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
+
+static int __init panel_simulation_init(void)
+{
+	int ret;
+
+	ret = mipi_dsi_driver_register(&panel_simulation_driver);
+	if (ret < 0)
+		return ret;
+
+	config_group_init(&sim_panel_cfs_subsys.su_group);
+	mutex_init(&sim_panel_cfs_subsys.su_mutex);
+	ret = configfs_register_subsystem(&sim_panel_cfs_subsys);
+	if (ret) {
+		mutex_destroy(&sim_panel_cfs_subsys.su_mutex);
+		mipi_dsi_driver_unregister(&panel_simulation_driver);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(panel_simulation_init);
+
+static void __exit panel_simulation_exit(void)
+{
+	configfs_unregister_subsystem(&sim_panel_cfs_subsys);
+	mipi_dsi_driver_unregister(&panel_simulation_driver);
+}
+module_exit(panel_simulation_exit);
+
+MODULE_AUTHOR("Jessica Zhang <quic_jesszhan@quicinc.com>");
+MODULE_DESCRIPTION("DRM Driver for Simulated DSI Panels");
+MODULE_LICENSE("GPL");

-- 
2.34.1

