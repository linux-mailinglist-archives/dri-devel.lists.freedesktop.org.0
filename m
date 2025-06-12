Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CAFAD75A8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E9310E8A8;
	Thu, 12 Jun 2025 15:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="I7aIZh6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1B610E8A0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:19:55 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id B246825FB3;
 Thu, 12 Jun 2025 17:19:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9C6iqa3FDfA; Thu, 12 Jun 2025 17:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749741594; bh=cbcjcKOlSDiXuN1ZryxTPjxHoMCH5EADuQCdyG2cINs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=I7aIZh6Ln545sq0unm1sphOQFrhraXVVGY0qJ9f1qHb6rgkTD1MKaaPDlrOh76eXy
 3arDXBu/Y/9SmV6QiK/P4JbHat4qGTvxLNMN6+gmj7iJDtl5qrh/WK+BRwgUwddmE9
 UX3CZoiw1fGKKxyWj+S90qOOCZOekNJg/tpmYOwgGOe9jQznHGRubUmziPLU6CtYZD
 SCn3EzGATpmgQOvUt4adeYZM2Rtv+DGo0hc76JhoFMZRPwLQytUIji9IBKeJYlQ8Ck
 7zhCHZoXEjsPBoNatdNOANAFsrrZhdja3EYKBx/zP4EW/vefEPFu9MmIxlSz+57icy
 WY46IgqVm+tAQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:13 +0530
Subject: [PATCH 09/12] drm/bridge: samsung-dsim: increase timeout value for
 PLL_STABLE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-9-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=926;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=cbcjcKOlSDiXuN1ZryxTPjxHoMCH5EADuQCdyG2cINs=;
 b=tiIUwQi6DLbTe77YgBJLRkD2Oe6Q6xWPTXRYMY/gZ9JE/8+RjbNwurwr9+FECVQNxZx9ijXlo
 38E3959WWPgDBF5hnJ1jpi9uvHuZh8mqko4a4TTPwBQdpQsDGOOkqyZ
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

Exynos7870's DSIM requires more time to stabilize its PLL. The current
timeout value, 1000, doesn't suffice. Increase the value to 3000, which
is just about enough as observed experimentally.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5787746c63035a94c0b8b7497df61bb1e69656cd..50dcdb9b81f68098936fbb3f121a0010b11cd8dd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -751,7 +751,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 1000;
+	timeout = 3000;
 	do {
 		if (timeout-- == 0) {
 			dev_err(dsi->dev, "PLL failed to stabilize\n");

-- 
2.49.0

