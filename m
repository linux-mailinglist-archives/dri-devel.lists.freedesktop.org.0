Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCBA6C3D7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 21:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93B510E056;
	Fri, 21 Mar 2025 20:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="AgToCSSK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B4110E056
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 20:07:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46DC610206773; Fri, 21 Mar 2025 21:07:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1742587624; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Eb1BEiAFxII1zhOSg9DeCQQ4Y+bPXdF5eBe8UOsuPVs=;
 b=AgToCSSKKYGUb2qujDBiiU0HotwJSAM4SPBu9VhEBf50yG917ZMsA1xgJy0s/ULiJVzRHQ
 Yv6CGGw+fPvIDtSg8YwtXR1qYQon3ZG1mdKFSsCBxI5ZCCzkmLbO8UDVxl+R907vC4+S/n
 +LcludsrLo1vr9/7d5FlGMh4PXr4t/40DrMnOQcsVlSsrlyyOE39byxrAWnC93aJ9HR4h3
 9k8ru63MfSefMUimVYUBBZk6mMzr7bOFWBO2loKiMNbE1jvzdjQJ39/w2IlcO93l3DmJxT
 z2P9oSH4gh6hrMiyE0i1Rwf1P0ZN1kV/QTtkFjHwSJqPgQm2q9+yvEX4FAXKog==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: [PATCH v2 0/9] arm64: dts: imx95: Add support for Mali G310 GPU
Date: Fri, 21 Mar 2025 21:05:50 +0100
Message-ID: <20250321200625.132494-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

The instance of the GPU populated in i.MX95 is the G310.
Add support for the GPUMIX reset via simple-reset driver,
add reset and multiple power domains support into panthor
GPU driver, add iMX95 GPU support into panthor driver and
describe the iMX95 GPU in imx95.dtsi DT.

Marek Vasut (9):
  dt-bindings: reset: imx95-gpu-blk-ctrl: Document Freescale i.MX95 GPU
    reset
  reset: simple: Add support for Freescale i.MX95 GPU reset
  dt-bindings: gpu: mali-valhall-csf: Document optional reset
  drm/panthor: Implement optional reset
  drm/panthor: Implement support for multiple power domains
  drm/panthor: Reset GPU after L2 cache power off
  dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
  drm/panthor: Add i.MX95 support
  arm64: dts: imx95: Describe Mali G310 GPU

 .../bindings/gpu/arm,mali-valhall-csf.yaml    | 12 +++
 .../reset/nxp,imx95-gpu-blk-ctrl.yaml         | 49 ++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 58 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.c      | 75 +++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h      |  8 ++
 drivers/gpu/drm/panthor/panthor_drv.c         |  1 +
 drivers/gpu/drm/panthor/panthor_gpu.c         | 12 +--
 drivers/reset/Kconfig                         |  8 ++
 drivers/reset/reset-simple.c                  |  9 +++
 9 files changed, 227 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml

---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

-- 
2.47.2

