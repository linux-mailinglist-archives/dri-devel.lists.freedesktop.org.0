Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64E02B6D37
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 19:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5906189316;
	Tue, 17 Nov 2020 18:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D158954A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 18:24:25 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4930D2467D;
 Tue, 17 Nov 2020 18:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605637465;
 bh=06alfY5W3RzUxi7qMs2QywkGcbWsMtjt+7J2iL3G9T8=;
 h=From:To:Cc:Subject:Date:From;
 b=DY9lw6yjDE5qeFfl/OF111E7y6HC1skdfsB27KFujG5Yd7x4wsb/eCrrZpGe01lno
 WtoPSkRwbzoW2mcpkK5YcyzzeDy2TdNRixp15X2nJs8b4Cfp3mBza0dL/ugMSXFk7g
 zXiJM+uE/DIlV+I2FKQYI6PCABkOz+JVc0amSRik=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/imx: depend on COMMON_CLK to fix compile tests
Date: Tue, 17 Nov 2020 19:24:19 +0100
Message-Id: <20201117182419.73853-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The iMX DRM LVDS driver uses Common Clock Framework thus it cannot be
built on platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: drivers/gpu/drm/imx/imx-ldb.o: in function `imx_ldb_encoder_disable':
    imx-ldb.c:(.text+0x400): undefined reference to `clk_set_parent'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Put depends in DRM_IMX_LDB option only.
---
 drivers/gpu/drm/imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index 6231048aa5aa..73fe2bc5633c 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -28,6 +28,7 @@ config DRM_IMX_TVE
 config DRM_IMX_LDB
 	tristate "Support for LVDS displays"
 	depends on DRM_IMX && MFD_SYSCON
+	depends on COMMON_CLK
 	select DRM_PANEL
 	help
 	  Choose this to enable the internal LVDS Display Bridge (LDB)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
