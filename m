Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F79863ED
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8661710EA51;
	Wed, 25 Sep 2024 15:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i+uwWy7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABE410E2EC
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 15:43:14 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so1143090666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727278992; x=1727883792; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Tq2TptZvyceBLBBx7LtBZE3h+E/rY5vjthtbIWopdq8=;
 b=i+uwWy7fw3zIanLdEr8bqQkd1JMPR8fgBr8hbTYHAfOPeyUJZj+T0BRF7EGbV6uats
 mO1OaIwTi+f6FX8+R6l08/6pTFDNMPzR2GJnC4Kh08f43mQXxiCYZsQ9MmBUPqZ+GsuX
 unT5KODlA1fwYFa5u6aST+Ws6LYTxxHUd4BFa2Jq6iRLNqGD1QbgUc3nqnTBWMPV04c3
 FfXsIUz8sMF3Tll/SFdcRms2goPhX3QyUeKbVYCYFogqbmF7+O0XjbCuNbpt/dPescp3
 MXHuzck6QVnMpL6K0JbZSaVqxuv6h9O2W1boN3jwljxiRDKY9ZHd+MoBntIxYggLg2tU
 9kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727278992; x=1727883792;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tq2TptZvyceBLBBx7LtBZE3h+E/rY5vjthtbIWopdq8=;
 b=s5EIaL1BXZdlH1G1+mybgNm9d6J0huwYoFjMCatudsO2BWaDWR0eZ2w8pVsK4l2t7c
 CI4pWEcVK6w1oSCBgPOY62OtIodlmaxjM7ugiblI2zxuEAcDL2djUcPcNbqL7hVuwGoH
 /JG/AKst1FQBp0lM0IWcyRvtt1K3XcTBlhivM6EYR3tDROjCHoLdG41ThushxnxMptJ0
 dLa5M0aKgFc47h7x8yGMjlKDa3oYYKxgQhozK1hBjR3tVcBCY5Qmyzsi2KCsBDLerFE+
 oBv0IkFLsspdWfxI7jhWMNgToCJZYcZUJvoOghbUVp784m2+9PMjW7Jaeby4WuqC8g9h
 qExw==
X-Gm-Message-State: AOJu0YwjK0hyxz0Tbr7QerFwa3L9pY29c8fQpfDKmBXEUEDAEC1pH2Pt
 ndUB8jtpYD/qufMzCKQtCWl1cS/cYjfwzuxMQAJAC7stFV6zGD1O
X-Google-Smtp-Source: AGHT+IHHc8HHdLYal7Pmze3ybNwhfKc28k6q1+c6BRN4mTyPbMmAiS5NmCbp8C1cZy+2fjcsw/yvLA==
X-Received: by 2002:a17:907:70b:b0:a8d:75ab:17aa with SMTP id
 a640c23a62f3a-a93a03c61cbmr314978966b.37.1727278992373; 
 Wed, 25 Sep 2024 08:43:12 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 08:43:11 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:44 +0200
Subject: [PATCH 5/6] drm/panel: ili9322: Constify struct regmap_bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-5-e609d502401b@gmail.com>
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=929;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=w4RqhIFVBN4KBuZwGM8vHSEfTfAmOJ8kTf3Rh0OtbcY=;
 b=pFLApbC3MB4uKW0ZEVlNXM9AhpNeBXEs3My6pYnOwU646q8xtnwHyVxasmviBPw02fUL94CWi
 xgK5yWm/k67BakTjtq6lgKkPmmAhABqOvLOLqnuQGNEghVM3/8W6sHR
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

`ili9322_regmap_bus` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 4a6dcfd781e8..94b7dfef3b5e 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -318,7 +318,7 @@ static int ili9322_regmap_spi_read(void *context, const void *reg,
 	return spi_write_then_read(spi, buf, 1, val, 1);
 }
 
-static struct regmap_bus ili9322_regmap_bus = {
+static const struct regmap_bus ili9322_regmap_bus = {
 	.write = ili9322_regmap_spi_write,
 	.read = ili9322_regmap_spi_read,
 	.reg_format_endian_default = REGMAP_ENDIAN_BIG,

-- 
2.43.0

