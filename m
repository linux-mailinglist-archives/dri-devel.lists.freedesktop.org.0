Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4901BA312F5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 18:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7110E72D;
	Tue, 11 Feb 2025 17:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YwsHNAOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AE710E72F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 17:28:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38dd14c9a66so1642073f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 09:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294912; x=1739899712;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2biH2pTKEoyD3yCVVt7sf7r+6yC9eORZimpeabOUGQ=;
 b=YwsHNAOOh8I5aImoJDQi40ogXVSI5LboVEkrXKahJTpVcjhe03enIZj7Zb8/GVDnpg
 Ywvungbba+Pck/+udy3RBfzA9XdfeliuVFwK63lHFG9inup2NvX8R0Z5r2OSs3al6TPw
 3Jy0t81VVoG6nkXHnififFoisQZxa45A/vYUIoncb3fGgUIdZoGdOOS64iqFhnC6KcMa
 IYydzmL6hQsrP0FQastvL0s0wpRy2QqwlGIx4eX7NCagPbq2s2R3oye7kj5PU2FPWRcL
 OUs6Yy6fmSy0bANOO1DXz3v6hqs2D+D4FL7zWCvmkp+HgPBGJ2ayXIcIYBStGSCqYbz1
 uzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739294912; x=1739899712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2biH2pTKEoyD3yCVVt7sf7r+6yC9eORZimpeabOUGQ=;
 b=WRWDNNEpCnEHn/UfKOEnnxL481HL4KXxKnYsNkNCgHDJxW5yWUBJs/AvqI9sMc3pQI
 pGnfJ3S2Cb/GrIATPoj4Vqs0yCWYWp6YW3Cz8qv0OZoRGaVG9K1ILXDxaWRfxJ5fVHpC
 Ak3Gbf+kBgyodfUKmbXL6t106Qx8xFtsYD2yNic5JjDAaB3L3ZPGEfny40vxG1Gdy66z
 a1v8F9K+Lzej9K7CAkdUr1pqFLby/wBUu7Wzr5/5lOlM3ihQFQWtLi7PRDL5Y/6TK96a
 d6+aJ5QbsgbDONEmNm0o2vPNxaD1BGQzGr1h1+zzjEIB9VydI1svj5uTc8WumBnHIkiZ
 PtTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgAGtCWUMll3b3DM8+GjTKQ5xZ96vE+E2xpZtjm7eY67sVkATYYkOJGLPnrbFQdgmliOHsAm9wK8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzJA8QhGw4LtyLbyXVXZGr/zqXVC8kUxfQyFtUU8Qx8N29KxEA
 qf3FN3QL08fsF6kuhHYTPHyzvhHxrmet/i7HL9zD4m2SQPzEEyrIM7GR0nkxuUo=
X-Gm-Gg: ASbGnctxG+OjlNV3uPxiSKi9K0gKUWj8CPYpMwQ97AxDK8pmDHTBUC3biU9SzjvoOZB
 5L4GHxVKeAOICYR/CpXYMmOnh/iRvIGHv9NxxINftMir8FYf2HWvZOoqSpxhhvejM2vcC7xQbM0
 Lzmmb7mClW0re6+GirMMb+xqCRukXoR0GFzp7qoKKDCXZpIXgDz3BJBH+vwV5es3aAVdT9zTZYV
 5uoL6QqJo+Ei+oywmaj9KGCvqTWhErRAlXtFpiXk/KBoG1EvhOf6B3bbLj52Szs8oo+971GlyDO
 2JhwL2CjmfvqFjt9hQ==
X-Google-Smtp-Source: AGHT+IE/lWpaI6pWVO8Sv+YQSGH06MG0caNle2AbW37wTjANlrKJ9s7lqNySg7B+IZ8uIOLB+l1Tjw==
X-Received: by 2002:a5d:47aa:0:b0:38d:d69e:1314 with SMTP id
 ffacd0b85a97d-38dd69e1ba1mr9007347f8f.9.1739294912415; 
 Tue, 11 Feb 2025 09:28:32 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 09:28:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device
 creation helper
Date: Tue, 11 Feb 2025 18:28:00 +0100
Message-ID: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4038; i=jbrunet@baylibre.com; 
 h=from:subject:message-id;
 bh=4I/YUW3hUfV7LW4vqIimfK2wLippJhEosTDRns8e2Tk=; 
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g3KBrsjz/YbGJrLq2rlkWwu0SsOmQVpTCXu
 VtviTS8naaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINwAKCRDm/A8cN/La
 hV5wD/9CJGF/RCRwHbIbJXrKSWU73Zd91U9+X8P+nRRrN2lbOiILtbHRZF2AXs7l2tOiLDUVf4G
 hypCmzHSVFVgMR06Q7kXrEbTRx0O2Ul1Q07H0IFD4k0xt58ug/V7ezrJ8lMEcM/FcwImcVkoYJ8
 lwmjvrONgcgoZBExdOnJlv1UD+Dddr4Wi+sWDLmDALlFjbDYuQrfZjHc4L2zc9ve8rHjnU0pC6f
 YMm6EjEhHMcFgsbKge/+kkfDcTqsuk4jfLytI2sF2jHT2cwesgQfceYXMsqKePtNCuHTv8Tpp1b
 5nWhj/l8S+yLfIAiVNy2nxba00yx5R4v4NoCPZCX05JCtquBC2WB4CNUzhQYHyHMMQ+ePGN7JKm
 NVtRFVPUx9oJOjGRhqWRi88hiSwNg4QPj+OFtWuOs7D51J/yTJdD5XMgYgADimBsSrLGtGB/1r/
 IorMXfmpkm0xw+RREwA4WKwLMT/KLgfShgDVdmOk4Kbnh4GrUvX/Rspym/xjVfg9es+PgegGjWK
 rCix4SNzCGiSAgOwWvJGJDOCAjzpvnzAHYXnvgCoFs75RSMC9B2KvyOk+IQ1l+9g5tLRkthUfJX
 P2X8n0M0gtdsistRrOtkv7GakcFOKAF6ZmIzmj/mW2xQRBXpnMf+sa95bdok5/LFdpbKMw5knAN
 dqVQqlnz7A0W1ig==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++--------------------------
 1 file changed, 20 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e4d9006b59f1b975cf63e26b221e985206caf867..e583b8ba1fd4f27d98e03d4382e0417bbd50436f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -454,62 +454,6 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
-/* -----------------------------------------------------------------------------
- * Auxiliary Devices (*not* AUX)
- */
-
-static void ti_sn65dsi86_uninit_aux(void *data)
-{
-	auxiliary_device_uninit(data);
-}
-
-static void ti_sn65dsi86_delete_aux(void *data)
-{
-	auxiliary_device_delete(data);
-}
-
-static void ti_sn65dsi86_aux_device_release(struct device *dev)
-{
-	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
-
-	kfree(aux);
-}
-
-static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
-				       struct auxiliary_device **aux_out,
-				       const char *name)
-{
-	struct device *dev = pdata->dev;
-	struct auxiliary_device *aux;
-	int ret;
-
-	aux = kzalloc(sizeof(*aux), GFP_KERNEL);
-	if (!aux)
-		return -ENOMEM;
-
-	aux->name = name;
-	aux->dev.parent = dev;
-	aux->dev.release = ti_sn65dsi86_aux_device_release;
-	device_set_of_node_from_dev(&aux->dev, dev);
-	ret = auxiliary_device_init(aux);
-	if (ret) {
-		kfree(aux);
-		return ret;
-	}
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(aux);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
-	if (!ret)
-		*aux_out = aux;
-
-	return ret;
-}
-
 /* -----------------------------------------------------------------------------
  * AUX Adapter
  */
@@ -671,7 +615,12 @@ static int ti_sn_aux_probe(struct auxiliary_device *adev,
 	 * The eDP to MIPI bridge parts don't work until the AUX channel is
 	 * setup so we don't add it in the main driver probe, we add it now.
 	 */
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+	pdata->bridge_aux = devm_auxiliary_device_create(pdata->dev, "bridge",
+							 NULL, 0);
+	if (IS_ERR(pdata->bridge_aux))
+		return PTR_ERR(pdata->bridge_aux);
+
+	return 0;
 }
 
 static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
@@ -1950,15 +1899,17 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	 */
 
 	if (IS_ENABLED(CONFIG_OF_GPIO)) {
-		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->gpio_aux, "gpio");
-		if (ret)
-			return ret;
+		pdata->gpio_aux = devm_auxiliary_device_create(pdata->dev, "gpio",
+							       NULL, 0);
+		if (IS_ERR(pdata->gpio_aux))
+			return PTR_ERR(pdata->gpio_aux);
 	}
 
 	if (IS_ENABLED(CONFIG_PWM)) {
-		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->pwm_aux, "pwm");
-		if (ret)
-			return ret;
+		pdata->pwm_aux = devm_auxiliary_device_create(pdata->dev, "pwm",
+							      NULL, 0);
+		if (IS_ERR(pdata->pwm_aux))
+			return PTR_ERR(pdata->pwm_aux);
 	}
 
 	/*
@@ -1967,7 +1918,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	 * AUX channel is there and this is a very simple solution to the
 	 * dependency problem.
 	 */
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
+	pdata->aux_aux = devm_auxiliary_device_create(pdata->dev, "aux",
+						      NULL, 0);
+	if (IS_ERR(pdata->aux_aux))
+		return PTR_ERR(pdata->aux_aux);
+
+	return 0;
 }
 
 static const struct i2c_device_id ti_sn65dsi86_id[] = {

-- 
2.45.2

