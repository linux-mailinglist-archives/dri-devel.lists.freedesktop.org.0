Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5284F829
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 16:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C68C10F592;
	Fri,  9 Feb 2024 15:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Hlo3T1Th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2453010F592
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707491321; x=1739027321;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cgrbif3MXR/BTAiL2rEDJWkpNWY9QqVDn209knbW238=;
 b=Hlo3T1ThLrCDC6uSeqnNtATUnPnqrvlDkr2Kg6BQvyF1x3uOx+bHJ9lL
 vk7gmhZqSJVa62EZUa5Z+7BHQEr3js0BUyv9G2iH6QeuXwjmaKrQspHpE
 ELhKOqYf+k07K79Sfqz8K4Cerp/FBPItc/I3DYEopXDm6RYwNVtzD5fuh
 5RXXwf5ur5dnsntAW1jaaXo+FUvskm2cInxPp3Hz3yDkMrBYUmHfEzAVm
 5zi5CQcGaDkJH0fA375Mii3fZt2/B7Zd5YHuKWGALBDxomHXAxt4rzGbq
 TH6yFAmnwxOx8A4THOytm0OYQcKep6GTRlU4t2Idm86BoCW4DhGwZSPMX Q==;
X-CSE-ConnectionGUID: KIIHkk3fQjqBsya5fSn4qQ==
X-CSE-MsgGUID: hxyDI4lESH2W5w9Pl05HTQ==
X-IronPort-AV: E=Sophos;i="6.05,257,1701154800"; d="scan'208";a="16014537"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2024 08:08:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 08:08:12 -0700
Received: from che-lt-i70843lx.amer.actel.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 08:08:01 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <manikandan.m@microchip.com>,
 <dharma.b@microchip.com>, <arnd@arndb.de>, <geert+renesas@glider.be>,
 <Jason@zx2c4.com>, <mpe@ellerman.id.au>, <gerg@linux-m68k.org>,
 <rdunlap@infradead.org>, <vbabka@suse.cz>, <dri-devel@lists.freedesktop.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <hari.prasathge@microchip.com>,
 <akpm@linux-foundation.org>, <deller@gmx.de>
Subject: [PATCH v4 0/4] LVDS Controller Support for SAM9X75 SoC
Date: Fri, 9 Feb 2024 20:37:53 +0530
Message-ID: <20240209150757.66914-1-dharma.b@microchip.com>
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
- include all necessary To/Cc entries.
The Individual Changelogs are available on the respective patches.

Dharma Balasubiramani (4):
  dt-bindings: display: bridge: add sam9x75-lvds binding
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

