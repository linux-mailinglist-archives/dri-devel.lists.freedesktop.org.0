Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55F896D66
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA731129DD;
	Wed,  3 Apr 2024 10:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DXdoFXuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795441129DD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:56:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E6836134A;
 Wed,  3 Apr 2024 10:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB03C433F1;
 Wed,  3 Apr 2024 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712141790;
 bh=XdIwcCPhuveqD8bBR+019+3CwCmU7ZniwCgd3MFtbCc=;
 h=From:Subject:Date:To:Cc:From;
 b=DXdoFXuUW+8Nq2JfxVf2S9TcNFhcA/R86O0iwT+pSi0YDqlykbUFe6VbYwW8I6sXL
 L/oRZ8dYQHJhgNK4aSVG/t/OKisTgy+xoRpkCauk2WOm1szJ6DdHl/C3NkIMfYHUYq
 0B0dZRKLbcMhNfqQrsDgHBk3MSKVGcJVi5I6b0Z1RweJ6iM63rGTgyUJNsytq+uf4f
 /QBWsaWc0s09kqgWF6dWH3YG450QqyqP4WyDEDcS7WLWKvQGgscWjOaHSs+xy5WF4/
 FUvjSL4tnDhuxLPQgc4hMqMliIz4wqsAanBSdKgrefSt6bCpJSeFFUNlVexZzFUJoK
 SI62ew7f/7d4w==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/7] drm/display: Fix display helpers depends on fallouts
Date: Wed, 03 Apr 2024 12:56:18 +0200
Message-Id: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANI1DWYC/x2MQQqAIBAAvxJ7bkEtKvpKdLBcdYksFCqQ/p50H
 JiZDIkiU4KxyhDp4sRHKCDrClavgyNkUxiUUK1oRYOWHzQ3erMzbusRLDsU3bBIJYk09VDKM1L
 R/us0v+8HNAX6m2UAAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=mripard@kernel.org;
 h=from:subject:message-id; bh=XdIwcCPhuveqD8bBR+019+3CwCmU7ZniwCgd3MFtbCc=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGYNNdOgCj7VWN3K5T28OX9gNdW2mEeuJ7JXTIM7EEcijqtbF
 YiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmYNNdMACgkQJ1/OGaI9vnaKUAGAsmkB
 dfB4R9+KjUzCcpEypmjcJd/rkeSmjBxvX8hqAKlQGjxl8SMRtNrxTDjMqYCWAYCSvqJ20Wh3gmK
 8H4YFGkCAg8wkZolIwWoyNIB94It5sLotonDUNhddTFPaPwLp+nk=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

Here's a series addressing the various regressions that were reported
after the Kconfig rework for the DRM display helpers.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (7):
      drm/display: Select DRM_KMS_HELPER for DP helpers
      drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable
      ARM: configs: imx_v6_v7: Enable DRM_DW_HDMI
      ARM: configs: multi_v7: Enable DRM_DW_HDMI
      ARM: configs: sunxi: Enable DRM_DW_HDMI
      arm64: defconfig: Enable DRM_DW_HDMI
      mips: configs: ci20: Enable DRM_DW_HDMI

 arch/arm/configs/imx_v6_v7_defconfig    | 1 +
 arch/arm/configs/multi_v7_defconfig     | 1 +
 arch/arm/configs/sunxi_defconfig        | 1 +
 arch/arm64/configs/defconfig            | 1 +
 arch/mips/configs/ci20_defconfig        | 1 +
 drivers/gpu/drm/bridge/synopsys/Kconfig | 2 +-
 drivers/gpu/drm/display/Kconfig         | 1 +
 7 files changed, 7 insertions(+), 1 deletion(-)
---
base-commit: 727900b675b749c40ba1f6669c7ae5eb7eb8e837
change-id: 20240403-fix-dw-hdmi-kconfig-068b121eeae7

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

