Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624A0CCF723
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4BF10EF1E;
	Fri, 19 Dec 2025 10:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PR3uS0jA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB0A10EF1E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:47:03 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-64b4b35c812so2084125a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766141222; x=1766746022; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rZuP9fxqbC47wIOaRN1HrOQmWsV0+mnLZdGYsf33OB0=;
 b=PR3uS0jAYFcyT7cKqj6AfU4lBzAis7TpndYWMzX2I+IfOCccjUgpzlEzYwL0rQB6K1
 m9TVix8PFPvPLgTz7obsolVAcJR24xhmvUMewh5rbINGSWxJMyHEcrAk3spEDlr9O7dy
 CcMNNVHxvBsfscF2HdUG7dcFXQWugTZC2szMqHI2vce6BeutmbikR+wHaREaGzaTKnfQ
 ARdC2FQaa+uu770k7JhQh5ClMXLA/U/ujms6/edFRKG7nL5Xr/SIEhn6DsmlGgk8vp7E
 0/kyrQZeam3n29djDKA7gRVyYXe2uViiw9DOOjxCo1GMl7LtwzXWYX1cW90T76HrMzHs
 9+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766141222; x=1766746022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZuP9fxqbC47wIOaRN1HrOQmWsV0+mnLZdGYsf33OB0=;
 b=F2f2OT8nawJwYmPk+9h7jocFUdPlwoXpgKXOlicsvTNAan187TeSbVYi/fWAMR4chp
 cIN+h2kxH+TZj9r7yvIb9RfFYwGzOFE16cves3cv2bNYBtdoohBNFjMiDoZ/hvxJuLHa
 q7xwPR/YH9QWcsJDPRaHK71yAdpPg0GhacDEIJrjBzr+gYt9onOFanYHgGV355K8S5Fo
 HbdALdDvZhGoNWCNcIBn5Tf6JRXtIMX5oTyIzGiKwCm65UykE6Yq9m+EH+UF5Na0DUkF
 Bp9qln1uKgV5UvcCasMhcHS2b85oYF036/MXNYNdo7jm2vH6oe5BSQ+lFRRmXJgx4osM
 9oOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWLUr7dy4QGFso+8FgrtputYrGPm9OVPuw0Mk75fAdSnJFwGapbCqJlU4U3gHlyA1PDh8ihB6mP8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr88/NqkmfbYcUK6yXa1VU4T7HzNX5i5r1miSa30KSRWDOvwnQ
 dwDZVLhtH8R80hyFQrThIZzUTYpU7h8P5pgkjKv1VrUnQuJRbFG936TC
X-Gm-Gg: AY/fxX52eNOEVT9C2qsSLwO3fehOghYNyr3d6lQsGEjJHnST29taXSsvKv2Qmc4MqjB
 jwqcrhh1a1sLiDwIdVlIlxZUYXv/ZuCAkovRuQDwg35gLikMeCzlba9KZth1LC+RDs80KrPSKz7
 qW4TB248qP2LQx8KoMTm20sy5XC9WdUFyCoE/0ee9L6fYJzcIEDH3hY6kTORKbANUB3Z4uzPX2J
 CrgrlbAkUh31d/ecs0SszqI03XCBC+w9S2FNBPo9varR+3TGHxZWwsrcCuTmG1JVec2gE/iUQFD
 JBakQrzTUQTHeC9TxGv7XOOXH5rr/1JOtDLWStM47DA9Co5S4hqw903T8LZCYxzH82SKLyryN/D
 gk2149Quaf4APL+YFDFFjNaUQtmmCEBNR5NnVv5XMiqsWMk3/WSpfcZ7FAmXI5jpZli7Pfj7Nk9
 Q+RhkCbOTfRrcBurl9qVW7eRx4qE0X0qToF0IM2z4fRqDQ
X-Google-Smtp-Source: AGHT+IHwuwvzqHzv3YMY8ZAQIYTi19GvZ1+m5b+3UDEb7/afa4beA//voJQ0rhzXT+DjKoSFreo3oQ==
X-Received: by 2002:a05:6402:34c5:b0:649:230e:ec52 with SMTP id
 4fb4d7f45d1cf-64b8e935a65mr1838951a12.1.1766141222122; 
 Fri, 19 Dec 2025 02:47:02 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bb1:f7ee:1376:35e4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b910601c7sm1900781a12.14.2025.12.19.02.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 02:47:01 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Douglas Anderson <dianders@chromium.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on device
 during resume()
Date: Fri, 19 Dec 2025 10:46:53 +0000
Message-ID: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G3E SMARC EVK using PSCI, s2ram powers down the SoC. Testing ADV7535
IRQ configured as edge-triggered interrupt on RZ/G3E SMARC EVK shows that
it is missing HPD IRQ during system resume, as the status change occurs
before the IRQ/pincontrol resume. Once the status bit is set, there won't
be any further IRQ unless the status bit is cleared.

Clear any pending HPD IRQs before powering on the ADV7535 device to
deliver HPD interrupts after resume().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 32 ++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 8be7266fd4f4..03aa23836ca4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -393,6 +393,7 @@ struct adv7511 {
 	bool cec_enabled_adap;
 	struct clk *cec_clk;
 	u32 cec_clk_freq;
+	bool suspended;
 };
 
 static inline struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b9be86541307..8d9467187d7c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -790,6 +790,25 @@ static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 
+	if (adv->i2c_main->irq && adv->suspended) {
+		unsigned int irq;
+
+		/*
+		 * If ADV7511 IRQ is configured as edge triggered interrupt, it
+		 * will miss the IRQ during system resume as the status change
+		 * occurs before IRQ/pincontrol resume. Once the status bit is
+		 * set there won't be any further IRQ unless the status bit is
+		 * cleared. So, clear the IRQ status bit for further delivery
+		 * of HPD IRQ.
+		 */
+		regmap_read(adv->regmap, ADV7511_REG_INT(0), &irq);
+		if (irq & ADV7511_INT0_HPD)
+			regmap_write(adv->regmap, ADV7511_REG_INT(0),
+				     ADV7511_INT0_HPD);
+
+		adv->suspended = false;
+	}
+
 	adv7511_power_on(adv);
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
@@ -1407,6 +1426,16 @@ static void adv7511_remove(struct i2c_client *i2c)
 	i2c_unregister_device(adv7511->i2c_edid);
 }
 
+static int adv7511_suspend(struct device *dev)
+{
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
+
+	adv7511->suspended = true;
+
+	return 0;
+}
+
 static const struct adv7511_chip_info adv7511_chip_info = {
 	.type = ADV7511,
 	.name = "ADV7511",
@@ -1439,6 +1468,8 @@ static const struct adv7511_chip_info adv7535_chip_info = {
 	.hpd_override_enable = true,
 };
 
+static DEFINE_SIMPLE_DEV_PM_OPS(adv7511_pm_ops, adv7511_suspend, NULL);
+
 static const struct i2c_device_id adv7511_i2c_ids[] = {
 	{ "adv7511", (kernel_ulong_t)&adv7511_chip_info },
 	{ "adv7511w", (kernel_ulong_t)&adv7511_chip_info },
@@ -1467,6 +1498,7 @@ static struct i2c_driver adv7511_driver = {
 	.driver = {
 		.name = "adv7511",
 		.of_match_table = adv7511_of_ids,
+		.pm = pm_sleep_ptr(&adv7511_pm_ops),
 	},
 	.id_table = adv7511_i2c_ids,
 	.probe = adv7511_probe,
-- 
2.43.0

