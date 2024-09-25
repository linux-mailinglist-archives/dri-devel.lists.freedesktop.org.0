Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EF9863EC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7148410E2EC;
	Wed, 25 Sep 2024 15:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AaagbJO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF4210EA68
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 15:43:11 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so141166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727278989; x=1727883789; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xjGKEXG/YIg5uwQvEVpB+Au2CtHAgTgzoyA92gxhP0w=;
 b=AaagbJO4npWZWA+Rt5blZdTjhrL+bSaYmtPnLzDs2pGgCY5lAYH1DWr4YRDe1pBwgm
 wbncC7RNL+vV+oliNzLfdo8TrgN1ZPlS8ARsmZfZ0nLp6uwuooGP/1RselSELUX613SN
 ub1uvjnZjPKDFaS8l8IfF0s1CUfPE8b05VscGVh0gflpVuxybcxVFgjXXPGJyviKrwEv
 86CxjkM1C1B9MGL3oyO76xRP641SNx3q33gu6wQOmufAZM5+fi/XzRFl49fqzJ87FD9R
 KLlyFe7vvIh3HfMoVGRaO3fO0I67RXsMTyQxaJPyQYVPKRiRuJv1BuHNghZLsLwKyNzb
 9N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727278989; x=1727883789;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xjGKEXG/YIg5uwQvEVpB+Au2CtHAgTgzoyA92gxhP0w=;
 b=f178PMngJe91F1hGOkTBEM+Y8QrTww4u54aO5jxjHki6S6qrn3ZK0NcGKS4ieNCwTQ
 Wbc5QnGH7eWQ5KvefP5NUbRB4b1OBJGR32cfPeWB+SvbDdsvzuVOLEBxcGpYtEPpfZyu
 MpP1To+c39Q3DqZi5gS+svMiUlSmIWejDVK0RREu6LUoZuq40wXeEXH8ooelR/xcZnJT
 0YdBObfNwYVAdjolkrv72zkKKj+0qPhEa6jiGNTBCBXLDdH52WtH7zhMlfO56hS+eKRv
 7/s3L12kuES6TCJOUmfFhORyMtmH8+KUantjEzqETzVk5L0yqWZ2EmVtYkdCNXkosc1h
 eYUw==
X-Gm-Message-State: AOJu0YwOcpfCJShK/AugRgZGl3fDFiQShbfHyR6KnohW4qDL/S1FAbf/
 swKWo//mDI97Ubs3jGCegWwmwIo7TOF5eKck/VUfYVE/KnTgYbXM
X-Google-Smtp-Source: AGHT+IGAQfbPRbsfTpM0aK4D6fvZG1rsiktVYt61uGomOVbKMmopBwPFSptvkm9mzsan2gR9cCCh1g==
X-Received: by 2002:a17:907:36c1:b0:a86:7924:11bd with SMTP id
 a640c23a62f3a-a93a05fff3amr378300766b.41.1727278989391; 
 Wed, 25 Sep 2024 08:43:09 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 08:43:09 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:43 +0200
Subject: [PATCH 4/6] drm/meson: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-4-e609d502401b@gmail.com>
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
 bh=5LX2h6KUZ5if9Uj2vao0DwqWNuvKw18cUv/GkRmqevw=;
 b=i/26hRvR0+ATIZUcXlMm3e7auzpYVGdXGLS4TiyMLWDOmWVpEOZntFsYtA6UIGOAGHiXCzB2L
 ugbC+ZKd/ssD1Wn8wgdhVT2jaSlKi3OSJfOxsagoBy2dqeu80xbwgz/
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

`meson_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 4bd0baa2a4f5..6c8677d1f562 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -126,7 +126,7 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
 	return false;
 }
 
-static struct regmap_config meson_regmap_config = {
+static const struct regmap_config meson_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.43.0

