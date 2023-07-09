Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F9D74C46D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 15:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBFB10E07A;
	Sun,  9 Jul 2023 13:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B6E10E07A
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 13:48:48 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E70FA8063E;
 Sun,  9 Jul 2023 15:48:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688910523;
 bh=84zqahmb0soDnYVEZxZIDhPD2qRfzeWd/NYFawAGuc0=;
 h=From:To:Cc:Subject:Date:From;
 b=thL4ajeSkexw0eSJhm/MdtDZ0vsQUFoTbncuNDZg9oSKNKoRQFZoYXdxxOXvM4uKY
 EiON7+9wK6yG/CUyxpvnEBlimNRd4tutW/pGUTjhbot0LZ6STSsmTVIHDJGSj+Xa1u
 n9l5jDhpAl5/giAgiTdqdx9aMHG4Y9882Q7hIkEDsG6cYNVghU7mqW0ydpGZgXUQza
 C+c3hCUIwMr8yq2TghrhcP7rppwxb2rngRmYEPmRHGg3+2vchYwTe8AwNkVigZs86o
 WsDMEns9KzTnvF/nWO3MLxjUn8TXE17VmXug8iyTq35Xkjun+x42EyYeqTty3OMG6G
 kajAm0R5WWpmQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: samsung-dsim: Initialize ULPS EXIT for i.MX8M
 DSIM
Date: Sun,  9 Jul 2023 15:48:27 +0200
Message-Id: <20230709134827.449185-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ULPS EXIT is initialized to 0xaf in downstream BSP as well as older
revisions of this patchset, in newer revisions of the DSIM patchset it
was left out and set to 0. Fix it.

Fixes: 4d562c70c4dc ("drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9b7a00bafeaaa..7d8afbcf56ca4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -384,7 +384,7 @@ static const unsigned int imx8mm_dsim_reg_values[] = {
 	[RESET_TYPE] = DSIM_SWRST,
 	[PLL_TIMER] = 500,
 	[STOP_STATE_CNT] = 0xf,
-	[PHYCTRL_ULPS_EXIT] = 0,
+	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0xaf),
 	[PHYCTRL_VREG_LP] = 0,
 	[PHYCTRL_SLEW_UP] = 0,
 	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x06),
-- 
2.40.1

