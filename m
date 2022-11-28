Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7607963AC5A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 16:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC0B10E2CC;
	Mon, 28 Nov 2022 15:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BC110E245
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 15:26:01 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 22A3010000F;
 Mon, 28 Nov 2022 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1669649158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OoXUT9AdbVFMNOQAniPu8hp8jV2YODAHFkN2Ysky5NE=;
 b=ZZN3c1/UkAfE2mAI9i9VugV9EwP3ltAetbNEdfatM0P4bWuqUbGZ/WIsF/Jfp/TDqw2OnR
 93aFCAzh1KMRD+mW9WM750syDgxEchH3qN24mi9SmJ5VIOWpQDUBfavE7LGxTQtxKLhVtJ
 P+BJ+6Lse5F2EDyB8UTQhkQ0YcLK7No8Pankwd/hlGhQ/PkmOPTplJmNAkuaUoNDEgyNzt
 d2sL5+hCfWF11pHPQD0X63njO0X0MyVn4Hp7zWBBtSG3WiOR6B45mx/P2sb17/QRTaRgUl
 3632NUAPAS237mR69QoKaiIUxG2Rav33WDllPYzWGzLriAq3Cw8MElxsGIOLVA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 20/21] staging: media: tegra-video: add support for VIP
 (parallel video input)
Date: Mon, 28 Nov 2022 16:23:35 +0100
Message-Id: <20221128152336.133953-21-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VI peripheral of Tegra supports capturing from MIPI CSI-2 or parallel
video (called VIP in the docs). MIPI CSI-2 is already implemented. Add a
VIP implementation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v2
---
 MAINTAINERS                                |   1 +
 drivers/staging/media/tegra-video/Makefile |   1 +
 drivers/staging/media/tegra-video/vip.c    | 298 +++++++++++++++++++++
 drivers/staging/media/tegra-video/vip.h    |  72 +++++
 4 files changed, 372 insertions(+)
 create mode 100644 drivers/staging/media/tegra-video/vip.c
 create mode 100644 drivers/staging/media/tegra-video/vip.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c97ce22735d..1601465e8e31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20322,6 +20322,7 @@ L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+F:	drivers/staging/media/tegra-video/vip.*
 
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo@nvidia.com>
diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index dfa2ef8f99ef..3c8ec1bb1f3e 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -2,6 +2,7 @@
 tegra-video-objs := \
 		video.o \
 		vi.o \
+		vip.o \
 		csi.o
 
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
new file mode 100644
index 000000000000..cbf0c36fb098
--- /dev/null
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Parallel video capture module (VIP) for the Tegra VI.
+ *
+ * This file implements the VIP-specific infrastructure.
+ *
+ * Copyright (C) 2022 SKIDATA GmbH
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#include <linux/device.h>
+#include <linux/host1x.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-fwnode.h>
+
+#include "vip.h"
+
+static inline struct tegra_vip *host1x_client_to_vip(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_vip, client);
+}
+
+static inline struct tegra_vip_channel *subdev_to_vip_channel(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_vip_channel, subdev);
+}
+
+static inline struct tegra_vip *vip_channel_to_vip(struct tegra_vip_channel *chan)
+{
+	return container_of(chan, struct tegra_vip, chan);
+}
+
+/* Find the previous subdev in the pipeline (i.e. the one connected to our sink pad) */
+static struct v4l2_subdev *tegra_vip_channel_get_prev_subdev(struct tegra_vip_channel *chan)
+{
+	struct media_pad *remote_pad;
+
+	remote_pad = media_pad_remote_pad_first(&chan->pads[TEGRA_VIP_PAD_SINK]);
+	if (!remote_pad)
+		return NULL;
+
+	return media_entity_to_v4l2_subdev(remote_pad->entity);
+}
+
+static int tegra_vip_enable_stream(struct v4l2_subdev *subdev)
+{
+	struct tegra_vip_channel *vip_chan = subdev_to_vip_channel(subdev);
+	struct tegra_vip *vip = vip_channel_to_vip(vip_chan);
+	struct v4l2_subdev *prev_subdev = tegra_vip_channel_get_prev_subdev(vip_chan);
+	int err;
+
+	err = pm_runtime_resume_and_get(vip->dev);
+	if (err)
+		return dev_err_probe(vip->dev, err, "failed to get runtime PM\n");
+
+	err = vip->soc->ops->vip_start_streaming(vip_chan);
+	if (err < 0)
+		goto err_start_streaming;
+
+	err = v4l2_subdev_call(prev_subdev, video, s_stream, true);
+	if (err < 0 && err != -ENOIOCTLCMD)
+		goto err_prev_subdev_start_stream;
+
+	return 0;
+
+err_prev_subdev_start_stream:
+err_start_streaming:
+	pm_runtime_put(vip->dev);
+	return err;
+}
+
+static int tegra_vip_disable_stream(struct v4l2_subdev *subdev)
+{
+	struct tegra_vip_channel *vip_chan = subdev_to_vip_channel(subdev);
+	struct tegra_vip *vip = vip_channel_to_vip(vip_chan);
+	struct v4l2_subdev *prev_subdev = tegra_vip_channel_get_prev_subdev(vip_chan);
+
+	v4l2_subdev_call(prev_subdev, video, s_stream, false);
+
+	pm_runtime_put(vip->dev);
+
+	return 0;
+}
+
+static int tegra_vip_s_stream(struct v4l2_subdev *subdev, int enable)
+{
+	int err;
+
+	if (enable)
+		err = tegra_vip_enable_stream(subdev);
+	else
+		err = tegra_vip_disable_stream(subdev);
+
+	return err;
+}
+
+static const struct v4l2_subdev_video_ops tegra_vip_video_ops = {
+	.s_stream = tegra_vip_s_stream,
+};
+
+static const struct v4l2_subdev_ops tegra_vip_ops = {
+	.video  = &tegra_vip_video_ops,
+};
+
+static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
+{
+	struct device *dev = vip->dev;
+	struct device_node *node;
+	struct v4l2_fwnode_endpoint v4l2_ep = {
+		.bus_type = V4L2_MBUS_PARALLEL
+	};
+	struct fwnode_handle *fwh;
+	struct device_node *ep;
+	unsigned int portno, num_pads;
+	int err;
+
+	node = of_get_child_by_name(dev->of_node, "channel");
+
+	err = of_property_read_u32(node, "reg", &portno);
+	if (err < 0) {
+		dev_err_probe(dev, err, "%pOF: error reading reg property\n", node);
+		goto err_node_put;
+	}
+
+	if (portno != 0) {
+		err = -EINVAL;
+		dev_err_probe(dev, err, "%pOF: invalid reg property\n", node);
+		goto err_node_put;
+	}
+
+	ep = of_graph_get_endpoint_by_regs(node, 0, 0);
+	if (!ep) {
+		err = -EINVAL;
+		dev_err_probe(dev, err, "%pOF: error getting endpoint node\n", node);
+		goto err_node_put;
+	}
+
+	fwh = of_fwnode_handle(ep);
+	err = v4l2_fwnode_endpoint_parse(fwh, &v4l2_ep);
+	of_node_put(ep);
+	if (err) {
+		dev_err_probe(dev, err, "%pOF: failed to parse v4l2 endpoint\n", node);
+		goto err_node_put;
+	}
+
+	num_pads = of_graph_get_endpoint_count(node);
+	if (num_pads != TEGRA_VIP_PADS_NUM) {
+		err = -EINVAL;
+		dev_err_probe(dev, err, "%pOF: need 2 pads, got %d\n", node, num_pads);
+		goto err_node_put;
+	}
+
+	vip->chan.of_node = of_node_get(node);
+	vip->chan.pads[TEGRA_VIP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	vip->chan.pads[TEGRA_VIP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	return 0;
+
+err_node_put:
+	of_node_put(node);
+	return err;
+}
+
+static int tegra_vip_channel_init(struct tegra_vip *vip)
+{
+	struct v4l2_subdev *subdev;
+	int err;
+
+	subdev = &vip->chan.subdev;
+	v4l2_subdev_init(subdev, &tegra_vip_ops);
+	subdev->dev = vip->dev;
+	snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s",
+		 kbasename(vip->chan.of_node->full_name));
+
+	v4l2_set_subdevdata(subdev, &vip->chan);
+	subdev->fwnode = of_fwnode_handle(vip->chan.of_node);
+	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+
+	err = media_entity_pads_init(&subdev->entity, TEGRA_VIP_PADS_NUM, vip->chan.pads);
+	if (err)
+		return dev_err_probe(vip->dev, err, "failed to initialize media entity\n");
+
+	err = v4l2_async_register_subdev(subdev);
+	if (err) {
+		dev_err_probe(vip->dev, err, "failed to register subdev\n");
+		goto err_register_subdev;
+	}
+
+	return 0;
+
+err_register_subdev:
+	media_entity_cleanup(&subdev->entity);
+	return err;
+}
+
+static int tegra_vip_init(struct host1x_client *client)
+{
+	struct tegra_vip *vip = host1x_client_to_vip(client);
+	int err;
+
+	err = tegra_vip_channel_of_parse(vip);
+	if (err)
+		return err;
+
+	err = tegra_vip_channel_init(vip);
+	if (err)
+		goto err_init;
+
+	return 0;
+
+err_init:
+	of_node_put(vip->chan.of_node);
+	return err;
+}
+
+static int tegra_vip_exit(struct host1x_client *client)
+{
+	struct tegra_vip *vip = host1x_client_to_vip(client);
+	struct v4l2_subdev *subdev = &vip->chan.subdev;
+
+	v4l2_async_unregister_subdev(subdev);
+	media_entity_cleanup(&subdev->entity);
+	of_node_put(vip->chan.of_node);
+
+	return 0;
+}
+
+static const struct host1x_client_ops vip_client_ops = {
+	.init = tegra_vip_init,
+	.exit = tegra_vip_exit,
+};
+
+static int tegra_vip_probe(struct platform_device *pdev)
+{
+	struct tegra_vip *vip;
+	int err;
+
+	dev_dbg(&pdev->dev, "Probing VIP \"%s\" from %pOF\n", pdev->name, pdev->dev.of_node);
+
+	vip = devm_kzalloc(&pdev->dev, sizeof(*vip), GFP_KERNEL);
+	if (!vip)
+		return -ENOMEM;
+
+	vip->soc = of_device_get_match_data(&pdev->dev);
+
+	vip->dev = &pdev->dev;
+	platform_set_drvdata(pdev, vip);
+
+	/* initialize host1x interface */
+	INIT_LIST_HEAD(&vip->client.list);
+	vip->client.ops = &vip_client_ops;
+	vip->client.dev = &pdev->dev;
+
+	err = host1x_client_register(&vip->client);
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "failed to register host1x client\n");
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int tegra_vip_remove(struct platform_device *pdev)
+{
+	struct tegra_vip *vip = platform_get_drvdata(pdev);
+	int err;
+
+	err = host1x_client_unregister(&vip->client);
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "failed to unregister host1x client\n");
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id tegra_vip_of_id_table[] = {
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
+#endif
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_vip_of_id_table);
+
+struct platform_driver tegra_vip_driver = {
+	.driver = {
+		.name		= "tegra-vip",
+		.of_match_table	= tegra_vip_of_id_table,
+	},
+	.probe			= tegra_vip_probe,
+	.remove			= tegra_vip_remove,
+};
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/staging/media/tegra-video/vip.h
new file mode 100644
index 000000000000..58b3ec28c364
--- /dev/null
+++ b/drivers/staging/media/tegra-video/vip.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022 SKIDATA GmbH
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#ifndef __TEGRA_VIP_H__
+#define __TEGRA_VIP_H__
+
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-subdev.h>
+
+enum {
+	TEGRA_VIP_PAD_SINK,
+	TEGRA_VIP_PAD_SOURCE,
+	TEGRA_VIP_PADS_NUM,
+};
+
+struct tegra_vip;
+
+/**
+ * struct tegra_vip_channel - Tegra VIP (parallel video capture) channel
+ *
+ * @subdev: V4L2 subdevice associated with this channel
+ * @pads: media pads for the subdevice entity
+ * @of_node: vip device tree node
+ */
+struct tegra_vip_channel {
+	struct v4l2_subdev subdev;
+	struct media_pad pads[TEGRA_VIP_PADS_NUM];
+	struct device_node *of_node;
+};
+
+/**
+ * struct tegra_vip_ops - Tegra VIP operations
+ *
+ * @vip_start_streaming: programs vip hardware to enable streaming.
+ */
+struct tegra_vip_ops {
+	int (*vip_start_streaming)(struct tegra_vip_channel *vip_chan);
+};
+
+/**
+ * struct tegra_vip_soc - NVIDIA Tegra VIP SoC structure
+ *
+ * @ops: vip hardware operations
+ */
+struct tegra_vip_soc {
+	const struct tegra_vip_ops *ops;
+};
+
+/**
+ * struct tegra_vip - NVIDIA Tegra VIP device structure
+ *
+ * @dev: device struct
+ * @client: host1x_client struct
+ * @soc: pointer to SoC data structure
+ * @chan: the VIP channel
+ */
+struct tegra_vip {
+	struct device *dev;
+	struct host1x_client client;
+	const struct tegra_vip_soc *soc;
+	struct tegra_vip_channel chan;
+};
+
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+extern const struct tegra_vip_soc tegra20_vip_soc;
+#endif
+
+#endif
-- 
2.34.1

