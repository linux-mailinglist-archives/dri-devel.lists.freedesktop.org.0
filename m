Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7183F9863E6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68FE10EA54;
	Wed, 25 Sep 2024 15:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ANQc5dmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFB810EA4E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 15:42:58 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso594766b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727278977; x=1727883777; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tgLjgsBATCSWM6XL4qorkL1lHK3PtUuXoapmBEAcGck=;
 b=ANQc5dmBqXQYP+EdEtuFuhSpx0HZMPVPdAPVlL6At3s/CsI7m4bweoBBquhaa2awwE
 TEa5bvIjIGhjjC86a/o3Q0wjcr9SVHnuj4Ue3UGr+XJJiHX9uE0jJ+WrgDtrjBosxaoM
 mqLgQnPkgKscpd941k+woGvEFtrUiHTwDxIYZUSGUzFwYIwjDEqXtEi5LBGBY8QL1+jm
 DLCVmAXWbBHDnL8iaHVLbZpGQDab/R1RfhHzlBfDtSwipyHMEuDQBLGdgCuXaCaPnyCf
 9wk/4ikoM9JIUkH1fR3joN7sUeoFuZ65usvNXDBM5Hn2Xz8RhUi6CrfxlkxSCFhWuoYj
 nqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727278977; x=1727883777;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tgLjgsBATCSWM6XL4qorkL1lHK3PtUuXoapmBEAcGck=;
 b=maUxDt49+rLmt+pvtEzrsPFWTvJRBG1cbgMf2mnnLqy7XQsCSoqN2yWcUTeepbs8MJ
 +beXj1NGOtyVCx72qXumFQN6R4oZBV8edx0w2JKl6lvgosm8bfaJn8CahYKKbxOIxqyJ
 K8+4u63JWGGP5Fr1IdldOArd+YmCcd/38FrLTQuNmQrC9itSCZ7zAwnq8OMOpdX6s6mG
 epI2vbbkEEqIT1Vku7nDbOpxvnuYYAsK91l3w1qPS6+opqm70JEg98uavsPnEZgxzHLJ
 eLRwKIIuvqvqUX2aOkpDlgUVR59MPYiTdqL2Guf3DJHOiVkEqJ/SHd0M90MOLS+7hyYc
 L+QQ==
X-Gm-Message-State: AOJu0YxLZZWjgo4pQKJAzGPBnTvh5CaU/+hagdndeTxn/lYgYOOb5fmv
 /3KyGsFG0phCajaeLkhg3phxXjkzJHs7rZyHfNh2NarFdJvoM/ic
X-Google-Smtp-Source: AGHT+IFkZ1n37tP3Rc2/BMb8UIyY4klrs21gwIaq2A7G/dBjrAoB3ccE5EDVcggDj2gmdvtj2kWRUg==
X-Received: by 2002:a17:907:7da7:b0:a8c:d6a3:d038 with SMTP id
 a640c23a62f3a-a93a03e3095mr316176266b.37.1727278976983; 
 Wed, 25 Sep 2024 08:42:56 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 08:42:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/6] drm: constify read-only regmap structs
Date: Wed, 25 Sep 2024 17:42:39 +0200
Message-Id: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG8v9GYC/x3MTQqAIBBA4avIrBswK/q5SrQInWoWmowRgXT3p
 OW3eC9DImFKMKkMQjcnPkNBXSmwxxp2QnbFYLRp9Wg6dOLRniFdKLT7NWKj+83YphtcraFkUWj
 j51/Oy/t+aWaESWIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=1173;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=mV011lLjGh5QUEeOXJ02JFFzg3GXgCu8+SSQahiHbas=;
 b=myNkjRQ3PFvNNvW6MYUDscCs4qRnSff9r34U0SADdEuPuz6/EHK14GRk3jXV4EQhRuDrFFBYk
 q/5VY5I1EZoCwxtXU4F47W872f6MFmFLNx3SrzjZfC9qmsxNSZ5SlmM
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

This series adds the const modifier to the remaining regmap_bus and
regmap_config structs under drm/ that are effectively used as const
(i.e., only read after their declaration), but kept ad writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (6):
      drm/bridge: dpc3433: Constify struct regmap_config
      drm/fsl-dcu: Constify struct regmap_config
      drm/mediatek: dp: Constify struct regmap_config
      drm/meson: Constify struct regmap_config
      drm/panel: ili9322: Constify struct regmap_bus
      drm/sprd: Constify struct regmap_bus

 drivers/gpu/drm/bridge/ti-dlpc3433.c         | 2 +-
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c           | 2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c            | 2 +-
 drivers/gpu/drm/meson/meson_drv.c            | 2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
 drivers/gpu/drm/sprd/sprd_dsi.c              | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
change-id: 20240925-drm-const-regmap-307f2c358d10

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

