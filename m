Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2DB84C89E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 11:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588E21131FC;
	Wed,  7 Feb 2024 10:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="HzBjeNoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DB11131F5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707301721; x=1738837721;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iLby45AfXsf1+FGAeEA+KBmo2FnjvHkdZA8p3CT5tRE=;
 b=HzBjeNoFBdnmAqLIN9kkEasYluz30hnamfVfsi8V4WNGZJrPzR92Rw1e
 aFUC8NR0FmEvbcO07gxZ50Zucjj11EV7s719U0q+P/Nl3UcDE0QYOwYvU
 HSSsev5SHWrPdpHuHheCvEnMipgLRunZEk3QAcGL/Ik1RyqiFEPldECkM
 tICQ49Sy4LJVnSjYM3QUTNwqF6X46vQGp3LS8MfHS1I/9EvTuVhzIQo51
 x0MJMD2KsqeL7XSx3D4x4RxKy59dUvkGgRDD/gkuOhBtMci4WhtlJBn3s
 8NAV8DKndC7DpCY5TUvj0dSFbmcJD+upBqHRgm108e7gnVyjLCyJmzShi A==;
X-CSE-ConnectionGUID: JxZ+DPsRTh6mZRhRbF3CqA==
X-CSE-MsgGUID: ImjuAnsXTKawQo4rCn1Hdw==
X-IronPort-AV: E=Sophos;i="6.05,250,1701154800"; d="scan'208";a="246623769"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Feb 2024 03:28:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 03:28:15 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 03:28:05 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <dharma.b@microchip.com>,
 <manikandan.m@microchip.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux@armlinux.org.uk>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <geert+renesas@glider.be>, <arnd@arndb.de>,
 <palmer@rivosinc.com>, <akpm@linux-foundation.org>, <gerg@linux-m68k.org>,
 <rdunlap@infradead.org>, <vbabka@suse.cz>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/4] LVDS Controller Support for SAM9X75 SoC
Date: Wed, 7 Feb 2024 15:57:58 +0530
Message-ID: <20240207102802.200220-1-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

This patch series introduces LVDS controller support for the SAM9X75 SoC. The
LVDS controller is designed to work with Microchip's sam9x7 series
System-on-Chip (SoC) devices, providing Low Voltage Differential Signaling
capabilities.

Patch series Changelog:
- Include configs: at91: Enable LVDS serializer

The Individual Changelogs are available on the respective patches.

Dharma Balasubiramani (4):
  dt-bindings: display: bridge: add sam9x75-lvds compatible
  drm/bridge: add lvds controller support for sam9x7
  MAINTAINERS: add SAM9X7 SoC's LVDS controller
  ARM: configs: at91: Enable LVDS serializer support

 .../bridge/microchip,sam9x75-lvds.yaml        |  55 +++++
 MAINTAINERS                                   |   8 +
 arch/arm/configs/at91_dt_defconfig            |   1 +
 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/microchip-lvds.c       | 228 ++++++++++++++++++
 6 files changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
 create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c


base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
-- 
2.25.1

