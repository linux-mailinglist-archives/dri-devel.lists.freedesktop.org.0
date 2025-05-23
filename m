Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD388AC2263
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 14:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2710C10E1DE;
	Fri, 23 May 2025 12:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OupbYX3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2966610E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 12:11:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52EB3A4C98A;
 Fri, 23 May 2025 12:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8A7C4CEE9;
 Fri, 23 May 2025 12:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748002295;
 bh=upco2MjGTbWcx0KwuxZ81lYk46ygbIZH+HnuS8wNgxo=;
 h=From:To:Cc:Subject:Date:From;
 b=OupbYX3kvgUN5ZcYD32xfiJB1IP34v8cFI6HZ63OTGL06nftDHqgdgeJwjgcKdB7Y
 uHORnoBVWYm8uKS+icARRKuOI3sqeIeedn9bjO4kEvWJGCSZKtMFwB6GOu44LfuGU0
 x5Oj2cVosNsIZHsU836ijZvg+edAy1rwX5wRWXrcrN4pSItHfwlzNeUNSvaWQV5Xye
 LLjDlDM9Is3M6T8k7HL2g+4jnDN+BHELnQ/W8dIbit/a8cjtYpCjDn25sJqivDP/OB
 rYq8gLI8f5weXKbkw3T3k6ljilE4nOUgyo1vYO+H2hpHR78SJbUblgsqQxZUeJU+n4
 4gTbcExFQGtCg==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>,
 Jakob Hauser <jahau@rocketmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
Date: Fri, 23 May 2025 14:11:22 +0200
Message-Id: <20250523121127.2269693-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver uses the DSC helper module, but does not
select its Kconfig symbol, so configurations are possible that
cause a link failure:

ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-novatek-nt37801.ko] undefined!

Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 721581d425b4..cfebb08e8a62 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -522,6 +522,8 @@ config DRM_PANEL_NOVATEK_NT37801
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Novatek NT37801 (or
 	  NT37810) AMOLED DSI Video Mode LCD panel module with 1440x3200
-- 
2.39.5

