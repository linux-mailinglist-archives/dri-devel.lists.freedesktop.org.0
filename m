Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AC9848786
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE78A10E775;
	Sat,  3 Feb 2024 16:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OgR/X+Sm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8725410E839
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:53:28 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-363bfbc7b25so941885ab.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979208; x=1707584008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9XUHyzhcEBPgUyedjboVKpnmtxonPsD2U3arujSm0XE=;
 b=OgR/X+SmnQiDZTac/dRwCsIeWLUGBicDxaccwU/qxZ95tSNnJ+5oca005NlUUxpiGl
 TNlhWRZ9q7uM5jxpHJ/+gLRCxp2NQAXmU24lyKAxFA45F0rqC659AhIN1h2sA/ZtJ1Wm
 MQ7bABFowfkGRDKFnUI1dZL8UhCUJMqAuR1xEm4KQRlG5//ukojoeQSawQx2j8imsTzj
 YlMFYPp9ZVG1K7xlhYMocEIbIxWOc2tDtnqTQlelQyda2Zu/8jP9yYIyoXkP5edYG6Jo
 cuxQXBMuQGnnx2l7cfw+jVs/awpT0HvaqHhLGOleT85nJcOt269uQhtMfxAtjmI/Uv2i
 Rkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979208; x=1707584008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9XUHyzhcEBPgUyedjboVKpnmtxonPsD2U3arujSm0XE=;
 b=YtYdBFsT45JHwBAUFCRBuDgAablqY7DgcFpUcoOzMr2033v+kP6EtyV1YE8kMLUBbw
 MfByzuiwE6ZIBdlGCbSkwRKeC7WFkB1nglgDPmIWOUigJ30KlK8ZpyM3kfWdvJoLQFog
 D9t4VDMX3+PocUCKoRww4izTZdbV0Ys0oqOt11/kHF05/OVfzvvqcI3PEVnTAkTqV4GZ
 t/eST8QsPNeer9x1QTFrhdOornmo8JpJ7Hw0b55qrDTd6Fbjvm8HkmqK6OOvtjbH3E/T
 UHlceyd3zJKjvLm1MK1p7Doql+nxULJRU3/P4u+lyKEQRwDZWFegjuH+ItYVd6gxb04u
 NcVQ==
X-Gm-Message-State: AOJu0YzmtvK3IqVYiOZAZAfw47Bkx6ska+KyE47bZTPl5QH8T7nEPkdS
 cvnwm/q661fNIJjec+DkoS+nc2J9YaTzSdrTdv9Bjn2uSEo3D5Mo
X-Google-Smtp-Source: AGHT+IE2O1m7e/uXI5S9VSQpXsL+ogbmDdnqGeGTYadDkakIFJIrovcZVLpYBZWHH6ddMnEbqEyskg==
X-Received: by 2002:a92:ca8b:0:b0:363:b519:bfff with SMTP id
 t11-20020a92ca8b000000b00363b519bfffmr4848229ilo.20.1706979207672; 
 Sat, 03 Feb 2024 08:53:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWlcAHP1/xgDZnzgAuxHawH0NO6OJv8LhA66jcuqOf8c119mXkLUKYWDtiOCS2AZwWIXGNwJPx2OSyc962OYpHMWB29LqSIPLemncVT+De+t2R5vwLk0Ox1ThXvmlcTrwG5l+yG/3FgqJ6ZR3Nb0/FHtACItUzww3mV48EsnaeFc3b0QtPQfhEbNCs6TikO5IYzhpy0WSSfcMdCHz9fmzOmiL2coidv0mEK1AeSdlUm37QWp0Eikgx3TGavTmp7tfRAmAIN+geK8cjdEgL2O45joCJ88cQ5rXgEVJoQvY4fdiDvWiZpgEcG1LEqHPvGXz9RDyAlk7hiF/f2ZLwfWsaN6ARWS8+P5zErDJdHgFV0BnqjLjwsdS88j2xHF9tMLUa09ejKB7eRXht522VBUjOSqE+SH7A8FPHUk9m7VWWnW8ryXdp8S98lS2AUU5QPwpaLSzQywEnkRU6pJB7l11YiaA/FkMif7aebXQw7uAMl1BtlUnlgRpXhj4XNN6lhHHnNhyeJiL5cri1UEZMSjQJGl/h1FV05EWG1vPd4YqbtYVCgZyoKKDI31DpTeIxJ/vmROP9VRRALy05tS2Rw4KzmkvQEGG1Gciiq9/hYMyPkEvtz2f656fMzRsuy5aotI2tBk+o28PB22og6DVWxIZYgABsFlrldN5YNAg/yUiOKC4wLCiOQXFpKZCr/7bxSjukRSFy1qOKEBq0r3rz49VXX71n0CRCCDw334e9Kyf7BB5Mu736LlNJPYRYf3n05YZwTkge2RWvD2Di8p1nUtWsEX+nJb9RALNdbkIvp74VzECdd8XPkeEI5Rtig0OxGVSc9UKv4uvuYy4uE28iXe9WY4tHR8yIgD0h2LaH7/po/5bMjg1WsOBjuOVqlYY8wJQHQ7rDGOKGQs8+ED0MXhKeM3FYNNIqiHX7gj9D0gN9WJwAlGK5IX3SFMMWrtg5SMEjCUL
 hINOWO+Abubuq8a3n+enTDcH5zkNg6x+SQZaD2l3Wet2UK0QNm1RrPrf9lR7uUE5qUoibecwltghAvu9iRNB+vZ/xRyoLiOv5qsQcGl+cMWz5evixLeXyOY5FoAW8hTkK70zWankAhXpZDKHBf1rXv+4nPhglYSoOmv5iMdJTVo4KYP+orfjsmFSdYCJTskFIVoEyZjyGHY0N6DuLdIE/tuKaVyAiBhw==
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:53:23 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Adam Ford <aford173@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: [PATCH V8 00/12] soc: imx8mp: Add support for HDMI
Date: Sat,  3 Feb 2024 10:52:40 -0600
Message-ID: <20240203165307.7806-1-aford173@gmail.com>
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

The i.MX8M Plus has an HDMI controller, but it depends on two
other systems, the Parallel Video Interface (PVI) and the
HDMI PHY from Samsung. The LCDIF controller generates the display
and routes it to the PVI which converts passes the parallel video
to the HDMI bridge.  The HDMI system has a corresponding power
domain controller whose driver was partially written, but the
device tree for it was never applied, so some changes to the
power domain should be harmless because they've not really been
used yet.

This series is adapted from multiple series from Lucas Stach with
edits and suggestions from feedback from various series, but it
since it's difficult to use and test them independently,
I merged them into on unified series.  The version history is a
bit ambiguous since different components were submitted at different
times and had different amount of retries.  In an effort to merge them
I used the highest version attempt.

Adam Ford (3):
  dt-bindings: soc: imx: add missing clock and power-domains to
    imx8mp-hdmi-blk-ctrl
  pmdomain: imx8mp-blk-ctrl: imx8mp_blk: Add fdcc clock to hdmimix
    domain
  arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module

Lucas Stach (9):
  dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
  phy: freescale: add Samsung HDMI PHY
  arm64: dts: imx8mp: add HDMI power-domains
  arm64: dts: imx8mp: add HDMI irqsteer
  dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
  drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
  dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
  drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI
  arm64: dts: imx8mp: add HDMI display pipeline

 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  102 ++
 .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      |   84 ++
 .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     |   62 +
 .../soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml     |   22 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  145 +++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/gpu/drm/bridge/imx/Kconfig            |   18 +
 drivers/gpu/drm/bridge/imx/Makefile           |    2 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c  |  207 ++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  154 +++
 drivers/phy/freescale/Kconfig                 |    6 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 1075 +++++++++++++++++
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c        |   10 +-
 14 files changed, 1876 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
 create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c

-- 
2.43.0

