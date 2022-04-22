Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A050B170
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 09:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56AB112024;
	Fri, 22 Apr 2022 07:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45856112024
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:28:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nhnii-0008KB-SH; Fri, 22 Apr 2022 09:28:48 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nhnih-004VyT-SS; Fri, 22 Apr 2022 09:28:46 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nhnid-009ITW-0e; Fri, 22 Apr 2022 09:28:43 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v11 03/24] drm/rockchip: Add crtc_endpoint_id to
 rockchip_encoder
Date: Fri, 22 Apr 2022 09:28:20 +0200
Message-Id: <20220422072841.2206452-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422072841.2206452-1-s.hauer@pengutronix.de>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VOP2 has an interface mux which decides to which encoder(s) a CRTC
is routed to. The encoders and CRTCs are connected via of_graphs in the
device tree. When given an encoder the VOP2 driver needs to know to
which internal register setting this encoder matches. For this the VOP2
binding offers different endpoints, one for each possible encoder. The
endpoint ids of these endpoints are used as a key from an encoders
device tree description to the internal register setting.

This patch adds the key aka endpoint id to struct rockchip_encoder plus
a function to read the endpoint id starting from the encoders device
node.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Notes:
    Changes since v6:
    - new patch

 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 33 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 7efd12312354b..0dc09d92d92d6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -244,6 +244,39 @@ static const struct dev_pm_ops rockchip_drm_pm_ops = {
 static struct platform_driver *rockchip_sub_drivers[MAX_ROCKCHIP_SUB_DRIVERS];
 static int num_rockchip_sub_drivers;
 
+/*
+ * Get the endpoint id of the remote endpoint of the given encoder. This
+ * information is used by the VOP2 driver to identify the encoder.
+ *
+ * @rkencoder: The encoder to get the remote endpoint id from
+ * @np: The encoder device node
+ * @port: The number of the port leading to the VOP2
+ * @reg: The endpoint number leading to the VOP2
+ */
+int rockchip_drm_encoder_set_crtc_endpoint_id(struct rockchip_encoder *rkencoder,
+					      struct device_node *np, int port, int reg)
+{
+	struct of_endpoint ep;
+	struct device_node *en, *ren;
+	int ret;
+
+	en = of_graph_get_endpoint_by_regs(np, port, reg);
+	if (!en)
+		return -ENOENT;
+
+	ren = of_graph_get_remote_endpoint(en);
+	if (!ren)
+		return -ENOENT;
+
+	ret = of_graph_parse_endpoint(ren, &ep);
+	if (ret)
+		return ret;
+
+	rkencoder->crtc_endpoint_id = ep.id;
+
+	return 0;
+}
+
 /*
  * Check if a vop endpoint is leading to a rockchip subdriver or bridge.
  * Should be called from the component bind stage of the drivers
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index 048ab277de653..a27ab928e1d2f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -50,6 +50,7 @@ struct rockchip_drm_private {
 };
 
 struct rockchip_encoder {
+	int crtc_endpoint_id;
 	struct drm_encoder encoder;
 };
 
@@ -60,7 +61,8 @@ void rockchip_drm_dma_detach_device(struct drm_device *drm_dev,
 void rockchip_drm_dma_init_device(struct drm_device *drm_dev,
 				  struct device *dev);
 int rockchip_drm_wait_vact_end(struct drm_crtc *crtc, unsigned int mstimeout);
-
+int rockchip_drm_encoder_set_crtc_endpoint_id(struct rockchip_encoder *rencoder,
+					      struct device_node *np, int port, int reg);
 int rockchip_drm_endpoint_is_subdriver(struct device_node *ep);
 extern struct platform_driver cdn_dp_driver;
 extern struct platform_driver dw_hdmi_rockchip_pltfm_driver;
-- 
2.30.2

