Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323581D465A
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B0E6EC09;
	Fri, 15 May 2020 06:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF816E32A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=6902; q=dns/txt; s=axis-central1;
 t=1589455859; x=1620991859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jBRBlj9gwionRJAP50TxCRzo3q1p1qtZOpygdfnnuFs=;
 b=b/ar+Sm/dQEtG6wfZOKdygxmbA+7ui7BA4JSQL2julNKBMWAy1FWpLOe
 NZ58npoHvEVHyvoVkzynWBEzo+phnwZxeDOumw53k/AToJdw8C0jaxfUT
 d/H9O7mM6ObVH+IAMcGz7I/sArNrPEY9K2ZiROuH7k+t928NZ8iqiYAGs
 dEhoWP9oVRS/oCLT8jhMOggNz23SRjAkjX/iHYzL69qFDZCRQ9FZlltZP
 y2jW+bXzbc452S7/UGGDiqa3RVZzQU9I2Ivd35bBixXsd9VN+15bFMnyu
 etILnedMJLl7nFoKDCe4Wu3BKixL8WB7puOGw02ub8GLmyNTxMi/tA1FU Q==;
IronPort-SDR: rTUBpbR1MJFXUmoLJfCwSlqRvxoZ35ngwYbngjS9tpAaXndq8GGdLL7vIVVHkc1x9U/7k3TA5H
 jsDbHktw6pKhqAPD2+n0qcKboI4wdth9KbSDeOYzdSO58Ox1e0LQNMbElPbN8mXzfUcEA2vS/E
 w2Kz/aa9IJCsp8ZCrfvMitAOoWM/TJTfQmmHHpt+q4CnA2ZYkwq2jrwBl4at83tEDCGAK8llWM
 VX2xfKhrijCpYaLTcfmDdW1GYK0QkGULdJepZmAcABnPHs/I5Rn/sTh64mIb4l4TzWPKrF6Ezf
 XHE=
X-IronPort-AV: E=Sophos;i="5.73,391,1583190000"; 
   d="scan'208";a="8721302"
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3] drm/bridge: adv7511: Fix cec clock EPROBE_DEFER handling
Date: Thu, 14 May 2020 13:30:51 +0200
Message-ID: <20200514113051.3567-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl, kernel@axis.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If adv7511's devm_clk_get() for the cec clock returns -EPROBE_DEFER, we
end up in an infinite probe loop.  This happens:

 (1) adv7511's probe is called.

 (2) adv7511's probe adds some secondary i2c devices which bind to the
 dummy driver and thus call driver_deferred_probe_trigger() and
 increment deferred_trigger_count (see driver_bound()).

 (3) adv7511's probe returns -EPROBE_DEFER, and since the
 deferred_trigger_count has changed during the probe call,
 driver_deferred_probe_trigger() is called immediately (see
 really_probe()) and adv7511's probe is scheduled.

 (4) Goto step 1.

[   61.972915] really_probe: bus: 'i2c': really_probe: probing driver adv7511 with device 0-0039
[   61.992734] really_probe: bus: 'i2c': really_probe: probing driver dummy with device 0-003f
[   61.993343] driver_bound: driver: 'dummy': driver_bound: bound to device '0-003f'
[   61.993626] really_probe: bus: 'i2c': really_probe: bound device 0-003f to driver dummy
[   61.995604] really_probe: bus: 'i2c': really_probe: probing driver dummy with device 0-0038
[   61.996381] driver_bound: driver: 'dummy': driver_bound: bound to device '0-0038'
[   61.996663] really_probe: bus: 'i2c': really_probe: bound device 0-0038 to driver dummy
[   61.998651] really_probe: bus: 'i2c': really_probe: probing driver dummy with device 0-003c
[   61.999222] driver_bound: driver: 'dummy': driver_bound: bound to device '0-003c'
[   61.999496] really_probe: bus: 'i2c': really_probe: bound device 0-003c to driver dummy
[   62.010050] really_probe: i2c 0-0039: Driver adv7511 requests probe deferral
[   62.011380] really_probe: bus: 'platform': really_probe: probing driver pwm-clock with device clock-cec
[   62.012812] really_probe: platform clock-cec: Driver pwm-clock requests probe deferral
[   62.024679] really_probe: bus: 'i2c': really_probe: probing driver adv7511 with device 0-0039

Fix this by calling devm_clk_get() before registering the secondary
devices.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
v3: Make adv7511_cec_init() return void.
v2: Add devm_clk_put() in error path.

 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  5 ++-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 34 ++++++++------------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 15 ++++++---
 3 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index a9bb734366ae..05a66149b186 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -380,17 +380,16 @@ struct adv7511 {
 };
 
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
-int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
+void adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
 void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
 #else
-static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
+static inline void adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 {
 	unsigned int offset = adv7511->type == ADV7533 ?
 						ADV7533_REG_CEC_OFFSET : 0;
 
 	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
 		     ADV7511_CEC_CTRL_POWER_DOWN);
-	return 0;
 }
 #endif
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index a20a45c0b353..ee0ed4fb67c1 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -286,28 +286,17 @@ static const struct cec_adap_ops adv7511_cec_adap_ops = {
 	.adap_transmit = adv7511_cec_adap_transmit,
 };
 
-static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
-{
-	adv7511->cec_clk = devm_clk_get(dev, "cec");
-	if (IS_ERR(adv7511->cec_clk)) {
-		int ret = PTR_ERR(adv7511->cec_clk);
-
-		adv7511->cec_clk = NULL;
-		return ret;
-	}
-	clk_prepare_enable(adv7511->cec_clk);
-	adv7511->cec_clk_freq = clk_get_rate(adv7511->cec_clk);
-	return 0;
-}
-
-int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
+void adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 {
 	unsigned int offset = adv7511->type == ADV7533 ?
 						ADV7533_REG_CEC_OFFSET : 0;
-	int ret = adv7511_cec_parse_dt(dev, adv7511);
+	int ret;
 
-	if (ret)
-		goto err_cec_parse_dt;
+	if (!adv7511->cec_clk)
+		goto err_cec_no_clock;
+
+	clk_prepare_enable(adv7511->cec_clk);
+	adv7511->cec_clk_freq = clk_get_rate(adv7511->cec_clk);
 
 	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
 		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
@@ -334,7 +323,7 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 	ret = cec_register_adapter(adv7511->cec_adap, dev);
 	if (ret)
 		goto err_cec_register;
-	return 0;
+	return;
 
 err_cec_register:
 	cec_delete_adapter(adv7511->cec_adap);
@@ -342,8 +331,11 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 err_cec_alloc:
 	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
 		 ret);
-err_cec_parse_dt:
+	clk_disable_unprepare(adv7511->cec_clk);
+	devm_clk_put(dev, adv7511->cec_clk);
+	/* Ensure that adv7511_remove() doesn't attempt to disable it again. */
+	adv7511->cec_clk = NULL;
+err_cec_no_clock:
 	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
 		     ADV7511_CEC_CTRL_POWER_DOWN);
-	return ret == -EPROBE_DEFER ? ret : 0;
 }
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 87b58c1acff4..8d8df6116082 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1128,6 +1128,15 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	if (ret)
 		return ret;
 
+	adv7511->cec_clk = devm_clk_get(dev, "cec");
+	if (IS_ERR(adv7511->cec_clk)) {
+		ret = PTR_ERR(adv7511->cec_clk);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		adv7511->cec_clk = NULL;
+	}
+
 	ret = adv7511_init_regulators(adv7511);
 	if (ret) {
 		dev_err(dev, "failed to init regulators\n");
@@ -1218,9 +1227,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	if (adv7511->type == ADV7511)
 		adv7511_set_link_config(adv7511, &link_config);
 
-	ret = adv7511_cec_init(dev, adv7511);
-	if (ret)
-		goto err_unregister_cec;
+	adv7511_cec_init(dev, adv7511);
 
 	adv7511->bridge.funcs = &adv7511_bridge_funcs;
 	adv7511->bridge.of_node = dev->of_node;
@@ -1232,8 +1239,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 
 err_unregister_cec:
 	i2c_unregister_device(adv7511->i2c_cec);
-	if (adv7511->cec_clk)
-		clk_disable_unprepare(adv7511->cec_clk);
 err_i2c_unregister_packet:
 	i2c_unregister_device(adv7511->i2c_packet);
 err_i2c_unregister_edid:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
