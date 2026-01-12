Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C930D123D6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CB110E379;
	Mon, 12 Jan 2026 11:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="jNnKRw/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1441510E379
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1768216787; x=1799752787;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=plkYxYrK77dwuxF1MN6GlUpP3D90yMInRgt/chRUaSU=;
 b=jNnKRw/QeREYrBgMPNrjQMpwMljihHeTs3bo+AQLohJJBQdB9lu1wjjD
 EBeTbcRp3CSx7a07+bHlc3Kxnt4cKcuPOrK33C56uSTg0bJw+gr45FO43
 DA3l+AuL+E7pmnrKXhkzu9E8OpSLu8QaDz+FaGroOMdfpYVEBeskIN9JN
 6OoS2PnyII6dOu1TNl5fNtsa7RYNjE2xtpuQJ/muj2CQRJq7np/FrDgjQ
 x6Spf4hm+zp8XK9ByCgn5c6kfVRfRE9aSCh+9lN+X1LFe907SCknTUXF6
 B62HeBvc+t9Wwqgzh5lOQtVJ+pTkRdmSG7+hWtW0iUG2im8pStEKxE+Ae w==;
X-CSE-ConnectionGUID: 2FQW9J3NQsejMtiFniwPwQ==
X-CSE-MsgGUID: JsTJpYRLSpO/qY54cFWl6Q==
X-IronPort-AV: E=Sophos;i="6.21,219,1763449200"; d="scan'208";a="58675293"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jan 2026 04:19:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 12 Jan 2026 04:18:58 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 12 Jan 2026 04:18:55 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Subject: [PATCH v4 0/5] drm/microchip: add GFX2D support for SAM9X60 and
 SAM9X75
Date: Mon, 12 Jan 2026 12:17:55 +0100
Message-ID: <20260112-cpitchen-mainline_gfx2d-v4-0-f210041ad343@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPYZGkC/4XNwWrDMAzG8VcpPtfDkhMn6anvMUbxFLkRNE5wQ
 mgpefc5PYwxWnr8f6Cf7mriJDypw+6uEi8yyRBzFPudos7HM2tpcys0WJoGQNMoM3Ucde8lXiT
 y6Ryu2GrnLHBjS/ShUvl6TBzk+pA/v3J3Ms1Duj0eLbCt780FtNFtFfw3eFsD87EXSgN1Mn7Q0
 KvNXfCvVb+2MFuOgqemLZ0DfGbZXwsAi9eW3SxThZoKU2Ht/lvruv4AymSnS1oBAAA=
X-Change-ID: 20250911-cpitchen-mainline_gfx2d-6631e9352af7
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3731;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=plkYxYrK77dwuxF1MN6GlUpP3D90yMInRgt/chRUaSU=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2bKjdaIvlP3k2VO88S15l20Zp1nsHOr1J57KSHrPq6/I
 fX30+udHaUsDGJcDLJiiiyH3mztzTz+6rHdK1EpmDmsTCBDGLg4BWAiG4IY/lkrMvQ+MDt46dW2
 me//lJv/cs7M7nrddbDj+sYMtuec53gYGQ4GhjdGG136fdk70enjdBtjmc8y85YHqWfKvlnPfq3
 pKA8A
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
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

This series of patches adds GFX2D support.
The GFX2D is a 2D GPU embedded in some Microchip SoCs such as the
SAM9X60 and SAM9X75.

Patches have been developped on top the 'linux-6.12-mchp' branch of the
https://github.com/linux4microchip/linux.git repository and tested on
mainly on a sam9x75-curiosity board and also on a sam9x60-ek board.

Then patches have been rebased on top of the 'drm-misc-next' branch
of the https://gitlab.freedesktop.org/drm/misc/kernel.git repository
for mainlining.

About the tests, the GFX2D driver was used with the M2D (Multi 2D)
library: https://github.com/linux4sam/libm2d

This is an open source library that abstracts 2D GPUs like the Microchip
GFX2D (and later the Vivante GC520UL), providing graphics applications
of libraries with a unified API, inspired from OpenGL but focused on 2D
GPUs. The libm2d library itself relies on the libdrm library to send
commands to the relevant DRM driver in the Linux kernel.

M2D comes with a m2d_test program to run basic unitary tests.
In addition, libm2d has been integrated to two graphics frameworks:
- EGT: https://github.com/linux4sam/egt
- LVGL: https://github.com/lvgl/lvgl/pull/8729

BR,

Cyrille

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
Changes in v4:
- Rebased onto the 'drm-misc-next' branch on 2026-01-12.
- Link to v3: https://lore.kernel.org/r/20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com

Changes in v3:
- Collected Acked-by tag from Conor Dooley on patch 1
- Rebased onto the 'drm-misc-next' branch on 2025-11-24.
- Link to v2: https://lore.kernel.org/r/20250918-cpitchen-mainline_gfx2d-v2-0-6cfac9d56612@microchip.com

Changes in v2:
- Renamed microchip,gfx2d.yaml into microchip,sam9x60-gfx2d.yaml.
- Removed the 'clock-names' property from the DT bindings.
- Renamed the GPU node from 'gfx2d' to 'gpu' in sam9x{60,7}.dtsi files.
- Link to v1: https://lore.kernel.org/r/20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com

---
Cyrille Pitchen (5):
      dt-bindings: gpu: add bindings for the Microchip GFX2D GPU
      drm/microchip: add a driver for the Microchip GFX2D GPU
      ARM: dts: microchip: sam9x60: Add GFX2D GPU
      ARM: dts: microchip: sam9x7: Add GFX2D GPU
      ARM: configs: at91_dt_defconfig: enable GFX2D driver

 .../bindings/gpu/microchip,sam9x60-gfx2d.yaml      |   46 +
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |    8 +
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |    8 +
 arch/arm/configs/at91_dt_defconfig                 |    1 +
 drivers/gpu/drm/Kconfig                            |    1 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/microchip/Kconfig                  |   21 +
 drivers/gpu/drm/microchip/Makefile                 |    8 +
 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c         | 1808 ++++++++++++++++++++
 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.h         |  169 ++
 drivers/gpu/drm/microchip/mchp_gfx2d_drv.c         |  350 ++++
 drivers/gpu/drm/microchip/mchp_gfx2d_drv.h         |  132 ++
 drivers/gpu/drm/microchip/mchp_gfx2d_gem.c         |  263 +++
 drivers/gpu/drm/microchip/mchp_gfx2d_gem.h         |   90 +
 drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.c       |  274 +++
 drivers/gpu/drm/microchip/mchp_gfx2d_ioctl.h       |   17 +
 include/uapi/drm/microchip_drm.h                   |  286 ++++
 18 files changed, 3493 insertions(+)
---
base-commit: 38feb171b3f92d77e8061fafb5ddfffc2c13b672
change-id: 20250911-cpitchen-mainline_gfx2d-6631e9352af7

Best regards,
-- 
Cyrille Pitchen <cyrille.pitchen@microchip.com>

