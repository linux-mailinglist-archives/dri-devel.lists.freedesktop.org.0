Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB702C63080
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EB510E310;
	Mon, 17 Nov 2025 09:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wgk7UG6Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62F410E30B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:04:23 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-37a4e329a90so31086651fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 01:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763370262; x=1763975062; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qjFvsbFPyFbyPgm+bw1kDJa74CcXAQQRLv+LVg1qWAo=;
 b=Wgk7UG6QoqZvi6Su9Oe0yqbMCNW1UtiSE6pLwZnaIZQJYk0T93AQFLcDFoB35fDa13
 NOIN09xU0lSYOcJ2uKjKWaQ01M/qebwkbn8OIesz5njBJeuMi8wrex3GTv2zsLVDEyP+
 m14g2VYnZPYD2ViUYGIJ4dupVgMzVsebL1y9zb84Xuyo1xpCKkITovAL9TXVDWuNkNGy
 fNpaLKDl5SvxG+oGF/fW5UK5LPNv7YOGTeJyY7oyRpmNUtKglXdrucy8o6F6BEBCHbR9
 c3w7/4z0ImoAWWPzLVsbPC1fu5l8oPRDhie8Al4BLbyryy4bQKgypWit3y5uHO2y6Bj9
 wYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763370262; x=1763975062;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qjFvsbFPyFbyPgm+bw1kDJa74CcXAQQRLv+LVg1qWAo=;
 b=aR2VsmH40/kCQdQu83RBUPY2Y9/AN66BbrndbJKTHXPmcsv4x7dbeqA4WfFsYKj1hk
 2Ny7hOLqoHZ99HilLVqRPoPs86v4uAwUVrbh5H3WA/4wU9eAsUS7BHWXU4bH/EFxsJ9Q
 Xfbb3yv3fkDeMSmUEzXDHLUfYP2eOaQWcfDtQSO3pfGigQjoiKuARk+Uwp/zaFgq7CXt
 nY5EbPyf+igMhms6ZRy+SOXbHt9wP4U8QfR0+6DNP3Te+BDHk00ImYdCPhUWe8kRe8xM
 tHYJIjd26Si5S0JRODMY01B/9mv8/MY0OZoxncMq4fDPLYRzDsFa9pVrWuhgXtiCwSsZ
 PA8g==
X-Gm-Message-State: AOJu0Ywsb4OkbP8nKYmYxrTTmOk1aVZggvXvGQE3gUkJmkwUjZMt9HhU
 bspORS3GfK8UQNTYeFgJsQ79Lz4z0kIJkfTCvwT635MalB+fAdzbBEaF
X-Gm-Gg: ASbGncvuEZHhF2TtxPF7KleYlm8doHIvttqLOGtblo7ceLFqJMi5cfZiyHxAPXTSc9D
 eBAUGkKhdq6nKyodohUTQRHZ1tyBWX2px3wGrAYV/hc/jc4Gfe4ebSKSeeoXUokbJtEC3dzBBFu
 Z8kAovR/Utja38le59q2/g4xW/8sdl/agVHe+2VDZ7NHrV/+yt/wr/JGt2Tzcfua17Xe0cR9Vcc
 NaXJ97lKrEgcJ3K+tsLt7yn4DGxoLrvzyumXJUStiCq9h4vo44XgdtHyvi8cOH8LXyFR5F0Hicu
 pHd4i22EGNtYZXOeyaIghDUdAsWVFsfZC5g0AEf4FNRE/H9TOiOqZnwOzDq2hfm/BkhvKZlLapB
 /nYkuHgMt82tBKURDyL3W0VtQsIj5Q7vwGsDhfh1eUm6aSR8y2LH+55Oy3Wm+hAkU6s5N0Zb7fB
 ZM5VPzjD1uyk5D9ZFYkWhOB91US52L/CUQJ3odYINdyGEwtNbPX78EPpC9
X-Google-Smtp-Source: AGHT+IEc1+Wzn8iDtJyi139bcvAwyCv3NlECHhkgxUDEIaUok8sSJJX5SnGL/8lmpJwV0yXlr7kWZQ==
X-Received: by 2002:a2e:781a:0:b0:37a:47a4:d5cc with SMTP id
 38308e7fff4ca-37babbedb40mr26961621fa.36.1763370261853; 
 Mon, 17 Nov 2025 01:04:21 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b77e5sm2982498e87.42.2025.11.17.01.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 01:04:21 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:03:44 +0100
Subject: [PATCH RESEND v2 2/6] drm/sitronix/st7571-i2c: add 'struct device'
 to st7571_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-st7571-split-v2-2-13189da95265@gmail.com>
References: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
In-Reply-To: <20251117-st7571-split-v2-0-13189da95265@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4428;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=NSG4vmX1Rk5OzSdVkKZf/U2bncKPRRHJC4jH6QsSl/w=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuT6zMXa+2W4BK6Lf7Yd6Boq3M2uqDbnEqpAT
 enxgYUGENqJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrk+gAKCRCIgE5vWV1S
 Mr2KD/46ZbwdwMJIZV6HDIcDxtJK7CRJ7fGjSj3YqqKzSW7xZEhvd6iMYLMqtk7l7vw6BFoOWYr
 /y2Y2N1r7oa0mpZhkADfb5WU8z8BFlNKiFnrTdLNxk8C7bajJMf4Or8JmjeU60m04J+ANQhxLKt
 rL4YUcWaXECJpxWa9rVu7kbWJ6yOYlPxct5nF1qLQpyXvWzFPTudddFCTr3EWRa8cM2HNDvPwg6
 R7YcjsaqLXxV8JilkAhIawPyC/nWNVS12h85gU8AkDjQ6g0+xfa2vPmJHH1vU9PdV1/Kod7S635
 cjJZ8WXBsifpX4ptvNn1Y0BDndy/9P5RtDn6qbPTYsOz8Pj1/uxtCMNC3jTWrQCWn06/xsqs9Br
 UcjX+WjYLxiboaI8GFDCCRchIIGFjjAURwzc5tvGfyUO7wFUSqqH3XUiSg+XGI7uz4j31ypjUlB
 5yk93K/EEbFBeVcAUFSzQNbbnMyZg5np0bWcb7FBc2NtI0vslRxW5AepmhBQDZPDxGaJALB1VPY
 2bdN1de/mEsb9XgAtmWc5qqZagBgmTYgtJoEUoxW3Rlf75p0H3tsqJAVNdSzfNCnp8vrpT2lnzV
 8pQ/7meOYDY0kq0bS7WfeD8zioIrLJCf3umaDmrqscihLzwpzbNP4+y5S50F6seVGj18kSrZ/tK
 Ef4xBVEplDeALmA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Keep a copy of the device structure instead of referring to i2c_client.
This is a preparation step to separate the generic part from all i2c
stuff.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 71814a3eb93b..2b52919d7dd4 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -113,6 +113,7 @@ struct st7571_panel_format {
 
 struct st7571_device {
 	struct drm_device drm;
+	struct device *dev;
 
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
@@ -741,7 +742,7 @@ static const struct regmap_config st7571_regmap_config = {
 
 static int st7571_validate_parameters(struct st7571_device *st7571)
 {
-	struct device *dev = st7571->dev.dev;
+	struct device *dev = st7571->dev;
 	const struct st7571_panel_constraints *constraints = &st7571->pdata->constraints;
 
 	if (st7571->width_mm  == 0) {
@@ -781,7 +782,7 @@ static int st7571_validate_parameters(struct st7571_device *st7571)
 
 static int st7567_parse_dt(struct st7571_device *st7567)
 {
-	struct device *dev = &st7567->client->dev;
+	struct device *dev = st7567->dev;
 	struct device_node *np = dev->of_node;
 	struct display_timing dt;
 	int ret;
@@ -808,7 +809,7 @@ static int st7567_parse_dt(struct st7571_device *st7567)
 
 static int st7571_parse_dt(struct st7571_device *st7571)
 {
-	struct device *dev = &st7571->client->dev;
+	struct device *dev = st7571->dev;
 	struct device_node *np = dev->of_node;
 	struct display_timing dt;
 	int ret;
@@ -943,9 +944,10 @@ static int st7571_probe(struct i2c_client *client)
 		return PTR_ERR(st7571);
 
 	drm = &st7571->drm;
+	st7571->dev = &client->dev;
 	st7571->client = client;
 	i2c_set_clientdata(client, st7571);
-	st7571->pdata = device_get_match_data(&client->dev);
+	st7571->pdata = device_get_match_data(st7571->dev);
 
 	ret = st7571->pdata->parse_dt(st7571);
 	if (ret)
@@ -966,20 +968,20 @@ static int st7571_probe(struct i2c_client *client)
 	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
 		st7571->ignore_nak = true;
 
-	st7571->regmap = devm_regmap_init(&client->dev, &st7571_regmap_bus,
+	st7571->regmap = devm_regmap_init(st7571->dev, &st7571_regmap_bus,
 					  client, &st7571_regmap_config);
 	if (IS_ERR(st7571->regmap)) {
-		return dev_err_probe(&client->dev, PTR_ERR(st7571->regmap),
+		return dev_err_probe(st7571->dev, PTR_ERR(st7571->regmap),
 				     "Failed to initialize regmap\n");
 	}
 
-	st7571->hwbuf = devm_kzalloc(&client->dev,
+	st7571->hwbuf = devm_kzalloc(st7571->dev,
 				     (st7571->nlines * st7571->ncols * st7571->bpp) / 8,
 				     GFP_KERNEL);
 	if (!st7571->hwbuf)
 		return -ENOMEM;
 
-	st7571->row = devm_kzalloc(&client->dev,
+	st7571->row = devm_kzalloc(st7571->dev,
 				   (st7571->ncols * st7571->bpp),
 				   GFP_KERNEL);
 	if (!st7571->row)
@@ -987,34 +989,34 @@ static int st7571_probe(struct i2c_client *client)
 
 	ret = st7571_mode_config_init(st7571);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize mode config\n");
 
 	ret = st7571_plane_init(st7571, st7571->pformat);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize primary plane\n");
 
 	ret = st7571_crtc_init(st7571);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize CRTC\n");
 
 	ret = st7571_encoder_init(st7571);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize encoder\n");
 
 	ret = st7571_connector_init(st7571);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize connector\n");
 
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to register DRM device\n");
 
 	drm_client_setup(drm, NULL);

-- 
2.51.2

