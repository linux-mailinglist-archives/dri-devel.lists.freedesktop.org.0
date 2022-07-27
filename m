Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6519E582A62
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 18:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9AA965D1;
	Wed, 27 Jul 2022 16:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 28B2B18ABA9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 16:08:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,195,1654527600"; d="scan'208";a="127555165"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 28 Jul 2022 01:08:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.195])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 580A440183E9;
 Thu, 28 Jul 2022 01:08:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 06/10] drm: rcar-du: Move rcar_du_encoders_init()
Date: Wed, 27 Jul 2022 17:07:49 +0100
Message-Id: <20220727160753.1774761-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L supports only DSI and DPI. Add rcar_du_encoders_init() to handle
the pointer to du_output_name(), so that we can share du_encoders_init()
between RCar and RZ/G2L kms drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  92 +-------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 100 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |   6 ++
 3 files changed, 108 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index ed8d14701178..7586520e1871 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -74,95 +74,6 @@ static const struct drm_mode_config_funcs rcar_du_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
-				     enum rcar_du_output output,
-				     struct of_endpoint *ep)
-{
-	struct device_node *entity;
-	int ret;
-
-	/* Locate the connected entity and initialize the encoder. */
-	entity = of_graph_get_remote_port_parent(ep->local_node);
-	if (!entity) {
-		dev_dbg(rcdu->dev, "unconnected endpoint %pOF, skipping\n",
-			ep->local_node);
-		return -ENODEV;
-	}
-
-	if (!of_device_is_available(entity)) {
-		dev_dbg(rcdu->dev,
-			"connected entity %pOF is disabled, skipping\n",
-			entity);
-		of_node_put(entity);
-		return -ENODEV;
-	}
-
-	ret = rcar_du_encoder_init(rcdu, output, entity);
-	if (ret && ret != -EPROBE_DEFER && ret != -ENOLINK)
-		dev_warn(rcdu->dev,
-			 "failed to initialize encoder %pOF on output %s (%d), skipping\n",
-			 entity, rcar_du_output_name(output), ret);
-
-	of_node_put(entity);
-
-	return ret;
-}
-
-static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
-{
-	struct device_node *np = rcdu->dev->of_node;
-	struct device_node *ep_node;
-	unsigned int num_encoders = 0;
-
-	/*
-	 * Iterate over the endpoints and create one encoder for each output
-	 * pipeline.
-	 */
-	for_each_endpoint_of_node(np, ep_node) {
-		enum rcar_du_output output;
-		struct of_endpoint ep;
-		unsigned int i;
-		int ret;
-
-		ret = of_graph_parse_endpoint(ep_node, &ep);
-		if (ret < 0) {
-			of_node_put(ep_node);
-			return ret;
-		}
-
-		/* Find the output route corresponding to the port number. */
-		for (i = 0; i < RCAR_DU_OUTPUT_MAX; ++i) {
-			if (rcdu->info->routes[i].possible_crtcs &&
-			    rcdu->info->routes[i].port == ep.port) {
-				output = i;
-				break;
-			}
-		}
-
-		if (i == RCAR_DU_OUTPUT_MAX) {
-			dev_warn(rcdu->dev,
-				 "port %u references unexisting output, skipping\n",
-				 ep.port);
-			continue;
-		}
-
-		/* Process the output pipeline. */
-		ret = rcar_du_encoders_init_one(rcdu, output, &ep);
-		if (ret < 0) {
-			if (ret == -EPROBE_DEFER) {
-				of_node_put(ep_node);
-				return ret;
-			}
-
-			continue;
-		}
-
-		num_encoders++;
-	}
-
-	return num_encoders;
-}
-
 static int rcar_du_properties_init(struct rcar_du_device *rcdu)
 {
 	/*
@@ -462,7 +373,8 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	}
 
 	/* Initialize the encoders. */
-	ret = rcar_du_encoders_init(rcdu);
+	ret = rcar_du_encoders_init(rcdu, rcar_du_output_name,
+				    rcar_du_encoder_init);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index a1027436cfe3..d41fee590ee4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -517,3 +517,103 @@ rcar_du_lib_mode_cfg_helper_fns(void)
 {
 	return &rcar_du_mode_config_helper;
 }
+
+static int
+rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
+			  enum rcar_du_output output,
+			  struct of_endpoint *ep,
+			  const char *output_name,
+			  int (*rcar_du_encoder_init_fn)(struct rcar_du_device *r,
+							 enum rcar_du_output op,
+							 struct device_node *d))
+{
+	struct device_node *entity;
+	int ret;
+
+	/* Locate the connected entity and initialize the encoder. */
+	entity = of_graph_get_remote_port_parent(ep->local_node);
+	if (!entity) {
+		dev_dbg(rcdu->dev, "unconnected endpoint %pOF, skipping\n",
+			ep->local_node);
+		return -ENODEV;
+	}
+
+	if (!of_device_is_available(entity)) {
+		dev_dbg(rcdu->dev,
+			"connected entity %pOF is disabled, skipping\n",
+			entity);
+		of_node_put(entity);
+		return -ENODEV;
+	}
+
+	ret = rcar_du_encoder_init_fn(rcdu, output, entity);
+	if (ret && ret != -EPROBE_DEFER && ret != -ENOLINK)
+		dev_warn(rcdu->dev,
+			 "failed to initialize encoder %pOF on output %s (%d), skipping\n",
+			 entity, output_name, ret);
+
+	of_node_put(entity);
+
+	return ret;
+}
+
+int rcar_du_encoders_init(struct rcar_du_device *rcdu,
+			  const char* (*out_name)(enum rcar_du_output output),
+			  int (*encoder_init_fn)(struct rcar_du_device *rcdu,
+						 enum rcar_du_output output,
+						 struct device_node *enc_node))
+{
+	struct device_node *np = rcdu->dev->of_node;
+	struct device_node *ep_node;
+	unsigned int num_encoders = 0;
+
+	/*
+	 * Iterate over the endpoints and create one encoder for each output
+	 * pipeline.
+	 */
+	for_each_endpoint_of_node(np, ep_node) {
+		enum rcar_du_output output;
+		struct of_endpoint ep;
+		unsigned int i;
+		int ret;
+
+		ret = of_graph_parse_endpoint(ep_node, &ep);
+		if (ret < 0) {
+			of_node_put(ep_node);
+			return ret;
+		}
+
+		/* Find the output route corresponding to the port number. */
+		for (i = 0; i < RCAR_DU_OUTPUT_MAX; ++i) {
+			if (rcdu->info->routes[i].possible_crtcs &&
+			    rcdu->info->routes[i].port == ep.port) {
+				output = i;
+				break;
+			}
+		}
+
+		if (i == RCAR_DU_OUTPUT_MAX) {
+			dev_warn(rcdu->dev,
+				 "port %u references unexisting output, skipping\n",
+				 ep.port);
+			continue;
+		}
+
+		/* Process the output pipeline. */
+		ret = rcar_du_encoders_init_one(rcdu, output, &ep,
+						out_name(output),
+						encoder_init_fn);
+		if (ret < 0) {
+			if (ret == -EPROBE_DEFER) {
+				of_node_put(ep_node);
+				return ret;
+			}
+
+			continue;
+		}
+
+		num_encoders++;
+	}
+
+	return num_encoders;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index 8a689ac6c83f..02d6ed5aa154 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -46,4 +46,10 @@ rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 const struct drm_mode_config_helper_funcs *
 rcar_du_lib_mode_cfg_helper_fns(void);
 
+int rcar_du_encoders_init(struct rcar_du_device *rcdu,
+			  const char* (*out_name)(enum rcar_du_output output),
+			  int (*encoder_init_fn)(struct rcar_du_device *rcdu,
+						 enum rcar_du_output output,
+						 struct device_node *enc_node));
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

