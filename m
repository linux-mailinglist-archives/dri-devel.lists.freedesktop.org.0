Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849FA9B2CC3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8FE10E16A;
	Mon, 28 Oct 2024 10:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GbvInU+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752DE10E16A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:26:11 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso578201066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730111170; x=1730715970;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tjf17nGxadGEosYCdQe1mRaeFLEYOHfj3xwJxxS9C4Y=;
 b=GbvInU+n+6MuCkxAd3QdR4ZldO4t/KbfKbZt5r+sL9j3gKjkz31/vkd1UHWzGZRzhj
 iHpt4e94bDhH5FUhQ8F8wPgGvkah9S0GbvnnRufhkI1j5m/4RdYAwOZufDTRSmzfIy4Z
 1UYRkoMadyLLl5xmNLABHz9ElGrZLycpsyZwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111170; x=1730715970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tjf17nGxadGEosYCdQe1mRaeFLEYOHfj3xwJxxS9C4Y=;
 b=KbQtxa2HQJP3MMpj2rcEQHU7Tg0kEy3qqGsrQ8/o6udtcVFu+vGP5p6NUf/SbBY8Vz
 wGrpyvB1C3VvslWmwBm2Z4ss4lNynU56YLOmnClM6qE+6jhoHCFP+gKeWTKNLE4cLBnQ
 XrKOW0BJJGionL7bZ8Vuf7j6WQVJMhqD3C0EiuyRjw+cBD2t6XdoCsxoRn9qcnMwE9Bj
 JeKsvAFFzjqX0hZy8rvnL2VaJCP3X3PIpfvJsJTu5Trl4k+bMtrCLi5NwuSQOvDqBqlt
 15wqRAwHswwZrsZih7Iwu9MBjWNwot+Q2vwv5AArnBJxJeAjonTqH4aCa8iTAJFofHDZ
 kBbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaa/bcx33iA1D+Iw0N5esHMlrYoQv4wK4BNT51YU7yMyE+xsP7P2878Ll96ptieQiFe6wC1vJ6axs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzWPkPJndvg5YsEKdRpqFC/6B5PjhfjgsdMPOYyUz7zXrXZm5G
 Liehxm7qmK8GUs1KSA8q8xJMOqEQRiIHqqK8FVm62FZuXkLWiHa3d1HYw+oDITo=
X-Google-Smtp-Source: AGHT+IH1B0ko3VIpWkPI4RC1oi+MD1rEEYyYDNnVuUIYAatTCka4T6be6wD1IPac0B/RcE+iH3t9Yg==
X-Received: by 2002:a17:907:3f23:b0:a8a:8d81:97ac with SMTP id
 a640c23a62f3a-a9de5c9f5f9mr669847666b.4.1730111169568; 
 Mon, 28 Oct 2024 03:26:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:26:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [RFC PATCH 00/10] Support simple-framebuffer on imx8m
Date: Mon, 28 Oct 2024 11:25:23 +0100
Message-ID: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
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

This series is the Linux counterpart of what was sent to U-Boot [1]
for the support of the simple-framebuffer for the BSH SMM S2Pro board.

The need to avoid re-initializing the hardware (power domains,
controllers, bridges, display panels) that has already been initialized
and kept powered on by the bootloader has required updating more than
one YAML file, with the addition of boolean properties to inform the
driver that the corresponding hardware has been initialized and left
on by the bootloader. All these properties are added on the fly by the
bootloader to the various relevant nodes.

Support for the simple framebuffer for the dts of imx8mn-bsh-smm-s2/pro
board has been sent with a separate patch from this series [2].

[1] https://lore.kernel.org/all/20240913095622.72377-18-dario.binacchi@amarulasolutions.com/T/
[2] https://lore.kernel.org/imx/20241024102800.3481574-1-dario.binacchi@amarulasolutions.com/T/


Dario Binacchi (10):
  dt-bindings: soc: imx-blk-ctrl: add 'fsl,power-domains-boot-on'
    property
  pmdomain: imx8m-blk-ctrl: don't turn on a power domain already on
  dt-bindings: power: gpcv2: add 'fsl,boot-on' property
  pmdomain: imx: gpcv2: don't turn on a power domain already on
  dt-bindings: display: panel: add 'syna,boot-on' property
  drm/panel: synaptics-r63353: don't re-activate the panel if already
    setup
  dt-bindings: bridge: samsung-dsim: add 'samsung,boot-on' property
  drm: bridge: samsung-dsim: don't re-activate the bridge if already
    setup
  dt-bindings: lcdif: add 'fsl,boot-on' property
  drm/mxsfb: stop controller and drain FIFOs if already initialized

 .../display/bridge/samsung,mipi-dsim.yaml     |  5 ++
 .../bindings/display/fsl,lcdif.yaml           |  5 ++
 .../display/panel/synaptics,r63353.yaml       |  5 ++
 .../bindings/power/fsl,imx-gpcv2.yaml         |  6 +++
 .../soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml     |  9 ++++
 drivers/gpu/drm/bridge/samsung-dsim.c         | 13 ++++-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  3 ++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h             |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 14 ++++-
 .../gpu/drm/panel/panel-synaptics-r63353.c    | 10 +++-
 drivers/pmdomain/imx/gpcv2.c                  | 32 +++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c         | 51 ++++++++++++++++++-
 12 files changed, 148 insertions(+), 6 deletions(-)

-- 
2.43.0

