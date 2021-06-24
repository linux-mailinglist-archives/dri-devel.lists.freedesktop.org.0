Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375993B242F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 02:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD666E99A;
	Thu, 24 Jun 2021 00:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C34D6E993
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 00:03:45 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB8302739;
 Thu, 24 Jun 2021 02:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624493023;
 bh=bI9i65GnXyRTmC849FQ5LL5Yk39+/LdVgUhP6XarnhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ERU479vs8Pav5nw9plKt5jKjhabOPGh4/PZcV0kJ7AMZg8L2ZAz4jud7fTRx7BIM2
 2qQMyXYIeI0cFrTewgivfkRdZxyrbgVhlC6TmcU0YFbBnIhW2Ctk1wb2IzookfJRqk
 /jCD/zqQoCOnNUwiDTfJhs2ZVoPrK+6BLfg4ejFc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/bridge: ti-sn65dsi86: Group code in sections
Date: Thu, 24 Jun 2021 03:03:03 +0300
Message-Id: <20210624000304.16281-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reorganize the functions in sections, related to connector operations,
bridge operations, AUX adapter, GPIO controller and probe & remove.

This prepares for proper support of DRM_BRIDGE_ATTACH_NO_CONNECTOR that
will add more functions, to ensure that the code will stay readable.

No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 629 +++++++++++++-------------
 1 file changed, 326 insertions(+), 303 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 18b4420cc6b3..feeda88c4ef0 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -394,7 +394,211 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
-/* Connector funcs */
+/* -----------------------------------------------------------------------------
+ * Auxiliary Devices (*not* AUX)
+ */
+
+static void ti_sn65dsi86_uninit_aux(void *data)
+{
+	auxiliary_device_uninit(data);
+}
+
+static void ti_sn65dsi86_delete_aux(void *data)
+{
+	auxiliary_device_delete(data);
+}
+
+/*
+ * AUX bus docs say that a non-NULL release is mandatory, but it makes no
+ * sense for the model used here where all of the aux devices are allocated
+ * in the single shared structure. We'll use this noop as a workaround.
+ */
+static void ti_sn65dsi86_noop(struct device *dev) {}
+
+static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
+				       struct auxiliary_device *aux,
+				       const char *name)
+{
+	struct device *dev = pdata->dev;
+	int ret;
+
+	aux->name = name;
+	aux->dev.parent = dev;
+	aux->dev.release = ti_sn65dsi86_noop;
+	device_set_of_node_from_dev(&aux->dev, dev);
+	ret = auxiliary_device_init(aux);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(aux);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
+
+	return ret;
+}
+
+/* -----------------------------------------------------------------------------
+ * AUX Adapter
+ */
+
+static struct ti_sn65dsi86 *aux_to_ti_sn65dsi86(struct drm_dp_aux *aux)
+{
+	return container_of(aux, struct ti_sn65dsi86, aux);
+}
+
+static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
+				  struct drm_dp_aux_msg *msg)
+{
+	struct ti_sn65dsi86 *pdata = aux_to_ti_sn65dsi86(aux);
+	u32 request = msg->request & ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
+	u32 request_val = AUX_CMD_REQ(msg->request);
+	u8 *buf = msg->buffer;
+	unsigned int len = msg->size;
+	unsigned int val;
+	int ret;
+	u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];
+
+	if (len > SN_AUX_MAX_PAYLOAD_BYTES)
+		return -EINVAL;
+
+	pm_runtime_get_sync(pdata->dev);
+	mutex_lock(&pdata->comms_mutex);
+
+	/*
+	 * If someone tries to do a DDC over AUX transaction before pre_enable()
+	 * on a device without a dedicated reference clock then we just can't
+	 * do it. Fail right away. This prevents non-refclk users from reading
+	 * the EDID before enabling the panel but such is life.
+	 */
+	if (!pdata->comms_enabled) {
+		ret = -EIO;
+		goto exit;
+	}
+
+	switch (request) {
+	case DP_AUX_NATIVE_WRITE:
+	case DP_AUX_I2C_WRITE:
+	case DP_AUX_NATIVE_READ:
+	case DP_AUX_I2C_READ:
+		regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val);
+		/* Assume it's good */
+		msg->reply = 0;
+		break;
+	default:
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	BUILD_BUG_ON(sizeof(addr_len) != sizeof(__be32));
+	put_unaligned_be32((msg->address & SN_AUX_ADDR_MASK) << 8 | len,
+			   addr_len);
+	regmap_bulk_write(pdata->regmap, SN_AUX_ADDR_19_16_REG, addr_len,
+			  ARRAY_SIZE(addr_len));
+
+	if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE)
+		regmap_bulk_write(pdata->regmap, SN_AUX_WDATA_REG(0), buf, len);
+
+	/* Clear old status bits before start so we don't get confused */
+	regmap_write(pdata->regmap, SN_AUX_CMD_STATUS_REG,
+		     AUX_IRQ_STATUS_NAT_I2C_FAIL |
+		     AUX_IRQ_STATUS_AUX_RPLY_TOUT |
+		     AUX_IRQ_STATUS_AUX_SHORT);
+
+	regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val | AUX_CMD_SEND);
+
+	/* Zero delay loop because i2c transactions are slow already */
+	ret = regmap_read_poll_timeout(pdata->regmap, SN_AUX_CMD_REG, val,
+				       !(val & AUX_CMD_SEND), 0, 50 * 1000);
+	if (ret)
+		goto exit;
+
+	ret = regmap_read(pdata->regmap, SN_AUX_CMD_STATUS_REG, &val);
+	if (ret)
+		goto exit;
+
+	if (val & AUX_IRQ_STATUS_AUX_RPLY_TOUT) {
+		/*
+		 * The hardware tried the message seven times per the DP spec
+		 * but it hit a timeout. We ignore defers here because they're
+		 * handled in hardware.
+		 */
+		ret = -ETIMEDOUT;
+		goto exit;
+	}
+
+	if (val & AUX_IRQ_STATUS_AUX_SHORT) {
+		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
+		if (ret)
+			goto exit;
+	} else if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
+		switch (request) {
+		case DP_AUX_I2C_WRITE:
+		case DP_AUX_I2C_READ:
+			msg->reply |= DP_AUX_I2C_REPLY_NACK;
+			break;
+		case DP_AUX_NATIVE_READ:
+		case DP_AUX_NATIVE_WRITE:
+			msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
+			break;
+		}
+		len = 0;
+		goto exit;
+	}
+
+	if (request != DP_AUX_NATIVE_WRITE && request != DP_AUX_I2C_WRITE && len != 0)
+		ret = regmap_bulk_read(pdata->regmap, SN_AUX_RDATA_REG(0), buf, len);
+
+exit:
+	mutex_unlock(&pdata->comms_mutex);
+	pm_runtime_mark_last_busy(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
+
+	if (ret)
+		return ret;
+	return len;
+}
+
+static int ti_sn_aux_probe(struct auxiliary_device *adev,
+			   const struct auxiliary_device_id *id)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+	int ret;
+
+	pdata->aux.name = "ti-sn65dsi86-aux";
+	pdata->aux.dev = &adev->dev;
+	pdata->aux.transfer = ti_sn_aux_transfer;
+	drm_dp_aux_init(&pdata->aux);
+
+	ret = devm_of_dp_aux_populate_ep_devices(&pdata->aux);
+	if (ret)
+		return ret;
+
+	/*
+	 * The eDP to MIPI bridge parts don't work until the AUX channel is
+	 * setup so we don't add it in the main driver probe, we add it now.
+	 */
+	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+}
+
+static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
+	{ .name = "ti_sn65dsi86.aux", },
+	{},
+};
+
+static struct auxiliary_driver ti_sn_aux_driver = {
+	.name = "aux",
+	.probe = ti_sn_aux_probe,
+	.id_table = ti_sn_aux_id_table,
+};
+
+/* -----------------------------------------------------------------------------
+ * DRM Connector Operations
+ */
+
 static struct ti_sn65dsi86 *
 connector_to_ti_sn65dsi86(struct drm_connector *connector)
 {
@@ -432,25 +636,15 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+/*------------------------------------------------------------------------------
+ * DRM Bridge
+ */
+
 static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct ti_sn65dsi86, bridge);
 }
 
-static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
-{
-	unsigned int i;
-	const char * const ti_sn_bridge_supply_names[] = {
-		"vcca", "vcc", "vccio", "vpll",
-	};
-
-	for (i = 0; i < SN_REGULATOR_SUPPLY_NUM; i++)
-		pdata->supplies[i].supply = ti_sn_bridge_supply_names[i];
-
-	return devm_regulator_bulk_get(pdata->dev, SN_REGULATOR_SUPPLY_NUM,
-				       pdata->supplies);
-}
-
 static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 			       enum drm_bridge_attach_flags flags)
 {
@@ -916,121 +1110,53 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.post_disable = ti_sn_bridge_post_disable,
 };
 
-static struct ti_sn65dsi86 *aux_to_ti_sn65dsi86(struct drm_dp_aux *aux)
+static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
+				     struct device_node *np)
 {
-	return container_of(aux, struct ti_sn65dsi86, aux);
-}
-
-static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
-				  struct drm_dp_aux_msg *msg)
-{
-	struct ti_sn65dsi86 *pdata = aux_to_ti_sn65dsi86(aux);
-	u32 request = msg->request & ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
-	u32 request_val = AUX_CMD_REQ(msg->request);
-	u8 *buf = msg->buffer;
-	unsigned int len = msg->size;
-	unsigned int val;
-	int ret;
-	u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];
-
-	if (len > SN_AUX_MAX_PAYLOAD_BYTES)
-		return -EINVAL;
-
-	pm_runtime_get_sync(pdata->dev);
-	mutex_lock(&pdata->comms_mutex);
+	u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
+	u32 lane_polarities[SN_MAX_DP_LANES] = { };
+	struct device_node *endpoint;
+	u8 ln_assign = 0;
+	u8 ln_polrs = 0;
+	int dp_lanes;
+	int i;
 
 	/*
-	 * If someone tries to do a DDC over AUX transaction before pre_enable()
-	 * on a device without a dedicated reference clock then we just can't
-	 * do it. Fail right away. This prevents non-refclk users from reading
-	 * the EDID before enabling the panel but such is life.
+	 * Read config from the device tree about lane remapping and lane
+	 * polarities.  These are optional and we assume identity map and
+	 * normal polarity if nothing is specified.  It's OK to specify just
+	 * data-lanes but not lane-polarities but not vice versa.
+	 *
+	 * Error checking is light (we just make sure we don't crash or
+	 * buffer overrun) and we assume dts is well formed and specifying
+	 * mappings that the hardware supports.
 	 */
-	if (!pdata->comms_enabled) {
-		ret = -EIO;
-		goto exit;
-	}
-
-	switch (request) {
-	case DP_AUX_NATIVE_WRITE:
-	case DP_AUX_I2C_WRITE:
-	case DP_AUX_NATIVE_READ:
-	case DP_AUX_I2C_READ:
-		regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val);
-		/* Assume it's good */
-		msg->reply = 0;
-		break;
-	default:
-		ret = -EINVAL;
-		goto exit;
-	}
-
-	BUILD_BUG_ON(sizeof(addr_len) != sizeof(__be32));
-	put_unaligned_be32((msg->address & SN_AUX_ADDR_MASK) << 8 | len,
-			   addr_len);
-	regmap_bulk_write(pdata->regmap, SN_AUX_ADDR_19_16_REG, addr_len,
-			  ARRAY_SIZE(addr_len));
-
-	if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE)
-		regmap_bulk_write(pdata->regmap, SN_AUX_WDATA_REG(0), buf, len);
-
-	/* Clear old status bits before start so we don't get confused */
-	regmap_write(pdata->regmap, SN_AUX_CMD_STATUS_REG,
-		     AUX_IRQ_STATUS_NAT_I2C_FAIL |
-		     AUX_IRQ_STATUS_AUX_RPLY_TOUT |
-		     AUX_IRQ_STATUS_AUX_SHORT);
-
-	regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val | AUX_CMD_SEND);
-
-	/* Zero delay loop because i2c transactions are slow already */
-	ret = regmap_read_poll_timeout(pdata->regmap, SN_AUX_CMD_REG, val,
-				       !(val & AUX_CMD_SEND), 0, 50 * 1000);
-	if (ret)
-		goto exit;
-
-	ret = regmap_read(pdata->regmap, SN_AUX_CMD_STATUS_REG, &val);
-	if (ret)
-		goto exit;
-
-	if (val & AUX_IRQ_STATUS_AUX_RPLY_TOUT) {
-		/*
-		 * The hardware tried the message seven times per the DP spec
-		 * but it hit a timeout. We ignore defers here because they're
-		 * handled in hardware.
-		 */
-		ret = -ETIMEDOUT;
-		goto exit;
+	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
+	dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	if (dp_lanes > 0 && dp_lanes <= SN_MAX_DP_LANES) {
+		of_property_read_u32_array(endpoint, "data-lanes",
+					   lane_assignments, dp_lanes);
+		of_property_read_u32_array(endpoint, "lane-polarities",
+					   lane_polarities, dp_lanes);
+	} else {
+		dp_lanes = SN_MAX_DP_LANES;
 	}
+	of_node_put(endpoint);
 
-	if (val & AUX_IRQ_STATUS_AUX_SHORT) {
-		ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
-		if (ret)
-			goto exit;
-	} else if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
-		switch (request) {
-		case DP_AUX_I2C_WRITE:
-		case DP_AUX_I2C_READ:
-			msg->reply |= DP_AUX_I2C_REPLY_NACK;
-			break;
-		case DP_AUX_NATIVE_READ:
-		case DP_AUX_NATIVE_WRITE:
-			msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
-			break;
-		}
-		len = 0;
-		goto exit;
+	/*
+	 * Convert into register format.  Loop over all lanes even if
+	 * data-lanes had fewer elements so that we nicely initialize
+	 * the LN_ASSIGN register.
+	 */
+	for (i = SN_MAX_DP_LANES - 1; i >= 0; i--) {
+		ln_assign = ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
+		ln_polrs = ln_polrs << 1 | lane_polarities[i];
 	}
 
-	if (request != DP_AUX_NATIVE_WRITE && request != DP_AUX_I2C_WRITE && len != 0)
-		ret = regmap_bulk_read(pdata->regmap, SN_AUX_RDATA_REG(0), buf, len);
-
-exit:
-	mutex_unlock(&pdata->comms_mutex);
-	pm_runtime_mark_last_busy(pdata->dev);
-	pm_runtime_put_autosuspend(pdata->dev);
-
-	if (ret)
-		return ret;
-	return len;
+	/* Stash in our struct for when we power on */
+	pdata->dp_lanes = dp_lanes;
+	pdata->ln_assign = ln_assign;
+	pdata->ln_polrs = ln_polrs;
 }
 
 static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
@@ -1047,6 +1173,72 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
 	return 0;
 }
 
+static int ti_sn_bridge_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+	struct device_node *np = pdata->dev->of_node;
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
+	if (ret)
+		return dev_err_probe(&adev->dev, ret,
+				     "could not find any panel node\n");
+
+	pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev, panel);
+	if (IS_ERR(pdata->next_bridge)) {
+		DRM_ERROR("failed to create panel bridge\n");
+		return PTR_ERR(pdata->next_bridge);
+	}
+
+	ti_sn_bridge_parse_lanes(pdata, np);
+
+	ret = ti_sn_bridge_parse_dsi_host(pdata);
+	if (ret)
+		return ret;
+
+	pdata->bridge.funcs = &ti_sn_bridge_funcs;
+	pdata->bridge.of_node = np;
+
+	drm_bridge_add(&pdata->bridge);
+
+	return 0;
+}
+
+static void ti_sn_bridge_remove(struct auxiliary_device *adev)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+
+	if (!pdata)
+		return;
+
+	if (pdata->dsi) {
+		mipi_dsi_detach(pdata->dsi);
+		mipi_dsi_device_unregister(pdata->dsi);
+	}
+
+	drm_bridge_remove(&pdata->bridge);
+
+	of_node_put(pdata->host_node);
+}
+
+static const struct auxiliary_device_id ti_sn_bridge_id_table[] = {
+	{ .name = "ti_sn65dsi86.bridge", },
+	{},
+};
+
+static struct auxiliary_driver ti_sn_bridge_driver = {
+	.name = "bridge",
+	.probe = ti_sn_bridge_probe,
+	.remove = ti_sn_bridge_remove,
+	.id_table = ti_sn_bridge_id_table,
+};
+
+/* -----------------------------------------------------------------------------
+ * GPIO Controller
+ */
+
 #if defined(CONFIG_OF_GPIO)
 
 static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
@@ -1251,198 +1443,29 @@ static inline void ti_sn_gpio_unregister(void) {}
 
 #endif
 
-static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
-				     struct device_node *np)
-{
-	u32 lane_assignments[SN_MAX_DP_LANES] = { 0, 1, 2, 3 };
-	u32 lane_polarities[SN_MAX_DP_LANES] = { };
-	struct device_node *endpoint;
-	u8 ln_assign = 0;
-	u8 ln_polrs = 0;
-	int dp_lanes;
-	int i;
-
-	/*
-	 * Read config from the device tree about lane remapping and lane
-	 * polarities.  These are optional and we assume identity map and
-	 * normal polarity if nothing is specified.  It's OK to specify just
-	 * data-lanes but not lane-polarities but not vice versa.
-	 *
-	 * Error checking is light (we just make sure we don't crash or
-	 * buffer overrun) and we assume dts is well formed and specifying
-	 * mappings that the hardware supports.
-	 */
-	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
-	dp_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
-	if (dp_lanes > 0 && dp_lanes <= SN_MAX_DP_LANES) {
-		of_property_read_u32_array(endpoint, "data-lanes",
-					   lane_assignments, dp_lanes);
-		of_property_read_u32_array(endpoint, "lane-polarities",
-					   lane_polarities, dp_lanes);
-	} else {
-		dp_lanes = SN_MAX_DP_LANES;
-	}
-	of_node_put(endpoint);
-
-	/*
-	 * Convert into register format.  Loop over all lanes even if
-	 * data-lanes had fewer elements so that we nicely initialize
-	 * the LN_ASSIGN register.
-	 */
-	for (i = SN_MAX_DP_LANES - 1; i >= 0; i--) {
-		ln_assign = ln_assign << LN_ASSIGN_WIDTH | lane_assignments[i];
-		ln_polrs = ln_polrs << 1 | lane_polarities[i];
-	}
-
-	/* Stash in our struct for when we power on */
-	pdata->dp_lanes = dp_lanes;
-	pdata->ln_assign = ln_assign;
-	pdata->ln_polrs = ln_polrs;
-}
-
-static int ti_sn_bridge_probe(struct auxiliary_device *adev,
-			      const struct auxiliary_device_id *id)
-{
-	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
-	struct device_node *np = pdata->dev->of_node;
-	struct drm_panel *panel;
-	int ret;
-
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
-	if (ret)
-		return dev_err_probe(&adev->dev, ret,
-				     "could not find any panel node\n");
-
-	pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev, panel);
-	if (IS_ERR(pdata->next_bridge)) {
-		DRM_ERROR("failed to create panel bridge\n");
-		return PTR_ERR(pdata->next_bridge);
-	}
-
-	ti_sn_bridge_parse_lanes(pdata, np);
-
-	ret = ti_sn_bridge_parse_dsi_host(pdata);
-	if (ret)
-		return ret;
-
-	pdata->bridge.funcs = &ti_sn_bridge_funcs;
-	pdata->bridge.of_node = np;
-
-	drm_bridge_add(&pdata->bridge);
-
-	return 0;
-}
-
-static void ti_sn_bridge_remove(struct auxiliary_device *adev)
-{
-	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
-
-	if (!pdata)
-		return;
-
-	if (pdata->dsi) {
-		mipi_dsi_detach(pdata->dsi);
-		mipi_dsi_device_unregister(pdata->dsi);
-	}
-
-	drm_bridge_remove(&pdata->bridge);
-
-	of_node_put(pdata->host_node);
-}
-
-static const struct auxiliary_device_id ti_sn_bridge_id_table[] = {
-	{ .name = "ti_sn65dsi86.bridge", },
-	{},
-};
-
-static struct auxiliary_driver ti_sn_bridge_driver = {
-	.name = "bridge",
-	.probe = ti_sn_bridge_probe,
-	.remove = ti_sn_bridge_remove,
-	.id_table = ti_sn_bridge_id_table,
-};
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
 
 static void ti_sn65dsi86_runtime_disable(void *data)
 {
 	pm_runtime_disable(data);
 }
 
-static void ti_sn65dsi86_uninit_aux(void *data)
+static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
 {
-	auxiliary_device_uninit(data);
-}
-
-static void ti_sn65dsi86_delete_aux(void *data)
-{
-	auxiliary_device_delete(data);
-}
-
-/*
- * AUX bus docs say that a non-NULL release is mandatory, but it makes no
- * sense for the model used here where all of the aux devices are allocated
- * in the single shared structure. We'll use this noop as a workaround.
- */
-static void ti_sn65dsi86_noop(struct device *dev) {}
-
-static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
-				       struct auxiliary_device *aux,
-				       const char *name)
-{
-	struct device *dev = pdata->dev;
-	int ret;
-
-	aux->name = name;
-	aux->dev.parent = dev;
-	aux->dev.release = ti_sn65dsi86_noop;
-	device_set_of_node_from_dev(&aux->dev, dev);
-	ret = auxiliary_device_init(aux);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
-	if (ret)
-		return ret;
+	unsigned int i;
+	const char * const ti_sn_bridge_supply_names[] = {
+		"vcca", "vcc", "vccio", "vpll",
+	};
 
-	ret = auxiliary_device_add(aux);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
+	for (i = 0; i < SN_REGULATOR_SUPPLY_NUM; i++)
+		pdata->supplies[i].supply = ti_sn_bridge_supply_names[i];
 
-	return ret;
+	return devm_regulator_bulk_get(pdata->dev, SN_REGULATOR_SUPPLY_NUM,
+				       pdata->supplies);
 }
 
-static int ti_sn_aux_probe(struct auxiliary_device *adev,
-			   const struct auxiliary_device_id *id)
-{
-	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
-	int ret;
-
-	pdata->aux.name = "ti-sn65dsi86-aux";
-	pdata->aux.dev = &adev->dev;
-	pdata->aux.transfer = ti_sn_aux_transfer;
-	drm_dp_aux_init(&pdata->aux);
-
-	ret = devm_of_dp_aux_populate_ep_devices(&pdata->aux);
-	if (ret)
-		return ret;
-
-	/*
-	 * The eDP to MIPI bridge parts don't work until the AUX channel is
-	 * setup so we don't add it in the main driver probe, we add it now.
-	 */
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
-}
-
-static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
-	{ .name = "ti_sn65dsi86.aux", },
-	{},
-};
-
-static struct auxiliary_driver ti_sn_aux_driver = {
-	.name = "aux",
-	.probe = ti_sn_aux_probe,
-	.id_table = ti_sn_aux_id_table,
-};
-
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
-- 
Regards,

Laurent Pinchart

