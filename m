Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35F22B4EF2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 19:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BFF89A9F;
	Mon, 16 Nov 2020 18:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A31289A9F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 18:14:06 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D955E2078E;
 Mon, 16 Nov 2020 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605550446;
 bh=rryR7gEWIpjU4vN8PjeQodDDv/FqOgqr5+c2J5MS73o=;
 h=From:To:Cc:Subject:Date:From;
 b=UwoPRnA1ZTXNbn9yuyqT4A+6bIRkE02jOB4LE7zvhPv0bxIK6coVhLIwBItPlmOnf
 QCtWcFcfFvIoXffGdrKIP4t3gVQ/72/IzdIUxpFXb869k89agGwSjmyooEuVpmJCTs
 XpaYSpj/jJyK4biO4tlobknPh8yoQVoMjP9RN/2A=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: depend on COMMON_CLK to fix compile tests
Date: Mon, 16 Nov 2020 19:14:00 +0100
Message-Id: <20201116181400.543718-1-krzk@kernel.org>
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

The iMX DRM drivers use Common Clock Framework thus they cannot be built
on platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: drivers/gpu/drm/imx/imx-ldb.o: in function `imx_ldb_encoder_disable':
    imx-ldb.c:(.text+0x400): undefined reference to `clk_set_parent'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/imx/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index 6231048aa5aa..65f9ef625337 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -5,7 +5,8 @@ config DRM_IMX
 	select VIDEOMODE_HELPERS
 	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_CMA_HELPER
-	depends on DRM && (ARCH_MXC || ARCH_MULTIPLATFORM || COMPILE_TEST)
+	depends on DRM
+	depends on ARCH_MXC || ARCH_MULTIPLATFORM || COMPILE_TEST && COMMON_CLK
 	depends on IMX_IPUV3_CORE
 	help
 	  enable i.MX graphics support
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
