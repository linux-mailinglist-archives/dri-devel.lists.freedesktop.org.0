Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66CDAD75B5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396CF10E8B3;
	Thu, 12 Jun 2025 15:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="kFFFIFT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D55D10E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:20:25 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 324B22609A;
 Thu, 12 Jun 2025 17:20:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPNr3ZLvaQWh; Thu, 12 Jun 2025 17:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749741622; bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=kFFFIFT0+KQGlDZejDKTYu8pW3aBpvHIFYD3tycWyjxc2ZRDJADepxWPL/soNwGtF
 YTIBgsTn3YHbaEU+Ld+MPx0R4YMy3PH6Oz1fbyHDI+Qi5hp62cL7FQTxkPa1cZZHjl
 TjrLpM+bnVO8ib6iKBvYZjNRaXmFdwB7ocMvIw7Yi3bEePdtYhN4HGFmu9YVCWKUdm
 srZsPbe1hQRI3TncwrLTLbyaXiDnprEUsJoLVA+rWz73zR/tLAoj1ftlVCt7XHqttM
 21ACTYm34CF5ilIasRLvJlMAn0mGaNZRaonpwcQdysr29jG7YMY3ZFdci/RFIG0/AB
 L3AL9XThmSkOQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:16 +0530
Subject: [PATCH 12/12] drm/exynos: dsi: add support for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-12-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=1284;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=l4Nuu5usU3hvRSdSwV3bQf/gyHyhMjDbMhpD0WU6O88=;
 b=lQbb3yX2weNNjAz5shqRd54kvetuaJZEBMG9UE72Vk906suF41Yeq3NuuzkpDG0MGcm2nHTu5
 IA3fIU8kjM8C4lj/pkCLcMAqHYPccUrTi1UHBh/kqOgTtmjZu0+Y0If
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

Add glue layer support for Exynos7870's DSIM IP bridge driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 896a03639e2d9b80971d43aff540fc7fb9f005bd..c4d098ab7863890b2111742c07953c148304e4ec 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -154,6 +154,11 @@ static const struct samsung_dsim_plat_data exynos5433_dsi_pdata = {
 	.host_ops = &exynos_dsi_exynos_host_ops,
 };
 
+static const struct samsung_dsim_plat_data exynos7870_dsi_pdata = {
+	.hw_type = DSIM_TYPE_EXYNOS7870,
+	.host_ops = &exynos_dsi_exynos_host_ops,
+};
+
 static const struct of_device_id exynos_dsi_of_match[] = {
 	{
 		.compatible = "samsung,exynos3250-mipi-dsi",
@@ -175,6 +180,10 @@ static const struct of_device_id exynos_dsi_of_match[] = {
 		.compatible = "samsung,exynos5433-mipi-dsi",
 		.data = &exynos5433_dsi_pdata,
 	},
+	{
+		.compatible = "samsung,exynos7870-mipi-dsi",
+		.data = &exynos7870_dsi_pdata,
+	},
 	{ /* sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);

-- 
2.49.0

