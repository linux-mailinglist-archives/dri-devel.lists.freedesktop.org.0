Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIxIHkaec2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D8878402
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B44B10EB50;
	Fri, 23 Jan 2026 16:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TANzyomH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DEB10EB4D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:13:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5DBD64E42223;
 Fri, 23 Jan 2026 16:13:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3232A6070A;
 Fri, 23 Jan 2026 16:13:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35463119A87DE; Fri, 23 Jan 2026 17:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184827; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Xaxir2BF/2AAPP//cTgqSk8YQ/2vo6kmLft9QcIZP28=;
 b=TANzyomHNU10P4dOgD2CFQtvZPsHzeW+grOAMsldamFmXiTI9bORYMPcp2GSwPDVl6g888
 e+qGmxZU8IXMKupnEoApMXnacRTibmV4R+Q8+SdgP+IUJd5sMoGX+jGcHF1oJK81i4Mqcn
 KU66QKzF2XNOKN/JvG5cIdG0OjzY7MdaoFDD+Sk0/1XbZo34ti8nAuCqhn8hNHe0YXscDo
 tg4PZOMW/IxwtxM1BRhHOr4wnCTfkAiU2pjlgta4MiUDkFvholf+gCzN4PD6nLYZR4YCS1
 tNgTWwR9Wh2EjPrPWUSw9yNJkrsfa0GbpyN6PN9jMY4cZwWzRoZhtqiKKZa0FQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:40 +0100
Subject: [PATCH v5 22/25] drm/bridge: tda998x: Move tda998x_create/destroy
 into probe and remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-22-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 25D8878402
X-Rspamd-Action: no action

Now that tda998x_create and tda998x_destroy are called only in the probe
function, there is no need for separate functions.
Move the code into the tda998x_probe and tda998x_remove functions.
Rewrite the cleanup path using goto calls in probe and reorder it in the
remove function.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

---
Change in v3:
- Move free_irq() call at the right place in the probe error path.
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 99 +++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index 865285ba2bd8c..e06d8d4c4b875 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -1748,38 +1748,20 @@ static int tda998x_get_audio_ports(struct tda998x_priv *priv,
 	return 0;
 }
 
-static void tda998x_destroy(struct device *dev)
-{
-	struct tda998x_priv *priv = dev_get_drvdata(dev);
-
-	drm_bridge_remove(&priv->bridge);
-
-	/* disable all IRQs and free the IRQ handler */
-	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
-	reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
-
-	if (priv->audio_pdev)
-		platform_device_unregister(priv->audio_pdev);
-
-	if (priv->hdmi->irq)
-		free_irq(priv->hdmi->irq, priv);
-
-	timer_delete_sync(&priv->edid_delay_timer);
-	cancel_work_sync(&priv->detect_work);
-
-	i2c_unregister_device(priv->cec);
-
-	cec_notifier_conn_unregister(priv->cec_notify);
-}
-
-static int tda998x_create(struct device *dev)
+static int
+tda998x_probe(struct i2c_client *client)
 {
-	struct i2c_client *client = to_i2c_client(dev);
 	struct device_node *np = client->dev.of_node;
+	struct device *dev = &client->dev;
 	struct i2c_board_info cec_info;
 	struct tda998x_priv *priv;
-	u32 video;
 	int rev_lo, rev_hi, ret;
+	u32 video;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_warn(&client->dev, "adapter does not support I2C\n");
+		return -EIO;
+	}
 
 	priv = devm_drm_bridge_alloc(dev, struct tda998x_priv, bridge, &tda998x_bridge_funcs);
 	if (IS_ERR(priv))
@@ -1814,13 +1796,15 @@ static int tda998x_create(struct device *dev)
 	rev_lo = reg_read(priv, REG_VERSION_LSB);
 	if (rev_lo < 0) {
 		dev_err(dev, "failed to read version: %d\n", rev_lo);
-		return rev_lo;
+		ret = rev_lo;
+		goto cancel_work;
 	}
 
 	rev_hi = reg_read(priv, REG_VERSION_MSB);
 	if (rev_hi < 0) {
 		dev_err(dev, "failed to read version: %d\n", rev_hi);
-		return rev_hi;
+		ret = rev_hi;
+		goto cancel_work;
 	}
 
 	priv->rev = rev_lo | rev_hi << 8;
@@ -1843,7 +1827,8 @@ static int tda998x_create(struct device *dev)
 		break;
 	default:
 		dev_err(dev, "found unsupported device: %04x\n", priv->rev);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto cancel_work;
 	}
 
 	/* after reset, enable DDC: */
@@ -1887,7 +1872,7 @@ static int tda998x_create(struct device *dev)
 		if (ret) {
 			dev_err(dev, "failed to request IRQ#%u: %d\n",
 				client->irq, ret);
-			goto err_irq;
+			goto cancel_work;
 		}
 
 		/* enable HPD irq */
@@ -1897,7 +1882,7 @@ static int tda998x_create(struct device *dev)
 	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
 	if (!priv->cec_notify) {
 		ret = -ENOMEM;
-		goto fail;
+		goto free_irq;
 	}
 
 	priv->cec_glue.parent = dev;
@@ -1924,7 +1909,7 @@ static int tda998x_create(struct device *dev)
 	priv->cec = i2c_new_client_device(client->adapter, &cec_info);
 	if (IS_ERR(priv->cec)) {
 		ret = PTR_ERR(priv->cec);
-		goto fail;
+		goto notifier_conn_unregister;
 	}
 
 	/* enable EDID read irq: */
@@ -1941,7 +1926,7 @@ static int tda998x_create(struct device *dev)
 
 		ret = tda998x_get_audio_ports(priv, np);
 		if (ret)
-			goto fail;
+			goto unregister_dev;
 
 		if (priv->audio_port_enable[AUDIO_ROUTE_I2S] ||
 		    priv->audio_port_enable[AUDIO_ROUTE_SPDIF])
@@ -1956,26 +1941,44 @@ static int tda998x_create(struct device *dev)
 
 	return 0;
 
-fail:
-	tda998x_destroy(dev);
-err_irq:
+unregister_dev:
+	i2c_unregister_device(priv->cec);
+notifier_conn_unregister:
+	cec_notifier_conn_unregister(priv->cec_notify);
+free_irq:
+	if (client->irq) {
+		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
+		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
+		free_irq(client->irq, priv);
+	}
+cancel_work:
+	timer_delete_sync(&priv->edid_delay_timer);
+	cancel_work_sync(&priv->detect_work);
 	return ret;
 }
 
-static int
-tda998x_probe(struct i2c_client *client)
+static void tda998x_remove(struct i2c_client *client)
 {
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_warn(&client->dev, "adapter does not support I2C\n");
-		return -EIO;
-	}
+	struct tda998x_priv *priv = dev_get_drvdata(&client->dev);
 
-	return tda998x_create(&client->dev);
-}
+	drm_bridge_remove(&priv->bridge);
 
-static void tda998x_remove(struct i2c_client *client)
-{
-	tda998x_destroy(&client->dev);
+	if (priv->audio_pdev)
+		platform_device_unregister(priv->audio_pdev);
+
+	i2c_unregister_device(priv->cec);
+
+	cec_notifier_conn_unregister(priv->cec_notify);
+
+	/* disable all IRQs and free the IRQ handler */
+	if (client->irq) {
+		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
+		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
+		free_irq(priv->hdmi->irq, priv);
+	}
+
+	timer_delete_sync(&priv->edid_delay_timer);
+	cancel_work_sync(&priv->detect_work);
 }
 
 #ifdef CONFIG_OF

-- 
2.43.0

