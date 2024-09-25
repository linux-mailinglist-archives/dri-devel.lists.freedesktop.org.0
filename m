Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8049863EA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2089610EA50;
	Wed, 25 Sep 2024 15:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J3O9TAIq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F2210EA5C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 15:43:08 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso88132765e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727278986; x=1727883786; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=by/nTcqi0aVjyTogWtw3F/RwUIoI+ZIDj6x5N4uN+wg=;
 b=J3O9TAIqaKhDITuEJj8I1a6Umx7DIjqUv1zyf/15VVpYopkNbveqg8Yu90hXRk63kY
 Gdpo3rYuvUVzaEcjmKoIuMj7RseKy8TRhq9tHI3NIGuM6WTb5zSHgK2KGXB9oVEU4x6t
 1EWhQhzfZ1bJtcj83VyoETKEu6WobJuvbdy6CG3XSt/At0QKwbXR80kZisCeSYFdPJ9+
 U9zHxcGgQe+9sm6hyB4AaSooMaP0p1m7uUz93eSPfeeq7dJfNwTLexGPEtfN73m8pz08
 X6EY2A3Ub9ohBPc2jVs4+R4TjbYhTU5iSTMKaot0FTjX44aV7+kdTRFnneLTHz0sJHZ8
 ZqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727278986; x=1727883786;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=by/nTcqi0aVjyTogWtw3F/RwUIoI+ZIDj6x5N4uN+wg=;
 b=IPJys+UgfQxJzOuKU9bXr2JwdQHcYkrXVI1gSK+Pq9f1ppFh1tm5KStO3nQq8f2YTB
 U0lyusA2kM8hpjN+Rle7F9kJ9JknDq7qw82Nn3but2PPzg3QdAaq7WeoLbkNWbWb4VN2
 oj0HR4HYkeZLPiHO53YokFn3Dodc9Cr610jJcHdEHU0nuJwnCN+cvQAYCmeQrXqwe7mw
 ZNPRh0gHqMvxSTg3FKq+uoQeRrSNk25WC0CYKXkPoZDvgrGVSsORVxdXhcIBcaGmcwMj
 OR+lmLGxcXm+HtjoOAVeABTqitBmGkR4kg/ayLaOIBjp7vbQ2NhEbefqRqmzSUDt4mSv
 YoyA==
X-Gm-Message-State: AOJu0YyUHGeSdEPI+rVqv4LQBiRPx8tRiLTqmZ0DsnhVslGgiXb3TQwK
 4AD16DSTGhIM5xoJfv3IdhvVkfmqt3v4jdc+U3hl1RWmxS4v5rKe
X-Google-Smtp-Source: AGHT+IHJhvH9gplBfs4rlapKgfN74X4J8uVmh8ECXCHmFytouFZD6MReKNv2uyQvggR0QFC+8+ktEQ==
X-Received: by 2002:adf:fbcc:0:b0:374:c44e:ef27 with SMTP id
 ffacd0b85a97d-37cc245dd30mr2854153f8f.8.1727278986389; 
 Wed, 25 Sep 2024 08:43:06 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 08:43:06 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:42 +0200
Subject: [PATCH 3/6] drm/mediatek: dp: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-3-e609d502401b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=784;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Akh6/NmxNUGKnN3cTl+ADfEVv/jFRL48hClqI8/xUq8=;
 b=IjANioE+JCFwAjMkuWw7rvXfaWWxlLsFG0TPSDiWvDMe+XOLw4C6wtw/QweEtNdXjuNtLJZ0b
 bWnz5DBwP4dBi/Bl+1Ajyf6T97mjVaMth7Bkz45oPrpPhWhldTvE638
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

`mtk_dp_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..f0f6f402994a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -311,7 +311,7 @@ static const struct mtk_dp_efuse_fmt mt8195_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
 	},
 };
 
-static struct regmap_config mtk_dp_regmap_config = {
+static const struct regmap_config mtk_dp_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,

-- 
2.43.0

