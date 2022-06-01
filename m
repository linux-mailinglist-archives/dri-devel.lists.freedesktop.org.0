Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163AB53A036
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DC610E986;
	Wed,  1 Jun 2022 09:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3E010E95E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:23:17 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id y29so1310652ljd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7azJM45SL/Q3qWDcQfpnV0v+091eG9XqVPjE0cyc92I=;
 b=clV6rLrNVctGw6fjD2UL0JQy5qvexBYWTxk5quYTQySnDp/VapDmHBa+++usbXtr99
 A3xWXzSL5k6F60cAGUlPqbFWJ1J6TOeeWxP/BetzZZm6cvIAyFRDckkmf8ajved/e1AM
 UWUGVEXq7BOrHF/J/vmsN8r44qnzyoIQGtg8RFUaZRlDwE5vtz3ZSCk4B0EKvC+tsEuQ
 TXpJElW5tHmvS/RD7TWHcv0NPJxSfJJMshMs6yCYAKn6ND0rc1jsVISlHeBLxGO0AFM6
 kt2wrC1+TQwEKg59LALZ6bGG2jNiOBREycWvlofiNmeDE8jvy7/OD02KWWhjqnxjWrMy
 LBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7azJM45SL/Q3qWDcQfpnV0v+091eG9XqVPjE0cyc92I=;
 b=PANaGcxuBjrowrQXFtrFGQYe/tOT7RlqdIMPv9NO21aS5n6h9EonfFRBZAy0t/mmOH
 EUZUbmOxawLuK+fLOUcHfK+/U+C7OXxWXKJe6YX+9mn/bJ8DCOE9F3hReZfpjFdfh6Xb
 3dHZtsGG8YDynFG3cm6vnrsEqq/oBCyCtEiy/Gd5qMxuPW8KmylRZs6Uu+Rg/hxWo16l
 CgW/ScX9LiXYybQgv/pLCBMiOq5lkJDctBrEiGHrEVcLhapWziwm0TZbQsMFILIb3Guk
 a2qpAoL86HitaEYg1y6I9F8Y6YS7a6DDHHR2+swORF0gDety4P++UjT5AIB4mwRjLKuE
 INCg==
X-Gm-Message-State: AOAM531ulKfeu8AMQEAKCjhJimen7+CC5irj6S21YrYUJFRrqnPfeU3i
 nsF0FQn6se366LdexjFoSCSAF28XFf0=
X-Google-Smtp-Source: ABdhPJwTs9Mjz6sKH7s7CUdCGNFTg5bOCL+qhW+FMejtoLrviECrAawNnHmn1jRzkp1PdiyigQ4byQ==
X-Received: by 2002:a2e:87c8:0:b0:255:6d59:ebce with SMTP id
 v8-20020a2e87c8000000b002556d59ebcemr815250ljj.455.1654075394977; 
 Wed, 01 Jun 2022 02:23:14 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b00478f60ca3a4sm257065lfd.56.2022.06.01.02.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:23:14 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/gma500: Make gma_i2c_chan a subclass of i2c_adapter
Date: Wed,  1 Jun 2022 11:23:05 +0200
Message-Id: <20220601092311.22648-3-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
References: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
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
Cc: tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it easier to get at the full gma_i2c_chan when having an
i2c_adapter from eg. drm_connector->ddc.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_crt.c     |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c    |  6 +++---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c    |  4 ++--
 drivers/gpu/drm/gma500/intel_i2c.c         | 14 +++++++-------
 drivers/gpu/drm/gma500/oaktrail_lvds.c     |  2 +-
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 12 ++++++------
 drivers/gpu/drm/gma500/psb_intel_drv.h     | 11 +++++++----
 drivers/gpu/drm/gma500/psb_intel_lvds.c    |  6 +++---
 8 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index 36c72a379d9f..be0d6a4591bf 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -203,7 +203,7 @@ static int cdv_intel_crt_get_modes(struct drm_connector *connector)
 {
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	return psb_intel_ddc_get_modes(connector,
-				       &gma_encoder->ddc_bus->adapter);
+				       &gma_encoder->ddc_bus->base);
 }
 
 static int cdv_intel_crt_set_property(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index e87272c9d358..bd6791522160 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -130,7 +130,7 @@ static enum drm_connector_status cdv_hdmi_detect(
 	struct edid *edid = NULL;
 	enum drm_connector_status status = connector_status_disconnected;
 
-	edid = drm_get_edid(connector, &gma_encoder->i2c_bus->adapter);
+	edid = drm_get_edid(connector, &gma_encoder->i2c_bus->base);
 
 	hdmi_priv->has_hdmi_sink = false;
 	hdmi_priv->has_hdmi_audio = false;
@@ -212,7 +212,7 @@ static int cdv_hdmi_get_modes(struct drm_connector *connector)
 	struct edid *edid = NULL;
 	int ret = 0;
 
-	edid = drm_get_edid(connector, &gma_encoder->i2c_bus->adapter);
+	edid = drm_get_edid(connector, &gma_encoder->i2c_bus->base);
 	if (edid) {
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
@@ -350,7 +350,7 @@ void cdv_hdmi_init(struct drm_device *dev,
 		goto failed_ddc;
 	}
 
-	hdmi_priv->hdmi_i2c_adapter = &(gma_encoder->i2c_bus->adapter);
+	hdmi_priv->hdmi_i2c_adapter = &gma_encoder->i2c_bus->base;
 	hdmi_priv->dev = dev;
 	return;
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 02dedf5dfa62..d76c3ecc951c 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -302,7 +302,7 @@ static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 	int ret;
 
-	ret = psb_intel_ddc_get_modes(connector, &gma_encoder->i2c_bus->adapter);
+	ret = psb_intel_ddc_get_modes(connector, &gma_encoder->i2c_bus->base);
 
 	if (ret)
 		return ret;
@@ -583,7 +583,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	 */
 	mutex_lock(&dev->mode_config.mutex);
 	psb_intel_ddc_get_modes(connector,
-				&gma_encoder->ddc_bus->adapter);
+				&gma_encoder->ddc_bus->base);
 	list_for_each_entry(scan, &connector->probed_modes, head) {
 		if (scan->type & DRM_MODE_TYPE_PREFERRED) {
 			mode_dev->panel_fixed_mode =
diff --git a/drivers/gpu/drm/gma500/intel_i2c.c b/drivers/gpu/drm/gma500/intel_i2c.c
index 6e9e2061ff3b..9d02a7b6d9a3 100644
--- a/drivers/gpu/drm/gma500/intel_i2c.c
+++ b/drivers/gpu/drm/gma500/intel_i2c.c
@@ -113,10 +113,10 @@ struct gma_i2c_chan *gma_i2c_create(struct drm_device *dev, const u32 reg,
 
 	chan->drm_dev = dev;
 	chan->reg = reg;
-	snprintf(chan->adapter.name, I2C_NAME_SIZE, "intel drm %s", name);
-	chan->adapter.owner = THIS_MODULE;
-	chan->adapter.algo_data = &chan->algo;
-	chan->adapter.dev.parent = dev->dev;
+	snprintf(chan->base.name, I2C_NAME_SIZE, "intel drm %s", name);
+	chan->base.owner = THIS_MODULE;
+	chan->base.algo_data = &chan->algo;
+	chan->base.dev.parent = dev->dev;
 	chan->algo.setsda = set_data;
 	chan->algo.setscl = set_clock;
 	chan->algo.getsda = get_data;
@@ -125,9 +125,9 @@ struct gma_i2c_chan *gma_i2c_create(struct drm_device *dev, const u32 reg,
 	chan->algo.timeout = usecs_to_jiffies(2200);
 	chan->algo.data = chan;
 
-	i2c_set_adapdata(&chan->adapter, chan);
+	i2c_set_adapdata(&chan->base, chan);
 
-	if (i2c_bit_add_bus(&chan->adapter))
+	if (i2c_bit_add_bus(&chan->base))
 		goto out_free;
 
 	/* JJJ:  raise SCL and SDA? */
@@ -153,6 +153,6 @@ void gma_i2c_destroy(struct gma_i2c_chan *chan)
 	if (!chan)
 		return;
 
-	i2c_del_adapter(&chan->adapter);
+	i2c_del_adapter(&chan->base);
 	kfree(chan);
 }
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 58b38e359098..8609f6249c4c 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -359,7 +359,7 @@ void oaktrail_lvds_init(struct drm_device *dev,
 	if (edid == NULL && dev_priv->lpc_gpio_base) {
 		oaktrail_lvds_i2c_init(encoder);
 		if (gma_encoder->ddc_bus != NULL) {
-			i2c_adap = &gma_encoder->ddc_bus->adapter;
+			i2c_adap = &gma_encoder->ddc_bus->base;
 			edid = drm_get_edid(connector, i2c_adap);
 		}
 	}
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
index 9a6de6ff8b0c..ee163fb972d9 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
@@ -142,10 +142,10 @@ void oaktrail_lvds_i2c_init(struct drm_encoder *encoder)
 
 	chan->drm_dev = dev;
 	chan->reg = dev_priv->lpc_gpio_base;
-	strncpy(chan->adapter.name, "gma500 LPC",  I2C_NAME_SIZE - 1);
-	chan->adapter.owner = THIS_MODULE;
-	chan->adapter.algo_data = &chan->algo;
-	chan->adapter.dev.parent = dev->dev;
+	strncpy(chan->base.name, "gma500 LPC",  I2C_NAME_SIZE - 1);
+	chan->base.owner = THIS_MODULE;
+	chan->base.algo_data = &chan->algo;
+	chan->base.dev.parent = dev->dev;
 	chan->algo.setsda = set_data;
 	chan->algo.setscl = set_clock;
 	chan->algo.getsda = get_data;
@@ -154,13 +154,13 @@ void oaktrail_lvds_i2c_init(struct drm_encoder *encoder)
 	chan->algo.timeout = usecs_to_jiffies(2200);
 	chan->algo.data = chan;
 
-	i2c_set_adapdata(&chan->adapter, chan);
+	i2c_set_adapdata(&chan->base, chan);
 
 	set_data(chan, 1);
 	set_clock(chan, 1);
 	udelay(50);
 
-	if (i2c_bit_add_bus(&chan->adapter)) {
+	if (i2c_bit_add_bus(&chan->base)) {
 		kfree(chan);
 		return;
 	}
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index 72585a3df25d..1c28288f36a0 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -79,12 +79,13 @@ struct psb_intel_mode_device {
 };
 
 struct gma_i2c_chan {
-	/* for getting at dev. private (mmio etc.) */
-	struct drm_device *drm_dev;
-	u32 reg;		/* GPIO reg */
-	struct i2c_adapter adapter;
+	struct i2c_adapter base;
 	struct i2c_algo_bit_data algo;
 	u8 slave_addr;
+
+	/* for getting at dev. private (mmio etc.) */
+	struct drm_device *drm_dev;
+	u32 reg; /* GPIO reg */
 };
 
 struct gma_encoder {
@@ -175,6 +176,8 @@ struct gma_crtc {
 		container_of(x, struct gma_encoder, base)
 #define to_psb_intel_framebuffer(x)	\
 		container_of(x, struct psb_intel_framebuffer, base)
+#define to_gma_i2c_chan(x)	\
+		container_of(x, struct gma_i2c_chan, base)
 
 struct gma_i2c_chan *gma_i2c_create(struct drm_device *dev, const u32 reg,
 				    const char *name);
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 07631891531a..c28fabdcfd73 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -113,7 +113,7 @@ static int psb_lvds_i2c_set_brightness(struct drm_device *dev,
 	out_buf[0] = dev_priv->lvds_bl->brightnesscmd;
 	out_buf[1] = (u8)blc_i2c_brightness;
 
-	if (i2c_transfer(&lvds_i2c_bus->adapter, msgs, 1) == 1) {
+	if (i2c_transfer(&lvds_i2c_bus->base, msgs, 1) == 1) {
 		dev_dbg(dev->dev, "I2C set brightness.(command, value) (%d, %d)\n",
 			dev_priv->lvds_bl->brightnesscmd,
 			blc_i2c_brightness);
@@ -497,7 +497,7 @@ static int psb_intel_lvds_get_modes(struct drm_connector *connector)
 	int ret = 0;
 
 	if (!IS_MRST(dev))
-		ret = psb_intel_ddc_get_modes(connector, &lvds_priv->i2c_bus->adapter);
+		ret = psb_intel_ddc_get_modes(connector, &lvds_priv->i2c_bus->base);
 
 	if (ret)
 		return ret;
@@ -727,7 +727,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	 * preferred mode is the right one.
 	 */
 	mutex_lock(&dev->mode_config.mutex);
-	psb_intel_ddc_get_modes(connector, &lvds_priv->ddc_bus->adapter);
+	psb_intel_ddc_get_modes(connector, &lvds_priv->ddc_bus->base);
 	list_for_each_entry(scan, &connector->probed_modes, head) {
 		if (scan->type & DRM_MODE_TYPE_PREFERRED) {
 			mode_dev->panel_fixed_mode =
-- 
2.36.1

