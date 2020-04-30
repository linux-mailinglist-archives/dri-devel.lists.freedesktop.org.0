Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582851C0EC0
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CAC6EC1C;
	Fri,  1 May 2020 07:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD066EA6E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=5174; q=dns/txt; s=axis-central1;
 t=1588247705; x=1619783705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ELbkQPF89PGOFSm7MQv+09MJ02P9Ecfguw5yKeXquXE=;
 b=RkbxWm7BG57SIDA7/9OECrj1JMGVbpNu9hZ8RPV3CxHwQWkMiOmYBl67
 30Nv6YfR45HnOSklF/kYLG9RZNq3PYFOE7t+SV1KISeFV6VvxszYosTnP
 qCKfqoHTfRpxUQXpHQMoM1qG5gp3JkBODy/hEvudDLLKVLVi4lWDvE09y
 8RHZ16JIWmQElUpNsBGwt0kcZVbMGzi/+thyUdXUQ9Sekh/2o0Djqg1f3
 8wDT0dVfRSsHFIhesysSwvnhs+xZaSeaZcGrcn+97zZ1cJbpUadhnnbCX
 kdJcn3Pc2gO/kAK44Fii8bNoWTO0acocX/os+WfztpbezpFgs41vjNWP5 g==;
IronPort-SDR: 7nF2b83pK1oQbW5qsT7CCdAO1uF//MKs2Mv76gV1dVtM8wXLJccZBSD3T7HM4gaMdkpiCdnRyD
 1bfhZeSKisYllSWpIg39CeuBQE/c32sIZgmG9YTK4RT2x4woHcF1BEeILMROsua0sxLqaQC4U7
 hq+Kzz0B5tk4Fh9mRcB0ZHiAjeC4mtDqGZ4Cy1vlSCFhy9o1OHMNMG3TOfcn843xK5Lyxg8g3L
 FskrrcNfAaD9F5xZLN0GpCQnT5C80SNZ22ZQei8Dhb73yJLZBCvqBgpH72tRquLPmsvy3mp0AI
 OIs=
X-IronPort-AV: E=Sophos;i="5.73,334,1583190000"; 
   d="scan'208";a="8031549"
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>
Subject: [PATCH v2] drm/bridge: adv7511: Fix cec clock EPROBE_DEFER handling
Date: Thu, 30 Apr 2020 13:54:39 +0200
Message-ID: <20200430115439.9649-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl, kernel@axis.com,
 Laurent.pinchart@ideasonboard.com
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
v2: Add devm_clk_put() in error path.

 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 31 ++++++++------------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 11 +++++--
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index a20a45c0b353..f5e9d0b238d2 100644
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
 int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
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
@@ -342,8 +331,12 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
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
+	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9e13e466e72c..ebc548e23ece 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1122,6 +1122,15 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
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
@@ -1226,8 +1235,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 
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
