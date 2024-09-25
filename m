Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C09863E9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674DB10EA4E;
	Wed, 25 Sep 2024 15:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aqa/9ssF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA79D10EA3C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 15:43:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5c42384c517so8372924a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727278983; x=1727883783; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3dpOZ/ioTVT/5il6ou2oxhriDCIeCxURBP+dRZuK6nM=;
 b=aqa/9ssFZ0/haprlbi0RfgzyLU/qKZGG5PNenujqzjA9Pib1CmjRZFcvKWuWkjyngv
 DFA4cq8+GwgIfK2emrTOKPVuB5x6TYIQQJ7AnUux5RuNpjR63xKh2SxmtueGD4+3msyF
 sVqOZ1kfrZP56cH/Oskxx+mDH+96kb02aarVcsUMD6pFgMq2Y4SAwjOpCTr/IE2i+kdC
 mWVAm69QqUJxoQxBjfiYNbkzjddhm1McH/VzsCXmq8UqZ5bONOe3qbk3ufbeywfcMgII
 kOFG8D6UBX6Yf2hcFI1QD4MgwKWY15a49Ry03RplwvwwNKHGWw95lNBxGW0P402kcxF7
 hXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727278983; x=1727883783;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3dpOZ/ioTVT/5il6ou2oxhriDCIeCxURBP+dRZuK6nM=;
 b=npPHwLyVbt9Lg5eJY0ncHd8J8Bq2SCt9urY5eMihY8CUp/0fkf2fOwuJzlajXLe2eo
 N4qAQHTboy2VXjZKTKFvCndC6Bm3L77hWYFvp2SI+ynXTjz7kOrWNLEkYk+ILjvc2iP6
 ypzcHEBXoueEUgm9C5LAyZS5AZSXgCQy9cnSnoRrl8V1z7TPYZGi6HsGjxn1gNGjsvdr
 MXk6hUq3v8NBF+BWlaGOzD5BTLmHkNh//OGa+QYPIz9XEECcVwjyJMW5N4LDcm1SGh9d
 QI5sTkv82xImNdzzD+0WlGvlYYWpADSWNODtBg/reVxrKD2qvM2WY65zbXs1PJJMJr5f
 Dbfg==
X-Gm-Message-State: AOJu0YzMrToc8vSsG8fP55QmpnfgjCx7zqZbIUslCTbubTm6meToXokC
 kNnbE/Kw7cY/wV7IyAcO3EmhxlidFM9Lfa/RMiEsqGadorxVf0zL
X-Google-Smtp-Source: AGHT+IGKuNv7lE0u67hJ2OAhIVHl0bYdcTWRyaXR7IlGUKMo0Hm1JsihuqtBmJ8apswZAkFgkwRFnw==
X-Received: by 2002:a17:907:1ca1:b0:a8c:78a5:8fc4 with SMTP id
 a640c23a62f3a-a93a036a36bmr248782566b.19.1727278982930; 
 Wed, 25 Sep 2024 08:43:02 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 08:43:02 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:41 +0200
Subject: [PATCH 2/6] drm/fsl-dcu: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-2-e609d502401b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=797;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=j5IVdz0beAjnl/rD8q67jV1CX8MClFwEzj++cGsQuD0=;
 b=4dMgS2dx5TyC8IP1MnInm+QJtBRuPpVnV4hoTf094WArm4pWhlF0Mhj9oO7SjZ12DXIAB3adY
 5WH2uozmSnrD87oiirTQsU5nwiuxGKcfiISjPQfFww1GYXuUT2164v3
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

`fsl_tcon_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
index 9eb5abaf7d66..49bbd00c77ae 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
@@ -29,7 +29,7 @@ void fsl_tcon_bypass_enable(struct fsl_tcon *tcon)
 			   FSL_TCON_CTRL1_TCON_BYPASS);
 }
 
-static struct regmap_config fsl_tcon_regmap_config = {
+static const struct regmap_config fsl_tcon_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,

-- 
2.43.0

