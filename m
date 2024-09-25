Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66C09863E7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAFD10EA47;
	Wed, 25 Sep 2024 15:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZsFMD/VF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D1F10EA47
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 15:43:01 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so392866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727278980; x=1727883780; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XWbh6GTwX/Nur9rLh4dOxd0uol8CDj0VjkbwHekxRn0=;
 b=ZsFMD/VFD07TGUEQDNgXKxsp4mD4DVj0oaLtCTsthN8odZQfy8MM0+vEQX5qhGpkq+
 t7YcavWiA8VfuSBpgppEcecJulYv7ihre/cnssZ7oHoLVFbqzpEPC5g7jsB+hmUgzI0H
 CuDeLe1jr/dF1NbAA/vfedsctlXYdR8EfxTkKcoCNEbTYlP0mi9azZUSslPgIBeoOb+J
 vTkasmAmkzo1A0jS+mUOBbDE7Rr8kwwzvraG2mPg/C4zrtsZbJLWP5JOQ16KOHIvjbtE
 OCth9VJ9gUcXCtlx4sPcaHmybi3Gp+i5iK/lAZ0RPyNKbHtWW9WFoGJYUM73dPvLxeAb
 jawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727278980; x=1727883780;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWbh6GTwX/Nur9rLh4dOxd0uol8CDj0VjkbwHekxRn0=;
 b=aOXgo/i35fOtdztjnrqE4n8Jyg3DA1a0saIcXHk3bRfgKp3nuXw3zMi90rg6X9fy9K
 0kRG7ssvuO5sW8kR9RbwcuFu7C2CLwVEVaCLiPwxV5JGO0MRcwG+Sp8y0iywocO++ozk
 4T3UuqRriL+knq+h3ISIsWg7JKcQU+P8BqzURyHsul+Fe9oPN17kdIDWZ72AaIXtkp7h
 EUwTJr1sqqDpQXwCX9xpK3zitzNr1NrKAbdXGqPWzZy5RS3M15kcoQgV2pYVUOgcu1vF
 4HZy4+Qg7ar3mcT52oVhBlX8VPZBMW/HZq5IARULatnjWivf3p/ZSa9i6UfOXmDIbMxl
 vYWA==
X-Gm-Message-State: AOJu0YwKyu+utHzJqZw9u4V0GxPM5yQ+WhzS6mCpKbTI96EAgZ8zsy1l
 Am2GpYcpXPBwQey5dfJQDPeso2hBuNaOmaU4kVAlDZl5oSgc06cH
X-Google-Smtp-Source: AGHT+IFOGCZlm7hxWZEDil/VHBukKjDMSy3xe8mZT1I0E9J+s+NIqup/Xj8x8pzeHvNlSTbRH1jJ6w==
X-Received: by 2002:a17:907:742:b0:a8b:6ee7:ba28 with SMTP id
 a640c23a62f3a-a93a0341396mr287138266b.1.1727278979968; 
 Wed, 25 Sep 2024 08:42:59 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 08:42:59 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:40 +0200
Subject: [PATCH 1/6] drm/bridge: dpc3433: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-1-e609d502401b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=841;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=7sxYHbFVUy82VPtxBTafFtyJ4V/px/ZO0hSTzcua6/s=;
 b=a1oRJ13BKg+sndE24RLHGwgqk3PJapTy3e06yyGNw7SE3ROWSvYabdohlrCbkn9bjP2TpGvpw
 SI97afI/Lq2DamjammUDr/YLmCMfIJxNhTzop91yyMyj7KjM74Q+KXg
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

`dlpc_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/bridge/ti-dlpc3433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 6b559e071301..a0a1b5dd794e 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -94,7 +94,7 @@ static const struct regmap_access_table dlpc_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(dlpc_volatile_ranges),
 };
 
-static struct regmap_config dlpc_regmap_config = {
+static const struct regmap_config dlpc_regmap_config = {
 	.reg_bits		= 8,
 	.val_bits		= 8,
 	.max_register		= WR_DSI_PORT_EN,

-- 
2.43.0

