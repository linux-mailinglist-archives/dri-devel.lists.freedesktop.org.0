Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19C19A5C7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D9B6E8DD;
	Wed,  1 Apr 2020 07:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Tue, 31 Mar 2020 14:25:47 UTC
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4980E6E83D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=5093; q=dns/txt; s=axis-central1;
 t=1585664747; x=1617200747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SpU24xL9XgC7M1fKLVLGIKXySSfM8/McWwq+1BKExiQ=;
 b=LMg0PhhtG/RcGRMc/u5Girn7/6V2E89LjszBJFOrNpjDGnP4Nxm7PAZn
 V4BOXR7bcatuxy56qPbyhJxqENbtnfK2IU5kCzzaOosXpG6T1BvQEyce9
 mKMPzHOCal0dvd3Lc5dMJQ0dCSNDAzXPKCCtgL/CoIL/aD2/Y+PqCM6Cp
 MoLqxTjclY9Oc0d97Xab0mog9d8ZEFykIhtGPEPTzMPzKEeRrJmOeXQp1
 GmXOXZwuvJvLKyF2FGdGv28gSlYnY4RAyIY3JBpVpS3bm961O9td3qI+r
 1v7VajtIvvsWMb2G/cE0OHnp20jVFhbXJswbz6LiXEsvKi2eCFtVqfsQc g==;
IronPort-SDR: 3PpwSg9GQvoPmLBlsSHhaNGAWHOc9wunQ4Hr41WfKJylyCyttlmxcKFCytapgiaq50s1Q1kusH
 urd1lr1oxxiiYxuOScA7OXUPt0/TCreMWq0bYkICQqa5hMc3Gr9lnCXTiVkB7KxmMdwa7ZtDkt
 Fg6TctxWpzWzkhr7++iYqLPcg115SxjtR05YveaAQucitd8ubqQp6+hfHWFSMXeVPyn/R8NK0A
 UXEiewVAyPWqabzvBskkXGhmk2lI7ThgxZG6nvCHAhbh6JG5FDMjoUu/ftoyhXKA2qAVwc55an
 c7A=
X-IronPort-AV: E=Sophos;i="5.72,328,1580770800"; 
   d="scan'208";a="7161443"
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>
Subject: [PATCH] drm/bridge: adv7511: Fix cec clock EPROBE_DEFER handling
Date: Tue, 31 Mar 2020 16:16:29 +0200
Message-ID: <20200331141629.14047-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Apr 2020 07:03:42 +0000
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
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 30 +++++++-------------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 11 +++++--
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index a20a45c0b353..4b0fee32be21 100644
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
@@ -342,8 +331,11 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 err_cec_alloc:
 	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
 		 ret);
-err_cec_parse_dt:
+	clk_disable_unprepare(adv7511->cec_clk);
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
