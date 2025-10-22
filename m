Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53FFBFB223
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0931B10E71B;
	Wed, 22 Oct 2025 09:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="mU+s/xrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Wed, 22 Oct 2025 09:21:16 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86A710E048
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1761124877; x=1792660877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qcS+K1bmBeQE86BuzfqFQqSfV1A2G1hZGYBYEBDMwck=;
 b=mU+s/xrLK1tpymeMmsLJkr26F0E7nE/mJbMMk3b1k1wCQ/To9D/mRY5a
 lRzX/6TOGUS8KSAsCU6SbppI5WAqWmuDCpWkOsHDZw9Yi8+i4h1nKfPKZ
 e0cGGbxqRSxd6WggOhxtAHnlEZ6GAIrpU0qF4YuO1GjwzVs6HY51KN191
 hBFGy2hZJvH6hDbo13xGzweo6sxn9g/mETb0QnEFz5fc/qChbP67xCoSR
 H2mk4uOtuyGW5g+3bujkeYZDrWaV3bONir8AQNBDlGd8Iz2DljpdCFqsr
 1WyG7s0Xul9Wrf0qDwu8DmyD1kg5Ceso6AC2LSzqW3rv1OwIErBf2GWSW A==;
X-CSE-ConnectionGUID: sQh31e/WR3uMWyklH0AEwg==
X-CSE-MsgGUID: dmOl+ZzSSDafFvA0GS/R0A==
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="48111526"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Oct 2025 02:14:11 -0700
Received: from chn-vm-ex3.mchp-main.com (10.10.87.32) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 22 Oct 2025 02:13:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.27; Wed, 22 Oct 2025 02:13:51 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 22 Oct 2025 02:13:46 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, <dharma.b@microchip.com>
Subject: [PATCH v2 RESEND 0/3] Add LVDS display support and PLL handling
Date: Wed, 22 Oct 2025 14:43:48 +0530
Message-ID: <20251022091351.472331-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
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

Hi all,

This patch series adds LVDS display support for the Atmel HLCDC driver
and introduces proper handling of the LVDS PLL clock required for such
panels.

The Atmel XLCDC IP supports multiple output types — Parallel RGB, MIPI
DSI, and LVDS. While the existing implementation handles RGB and MIPI
displays using the LCD generic clock (sys_clk), LVDS panels require the
dedicated LVDS PLL clock (lvds_pll_clk).Configuring the LVDS PLL clock
rate automatically based on the panel pixel clock, eliminates the need
for assigned-clock-rates entries in the device tree

Change logs are mentioned in individual patches

Dharma Balasubiramani (2):
  drm: atmel-hlcdc: add support for LVDS encoder type
  drm: atmel-hlcdc: set LVDS PLL clock rate for LVDS Displays

Manikandan Muralidharan (1):
  mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 86 +++++++++++++++++--
 drivers/mfd/atmel-hlcdc.c                     | 16 +++-
 include/linux/mfd/atmel-hlcdc.h               |  1 +
 3 files changed, 95 insertions(+), 8 deletions(-)


base-commit: c1a7cc00cd412505e070eb4e62bc0b0ca85243e0
-- 
2.25.1

