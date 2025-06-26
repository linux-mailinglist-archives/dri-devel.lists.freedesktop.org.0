Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A632AAEA6F7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 21:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A5B10E907;
	Thu, 26 Jun 2025 19:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Lb3j0kGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53110E907
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 19:41:07 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 5FBE225AFA;
 Thu, 26 Jun 2025 21:41:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFCUli431S5E; Thu, 26 Jun 2025 21:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750966865; bh=u2gNoGL1EkUKTCKTqebfk2oKp+u2JbaoBZpY/Rvkb4g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=Lb3j0kGrriHaoBpC4hGLaDqjZ0kTOQ4BM2YaozjNb+EISLlOKii0na8hdm/PImaRT
 FvrKztzM616N13kJN19V3aXYIKhLwsFc4mra8+0aD0cAD4N5VlTOVF5D+Yvs90Pt4u
 xTjFPv72FZxuXp4SrsLqvm0h19IaSYYu+fh8Xj49E6wM8lDEWqQCVD7a9Vik2cP7xT
 LktAuxOZOCYDWRLrQHR0p1CiY42rxBOSEYT48wEWqtYotsbi3PVLJ+c4fB8rzCXQ7l
 y/3l9FkMlr6xPyvIMMA2X3+Zhs+TGy7A48vWNtHA9J2KNFoqopyEDvR2S/avRiC4TS
 MJxt7zPuZJoMA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:58 +0530
Subject: [PATCH v2 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-9-1433b67378d3@disroot.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=926;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=u2gNoGL1EkUKTCKTqebfk2oKp+u2JbaoBZpY/Rvkb4g=;
 b=tuIO+GEyrWvCTjkPRhokjgmcnFCs1r/Ux62zw0hOtqO2IHMl5Gi3MccQ0YL91PrCUp0knSDAm
 b7R0B69o9RuDa3Cg6gLlmbOqv+gApGtxia1YDbaGcYIyV+xmJKhMGEB
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
index 739e1d1e6d239d06896daa131b692309cfeda843..5b96a5a1c78d212aca4e4fb057952927eb90f0d4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -752,7 +752,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 1000;
+	timeout = 3000;
 	do {
 		if (timeout-- == 0) {
 			dev_err(dsi->dev, "PLL failed to stabilize\n");

-- 
2.49.0

