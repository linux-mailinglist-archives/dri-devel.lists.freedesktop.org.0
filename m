Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99A7A0A9DB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 14:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0BE10E3B5;
	Sun, 12 Jan 2025 13:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lnYE9l1C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EA610E321
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 13:48:14 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5d3e5c225aaso703841a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 05:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736689633; x=1737294433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0DoP8JyX0Rn+t869X/69C5AdIYY282FJMkh2+vYUqvg=;
 b=lnYE9l1CMZ4FRhfmH5KzoTeM+/RfqJ8f4IUWTGkSWAp6OzEBzWCp4T2+s6DWxVfiPf
 E5i3HzFcEXGob1WcY8KJSqvPlBnT5cSgGGGOIPWTkcz+F0N7dkPZwv1AC8apoJerkzh1
 uZ8epByNpTl7GsVaYWaWP02Q6p4BH8MG6pKJM3u1EDRV+WlQjBKe44SA6KYq0GoOv1Wq
 /iklnQTVPjYia5kHEsii3AJf8erHC1nOtF35b/78xSgjNj/B8sCskGvNpVgssBsok4CA
 jkRHIoOS3FzdFMZLK5c1CSEEZCwD7L7yzY9n4sz8gZOrakLt9t90nm298RO4l5tLQcEG
 Pz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736689633; x=1737294433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DoP8JyX0Rn+t869X/69C5AdIYY282FJMkh2+vYUqvg=;
 b=mo51KV2p2u7TopaZ+XuHJTVYKwDsOdWvVWdvJGsRojsgWBHBZHs0GO6bgSPFJZB+xe
 daVI0nVlRNEy9CygdAo3VanKX+yHH4+BpOjc2CYy/Q128CTjGQl49VHKP1uaGPBdcOZ9
 5jX18xusMqsrl6RfA/0T8NbArLFeYCLGPxaHjoAyvPgBPgKpwOXtRMUoT+UM+vJ0QUdf
 V7qzm02CgitxF32wA48vdEgb6SY7WyIsXQ180yYE9ONzAj1bEWEjH83+VAkNV8dlTn79
 sJBDAhwkPFCd1WqUnaio67qYR0zdEJj4FAwUjaVp8hGcr6LkBgD/mu5S2ayAe37PPcl2
 ycaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA54MnaJsAAiQYf1oO/48yArzVuQEXEk1fZs83GxSpuJp5HZnZv8NWERxwIS+PorcFaS3necC2Zfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo6eWcCFWq2wVuwrOYvAC9D+sSD7jJx6fX1bOAfCGEK/jd3XZx
 yI5G86vEr4UvfepErPctORRUd8xVf7MOUvbQU2OsOpXbmvrD0Dfqg7nKcRy34/CqUSYLbuCbEAQ
 o
X-Gm-Gg: ASbGncvddMSKHRCyhFs9YxxWey6J4YtTOERkLXdnQH5dntQpymthKyGPy9a93HGzXDi
 rbdkLoBJzTnm25NLbpxFNpyEsqoI9dwBJwDvLt9Wc7j4O9tSc7+h0DLtKYfxYZVDKlenNQuI5qv
 bJ6v/eyt4P0M0/Ddm80BG8VQQZpa+zpFa6i7DXjgOezWbazqtgyVjv9sYGO4od+UpM3JJz6UgkK
 3mME7U2AGU/tOpL6v9esIq26umtYgzlkbmCcnqXcPnsz8RiELGQqI7dxQh3V5VTdIPClAA=
X-Google-Smtp-Source: AGHT+IEHAXrRzzhrt3gFm4JeAOOOtrjD1qbFZyqfcMZ+AbnWgJcTH3bD4AwNeCzDVpq7CMRHO0fkfA==
X-Received: by 2002:a17:907:8689:b0:a9a:2afc:e4ef with SMTP id
 a640c23a62f3a-ab2ab60355cmr584894566b.7.1736689633230; 
 Sun, 12 Jan 2025 05:47:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9060c00sm374899866b.41.2025.01.12.05.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:47:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
Date: Sun, 12 Jan 2025 14:47:08 +0100
Message-ID: <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
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

Use dev_err_probe() to make error code and deferred probe handling
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 4b0eb7dc25d8..22935fdc5afe 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1429,19 +1429,13 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clocks: %d\n", ret);
-
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np) {
-		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
-	}
+	if (!cec_np)
+		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
@@ -1492,10 +1486,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 
 	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
 	if (!i2c_np) {
-		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
-			remote);
+		ret = dev_err_probe(dev, -EINVAL, "Failed to find ddc-i2c-bus node in %pOF\n",
+				    remote);
 		of_node_put(remote);
-		ret = -EINVAL;
 		goto put_device;
 	}
 	of_node_put(remote);
@@ -1503,8 +1496,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
 	of_node_put(i2c_np);
 	if (!hdmi->ddc_adpt) {
-		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
-		ret = -EINVAL;
+		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
 		goto put_device;
 	}
 
-- 
2.43.0

