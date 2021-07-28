Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601103D9237
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5596EA83;
	Wed, 28 Jul 2021 15:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD386E897
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 15:37:53 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BC54D89;
 Wed, 28 Jul 2021 17:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627486671;
 bh=xPX5vJyQI01YAKbR9+mBBKgK9BGoWiq0OfZfoRRqhSg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ABbfU37DpB4YwMoMCqNsuw4ZMSFWmaHrmPz4N2E2S2dlRLPH4veVRNJjNFSMlSfA6
 am2t9DL1Bu6OJXQUbACbDScnHZ0LY0vVHNTvoLt4S1kY09WEclWVzgofbYYIlqRXq2
 EbtdcqKxW1GpuaW93tiUR4zAhx9dpXPPNeNC25bM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/sti: Enable COMPILE_TEST on all ARM and ARM64
 platforms
Date: Wed, 28 Jul 2021 18:37:34 +0300
Message-Id: <20210728153736.15240-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-imx@nxp.com, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To extend test coverage, relax the dependency on ARCH_STI or
ARCH_MULTIPLATFORM to also enable compilation on ARM or ARM4 when
COMPILE_TEST is selected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/sti/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
index d0cfdd36b38f..e7d18893bc11 100644
--- a/drivers/gpu/drm/sti/Kconfig
+++ b/drivers/gpu/drm/sti/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_STI
 	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
-	depends on OF && DRM && (ARCH_STI || ARCH_MULTIPLATFORM)
+	depends on OF && DRM
+	depends on ARCH_STI || ARCH_MULTIPLATFORM || ((ARM || ARM64) && COMPILE_TEST)
 	select RESET_CONTROLLER
 	select DRM_KMS_HELPER
 	select DRM_GEM_CMA_HELPER
-- 
Regards,

Laurent Pinchart

